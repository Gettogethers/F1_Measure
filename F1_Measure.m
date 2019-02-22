function F1_Measure = F1_Measure( PredictOutputLable, TureLable )
% % % % % % % % %F1_Measure   F-Measure是Precision和Recall加权调和平均
% Introduction: Input: PredictOutputLable 分类器的预测标签
%                      TureLable 待测样本的真实标签
%               Output：F1_Measure F1较高时则能说明试验方法比较有效
% Write Time ： 18/9/28
% 
% 
% 
% ****************************************************************
%[TureLabelRow, ~] = size(TureLabel);
PostiveIndex = find(TureLable == 1);
NegativeIndex = find(TureLable == 0);

PostiveNum = find(TureLable == 1);
NegativeNum = find(TureLable == 0);

TurePostive = find(TureLable(PostiveIndex, :) == PredictOutputLable(PostiveIndex, :));
TurePostiveNum = size(TurePostive, 1);%TP
FalseNegativeNum = PostiveNum - TurePostiveNum;%FN

TureNegative = find(TureLable(NegativeIndex, :) == PredictOutputLable(NegativeIndex, :));
TureNegativeNum = size(TureNegative, 1);%TN
FalsePostiveNum = NegativeNum - TureNegativeNum;%FP

Precision = TurePostiveNum/(TurePostiveNum + FalsePostiveNum);
Recall = TurePostiveNum/(TurePostiveNum + FalseNegativeNum);

F1_Measure = 2 * Precision * Recall/(Precision  + Recall);
end


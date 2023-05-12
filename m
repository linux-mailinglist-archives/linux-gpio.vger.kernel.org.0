Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A250700748
	for <lists+linux-gpio@lfdr.de>; Fri, 12 May 2023 13:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240627AbjELL4K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 May 2023 07:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240622AbjELL4J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 May 2023 07:56:09 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD69DDA4;
        Fri, 12 May 2023 04:56:07 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34CBTUSs015701;
        Fri, 12 May 2023 11:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=yHlQfXiN3GaouJUmrChLI34lMMNZ0SrIvYTSsJEJWCg=;
 b=YEyQPtQkT5L68mRZZpEa5a1OVekU3muTrwdcHM5Q6tUo62cwTrtpmzVUUVyCiUwEsv7Y
 V/gU5P4pGuGn3JZU0ChYULx6uCbN8dBG6dVgCf/xQ4NkB2BMfdXXaPOv2kl33d/aEXSU
 ucKbp75tiakDbPyL0DoioBoGqCEwVRvlFCdspPMlY6NaINu3VY9zPH7zPi03GWvALHba
 1TRjueLxtefcpLnYFpayVWDU7nJv5NufERGlIuDn24rEFHC4AJyBF7b5XQYuF6y7e1C6
 AY3nNJG5YPdJ/ACJNmiiVFkFxwNtNss5L0QERz3ZSTpSG3v1+QZ5YFqjrDmO6uZRPPKZ RQ== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhfww0n4v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 May 2023 11:56:03 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34CBtwjG003719;
        Fri, 12 May 2023 11:55:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3qdy59txbg-1;
        Fri, 12 May 2023 11:55:58 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34CBtwPr003707;
        Fri, 12 May 2023 11:55:58 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-rohiagar-hyd.qualcomm.com [10.213.106.138])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 34CBtwvO003705;
        Fri, 12 May 2023 11:55:58 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 3970568)
        id 6240E50CE; Fri, 12 May 2023 17:25:57 +0530 (+0530)
From:   Rohit Agarwal <quic_rohiagar@quicinc.com>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, richardcochran@gmail.com,
        manivannan.sadhasivam@linaro.org, andy.shevchenko@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Rohit Agarwal <quic_rohiagar@quicinc.com>
Subject: [PATCH 0/2] Refactor the pinctrl driver
Date:   Fri, 12 May 2023 17:25:51 +0530
Message-Id: <1683892553-19882-1-git-send-email-quic_rohiagar@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r9OpPr1f_dNF66iKj91ksu7Lb7GFA0GO
X-Proofpoint-GUID: r9OpPr1f_dNF66iKj91ksu7Lb7GFA0GO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=417 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120099
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

This series refactor the target specific pinctrl driver for qcom
by reusing the generic pinfunction struct, pingroup struct and the defined
macros to avoid code repetition.
The series is rebased on linux-next and based on all the review and
comments from different versions of [1].

[1] https://lore.kernel.org/linux-arm-msm/1681966915-15720-1-git-send-email-quic_rohiagar@quicinc.com/

Thanks,
Rohit.

Rohit Agarwal (2):
  pinctrl: qcom: Remove the msm_function struct
  pinctrl: qcom: Refactor generic qcom pinctrl driver

 drivers/pinctrl/qcom/pinctrl-apq8064.c  | 104 +++---
 drivers/pinctrl/qcom/pinctrl-apq8084.c  | 264 ++++++++-------
 drivers/pinctrl/qcom/pinctrl-ipq4019.c  | 104 +++---
 drivers/pinctrl/qcom/pinctrl-ipq5332.c  | 206 ++++++------
 drivers/pinctrl/qcom/pinctrl-ipq6018.c  | 260 +++++++--------
 drivers/pinctrl/qcom/pinctrl-ipq8064.c  | 114 +++----
 drivers/pinctrl/qcom/pinctrl-ipq8074.c  | 240 +++++++-------
 drivers/pinctrl/qcom/pinctrl-ipq9574.c  | 176 +++++-----
 drivers/pinctrl/qcom/pinctrl-mdm9607.c  | 276 ++++++++--------
 drivers/pinctrl/qcom/pinctrl-mdm9615.c  |  90 +++--
 drivers/pinctrl/qcom/pinctrl-msm.c      |  13 +-
 drivers/pinctrl/qcom/pinctrl-msm.h      |  42 ++-
 drivers/pinctrl/qcom/pinctrl-msm8226.c  | 156 +++++----
 drivers/pinctrl/qcom/pinctrl-msm8660.c  | 252 +++++++-------
 drivers/pinctrl/qcom/pinctrl-msm8909.c  | 268 ++++++++-------
 drivers/pinctrl/qcom/pinctrl-msm8916.c  | 556 ++++++++++++++++---------------
 drivers/pinctrl/qcom/pinctrl-msm8953.c  | 424 ++++++++++++------------
 drivers/pinctrl/qcom/pinctrl-msm8960.c  | 464 +++++++++++++-------------
 drivers/pinctrl/qcom/pinctrl-msm8976.c  | 212 ++++++------
 drivers/pinctrl/qcom/pinctrl-msm8994.c  | 564 ++++++++++++++++----------------
 drivers/pinctrl/qcom/pinctrl-msm8996.c  | 508 ++++++++++++++--------------
 drivers/pinctrl/qcom/pinctrl-msm8998.c  | 380 +++++++++++----------
 drivers/pinctrl/qcom/pinctrl-msm8x74.c  | 474 +++++++++++++--------------
 drivers/pinctrl/qcom/pinctrl-qcm2290.c  | 230 +++++++------
 drivers/pinctrl/qcom/pinctrl-qcs404.c   | 388 +++++++++++-----------
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c  |   6 +-
 drivers/pinctrl/qcom/pinctrl-qdu1000.c  | 249 +++++++-------
 drivers/pinctrl/qcom/pinctrl-sa8775p.c  | 308 +++++++++--------
 drivers/pinctrl/qcom/pinctrl-sc7180.c   | 254 +++++++-------
 drivers/pinctrl/qcom/pinctrl-sc7280.c   | 322 +++++++++---------
 drivers/pinctrl/qcom/pinctrl-sc8180x.c  | 286 ++++++++--------
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c | 358 ++++++++++----------
 drivers/pinctrl/qcom/pinctrl-sdm660.c   | 387 +++++++++++-----------
 drivers/pinctrl/qcom/pinctrl-sdm670.c   | 284 ++++++++--------
 drivers/pinctrl/qcom/pinctrl-sdm845.c   | 286 ++++++++--------
 drivers/pinctrl/qcom/pinctrl-sdx55.c    | 190 ++++++-----
 drivers/pinctrl/qcom/pinctrl-sdx65.c    | 194 ++++++-----
 drivers/pinctrl/qcom/pinctrl-sm6115.c   | 162 +++++----
 drivers/pinctrl/qcom/pinctrl-sm6125.c   | 282 ++++++++--------
 drivers/pinctrl/qcom/pinctrl-sm6350.c   | 296 ++++++++---------
 drivers/pinctrl/qcom/pinctrl-sm6375.c   | 358 ++++++++++----------
 drivers/pinctrl/qcom/pinctrl-sm8150.c   | 286 ++++++++--------
 drivers/pinctrl/qcom/pinctrl-sm8250.c   | 258 +++++++--------
 drivers/pinctrl/qcom/pinctrl-sm8350.c   | 298 ++++++++---------
 drivers/pinctrl/qcom/pinctrl-sm8450.c   | 300 +++++++++--------
 drivers/pinctrl/qcom/pinctrl-sm8550.c   | 320 +++++++++---------
 46 files changed, 6055 insertions(+), 6394 deletions(-)

-- 
2.7.4


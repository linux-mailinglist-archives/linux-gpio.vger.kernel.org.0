Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDFD7756D8
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Aug 2023 12:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbjHIKKG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Aug 2023 06:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbjHIKJ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Aug 2023 06:09:58 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2DAD1FDE;
        Wed,  9 Aug 2023 03:09:53 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3799186D014764;
        Wed, 9 Aug 2023 10:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=z2yF02mLh9q+VU+iy3eExmyCmx1czwO7eMFUd2ucPDc=;
 b=pQY++tQqDSjwRSA1Dcvu16qHKqpHLNdm8dqQPcf4mwhyZzpmYW9Z5S0aBQixE8ksMMGo
 DCuAkvgdhGGwLBA9+MP2UdtLXPDRx+PhudHuoGBkC8f6GQg2Gv8cWADaolqL+J6Ez8l7
 ZpeYNHEFDKmweVSOUqiBAkzIIYuklRLsf8T+hTTYdx+hSLHL0/4rBhVmDT8dGvOWhkQp
 iNITjczSI5TCsiyH+yv/Io3RXOSswbRqjsxlV5tf8Fid9ELh5WGuOIYAyQqd/LcnmPrM
 KGkSbhCx8WWwIPMwOz9AVD9olCgon1YZAufGMtuRRaDZI7dn4O6prd+GJE+4NDspyj1d DQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sc1ny0w89-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Aug 2023 10:09:46 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 379A9jfF023941
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 9 Aug 2023 10:09:45 GMT
Received: from hu-ninanaik-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 9 Aug 2023 03:09:40 -0700
From:   Ninad Naik <quic_ninanaik@quicinc.com>
To:     <andersson@kernel.org>, <agross@kernel.org>,
        <konrad.dybcio@linaro.org>, <linus.walleij@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_ymg@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <quic_psodagud@quicinc.com>,
        <quic_ppareek@quicinc.com>, <quic_kprasan@quicinc.com>,
        Ninad Naik <quic_ninanaik@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        "Bjorn Andersson" <quic_bjorande@quicinc.com>
Subject: [PATCH v3] pinctrl: qcom: Add intr_target_width field to support increased number of interrupt targets
Date:   Wed, 9 Aug 2023 15:36:34 +0530
Message-ID: <20230809100634.3961-1-quic_ninanaik@quicinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JHSLxRF8f_EOr22amsYPpI_7O8mx1IM1
X-Proofpoint-ORIG-GUID: JHSLxRF8f_EOr22amsYPpI_7O8mx1IM1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_09,2023-08-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308090089
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SA8775 and newer target have added support for an increased number of
interrupt targets. To implement this change, the intr_target field, which
is used to configure the interrupt target in the interrupt configuration
register is increased from 3 bits to 4 bits.

In accordance to these updates, a new intr_target_width member is
introduced in msm_pingroup structure. This member stores the value of
width of intr_target field in the interrupt configuration register. This
value is used to dynamically calculate and generate mask for setting the
intr_target field. By default, this mask is set to 3 bit wide, to ensure
backward compatibility with the older targets.

Fixes: 4b6b18559927 ("pinctrl: qcom: add the tlmm driver sa8775p platforms")

Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride
Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
Changes in v3 :
- Resend, by adding correct maintainers missed in v2.
- v2 : https://lore.kernel.org/all/20230718064246.12429-1-quic_ninanaik@quicinc.com/ 

Changes in v2 :
- Changed initial definition of intr_target_mask variable to use GENMASK().
- Update commit subject appropiately.
- Add Fixes tag.
- v1 : https://lore.kernel.org/all/20230714061010.15817-1-quic_ninanaik@quicinc.com/

 drivers/pinctrl/qcom/pinctrl-msm.c     | 9 ++++++---
 drivers/pinctrl/qcom/pinctrl-msm.h     | 2 ++
 drivers/pinctrl/qcom/pinctrl-sa8775p.c | 1 +
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 2585ef2b2793..115b83e2d8e6 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1038,6 +1038,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct msm_pingroup *g;
+	u32 intr_target_mask = GENMASK(2, 0);
 	unsigned long flags;
 	bool was_enabled;
 	u32 val;
@@ -1074,13 +1075,15 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	 * With intr_target_use_scm interrupts are routed to
 	 * application cpu using scm calls.
 	 */
+	if (g->intr_target_width)
+		intr_target_mask = GENMASK(g->intr_target_width - 1, 0);
+
 	if (pctrl->intr_target_use_scm) {
 		u32 addr = pctrl->phys_base[0] + g->intr_target_reg;
 		int ret;
 
 		qcom_scm_io_readl(addr, &val);
-
-		val &= ~(7 << g->intr_target_bit);
+		val &= ~(intr_target_mask << g->intr_target_bit);
 		val |= g->intr_target_kpss_val << g->intr_target_bit;
 
 		ret = qcom_scm_io_writel(addr, val);
@@ -1090,7 +1093,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 				d->hwirq);
 	} else {
 		val = msm_readl_intr_target(pctrl, g);
-		val &= ~(7 << g->intr_target_bit);
+		val &= ~(intr_target_mask << g->intr_target_bit);
 		val |= g->intr_target_kpss_val << g->intr_target_bit;
 		msm_writel_intr_target(val, pctrl, g);
 	}
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 5e4410bed823..1d2f2e904da1 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -59,6 +59,7 @@ struct pinctrl_pin_desc;
  * @intr_status_bit:      Offset in @intr_status_reg for reading and acking the interrupt
  *                        status.
  * @intr_target_bit:      Offset in @intr_target_reg for configuring the interrupt routing.
+ * @intr_target_width:    Number of bits used for specifying interrupt routing target.
  * @intr_target_kpss_val: Value in @intr_target_bit for specifying that the interrupt from
  *                        this gpio should get routed to the KPSS processor.
  * @intr_raw_status_bit:  Offset in @intr_cfg_reg for the raw status bit.
@@ -100,6 +101,7 @@ struct msm_pingroup {
 	unsigned intr_ack_high:1;
 
 	unsigned intr_target_bit:5;
+	unsigned intr_target_width:5;
 	unsigned intr_target_kpss_val:5;
 	unsigned intr_raw_status_bit:5;
 	unsigned intr_polarity_bit:5;
diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 8a5cd15512b9..8fdea25d8d67 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -46,6 +46,7 @@
 		.intr_enable_bit = 0,		\
 		.intr_status_bit = 0,		\
 		.intr_target_bit = 5,		\
+		.intr_target_width = 4,		\
 		.intr_target_kpss_val = 3,	\
 		.intr_raw_status_bit = 4,	\
 		.intr_polarity_bit = 1,		\
-- 
2.41.0


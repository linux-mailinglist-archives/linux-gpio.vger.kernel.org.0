Return-Path: <linux-gpio+bounces-37568-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA66LTO4FmqLqAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37568-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 11:24:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BC65E1BE8
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 11:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 625AE3006015
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FA73EC2C4;
	Wed, 27 May 2026 09:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULqD3VQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YR8K1ZTZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5134523AB88
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873817; cv=none; b=bpaMoFIFdXapuXZTXG1NPLo8iILLyj2p3hsix95b9PEqBKhyFN6qqLeopjcxHBr4hbdiuZ/DWQZPB0v51u+WMum0weut4u/DuyF2edWqRixE5ZzblzP9CNp7cwlb1FPrAMUEtJDnwB45qHvWPmkyOuTeFCAjZEygIcLGjBsLWnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873817; c=relaxed/simple;
	bh=gSdLgqSkpOoecfv/3VBJHW/YQFShiUNpAWkMPY6bhI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUCVIOK2cBNgBwqz4xmINg8X4hgvcDTjn88h/SIPZYstsFa1XR4e4D5Yf2tLIC5xMocIYMPoXAda0XWsPftyAnNR84dv0ayw7Nn0x53F+Zytm1HM8De/mwEvFP0VJkDp0WMQlkY3G5UO/y+p9lH3em4WU3lCm3oCUSkxs5R54K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULqD3VQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YR8K1ZTZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mZvi051293
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 09:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kf2yRmT+Apw2wjvS6hL1oN8FcR4BN6jTzUh686bjw/g=; b=ULqD3VQj2RF+s/j2
	BDUiyWtrXt/lpzSDXxI/RBrhpdeJGCgSnKw2sSC8hAi/cr5JclyDEWAlV/pbAu9j
	mWXDF5tCQdM5/ob/FkwPfzN0oRh3KC/Rug9ANw/gg995V2fLS5EVzhWS5I+mtbOe
	t4V5VoTf3Kj02N/S31xUJWJNMoAYieRzeHRM+lYhzzjcai7UgLqh7lWHzMtO/iek
	oIyZwhv7PSSbW2R3kHjJOtPla56Xdw36UI3ltRHkKEi1b0XcOIUuKpCZFt26moVs
	3ItjXxdAEOMCb/Duj/c9gnA2k1oQiDl8uynl0upv37nuKUN2m6AenJNNBlPSrSS0
	91ScVg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edg5paux0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 09:23:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f3eb8f3419so6769112eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 02:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779873808; x=1780478608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kf2yRmT+Apw2wjvS6hL1oN8FcR4BN6jTzUh686bjw/g=;
        b=YR8K1ZTZsK0TT6FoPLPX567zu45VGywj3nE/0FjCRiV16cF5hxtcwoAZSCkfbbLo1U
         nV+o1EF5Yuiuhls35qvRLNe42HOsslbT3H2WGdHFMxIHjj/FRQP85oT1gFc8ltFO7Swa
         RNhgX9mkoaHtcvOmFVcMTOXyRG86xzvsj2aVJcV7pC5QrH2AfoLuClrlpaWdhspuJgCS
         f+JcgyDg0u0hedxqETHx1l1+retPNteu3rTLGMILzpd11Ouafpo9e9JC8TxfIfp+5GoZ
         8Vx7ZaNFsWpY8qmWNzn2ieCKbROk+anp2+JuM1VPosER9Avks6XDDV80qrABYKKmTHmL
         JjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779873808; x=1780478608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kf2yRmT+Apw2wjvS6hL1oN8FcR4BN6jTzUh686bjw/g=;
        b=F12HL6TyuKFAu76szR1SCMnbJ/JjaoHdBw0JGEB/+BR3eql3zhvh/DO4wD1Nybctfr
         wEDjpM1PPkN//ROxXeHmIUxYpVMM3cWNAxXdFPVGqHiFJkyKWaP7Uct685UMRtpV0ymo
         402Uw6g7PolgU5C6IEq+EPyoP1VONUw/emAVpRZ9hYSmWFyk229XC2RX4O7rnyuSjstf
         8Lsw4udKF88qOqnRoxTisWM7K6CZdsaNMCa8LFQ9brPPedKD8vrL0X1305XecjSyRrv+
         Z3mjUle3f9PO+hzUo1xlbQEtogzOK63svbcx52kcIydDiTIqJuOirPnQz+XXxjiFkcju
         bKpg==
X-Forwarded-Encrypted: i=1; AFNElJ+COH6+OdRczlemFym6ZdEQlIWawGC7+zy5YUWy6gz0JRS3ppPGcJMq3xPkEkZQTqqh06zEtFIXWl1U@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0fDuT+xUDjHjFjVmj85Tei9vO6shFsyZrFmkshW5MJSOLbbfH
	qVB3PhFnd89eKsvJLsfWj48Nxb3ct4uprSOFy8GgTEPSZQhUg5a07WSkdLtZAYgFCvWhElfEBwD
	TaEyR9TRC0W6KIdk3weRiMItf14OM3qkxiSibjK91TsKNZNLrDzJ1Ne96qPrTRy0D
X-Gm-Gg: Acq92OEtiCf6DHRcFJ7LZsCSvdiv2Wz741LKIdGH14QV9UqZxLx6sB0QfMORbY3Y8OE
	nnwUWqwPbXv79Dm50JlKp8cdkdtysgzD4/p7i/6VxURq0SqSo76SM9c7k0YruWZT1h5sToAXdX+
	ksR8AcZwo9r1zyfhD5/P/vgdGSqLbn79ESF9hJECdamWjh5DvOuW6ghQ/aarcw7i0XR68N58itf
	kAog8NYSYgJyVUuFfCxywMYdhqwXmicCbjOh19fD6cDfrWJ48TAau5D15IRVhL5z0kRwAM+GrGa
	DPT+MLEPA0qcPw4eKluVigSSauYGmsCiI7XqmVRSH4gM+mZrVMO2DzoClQ5Y0m9S3BtyQLz9Hz5
	t2OAPv2FkuJmx8sd69NFcCwJRalUf+fwmdyWbEjhKnQQSyruHT/VkGYReJ0Tx2/O+94kTYC22OQ
	==
X-Received: by 2002:a05:7300:b507:b0:2ed:e15:c927 with SMTP id 5a478bee46e88-304491471cemr11088581eec.35.1779873808204;
        Wed, 27 May 2026 02:23:28 -0700 (PDT)
X-Received: by 2002:a05:7300:b507:b0:2ed:e15:c927 with SMTP id 5a478bee46e88-304491471cemr11088547eec.35.1779873807558;
        Wed, 27 May 2026 02:23:27 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef4afdsm12598732eec.5.2026.05.27.02.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:23:26 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 27 May 2026 02:22:46 -0700
Subject: [PATCH 3/4] pinctrl: qcom: spmi-gpio: Rearchitect for flexible
 group support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-pinctrl-level-shifter-v1-3-1965461d0a7c@oss.qualcomm.com>
References: <20260527-pinctrl-level-shifter-v1-0-1965461d0a7c@oss.qualcomm.com>
In-Reply-To: <20260527-pinctrl-level-shifter-v1-0-1965461d0a7c@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779873802; l=16625;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=gSdLgqSkpOoecfv/3VBJHW/YQFShiUNpAWkMPY6bhI4=;
 b=7JOHHPfi6jMOMs8bMzQP2SOqUYy3lXw91cMQJbp1kIDJEnk84nUHPRl0CzgWKRUYbL1dMHFaH
 e68nn7RBCrCC2qg1cXcvEHx+QwDGgyIRunsdky0/Fr+zkuq+A1Fy4U5
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: ZZZH9wLYU5ySPRmsO2rz_3GqqPKVkewC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MCBTYWx0ZWRfX9BCYZEWd6IMo
 eKFw32B4d6QRJpXYEbGjwxRn+wRSXj3qaWBoVLbt5QmKdCbMWh2HrvO86PNcnslUCSJQrgqy11J
 6t0FB/CEbUpSfdg8RMna/tOSBe7z4pbk/8VoF7d+sjJK0F89qjEGuQnHm0L035dLbHRy+IjQ8Kv
 fSgK0TNsl2mmCO2i4iOoKxU/BrMg6kGv1p+0Jf5Pm1XnWZMbWvpzvHNEw2Oi07ILCRRBjH7dRlE
 HDBVYY1oLom0GNyDiP2uAmAdPyGD20xW3FIIi7TXEhezAvb3uiXeFK3ned/OD68xXjUhhSl6n/a
 VAUaqYtYfAwt7eAa/wNoLHxZdYZFQZdpGrCM4yyXcy0+3YA1QwLAknttWo76GBRl6x+vi9OiOqO
 TnDrGl0wiEr2q8uM/RDzjxCg9IA0n/UhkJVMoDVuTJ2lvzoFdVBVgqDYAkIHVOXI0K/hvhJQMLU
 ViQOc8XGwjJAdOHmW0A==
X-Authority-Analysis: v=2.4 cv=I95Vgtgg c=1 sm=1 tr=0 ts=6a16b811 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OvJITaBzo-gp9VRKLXEA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: ZZZH9wLYU5ySPRmsO2rz_3GqqPKVkewC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-37568-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B5BC65E1BE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, the driver treats each pin as a group, and every pin or
group can function correctly in all existing functions. However,
this approach is no longer valid since some PMIC pins only operate
together in specific functions, which are limited to certain GPIO
groups. For example, in pmh0101, the level-shifter function is
supported only between GPIO pairs like GPIO11/12, GPIO13/14,
GPIO15/16, and GPIO17/18.

To better accommodate these new functions and restrict GPIOs to
those that support them, rearchitect the driver to enable flexible
pinctrl group configurations by utilizing the generic pinctrl group
and function APIs.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 367 +++++++++++++++++++++----------
 1 file changed, 249 insertions(+), 118 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index cdd61dae74cf..f159c56784b4 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -24,6 +24,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "../core.h"
+#include "../pinmux.h"
 #include "../pinctrl-utils.h"
 
 #define PMIC_GPIO_ADDRESS_RANGE			0x100
@@ -253,139 +254,124 @@ static int pmic_gpio_write(struct pmic_gpio_state *state,
 	return ret;
 }
 
-static int pmic_gpio_get_groups_count(struct pinctrl_dev *pctldev)
-{
-	/* Every PIN is a group */
-	return pctldev->desc->npins;
-}
-
-static const char *pmic_gpio_get_group_name(struct pinctrl_dev *pctldev,
-					    unsigned pin)
-{
-	return pctldev->desc->pins[pin].name;
-}
-
-static int pmic_gpio_get_group_pins(struct pinctrl_dev *pctldev, unsigned pin,
-				    const unsigned **pins, unsigned *num_pins)
-{
-	*pins = &pctldev->desc->pins[pin].number;
-	*num_pins = 1;
-	return 0;
-}
-
 static const struct pinctrl_ops pmic_gpio_pinctrl_ops = {
-	.get_groups_count	= pmic_gpio_get_groups_count,
-	.get_group_name		= pmic_gpio_get_group_name,
-	.get_group_pins		= pmic_gpio_get_group_pins,
+	.get_groups_count	= pinctrl_generic_get_group_count,
+	.get_group_name		= pinctrl_generic_get_group_name,
+	.get_group_pins		= pinctrl_generic_get_group_pins,
 	.dt_node_to_map		= pinconf_generic_dt_node_to_map_group,
 	.dt_free_map		= pinctrl_utils_free_map,
 };
 
-static int pmic_gpio_get_functions_count(struct pinctrl_dev *pctldev)
-{
-	return ARRAY_SIZE(pmic_gpio_functions);
-}
-
-static const char *pmic_gpio_get_function_name(struct pinctrl_dev *pctldev,
-					       unsigned function)
-{
-	return pmic_gpio_functions[function];
-}
-
-static int pmic_gpio_get_function_groups(struct pinctrl_dev *pctldev,
-					 unsigned function,
-					 const char *const **groups,
-					 unsigned *const num_qgroups)
-{
-	*groups = pmic_gpio_groups;
-	*num_qgroups = pctldev->desc->npins;
-	return 0;
-}
-
-static int pmic_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned function,
-				unsigned pin)
+static int pmic_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
+				unsigned int selector)
 {
 	struct pmic_gpio_state *state = pinctrl_dev_get_drvdata(pctldev);
 	struct pmic_gpio_pad *pad;
-	unsigned int val;
-	int ret;
+	struct group_desc *group;
+	unsigned int val, pin, func;
+	int ret, i;
 
 	if (function > PMIC_GPIO_FUNC_INDEX_DTEST4) {
 		pr_err("function: %d is not defined\n", function);
 		return -EINVAL;
 	}
 
-	pad = pctldev->desc->pins[pin].drv_data;
-	/*
-	 * Non-LV/MV subtypes only support 2 special functions,
-	 * offsetting the dtestx function values by 2
-	 */
-	if (!pad->lv_mv_type) {
-		if (function == PMIC_GPIO_FUNC_INDEX_FUNC3 ||
-				function == PMIC_GPIO_FUNC_INDEX_FUNC4) {
-			pr_err("LV/MV subtype doesn't have func3/func4\n");
-			return -EINVAL;
+	group = pinctrl_generic_get_group(pctldev, selector);
+	if (!group)
+		return -EINVAL;
+
+	/* For standard functions, iterate over all pins in the group */
+	for (i = 0; i < group->grp.npins; i++) {
+		pin = group->grp.pins[i];
+		pad = pctldev->desc->pins[pin].drv_data;
+
+		func = function;
+		/*
+		 * Non-LV/MV subtypes only support 2 special functions,
+		 * offsetting the dtestx function values by 2
+		 */
+		if (!pad->lv_mv_type) {
+			if (func == PMIC_GPIO_FUNC_INDEX_FUNC3 ||
+					func == PMIC_GPIO_FUNC_INDEX_FUNC4) {
+				dev_err(state->dev,
+					"pin%d: LV/MV subtype doesn't have func3/func4\n",
+					pin);
+				return -EINVAL;
+			}
+			if (func >= PMIC_GPIO_FUNC_INDEX_DTEST1)
+				func -= (PMIC_GPIO_FUNC_INDEX_DTEST1 -
+						PMIC_GPIO_FUNC_INDEX_FUNC3);
 		}
-		if (function >= PMIC_GPIO_FUNC_INDEX_DTEST1)
-			function -= (PMIC_GPIO_FUNC_INDEX_DTEST1 -
-					PMIC_GPIO_FUNC_INDEX_FUNC3);
-	}
 
-	pad->function = function;
+		pad->function = func;
 
-	if (pad->analog_pass)
-		val = PMIC_GPIO_MODE_ANALOG_PASS_THRU;
-	else if (pad->output_enabled && pad->input_enabled)
-		val = PMIC_GPIO_MODE_DIGITAL_INPUT_OUTPUT;
-	else if (pad->output_enabled)
-		val = PMIC_GPIO_MODE_DIGITAL_OUTPUT;
-	else
-		val = PMIC_GPIO_MODE_DIGITAL_INPUT;
+		if (pad->analog_pass)
+			val = PMIC_GPIO_MODE_ANALOG_PASS_THRU;
+		else if (pad->output_enabled && pad->input_enabled)
+			val = PMIC_GPIO_MODE_DIGITAL_INPUT_OUTPUT;
+		else if (pad->output_enabled)
+			val = PMIC_GPIO_MODE_DIGITAL_OUTPUT;
+		else
+			val = PMIC_GPIO_MODE_DIGITAL_INPUT;
 
-	if (pad->lv_mv_type) {
-		ret = pmic_gpio_write(state, pad,
-				PMIC_GPIO_REG_MODE_CTL, val);
-		if (ret < 0)
-			return ret;
+		if (pad->lv_mv_type) {
+			ret = pmic_gpio_write(state, pad,
+					PMIC_GPIO_REG_MODE_CTL, val);
+			if (ret < 0)
+				return ret;
 
-		val = pad->atest - 1;
-		ret = pmic_gpio_write(state, pad,
-				PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL, val);
-		if (ret < 0)
-			return ret;
+			val = pad->atest - 1;
+			ret = pmic_gpio_write(state, pad,
+					PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL, val);
+			if (ret < 0)
+				return ret;
+
+			val = pad->out_value
+				<< PMIC_GPIO_LV_MV_OUTPUT_INVERT_SHIFT;
+			val |= pad->function
+				& PMIC_GPIO_LV_MV_OUTPUT_SOURCE_SEL_MASK;
+			ret = pmic_gpio_write(state, pad,
+				PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL, val);
+			if (ret < 0)
+				return ret;
+		} else {
+			val = val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
+			val |= pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
+			val |= pad->out_value & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
 
-		val = pad->out_value
-			<< PMIC_GPIO_LV_MV_OUTPUT_INVERT_SHIFT;
-		val |= pad->function
-			& PMIC_GPIO_LV_MV_OUTPUT_SOURCE_SEL_MASK;
-		ret = pmic_gpio_write(state, pad,
-			PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL, val);
-		if (ret < 0)
-			return ret;
-	} else {
-		val = val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
-		val |= pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
-		val |= pad->out_value & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
+			ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_MODE_CTL, val);
+			if (ret < 0)
+				return ret;
+		}
 
-		ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_MODE_CTL, val);
+		val = pad->is_enabled << PMIC_GPIO_REG_MASTER_EN_SHIFT;
+
+		ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_EN_CTL, val);
 		if (ret < 0)
 			return ret;
 	}
 
-	val = pad->is_enabled << PMIC_GPIO_REG_MASTER_EN_SHIFT;
-
-	return pmic_gpio_write(state, pad, PMIC_GPIO_REG_EN_CTL, val);
+	return 0;
 }
 
 static const struct pinmux_ops pmic_gpio_pinmux_ops = {
-	.get_functions_count	= pmic_gpio_get_functions_count,
-	.get_function_name	= pmic_gpio_get_function_name,
-	.get_function_groups	= pmic_gpio_get_function_groups,
+	.get_functions_count	= pinmux_generic_get_function_count,
+	.get_function_name	= pinmux_generic_get_function_name,
+	.get_function_groups	= pinmux_generic_get_function_groups,
 	.set_mux		= pmic_gpio_set_mux,
 };
 
-static int pmic_gpio_config_get(struct pinctrl_dev *pctldev,
-				unsigned int pin, unsigned long *config)
+/**
+ * pmic_gpio_pinconf_pin_get() - Get configuration for a single pin
+ * @pctldev: pinctrl device
+ * @pin: Pin number
+ * @config: Configuration parameter to get
+ *
+ * Core function to read a single pin's configuration.
+ * Used by both per-pin and per-group config get operations.
+ */
+static int pmic_gpio_pinconf_pin_get(struct pinctrl_dev *pctldev,
+				     unsigned int pin, unsigned long *config)
 {
 	unsigned param = pinconf_to_config_param(*config);
 	struct pmic_gpio_pad *pad;
@@ -476,8 +462,48 @@ static int pmic_gpio_config_get(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
-				unsigned long *configs, unsigned nconfs)
+/**
+ * pmic_gpio_pinconf_group_get() - Get configuration for a pin group
+ * @pctldev: pinctrl device
+ * @selector: Group selector
+ * @config: Configuration parameter to get
+ *
+ * For multi-pin groups, we assume all pins have the same configuration,
+ * so we read the configuration from the first pin in the group.
+ */
+static int pmic_gpio_pinconf_group_get(struct pinctrl_dev *pctldev,
+				       unsigned int selector,
+				       unsigned long *config)
+{
+	const struct group_desc *group;
+	unsigned int pin;
+
+	group = pinctrl_generic_get_group(pctldev, selector);
+	if (!group)
+		return -EINVAL;
+
+	/*
+	 * For multi-pin groups, we assume all pins have the same configuration,
+	 * so we read the configuration from the first pin in the group.
+	 */
+	pin = group->grp.pins[0];
+
+	return pmic_gpio_pinconf_pin_get(pctldev, pin, config);
+}
+
+/**
+ * pmic_gpio_pinconf_pin_set() - Set configuration for a single pin
+ * @pctldev: pinctrl device
+ * @pin: Pin number
+ * @configs: Array of configuration parameters
+ * @nconfs: Number of configurations
+ *
+ * Core function to configure a single pin.
+ * Used by both per-pin and per-group config set operations.
+ */
+static int pmic_gpio_pinconf_pin_set(struct pinctrl_dev *pctldev,
+				     unsigned int pin,
+				     unsigned long *configs, unsigned int nconfs)
 {
 	struct pmic_gpio_state *state = pinctrl_dev_get_drvdata(pctldev);
 	struct pmic_gpio_pad *pad;
@@ -651,12 +677,58 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	val = pad->is_enabled << PMIC_GPIO_REG_MASTER_EN_SHIFT;
 
 	ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_EN_CTL, val);
+	if (ret < 0)
+		return ret;
 
-	return ret;
+	return 0;
+}
+
+/**
+ * pmic_gpio_pinconf_group_set() - Set configuration for a pin group
+ * @pctldev: pinctrl device
+ * @selector: Group selector
+ * @configs: Array of configuration parameters
+ * @nconfs: Number of configurations
+ *
+ * Iterates over all pins in the group and applies config to each.
+ */
+static int pmic_gpio_pinconf_group_set(struct pinctrl_dev *pctldev,
+				       unsigned int selector,
+				       unsigned long *configs,
+				       unsigned int nconfs)
+{
+	const struct group_desc *group;
+	unsigned int pin;
+	int i, ret;
+
+	group = pinctrl_generic_get_group(pctldev, selector);
+	if (!group)
+		return -EINVAL;
+
+	/* Iterate over all pins in the group and apply config to each */
+	for (i = 0; i < group->grp.npins; i++) {
+		pin = group->grp.pins[i];
+
+		ret = pmic_gpio_pinconf_pin_set(pctldev, pin, configs, nconfs);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
 }
 
-static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
-				      struct seq_file *s, unsigned pin)
+/**
+ * pmic_gpio_pinconf_pin_dbg_show() - Show configuration for a single pin
+ * @pctldev: pinctrl device
+ * @s: seq_file for output
+ * @pin: Pin number
+ *
+ * Core function that dumps the configuration of a single GPIO pin.
+ * Used by pinconf-pins debugfs, pinconf-groups debugfs, and gpio debugfs.
+ */
+static void pmic_gpio_pinconf_pin_dbg_show(struct pinctrl_dev *pctldev,
+					   struct seq_file *s,
+					   unsigned int pin)
 {
 	struct pmic_gpio_state *state = pinctrl_dev_get_drvdata(pctldev);
 	struct pmic_gpio_pad *pad;
@@ -716,11 +788,46 @@ static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
 	}
 }
 
+/**
+ * pmic_gpio_pinconf_group_dbg_show() - Show configuration for a pin group
+ * @pctldev: pinctrl device
+ * @s: seq_file for output
+ * @selector: Group selector
+ *
+ * Shows the configuration for all pins in a group.
+ * Used by the pinconf-groups debugfs interface.
+ */
+static void pmic_gpio_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
+					     struct seq_file *s,
+					     unsigned int selector)
+{
+	const struct group_desc *group;
+	unsigned int pin;
+	int i;
+
+	group = pinctrl_generic_get_group(pctldev, selector);
+	if (!group)
+		return;
+
+	/* Iterate over all pins in the group and show status for each */
+	for (i = 0; i < group->grp.npins; i++) {
+		pin = group->grp.pins[i];
+
+		if (i > 0)
+			seq_puts(s, "\n       ");
+
+		pmic_gpio_pinconf_pin_dbg_show(pctldev, s, pin);
+	}
+}
+
 static const struct pinconf_ops pmic_gpio_pinconf_ops = {
 	.is_generic			= true,
-	.pin_config_group_get		= pmic_gpio_config_get,
-	.pin_config_group_set		= pmic_gpio_config_set,
-	.pin_config_group_dbg_show	= pmic_gpio_config_dbg_show,
+	.pin_config_get			= pmic_gpio_pinconf_pin_get,
+	.pin_config_set			= pmic_gpio_pinconf_pin_set,
+	.pin_config_dbg_show		= pmic_gpio_pinconf_pin_dbg_show,
+	.pin_config_group_get		= pmic_gpio_pinconf_group_get,
+	.pin_config_group_set		= pmic_gpio_pinconf_group_set,
+	.pin_config_group_dbg_show	= pmic_gpio_pinconf_group_dbg_show,
 };
 
 static int pmic_gpio_get_direction(struct gpio_chip *chip, unsigned pin)
@@ -745,7 +852,7 @@ static int pmic_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
 
 	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
 
-	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
+	return pmic_gpio_pinconf_pin_set(state->ctrl, pin, &config, 1);
 }
 
 static int pmic_gpio_direction_output(struct gpio_chip *chip,
@@ -756,7 +863,7 @@ static int pmic_gpio_direction_output(struct gpio_chip *chip,
 
 	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
 
-	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
+	return pmic_gpio_pinconf_pin_set(state->ctrl, pin, &config, 1);
 }
 
 static int pmic_gpio_get(struct gpio_chip *chip, unsigned pin)
@@ -788,7 +895,7 @@ static int pmic_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 
 	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, value);
 
-	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
+	return pmic_gpio_pinconf_pin_set(state->ctrl, pin, &config, 1);
 }
 
 static int pmic_gpio_of_xlate(struct gpio_chip *chip,
@@ -810,7 +917,7 @@ static void pmic_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	unsigned i;
 
 	for (i = 0; i < chip->ngpio; i++) {
-		pmic_gpio_config_dbg_show(state->ctrl, s, i);
+		pmic_gpio_pinconf_pin_dbg_show(state->ctrl, s, i);
 		seq_puts(s, "\n");
 	}
 }
@@ -1129,11 +1236,11 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 	pctrldesc->custom_conf_items = pmic_conf_items;
 #endif
 
-	for (i = 0; i < npins; i++, pindesc++) {
+	for (i = 0; i < npins; i++) {
 		pad = &pads[i];
-		pindesc->drv_data = pad;
-		pindesc->number = i;
-		pindesc->name = pmic_gpio_groups[i];
+		pindesc[i].drv_data = pad;
+		pindesc[i].number = i;
+		pindesc[i].name = pmic_gpio_groups[i];
 
 		pad->base = reg + i * PMIC_GPIO_ADDRESS_RANGE;
 
@@ -1154,6 +1261,30 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(state->ctrl))
 		return PTR_ERR(state->ctrl);
 
+	/* Register pin groups - each GPIO is a group for standard functions */
+	for (i = 0; i < npins; i++) {
+		ret = pinctrl_generic_add_group(state->ctrl,
+						pmic_gpio_groups[i],
+						&pindesc[i].number, 1, NULL);
+		if (ret < 0) {
+			dev_err(dev, "failed to register group %s\n",
+				pmic_gpio_groups[i]);
+			return ret;
+		}
+	}
+
+	/* Register standard functions - all GPIOs support these */
+	for (i = 0; i < ARRAY_SIZE(pmic_gpio_functions); i++) {
+		ret = pinmux_generic_add_function(state->ctrl,
+						  pmic_gpio_functions[i],
+						  pmic_gpio_groups, npins, NULL);
+		if (ret < 0) {
+			dev_err(dev, "failed to register function %s\n",
+				pmic_gpio_functions[i]);
+			return ret;
+		}
+	}
+
 	parent_node = of_irq_find_parent(state->dev->of_node);
 	if (!parent_node)
 		return -ENXIO;

-- 
2.43.0



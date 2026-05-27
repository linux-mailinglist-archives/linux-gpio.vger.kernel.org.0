Return-Path: <linux-gpio+bounces-37569-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BKNMTq4Fmo6pwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37569-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 11:24:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAEF5E1BF8
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 11:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 092EA30117F1
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A963ED124;
	Wed, 27 May 2026 09:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iuc6UWJR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xl6Z6tfC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7673E8695
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 09:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873821; cv=none; b=NU/p3izPqSpy1rNUDJDah4AArCe4WwGJgg9iDVH1e90MsyK5i6eDaFME/YxNkII1pzWUKaS8pmDjotlsaJW+RRA0D0LIiXqXKoYYav6Yp3nwgAJHLlWzN7UJWa9VfS+A+up+UNtDrrmF/UyWH6raVvE2CmQUvr4xyVy8m0Q9hCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873821; c=relaxed/simple;
	bh=ZdtgHup1CUiT58+uan9Y1EBaEiejMTxrDIuTQRNxeIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9IQGg58luNQ/sCgL+WKKUTosJq6LIRK2lMc8jTIevRa+vnepfJXp58+Lf0cDomjwuTkzHHCJ+D44g4Uo8Fp3fQ6tduT6VNZiMvIuyLvFW+iTha9muFEl6F5yDBkCkvmL3eE+Y1FPorAWzP/p6+onZp8xh8J3k3hmldbsFvCqAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iuc6UWJR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xl6Z6tfC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mTqd3830802
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 09:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ZueFuGp2FKhjaGfq3McD2gtxTN4Aa6zWUr9wxcF8pI=; b=Iuc6UWJRqOJKJ1Ld
	JKyZ0qU8q/ypMqinJnIWaARCjiC4G7E/qG5DrpHnheyqa3Wu13khIdj3Tz4UqeQj
	M2sBUnyAUEYJP2LktJ5s4NKJQ7i7OrawJv93r1gDZXKOfMN0q0pVQHDMehKUMoH/
	XPynrBNUQ/+1srqvUyTxqIFTxWAkeI0agqYcQZscwZOh6YH80xqTJ1v2Qj3JvqVk
	vmQctJLoaRtRfjVX4NXs/OOQXmkG/SixBe8XYUrmGwonyV8uVu7rUewo5muQhEJq
	jNBA2EOo1hHSwQXRcBxZI6RCcgUuv9xcNLMlrnooN+nCLE8OkemYG7L3RHKsO+iT
	f0rdfw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edn17hutw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 09:23:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304b8d0ee63so889750eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 02:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779873810; x=1780478610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZueFuGp2FKhjaGfq3McD2gtxTN4Aa6zWUr9wxcF8pI=;
        b=Xl6Z6tfCvlm/SkR46f1XslBGEGYRCnTJ1u9Kn+OCDugmUc6qJLJnzbSP+Ppo4GSenF
         s9HvVjnV0QdFlNXF7kDyY+V3xRMaCSjjP42Bo3wFX++xtKPFTxZElGiy/fAtZRQB6eqr
         z86BJ3TQol5cBeifgzM37D9BcnzkKH3AeuKHVGsWPcmdJJO0gh84eLgjQ74p4Wq3m2za
         H5rsFZAjvwJPZ0nO1fMW/1pOr3Hfpbf7HOMnqYKMcc9EzfC4hGxDhIABfZsTAjJ2qPkm
         NSRyXmLPczgQmDEYrMxwukN3aIa4j3CiHOiIard409ZCrOI7ZQy2jvhexpVcpVJpihhb
         475A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779873810; x=1780478610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ZueFuGp2FKhjaGfq3McD2gtxTN4Aa6zWUr9wxcF8pI=;
        b=iju9LYf444dsqArhYCff4H3O3vgA20GCme9RZJWWVWVnhpdJ+Bg709Jzz3uFkEstsd
         8pBtMrvstg/nKRUK5mAeIWgq791k4upaI0N4yWLEzstdd1VOsHg86lEdoA6Xko49+WQV
         t6WvTuTKWnLaY6VQ+nJknt4ch+uo4AWTLxRjXhrhtETcbedko3G8w2lgQV3W+Mosg+U9
         YTV6BfCVnPx6DXPP2386w5gRUctd5ss+BAN7/OxY6qrUE62PhC9v1S2ecHuwe+z+NoxL
         ZJ7O/Zi8vasSts4xUSZrUX2/N/Ak5BzlQjV1L0bi3YjC16y7kyR4Z/jIC5pOBw3plqlF
         HtbA==
X-Forwarded-Encrypted: i=1; AFNElJ/7TG+/XIS7RPkAj3vhN760WzFk4PkrtXJvnmHFhSfRUx2DduD7SyUqONESHXDkV+RDtCYIKOoEkaaI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb/v40LJun88XSPmy2M/ZgL1pu2j2W2ZHlxn9bcJrO1HYiQfoR
	KFzCuklVUOthhCQ7XFk3BcJVQt7jkqfPhWTYWZPLDBKPnDjet72vv9itWbqtbqY7fdu2hU1X2/u
	D/0bNhNPkfg5kszv7rbeQGezNg6nDxY2I5D02uPHcBCtm1v87pNTYmwbZVKX3t0Iw
X-Gm-Gg: Acq92OFT59Ox6vUEDxqmgmPfzoTZwvI35hhtzdGikXGDxVbpHO1ZUE6s8khWi7rH7XF
	PDlRUGkZrAa7MjsbHJzftjWis+nU7OszVWTNG+z9idfkqGlo68HPFerOhhDDi0G1KO17QC0QM8J
	kdto5opazcbdjM2rt2gwx+DDKKpYXl/myD+7LlivviBb3z/BEMqAO8Qcz5f8X1DVW+IOW3zvhTg
	Xbrv0dvV17/n6KQsO9fyUfeDgdq0rG+TpbNPaeAhdIHNNq726ARbuxHZhZj4SwWq/geJLZUjZ5d
	cmTN/qu9vrV70zmbJivxWtS5+X1CakzVkMn0vl5nzESNC4bSh69BiA1wRoOmkLl1f2KIR5EOe5o
	TC7A/+MUBLQis99XeXJpJPMEBPyP4cDxukUcqr95Yoj/DVPHahJ9SkzJw7QTlcH3QlQorBmsF6g
	==
X-Received: by 2002:a05:7300:ec11:b0:2e6:fe90:27ad with SMTP id 5a478bee46e88-30448fd59d4mr8680561eec.7.1779873809703;
        Wed, 27 May 2026 02:23:29 -0700 (PDT)
X-Received: by 2002:a05:7300:ec11:b0:2e6:fe90:27ad with SMTP id 5a478bee46e88-30448fd59d4mr8680542eec.7.1779873808993;
        Wed, 27 May 2026 02:23:28 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef4afdsm12598732eec.5.2026.05.27.02.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:23:28 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 27 May 2026 02:22:47 -0700
Subject: [PATCH 4/4] pinctrl: qcom: spmi-gpio: Add level-shifter function
 support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260527-pinctrl-level-shifter-v1-4-1965461d0a7c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779873802; l=26417;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=ZdtgHup1CUiT58+uan9Y1EBaEiejMTxrDIuTQRNxeIQ=;
 b=LMHt9Yo2Bdyl7dw0KyDYRWE5wfwgvr2Dz625+7q+Ht9CQJ6EBx64kV/HkQiKQzA7GmrK9kWUM
 HOu88nmn6uMBRMx4DFh+iyo7xfFoKEENyPcIWboS7MoJe6DoQdrqPqj
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MCBTYWx0ZWRfX4vJU4bGprPhp
 osuQyCwzfpozVHS02ZFweDOsmVNnI9XL66n3XnZJiRhEMCeVjiZ9DYsc5vEfGBtktGSQGB6WAQt
 jBSyHuQAmb1v6GgKvqZWENgn7Hbkh+EMb4ru66bmYe/0SwJE506+N/ZqvZUF/iFofYaZd9+IWia
 wv41mVEEX/8tZjc6T8r0rVtNWFt9OFHERl926G/OAb8jJfvAud2G7BpW0H8HfNT/TK5KATAFwY+
 9JaBe9revbhXErSDca/pv0N5aBRkkQxr0Xa/tdx3NirVcANiHYsJydZTU2jFnLzGKKemAZvYQaH
 B4RZ14OPlbqgi7q62eaMOOWVFjaGvKUswptTGYxmbHjFak2CJ0WfTmxKTXI6t5bIvfnYPbf+Z4y
 +01pdILryaYPdj2xGWoI1RMnL/1Uq9sGTiK34uweuzGCrr2LdlHHYC/ELhxskAFu3HVloxcMlBk
 AG9PKeVJeGamwzQNgjA==
X-Authority-Analysis: v=2.4 cv=R6Uz39RX c=1 sm=1 tr=0 ts=6a16b813 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=O479GCAEFUW8rv5zZysA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: haaXhpYoRYzcXu-M0SwhnV3MGkTysWBf
X-Proofpoint-ORIG-GUID: haaXhpYoRYzcXu-M0SwhnV3MGkTysWBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-37569-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cmd.data:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAAEF5E1BF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PMH0101 introduces bidirectional level shifter (BIDIR_LVL_SHIFTER)
modules that provide voltage translation between 1.2 V and 1.8 V power
domains for open-drain signals, such as connecting a camera sensor with
1.8 V I2C IO to a SoC I2C bus operating at 1.2 V IO.

Each BIDIR_LVL_SHIFTER shares its two physical pins with a corresponding
pair of GPIO modules. When used, the associated GPIOs need to keep
disabled, with no GPIO function or configuration enabled. The
BIDIR_LVL_SHIFTER then operates as a bidirectional open-drain voltage
translator, using fixed 1.2 V and 1.8 V reference voltages on each side
and relying on external board-level pull-up resistors for open-drain
drive control.

From a system perspective, a BIDIR_LVL_SHIFTER may be used on a serial
bus shared by multiple clients managed by different subsystems. As a
result, its enable control is shared and centrally managed by AOP,
with each subsystem voting for the enable state via an RPMh “XOB”
resource.

Add a new "level-shifter" function to the SPMI GPIO driver to support
BIDIR_LVL_SHIFTER operation considering that BIDIR_LVL_SHIFTER shares
physical pins with GPIOs, it must be mutually exclusive with all
existing functions and configurations. Additionally, limit the
"level-shifter" function to specific GPIO pairs that share physical
pins with the BIDIR_LVL_SHIFTER module by creating pingroups and
linking them to the "level-shifter" function.

With this change, the BIDIR_LVL_SHIFTER could be controlled with
following dtsi nodes:

    pmh0101-ls1-en {
    	groups = "gpio11, gpio12";
    	function = "level-shifter";
    	qcom,1p2v-1p8v-ls-en = <1>;
    };

    pmh0101-ls1-dis {
    	groups = "gpio11, gpio12";
    	function = "level-shifter";
    	qcom,1p2v-1p8v-ls-en = <0>;
    };

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 410 +++++++++++++++++++++++++------
 1 file changed, 335 insertions(+), 75 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index f159c56784b4..d0144dbb7cfc 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -23,6 +23,9 @@
 
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
+#include <soc/qcom/cmd-db.h>
+#include <soc/qcom/rpmh.h>
+
 #include "../core.h"
 #include "../pinmux.h"
 #include "../pinctrl-utils.h"
@@ -118,12 +121,16 @@
 /* PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL */
 #define PMIC_GPIO_LV_MV_ANA_MUX_SEL_MASK		0x3
 
+/* Level shifter register offset */
+#define REG_LS_ENABLE_OFFSET			4
+
 /* Qualcomm specific pin configurations */
 #define PMIC_GPIO_CONF_PULL_UP			(PIN_CONFIG_END + 1)
 #define PMIC_GPIO_CONF_STRENGTH			(PIN_CONFIG_END + 2)
 #define PMIC_GPIO_CONF_ATEST			(PIN_CONFIG_END + 3)
 #define PMIC_GPIO_CONF_ANALOG_PASS		(PIN_CONFIG_END + 4)
 #define PMIC_GPIO_CONF_DTEST_BUFFER		(PIN_CONFIG_END + 5)
+#define PMIC_GPIO_CONF_LS_ENABLE		(PIN_CONFIG_END + 6)
 
 /* The index of each function in pmic_gpio_functions[] array */
 enum pmic_gpio_func_index {
@@ -137,6 +144,7 @@ enum pmic_gpio_func_index {
 	PMIC_GPIO_FUNC_INDEX_DTEST2,
 	PMIC_GPIO_FUNC_INDEX_DTEST3,
 	PMIC_GPIO_FUNC_INDEX_DTEST4,
+	PMIC_GPIO_FUNC_INDEX_LEVEL_SHIFTER,
 };
 
 /**
@@ -183,25 +191,86 @@ struct pmic_gpio_state {
 	struct regmap	*map;
 	struct pinctrl_dev *ctrl;
 	struct gpio_chip chip;
+	struct device	*rpmh_dev;
+	const char	*pmic_id;
 	u8 usid;
 	u8 pid_base;
 };
 
+/**
+ * struct ls_config - Level shifter configuration
+ * @name: Pinctrl group name (e.g., "gpio11, gpio12")
+ * @rpmh_prefix: RPMh resource name prefix (e.g., "LS1")
+ * @pins: Array of pin numbers for this level shifter pair
+ */
+struct ls_config {
+	const char *name;
+	const char *rpmh_prefix;
+	const unsigned int *pins;
+};
+
+/**
+ * struct ls_pingroup_data - Level shifter pin group data
+ * @config: Pointer to level shifter configuration
+ * @level_shifter_addr: RPMh address for level shifter control
+ * @ls_enabled: Shadowed enable state, updated on each successful RPMh write
+ */
+struct ls_pingroup_data {
+	struct ls_config *config;
+	u32 level_shifter_addr;
+	bool ls_enabled;
+};
+
+/**
+ * struct pmic_gpio_hw_data - Hardware-specific data
+ * @npins: Number of GPIO pins
+ * @ls_config: Array of level shifter configurations
+ * @num_ls: Number of level shifters
+ */
+struct pmic_gpio_hw_data {
+	u32 npins;
+	struct ls_config *ls_config;
+	u32 num_ls;
+};
+
+/* Macro to create hardware data inline */
+#define PMIC_GPIO_HW_DATA(n, ls, num) \
+	(&(const struct pmic_gpio_hw_data) { \
+		.npins = n, \
+		.ls_config = ls, \
+		.num_ls = num, \
+	})
+
+/* Level shifter pin groups for PMH0101 */
+static const unsigned int ls1_pins[] = { 10, 11 }; /* GPIO11, GPIO12 */
+static const unsigned int ls2_pins[] = { 12, 13 }; /* GPIO13, GPIO14 */
+static const unsigned int ls3_pins[] = { 14, 15 }; /* GPIO15, GPIO16 */
+static const unsigned int ls4_pins[] = { 16, 17 }; /* GPIO17, GPIO18 */
+
+static struct ls_config pmh0101_ls_configs[] = {
+	{ "gpio11, gpio12", "LS1", ls1_pins },
+	{ "gpio13, gpio14", "LS2", ls2_pins },
+	{ "gpio15, gpio16", "LS3", ls3_pins },
+	{ "gpio17, gpio18", "LS4", ls4_pins },
+};
+
 static const struct pinconf_generic_params pmic_gpio_bindings[] = {
 	{"qcom,pull-up-strength",	PMIC_GPIO_CONF_PULL_UP,		0},
 	{"qcom,drive-strength",		PMIC_GPIO_CONF_STRENGTH,	0},
 	{"qcom,atest",			PMIC_GPIO_CONF_ATEST,		0},
 	{"qcom,analog-pass",		PMIC_GPIO_CONF_ANALOG_PASS,	0},
-	{"qcom,dtest-buffer",           PMIC_GPIO_CONF_DTEST_BUFFER,    0},
+	{"qcom,dtest-buffer",		PMIC_GPIO_CONF_DTEST_BUFFER,	0},
+	{"qcom,1p2v-1p8v-ls-en",	PMIC_GPIO_CONF_LS_ENABLE,	0},
 };
 
 #ifdef CONFIG_DEBUG_FS
 static const struct pin_config_item pmic_conf_items[ARRAY_SIZE(pmic_gpio_bindings)] = {
-	PCONFDUMP(PMIC_GPIO_CONF_PULL_UP,  "pull up strength", NULL, true),
-	PCONFDUMP(PMIC_GPIO_CONF_STRENGTH, "drive-strength", NULL, true),
-	PCONFDUMP(PMIC_GPIO_CONF_ATEST, "atest", NULL, true),
-	PCONFDUMP(PMIC_GPIO_CONF_ANALOG_PASS, "analog-pass", NULL, true),
-	PCONFDUMP(PMIC_GPIO_CONF_DTEST_BUFFER, "dtest-buffer", NULL, true),
+	PCONFDUMP(PMIC_GPIO_CONF_PULL_UP,      "pull up strength", NULL, true),
+	PCONFDUMP(PMIC_GPIO_CONF_STRENGTH,     "drive-strength",   NULL, true),
+	PCONFDUMP(PMIC_GPIO_CONF_ATEST,        "atest",            NULL, true),
+	PCONFDUMP(PMIC_GPIO_CONF_ANALOG_PASS,  "analog-pass",      NULL, true),
+	PCONFDUMP(PMIC_GPIO_CONF_DTEST_BUFFER, "dtest-buffer",     NULL, true),
+	PCONFDUMP(PMIC_GPIO_CONF_LS_ENABLE,    "ls-enable",        NULL, true),
 };
 #endif
 
@@ -262,6 +331,41 @@ static const struct pinctrl_ops pmic_gpio_pinctrl_ops = {
 	.dt_free_map		= pinctrl_utils_free_map,
 };
 
+/**
+ * pmic_gpio_set_ls_rpmh() - Send RPMh XOB vote for a level shifter
+ * @state: PMIC GPIO state
+ * @ls_data: Level shifter pin group data
+ * @enable: true to enable, false to disable
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int pmic_gpio_set_ls_rpmh(struct pmic_gpio_state *state,
+				  struct ls_pingroup_data *ls_data,
+				  bool enable)
+{
+	struct tcs_cmd cmd = { };
+	int ret;
+
+	if (!ls_data->level_shifter_addr) {
+		dev_err(state->dev, "Level shifter address not configured\n");
+		return -EINVAL;
+	}
+
+	if (!state->rpmh_dev) {
+		dev_err(state->dev, "RPMh device not available\n");
+		return -ENODEV;
+	}
+
+	cmd.addr = ls_data->level_shifter_addr + REG_LS_ENABLE_OFFSET;
+	cmd.data = enable ? 1 : 0;
+
+	ret = rpmh_write_ctrlr(state->rpmh_dev, RPMH_ACTIVE_ONLY_STATE, &cmd, 1);
+	if (!ret)
+		ls_data->ls_enabled = enable;
+
+	return ret;
+}
+
 static int pmic_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 				unsigned int selector)
 {
@@ -271,7 +375,7 @@ static int pmic_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	unsigned int val, pin, func;
 	int ret, i;
 
-	if (function > PMIC_GPIO_FUNC_INDEX_DTEST4) {
+	if (function > PMIC_GPIO_FUNC_INDEX_LEVEL_SHIFTER) {
 		pr_err("function: %d is not defined\n", function);
 		return -EINVAL;
 	}
@@ -280,6 +384,28 @@ static int pmic_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	if (!group)
 		return -EINVAL;
 
+	if (function == PMIC_GPIO_FUNC_INDEX_LEVEL_SHIFTER) {
+		if (!group->data)
+			return -EINVAL;
+
+		/*
+		 * Disable both GPIO pads in the pair. The RPMh XOB vote is
+		 * sent separately via the qcom,1p2v-1p8v-ls-en pinconf parameter.
+		 */
+		for (i = 0; i < group->grp.npins; i++) {
+			pin = group->grp.pins[i];
+			pad = pctldev->desc->pins[pin].drv_data;
+
+			ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_EN_CTL, 0);
+			if (ret < 0)
+				return ret;
+
+			pad->is_enabled = false;
+			pad->function = PMIC_GPIO_FUNC_INDEX_LEVEL_SHIFTER;
+		}
+		return 0;
+	}
+
 	/* For standard functions, iterate over all pins in the group */
 	for (i = 0; i < group->grp.npins; i++) {
 		pin = group->grp.pins[i];
@@ -597,6 +723,9 @@ static int pmic_gpio_pinconf_pin_set(struct pinctrl_dev *pctldev,
 				return -EINVAL;
 			pad->dtest_buffer = arg;
 			break;
+		case PMIC_GPIO_CONF_LS_ENABLE:
+			/* Group-level only; handled in pmic_gpio_pinconf_group_set */
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -690,13 +819,14 @@ static int pmic_gpio_pinconf_pin_set(struct pinctrl_dev *pctldev,
  * @configs: Array of configuration parameters
  * @nconfs: Number of configurations
  *
- * Iterates over all pins in the group and applies config to each.
+ * Handles group-level parameters (e.g., LS enable) before iterating per-pin.
  */
 static int pmic_gpio_pinconf_group_set(struct pinctrl_dev *pctldev,
 				       unsigned int selector,
 				       unsigned long *configs,
 				       unsigned int nconfs)
 {
+	struct pmic_gpio_state *state = pinctrl_dev_get_drvdata(pctldev);
 	const struct group_desc *group;
 	unsigned int pin;
 	int i, ret;
@@ -705,7 +835,25 @@ static int pmic_gpio_pinconf_group_set(struct pinctrl_dev *pctldev,
 	if (!group)
 		return -EINVAL;
 
-	/* Iterate over all pins in the group and apply config to each */
+	/* Handle group-level LS_ENABLE before iterating per-pin configs */
+	for (i = 0; i < nconfs; i++) {
+		if (pinconf_to_config_param(configs[i]) != PMIC_GPIO_CONF_LS_ENABLE)
+			continue;
+
+		if (!group->data) {
+			dev_err(state->dev,
+				"qcom,1p2v-1p8v-ls-en is only valid for level-shifter groups\n");
+			return -EINVAL;
+		}
+
+		ret = pmic_gpio_set_ls_rpmh(state,
+					    (struct ls_pingroup_data *)group->data,
+					    !!pinconf_to_config_argument(configs[i]));
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Apply per-pin configs to each pin in the group */
 	for (i = 0; i < group->grp.npins; i++) {
 		pin = group->grp.pins[i];
 
@@ -794,8 +942,8 @@ static void pmic_gpio_pinconf_pin_dbg_show(struct pinctrl_dev *pctldev,
  * @s: seq_file for output
  * @selector: Group selector
  *
- * Shows the configuration for all pins in a group.
- * Used by the pinconf-groups debugfs interface.
+ * Shows the configuration for all pins in a group. For level-shifter groups,
+ * also prints the RPMh address as a preamble.
  */
 static void pmic_gpio_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 					     struct seq_file *s,
@@ -809,6 +957,14 @@ static void pmic_gpio_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 	if (!group)
 		return;
 
+	/* For level-shifter groups, print the enable status as preamble */
+	if (group->data) {
+		const struct ls_pingroup_data *ls_data = group->data;
+
+		seq_printf(s, ", level-shifter (%s)\n       ",
+			   ls_data->ls_enabled ? "enabled" : "disabled");
+	}
+
 	/* Iterate over all pins in the group and show status for each */
 	for (i = 0; i < group->grp.npins; i++) {
 		pin = group->grp.pins[i];
@@ -1177,6 +1333,96 @@ static const struct irq_chip spmi_gpio_irq_chip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
+/**
+ * pmic_gpio_register_level_shifters() - Register level-shifter groups and function
+ * @state: PMIC GPIO state
+ * @hw_data: Hardware-specific data containing level-shifter configurations
+ *
+ * This function registers level-shifter support by:
+ * 1. Getting RPMh device reference and PMIC ID from device tree
+ * 2. Registering each level-shifter pair as a multi-pin group
+ * 3. Getting RPMh addresses from cmd_db for each level-shifter
+ * 4. Registering the level-shifter function once with all valid groups
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int pmic_gpio_register_level_shifters(struct pmic_gpio_state *state,
+					     const struct pmic_gpio_hw_data *hw_data)
+{
+	struct device *dev = state->dev;
+	const char **ls_group_names;
+	int ret, i;
+
+	/* Get RPMh device reference for level shifter control */
+	state->rpmh_dev = rpmh_get_ctrlr_dev(dev);
+	if (IS_ERR(state->rpmh_dev))
+		return dev_err_probe(dev, PTR_ERR(state->rpmh_dev),
+				     "Level shifter needs rpmh device\n");
+
+	/* Get PMIC ID from device tree for RPMh resource name composition */
+	ret = of_property_read_string(dev->of_node, "qcom,pmic-id",
+				       &state->pmic_id);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "get qcom,pmic-id failed for rpmh resource\n");
+
+	/* Allocate array to hold all level-shifter group names */
+	ls_group_names = devm_kcalloc(dev, hw_data->num_ls,
+				      sizeof(*ls_group_names), GFP_KERNEL);
+	if (!ls_group_names)
+		return -ENOMEM;
+
+	/* Register each level-shifter pair as a multi-pin group */
+	for (i = 0; i < hw_data->num_ls; i++) {
+		struct ls_config *ls = &hw_data->ls_config[i];
+		struct ls_pingroup_data *ls_group_data;
+		char rpmh_resource_name[32];
+
+		/* Allocate ls_pingroup_data for this level shifter */
+		ls_group_data = devm_kzalloc(dev, sizeof(*ls_group_data),
+					     GFP_KERNEL);
+		if (!ls_group_data)
+			return -ENOMEM;
+
+		ls_group_data->config = ls;
+
+		/* Compose RPMh resource name and get address from cmd_db */
+		if (state->pmic_id && ls->rpmh_prefix) {
+			snprintf(rpmh_resource_name,
+				 sizeof(rpmh_resource_name),
+				 "%s%s", ls->rpmh_prefix, state->pmic_id);
+			ls_group_data->level_shifter_addr =
+				cmd_db_read_addr(rpmh_resource_name);
+			if (!ls_group_data->level_shifter_addr)
+				return dev_err_probe(dev, -ENODEV,
+						     "RPMh resource %s not found in cmd_db\n",
+						     rpmh_resource_name);
+		}
+
+		/* Store group name for function registration */
+		ls_group_names[i] = ls->name;
+
+		/* Register the multi-pin group using the level-shifter name */
+		ret = pinctrl_generic_add_group(state->ctrl, ls->name,
+						ls->pins, 2, ls_group_data);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "Failed to register level-shifter group %s\n",
+					     ls->name);
+	}
+
+	/* Register level-shifter function once with all valid groups */
+	ret = pinmux_generic_add_function(state->ctrl,
+					  PMIC_GPIO_FUNC_LEVEL_SHIFTER,
+					  ls_group_names, hw_data->num_ls,
+					  NULL);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to register level-shifter function\n");
+
+	return 0;
+}
+
 static int pmic_gpio_probe(struct platform_device *pdev)
 {
 	struct irq_domain *parent_domain;
@@ -1188,6 +1434,7 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 	struct pmic_gpio_state *state;
 	struct gpio_irq_chip *girq;
 	const struct spmi_device *parent_spmi_dev;
+	const struct pmic_gpio_hw_data *hw_data;
 	int ret, npins, i;
 	u32 reg;
 
@@ -1197,7 +1444,13 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	npins = (uintptr_t) device_get_match_data(&pdev->dev);
+	hw_data = device_get_match_data(&pdev->dev);
+	if (!hw_data) {
+		dev_err(dev, "no match data found\n");
+		return -EINVAL;
+	}
+
+	npins = hw_data->npins;
 
 	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
 	if (!state)
@@ -1285,6 +1538,13 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Register level-shifter groups and function if supported */
+	if (hw_data->ls_config && hw_data->num_ls) {
+		ret = pmic_gpio_register_level_shifters(state, hw_data);
+		if (ret < 0)
+			return ret;
+	}
+
 	parent_node = of_irq_find_parent(state->dev->of_node);
 	if (!parent_node)
 		return -ENXIO;
@@ -1345,80 +1605,80 @@ static void pmic_gpio_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id pmic_gpio_of_match[] = {
-	{ .compatible = "qcom,pm2250-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pm2250-gpio", .data = PMIC_GPIO_HW_DATA(10, NULL, 0) },
 	/* pm660 has 13 GPIOs with holes on 1, 5, 6, 7, 8 and 10 */
-	{ .compatible = "qcom,pm660-gpio", .data = (void *) 13 },
+	{ .compatible = "qcom,pm660-gpio", .data = PMIC_GPIO_HW_DATA(13, NULL, 0) },
 	/* pm660l has 12 GPIOs with holes on 1, 2, 10, 11 and 12 */
-	{ .compatible = "qcom,pm660l-gpio", .data = (void *) 12 },
-	{ .compatible = "qcom,pm6125-gpio", .data = (void *) 9 },
-	{ .compatible = "qcom,pm6150-gpio", .data = (void *) 10 },
-	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
-	{ .compatible = "qcom,pm6350-gpio", .data = (void *) 9 },
-	{ .compatible = "qcom,pm6450-gpio", .data = (void *) 9 },
-	{ .compatible = "qcom,pm7250b-gpio", .data = (void *) 12 },
-	{ .compatible = "qcom,pm7325-gpio", .data = (void *) 10 },
-	{ .compatible = "qcom,pm7550-gpio", .data = (void *) 12 },
-	{ .compatible = "qcom,pm7550ba-gpio", .data = (void *) 8},
-	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
-	{ .compatible = "qcom,pm8010-gpio", .data = (void *) 2 },
-	{ .compatible = "qcom,pm8019-gpio", .data = (void *) 6 },
+	{ .compatible = "qcom,pm660l-gpio", .data = PMIC_GPIO_HW_DATA(12, NULL, 0) },
+	{ .compatible = "qcom,pm6125-gpio", .data = PMIC_GPIO_HW_DATA(9, NULL, 0) },
+	{ .compatible = "qcom,pm6150-gpio", .data = PMIC_GPIO_HW_DATA(10, NULL, 0) },
+	{ .compatible = "qcom,pm6150l-gpio", .data = PMIC_GPIO_HW_DATA(12, NULL, 0) },
+	{ .compatible = "qcom,pm6350-gpio", .data = PMIC_GPIO_HW_DATA(9, NULL, 0) },
+	{ .compatible = "qcom,pm6450-gpio", .data = PMIC_GPIO_HW_DATA(9, NULL, 0) },
+	{ .compatible = "qcom,pm7250b-gpio", .data = PMIC_GPIO_HW_DATA(12, NULL, 0) },
+	{ .compatible = "qcom,pm7325-gpio", .data = PMIC_GPIO_HW_DATA(10, NULL, 0) },
+	{ .compatible = "qcom,pm7550-gpio", .data = PMIC_GPIO_HW_DATA(12, NULL, 0) },
+	{ .compatible = "qcom,pm7550ba-gpio", .data = PMIC_GPIO_HW_DATA(8, NULL, 0) },
+	{ .compatible = "qcom,pm8005-gpio", .data = PMIC_GPIO_HW_DATA(4, NULL, 0) },
+	{ .compatible = "qcom,pm8010-gpio", .data = PMIC_GPIO_HW_DATA(2, NULL, 0) },
+	{ .compatible = "qcom,pm8019-gpio", .data = PMIC_GPIO_HW_DATA(6, NULL, 0) },
 	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
-	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },
-	{ .compatible = "qcom,pmc8180-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pm8150-gpio", .data = PMIC_GPIO_HW_DATA(10, NULL, 0) },
+	{ .compatible = "qcom,pmc8180-gpio", .data = PMIC_GPIO_HW_DATA(10, NULL, 0) },
 	/* pm8150b has 12 GPIOs with holes on 3, r and 7 */
-	{ .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pm8150b-gpio", .data = PMIC_GPIO_HW_DATA(12, NULL, 0) },
 	/* pm8150l has 12 GPIOs with holes on 7 */
-	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
-	{ .compatible = "qcom,pmc8180c-gpio", .data = (void *) 12 },
-	{ .compatible = "qcom,pm8226-gpio", .data = (void *) 8 },
-	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
-	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
-	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
-	{ .compatible = "qcom,pm8450-gpio", .data = (void *) 4 },
-	{ .compatible = "qcom,pm8550-gpio", .data = (void *) 12 },
-	{ .compatible = "qcom,pm8550b-gpio", .data = (void *) 12 },
-	{ .compatible = "qcom,pm8550ve-gpio", .data = (void *) 8 },
-	{ .compatible = "qcom,pm8550vs-gpio", .data = (void *) 6 },
-	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8150l-gpio", .data = PMIC_GPIO_HW_DATA(12, NULL, 0) },
+	{ .compatible = "qcom,pmc8180c-gpio", .data = PMIC_GPIO_HW_DATA(12, NULL, 0) },
+	{ .compatible = "qcom,pm8226-gpio", .data = PMIC_GPIO_HW_DATA(8, NULL, 0) },
+	{ .compatible = "qcom,pm8350-gpio", .data = PMIC_GPIO_HW_DATA(10, NULL, 0) },
+	{ .compatible = "qcom,pm8350b-gpio", .data = PMIC_GPIO_HW_DATA(8, NULL, 0) },
+	{ .compatible = "qcom,pm8350c-gpio", .data = PMIC_GPIO_HW_DATA(9, NULL, 0) },
+	{ .compatible = "qcom,pm8450-gpio", .data = PMIC_GPIO_HW_DATA(4, NULL, 0) },
+	{ .compatible = "qcom,pm8550-gpio", .data = PMIC_GPIO_HW_DATA(12, NULL, 0) },
+	{ .compatible = "qcom,pm8550b-gpio", .data = PMIC_GPIO_HW_DATA(12, NULL, 0) },
+	{ .compatible = "qcom,pm8550ve-gpio", .data = PMIC_GPIO_HW_DATA(8, NULL, 0) },
+	{ .compatible = "qcom,pm8550vs-gpio", .data = PMIC_GPIO_HW_DATA(6, NULL, 0) },
+	{ .compatible = "qcom,pm8916-gpio", .data = PMIC_GPIO_HW_DATA(4, NULL, 0) },
 	/* pm8937 has 8 GPIOs with holes on 3, 4 and 6 */
-	{ .compatible = "qcom,pm8937-gpio", .data = (void *) 8 },
-	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
+	{ .compatible = "qcom,pm8937-gpio", .data = PMIC_GPIO_HW_DATA(8, NULL, 0) },
+	{ .compatible = "qcom,pm8941-gpio", .data = PMIC_GPIO_HW_DATA(36, NULL, 0) },
 	/* pm8950 has 8 GPIOs with holes on 3 */
-	{ .compatible = "qcom,pm8950-gpio", .data = (void *) 8 },
+	{ .compatible = "qcom,pm8950-gpio", .data = PMIC_GPIO_HW_DATA(8, NULL, 0) },
 	/* pm8953 has 8 GPIOs with holes on 3 and 6 */
-	{ .compatible = "qcom,pm8953-gpio", .data = (void *) 8 },
-	{ .compatible = "qcom,pm8994-gpio", .data = (void *) 22 },
-	{ .compatible = "qcom,pm8998-gpio", .data = (void *) 26 },
-	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
-	{ .compatible = "qcom,pmc8380-gpio", .data = (void *) 10 },
-	{ .compatible = "qcom,pmcx0102-gpio", .data = (void *)14 },
-	{ .compatible = "qcom,pmd8028-gpio", .data = (void *) 4 },
-	{ .compatible = "qcom,pmh0101-gpio", .data = (void *)18 },
-	{ .compatible = "qcom,pmh0104-gpio", .data = (void *)8 },
-	{ .compatible = "qcom,pmh0110-gpio", .data = (void *)14 },
-	{ .compatible = "qcom,pmi632-gpio", .data = (void *) 8 },
-	{ .compatible = "qcom,pmi8950-gpio", .data = (void *) 2 },
-	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
-	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
-	{ .compatible = "qcom,pmih0108-gpio", .data = (void *) 18 },
-	{ .compatible = "qcom,pmiv0104-gpio", .data = (void *) 10 },
-	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
-	{ .compatible = "qcom,pmk8550-gpio", .data = (void *) 6 },
-	{ .compatible = "qcom,pmk8850-gpio", .data = (void *)8 },
-	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },
-	{ .compatible = "qcom,pmm8654au-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pm8953-gpio", .data = PMIC_GPIO_HW_DATA(8, NULL, 0) },
+	{ .compatible = "qcom,pm8994-gpio", .data = PMIC_GPIO_HW_DATA(22, NULL, 0) },
+	{ .compatible = "qcom,pm8998-gpio", .data = PMIC_GPIO_HW_DATA(26, NULL, 0) },
+	{ .compatible = "qcom,pma8084-gpio", .data = PMIC_GPIO_HW_DATA(22, NULL, 0) },
+	{ .compatible = "qcom,pmc8380-gpio", .data = PMIC_GPIO_HW_DATA(10, NULL, 0) },
+	{ .compatible = "qcom,pmcx0102-gpio", .data = PMIC_GPIO_HW_DATA(14, NULL, 0) },
+	{ .compatible = "qcom,pmd8028-gpio", .data = PMIC_GPIO_HW_DATA(4, NULL, 0) },
+	{ .compatible = "qcom,pmh0101-gpio", .data = PMIC_GPIO_HW_DATA(18, pmh0101_ls_configs, 4) },
+	{ .compatible = "qcom,pmh0104-gpio", .data = PMIC_GPIO_HW_DATA(8, NULL, 0) },
+	{ .compatible = "qcom,pmh0110-gpio", .data = PMIC_GPIO_HW_DATA(14, NULL, 0) },
+	{ .compatible = "qcom,pmi632-gpio", .data = PMIC_GPIO_HW_DATA(8, NULL, 0) },
+	{ .compatible = "qcom,pmi8950-gpio", .data = PMIC_GPIO_HW_DATA(2, NULL, 0) },
+	{ .compatible = "qcom,pmi8994-gpio", .data = PMIC_GPIO_HW_DATA(10, NULL, 0) },
+	{ .compatible = "qcom,pmi8998-gpio", .data = PMIC_GPIO_HW_DATA(14, NULL, 0) },
+	{ .compatible = "qcom,pmih0108-gpio", .data = PMIC_GPIO_HW_DATA(18, NULL, 0) },
+	{ .compatible = "qcom,pmiv0104-gpio", .data = PMIC_GPIO_HW_DATA(10, NULL, 0) },
+	{ .compatible = "qcom,pmk8350-gpio", .data = PMIC_GPIO_HW_DATA(4, NULL, 0) },
+	{ .compatible = "qcom,pmk8550-gpio", .data = PMIC_GPIO_HW_DATA(6, NULL, 0) },
+	{ .compatible = "qcom,pmk8850-gpio", .data = PMIC_GPIO_HW_DATA(8, NULL, 0) },
+	{ .compatible = "qcom,pmm8155au-gpio", .data = PMIC_GPIO_HW_DATA(10, NULL, 0) },
+	{ .compatible = "qcom,pmm8654au-gpio", .data = PMIC_GPIO_HW_DATA(12, NULL, 0) },
 	/* pmp8074 has 12 GPIOs with holes on 1 and 12 */
-	{ .compatible = "qcom,pmp8074-gpio", .data = (void *) 12 },
-	{ .compatible = "qcom,pmr735a-gpio", .data = (void *) 4 },
-	{ .compatible = "qcom,pmr735b-gpio", .data = (void *) 4 },
-	{ .compatible = "qcom,pmr735d-gpio", .data = (void *) 2 },
+	{ .compatible = "qcom,pmp8074-gpio", .data = PMIC_GPIO_HW_DATA(12, NULL, 0) },
+	{ .compatible = "qcom,pmr735a-gpio", .data = PMIC_GPIO_HW_DATA(4, NULL, 0) },
+	{ .compatible = "qcom,pmr735b-gpio", .data = PMIC_GPIO_HW_DATA(4, NULL, 0) },
+	{ .compatible = "qcom,pmr735d-gpio", .data = PMIC_GPIO_HW_DATA(2, NULL, 0) },
 	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
-	{ .compatible = "qcom,pms405-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pms405-gpio", .data = PMIC_GPIO_HW_DATA(12, NULL, 0) },
 	/* pmx55 has 11 GPIOs with holes on 3, 7, 10, 11 */
-	{ .compatible = "qcom,pmx55-gpio", .data = (void *) 11 },
-	{ .compatible = "qcom,pmx65-gpio", .data = (void *) 16 },
-	{ .compatible = "qcom,pmx75-gpio", .data = (void *) 16 },
-	{ .compatible = "qcom,pmxr2230-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pmx55-gpio", .data = PMIC_GPIO_HW_DATA(11, NULL, 0) },
+	{ .compatible = "qcom,pmx65-gpio", .data = PMIC_GPIO_HW_DATA(16, NULL, 0) },
+	{ .compatible = "qcom,pmx75-gpio", .data = PMIC_GPIO_HW_DATA(16, NULL, 0) },
+	{ .compatible = "qcom,pmxr2230-gpio", .data = PMIC_GPIO_HW_DATA(12, NULL, 0) },
 	{ },
 };
 

-- 
2.43.0



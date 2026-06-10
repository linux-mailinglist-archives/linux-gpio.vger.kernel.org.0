Return-Path: <linux-gpio+bounces-38281-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8bmxJ0SmKWqGbQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38281-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 20:00:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEE466C1C2
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 20:00:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="JwHUGy/R";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O9fi+3IN;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38281-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38281-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ACB71303B51E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 18:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2243C3546FE;
	Wed, 10 Jun 2026 18:00:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A8E34CFDD
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 18:00:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114431; cv=none; b=AnpDYFKz9+0bqHTJHviPHQOKjt6F90ovZQdEtz2/orO440cxcjY/TahXBtKMGMk3htKEHoIOD4WN2eTrhu0657aspMncMvn76g44DyT53it9ScDFjRGdrqdZDkUljZNLYMYl1Jqt81NFqi+aCoZBM8ngwNHhanJ6RePMzFeKJlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114431; c=relaxed/simple;
	bh=nd70ymVn4qETjMvmdJGh8lIRSl3/z5VnYzyg4y3mSzI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=awDBFVvv3YVC15tv5EtnaFZoNhTQfWRg1cA/x00Ze3wuJTr639TKaaa3Ch0Ud5fGcOqVEFIPGxpm5AL4qC+skIcc4+wkg9GwNKJDRDVjpSTCzhb5qIhL+8YNtdOZKn/s3wcFJwWRmJBVQWGflVJ0vJGTirxaGP+D5C5fQRbzHGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwHUGy/R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O9fi+3IN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFwf0a1997152
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 18:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VFl2C5BL14QmwiuVG0p+7rJNetgeu3x3yCB
	atH8LuKQ=; b=JwHUGy/RPDR89jYVBW3MFof/plyWvOQVSL+on5HBoPIdPBzCZB8
	MM2QFg1YoMtCgW9bPoBict2VsDQ72/STt43JLIBsdP00u16Nnz+2nISocLGHWqly
	2FHiJq7A6OtNu9M2lk1arI9X1IvyRS+pMALRvr/yK4EG4bs7yG2kz1+P9SbqECrM
	m+9X2tUEoCK3FYLycenAOLBy2l2/V/0x5zXrOIgXRYMjHOd+wdjZf1lC3fp3aYH9
	CoJAdtalTp9nWz9AKtusr1KubA+g89LT9u+xooPDDdyF6nFffTE1g3upJAsv33ea
	3peYmd8F9CFO4EsfDgaWydnSBpX3oELqXvg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kdbccq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 18:00:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d99181eaaso9326699a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 11:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781114429; x=1781719229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFl2C5BL14QmwiuVG0p+7rJNetgeu3x3yCBatH8LuKQ=;
        b=O9fi+3INtatcO3rlfldXYze9sTNxL9cip527mSnbWziA9iMvMPee1fgCxsSp3JIkd0
         7Sz5ZiYFKJA91VYpTlxffIG6teBU0vczrk/xjAXp31IA7EClodNjxHrDwYs30SE0hylH
         iicjPehxvBNM5PQWpROLM3w/6ZayPsYTcdgPj4x33x9lzyk6Nbg72A5tZaDH6BKxjUXD
         siXqW2Lsnjb3gExxlVAiVOEKr6bcugDjhOJ/hIcEasP6qKjDTHEg2TDpJ7CfTRDfZrvu
         qHHY+F5MSuGb5lmPuwHEp5bjGqepFCYsYQCniQ/Jf55jjI7ItZthwARoGM16H6TQW7pA
         IA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114429; x=1781719229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFl2C5BL14QmwiuVG0p+7rJNetgeu3x3yCBatH8LuKQ=;
        b=qXNG+AgXwUzAJpUik1fAh1ipUcKBEZT8xMAvi/g9Lwjssi76V7Y2JWmLtJYDMEcJ+l
         ymEHlqwJ8E592X5syr4Cu35NJZnqTiuqh8fHqugz6/vMgxwCuxP29ZZsPCHAfXK87oZx
         F00vgb3vg/GyjJnUE2Udj/HjMzLhDYeHnYFXO5s9pgFTypvi2lSpG9EZkf2iVJioQ1AV
         76uw2F+SKV/LhV6awStLg1ThwzC8Sdx0igtHou2vV2TkzJAArDN0MZxbZqs0flwFw39c
         LOmC4GzPquFDfonYJGE/Th9S6t5WzwgW3SaaZ5v936WTZNu1CWxspNKA3EPmSkapGrLK
         BGKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/aVq1OjKqqbHL9RnrHMa6usNvYlofU5W0OOUhOnW514odimVmJZSnONOMWEsAnYJsDd8OFe904rDt8@vger.kernel.org
X-Gm-Message-State: AOJu0YxaBqz872nlpt6Kkh67x2bqY12n8E152FMUpalBA9/MbFNJpdgp
	Mjs6t3IrszljsMg44LxSAR+H2lqURkAyR+Uw0tyEdRXswhzEykC7ic0ikCoGL6qxyfsg6YFlsmB
	CFSOQMEYsOP75EElWhCiMjpDSIst++ZzT3xWB07vrxDvDf+wfRx3//+DsmW7DxOBs
X-Gm-Gg: Acq92OHrg4EQYKRd6EZkAAOwFSqLhttcHy4VkXJlXVHwceTPHPiHDxl2KTxXTc+8Z7C
	+nbwyH147yW3UP1/8QeDzMdhBSwVWzn+FJ1e3jcwmtuBuIoGnu/fXa+dprDYtOqdAqD6HxHZLil
	+C837IKmRN8X1P8mXRR0vmKS772cU20wAzDYAK2hGMtOZ2S66nVpiLApy3+shBWNHO0bTCrzB+U
	7xQVGzyQaAy3oUySDw5mRQYjMm1no8xu0RlpaivQVSDyc7NdVGz33i1IX+8jpCL35aJ0VNfZMM3
	tY1DxfPDFOTJ80OpoAvBTQ5odfQtt9dWULol6A1gS4dFCuPvTqOCNQCYAhfyO0R2kqzSmWD5mvO
	Qt5k5MtbWWfq492E86Ppg1gfXD9OW1OMqPE36PsTDzcVgw7GeZnKiduZq5nRP
X-Received: by 2002:a05:6a20:d529:b0:3b4:7b3d:179b with SMTP id adf61e73a8af0-3b4ccd56df5mr32680970637.12.1781114428255;
        Wed, 10 Jun 2026 11:00:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:d529:b0:3b4:7b3d:179b with SMTP id adf61e73a8af0-3b4ccd56df5mr32680917637.12.1781114427753;
        Wed, 10 Jun 2026 11:00:27 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4e59sm22229744a12.16.2026.06.10.11.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:00:27 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2] pinctrl: qcom: lpass-lpi: drop unused runtime-PM write helper
Date: Wed, 10 Jun 2026 23:30:12 +0530
Message-Id: <20260610180012.3505877-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a29a63d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4v8pcrgwZPo3ib7Z4i8A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: qg74f5vjhukghqayhDUjTlsHurBZe0MR
X-Proofpoint-ORIG-GUID: qg74f5vjhukghqayhDUjTlsHurBZe0MR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE2OSBTYWx0ZWRfX2+gMT6mEuHeS
 8dy82xhIT2yRTOuXeoOoUaclmtTxdjB33JahPAdlB2E7P0y7uZj/Rg2Gas19YxT1grYRLddGB6A
 eVO52GByOy4+eNTjCDzuuDS9BOUlZUs2JQWruuJox2hiry/jg4fRiYzLz+MVxB8sbXNQszsr5L0
 RbSjU1fO6cbAM3cmmzDt7AFHHPpRsJ4lJbbPg2zOYIeFWIkt4P0Wf6yOcz7iatdoqwPBGeJUIBs
 /kCLdCN7RDLVkMxg/9/N9JKBkUGkwem9btyLeWCdmxMMxTMBM3nO0mtngKYKuhjo+VYf8WToIEb
 nFi5VcB7NBz6XRzeEkIcE+V0GHL2at61Dh4Thi+96QsMpvSmoj58NSLmghjcx0PfpbUowDghSye
 fbrvZ4Xh7yWpcANZhD9C0doRERwMKi3gENgLJxF8U9VL+tWpIk1gVqCazldxitEDGGPP2mTskfJ
 JuzdhNWLtjOiqptS8PQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100169
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38281-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:ajay.nandam@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nathan@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CEE466C1C2

lpi_gpio_write() became unused after the PM clock runtime conversion
switched write paths to register helper calls inside callers that already
hold an active runtime-PM reference.

With -Werror this triggers:
  error: 'lpi_gpio_write' defined but not used [-Wunused-function]

Drop the dead wrapper and rename the low-level MMIO helpers from
__lpi_gpio_* to lpi_gpio_*_reg for neutral register-accessor naming.

Fixes: b719ede389d8 ("pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/all/f03850f6-186d-4988-a450-e6e95f24a551@kernel.org/
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 50 +++++++++---------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 4d758fd117c4..5fd4a4eba654 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -52,15 +52,15 @@ static void __iomem *lpi_gpio_reg(struct lpi_pinctrl *state,
 	return state->tlmm_base + pin_offset + addr;
 }
 
-static void __lpi_gpio_read(struct lpi_pinctrl *state,
-			    unsigned int pin, unsigned int addr, u32 *val)
+static void lpi_gpio_read_reg(struct lpi_pinctrl *state,
+			      unsigned int pin, unsigned int addr, u32 *val)
 {
 	*val = ioread32(lpi_gpio_reg(state, pin, addr));
 }
 
-static void __lpi_gpio_write(struct lpi_pinctrl *state,
-			     unsigned int pin, unsigned int addr,
-			     unsigned int val)
+static void lpi_gpio_write_reg(struct lpi_pinctrl *state,
+			       unsigned int pin, unsigned int addr,
+			       unsigned int val)
 {
 	iowrite32(val, lpi_gpio_reg(state, pin, addr));
 }
@@ -74,21 +74,7 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 	if (ret < 0)
 		return ret;
 
-	__lpi_gpio_read(state, pin, addr, val);
-
-	return pm_runtime_put_autosuspend(state->dev);
-}
-
-static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
-			  unsigned int addr, unsigned int val)
-{
-	int ret;
-
-	ret = pm_runtime_resume_and_get(state->dev);
-	if (ret < 0)
-		return ret;
-
-	__lpi_gpio_write(state, pin, addr, val);
+	lpi_gpio_read_reg(state, pin, addr, val);
 
 	return pm_runtime_put_autosuspend(state->dev);
 }
@@ -150,7 +136,7 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		return ret;
 
 	guard(mutex)(&pctrl->lock);
-	__lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG, &val);
+	lpi_gpio_read_reg(pctrl, pin, LPI_GPIO_CFG_REG, &val);
 
 	/*
 	 * If this is the first time muxing to GPIO and the direction is
@@ -160,23 +146,23 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	 */
 	if (i == GPIO_FUNC && (val & LPI_GPIO_OE_MASK) &&
 	    !test_and_set_bit(group, pctrl->ever_gpio)) {
-		__lpi_gpio_read(pctrl, group, LPI_GPIO_VALUE_REG, &io_val);
+		lpi_gpio_read_reg(pctrl, group, LPI_GPIO_VALUE_REG, &io_val);
 
 		if (io_val & LPI_GPIO_VALUE_IN_MASK) {
 			if (!(io_val & LPI_GPIO_VALUE_OUT_MASK))
-				__lpi_gpio_write(pctrl, group,
-						 LPI_GPIO_VALUE_REG,
-						 io_val | LPI_GPIO_VALUE_OUT_MASK);
+				lpi_gpio_write_reg(pctrl, group,
+						   LPI_GPIO_VALUE_REG,
+						   io_val | LPI_GPIO_VALUE_OUT_MASK);
 		} else {
 			if (io_val & LPI_GPIO_VALUE_OUT_MASK)
-				__lpi_gpio_write(pctrl, group,
-						 LPI_GPIO_VALUE_REG,
-						 io_val & ~LPI_GPIO_VALUE_OUT_MASK);
+				lpi_gpio_write_reg(pctrl, group,
+						   LPI_GPIO_VALUE_REG,
+						   io_val & ~LPI_GPIO_VALUE_OUT_MASK);
 		}
 	}
 
 	u32p_replace_bits(&val, i, LPI_GPIO_FUNCTION_MASK);
-	__lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
+	lpi_gpio_write_reg(pctrl, pin, LPI_GPIO_CFG_REG, val);
 
 	return pm_runtime_put_autosuspend(pctrl->dev);
 }
@@ -337,17 +323,17 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 	guard(mutex)(&pctrl->lock);
 	if (output_enabled) {
 		val = u32_encode_bits(value ? 1 : 0, LPI_GPIO_VALUE_OUT_MASK);
-		__lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
+		lpi_gpio_write_reg(pctrl, group, LPI_GPIO_VALUE_REG, val);
 	}
 
-	__lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG, &val);
+	lpi_gpio_read_reg(pctrl, group, LPI_GPIO_CFG_REG, &val);
 
 	u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
 	u32p_replace_bits(&val, LPI_GPIO_DS_TO_VAL(strength),
 			  LPI_GPIO_OUT_STRENGTH_MASK);
 	u32p_replace_bits(&val, output_enabled, LPI_GPIO_OE_MASK);
 
-	__lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
+	lpi_gpio_write_reg(pctrl, group, LPI_GPIO_CFG_REG, val);
 
 	return pm_runtime_put_autosuspend(pctrl->dev);
 }
-- 
2.34.1



Return-Path: <linux-gpio+bounces-35088-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHBTAzXg3GnrXgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35088-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:23:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1613EBDF5
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17B78301AA83
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 12:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B193F3C4568;
	Mon, 13 Apr 2026 12:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onLJ9rIS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A2eOKyAv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCC43C4554
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 12:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082977; cv=none; b=eK8FAJTmkJinRk6pqAzV2Bs4oOOwCA4L8lXVWqWLWA4F6JBmiiXKfrPQ1AEqwe13t67A1v2xsWsNbmOu3YsOJEyRQ2ib2ZLbrTh0qR/DuPbcsJZQ0zhXn7J7tx3IKlKw4FyUaUaG+9yat5WSOoubLc/rlkPJfzbT/apFxqPgQr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082977; c=relaxed/simple;
	bh=ut9PV2o4yH/f8FFw1egzoxIKS47z+ANZobPjPIWRqWk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lFPyLA+IO23/5gHDAUEQRinR+W31PnpveCHOoX3zYK4q6X10SLeStD9vOxf42Pcc+9IqJ1Rl50Iwne1UwcTpx5cr59h5KwqRkRzQDbcwuNx7IF03FuEidYimGaT+huvD2yX6AYHxMzBYJUJiJdAOSPRyAgUlsP6gpTWzgi11voA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onLJ9rIS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2eOKyAv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DC80ih2187568
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 12:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/JSKbxKMjlH
	hR33pPEPgG0vWEqr9Nna/LCJkfK6/9BQ=; b=onLJ9rISvd95Su9DRKOxqBAqa9C
	WT67BEOcfPbGm1K5H1ZKsImVuDmZ+fhec0YXJdF4bMQFW8xyx9SsAlMaTC9gP3Yy
	+etHTyNcGUrXsYL2wt3t5ZrysYKDwOrq9KFobRZDw4iNqnDtnYZ0UTJw0IsgzzGv
	jrrBz37c7lTSnU7dOWioV5aH17V04BmsKU7veloOJZmrqjCEQ52W9ypnPZPvO4tK
	uc0oQVd0L44bCn4NTA2Ta3NsExM424+V3q24aP+qdT3cQKNRalk/EY9eDRR/O6Kv
	5o+8MaNy3SjziFB7kqlzRVRz+Y3n5f4bnNSh7K08SCJyFq+r1j9vd5ozwfQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh07hg1cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 12:22:55 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-790afc07667so86142467b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 05:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082975; x=1776687775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JSKbxKMjlHhR33pPEPgG0vWEqr9Nna/LCJkfK6/9BQ=;
        b=A2eOKyAvAE+DR0arzu9Q9ux1qkDd/gOVIa9rpxpXIPGxcc7u1Xd7YoarG9ScFqyLd7
         vf9zhdzIa3uiRKF1sMO1WElmZAZOxdId+ctZnsmcq0MyGWF7QiNvnkha4bYGLDqOuPt3
         I2Bdk5fMqq56vntnf208BsFd3IR6U0SFEGhCNYK2OqexyWVJO9u5tQ3VjDi8i1fSEOdl
         tfEB1j3rV1Weqxv/f+CtOcHn9O2AsQKIZgwBHXwwjlok7y2JnJgmDWt1hTItQ37RJPsJ
         T5w0i9yV3agE7hxpnJwRDE77UKiHRdD1vkACC2wiC463xKuj39tAt9IfdiaXklVZQX6u
         sSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082975; x=1776687775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/JSKbxKMjlHhR33pPEPgG0vWEqr9Nna/LCJkfK6/9BQ=;
        b=tLV9THinxO7f2gUw1S5rwlAohkhi9/yyolAdQDS7rSKcP95tYTTxquAYrVD57rUnhj
         f4G8/uE8HHVIgmC0V1v9qP9BmVgu7BgfAXLRF2oVfbmIeGLmM+6sy+jfdgpzg9R8ewOS
         vVhHTPSS2CzMH40bBqGACZCq3spMrVy13wrfYfrnnQlrBbtuP2BhKuBXBxMroyUz5h71
         QGi/E28b+KWnc21Vsn/WJpPcNaRlLhu+0ZGdM69rQlcTA3ChcmUJagklV61kqqQ11Sdi
         3jDHLs52lZBpZiQ358NwGKcgCrgdR6PRAr533phL0j7oJuxPVi2gCvVPiwZiTNGOEaOq
         r4MA==
X-Forwarded-Encrypted: i=1; AFNElJ9wOuU4ufAHFnq5nM/xrZ46r+qOzKLHLpqqT/ZmgT1HnUqNMgXWw8/x1LRB/FQSLxTmL6kLiOCRBonD@vger.kernel.org
X-Gm-Message-State: AOJu0YxAyWjm+8S17Gpz0dHSnjVimrR11vOgi+il5hCty7oE6OBFaYO1
	UVSx+OgQ6+XP+C9dbhZ9kYLNkllHBoMmjSkOxmZw+WjKravPrxKUtFnOI/SUObXvGe43ynngb21
	gkp/b4A+CzwCZKYNM2Xi/wZ6WR/c3ohQFha8aV7eN369phgLfS5NotHvt9lac08rZ
X-Gm-Gg: AeBDievptwVLp7zuyfymfW/rdl4ChchOZgpzZNM7PtrQ+QvuHUX8Xffg4o2PknnHUOJ
	l7dx+zidcb+mNYMtdJUoDliStTf+nCwozyUC1LDJBnT3YISb9J52aiB0bMckE7j8ANcO65ER2Qk
	9aZvrJCd/hDa/C8GXy5QgwtXIGVgzRH5UNDJpVOHClYhwyxl4zy1pp9jw75kOsbpu6SmIDArqzK
	SlXuL5e3+GRs/oXchB/A9xHASnNcuy7Pww7nzKlWfT9Q7VIXR9r7i6lkMXbKUR87XioK0BOPkyt
	XaxuHLtrhRGqX4VWcoONHedfkp5vnmEjGqVr6T2u/7BVw0PnMGSupWT0Z6ALJZJYqNbeE733bvD
	BNZmWr7/BmGi0+9Tw359twrNWXLAtVe/Nn3UH4AquzyKfOAbF3g==
X-Received: by 2002:a05:690c:60c7:b0:79e:8299:7505 with SMTP id 00721157ae682-7af6ef4008dmr143218247b3.6.1776082974384;
        Mon, 13 Apr 2026 05:22:54 -0700 (PDT)
X-Received: by 2002:a05:690c:60c7:b0:79e:8299:7505 with SMTP id 00721157ae682-7af6ef4008dmr143217887b3.6.1776082973816;
        Mon, 13 Apr 2026 05:22:53 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7af400eb1fasm50781657b3.44.2026.04.13.05.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:22:53 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: [PATCH v1 2/3] pinctrl: qcom: lpass-lpi: Fix GPIO register access helper return types
Date: Mon, 13 Apr 2026 17:52:32 +0530
Message-Id: <20260413122233.375945-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: D3CAsHM77pfcooN13mQusziMQZG9uMyi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyMiBTYWx0ZWRfXwjacW7Ey9xCe
 VBlEMMxtR2psE5tqlbOwYp/XmM+a7Pk0dvZ7yr9Z5jBTCprvZydCw+sQCDw4VJfYx0xEyUnTlUu
 eSkT8aSoop11gmw5kHi5IuyhZcHL1SxO8gy9uR+Pg5F8SjY4/7mhV65vuRAqXb4zRApYchy5LnD
 igmpzghsmRcidT/Wy7YGcLtPPTXd3qzsPCbijouwlP04QQWsz7ijtUNC1NRgAuTvT0f2C505kFo
 0JJGnvEBJEXyYPzVXHLhdItiMIWd0ZdH2HlgWDavtKO1ZpA0hS97A9UU2fpaeo7AWB2uc2UF+9r
 EA3pTU8/q1huBws9JBBfLZXSxm/dK4tTEvaI5IxalvV/NArifosWlLUQFGXYDTCqf+Ssft6ut+z
 gHiPvtq1LQ6r68UilTTwR+LBIgi6m1dRqoy1itsG1WfFBJP3huV/Wvc+MbEpSoe0w5fYvNqsOVQ
 pcamUajwmcOuN5/muNg==
X-Proofpoint-GUID: D3CAsHM77pfcooN13mQusziMQZG9uMyi
X-Authority-Analysis: v=2.4 cv=QtNuG1yd c=1 sm=1 tr=0 ts=69dce01f cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1J4TlokszvnMI57PoO4A:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130122
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35088-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF1613EBDF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The LPI GPIO register access helpers previously returned the value from
ioread32(), even though their return type was int. This mixes data
return with status and is inconsistent with common kernel helper
conventions.

Rework lpi_gpio_read() and lpi_gpio_write() to return an int status and
use output parameters to pass register values. Update all callers to
match the new helper interface.

This change fixes the helper API and resulting call sites without
intending any functional change in GPIO or pinctrl behavior.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 66 +++++++++++++++++-------
 1 file changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 6d50e06ef..d108e7321 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -39,22 +39,26 @@ struct lpi_pinctrl {
 };
 
 static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
-			 unsigned int addr)
+			 unsigned int addr, u32 *val)
 {
 	u32 pin_offset;
+	int ret;
 
 	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
 		pin_offset = state->data->groups[pin].pin_offset;
 	else
 		pin_offset = LPI_TLMM_REG_OFFSET * pin;
 
-	return ioread32(state->tlmm_base + pin_offset + addr);
+	*val = ioread32(state->tlmm_base + pin_offset + addr);
+
+	return 0;
 }
 
 static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
 			  unsigned int addr, unsigned int val)
 {
 	u32 pin_offset;
+	int ret;
 
 	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
 		pin_offset = state->data->groups[pin].pin_offset;
@@ -107,7 +111,8 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 {
 	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct lpi_pingroup *g = &pctrl->data->groups[group];
-	u32 val;
+	u32 val, io_val;
+	int ret;
 	int i, pin = g->pin;
 
 	for (i = 0; i < g->nfuncs; i++) {
@@ -119,7 +124,9 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		return -EINVAL;
 
 	mutex_lock(&pctrl->lock);
-	val = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG);
+	ret = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG, &val);
+	if (ret)
+		goto out_unlock;
 
 	/*
 	 * If this is the first time muxing to GPIO and the direction is
@@ -129,24 +136,28 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	 */
 	if (i == GPIO_FUNC && (val & LPI_GPIO_OE_MASK) &&
 	    !test_and_set_bit(group, pctrl->ever_gpio)) {
-		u32 io_val = lpi_gpio_read(pctrl, group, LPI_GPIO_VALUE_REG);
+		ret = lpi_gpio_read(pctrl, group, LPI_GPIO_VALUE_REG, &io_val);
+		if (ret)
+			goto out_unlock;
 
 		if (io_val & LPI_GPIO_VALUE_IN_MASK) {
 			if (!(io_val & LPI_GPIO_VALUE_OUT_MASK))
-				lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG,
-					       io_val | LPI_GPIO_VALUE_OUT_MASK);
+				ret = lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG,
+						     io_val | LPI_GPIO_VALUE_OUT_MASK);
 		} else {
 			if (io_val & LPI_GPIO_VALUE_OUT_MASK)
-				lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG,
-					       io_val & ~LPI_GPIO_VALUE_OUT_MASK);
+				ret = lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG,
+						     io_val & ~LPI_GPIO_VALUE_OUT_MASK);
 		}
 	}
 
 	u32p_replace_bits(&val, i, LPI_GPIO_FUNCTION_MASK);
-	lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
+	ret = lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
+
+out_unlock:
 	mutex_unlock(&pctrl->lock);
 
-	return 0;
+	return ret;
 }
 
 static const struct pinmux_ops lpi_gpio_pinmux_ops = {
@@ -165,8 +176,11 @@ static int lpi_config_get(struct pinctrl_dev *pctldev,
 	int is_out;
 	int pull;
 	u32 ctl_reg;
+	int ret;
 
-	ctl_reg = lpi_gpio_read(state, pin, LPI_GPIO_CFG_REG);
+	ret = lpi_gpio_read(state, pin, LPI_GPIO_CFG_REG, &ctl_reg);
+	if (ret)
+		return ret;
 	is_out = ctl_reg & LPI_GPIO_OE_MASK;
 	pull = FIELD_GET(LPI_GPIO_PULL_MASK, ctl_reg);
 
@@ -293,17 +307,22 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 	}
 
 	mutex_lock(&pctrl->lock);
-	val = lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG);
+	ret = lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG, &val);
+	if (ret) {
+		mutex_unlock(&pctrl->lock);
+		goto out_unlock;
+	}
 
 	u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
 	u32p_replace_bits(&val, LPI_GPIO_DS_TO_VAL(strength),
 			  LPI_GPIO_OUT_STRENGTH_MASK);
 	u32p_replace_bits(&val, output_enabled, LPI_GPIO_OE_MASK);
 
-	lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
-	mutex_unlock(&pctrl->lock);
+	ret = lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
 
-	return 0;
+out_unlock:
+	mutex_unlock(&pctrl->lock);
+	return ret;
 }
 
 static const struct pinconf_ops lpi_gpio_pinconf_ops = {
@@ -352,9 +371,13 @@ static int lpi_gpio_direction_output(struct gpio_chip *chip,
 static int lpi_gpio_get(struct gpio_chip *chip, unsigned int pin)
 {
 	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+	u32 val;
+	int ret;
 
-	return lpi_gpio_read(state, pin, LPI_GPIO_VALUE_REG) &
-		LPI_GPIO_VALUE_IN_MASK;
+	ret = lpi_gpio_read(state, pin, LPI_GPIO_VALUE_REG, &val);
+	if (ret)
+		return ret;
+	return val & LPI_GPIO_VALUE_IN_MASK;
 }
 
 static int lpi_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
@@ -387,6 +410,7 @@ static void lpi_gpio_dbg_show_one(struct seq_file *s,
 	int drive;
 	int pull;
 	u32 ctl_reg;
+	int ret;
 
 	static const char * const pulls[] = {
 		"no pull",
@@ -397,7 +421,11 @@ static void lpi_gpio_dbg_show_one(struct seq_file *s,
 
 	pctldev = pctldev ? : state->ctrl;
 	pindesc = pctldev->desc->pins[offset];
-	ctl_reg = lpi_gpio_read(state, offset, LPI_GPIO_CFG_REG);
+	ret = lpi_gpio_read(state, offset, LPI_GPIO_CFG_REG, &ctl_reg);
+	if (ret) {
+		seq_printf(s, " %-8s: <read error %d>", pindesc.name, ret);
+		return;
+	}
 	is_out = ctl_reg & LPI_GPIO_OE_MASK;
 
 	func = FIELD_GET(LPI_GPIO_FUNCTION_MASK, ctl_reg);
-- 
2.34.1



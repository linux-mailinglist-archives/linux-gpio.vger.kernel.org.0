Return-Path: <linux-gpio+bounces-35260-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKA1B3Ue5mkMsAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35260-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 14:39:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8617142AD77
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 14:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5C1030C531D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 12:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145AC35979;
	Mon, 20 Apr 2026 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jM69qmsV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjOCjnaq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F7A3A0B2B
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688323; cv=none; b=GzfwYeLV304r/6NO4HcJ5gyrQIWUhGKvYvUBoH+3U2wuPVkonFDh91qgbZAUNCzB1evVbfMfjh0aM/aRTxMNYofP59Rlp9kLrN1Zm9KJ6VgIiCBEDBNeidr04jhOhNUAK6o/hW0cHSpo6z7gWiMkyCvEa08g//emyK3BvR32+VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688323; c=relaxed/simple;
	bh=RBUpwZ70RPQbPgmumF+Rmkz1kj7CY4tfG3vzA+uP9OA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UEs42oqn2mRSdgaBt8rsaXpKpHMGs5Ej3wN7oEBg4gx58xI3Fp0Q4jMr42CfpFhedBFDa2PfyueD83NtQPJGX4l+wliYCcYMbiPfxRRbSG0MAsj15ofLwDozmWGm7mWef/fiYvh/Fy37uNFkYDcLG4hL5QzzPHowTWMNMCyLXvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jM69qmsV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjOCjnaq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97CMO2755700
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 12:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0QwktVWI85h
	g7BDmt0yaUgnHhq7bSJQMuHPQVL+nHqY=; b=jM69qmsVM/7Hm5QVlCYPnGwL9E6
	NYyRq8+LB6sNJ+ch9j7AuqdlQthDFUdEy3UJJuEal55uDJhTYmb6bWUd4hNMJfDw
	Il6kfcwvOV8/PBEQp4+XPSKC02cVVCqJC+BKyUQs8lEQgEekgsnxcQm8FsN3tVa2
	0VdgbeiJqfwsn/BtASBsB7Tgju5jVTi/26iB2nQWe304PgqJWc7F8Cig8Kx2BIth
	HZcyYVSwSBRB6BXqBLNN8XSE2sZKw3J1lbT6/OZmGQjjmSRrfhRALcCnosabqHFe
	UuxE1yoQeGdqmbRxi8XEsp2Ew7sD5Ipni3ovLQfwhXF1q225F+8Vkq+XT2w==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xgnqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 12:32:01 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-79aa3a19ea3so45269587b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 05:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688321; x=1777293121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QwktVWI85hg7BDmt0yaUgnHhq7bSJQMuHPQVL+nHqY=;
        b=LjOCjnaqR4lytOTncvcHffGdo0Mp/5hv9ry2i8S8US5PxggNeyJaqXIb/WXPQpVhr2
         Pyjv8eeTprjzZ+//ILeGyHJyiZRxAXDnftSVui2YWlfHBKL6Vnm7YPEGauOOja0U4NXQ
         x6t5u8uLx9s0SU3/mmUR/RE6sqKvSZbKjuqVhR8wTm2/ZS2+KzlFOinuR6epBP8pqrY5
         sWmQ8Fi2/tAPFV+IMhv1NuTmRlM5+7zeJqL5KYnBWC00UO2YiMXqJSOzdGD+nZXNKfKT
         OhDBPQlJQEZglTl6NSCKQraARf9SF5koVzVC+NAWJFW9N1Vt+nIWupKw37XHs2hvyGMi
         cc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688321; x=1777293121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0QwktVWI85hg7BDmt0yaUgnHhq7bSJQMuHPQVL+nHqY=;
        b=tXtl7zyf9Y1GdzeVp/X6KlSmYaiHPBcxJe5PMTfJwBV3pwBi7BI1P2Jgiq67nF4WA9
         3UkQLRJICFg6RAa/BkfJ4An7hX9BWuP4MyyH6g5y/1b3bOCv1Az9Nz/asd6JDgSQP2T9
         XnHVuEOFtlzbCFp8fUjIt6h7hu97Yb3FKxxYVQlX7l9dZEkKn0719wBpvh45Nr1WpTJb
         wTFGib5ec9INJjx65kJrNByhxt/fQ+sHzasvkdWKSSBku+mllk7dF1qYhrkOzTf0AmSB
         ASXscUkhbc426H9JhZzQXPGVp5eVqMnUdyx4a7gvOFzhwVmZMgnlQLQhl3H2R5G2DevF
         ZQtA==
X-Forwarded-Encrypted: i=1; AFNElJ9rKU/KHKfXTpM47CenDcsu+XY4rG9VS0w64+So4uiAj8GE2rim9XS9Gsbi06SXz8geriz10cv7VlvP@vger.kernel.org
X-Gm-Message-State: AOJu0YytCw7zFSLnW3+4THoOo8wd8nol3biTpye/ydqwc8JKDe0/uHKq
	jKWmTR1riyNqey0W3pRMbvr/VqfPXDPts6kmt8+JdJKVs1o2lBiec3xHScqHZ9Uwy6MytJnuFyq
	vW12tr+TIoZUTreeCPoNfVuV/7bX27IJmf0uLFA6i9YbIDUEyMA2Yu/VhZcwGluRE
X-Gm-Gg: AeBDietfxuCohcdVzNs0HGPSa8Wc4ttFQ+jrAUyhILeBQXLKcMwZSlCMd+rHg0KrNsG
	QyO7RDxagR83mJQa3iKi1Fgjrq+dQo8g4OfZJJZkl9zxEfdir9guii21cp1KbWFwD4VhgJnXdQf
	K/ddciwV0XdaG5uaQD3sNJnDqxRQNhorrD8Vuu5ZJhx+8zDRvY5MlRxvnNUV5brdOLYMhxH7yRm
	ty5yM4sBmldsDPwIlstP1rPibe3bi40xGKP5WOQT7wmqE0eZHql+tLFkJIW1mXC14i6TieBIMdU
	qwo9EKSi+jR18eZgSLHaWq71sfv+Gmm0N+0eZmKDrNi6yrQVzS2zgar/+b1pTs/b+ZJ12S1LZ2y
	JgNFKfidxCRBvOf95M/PdnL/OTVT5qVUh08hQZHEWAvG9tEPviGCo1kYwmfNx
X-Received: by 2002:a05:690c:6601:b0:79a:dabf:cbcc with SMTP id 00721157ae682-7b9ed03ea6emr147508267b3.44.1776688320752;
        Mon, 20 Apr 2026 05:32:00 -0700 (PDT)
X-Received: by 2002:a05:690c:6601:b0:79a:dabf:cbcc with SMTP id 00721157ae682-7b9ed03ea6emr147507947b3.44.1776688320379;
        Mon, 20 Apr 2026 05:32:00 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee8be8e4sm44014267b3.14.2026.04.20.05.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:32:00 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 3/3] pinctrl: qcom: lpass-lpi: Resume clocks for GPIO access
Date: Mon, 20 Apr 2026 18:01:35 +0530
Message-Id: <20260420123135.350446-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
References: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfX+V9nKOerm2Vm
 GtgVZsSy3oMll7z25MDo1CVdtfZTJyC9c1KygJhCVPfl+AlghYpmRdWT4uhjqfsuuzfMyV+1gUY
 v5KBpG2BJuFE42t8CBSEcFB0+IJPCuPXMFktAdwReu6IbGD4d8zLcJldxg32g9jhh/rt5Vb7SjF
 EFFKq4oc8aeRX7rrcVYLAsOGZ5gs67QYE2PzB/jzSKneqbmVXSlBuwNrBqN0PCXhY+665OuXxZJ
 lHMVTN8SPnURU+dXWN8tQSxpyH3dC4lHQ0vdzafExMmf26u++auKO73SfIrRp997H8VeJe611dT
 /fo+OWS9Ml7B8rEIGiWrhkjnwoe8OkMTJY3paGEJVn/EF8y21keN5F1ukG2q+Pg7Lodo+BfWoY5
 UOws436vkzipJg5yXmiRf1pRx0Gykbhje1iQk7EixNmR89ZDtDIcWuK/TdJWam/mYMEiRvSQEQ2
 V++UlzCpALxIwRSw9Ig==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e61cc1 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=rvE_S6D2-Cyk851oGd0A:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: RLxyeJsarE1YpYsvkXr52vbiuV9gDRiU
X-Proofpoint-GUID: RLxyeJsarE1YpYsvkXr52vbiuV9gDRiU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200123
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35260-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8617142AD77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ensure the LPI pinctrl device clocks are runtime resumed
before accessing GPIO registers and autosuspended after
the access completes.

Guard GPIO register read and write helpers with synchronous
runtime PM calls so the device is active during MMIO
operations.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 26 ++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 2b0956ff2ae0..75ae21478fa4 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -38,32 +38,46 @@ struct lpi_pinctrl {
 	const struct lpi_pinctrl_variant_data *data;
 };
 
-static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
+static u32 lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 			 unsigned int addr)
 {
-	u32 pin_offset;
+	u32 pin_offset, val;
+	int ret;
 
 	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
 		pin_offset = state->data->groups[pin].pin_offset;
 	else
 		pin_offset = LPI_TLMM_REG_OFFSET * pin;
 
-	return ioread32(state->tlmm_base + pin_offset + addr);
+	ret = pm_runtime_resume_and_get(state->dev);
+	if (ret < 0)
+		return 0;
+
+	val = ioread32(state->tlmm_base + pin_offset + addr);
+	pm_runtime_put_autosuspend(state->dev);
+
+	return val;
 }
 
-static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
-			  unsigned int addr, unsigned int val)
+static void lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
+			   unsigned int addr, unsigned int val)
 {
 	u32 pin_offset;
+	int ret;
 
 	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
 		pin_offset = state->data->groups[pin].pin_offset;
 	else
 		pin_offset = LPI_TLMM_REG_OFFSET * pin;
 
+	ret = pm_runtime_resume_and_get(state->dev);
+	if (ret < 0)
+		return;
+
 	iowrite32(val, state->tlmm_base + pin_offset + addr);
+	pm_runtime_put_autosuspend(state->dev);
 
-	return 0;
+	return;
 }
 
 static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
-- 
2.34.1



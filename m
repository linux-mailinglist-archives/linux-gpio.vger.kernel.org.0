Return-Path: <linux-gpio+bounces-37687-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LZtJC+OGWpTxggAu9opvQ
	(envelope-from <linux-gpio+bounces-37687-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 15:01:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3CF602994
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 15:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5133C30F11C4
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC642E7BD6;
	Fri, 29 May 2026 12:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgKu/6MN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QC8NP/A9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F432E7635
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059367; cv=none; b=Y/i/1YlLW9McP4NEVrEMhII1OypbeNMD1e2F1coGCK7i2ac6e7p7HCtRPBkwG4cZBmFJHfPHoXGYJUyXBuF6Au1SEZBft/TMMqeeLX5zvhmCbrm5zmjM6Tw68G+zFo1onhbY/U3EbU0rT5jXQk3M4+lcwYP14fgbSsVQNytXdsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059367; c=relaxed/simple;
	bh=M00bEPH87L2hqdfG74skJWmkdYkajN/S65Eba5rePdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kC5vbvuHP60XMGvkvhr1c95WD4o16XfAAPQZ9H/uie6aDs2w4I2tCcwMywsKZTcInbKVD+neq9FUsldzD82qtQg1r5UyqjO/R5nn2+ey3LazaNjzp3gAR+17SD5Fj8vXQ9/tBPoU+k1oR4AGC/AQ1FQxHCidsdYRdAjVBZnLgx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgKu/6MN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QC8NP/A9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T79wd41829958
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 12:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFOO1F2PN8Tm4EiF1j5kBOZelJWzmU92HfyiYo4ThE8=; b=mgKu/6MN1AymhiQq
	OPYFY3zMqd5IB/ZH/RN/Jdof3Hw/t1V61NWGjeMobZZVb0iT5z3wbJR+VX1tVdyT
	HwoBqFMBQA2jZK7/KQMgvgMqyW0EpfzVxyKmXWRQ2SDv8JU/UuVw5h3qw1TlNOdx
	W2Bar+8tt0UhgFNLKyCzE3oItxZNFfneK/EV7acEfD3W/VxVbhjN8Mdgn7LzhZPZ
	RIz9GY7C2FLoJOQxGRPCGI11Ji12T6y/8wexUi0Cdf8GMrYfuLojvcoOZbW90NfL
	d888xD5hGFfkuzY3O5mP4PuJFIMpfN7LuJ31/Oz7CofSvFKn6kRIpOx8xOyJ89R/
	UMMXmA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m3b01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 12:56:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bc02d28b6so648156a91.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 05:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780059363; x=1780664163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFOO1F2PN8Tm4EiF1j5kBOZelJWzmU92HfyiYo4ThE8=;
        b=QC8NP/A9MEUqaprJc0wGtsur23a9v9BDYi8u5+h6XxxaqwQQk4A3wkyA3dPzvO8xKE
         kubL8ThYb0MXzL8bC0p8X45iCm7G/9xxY2pv0WT2RzZmXgy8EL6ATorcYmuYGBP4YA9b
         x5nODbirm43pThGm4e7KQs/yJMhV+mvgEFuJ4KsKb6GUXz3ZDOX/oa9QJcRs/2fqAcQF
         JTzEZb6wxneZUG9VaAyA7SiCsvzXh5sewj6+BIbSpqY9JreTX7Bb3RdsQhFy264gilR9
         bFlSKqMx3YUnxI7MSEIMHOib8MN45L24uHiKFXt5ncmpSxhE4qebRdDnWo0rATtYm6Cw
         AUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780059363; x=1780664163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cFOO1F2PN8Tm4EiF1j5kBOZelJWzmU92HfyiYo4ThE8=;
        b=Nc5umg8BLrc9a/cEbGErk8P+WaluQ4WtbLz2mrOn9vz5WwEXiZZkTge6NE+YWuGRZQ
         2pdXOU1e71aAsEL0ukgWfQtC+UvnzL3xL18rzIVpj1PCyvTaRs89tXT0KXHW1xowHpaI
         gGA7JkMozyKB/rEr96GStRYC4RWhdGPWcZcVcV6xy4ia8XAds0HYOPasXXp0oQte+URk
         ssHMUp16Jw092MEtzYUZ6iqQkO5PrTrrS0+NHBvr5liJJHRt9BGsgkLsOi1EteGcvcd1
         eWI2mCu0AZK40zXxKTAA8A7NRY+arJ/0UN01NQN/jJ42jR6Nm0Ps0sq+Z6AkCUfhqWM/
         jBaA==
X-Forwarded-Encrypted: i=1; AFNElJ/kCFBQawj1AlBO9jaRxcfYAnV+KL5ejfgl6mj5rHD3eBONKybx4asxaMfZL9bQWWvg9czZ+yQKotvg@vger.kernel.org
X-Gm-Message-State: AOJu0YyJJDWb/3estwherljQ+cBXvMidcZIrQaPO+KWiwO/jT8U3Uzt5
	S7K4ZiRxvu/lSBNIniI5j/3Jmd/tOq5m3wp90bSIAZ9fVbBnoAEaO31/01VcBFN12r3F/R6VPgY
	6rVDeEbEeMFwrsZYjt0O9rctlw+jzy0X/Fm4JT9974+IdVqaq0SRlKV4/hpxuLv/+
X-Gm-Gg: Acq92OHeEVRe6ZdnUnvRN9OtOMduIBnEFVDZYwmWvCksV6Fo/R7b7QDGtQvYWytO/qB
	DAHuqjXDupPCGP3YT4J0/QAXrec3IRj7GBnWnJf0N3HP34WK0ew/XXUoE80fl2xAbQpzWbzZALi
	hHyc8s5ktTWFaf2VzOROHNk5+qkVWa/5fYpTtgWPgGmjXvNMjmZvQjNld+zrL7EDMyYexJXjJja
	Qr7JFE7Jfid8SublDDl/V+KVTXDNdqq2mVmvAB9h/tgd4w+VnTMBrNaL3Z/sPohZfDyK53NO1ce
	7EFbV/tYvUTya0gwhu07LMaf8aZgBH7YkTY8NHaWcIfHKROcjCBpt+rBYM96vaIfP2/WAgAEE02
	abAOHKjr6AXPrTNL0ywY1gbakegTHPTZsLPjaIB4TbaN1ClDBF4QMnG5Qna2MiA==
X-Received: by 2002:a17:90b:2686:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-36bbcad64d8mr3337475a91.3.1780059363302;
        Fri, 29 May 2026 05:56:03 -0700 (PDT)
X-Received: by 2002:a17:90b:2686:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-36bbcad64d8mr3337451a91.3.1780059362812;
        Fri, 29 May 2026 05:56:02 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a7c24sm2119680a12.2.2026.05.29.05.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:56:02 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 29 May 2026 18:25:44 +0530
Subject: [PATCH 1/3] pinctrl: qcom: Modify MSM_PULL_MASK to accurately
 represent PULL bits
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-tlmm_test_changes-v1-1-88bfdccb4369@oss.qualcomm.com>
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
In-Reply-To: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780059355; l=1234;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=M00bEPH87L2hqdfG74skJWmkdYkajN/S65Eba5rePdQ=;
 b=RyFqC8pFWlGEILcdQYYqBa9ouUCvsHsqbgbRa6hrKUFkWsu/wWQ66PZnlSxBgaLLOJYhYRl1Z
 UsRbbAXZq5/BaRa55pOubPkU2KeHr5lgZL6nNr5ZoBitnOohaya0SGA
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEyOCBTYWx0ZWRfX2VAlP304ewxq
 318htpJXYGuwFzGOIpbOmCN9nQxUkohRdQXNWA1MOWaw2cQ5lhXYczqVIZ3CI//A30eSnh0gs7d
 amhqzaIXAelaRob1kJm6c1I+zectC6gNhHc6z3s6a1JrfrwmJvMVumnZYMHx0PmnKwO1ClqSbYW
 tVK9SJEBrDzbkf+i6wn0D1ZGNpco/OAIilrv2BUrjz3UTE5FpFQq42DrmkljTD3pt3dwzqRiljV
 pO8/5owy9vILfoIgH/V/WzFVtLueLkW7IfFhzyZdSBZZcyU9p4EjAz7eFCtU6tUXAhoyviWVpyL
 diEKIBYsc0sbxQhfvGeoY9fWIJtu+CyO1P5Aaftw114DGXeLbweOA7ij3SYT84l3X47FJiH5iFD
 hC73WUU8iLRk+nOkTsZ5VNyxsV/wSVtgPaJ52RQvNN3VU87oVyBnI/KwYIag8126Cx/Ywf0Om2U
 8Cnm23Z3taIixQ472Sw==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a198ce4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=n5PQqhqC1xgB2FCaNJQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: WQdJVuGGPEve8_9TzVbFJYgYA_TwhG6C
X-Proofpoint-ORIG-GUID: WQdJVuGGPEve8_9TzVbFJYgYA_TwhG6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37687-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A3CF602994
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MSM_PULL_MASK currently spans bits [2:0], but the GPIO_PULL field in the
GPIO_CFG register only occupies bits [1:0]. Bit 2 belongs to
FUNC_SEL.

MSM_PULL_MASK is used to isolate the GPIO_PULL bits before writing the
pull configuration (PULL_DOWN: 0x1, PULL_UP: 0x3) to the GPIO_CFG
register. Narrow it to bits [1:0] to prevent unintended modification of
the FUNC_SEL field.

This causes no functional change since the driver currently does not
modify the FUNC_SEL bit, but align the mask with hardware configuration
nonetheless.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/tlmm-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
index 7d7fff538755a2bcebf94dfb1ca00d4e9948c748..b655de5b4c5f08e7b138f0da24546274bc5fa93b 100644
--- a/drivers/pinctrl/qcom/tlmm-test.c
+++ b/drivers/pinctrl/qcom/tlmm-test.c
@@ -33,7 +33,7 @@
  * dynamically, rather then relying on e.g. Devicetree and phandles.
  */
 
-#define MSM_PULL_MASK		GENMASK(2, 0)
+#define MSM_PULL_MASK		GENMASK(1, 0)
 #define MSM_PULL_DOWN		1
 #define MSM_PULL_UP		3
 #define TLMM_REG_SIZE		0x1000

-- 
2.34.1



Return-Path: <linux-gpio+bounces-36814-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGj1Mw6KBWrGYAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36814-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 10:38:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ACF53F65B
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 10:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3118E301465C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 08:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2466F3DD533;
	Thu, 14 May 2026 08:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="In5dd/Z8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3fLC003"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67933DCDBC
	for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747912; cv=none; b=BjC1kKgGhaxhD9pcgQDRlV//S4TiWKjrur816V2BTngYslsVQ2AnFWeO0Wc5QrwAn3ZmB4b74KY5X+8Btv26ptsshyyAHGsTPVtvkCe5l/YAL6paSOYI7xifhXtzBnAeeroNU3U2m6yQmkDFuGO6box1giJi1RmpjTK9zVuc8Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747912; c=relaxed/simple;
	bh=i1221jkWAGJU33vbiEn0FDVAy4gg+YBRkE2HEzFn26A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T4oEwaa0QOy34ASkovx/R9osdjCT3HVEM3ZKzvht2uUGpOswD4UQOjfzrIZejOsjxppUgSTkVEZ29csecJm+j4NIntNg/WkYqZuyBR8xhWDbiwzM3iTbYg6JAZ4u4BEzbfRdh2h98nXc7CnGugLwhJUZB1vU+kuvexhVS4lli7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=In5dd/Z8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3fLC003; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E1rSvf1764143
	for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 08:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OPJFGpIwJN68tIJIhmYF4q
	5utOMu7J8pTBzQceAjv6M=; b=In5dd/Z8GLROUVsPQqoFL9DwfKN2d7BiCX5K3T
	REbh4Wl5RkaJ7yCNCISNFvH5o/OcC3C/V6ZVNMFy8XQUH3pZEg6ZKAFhn0YUzh3A
	AHPCqaFneP3biEC6y0BGkbtIMp4QlHw8K/L0rZr5iz7aZ8b9JaxzdMgzaN3fHxza
	+zrIFTLFRmqx2bg93ULzbMQd2RH/yhaZQ70EBU3dOzk0VGeUzLaYoDWrvFN17/ZO
	aag5rugkJ9eYu0rfAi4CU03ENJzirVG9ywv6nnKlGEDGjUcH9vBuFZQ/G59ycBay
	u9uyoamE81G7cXRMGUK9kc5/G6RWzhPfUMN4FMlq4BNZQSAQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e554a96kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 08:38:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso83739455ad.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 01:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778747910; x=1779352710; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OPJFGpIwJN68tIJIhmYF4q5utOMu7J8pTBzQceAjv6M=;
        b=L3fLC003XS8xvCs7LlPciItb5zUE1Kk3Uq4IbCxtq9kelv565wFsPsaMrrHkqJykEQ
         maL2Zd9rSu71SPah5XquQPpRKJD6EmQvrlnyMJVWSHCOcCKJaMT9fDQbTLSchodimskx
         4TEEcn4Xzlc8AxfBSI08z5K67+LtidOxAIjemvFpqpKmOlJ9Oq12JOMKnNdVmT3jmBdq
         LUrJ5V2jHtUcoZNQIZ5qwDe1/l+0vqEbqOOtKCGhEpg1847tpkSDayYoLokcrzWNOBK5
         EZ3KNuJeycm5vyOYhwewVfX62e4DdySLtXjG8MNcSEeQ+vFE+oJN5liiM3SgnvKGxnam
         IIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778747910; x=1779352710;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPJFGpIwJN68tIJIhmYF4q5utOMu7J8pTBzQceAjv6M=;
        b=U/kb0aFzdONRb9269yApFJiDf1KBcVpPVTcKTzzNczgzKXmDGUkPUfhX7hIjAgqr/8
         brQp5qTKEd7pt4O6OyL3+Y1exEm25Ti4GtlJBcKlr3+oRbDxYpwIkiOuILT7LTVIhjxJ
         n3iGJujE6Y8J4XhLlR13D89XtmA93skogZcG8gir3Ke+JSLDg2nWLEQqZNYtnvPPjniG
         baRpAMvHpfyzsweL+CtzTf1VyvPZO4Dbub72CHkUha/qbEkiLkLkaD6PiWp7prfrb55M
         6oIH+i80Y6ve04RlpWFRKKtrhPhmxMXqrG3PHeGv1Jzq8iWUlaqzeRodcUSLXaFSvsPq
         +A9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Ic6l+Gx1hDOVuLcHBEyJvm4pjYVD2qXmvLEKKSXfC5ih3n/6K1xYUyjnO2rI7J7L4jFwwcYhBHVum@vger.kernel.org
X-Gm-Message-State: AOJu0YwroWBGCkuBj1pPSl1tllH/B49NgJC/38leUsISVEL5CZx7ceQt
	3NunrNNZpxF9ADc0kAo45jKxQj/tTN/UjnlBIHINKbABKfwGLlHdadfwUWPRhlliQSF4DYg7sVw
	6B6qeIJejNy0nuaSbgrEWdPu2Llv0mRMbqEW2T8KkBm44LEDqhCwhUTDdYI1Xu2zC
X-Gm-Gg: Acq92OEU5hddPmi2Jqs/v2OblLnNz8OhfC6FCKOSTo3uSsh+frbYL2AqSGwHDaKFdJr
	wfw7sHh1AJN0FByR6MEnFmrdqd9hl1x07iqEF4vMmAWoJkrrIJz2mmC2VsFsVz5JkwQZxSlrAvC
	XfcoMBn6GPH/6m2g2jk1cme+8kW8KBMOdtr/fuSqRfuDuec8xRXhapJLx3ANcq3OHrNP5m3pHKq
	lpIngd4PVgMD1XbPe1XLgGWrYgO3qR2oSeMwT6IzJ0bPOlz8CISLJA5kYs4t+RdoHt+Sdev9Sre
	Gf61TudK6zH+9iFqCyu1LAlK+ajfD06O5P0Aaf+wr3MTQCrl9gOJNpILCcn11RlF+ZFXw9m1KTy
	hL8dxmoVgpSx+S8RSFN3iXKDmS5WPEMdQthdxhKYbCR3Rl+a2yA==
X-Received: by 2002:a17:903:32c3:b0:2b0:c90f:449d with SMTP id d9443c01a7336-2bd2fe21b31mr64624535ad.19.1778747910004;
        Thu, 14 May 2026 01:38:30 -0700 (PDT)
X-Received: by 2002:a17:903:32c3:b0:2b0:c90f:449d with SMTP id d9443c01a7336-2bd2fe21b31mr64624005ad.19.1778747909372;
        Thu, 14 May 2026 01:38:29 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd60275sm16200695ad.7.2026.05.14.01.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 01:38:28 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:08:25 +0530
Subject: [PATCH] pinctrl: qcom: Replace open coded eoi call with
 irq_chip_eoi_parent()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-pinctrl_msm_irq_eoi-v1-1-2d152f8695f8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAACKBWoC/yXMQQqDMBBA0avIrBtw1KbQq5QSNE7bEY06oyKId
 zfV5Vv8v4GSMCk8kw2EFlbuQwTeEvC/MnzJcB0NWZrZ9I6FGTj4SVrXaedYRkc9m7J65JbQ1gU
 ixHIQ+vB6Xl/vyzpXDfnpv4J9PwCOc33udwAAAA==
X-Change-ID: 20260514-pinctrl_msm_irq_eoi-ab736e16d411
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778747906; l=987;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=i1221jkWAGJU33vbiEn0FDVAy4gg+YBRkE2HEzFn26A=;
 b=YEB80AVCXPVqYr7GH7Xd9GQeS/VHOwb+2L1h/fOb5F9BuWyqaRVVY7P+kOd+2RLLRD/7e/2sG
 j3iTYoYRazGCW1Tfp7ZaXqlc/lJfSvVT/ohYM/dn0q5ga8wIOiTuwiH
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 8niko3fmpbpbo8iCH8xoqKAYVkJKoVer
X-Authority-Analysis: v=2.4 cv=Wag8rUhX c=1 sm=1 tr=0 ts=6a058a06 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2MiOTwD28NhBqraG7AEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 8niko3fmpbpbo8iCH8xoqKAYVkJKoVer
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA4NSBTYWx0ZWRfX9ZKFschSCY8S
 h6cIrlZGujt/XwIdJ4XGSPzLugRrAdFSwU460Cqhtj2p9o4DyGXPSsNfStjP4vK9Kv22ZfwrSE6
 XCTPU3sWnbLlqPHc/L9r1PipqGZRY/xATHJbjaChZTigGwvg+x07B4fKJJPz5F0uerFFA3oVmoG
 muI4sX9w7Ecep6GcLwmbJPk48scA1CB+F7LfBYcOuZYbKCos09tH0NO2FlUFCOejyufJiXjhcv4
 JYOLaVtHgBxgHp/ddK4FC5SOp1RZIDTV/ChOIqd61WVjl187eVux4uLuB6bZnSln0JFAIxTnZaQ
 rE5vIKHi3/ZslcRO3DndJH6aX9Y0l3HX07mBvFvphy/tFS8wYhlyce1cjkJF998V7Gpzt2m/9Zo
 eWgQhdnQo+QqNH+7Oc9p/HhJ2gz9ZtGxdK/+28Zp0yWI1WvcMFViDlvl/vN7xGv30Y1XrOSJPVZ
 RKYOLF84+up3zUewQhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140085
X-Rspamd-Queue-Id: 24ACF53F65B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36814-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Replace open coded eoi call to parent irqchip with irq_chip_eoi_parent().

No functional impact.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 45b3a2763eb8..6771f5eb29e4 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1012,10 +1012,8 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 
 static void msm_gpio_irq_eoi(struct irq_data *d)
 {
-	d = d->parent_data;
-
-	if (d)
-		d->chip->irq_eoi(d);
+	if (d->parent_data)
+		irq_chip_eoi_parent(d);
 }
 
 static bool msm_gpio_needs_dual_edge_parent_workaround(struct irq_data *d,

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260514-pinctrl_msm_irq_eoi-ab736e16d411

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>



Return-Path: <linux-gpio+bounces-31776-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFFWOKx0lWnDRgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31776-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:13:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A92153E8E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73FDE303FAB1
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 08:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F15B313547;
	Wed, 18 Feb 2026 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzBeFqWA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPr3YkpQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FE33161B3
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771402364; cv=none; b=kd8Py2N2fXxSGtR3etDWrscFsuSq3oTUviqu8IRYIzK69VMg6XLiQFKDo7hPUE+xZ7BcnKFy1LudJOnDFrAzJiyQL9J8VfNE/6dy+1Wx5bjBGE+3ZlTqP4XOMeuFWLP+DcBYT98ZJgdEtXV/Y+1yx4yo8CcT60Eukq+vO3bE65o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771402364; c=relaxed/simple;
	bh=zi60RThwEC6uT58cj6Q/kkhix9+cyecfzrsXBYVuP1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c+K32X3E8YUdiubep6SshgG5YDnTQY8teu2yTmuw4Szf48WSQEZk24o68OiIeY6KhkaMPoyXAzGfJP1jSN0Vd51CpwOQwsqKsCcNcX9WIytSbTsjwXOxLULMSA4NVvdoJDW+aGRIIGFmeZ1IZ+uMtBg+47Kbe2QNuCd0g92Rons=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzBeFqWA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPr3YkpQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HKWw5t3693985
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Abn9qINMymGVFN5Pnfphqo7NCfbB6ioA+GMclfrnZvM=; b=TzBeFqWARdJ1hxzi
	FmZhJzxUQylNXHMWvg72sXWQQbKOoARmMAtAV/2yq3gYHtoKXaFtx0QmY0KBsjTh
	T4CQve3z+0cm8poATq1DvMpcFzdShtFRZNbuXVpe+2dajGzMcEQW11XBV/wJc3u4
	RCh99mNQtalVtSIZU4ucWNYjjMVGpfmeSjZnI4SRcXBPpTkF0qZp6IjjiE93/OCb
	aXFBVxxu1TilZEmIrw6ZGbM/cxmU8Pu/QOdizUb9gk7ERxuXq0SXUoM/oEshpcrF
	2ujdHvo4mNk4Cc4pmpHXOhJKZwcjHJ3bNuYO5wXwWAkuCCOdPNM7wnqz6Ukgzu0r
	VFIA1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccyfb1j75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:12:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a8fc061ce1so291307525ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 00:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771402360; x=1772007160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Abn9qINMymGVFN5Pnfphqo7NCfbB6ioA+GMclfrnZvM=;
        b=LPr3YkpQr0vduW24PN/i2PTJ2ReMcibeTZsO1g2bBkXDOplOUeebxZs1slGvKchhh6
         jft90iO7BMCrjKNBYHw/kMSb7xII0V7krpl1+NzDrtt4if82gdmr1fZvN3X6bnzLmPy/
         pWu5hrbyphVgVEZk9phvOFOogrN2S6iMqTrXAh5kmlijFDRSGMC5bUhSQTrHyAqH+fJO
         eVXByOHIzhaw4Ao8o+ybQaTGr6RFgUBWJJ/c+nYD63X7pqsarQKqzUn9NIO0kaTjXamm
         pqLzNmUX11rZetqIPY3j/x5jn+fo3TsbVS/B2ji9c05dS0Ur+lfXRZfiyErQe+J7Jxa1
         CJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771402360; x=1772007160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Abn9qINMymGVFN5Pnfphqo7NCfbB6ioA+GMclfrnZvM=;
        b=GPpFJ+g+yE3JBb7gj9rSzj7VisZeMPZBZfr7l/+OAbFYsRfE8CKXBGFSlEuFFGKPve
         Kv61irrdjFOgpfsCSFkSjL8C870dhCdDeDJeJQTehR7xMASCu5woCsbIvdsYtOB0zKZi
         3PfLqERY25JWANeui2dCCJZJr+BN46C4kGIXqiet03AxeJlB/5AqarlcIA7rgiCbNVjn
         TqxA5CHCFkC4OjMczcYXjbj9mSHuKwcK+Elwe1OYaSUsQGkRaUEv1gJppzf+CUxUYP7U
         qvYdipvWvHILGIHbBmEEME8naGraE1XcNcMWjRlw75zSK896LB+XHil+TnQURS9YQNG+
         afAw==
X-Forwarded-Encrypted: i=1; AJvYcCVzpV8YdWxBA/VaN47OHWUEhGgXHhWuGmYw2nDmP589ONnWJlFWa/HnC1LbJSPBYw8oFUvvki7CtAhk@vger.kernel.org
X-Gm-Message-State: AOJu0YyHJMk02YCoCmtKCLFstUi700BtZwhG42O6ofByTKBcUnevCAoK
	vA/Cc1GKfBAfcSJDsnLV0rJcjeW5di5CwekpT9abX89KoX1HgjevfZ5KL2y7Ty9Lqwuz4msXTjp
	kBv6F5HyvOira80pGj1ATJXnnDX4pyUiy3PtHb3+I72l1WfIdU47DYzgFDG7NjELm
X-Gm-Gg: AZuq6aLQk22Xjl2uqjI5UspQvooNm3e+MjeGWMT2l9aeBLA1CdFQRvAF9pTN3SDBctz
	kYIxFn5iE+lfFKpy9oRG735/XvPRxFyZHl6gvl/R866RUzb69zrkJ19vA6d39oUTAe4DkYpkMJR
	SsVVcMDarc3z7rLTe7babmjH2Jpg/75zDx9GqwPTmmyZrJMXZx9FokaRdlWK1hQOOd91k+fXzO3
	qg57uPdEhUsOfOKGtngdElv+negXrcdH4rc0tkJJgte2saRTfju2GGdacN0CxB2nG+QkN9HDdEW
	dUb0rg7EMj+k3/gPwOC/iGrTb+AU/KfXHOXtx4OkA6WdFQKNmCgXCkj7E4XGjzpcZ9OmYK1ae2U
	z0OONrKOflzfNtxgWLlnUnj6jUDyAUvUJlvq2k6bLVVtiETSQqK1NSex0
X-Received: by 2002:a17:903:1a07:b0:2aa:e39a:a7c4 with SMTP id d9443c01a7336-2ab4cf4f7f6mr150956275ad.1.1771402359580;
        Wed, 18 Feb 2026 00:12:39 -0800 (PST)
X-Received: by 2002:a17:903:1a07:b0:2aa:e39a:a7c4 with SMTP id d9443c01a7336-2ab4cf4f7f6mr150956045ad.1.1771402359100;
        Wed, 18 Feb 2026 00:12:39 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d624esm118123685ad.49.2026.02.18.00.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:12:38 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 13:42:23 +0530
Subject: [PATCH v7 1/3] PM: sleep: wakeirq: Add support for dedicated
 shared wake IRQ setup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-wakeirq_support-v7-1-0d4689830207@oss.qualcomm.com>
References: <20260218-wakeirq_support-v7-0-0d4689830207@oss.qualcomm.com>
In-Reply-To: <20260218-wakeirq_support-v7-0-0d4689830207@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771402347; l=4919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=zi60RThwEC6uT58cj6Q/kkhix9+cyecfzrsXBYVuP1k=;
 b=noK8LQipAKG2D7C1FRq6ywjqy7FzAkbdoYSMHusSRkOVbJWZkG8O8YGXJVGOnOPjcZDn+4PLL
 FA48oqomtubDXYh3Cim6SO/3o29N4jvqzUymr5+J38HDqDQfqXnQHmC
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: oDj1Elos60QnE9oEYOW1JcrE3ZbPUFpd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA3MSBTYWx0ZWRfX59hh/ipMb2kx
 X2R4jAoT1e+Vjcc3sWZEV2eN/9NQK/JQCo6gQyjU8f/OEfVxf4kwMxsFMhbSX1ZgZqJb5iNNbOk
 04Ltfu8LNCutEHPMxA3xUOSmzYMo8qMiZui7+XqqmpSOGOo0lQZ67zvs7/MYefdT/aJTWQ2PSrU
 BGaYR7M5DEPCiuw2LZeqTbR5CwX+2WU/dihsen3lxQsdKn+PmZ5nwah2PJnU5bXhBUDIVUl2GIY
 +iqpj8UeeVouZvXgnjLsM380WQKbsQgA/6az5iSHGojneZYumCOLSVlbVeIYUeJqU8aQWkSfGHr
 r4bm0DLu2Zr4r4lAHFubS0/o9km4AuAX+sVOM3rbH4/3Cg5sSXG4twAzIPnHmAr/61aGw9EvT4n
 TP2PEbXcM6JrzVEM4IaPA9AlFePwfdpMjUg0bDTXHZzs6Kdlkd98Px7VXnoBeSNobZkWLvkjNWe
 HoTfQymvvHhdXaqs6Mw==
X-Authority-Analysis: v=2.4 cv=JNo2csKb c=1 sm=1 tr=0 ts=69957479 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=GqrSgIjjxmp09zFQf4gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: oDj1Elos60QnE9oEYOW1JcrE3ZbPUFpd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31776-lists,linux-gpio=lfdr.de];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 46A92153E8E
X-Rspamd-Action: no action

Some devices require more flexibility when configuring their dedicated
wake-up interrupts, such as support for IRQF_SHARED or other IRQ flags.
This is particularly useful in PCIe systems where multiple endpoints
(e.g., Wi-Fi and Bluetooth controllers) share a common WAKE# signal
line which requests platform to re-establish power and reference clocks
to the components. In such cases, drivers can use this new API
dev_pm_set_dedicated_shared_wake_irq() to register a shared wake IRQ.

Update the internal helper __dev_pm_set_dedicated_wake_irq() to accept an
irq_flags argument. Modify the existing dev_pm_set_dedicated_wake_irq()
and dev_pm_set_dedicated_wake_irq_reverse() to preserve current behavior.

When IRQ registered with IRQF_SHARED we can't use IRQF_NO_AUTOEN flag,
so after registering for irq, disable it explicitly.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
---
 drivers/base/power/wakeirq.c | 39 ++++++++++++++++++++++++++++++++++-----
 include/linux/pm_wakeirq.h   |  6 ++++++
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/base/power/wakeirq.c b/drivers/base/power/wakeirq.c
index c0809d18fc5406b224206e0c8e5028aa8f4183b0..a3ac133496d1aadd31a2a9517322f4ff1c5be7b4 100644
--- a/drivers/base/power/wakeirq.c
+++ b/drivers/base/power/wakeirq.c
@@ -171,7 +171,8 @@ static irqreturn_t handle_threaded_wake_irq(int irq, void *_wirq)
 	return IRQ_HANDLED;
 }
 
-static int __dev_pm_set_dedicated_wake_irq(struct device *dev, int irq, unsigned int flag)
+static int __dev_pm_set_dedicated_wake_irq(struct device *dev, int irq, unsigned int flag,
+					   unsigned int irq_flags)
 {
 	struct wake_irq *wirq;
 	int err;
@@ -200,8 +201,7 @@ static int __dev_pm_set_dedicated_wake_irq(struct device *dev, int irq, unsigned
 	 * so we use a threaded irq.
 	 */
 	err = request_threaded_irq(irq, NULL, handle_threaded_wake_irq,
-				   IRQF_ONESHOT | IRQF_NO_AUTOEN,
-				   wirq->name, wirq);
+				   IRQF_ONESHOT | irq_flags, wirq->name, wirq);
 	if (err)
 		goto err_free_name;
 
@@ -237,7 +237,7 @@ static int __dev_pm_set_dedicated_wake_irq(struct device *dev, int irq, unsigned
  */
 int dev_pm_set_dedicated_wake_irq(struct device *dev, int irq)
 {
-	return __dev_pm_set_dedicated_wake_irq(dev, irq, 0);
+	return __dev_pm_set_dedicated_wake_irq(dev, irq, 0, IRQF_NO_AUTOEN);
 }
 EXPORT_SYMBOL_GPL(dev_pm_set_dedicated_wake_irq);
 
@@ -258,10 +258,39 @@ EXPORT_SYMBOL_GPL(dev_pm_set_dedicated_wake_irq);
  */
 int dev_pm_set_dedicated_wake_irq_reverse(struct device *dev, int irq)
 {
-	return __dev_pm_set_dedicated_wake_irq(dev, irq, WAKE_IRQ_DEDICATED_REVERSE);
+	return __dev_pm_set_dedicated_wake_irq(dev, irq, WAKE_IRQ_DEDICATED_REVERSE,
+					       IRQF_NO_AUTOEN);
 }
 EXPORT_SYMBOL_GPL(dev_pm_set_dedicated_wake_irq_reverse);
 
+/**
+ * dev_pm_set_dedicated_shared_wake_irq - Request a dedicated shared wake-up interrupt
+ * @dev: Device entry
+ * @irq: Device wake-up interrupt
+ * @flags: Custom IRQ flags (e.g., IRQ_TYPE_EDGE_FALLING)
+ *
+ * This API sets up a threaded interrupt handler for a device that has
+ * a shared wake-up interrupt in addition to the device IO interrupt. It also
+ * sets IRQ flags like IRQ_TYPE_EDGE_FALLING passed by the caller.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int dev_pm_set_dedicated_shared_wake_irq(struct device *dev, int irq, unsigned long flags)
+{
+	struct wake_irq *wirq;
+	int ret;
+
+	ret =  __dev_pm_set_dedicated_wake_irq(dev, irq, 0, IRQF_SHARED | flags);
+	if (ret)
+		return ret;
+
+	wirq = dev->power.wakeirq;
+	disable_irq_nosync(wirq->irq);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dev_pm_set_dedicated_shared_wake_irq);
+
 /**
  * dev_pm_enable_wake_irq_check - Checks and enables wake-up interrupt
  * @dev: Device
diff --git a/include/linux/pm_wakeirq.h b/include/linux/pm_wakeirq.h
index 25b63ed51b765c2c6919f259668a12675330835e..61f1e840745b56baa57db37563e450cb2d757a85 100644
--- a/include/linux/pm_wakeirq.h
+++ b/include/linux/pm_wakeirq.h
@@ -11,6 +11,7 @@ extern int dev_pm_set_dedicated_wake_irq(struct device *dev, int irq);
 extern int dev_pm_set_dedicated_wake_irq_reverse(struct device *dev, int irq);
 extern void dev_pm_clear_wake_irq(struct device *dev);
 extern int devm_pm_set_wake_irq(struct device *dev, int irq);
+extern int dev_pm_set_dedicated_shared_wake_irq(struct device *dev, int irq, unsigned long flags);
 
 #else	/* !CONFIG_PM */
 
@@ -38,5 +39,10 @@ static inline int devm_pm_set_wake_irq(struct device *dev, int irq)
 	return 0;
 }
 
+static inline int dev_pm_set_dedicated_shared_wake_irq(struct device *dev,
+						       int irq, unsigned long flags)
+{
+	return 0;
+}
 #endif	/* CONFIG_PM */
 #endif	/* _LINUX_PM_WAKEIRQ_H */

-- 
2.34.1



Return-Path: <linux-gpio+bounces-39577-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vS+/KgLHTGpvpgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39577-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 11:29:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F81719C8C
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 11:29:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aktum5A8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C4+oYQdm;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39577-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39577-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B664630F2F5E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 09:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4479F395D86;
	Tue,  7 Jul 2026 09:22:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632BC3955F4
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 09:22:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416131; cv=none; b=czF1WibNPODO0VxU7cebI/a5tJKIGmRJ6se6zNQZ63EyoxkdBBFVlSwy6nFTV1cRaWM1ZbyS9kmyQz9xVVhDBgUaalnywDjIl9BuFkzS/M4upu/RpJe7ywlxydeKdkrxw1vgGEjtXpAFiDHI3blpw4qNEcALdeoC7tNcu2/WVLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416131; c=relaxed/simple;
	bh=iIypVGyuS304ik55LC/+1+p4PpbCAO8l2ge6+Qt/0Oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ut7y3znNdWwarZHgEhYhD8uipfwKkNGwaDBVW8Cvyp+zX6smuy7BDWyamNxlb3Z3+T1Gw7KUPY3klceIwm9v7L6OohOKiqQkn274tYYoAdMrlDZM2eLjmxzHIlCy2CZXS+4SK84qAzo3QsdwbO2B8V+ZREowPW7DlmAwokpRw8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aktum5A8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4+oYQdm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dkfx3219402
	for <linux-gpio@vger.kernel.org>; Tue, 7 Jul 2026 09:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDlAkrCqT9NozHhkbpvjYoApBdb1EPmLolFbdYGcZHI=; b=aktum5A8CXa2eEzt
	sN1AhgFA4xp6GfyrRpIDdwTSdh+iaFXNcEzfEQHr4oDhnGrbq91rKs52BfXfNk3G
	0elW2PwYBw/Y7Wbf3WOIn3R/7uY9Lm74Kmy4p4MNT5itis54ANw2wrnr9Km1vnpz
	bd98eI7oLjpQnzXnsj2izI8ghwKQ+XnplTghkTZaz9zZqDK5NKO8O97NirY7AmwP
	xvdC5fY6QV4gHPgQwvoMlPuc/reJxQ7XC/6pqzKVWpLiQGbSqAWozFMUF3GGR6NM
	qX4O1jBCHxHnFxZ8aPZVdCqPLjXIWugBQnY8uNC3kyRRQ+MTOPlHG5vjEMvl7vI0
	KKi4UA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep0cg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 09:22:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7f385887bso62791145ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 02:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416128; x=1784020928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDlAkrCqT9NozHhkbpvjYoApBdb1EPmLolFbdYGcZHI=;
        b=C4+oYQdmqDrZBDe3KhttfM6NX89a+37mF2U4nGH8mS1+Axm0H29YHRLFQKUaAYznPu
         Q+oI1/XMOyTwjmntvG1rwLf+hldO/4xlAF1ssPMPDpQxDB5highRn3sZkbGdnWIcUwrn
         cfMMBcaxpXU5jjnFL2pNLWigMKrGpBvYuefvHMeBcRx7wQ8HCw5Pws74ekNfyUYFw00L
         10IUV8I8xn7Dzpj7MvbBkUHmDdzZ3u6YzfYd2LI3iX3AOCbm/FhGU8BC5Ha76cWiCAO0
         eJbnfzOTgl1FYzXdaQbjjETMpj2vc81qMAufaWay4Ueunp3pS3HXPPpzp/Q5Ad923fjP
         6hSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416128; x=1784020928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDlAkrCqT9NozHhkbpvjYoApBdb1EPmLolFbdYGcZHI=;
        b=gKcVmUZVONk6bLVYCMfV9kbpHkeYWe3gR2BKEMx5c3G2k0tNncCL1u+oD1izmMo/p2
         JYzSb3OuXO0cH+5v+bXVKO2gtHM8ybZMav3PUybM8z2VKcDbuYB2KqJvmA/02jn73LPw
         EbUSwgER4e4P8DuRW/SCjU/Lf7bntixrWYbxbe5B0aQTiJzj1cnlie0YIYyJB7BZQc1+
         CTE9fky74pfqhRgNn/btHsJPcpu7CVkPbMbXA5uD6M5nARl0T/0J6wn7+90kj63De0iD
         8ljc4PaeqnS6J4KylBP1j3WydazvAM1O0GIDIcTEzfaA3AnCUOLnJww1+5BQoHUhKRvt
         ABTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7A4JQqcq4Jue5cQBwznZwUHRRbHeIVlbziXq73Cwu7D43THG9xBEhQPwaN2vi4qiULLwKDr/Ou0I1@vger.kernel.org
X-Gm-Message-State: AOJu0YyLeZKONXpDV0BO94eBEj1ZFyzvvDWsa6YP67OI367c2sqWpht5
	Fk9cmpv/YNLeLY+KheJz+87vhf7ggspCIq0OHH74teL6n1mBlwZbkj22CfHQ+TDxZOUI5d8UI8J
	wxg1n/jK8fpZSKxkvKljT8F6RvLJZ1TMcZcKCGjaJQM92VL00EswGmZnuEBRCbhQh
X-Gm-Gg: AfdE7cld9uy2sSB8UnEOXJn8ffGCx88KWbH5DhRhOfn4PltzLFy/oImwV/bJwMuk6uU
	ilnn9MR9ImWPDUIQEmX3oa9npShwpOHomJKuH/oRsrOZN/k5hW94qwd8V208mLQgf60UbfK4MyB
	6ATqonb4NIOvLAAt1eON6wxclzMaiXPBLdMoQ0oEpZk2DfG0uyDGJkUNpa1dNZkOsWI5kpnWl0H
	/J3zDIei3q7jrGnwUn8+cwKri5GkM3on6aGJ9ZciWldncvvcvVVXhHuAf/pVw/ogjkDbKfCkE03
	0KqEX8xNpVONcShaQVfZFMgznmDT0nRidyKIY3oYg/1R9djYVwi/CBk6fn3bCc5Evp+AbiDhO2r
	fQBFY/7JoF/8V8yhTICelbCWnEnY+w3hxY8PQL/I=
X-Received: by 2002:a05:6a21:69a:b0:3a0:b781:4c78 with SMTP id adf61e73a8af0-3c08ecaff36mr5511304637.15.1783416127880;
        Tue, 07 Jul 2026 02:22:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:69a:b0:3a0:b781:4c78 with SMTP id adf61e73a8af0-3c08ecaff36mr5511268637.15.1783416127374;
        Tue, 07 Jul 2026 02:22:07 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb7534sm658864a12.12.2026.07.07.02.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:22:07 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:51:34 +0530
Subject: [PATCH v4 2/7] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-hamoa_pdc_v3-v4-2-dfd1f4a3ae89@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783416112; l=6947;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=iIypVGyuS304ik55LC/+1+p4PpbCAO8l2ge6+Qt/0Oo=;
 b=Duti58sKIKBLcJgTZzIo+9dlwZ4chpw+7PO5YKQrrxBkl8sdmIEPe2kzra3hmhPM82rnFhkPS
 UShW35X/+u+BXNTJRpXa/O79LPIA8XwDY6I/vcdTRT/gdDPI3ojqcXt
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: ClZDE7c6c-9vXrpkd6DQGFs4mROSix-B
X-Proofpoint-ORIG-GUID: ClZDE7c6c-9vXrpkd6DQGFs4mROSix-B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX4AfGBRppWDn6
 b9D2ggw8ugZ51uDEoFd6BdweUhRM4XZOhdH8oPDhuxZJcoEmuTHDNmq2BQDHFlFrFEtITdACdNh
 3itQQcf3pts/rIHMszdjhBBXoR1J9guVNxF+uECL8y2QXCf6nl79HtlmtjMBDSsTtBJ23qtxYn7
 ++fqKR9XHgzj46Gq/uJrMivNgmzC7NSUCWAgSG428gLSq7RN3YeXtcn65i6WRH5ynNAdeOhXh+0
 rGi7DymMztaw/6Egn+Cygawcp97VoxSPlJwWJvVGTfnzv4FDJfU8qO0XhJ04xfpow87Mp95xEfx
 vYELnPkWyvizr6YCsE/cnhZI9TkDaSPUr43o4dIyzxfQhlb81Z9z2ZRbPbxRLRsUBYRXX1w52KI
 HD5RrMoyYCMbXutg0pQe0+BuBEvUdBHjTxTbdp5ZjbvjrmAxImmVl3ZI4QCZEolt3ojT8VYHUo7
 jajW6I5Kpp9+Vz+9Lzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX3eKnfd4xiD1U
 aeHTb7qPRkhS6KF8vkuyxk/Lqu1Qe4/5FcJeSWczeGeiB8fC7o6C5gi7DW7M/Qh6tK27MMFc0Ue
 sM5/XxAkcnUXg79DQqr7lP7blgDBIgE=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4cc540 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VSgcN4lfnCTbbQGmJlYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39577-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51F81719C8C

There are multiple statics used. Move all to struct pdc_desc to better
align with versioning support. Document them.

Add pdc->enable_intr() function to point to respective version specific
enable function. Remove pdc_enable_intr() and __pdc_enable_intr() and
invoke pdc->enable_intr() from caller.

Locking in pdc_enable_intr() applies lock to all version specific
pdc->enable_intr() however lock is needed only for pdc_enable_intr_bank()
which uses a shared bank across on PDC v2.7 and PDC v3.0.

pdc_enable_intr_cfg() do not require locking as IRQ_CFG registers are one
per interrupt. Move the locking to only pdc_enable_intr_bank().

No functional impact.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 84 ++++++++++++++++++++++------------------------
 1 file changed, 41 insertions(+), 43 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index a77d1d334062..764f7965cfb8 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -92,15 +92,30 @@ struct pdc_irq_cfg {
  * @base:           PDC base register for DRV2 / HLOS
  * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
  * @version:        PDC version
+ * @region:         PDC interrupt continuous range
+ * @region_cnt:     Total PDC ranges
+ * @x1e_quirk:      x1e H/W Bug handling
+ * @lock:           lock for IRQ_ENABLE_BANK protection
  * @regs:           PDC regs (IRQ_ENABLE_BANK and IRQ_CFG)
  * @cfg_fields:     Fields of IRQ_CFG reg
+ * @enable_intr:    pointer to enable function based on PDC version
  */
 struct pdc_desc {
 	void __iomem			*base;
 	void __iomem			*prev_base;
 	u32				version;
+
+	struct pdc_pin_region		*region;
+	int				region_cnt;
+
+	bool				x1e_quirk;
+
+	raw_spinlock_t			lock;
+
 	const struct pdc_regs		*regs;
 	const struct pdc_irq_cfg	*cfg_fields;
+
+	void (*enable_intr)(int pin_out, bool on);
 };
 
 static const struct pdc_regs pdc_v3_2 = {
@@ -138,11 +153,6 @@ struct pdc_pin_region {
 
 #define pin_to_hwirq(r, p)	((r)->parent_base + (p) - (r)->pin_base)
 
-static DEFINE_RAW_SPINLOCK(pdc_lock);
-static struct pdc_pin_region *pdc_region;
-static int pdc_region_cnt;
-static unsigned int pdc_version;
-static bool pdc_x1e_quirk;
 static struct pdc_desc *pdc;
 
 static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)
@@ -196,10 +206,12 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 	index = FIELD_GET(IRQ_ENABLE_BANK_INDEX_MASK, pin_out);
 	mask = FIELD_GET(IRQ_ENABLE_BANK_BIT_MASK, pin_out);
 
+	guard(raw_spinlock_irqsave)(&pdc->lock);
+
 	enable = pdc_reg_read(pdc->regs->irq_en_reg, index);
 	__assign_bit(mask, &enable, on);
 
-	if (pdc_x1e_quirk)
+	if (pdc->x1e_quirk)
 		pdc_x1e_irq_enable_write(index, enable);
 	else
 		pdc_reg_write(pdc->regs->irq_en_reg, index, enable);
@@ -213,32 +225,15 @@ static void pdc_enable_intr_cfg(int pin_out, bool on)
 	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, enable);
 }
 
-static void __pdc_enable_intr(int pin_out, bool on)
-{
-	if (pdc_version < PDC_VERSION_3_2)
-		pdc_enable_intr_bank(pin_out, on);
-	else
-		pdc_enable_intr_cfg(pin_out, on);
-}
-
-static void pdc_enable_intr(struct irq_data *d, bool on)
-{
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&pdc_lock, flags);
-	__pdc_enable_intr(d->hwirq, on);
-	raw_spin_unlock_irqrestore(&pdc_lock, flags);
-}
-
 static void qcom_pdc_gic_disable(struct irq_data *d)
 {
-	pdc_enable_intr(d, false);
+	pdc->enable_intr(d->hwirq, false);
 	irq_chip_disable_parent(d);
 }
 
 static void qcom_pdc_gic_enable(struct irq_data *d)
 {
-	pdc_enable_intr(d, true);
+	pdc->enable_intr(d->hwirq, true);
 	irq_chip_enable_parent(d);
 }
 
@@ -350,12 +345,10 @@ static struct irq_chip qcom_pdc_gic_chip = {
 
 static struct pdc_pin_region *get_pin_region(int pin)
 {
-	int i;
-
-	for (i = 0; i < pdc_region_cnt; i++) {
-		if (pin >= pdc_region[i].pin_base &&
-		    pin < pdc_region[i].pin_base + pdc_region[i].cnt)
-			return &pdc_region[i];
+	for (int i = 0; i < pdc->region_cnt; i++) {
+		if (pin >= pdc->region[i].pin_base &&
+		    pin < pdc->region[i].pin_base + pdc->region[i].cnt)
+			return &pdc->region[i];
 	}
 
 	return NULL;
@@ -411,35 +404,35 @@ static const struct irq_domain_ops qcom_pdc_ops = {
 static int pdc_setup_pin_mapping(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
-	int ret, n, i;
+	int ret, n;
 
 	n = of_property_count_elems_of_size(np, "qcom,pdc-ranges", sizeof(u32));
 	if (n <= 0 || n % 3)
 		return -EINVAL;
 
-	pdc_region_cnt = n / 3;
-	pdc_region = devm_kcalloc(dev, pdc_region_cnt, sizeof(*pdc_region), GFP_KERNEL);
-	if (!pdc_region) {
-		pdc_region_cnt = 0;
+	pdc->region_cnt = n / 3;
+	pdc->region = devm_kcalloc(dev, pdc->region_cnt, sizeof(*pdc->region), GFP_KERNEL);
+	if (!pdc->region) {
+		pdc->region_cnt = 0;
 		return -ENOMEM;
 	}
 
-	for (n = 0; n < pdc_region_cnt; n++) {
+	for (n = 0; n < pdc->region_cnt; n++) {
 		ret = of_property_read_u32_index(np, "qcom,pdc-ranges", n * 3 + 0,
-						 &pdc_region[n].pin_base);
+						 &pdc->region[n].pin_base);
 		if (ret)
 			return ret;
 		ret = of_property_read_u32_index(np, "qcom,pdc-ranges", n * 3 + 1,
-						 &pdc_region[n].parent_base);
+						 &pdc->region[n].parent_base);
 		if (ret)
 			return ret;
 		ret = of_property_read_u32_index(np, "qcom,pdc-ranges", n * 3 + 2,
-						 &pdc_region[n].cnt);
+						 &pdc->region[n].cnt);
 		if (ret)
 			return ret;
 
-		for (i = 0; i < pdc_region[n].cnt; i++)
-			__pdc_enable_intr(i + pdc_region[n].pin_base, 0);
+		for (int i = 0; i < pdc->region[n].cnt; i++)
+			pdc->enable_intr(i + pdc->region[n].pin_base, 0);
 	}
 
 	return 0;
@@ -477,13 +470,16 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	if (pdc->version >= PDC_VERSION_3_2) {
 		pdc->cfg_fields = &pdc_cfg_v3_2;
 		pdc->regs = &pdc_v3_2;
+		pdc->enable_intr = pdc_enable_intr_cfg;
 	} else if (pdc->version < PDC_VERSION_3_2 &&
 		   pdc->version >= PDC_VERSION_3_0) {
 		pdc->cfg_fields = &pdc_cfg_v3_0;
 		pdc->regs = &pdc_v3_0;
+		pdc->enable_intr = pdc_enable_intr_bank;
 	} else {
 		pdc->cfg_fields = &pdc_cfg_v2_7;
 		pdc->regs = &pdc_v2_7;
+		pdc->enable_intr = pdc_enable_intr_bank;
 	}
 
 	/*
@@ -502,7 +498,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 			return -ENXIO;
 		}
 
-		pdc_x1e_quirk = true;
+		pdc->x1e_quirk = true;
 	}
 
 	parent_domain = irq_find_host(parent);
@@ -511,6 +507,8 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		return -ENXIO;
 	}
 
+	raw_spin_lock_init(&pdc->lock);
+
 	ret = pdc_setup_pin_mapping(dev);
 	if (ret) {
 		pr_err("%pOF: failed to init PDC pin-hwirq mapping\n", node);

-- 
2.43.0



Return-Path: <linux-gpio+bounces-38566-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V/wPByAYMWoobgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38566-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:32:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A221668D924
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:32:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="gK8X//ol";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RLPvO8vP;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38566-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38566-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F21E531DFB43
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FE4421A18;
	Tue, 16 Jun 2026 09:26:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A004219F6
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601991; cv=none; b=l9RnEEdTB3f658DVqa3ZqZ78FZagMn5otPljAvXck7HYxyjPov1ECeLqL3B6l0b6EfrMAc7lcHx7htViHtMUwKhje76duiAv9owK/grnvYkRIR417QuiNN9hfAy5G0leM+p6WNvXjXDxkQeUx7DAHkeW8qZ1CphdzIUQew536+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601991; c=relaxed/simple;
	bh=sLcI40qtn/Il8kWTLKDdBY3n0NAGFC+HZsWN3fXfvdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b7YEc/WZQvqfXD/OBLD4AnBO2U4g6LilqdYQrOlFTSEJFBTXVg9yh+Ztn/2rGlz1Wpn1oSV7OLiW5Pd8yeQnfo/JvpPJYNM29bKkts5IpWjAGDVP+hut/l3CxNNcNwpk6eS2u69hUG7t+pwM3vq3hGcoDflzD4sAQwPP1VUo1C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gK8X//ol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLPvO8vP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G65gNj2699680
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rT6Jh2t74FriHgz0o25z1IveWAiiu7PsQiuvC/qMBe8=; b=gK8X//olGdu2Hzwy
	N9bRRae/CHWXniRd7Ik89drhh/RthoBNL5MxL9qeosD+S4/6/uNWWGCaDcvsra6F
	3j/E1SuU6nbOh74NT2Zjhb29gdaCM65UWGBptpXWsk9S/oOq147OuBBpwney1yAX
	RceWrd30JmCBSxDb9GBo+kZ+3nvVmQfml6tv3Nd4oia0RSEJ9aGUGNCr5TgWXDOl
	BjQ+gLSHQUkeEAPPoqnYoQsgUQ0zonF8XMCXQZmU5Zdp+63J0K8S4SlMqimkgZZM
	sFL16ttKJKrG3ozLjazKasRq73NqaAI1n5O+tObWpslwT/jyka8uLA6fHc0DoCss
	LRoCQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9153-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c69f08f527so3950915ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 02:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781601987; x=1782206787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rT6Jh2t74FriHgz0o25z1IveWAiiu7PsQiuvC/qMBe8=;
        b=RLPvO8vPTZf9GOl2GL97ZdHeZmKG3e5doy+jXLO6J0GzvKc8KJbxqX0bJM5uL2IFVF
         +fYdLrppQIGEQFP8G2GDseMXzUKdR/Aw7WO95TkVU0t33GljpentWd4bdkbVvn7DcULw
         VTSQhXjQkM7PjOrRHfGMT7t9Ff2QdeycdiX3Y7UfEgBN0Q9GwQHHFxUOW6XGe8OCDRfe
         EHhULxBSLgXxJ2xNrt0G7JsGlamN2whHDQHP2na85OZiOKSNfx1B06yhS1L42RH7jPBM
         LnVUXko8LFOH46lhGpuUhJnNPnGOrHDcTFunwcsduk+r0vXwUjUBPBEQDMHDlbFx9U/S
         5Kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601987; x=1782206787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rT6Jh2t74FriHgz0o25z1IveWAiiu7PsQiuvC/qMBe8=;
        b=c3xaquTrWICvOXBsRI1vHbNjuYJn753pt4QQwsUQQEba+5/K1yPcN5dL5i9lL6uK4W
         KSa6fHITuMayzdqJyhjABpQr04BrK3BLdrkWuPYr7gioir6APIBJThle573snACD8JYq
         JPX3at3R3MlVHtgI4jDJvCEUTYf7Tvn92kSmpNMQRnodspamm2al0gwHyCj0K8XaZXir
         LI3j+fgnW2XpAgmMYW52NyYri0GUYVVp+9PXU/1M7fWvH996xDj8BkNj78RTWsWxkIWe
         ibES3Ugn3jsvreEv77SLSpXlwWcdVBNVZdpWRDFzk6lj5coQ7n35HsF3FylphvlaAC8a
         V8dA==
X-Forwarded-Encrypted: i=1; AFNElJ+ShFCMTjwi6XsEVDdsIU9R2BAjN8Xk/NkLqalMB0HSMoUpkt00A3+i8GmbuwK9zAGPB8vojKm6w6A0@vger.kernel.org
X-Gm-Message-State: AOJu0YyGqvoTN0HnzFpfR0FPBS89HPK/ub6GRbfC4xauvPI551jl5EBN
	wsvBBcRTFn94gijO0ozh4t+XP7r+PvchoKTW9wydDfubUn8dUSFNbOSll2wKb2NHUG23IwsYUPJ
	MsBkEJiExV/gdw51tZzrbX+pplwlf1UWY+m+Jype2rrYY5i23rDV+PK1Kj2h+9NfT
X-Gm-Gg: Acq92OHtXl73xelVg8iGF1xsENdB625+nrDVL60Y1pBOL73TsucmvoHQWjA7j1yZZ2W
	kNFk6n+blrqco98NqHKi9Kz30tyMHYCzP3d/dfWm5QvWr+QMyuZ8JqD/sZMFMvYfO3Xr3sOaMmW
	q47WTMEJ0fikwcwt9JDDNsBUAHkKlYqwyvAnpsM3bNymSqvH00IKagPugHmMYxB4eICQCTG3NXy
	txtd9b5IXd4URIuMcdtdjj1kbtjezv5bymBQ90yWVahrMIBVPGFPhaAgmRO2LOQjR+ApHtpABoL
	d0CRr1jLybvvPzh1MIk0CrgVEMu1CPqLl34FPitp+I9aWXSpP+6SZbNOkUrlSqyIvc5xF+waLnq
	YArvv7Pr8H1S6MmHfHRb4SgI6RRzOil1OrTFrg+1bC+5Yl5TQ0Q==
X-Received: by 2002:a17:903:2442:b0:2c0:ab82:6bb8 with SMTP id d9443c01a7336-2c66420992cmr157411635ad.27.1781601987278;
        Tue, 16 Jun 2026 02:26:27 -0700 (PDT)
X-Received: by 2002:a17:903:2442:b0:2c0:ab82:6bb8 with SMTP id d9443c01a7336-2c66420992cmr157411315ad.27.1781601986734;
        Tue, 16 Jun 2026 02:26:26 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm130042025ad.12.2026.06.16.02.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:26:26 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:55:55 +0530
Subject: [PATCH v3 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781601959; l=12610;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=sLcI40qtn/Il8kWTLKDdBY3n0NAGFC+HZsWN3fXfvdU=;
 b=EpSCVe2QU3s/BwVo4CL6/nsNv3mM/i+ZbmgiEHSIXGMBkg8XhOrL0jDnhKz1dR9V6YUH08LFY
 1C0WUfPHWUZAkQSbpzkaoPpmxl70q7nL/rsSQS2QDnMnaR3dhNpLw6M
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX1u4VOv2ptY3x
 GLkBh0vbqVyCJQh6Nf6UPvhD04zynC+5NKfmRQ0doHbszG7Li7DajKxb/LhPz1yMMVxwHpoNqy7
 A3ASyyoU2e7AKzRP8rJKLwB+EyyqI1s=
X-Proofpoint-GUID: aEHzZZrgQ_BRzcOZfW7dU-qrX2fJnyyj
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a3116c4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bkapaEfNc9YyNyxQztEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: aEHzZZrgQ_BRzcOZfW7dU-qrX2fJnyyj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX1eAT3i49tBUw
 5LuBLiaDGFLCUJ5VV/QsunGNRCO3OqQIxjstGzCQ4UvtCUOvdXXzouigW3jPXezlaF+1Ju1URlc
 oknuPoBtqs2qFdteO56tICiRW/8xvrDtnMdqEmI2E6L0wKoIhhYkbX9306jUweizLRor/VR+ga6
 mpg6CUGrWe5knpa8Z5U5sA3CfGSpH2img5BtcONxL5jSmnOolky5951dzdN5rarYbETAtdeG0QR
 XV5PzGh3vQDGINgTb6lw+BjiILnI/AH2JYRufYaOMzErYDIZSBzVJnMWlnPmREAlTmXtNgdqaJb
 xeBAr9uYObX8pabwkhzCVzi+i+ywWpX+7BFAf7kdPWLvocF89WfTt6G1gsCtTLU/5bchQfoNqho
 furcfUxwE+20oR1vXgbTiEABbElKn90hQcVmRo6E8Z83+DN+TMBMLj+ijJ39FmV+EpBIPYEJpHZ
 YyRSNi37IEp3Zy5+tAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38566-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: A221668D924

All PDC irqchip supports pass through mode in which both Direct SPIs and
GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.

Newer PDCs (v3.0 onwards) also support additional secondary controller mode
where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
still works same as pass through mode without latching at PDC even in
secondary controller mode.

All the SoCs so far default uses pass through mode with the exception of
x1e. x1e PDC may be set to secondary controller mode for builds on CRD
boards whereas it may be set to pass through mode for IoT-EVK boards.
The mode configuration is done in firmware and initially shipped windows
firmware did not have SCM interface to read or modify the PDC mode.
Later only write access is opened up for non secure world.

Using the write access available add changes to modify the PDC mode to
pass through mode via SCM write. When the write fails (on older firmware)
assume to work in secondary mode.

In secondary mode set the separate irqchip for the GPIOs to perform
additional operations only for the GPIO irqs.

Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 220 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 208 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 1aa6be42307c..c6f2935ff788 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -20,12 +20,18 @@
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 
 #define PDC_MAX_IRQS			256
 #define IRQ_ENABLE_BANK_MAX		BITS_TO_BYTES(PDC_MAX_IRQS)
 #define IRQ_ENABLE_BANK_INDEX_MASK	GENMASK(31, 5)
 #define IRQ_ENABLE_BANK_BIT_MASK	GENMASK(4, 0)
 
+/* Secure DRV register to configure the PDC mode via qcom_scm_io_writel() */
+#define PDC_GPIO_INT_CTL_ENABLE		0xb2045e8
+#define PDC_PASS_THROUGH_MODE		0x0
+#define PDC_SECONDARY_MODE		0x1
+
 #define PDC_DRV_SIZE			0x10000
 #define PDC_VERSION_REG			0x1000
 #define PDC_VERSION_MAJOR		GENMASK(23, 16)
@@ -85,10 +91,14 @@ struct pdc_regs {
 /**
  * struct pdc_irq_cfg: bit fields for PDC IRQ_CFG register
  *
+ * @gpio_irq_sts:   bit number for GPIO_STATUS field
+ * @gpio_irq_mask:  bit number for GPIO_MASK field
  * @irq_enable:     bit number for IRQ_ENABLE field
  * @irq_type:       GENMASK for IRQ_TYPE field
  */
 struct pdc_irq_cfg {
+	u32 gpio_irq_sts;
+	u32 gpio_irq_mask;
 	u32 irq_enable;
 	u32 irq_type;
 };
@@ -103,11 +113,14 @@ struct pdc_irq_cfg {
  * @num_gpios:      Total number of GPIOs forwarded as SPI interrupts
  * @region:         PDC interrupt continuous range
  * @region_cnt:     Total PDC ranges
+ * @mode:           PDC_PASS_THROUGH_MODE or PDC_SECONDARY_MODE
  * @x1e_quirk:      x1e H/W Bug handling
  * @lock:           lock for IRQ_ENABLE_BANK protection
  * @regs:           PDC regs (IRQ_ENABLE_BANK and IRQ_CFG)
  * @cfg_fields:     Fields of IRQ_CFG reg
  * @enable_intr:    pointer to enable function based on PDC version
+ * @unmask_gpio:    pointer to GPIO irq unmask function
+ * @clear_gpio:     pointer to GPIO irq clear function
  */
 struct pdc_desc {
 	void __iomem			*base;
@@ -119,6 +132,7 @@ struct pdc_desc {
 	struct pdc_pin_region		*region;
 	int				region_cnt;
 
+	u8				mode;
 	bool				x1e_quirk;
 
 	raw_spinlock_t			lock;
@@ -127,6 +141,8 @@ struct pdc_desc {
 	const struct pdc_irq_cfg	*cfg_fields;
 
 	void (*enable_intr)(int pin_out, bool on);
+	void (*unmask_gpio)(int pin_out, bool on);
+	void (*clear_gpio)(int pin_out);
 };
 
 static const struct pdc_regs pdc_v3_2 = {
@@ -135,6 +151,8 @@ static const struct pdc_regs pdc_v3_2 = {
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v3_2 = {
+	.gpio_irq_sts	= 5,
+	.gpio_irq_mask	= 4,
 	.irq_enable	= 3,
 	.irq_type	= GENMASK(2, 0),
 };
@@ -146,6 +164,8 @@ static const struct pdc_regs pdc_v3_0 = {
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v3_0 = {
+	.gpio_irq_sts	= 4,
+	.gpio_irq_mask	= 3,
 	.irq_type	= GENMASK(2, 0),
 };
 
@@ -184,6 +204,15 @@ static u32 pdc_reg_read(int reg, u32 i)
 	return readl_relaxed(pdc->base + reg + i * sizeof(u32));
 }
 
+static inline bool pdc_pin_is_gpio(int pin_out)
+{
+	/*
+	 * PDC allocates direct SPIs at the beginning and
+	 * all GPIOs as SPIs are allocated after direct SPIs.
+	 */
+	return pin_out >= pdc->num_spis;
+}
+
 static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
 {
 	void __iomem *base;
@@ -231,6 +260,30 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 		pdc_reg_write(pdc->regs->irq_en_reg, index, enable);
 }
 
+static void pdc_clear_gpio_cfg(int pin_out)
+{
+	unsigned long gpio_sts;
+
+	if (pdc->version < PDC_VERSION_3_0)
+		return;
+
+	gpio_sts = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
+	__clear_bit(pdc->cfg_fields->gpio_irq_sts, &gpio_sts);
+	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_sts);
+}
+
+static void pdc_unmask_gpio_cfg(int pin_out, bool unmask)
+{
+	unsigned long gpio_mask;
+
+	if (pdc->version < PDC_VERSION_3_0)
+		return;
+
+	gpio_mask = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
+	__assign_bit(pdc->cfg_fields->gpio_irq_mask, &gpio_mask, !unmask);
+	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_mask);
+}
+
 static void pdc_enable_intr_cfg(int pin_out, bool on)
 {
 	unsigned long enable = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
@@ -245,12 +298,40 @@ static void qcom_pdc_gic_disable(struct irq_data *d)
 	irq_chip_disable_parent(d);
 }
 
+static void qcom_pdc_gic_secondary_disable(struct irq_data *d)
+{
+	pdc->enable_intr(d->hwirq, false);
+	pdc->unmask_gpio(d->hwirq, false);
+	irq_chip_disable_parent(d);
+}
+
 static void qcom_pdc_gic_enable(struct irq_data *d)
 {
 	pdc->enable_intr(d->hwirq, true);
 	irq_chip_enable_parent(d);
 }
 
+static void qcom_pdc_gic_secondary_enable(struct irq_data *d)
+{
+	pdc->enable_intr(d->hwirq, true);
+	pdc->unmask_gpio(d->hwirq, true);
+	irq_chip_enable_parent(d);
+}
+
+static void qcom_pdc_secondary_ack(struct irq_data *d)
+{
+	if (!irqd_is_level_type(d))
+		pdc->clear_gpio(d->hwirq);
+}
+
+static void qcom_pdc_gic_secondary_eoi(struct irq_data *d)
+{
+	if (irqd_is_level_type(d))
+		pdc->clear_gpio(d->hwirq);
+
+	irq_chip_eoi_parent(d);
+}
+
 /*
  * GIC does not handle falling edge or active low. To allow falling edge and
  * active low interrupts to be handled at GIC, PDC has an inverter that inverts
@@ -338,6 +419,67 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
+/**
+ * qcom_pdc_gic_set_type: Configure PDC for the interrupt
+ *
+ * @d: the interrupt data
+ * @type: the interrupt type
+ *
+ * All @type are forwarded as Level type to parent GIC
+ */
+static int qcom_pdc_gic_secondary_set_type(struct irq_data *d, unsigned int type)
+{
+	enum pdc_irq_config_bits pdc_type;
+	enum pdc_irq_config_bits old_pdc_type;
+	int ret;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		pdc_type = PDC_EDGE_RISING;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		pdc_type = PDC_EDGE_FALLING;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		pdc_type = PDC_EDGE_DUAL;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		pdc_type = PDC_LEVEL_HIGH;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		pdc_type = PDC_LEVEL_LOW;
+		break;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	old_pdc_type = pdc_reg_read(pdc->regs->irq_cfg_reg, d->hwirq);
+	pdc_type |= (old_pdc_type & ~pdc->cfg_fields->irq_type);
+	pdc_reg_write(pdc->regs->irq_cfg_reg, d->hwirq, pdc_type);
+
+	type = IRQ_TYPE_LEVEL_HIGH;
+	pdc->clear_gpio(d->hwirq);
+
+	ret = irq_chip_set_type_parent(d, type);
+	if (ret)
+		return ret;
+
+	/*
+	 * When we change types the PDC can give a phantom interrupt.
+	 * Clear it.  Specifically the phantom shows up when reconfiguring
+	 * polarity of interrupt without changing the state of the signal
+	 * but let's be consistent and clear it always.
+	 *
+	 * Doing this works because we have IRQCHIP_SET_TYPE_MASKED so the
+	 * interrupt will be cleared before the rest of the system sees it.
+	 */
+	if (old_pdc_type != pdc_type)
+		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, false);
+
+	return 0;
+}
+
 static struct irq_chip qcom_pdc_gic_chip = {
 	.name			= "PDC",
 	.irq_eoi		= irq_chip_eoi_parent,
@@ -357,6 +499,26 @@ static struct irq_chip qcom_pdc_gic_chip = {
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 };
 
+static struct irq_chip qcom_pdc_gic_secondary_chip = {
+	.name			= "PDC",
+	.irq_ack		= qcom_pdc_secondary_ack,
+	.irq_eoi		= qcom_pdc_gic_secondary_eoi,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_disable		= qcom_pdc_gic_secondary_disable,
+	.irq_enable		= qcom_pdc_gic_secondary_enable,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_set_type		= qcom_pdc_gic_secondary_set_type,
+	.flags			= IRQCHIP_MASK_ON_SUSPEND |
+				  IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE |
+				  IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND,
+	.irq_set_vcpu_affinity	= irq_chip_set_vcpu_affinity_parent,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+};
+
 static struct pdc_pin_region *get_pin_region(int pin)
 {
 	for (int i = 0; i < pdc->region_cnt; i++) {
@@ -385,20 +547,37 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
 	if (hwirq == GPIO_NO_WAKE_IRQ)
 		return irq_domain_disconnect_hierarchy(domain, virq);
 
-	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
-					    &qcom_pdc_gic_chip, NULL);
-	if (ret)
-		return ret;
+	/*
+	 * PDC secondary chip is only set for the GPIO interrupts as SPIs.
+	 * Direct SPI interrupts are still in pass through mode (no latching
+	 * at PDC).
+	 */
+	if (pdc->mode == PDC_PASS_THROUGH_MODE || !pdc_pin_is_gpio(hwirq)) {
+		ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
+						    &qcom_pdc_gic_chip,
+						    NULL);
+		if (ret)
+			return ret;
 
-	region = get_pin_region(hwirq);
-	if (!region)
-		return irq_domain_disconnect_hierarchy(domain->parent, virq);
+		if (type & IRQ_TYPE_EDGE_BOTH)
+			type = IRQ_TYPE_EDGE_RISING;
 
-	if (type & IRQ_TYPE_EDGE_BOTH)
-		type = IRQ_TYPE_EDGE_RISING;
+		if (type & IRQ_TYPE_LEVEL_MASK)
+			type = IRQ_TYPE_LEVEL_HIGH;
+	} else {
+		ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
+						    &qcom_pdc_gic_secondary_chip,
+						    NULL);
+		if (ret)
+			return ret;
 
-	if (type & IRQ_TYPE_LEVEL_MASK)
+		/* Secondary mode converts all interrupts to LEVEL HIGH type */
 		type = IRQ_TYPE_LEVEL_HIGH;
+	}
+
+	region = get_pin_region(hwirq);
+	if (!region)
+		return irq_domain_disconnect_hierarchy(domain->parent, virq);
 
 	parent_fwspec.fwnode      = domain->parent->fwnode;
 	parent_fwspec.param_count = 3;
@@ -449,8 +628,13 @@ static int pdc_setup_pin_mapping(struct device *dev, struct device_node *np)
 		if (ret)
 			return ret;
 
-		for (int i = 0; i < pdc->region[n].cnt; i++)
-			pdc->enable_intr(i + pdc->region[n].pin_base, 0);
+		for (int i = 0; i < pdc->region[n].cnt; i++) {
+			if (pdc_pin_is_gpio(i + pdc->region[n].pin_base) &&
+			    pdc->mode == PDC_SECONDARY_MODE)
+				pdc->clear_gpio(i + pdc->region[n].pin_base);
+
+			pdc->enable_intr(i + pdc->region[n].pin_base, false);
+		}
 	}
 
 	return 0;
@@ -501,6 +685,8 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		pdc->enable_intr = pdc_enable_intr_bank;
 	}
 
+	pdc->mode = PDC_PASS_THROUGH_MODE;
+
 	/*
 	 * PDC has multiple DRV regions, each one provides the same set of
 	 * registers for a particular client in the system. Due to a hardware
@@ -518,6 +704,16 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		}
 
 		pdc->x1e_quirk = true;
+
+		if (!qcom_scm_is_available())
+			return -EPROBE_DEFER;
+
+		ret = qcom_scm_io_writel(PDC_GPIO_INT_CTL_ENABLE, PDC_PASS_THROUGH_MODE);
+		if (ret) {
+			pdc->mode = PDC_SECONDARY_MODE;
+			pdc->unmask_gpio = pdc_unmask_gpio_cfg;
+			pdc->clear_gpio = pdc_clear_gpio_cfg;
+		}
 	}
 
 	irq_param = pdc_reg_read(pdc->regs->irq_param_reg, 0);

-- 
2.43.0



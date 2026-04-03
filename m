Return-Path: <linux-gpio+bounces-34655-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cINMGtv6z2nM2AYAu9opvQ
	(envelope-from <linux-gpio+bounces-34655-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 19:37:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D5D3970F7
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 19:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB5DF30C5D9F
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 17:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1F33D47AE;
	Fri,  3 Apr 2026 17:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTZpm2eh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3MMt8d/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FB318AFE
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 17:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775237649; cv=none; b=EBAsbGl74pN2vcb2RT2tVPVErFJlq+foQ1c9q6HL0WkO9cFYCCnNyfrmV1O2SllV9ZHm5nLiFXkv1ow0kYRwm2ETArmadte7xEH1xqDpbIjEnyn+8KAKchJ0yVIBfhwrgF7nVqOG0zXpYbYW9ohl7ONIp6I3llwpbjUKYKm/V5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775237649; c=relaxed/simple;
	bh=BswqjKSE0ZPr7l8CqajQN/6PIFNVHGX3Hga0DwKabto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ddSskkYOuK4RGL6SwB0SWVC6lXd9SK61mlVl1dSL9RTjkdczZf0g76bB6vYaRrdEnx2gGui92kMWthwQK9rCEXzeOgC+YdRttDxlE8YZ/tYmcltfvOee/zKy64URcuNwE97CknTvLFgSZIFPQkK2OsXC5uw6p+ixXwRMUR7lDTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTZpm2eh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3MMt8d/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633COaW03780492
	for <linux-gpio@vger.kernel.org>; Fri, 3 Apr 2026 17:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cS4DEz8Mt35qtFStKmkL4fllgbCdtEZk/8Dp6lQ4xAE=; b=gTZpm2ehytKDxwEr
	ERNZ7dJt6s6UAnDyeEs9htoGSCKZBNd5Xhmakm3InV9G+pu91OrlBv7QvdRYj7zj
	iehK5+thhtYXXkmEgZ1KUgPsNpr0eOBE+9Fk34xegN2BnFfFGZlCGZhLu1Ml1Wl5
	fNZRiQjmAnQDVnkA9d5FpJ+uueZnKA0SQXuEEaULgrQM8wdRRmPeeZlA0TglFtUe
	s5RvKc49bDNZmWbSmLrL++6VFc6DT7e8g9aJ2qSIj2dJU0ympXj7AyTVfJ1KYLaH
	RYCu4HinXTfWOgiYe3fqnl/ejGjfgzsRvve4aUmb0Jn9gdZhj6CeRWzipg9YeVYo
	epSvuQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da663j9ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 17:34:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c7a84a43eso3451609b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 10:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775237644; x=1775842444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cS4DEz8Mt35qtFStKmkL4fllgbCdtEZk/8Dp6lQ4xAE=;
        b=O3MMt8d/vy2HPCUtDKYtgmbJAeLNWr3g/ldpNHYPSks2sjDf7pgEIPV7+9yTEYszfg
         JpG/Lf84EzIGHzEVGZFjDrgqX7UKAxV4eLY6sjNsquGQIUwzrtD+taFm9L7sY0xpIe7x
         L/+1yBd+yZhiZacwFS99XeTJwB2vy+VXTwhyMsoYivkooA8Foln5EC0HBFzZnD87p8ba
         NJC6oDrjLBpfT9JTySyX4K6J89KbL14dqi6iox6To7QwaLrhVzt/F4NQ00qPK1i+V7EC
         WZYfdhN2GPZ4TOHkpEnW36bpzP5R6yyGGWf4RJqDZc9ct/BkTD56yo6gAvRaBsNjGUvD
         OVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775237644; x=1775842444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cS4DEz8Mt35qtFStKmkL4fllgbCdtEZk/8Dp6lQ4xAE=;
        b=iQ6WZA1xFSDCYzTNSOMAdvsqsByr8C3jKfBd85yPfRYlolSvjoQtJte0S7BKjG0Sms
         9KoH0oJl5IT1M23fmYxglZfKNWMqA+cbUJH50rTP2bZKsieH6LF8bDmInPoW5S8fH8gl
         /QgtupWgs8M2I/cXAKOyapvt6F6bC50ZXAsKf3wRbNkD87flgQUyz1J36Y9/sJ/TY1Uy
         njvYc8NTdYqs0FmC1w6N6/tNLRlbxSDkmO3AH67lKFhEPUbtH5/gbHcV9d7A3I/pcu9A
         SfeuIZJoExorHMuA53wfSRezfi0lI9kjVJvSWORiwHvck+3SuzCrcL7amvHBf2CbDQP9
         kE+g==
X-Forwarded-Encrypted: i=1; AJvYcCVlqDX33YDZ7Bbkv2lMPHeG9HSASBu+ZcHjmuUkSfNSGTOyzLpytHxdM4m3lmWxGZzT0ZdXgBuBNidj@vger.kernel.org
X-Gm-Message-State: AOJu0YwLoKtv96M7elG2fhJbnqyzXsYNqIHsiQ0rfQtmw+PMQNEz1jzK
	N34jteatEaoF/XOVdJjJkVwsZmfMP0i8ATF9mD1EAolwSyB0NHpesbuKgPqHs5+bGGPog6aRA47
	YDRaYRM7rQNWhEK1IMdhEWhYQncxcwRaeOE52N3d6vW1nphik68nRtTisskgirPVcTU0GA2is
X-Gm-Gg: AeBDietIaj69elIKnovMtI+N7vmsOw+7sgVCgnW4WHHpUrp3LCDAPz1Cc8fgKbm8wS8
	W2nkpDaKh4Hbvs90dqWEFAZSJwiW9xX4My/fpV62d/QAScqxiCYoCPER4DxmXXO6XfO3uYhObZ2
	u45twykKwXva6bflO3Du75tGzIyqizC723K91uZ6Pjpp+9AsgY+0NOwTcJGhzPKyZajWuyYJ8TA
	p+e1iuO/OhsyiXDfjezKnel3P2/oKgDpbipJanE9dmGRaMsSz+ZGTBwP6yYKInAxO0n4xhI7ZGH
	lBH9v2IJIRhZwiDWCSN0u4Jx7lO7K7LEuJOrtdHJQklCx5MVv9NTwVS9LDwvxb7tm0NS0bIIZb8
	OhS2xXcH8cheFoGWv3Y4RfEu0/Psgwuqa8x7N13Uyc7X5lAlVwl2TATHn
X-Received: by 2002:a05:6a00:aa85:b0:829:6f9f:ea44 with SMTP id d2e1a72fcca58-82d0da8ba21mr3650299b3a.17.1775237644409;
        Fri, 03 Apr 2026 10:34:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa85:b0:829:6f9f:ea44 with SMTP id d2e1a72fcca58-82d0da8ba21mr3650271b3a.17.1775237643823;
        Fri, 03 Apr 2026 10:34:03 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3e169sm6359125b3a.18.2026.04.03.10.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 10:34:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 23:03:35 +0530
Subject: [PATCH v9 3/3] PCI: Add support for PCIe WAKE# interrupt
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-wakeirq_support-v9-3-1cbecf3b58d7@oss.qualcomm.com>
References: <20260403-wakeirq_support-v9-0-1cbecf3b58d7@oss.qualcomm.com>
In-Reply-To: <20260403-wakeirq_support-v9-0-1cbecf3b58d7@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775237619; l=9559;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=BswqjKSE0ZPr7l8CqajQN/6PIFNVHGX3Hga0DwKabto=;
 b=pVJaDEIVyCYsRjLoOdV+ozcPmLpciI51NBeTwG4tfB8XVBRF6FRa0ehgQDSNsUjBcEXHth3ar
 s0c9kgZp6wJBV95/lEUubAriMtA0xndknzRipBvddEmPXjcRFTRhmT8
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE1NiBTYWx0ZWRfX/vMFscLbwTON
 IHLlcxS9Dd5Yqh72H+Cbx6A/CIzJMBrU8Msto5hGxMNz+qLelU7LLj+7A22f3KlnUMjrtUZeLZZ
 TtRlKMhwa/id38KOiEkXqHvoc+oxcTl1Az3CdmmXdcBVYjUx15gQMp375W1ax5P/1RJAyDmkRWf
 mxdQB0ZktO7IGG1UuqOtMJxVgBIxKSf9Kg9+gdBhSa2ObEA1g1GBQ+8ry2MAIzCGKGmqatRU1Ay
 vCIMdqGqKwOav7yeJpLqRHpb2krKaK3R4ebf+CwsYAQckUF8ikLwV7lPhHcUSVE+fFKCIK8kYdU
 eKrZJ60s5I4+oMLekwuCwsvLwPTjYDiFzK7UcaUD95ycPkZaN1u0OYLZ7fB/8YzwOWPquQMYr5E
 260y898GQeepL2WBt1gXtXTbc/A3rI6zorl8tX/Aao1hsc/KH0CcdBv5zTbYIAFaxHCwCKOOl23
 6oXg9Sc8uTCaaMh/Gvg==
X-Proofpoint-GUID: Yuru9mYfsBHlBoBYfAxNP2b6QOlLrWAR
X-Proofpoint-ORIG-GUID: Yuru9mYfsBHlBoBYfAxNP2b6QOlLrWAR
X-Authority-Analysis: v=2.4 cv=Acu83nXG c=1 sm=1 tr=0 ts=69cffa0d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8
 a=XVdArZcsv8hm62BSzCUA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030156
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-34655-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5D5D3970F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to the PCI Express specification (PCIe r7.0, Section 5.3.3.2),
two link wakeup mechanisms are defined: Beacon and WAKE#. Beacon is a
hardware-only mechanism and is invisible to software (PCIe r7.0,
Section 4.2.7.8.1). This change adds support for the WAKE# mechanism in
the PCI core.

According to the PCIe specification, multiple WAKE# signals can exist in
a system or each component in the hierarchy could share a single WAKE#
signal. In configurations involving a PCIe switch, each downstream port
(DSP) of the switch may be connected to a separate WAKE# line, allowing
each endpoint to signal WAKE# independently. From figure 5.4 in sec
5.3.3.2, WAKE# can also be terminated at the switch itself. To support
this, the WAKE# should be described in the device tree node of the
endpoint/bridge. If all endpoints share a single WAKE# line, then each
endpoint node should describe the same WAKE# signal or a single WAKE# in
the Root Port node.

In pci_device_add(), PCI framework will search for the WAKE# in device
node, If not found, it searches in its upstream port only if upstream port
is Root Port. Once found, register for the wake IRQ in shared mode, as the
WAKE# may be shared among multiple endpoints.

dev_pm_set_dedicated_shared_wake_irq() associates a wakeup IRQ with a
device and requests it, but the PM core keeps the IRQ disabled by default.
The IRQ is enabled only when the device is permitted to wake the system,
i.e. during system suspend and after runtime suspend, and only when device
wakeup is enabled.

When the wake IRQ fires, the wakeirq handler invokes pm_runtime_resume() to
bring the device back to an active power state, such as transitioning from
D3cold to D0. Once the device is active and the link is usable, the
endpoint may generate a PME, which is then handled by the PCI core through
PME polling or the PCIe PME service driver to complete the wakeup of the
endpoint.

WAKE# is added in dts schema and merged based on below links.

Link: https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/
Link: https://github.com/devicetree-org/dt-schema/pull/170
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/of.c       | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.c      | 10 +++++++
 drivers/pci/pci.h      |  2 ++
 drivers/pci/probe.c    |  2 ++
 drivers/pci/remove.c   |  1 +
 include/linux/of_pci.h |  4 +++
 include/linux/pci.h    |  2 ++
 7 files changed, 95 insertions(+)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 9f8eb5df279ed28db7a3b2fd29c65da9975c2efa..1678e82962b78ac206829a3a1fc121b0142b993b 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt)	"PCI: OF: " fmt
 
 #include <linux/cleanup.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
@@ -15,6 +16,7 @@
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
 #include "pci.h"
 
 #ifdef CONFIG_PCI
@@ -586,6 +588,78 @@ int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
 	return irq_create_of_mapping(&oirq);
 }
 EXPORT_SYMBOL_GPL(of_irq_parse_and_map_pci);
+
+static void pci_configure_wake_irq(struct pci_dev *pdev, struct gpio_desc *wake)
+{
+	int ret, wake_irq;
+
+	wake_irq = gpiod_to_irq(wake);
+	if (wake_irq < 0) {
+		pci_err(pdev, "Failed to get wake irq: %d\n", wake_irq);
+		return;
+	}
+
+	/*
+	 * dev_pm_set_dedicated_shared_wake_irq() associates a wakeup IRQ with the
+	 * device and requests it, but the PM core keeps it disabled by default.
+	 * The IRQ is enabled only when the device is allowed to wake the system
+	 * (during system suspend and after runtime suspend), and only if device
+	 * wakeup is enabled.
+	 *
+	 * When the wake IRQ fires, the wakeirq handler invokes pm_runtime_resume()
+	 * to bring the device back to an active power state (e.g. from D3cold to D0).
+	 * Once the device is active and the link is usable, the endpoint may signal
+	 * a PME, which is then handled by the PCI core (either via PME polling or the
+	 * PCIe PME service driver) to wakeup particular endpoint.
+	 */
+	ret = dev_pm_set_dedicated_shared_wake_irq(&pdev->dev, wake_irq,
+						   IRQ_TYPE_LEVEL_LOW);
+	if (ret < 0) {
+		pci_err(pdev, "Failed to set WAKE# IRQ: %d\n", ret);
+		return;
+	}
+
+	device_init_wakeup(&pdev->dev, true);
+}
+
+void pci_configure_of_wake_gpio(struct pci_dev *dev)
+{
+	struct device_node *dn = pci_device_to_OF_node(dev);
+	struct pci_dev *upstream;
+	struct gpio_desc *gpio;
+
+	if (!dn)
+		return;
+
+	/*
+	 * The devices in a hierarchy expose wakeup capability through the 'wake-gpios'
+	 * property defined either in the device node or in the Slot node. So first check
+	 * for the property in device node and if not available, check in the Slot node.
+	 */
+	gpio = fwnode_gpiod_get(of_fwnode_handle(dn), "wake",
+				GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE, NULL);
+	if (IS_ERR(gpio)) {
+		upstream = pci_upstream_bridge(dev);
+		if (upstream && pci_is_root_bus(upstream->bus) && upstream->wake)
+			pci_configure_wake_irq(dev, upstream->wake);
+	} else {
+		dev->wake = gpio;
+		pci_configure_wake_irq(dev, gpio);
+	}
+}
+
+void pci_remove_of_wake_gpio(struct pci_dev *dev)
+{
+	struct device_node *dn = pci_device_to_OF_node(dev);
+
+	if (!dn)
+		return;
+
+	dev_pm_clear_wake_irq(&dev->dev);
+	device_init_wakeup(&dev->dev, false);
+	gpiod_put(dev->wake);
+	dev->wake = NULL;
+}
 #endif	/* CONFIG_OF_IRQ */
 
 static int pci_parse_request_of_pci_ranges(struct device *dev,
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 8479c2e1f74f1044416281aba11bf071ea89488a..3d858f36ab48a6daec645574ca9027d9d6f071de 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -17,6 +17,7 @@
 #include <linux/lockdep.h>
 #include <linux/msi.h>
 #include <linux/of.h>
+#include <linux/of_pci.h>
 #include <linux/pci.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
@@ -1123,6 +1124,15 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
 	return acpi_pci_bridge_d3(dev);
 }
 
+void platform_pci_configure_wake(struct pci_dev *dev)
+{
+	return pci_configure_of_wake_gpio(dev);
+}
+
+void platform_pci_remove_wake(struct pci_dev *dev)
+{
+	return pci_remove_of_wake_gpio(dev);
+}
 /**
  * pci_update_current_state - Read power state of given device and cache it
  * @dev: PCI device to handle.
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 13d998fbacce6698514d92500dfea03cc562cdc2..65ca9551e558d2e3331fab0a968620d6b2a2522a 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -282,6 +282,8 @@ void pci_msix_init(struct pci_dev *dev);
 bool pci_bridge_d3_possible(struct pci_dev *dev);
 void pci_bridge_d3_update(struct pci_dev *dev);
 int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type);
+void platform_pci_configure_wake(struct pci_dev *dev);
+void platform_pci_remove_wake(struct pci_dev *dev);
 
 static inline bool pci_bus_rrs_vendor_id(u32 l)
 {
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index bccc7a4bdd794384b7877d453c7989941471c999..372b0d2f4531ea53c0570608306a547101d59e7b 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2771,6 +2771,8 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
 	/* Establish pdev->tsm for newly added (e.g. new SR-IOV VFs) */
 	pci_tsm_init(dev);
 
+	platform_pci_configure_wake(dev);
+
 	pci_npem_create(dev);
 
 	pci_doe_sysfs_init(dev);
diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
index e9d519993853f92f1810d3eff9f44ca7e3e1abd9..d781b41e57c4444077075690cec926a9fe15334f 100644
--- a/drivers/pci/remove.c
+++ b/drivers/pci/remove.c
@@ -35,6 +35,7 @@ static void pci_destroy_dev(struct pci_dev *dev)
 	if (pci_dev_test_and_set_removed(dev))
 		return;
 
+	platform_pci_remove_wake(dev);
 	pci_doe_sysfs_teardown(dev);
 	pci_npem_remove(dev);
 
diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
index 29658c0ee71ff10122760214d04ee2bab01709fd..0efd6e9cb4d3d3beaafb42ea411303139f1150d5 100644
--- a/include/linux/of_pci.h
+++ b/include/linux/of_pci.h
@@ -30,12 +30,16 @@ static inline void of_pci_check_probe_only(void) { }
 
 #if IS_ENABLED(CONFIG_OF_IRQ)
 int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin);
+void pci_configure_of_wake_gpio(struct pci_dev *dev);
+void pci_remove_of_wake_gpio(struct pci_dev *dev);
 #else
 static inline int
 of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
 {
 	return 0;
 }
+static inline void pci_configure_of_wake_gpio(struct pci_dev *dev) { }
+static inline void pci_remove_of_wake_gpio(struct pci_dev *dev) { }
 #endif
 
 #endif
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1c270f1d512301de4d462fe7e5097c32af5c6f8d..d1e08df8a8deaa87780589f23242767fdcdba541 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -586,6 +586,8 @@ struct pci_dev {
 	/* These methods index pci_reset_fn_methods[] */
 	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
 
+	struct gpio_desc *wake; /* Holds WAKE# gpio */
+
 #ifdef CONFIG_PCIE_TPH
 	u16		tph_cap;	/* TPH capability offset */
 	u8		tph_mode;	/* TPH mode */

-- 
2.34.1



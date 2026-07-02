Return-Path: <linux-gpio+bounces-39344-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V/dyGBMQRmraIgsAu9opvQ
	(envelope-from <linux-gpio+bounces-39344-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 09:15:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F219C6F410F
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 09:15:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=APx0KoxE;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39344-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39344-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46E6F302EA98
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 07:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CBD3905EB;
	Thu,  2 Jul 2026 07:14:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55D038F945
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 07:14:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782976456; cv=none; b=aQVloIO5eB1EAqB0DdAt5EAQThLzhhkp60f3Iv2qvqKW4ae8MgnFLFvjy0MJP/531ZfJ92xJdyskiXfSWTag476UD+/Ye5iC/04v9nu7Zcb3Y4k1kDKULabtf19kewwANONkOAC7lavjm1bXYuQU78+fQwVMPWisrQm0SRbraQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782976456; c=relaxed/simple;
	bh=fIgqwc0RyYrRrbnpullXE+1rd8mkyv5nvtoFOChc/uw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d0QFPgOjPiPq91f1Ai61dPb7fNTSM3OK/83UjcfM8DCqnnpn1mVc3IcZ3VqWyhravNriDLCOUd6CcH6RJOPgORNn8gqPWUMJGCJap3KnmAF6wM2gzmrBNWS7toZlZ5Twi8Y8Pj8izJ1UtXi1wTpUJxS+q6d4MkJsegkSwM4d9hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APx0KoxE; arc=none smtp.client-ip=209.85.210.182
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8475eca3a66so1592493b3a.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 00:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782976453; x=1783581253; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lgc5pIArs0nBBQHt+lF9KGmT0RhQBxD4+J8J+LHtER0=;
        b=APx0KoxEtnqByOhOi8ouSpEJQ7YZ3ypYGr+m2FqkpasiUQRBpKy7mR11vd35pqkLMS
         rDZzLABWJ8CInEQuNhqrrjSpxtjTZdKWCw7JsSG631qc1iqCGjbOHAKBVKXdV8TzbW17
         MCS98WdIrqT6sHV8lwV1YHLjJTeKg8fy0FE4dYnFfhAmRpHCwOTRmhVUwmtMiVm1fsyg
         vtW9oCDHDjbV5Yt4YJQeqLdoVBA6meuVHXdOw7sDm8btZiCvDdNMxBp3PvQtgNrEF1ip
         7nADmNTo92/dULjcg21iOhhy8Ou6Q+jqpgFHDVP3oXgE6hNTqIPAieAcdI1BLV7b5/rc
         n6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782976453; x=1783581253;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgc5pIArs0nBBQHt+lF9KGmT0RhQBxD4+J8J+LHtER0=;
        b=NOPg7RGtKfBGLw/kwz/VFMjUNY4tAgHMlfT2NwmSXcUFy4cZdkPlGZl6/CDwqqmu3M
         hvWBgVT6ZNXGxNtiw5FUz3n2U2xgKdqph+hsUyfd835Ho5dGeP16RLqUh4UbDgXsdu9P
         EMjPJkgkrEOlO0VkL+Z/eTOVdp4iYGy3GyUXpGANEWcPFetjavgJDySOEw7V02fYEb4v
         fqFZsuzigWp16KJdLLjR8IIDYTdRTy/tYc2bVWgBP5+OyfL03qi946dXmQaxnfHhgf0J
         +7qzxeibiNSG+jl8PXQrnQwh0lbSWVABIIYvuoXl8rOgNKzMIsDgmZPNNUqGmXzAfVB1
         gJPA==
X-Forwarded-Encrypted: i=1; AHgh+Rq24oWq1lBX0FWfpT612tA6qeONS3Kv0YHnlyXUy47hOMYCBfKV+AedCMjDv5PCC6V5+kbnTunv62S0@vger.kernel.org
X-Gm-Message-State: AOJu0YymCH0xllwcr9+IqCh/4wjKcUfkDXsartB45dgzso7LJtWvah3x
	NPmd8gaG1vvl91kwn6VPuj9G/OFHSqTj1kcwaffBex1hF9ZgRPvAYfpy
X-Gm-Gg: AfdE7cmYtKgUPXiHFtKFS+uTvuGPnD0IVRt8ihO2gIDdOSTTUxFBB/U+hYjqCRFJ/5l
	24ofqwKMdVX8GAZS8hIdY1jyxH+YsQ1+lJH0zuga1gxFhL3s4azbtBMYP0sG6Fdi6OTefhxgoT/
	OLQcDGoLKGUjDOLr3cGfUf4MbRRIMyFmXzMhOzWhwpN1JyayUdKRkeyq2/DJHkUMmAElkX8p26a
	qWdjz6zGdA+dH2L6XE46T4Dbz0CdvPD3YEC9CVhVxU4OiHpBkDSYENUz43vVaFFEbpm4aNv8+ve
	MprwIMUOlJuH6CgS0TtO+8RLep3VdA3vSBRDaO/EM7Fl8ljMVK4kArLE3CHxQohLtyAeqRM6YSR
	ZfOEh6t+Y0LsgSbOlLCwzwhEfb6b8IJkx5iIwotjDFunWbUl946Rz68a7rT2dx8DOEx4YqI1J1h
	7YjnMjFaUYCA==
X-Received: by 2002:a05:6a00:2e21:b0:845:eadb:821 with SMTP id d2e1a72fcca58-847c500a910mr4141691b3a.14.1782976452869;
        Thu, 02 Jul 2026 00:14:12 -0700 (PDT)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9a394asm878809b3a.47.2026.07.02.00.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:14:12 -0700 (PDT)
From: GaryWang <is0124@gmail.com>
Subject: [PATCH v3 0/2] upboard pinctrl support for device id INTC1055
Date: Thu, 02 Jul 2026 15:10:37 +0800
Message-Id: <20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-0-e6bda3032914@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO4ORmoC/5WPyw6CMBQFf8V0bU1veYiu/A/joi/gJkCbthAN4
 d8txBi2LOcsZnJmEoxHE8j9NBNvJgxohwTZ+URUK4bGUNSJCWe8ZCW70dFJK7ymDgcVfUeF1v8
 Nh6iAFQUNo3PWRyo16AoyAHkVJCmdNzW+t9zzlbjFEK3/bPUJ1vUXAnYsNAFltIKq0FxIWUt4N
 L3A7qJsT9bQxPdyflDOkzyH9IIXpapytpcvy/IFzvkLr0UBAAA=
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 GaryWang <is0124@gmail.com>
X-Mailer: b4 0.13.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39344-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[aaeon.eu,aaeon.com.tw,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:is0124@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F219C6F410F

Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
Add support "UP Xtreme i12" board.

The pinctrl-upboard is provide additional driving power & pin mux function
 through native SOC pins -> FPGA/CPLD -> hat  pins for flexable board level
 applications. it's probe from ACPI device id AANT0F01 & AANT0F04.

Signed-off-by: GaryWang <is0124@gmail.com>
---
Changes in v3:
- Correction pwm & uart pin mode in INTC1055.
- Remove unsupport up boards.
- Update cover letter.
- Link to v2: https://lore.kernel.org/r/20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com

Changes in v2:
- Add brief introduction pinctrl-upboard architecture in cover content. 
- Add more detail explaining for pinctrl-tigerlake commit message.
- Link to v1: https://lore.kernel.org/r/20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com

---
GaryWang (2):
      pinctrl: tigerlake: add some pin groups and functions for INTC1055
      pinctrl: upboard: add device id INTC1055 based UP boards support

 drivers/pinctrl/intel/pinctrl-tigerlake.c | 32 +++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-upboard.c         | 21 ++++++++++++++++++++
 2 files changed, 53 insertions(+)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260609-upboard-pinctrl-add-upboard-intc1055-support-bd1d81311b7a

Best regards,
-- 
GaryWang <is0124@gmail.com>



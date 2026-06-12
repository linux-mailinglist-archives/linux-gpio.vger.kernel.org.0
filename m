Return-Path: <linux-gpio+bounces-38366-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JFFzIubbK2o9GgQAu9opvQ
	(envelope-from <linux-gpio+bounces-38366-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 12:13:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F4222678A06
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 12:13:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KHWtIqST;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38366-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38366-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A38E315DD3A
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 10:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FB4382383;
	Fri, 12 Jun 2026 10:13:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535DD3806C9
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 10:13:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781259233; cv=none; b=J8RZxI0JWsg8xU3TY8OmUrS+bNHXY9Ypymz0f1nWJJtEa0X6LKaUNQvyLjCnkptco+LGfHaO6uFfTWZamMmCRjs2HvIRlx9Oe80Ya2FSDuOm6UcB4h6k4a1d9drVod63b99fe8xvu3RSnXB2C+ZSofP8kSvwDnhQue/HEUea0Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781259233; c=relaxed/simple;
	bh=FF317XWv8hQ53fa5Mo2QWgK/8jXOAVWaJF6pZKX0Fsk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Txjwbn/JSkcQBk7BJ+C+CeMWI7fTgP7VC4fqu0ebLK1kkcNvC8NjobLU5qLcgd08iCFM1ksTzNWgQRVONf9I8PUX6XXPKCSBH7hIYrjL9APUzpGoJrBukKK9mp4XYyp5eVPzLATn+K3RSK4oqdpMHzIApALkPQ2QoGM427RBCBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHWtIqST; arc=none smtp.client-ip=209.85.215.177
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c858b5de728so504049a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 03:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781259230; x=1781864030; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shDVC3CXn2YjLnI4ll9c2FdBkWxd5GCAqZZO5GwnWYc=;
        b=KHWtIqSTDZIdkuvxC+kCuh68BwX6S2otp4xWA+R6oWCg37vnAIrxD4Vas9GkZQWJMp
         EkiVICp/g6M2RVtBsOR9R25K+nZn1JwWt6i8Tyfzt3tqC9KSi9CBr+QEqRp+tFeynxEq
         EA9ZeKMxohtRpMIhrhJMsVQmKnygwlqQkYiT/ScUqekjXvtmVwyU0ALYkA42Ilvrdl4D
         mamk1ZDv/498kXLyRYq/6llBDr7QqMuuX6mPKQ3h95FSEuvvh23eUelOYp1gbQq+00xO
         LPZ81w0uAV6/qoe16t6txu6r7AYT7AGftRY7efaUYbYpCSdGmg6r2H02W9ec6QKZMRdS
         a+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781259230; x=1781864030;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shDVC3CXn2YjLnI4ll9c2FdBkWxd5GCAqZZO5GwnWYc=;
        b=gakxAZg7OgTS4prLC8XAPZOhGd7PI9cEjke9A/tCR0ohLwbl0BXrd5nZHtCRq+Ep/L
         AuLSx8+hAty9GqzWm/M4CqohbUnsHBSa03mSleW6u6v8APyCQkKtaZWz9iQslwUj2SW6
         r8oujtfVPy7I5azUxsoYLhMLiiALs5xD4x8FBV0/bDpxd6dJa6/qSw6NlwkaSZ/akBv/
         JKAirVS/OCPGLkMSztkUg37gEZMqNjI9Dtk04CF/SIH7AF6t39E2AzqAyjv0UIx5qz2X
         sFHyBKRuayBGxgSTkRxzS5kqWfeN3qoj2Mofhhz7ZUyqd0UP+gh/4nl6jyAsX6d0Ihv4
         +wRA==
X-Forwarded-Encrypted: i=1; AFNElJ8tF2ybUaJWNHTjpGR4t3Hz5wkmVMS/lwl2zWIUX4ZfygPxZSjWbaCnabM/NxNeREIGKc/SbsbQ0V7x@vger.kernel.org
X-Gm-Message-State: AOJu0YxOdu5SiZlUDIrhcVJ+CQRC6ogt/GQXP6HRzRnBiKmNGWG1rfzH
	X1fotOsoD4MBQaQzsUq/8aup43b1z0gJvTYpJfcyzRjTjlffphwLhccs63r2jNAQkA0=
X-Gm-Gg: Acq92OG4Lu/A/Y1v5SLGXDs9C7gICMPQVmyPSzGSa7acSolXrl5L9vmDWTNZH8hvRCp
	sp1mXDJiP3nBPZhCX1CULsrsBUKG4lx8hh9bgKveYM8qfkZDlwGEP+gBSNEJkP/PuHgtZ5dYLCf
	BRreA96JsSGE8k4yHZnBv1OCj/pdorabmBBIVny6yYXikTmBepxv5TAFNQyrA9QsntdwSijWbxz
	AOdMxAuBJtGH3wZVZ37+269A56TTq1WHPuVfADKNc4UHuzddJHMdqt3+xLoPvuDpY67zEMqjbYR
	6TLGaLGiK6ldus6pgVq46S1iwawRXqv1qrGrnG+XoIz7Czlvyw+tfXEQmzFxTmx3EVnPlgSo7+6
	EH0Rd3vUXzjMC0pUwv6r8aTRukDCGEpDSJ15/dRMxhb5HuFN4jWrtXE0oOGlXWJi5sUo7nQenAc
	TadvyzxK/wA4KIFYTzkcsQ2ezezQlnDnE=
X-Received: by 2002:a05:6a21:6e48:b0:3b4:85db:1bed with SMTP id adf61e73a8af0-3b7840a880emr2865938637.45.1781259230398;
        Fri, 12 Jun 2026 03:13:50 -0700 (PDT)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651adc16sm1557909a12.31.2026.06.12.03.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:13:49 -0700 (PDT)
From: GaryWang <is0124@gmail.com>
Subject: [PATCH v2 0/2] upboard pinctrl support for device id INTC1055
Date: Fri, 12 Jun 2026 18:13:31 +0800
Message-Id: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMvbK2oC/5XNSw6CMBSF4a2Yjr2mtwZER+7DMOgLuAm0TVuIh
 rB3KzHOHf5ncL6VJRvJJnY7rCzahRJ5V0IcD0wP0vUWyJRmgoua1/wKc1BeRgOBnM5xBGnMbyO
 XNfKqgjSH4GMGZdA0eEZUF8nKZYi2o+fOPdrSA6Xs42vXF/ysXwj5f9CCwKHBpjJCKtUpvPeTp
 PGk/cTabdvedgKumOgAAAA=
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
	TAGGED_FROM(0.00)[bounces-38366-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: F4222678A06

Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12", "UP 7000" boards.

The pinctrl-upboard is provide additional driving power & pin mux function
 through native SOC pins -> FPGA/CPLD -> hat  pins for flexable board level
 applications. it's probe from ACPI device id AANT0F01 & AANT0F04.

Signed-off-by: GaryWang <is0124@gmail.com>
---
Changes in v2:
- Add brief introduction pinctrl-upboard architecture in cover content. 
- Add more detail explaining for pinctrl-tigerlake commit message.
- Link to v1: https://lore.kernel.org/r/20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com

---
GaryWang (2):
      pinctrl: tigerlake: add some pin groups and functions for INTC1055
      pinctrl: upboard: add device id INTC1055 based UP boards support

 drivers/pinctrl/intel/pinctrl-tigerlake.c | 32 ++++++++++++++++++++++
 drivers/pinctrl/pinctrl-upboard.c         | 45 +++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)
---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260609-upboard-pinctrl-add-upboard-intc1055-support-bd1d81311b7a

Best regards,
-- 
GaryWang <is0124@gmail.com>



Return-Path: <linux-gpio+bounces-31198-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMxOBEPFeWl0zAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31198-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:13:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C519E179
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0D9A30990E3
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 08:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3055343D64;
	Wed, 28 Jan 2026 08:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSOQZPIE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708BA33F39B
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 08:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769587588; cv=none; b=HkysKX6CPGBp7BvvhhSklMyZpDfC1q07BSCKsH7zwLDW50GBkIpJFy0D+8AG+22Ai1QmCCtlD2RFeBcMfYB4TR1f6O2v4KRhbD/pGprWjbVVdi/sYkbx/YLwQHRxpkPq12GzcG6XRQD/NY4G65vqr1aOsXOJ1DStUno/1fdoagk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769587588; c=relaxed/simple;
	bh=eljd2Von8DKs3zpcWCWQh5udGZmCphJ47GV5S3Lmank=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CtNLNgHZINJjAsCZA3srT4WnHbVHShQQ5qlKA077XKZQZnOkZ1ecYkgSot7As+PpAXPdMps9QtuPVFgWw2fUPvJFXvmYXXjoI9imDBXnYvslzX+nT6TL9DjWLTFist0g/mkx4ST47cywWqIFVXAo3S+Nm/r4owT3eGMYgaJ05Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSOQZPIE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6C4C19421
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769587588;
	bh=eljd2Von8DKs3zpcWCWQh5udGZmCphJ47GV5S3Lmank=;
	h=From:Date:Subject:To:Cc:From;
	b=DSOQZPIE/RjItbfRZsgjKx/jQe/3igf2YwWgY/9099e0pFqrEsrn89NXf1aBQ9XXg
	 uJFb3kCccBazOQZPcZI4V+zYMPh2TIhsRdBAZQ+kK1ti92j7iSAIySp8nVZ/iIHgeA
	 e17hMZKRH0OfzmDgm3hEqEiQXcSbrAhhzj3UOiMIGSz2Hlt1BxcqkJw3UGQVTSxoze
	 Pc53tOPDPCoqoCDXAPQJlljXZ6VqgRaV1ejqmHGqJzPcmxHHhSKFLNT17qA8q+9040
	 +uCZrrARHtZYT7hDnJwQpMKuUwlbhzzjw1/fE0Ku2LXfJlTD/f4CN/ehvDQOBACIwR
	 Z/gx9I9a7ytJQ==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6496b6903c9so3414610d50.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 00:06:28 -0800 (PST)
X-Gm-Message-State: AOJu0YxUmR5HmwWjGwEG3kd1hZDh0wiZ/sXhz2zct2a0aPJVTRZyV+XH
	1rbVql8v8fy26j1/nm6iUVkUP3DK/yoHFOXZ2Jp37ovTI39jnnYKC4JlFWOCNkXiut935MeWsof
	F7IBWyRvX9G9prmQ2XBU6Sgtidjxbw7Y=
X-Received: by 2002:a05:690e:1489:b0:643:833:bf3 with SMTP id
 956f58d0204a3-6498fc0e752mr2927492d50.42.1769587587432; Wed, 28 Jan 2026
 00:06:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 28 Jan 2026 09:06:16 +0100
X-Gmail-Original-Message-ID: <CAD++jLkCt6CXT26vo5MF1f3scXy86KYW+cqynDs7DWF8J+DWBA@mail.gmail.com>
X-Gm-Features: AZwV_Qh_3eU9jip4UFl-aVZJkh0ghLnxbCv6kyfD54gwCRGLYds9MDdLNHDd6i4
Message-ID: <CAD++jLkCt6CXT26vo5MF1f3scXy86KYW+cqynDs7DWF8J+DWBA@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v6.19
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-31198-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: 70C519E179
X-Rspamd-Action: no action

Hi Linus,

some more accumulated pin control fixes stacked up.

Nothing special about this, just driver fixes and fallout.
Details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7:

  Linux 6.19-rc6 (2026-01-18 15:42:45 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.19-3

for you to fetch changes up to f58442788fdac580c49e0c42379fd32438cff6d7:

  dt-bindings: pinctrl: marvell,armada3710-xb-pinctrl: fix
'usb32_drvvbus0' group name (2026-01-27 10:49:36 +0100)

----------------------------------------------------------------
Pin control fixes for the v6.19 series:

- Mark the Meson GPIO controller as sleeping to avoid a
  context splat.

- Fix up the I2S2 and SWR TX group settings in the
  Qualcomm SM8350 LPASS pin controller, and implement the
  proper .get_direction() callback.

- Fix a pin typo in the TG1520 pin controller.

- Fix a group name in the Marvell armada 3710 XB pin
  controller that got mangled in a DT schema rewrite.

----------------------------------------------------------------
Bartosz Golaszewski (2):
      pinctrl: meson: mark the GPIO controller as sleeping
      pinctrl: lpass-lpi: implement .get_direction() for the GPIO driver

Gabor Juhos (1):
      dt-bindings: pinctrl: marvell,armada3710-xb-pinctrl: fix
'usb32_drvvbus0' group name

Krzysztof Kozlowski (1):
      pinctrl: qcom: sm8350-lpass-lpi: Merge with SC7280 to fix I2S2
and SWR TX pins

Thomas Gerner (1):
      pinctrl: th1520: Fix typo

 .../pinctrl/marvell,armada3710-xb-pinctrl.yaml     |   2 +-
 arch/arm64/configs/defconfig                       |   1 -
 drivers/pinctrl/meson/pinctrl-meson.c              |   2 +-
 drivers/pinctrl/pinctrl-th1520.c                   |   2 +-
 drivers/pinctrl/qcom/Kconfig                       |  15 +-
 drivers/pinctrl/qcom/Makefile                      |   1 -
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |  17 +++
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c    |   3 +
 drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c    | 151 ---------------------
 9 files changed, 26 insertions(+), 168 deletions(-)
 delete mode 100644 drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c


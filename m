Return-Path: <linux-gpio+bounces-37374-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ3PGwp5EGoZXgYAu9opvQ
	(envelope-from <linux-gpio+bounces-37374-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 17:40:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E06E75B70B9
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 17:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69421300DD55
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 15:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4F9425CF4;
	Fri, 22 May 2026 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMp3ANei"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84F6407575
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 15:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779464180; cv=none; b=aS8hhNcX8N1Zek4YzWY88bsHoqFXbEeVAewDnhMvEVRsyx6rKnlDxB05uUhKr5BM45SID2kUtRiI/uM/DIci3QepjoKOcuuqR/hm3uS/5ZXa9ZZNcvpvSUy9gNY9ayY9GjAu6cz3BKnJL+EptZOCzWCPV2erYF9VQG3GKZsYmrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779464180; c=relaxed/simple;
	bh=5XGxT/kvRZzrJ9UeYKMk4iaMnRVp2/GlN7y9XcCMlx0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rgAMJzBnR7JYsczmrnGFnDKgn+uGbfqsQ9dKfKXz/gCDd7W3Mec6HsqyA/oTG6LPmeiaSJz9Ya6UPmP/ndz/JHaRkWRZX/HJzb+s8orrhkDWFVr/qJ+2oeAR3ITG9q1iopJNoCFxDzymZFf8KpnjaQNUQuZ+5CB6LUhQmw7ZSJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMp3ANei; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651661F000E9
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 15:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779464179;
	bh=yYNAqzKpRBo1WAiWby9n8a7qccyfcJTDiN3b/D7Fa0o=;
	h=From:Date:Subject:To:Cc;
	b=GMp3ANeiy5oSWXJxgU/p4gq9wdw9V6LvU5PXMKyQ8ovcq7VdRvoNg0wWyPobMlIB6
	 IKE5wnJXKpgPckFzVf11YPDf9Ho7N0c3JValgCHI+craDgozB0TVXj6m9PI1hbXER/
	 7nKokDcrhcopuEoFldCoPG6hp63SrkZxLHQJHvaied+D5pFSzz+GO7Tybn/p0FG8Jj
	 f8gkNPa9+xUHF79WTwJrCLDqhiDpYvl7nTAln1QxD0HQXo5vi9q2K2eazgH/vj6+wB
	 LidlYRmtEh2w4zVqTrlZvRZdvf8t01Xqm8eRC/06Lk/tQDCWrsbHpahwlh3nFbP78C
	 zUdteg/YLDkGg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so8040771e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 08:36:19 -0700 (PDT)
X-Gm-Message-State: AOJu0YwcGOn62ELfy6IA7wFBneSIehg1mAP+AR7Q05y0Rr4Nruv3iVP1
	18bZ7/6/+Q/tIDPxHxwcjuDT4aG1LwBEtZJBLNlLIohvNfCiimA5G2z3R6LaZQhUQqUx4qRgxsj
	5e67e/JfSKlz1wrwkTnHUHdBBc2Rx1NA=
X-Received: by 2002:a05:6512:3e1e:b0:5a8:76c0:a7b7 with SMTP id
 2adb3069b0e04-5aa323143f8mr1266219e87.7.1779464178180; Fri, 22 May 2026
 08:36:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 22 May 2026 17:36:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLmCEJD+9LMJM0C9a6C-OdBCEb-gef4qFAY+=wULQWhECQ@mail.gmail.com>
X-Gm-Features: AVHnY4Itzx6yw6lOY5r62Z2-1sh6VXZ6T4--j8S9CXBCxgYnsTHDUf8T8qe71Kg
Message-ID: <CAD++jLmCEJD+9LMJM0C9a6C-OdBCEb-gef4qFAY+=wULQWhECQ@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for the v7.1 kernel
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-37374-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E06E75B70B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,

here are a pile of pin control fixes, some of which I should have definitely
tagged and sent earlier but I got distracted.

Details in the signed tag: all are driver fixes for misc SoCs, one single
patch affects an Intel laptop and may be of particular interest.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v7.1-2

for you to fetch changes up to 3812a9e84265a5cdd90d29fe8d97a023e91fb945:

  pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7
14AGP11 (2026-05-13 09:34:55 +0200)

----------------------------------------------------------------
Pin control fixes for the v7.1 kernel:

- Implement the GPIO .get_direction() callback in the Mediatek
  driver to rid dmesg warnings.

- Mark the Qualcomm IPQ4019 pins used as GPIO as using the
  GPIO pin function, so there is no conflict with orthogonal
  muxing.

- Fix incorrect settings of the "PUPD" (pull-up-pull-down)
  register during suspend/resume in the Renesas RZG2L.

- Fix the SMT register cache to be per-bank in the Renesas
  RZG2L.

- Fix the QDSS track clock and control pin group names in the
  Qualcomm Eliza driver.

- Fix a deadlock in the Amlogic driver, caused by playing
  around in sysfs.

- Fix some GPIO wakeup interrupt handling in Qualcomm QCS615.
  and a similar fix for the Qualcomm SM8150.

- Allow parsing DTs without explicit function nodes in the
  Freescale i.MX1 driver.

- Enable the IRQ for the WACF2200 touchscreen using a DMI
  quirk.

----------------------------------------------------------------
Alexander Koskovich (1):
      pinctrl: qcom: eliza: Fix QDSS trace clock/control pingroup names

Bartosz Golaszewski (1):
      pinctrl: mediatek: moore: implement gpio_chip::get_direction()

Biju Das (1):
      pinctrl: renesas: rzg2l: Fix incorrect PUPD register offset for
high pins during suspend/resume

Frank Li (1):
      pinctrl: imx1: Allow parsing DT without function nodes

Hardik Prakash (1):
      pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7 14AGP11

Lad Prabhakar (1):
      pinctrl: renesas: rzg2l: Fix SMT register cache handling

Linus Walleij (1):
      Merge tag 'renesas-pinctrl-fixes-for-v7.1-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into fixes

Maulik Shah (2):
      pinctrl: qcom: Fix GPIO to PDC wake irq map for qcs615
      pinctrl: qcom: Fix wakeirq map by removing disconnected irqs for sm8150

Til Kaiser (1):
      pinctrl: qcom: ipq4019: mark gpio as a GPIO pin function

Xianwei Zhao (1):
      pinctrl: meson: amlogic-a4: fix deadlock issue

 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 48 +++++++++++++++++++++++----
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 18 ++++++++++
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c    |  6 ++--
 drivers/pinctrl/pinctrl-amd.c                 | 35 +++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-eliza.c          |  8 ++---
 drivers/pinctrl/qcom/pinctrl-ipq4019.c        |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.h            |  5 +++
 drivers/pinctrl/qcom/pinctrl-qcs615.c         |  6 ++--
 drivers/pinctrl/qcom/pinctrl-sm8150.c         |  8 ++---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 23 ++++++++-----
 10 files changed, 129 insertions(+), 30 deletions(-)


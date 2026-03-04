Return-Path: <linux-gpio+bounces-32439-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAmnE2rop2mDlgAAu9opvQ
	(envelope-from <linux-gpio+bounces-32439-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 09:08:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E48811FC35E
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 09:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A05AB30AAE7E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 08:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6123890E3;
	Wed,  4 Mar 2026 08:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QzEywzA3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5860388E67
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 08:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611544; cv=none; b=Iu1ESki2DZjAgGfW+oW9RlYhgiw4Tb46PnwjzRVOeqUFTtVhZDM6q4Pkmuur11IEi+db6yHpkKMp5ZHkZy5YxJZo6bcPZu3TrJBUtxRaS05FNobnJyULBWoMgEWsuTuMWrrQOc476/Kjm4znWZlD3BhAKEn5HpyyjwuiXL0f5ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611544; c=relaxed/simple;
	bh=8VqqRdpqE1fsIVPtyJ4ADvs6HtL425rGFQ0kZ1IZDZY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nSX7WAxg0fNmuoxDoR2u18lnAbSLreoM+ddfeMQVhA02Tw1QKVGmF8uEtIXqnrz4gtX5YWepSCIYMSHANpOcNYswM12Jz6b6ycx/zrz793ukvlT216+bqBQhqT7fGTZOVrZ5WnvvsqwVjkuKhUiHjqCUXRKhIkx7ZlRCR0EY3YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QzEywzA3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90247C19423
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 08:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772611544;
	bh=8VqqRdpqE1fsIVPtyJ4ADvs6HtL425rGFQ0kZ1IZDZY=;
	h=From:Date:Subject:To:Cc:From;
	b=QzEywzA3EoVzDBkML+5q7NMndC1bl6OfdCtxxgP6zSn7Iirjm5bxJZGl1NMEQ2q3k
	 0T0St5q7tcKWl0gvclq6eIqQmpar1CdNOz1oMc/oifgEOAqie+OvaHuE+L4lLxb/Qp
	 s22ZcK9+HdxMLcet1NtItqjjzxknGMRKVLYZO1OpE9hOgkVsx4RKFGbbaiwjAb4gWI
	 iPMGH5ApHtDi0gi3D8QHEw3DM0h8S7M5FpB3YucewwE95uuEQ9EJMQyayiJ3SmRfEW
	 DO7ukTgkeUQlEEtGFIckdKyGOmfyXZ/fhonFNXwl7/QDj+eYml+L2Llytf/33qJUBS
	 bL7ETZKo90pqw==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64c9a6d7f81so5883102d50.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 00:05:44 -0800 (PST)
X-Gm-Message-State: AOJu0Yx6iINyfNHekuRMlnVfw/PgWQvXBR0QozSs/i4uZ6k7a5ykReRA
	yydVLHfywznt4OhbM6F+sEGy585sQ4kIYE1QHlPvh2mGY46y7Dv6wbs507DJQ6APxrz6h7Ef13I
	1DVYImjjW8SgsOVnluGMNuMrneVzmHrM=
X-Received: by 2002:a53:ece3:0:b0:64a:28af:2d18 with SMTP id
 956f58d0204a3-64cf9c087bdmr736557d50.84.1772611543910; Wed, 04 Mar 2026
 00:05:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Mar 2026 09:05:31 +0100
X-Gmail-Original-Message-ID: <CAD++jLnWG49Ne5uk1eqR+O832dWQQb7dBNz6qoUKHt6HyRNEwQ@mail.gmail.com>
X-Gm-Features: AaiRm508Fxi9a_5_8bH5-tTUzEGBGeh2rdjajxCgbk3vJ8eSyrJNg0u1Gtlxuuc
Message-ID: <CAD++jLnWG49Ne5uk1eqR+O832dWQQb7dBNz6qoUKHt6HyRNEwQ@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v7.0
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E48811FC35E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32439-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Linus,

some v7.0 fixes I have accumulated.

All of them are driver fixes except a memory leak in the
pinconf_generic_parse_dt_config() helper which is the most
important fix.

As we are early in the cycle I let some non-superurgent fixes in.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v7.0-2

for you to fetch changes up to b6c3af46c26f2d07c10a1452adc34b821719327e:

  pinctrl: cy8c95x0: Don't miss reading the last bank registers
(2026-02-26 23:41:04 +0100)

----------------------------------------------------------------
Pin control fixes for the v7.0 series:

- Rename and fix up the Intel Equilibrium immutable interrupt
  chip.

- Handle the Qualcomm QCS615 dual edge GPIO IRQ by adding the
  right flag.

- Fix a memory leak in the widely used
  pinconf_generic_parse_dt_config() and a more local leak
  in aml_dt_node_to_map_pinmux().

- Fix double put in the Cirrus cs42l43_pin_probe().

- Staticize amdisp_pinctrl_ops, Qualcomm SDM660 groups and
  functions.

- Unexport CIX sky1_pinctrl_pm_ops.

- Fix configuration of deferred pin in the Rockchip driver.

- Implement .get_direction() in the Sunxi driver quelching
  a dmesg warning message.

- Fix a readout of the last bank of registers in the
  Cypress CY8C95x0 driver.

----------------------------------------------------------------
Andy Shevchenko (1):
      pinctrl: cy8c95x0: Don't miss reading the last bank registers

Chen-Yu Tsai (1):
      pinctrl: sunxi: Implement gpiochip::get_direction()

Felix Gu (3):
      pinctrl: pinconf-generic: Fix memory leak in
pinconf_generic_parse_dt_config()
      pinctrl: meson: amlogic-a4: Fix device node reference leak in
aml_dt_node_to_map_pinmux()
      pinctrl: cirrus: cs42l43: Fix double-put in cs42l43_pin_probe()

Florian Eckert (2):
      pinctrl: equilibrium: rename irq_chip function callbacks
      pinctrl: equilibrium: fix warning trace on load

Krzysztof Kozlowski (4):
      pinctrl: amdisp: Make amdisp_pinctrl_ops variable static
      pinctrl: cix: sky1: Unexport sky1_pinctrl_pm_ops
      pinctrl: qcom: sdm660-lpass-lpi: Make groups and functions
variables static
      pinctrl: rockchip: Fix configuring a deferred pin

Maulik Shah (1):
      pinctrl: qcom: qcs615: Add missing dual edge GPIO IRQ errata flag

 drivers/pinctrl/cirrus/pinctrl-cs42l43.c        |  5 +--
 drivers/pinctrl/cix/pinctrl-sky1.c              |  3 +-
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c      |  3 +-
 drivers/pinctrl/pinconf-generic.c               |  4 +-
 drivers/pinctrl/pinctrl-amdisp.c                |  2 +-
 drivers/pinctrl/pinctrl-cy8c95x0.c              |  4 +-
 drivers/pinctrl/pinctrl-equilibrium.c           | 31 +++++++++------
 drivers/pinctrl/pinctrl-rockchip.c              | 12 ++----
 drivers/pinctrl/qcom/pinctrl-qcs615.c           |  1 +
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c |  4 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c           | 51 +++++++++++++++++++++++++
 11 files changed, 86 insertions(+), 34 deletions(-)


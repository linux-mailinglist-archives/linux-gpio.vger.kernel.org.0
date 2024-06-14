Return-Path: <linux-gpio+bounces-7444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E18E908712
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 11:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11A34B2165D
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 09:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4767C191496;
	Fri, 14 Jun 2024 09:07:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ED11487E9
	for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718356048; cv=none; b=RZdva79nRSBez9M8pO5GS4r9AFH41j6NedAnXpNGjVmpwMhNvX/mEIM6msHKUndDSJPLPKRmoJbhnHoMfqhJbnjj+knY5QENK+cPyxPnQ4951PLO1229FBoRi3m051jY4nbojCBAX/N+mQ4nYw9xaCORHQFBYpNNQOGZ5qR3hRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718356048; c=relaxed/simple;
	bh=Ee/DtPlHXca7rCVnJV3qKwKCJVA3vnsIqzxfP+xSKpI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=igVyx8TVr4K6WSPrcbP4GT222BxQPodyNQWavkj/+U/WhFjc3dRW2NFD7UOJ7dUCA85A1Y5BByke+Zz+EH9E1mwc5kvm4wHw4DlNdtMgoNKjvmkPUPqNPWgJ2Jo6/TeYsgv1feaLLPtYbkwdhBAf00ux4awL3q6QoURcfMYZF+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by andre.telenet-ops.be with bizsmtp
	id bM7S2C0033w30qz01M7SWk; Fri, 14 Jun 2024 11:07:26 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI2t1-00BqRX-CD;
	Fri, 14 Jun 2024 11:07:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI2u5-00FbKv-U6;
	Fri, 14 Jun 2024 11:07:25 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.11
Date: Fri, 14 Jun 2024 11:07:24 +0200
Message-Id: <cover.1718355498.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit a39741d38c048a48ae0d65226d9548005a088f5f:

  pinctrl: renesas: rzg2l: Use spin_{lock,unlock}_irq{save,restore} (2024-05-27 17:13:31 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.11-tag1

for you to fetch changes up to 9bd95ac86e700ab8b1a6c225685e0e5afe426b4e:

  pinctrl: renesas: rzg2l: Add support for RZ/V2H SoC (2024-06-11 09:50:25 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.11

  - Add support for the new RZ/V2H(P) (R9A09G057) Soc,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      pinctrl: renesas: rzn1: Use for_each_child_of_node_scoped()

Lad Prabhakar (15):
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Remove the check from the object
      pinctrl: renesas: rzg2l: Allow more bits for pin configuration
      pinctrl: renesas: rzg2l: Drop struct rzg2l_variable_pin_cfg
      pinctrl: renesas: rzg2l: Enable variable configuration for all
      pinctrl: renesas: rzg2l: Validate power registers for SD and ETH
      pinctrl: renesas: rzg2l: Add function pointer for PFC register locking
      pinctrl: renesas: rzg2l: Add function pointer for PMC register write
      pinctrl: renesas: rzg2l: Add function pointers for OEN register access
      pinctrl: renesas: rzg2l: Add support to configure slew-rate
      pinctrl: renesas: rzg2l: Add support for pull-up/down
      pinctrl: renesas: rzg2l: Pass pincontrol device to pinconf_generic_parse_dt_config()
      pinctrl: renesas: rzg2l: Add support for custom parameters
      pinctrl: renesas: rzg2l: Acquire lock in rzg2l_pinctrl_pm_setup_pfc()
      dt-bindings: pinctrl: renesas: Document RZ/V2H(P) SoC
      pinctrl: renesas: rzg2l: Add support for RZ/V2H SoC

Peng Fan (1):
      pinctrl: renesas: Use scope based of_node_put() cleanups

 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |  52 +-
 drivers/pinctrl/renesas/pinctrl-rza1.c             |  14 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            | 778 ++++++++++++++++-----
 drivers/pinctrl/renesas/pinctrl-rzn1.c             |  26 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c            |   7 +-
 drivers/pinctrl/renesas/pinctrl.c                  |   7 +-
 6 files changed, 650 insertions(+), 234 deletions(-)


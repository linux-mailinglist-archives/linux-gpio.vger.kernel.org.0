Return-Path: <linux-gpio+bounces-14733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A66DDA0C492
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 23:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27926188BAAE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 22:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69181F9435;
	Mon, 13 Jan 2025 22:19:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1624E1F9F66
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2025 22:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736806775; cv=none; b=YnpKTry8AvqPL5DUYYEZdZo4ebdvriU7BtqMFuo99JVvn8dJdoo2vgrh8I/RDZrgF+La6w+FvumcGEhNYek9IAKismlhZKoA4E1GdMFl8xe6imIv5E2qTtMKFj6f/E0m940IdRhdKef19HouaOC5qOZFxAxoHehSMGlrhRQPOyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736806775; c=relaxed/simple;
	bh=Bpm2ViqsTzJMnPDkDF4znANf1QeAIhwge2e79wg6Wew=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VARWOorW4TY9bbgasasQV133G0ffSX5+B1Dh6tuyjdsdAfsbQoxeFL+3u+RVAZxT6bN+nbObanZRFixPdZH+FrcudFaLhkDpoFqplvjv+GGEZPWsysb/kTGzsscy3iZhAoS8NmSORN1psRE5XY4SjNetgOlsH0sOVxhO7IC14Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmF-0005yi-7t; Mon, 13 Jan 2025 23:19:19 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmD-000KYe-27;
	Mon, 13 Jan 2025 23:19:18 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmE-008p8i-2b;
	Mon, 13 Jan 2025 23:19:18 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
Date: Mon, 13 Jan 2025 23:19:08 +0100
Message-Id: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFyRhWcC/x3MQQqAIBBA0avErBvQMrKuEi2sJptFKgoVhHdPW
 r7F/y8kikwJxuqFSBcn9q5A1hWsh3GWkLdiaETTCSlbXBTy+aAN7HExifA20bGzqPbBkB607jc
 BJQ+Rdn7+9TTn/AFVrBsJagAAAA==
X-Change-ID: 20250113-b4-imx-gpio-base-warning-4f9ae89887d0
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>, 
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Haibo Chen <haibo.chen@nxp.com>, 
 Catalin Popescu <catalin.popescu@leica-geosystems.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

The i.MX GPIO driver has had deterministic numbering for the GPIOs
for more than 12 years.

Reverting this to dynamically numbered will break existing setups in the
worst manner possible: The build will succeed, the kernel will not print
warnings, but users will find their devices essentially toggling GPIOs
at random with the potential of permanent damage. We thus want to keep
the numbering as-is until the SysFS API is removed and script fail
instead of toggling GPIOs dependent on probe order.

Yet, the warning:

  gpio gpiochip0: Static allocation of GPIO base is deprecated,
  use dynamic allocation.

is annoying and prompts people to set the base to -1 from time to time.

Let's workaround this by adding an opt-out for existing drivers and have
i.MX make use of it.

---
Ahmad Fatoum (4):
      gpiolib: add opt-out for existing drivers with static GPIO base
      checkpatch: warn about use of legacy_static_base
      gpio: mxc: remove dead code after switch to DT-only
      gpio: mxc: silence warning about GPIO base being statically allocated

 drivers/gpio/gpio-mxc.c     | 23 +++++++++++++++++++++--
 drivers/gpio/gpiolib.c      |  2 +-
 include/linux/gpio/driver.h |  5 +++++
 scripts/checkpatch.pl       | 11 +++++++++--
 4 files changed, 36 insertions(+), 5 deletions(-)
---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250113-b4-imx-gpio-base-warning-4f9ae89887d0

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>



Return-Path: <linux-gpio+bounces-6129-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE708BCBEF
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 12:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C78B6282094
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 10:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32E91428FA;
	Mon,  6 May 2024 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="pFuFcelH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0361422A2;
	Mon,  6 May 2024 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714991067; cv=none; b=KTGXlPwaqDrhym1D8AnzCwfxVgRByP6ElARXuI6I5jJ3ZJnGI6GsQgaoRESYNYj1zpDfl8gtUfZfDmmml5FUCX5xyzXoPJ0/tsmXFxAucNF4N1uDwgEHPeUqadH0SOVz6hbW7u6RMRTlfK4WnJcGtoXoCOo/rlIKVch/zyJXUEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714991067; c=relaxed/simple;
	bh=M2VUMtNp5P3o890SB2AKCq/Qvl+kHhU87lLXVyDZ834=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bl8a451893J27W4ymCZsrAU9fpWPfJwF2HFxd+7cRtkemkLYAaqLGUfrlG2Z6jiFCF3IQ/2LA11Kppt2V3XwmHynMstOy8loCT5BEjmgx/jei/YgNwkGGzUQtp1s/MEWt9LTnktV45i8XRNCWymKprobWeC2h+51weUdVSIqysI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=pFuFcelH; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=wmFwpK3N8h26Gty8Cr+tcAz2yNoNekoIKLqBXcgccJE=; b=pF
	uFcelHy4P+rqcXZYlaes07Jkz/+XlIlCCaw1xTHIfrfDJaaWujw/cM8xSh5Hw6bWwx0OnAnJcr1ZT
	qPEmkkfunL4hCNrW3HFsllLqArORax/Pd8Xq+9eHSQOZJ0zL3h/p06oUnPhZhuOYKy0SUZEGsZKiR
	oFvfh2kQvEAf1NghfSHjhHwmhZOzPNp2elxLL96FKjvp7BR2T8FPygAV/l/OgiP8BTToSSao/a9bv
	e5mwQvZ43NulUKKSyvuCVqO9o926GL4Tw+11/8HLXYSVZ0Dn+La5qqEoLUl5c2SVPoanfGaKH1tYv
	ohzeqeURXEa3ECh1iZuU9mrijSPsKRBg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1s3vVs-0007Xy-Tw; Mon, 06 May 2024 12:24:04 +0200
Received: from [87.49.147.101] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1s3vVr-000Ofo-29;
	Mon, 06 May 2024 12:24:04 +0200
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH v2 0/3] ARM: imx: only enable pinctrl as needed
Date: Mon, 06 May 2024 12:23:52 +0200
Message-Id: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALivOGYC/x2MQQqAIBAAvyJ7bkGsJPpKdDDdaqFMVCII/550H
 JiZFxJFpgSjeCHSzYkvX0E1Auxu/EbIrjIoqTrZS418PhjY2xwPvEKuujlQt8a61i3D4CzUNER
 a+fm301zKB2FwNF1mAAAA
To: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.13.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27267/Mon May  6 10:24:34 2024)

As not all mach-imx platforms has support for run-time changes of pin
configurations (such as LS1021A), a more selective approach to enabling
pinctrl infrastructure makes sense, so that an e.g. an LS1021A only kernel
could be built without pinctrl support.

This is a very late follow up v1 3 years ago [1]. The situation seems to be
unchanged since then, and I have tried to incorporate the requested
changes.

[1] https://lore.kernel.org/linux-arm-kernel/be1c35eb997959b4939b304ef26664dfb9cd2275.1621941451.git.esben@geanix.com/

Changes since v1:
- Changed all the pinctrl drivers to be user-configurable, allowing disable
  even for systems with pinctrl.
- Added fixup of overly generic dependency for i.MX RT pinctrl drivers.
- Allow compile-testing of i.MX pinctrl drivers using CONFIG_COMPILE_TEST.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Esben Haabendal (3):
      ARM: imx: Allow user to disable pinctrl
      pinctrl: freescale: Use CONFIG_SOC_IMXRT to guard i.MX RT1xxx drivers
      pinctrl: freescale: enable use with COMPILE_TEST

 arch/arm/mach-imx/Kconfig         | 16 -------
 drivers/pinctrl/freescale/Kconfig | 89 +++++++++++++++++++++++++++------------
 2 files changed, 63 insertions(+), 42 deletions(-)
---
base-commit: dd5a440a31fae6e459c0d6271dddd62825505361
change-id: 20240506-imx-pinctrl-optional-63acd3db88dc

Best regards,
-- 
Esben Haabendal <esben@geanix.com>



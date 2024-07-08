Return-Path: <linux-gpio+bounces-8102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5243992A50E
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 16:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB68D1F21BBE
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 14:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56BD140363;
	Mon,  8 Jul 2024 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEq0iDly"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFEC1E521;
	Mon,  8 Jul 2024 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720450109; cv=none; b=oTxTQphWaUoXK93SIw+vyacDdsgNGy+Cwa2KODe1OUfNgWk0ChCMFf8GxBgNMlfoFrHyGouPKD+ntIk9sgq9DP8lYFpfAkcIRn7ZCbPpGJSQK0OX6S8EDY9uktJau+yyOSuPwxBBYwb5+75GEcYzt+AN1NcPung9aIDL+QlkPFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720450109; c=relaxed/simple;
	bh=A/MOAoPDUmrA9Vft8lGfjPwVgRQfL71nhsLpKnCTpQ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gD4k8L2A1FQ6kaIf4N3myHOuRmjnqaZknS+bDnKLCeJi7225gwGCsS+oNNhEpReCW5FHlhdv7ZF7e79iMZX9bdu+dT8EkA9oDoSjZ6W2PDU4llq9sEk3lu7Gf/FSCohfYSH+fFf0kdp8cgE9FNwGYU1/60LO8IsP2KThlXWW2I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PEq0iDly; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE46C116B1;
	Mon,  8 Jul 2024 14:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720450109;
	bh=A/MOAoPDUmrA9Vft8lGfjPwVgRQfL71nhsLpKnCTpQ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PEq0iDlygJzhZiW+d4mXEADIGfFA1ceL4Vm7bDox7tTMjoMBQuqvaGHlZkUJ1hfyp
	 k2BZuIbUapyY9VljKTlDydZ0+3nrSujJ3uRxO+/ayg5FAoUztJBRDCiwLJ4aSXfRJK
	 toHIItj45sjNOxYacjE7ICsrE3CmPHE2CPovTPkKb66OBDQhmwwdCzo2JHdyuDYMYz
	 llJSISyoRvVGhToHCLhMvnrzEuzyG6fqDqGKrxJ8MQ8Az2EpvOe7ni++1sCJMcuqZT
	 SLs63e+8FY6NzbhymxLPsDpBVVYAuSq4hWhebRL6e2IlzPL1qmDupQucu+GzVW/iY0
	 zSnDJvtfvJ0mQ==
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, 
 Rob Herring <robh@kernel.org>, Robin Gong <yibin.gong@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Stefan Agner <stefan@agner.ch>, Frieder Schrempf <frieder@fris.de>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bo Liu <liubo03@inspur.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Fabio Estevam <festevam@gmail.com>, 
 Gregor Herburger <gregor.herburger@ew.tq-group.com>, 
 Hiago De Franco <hiago.franco@toradex.com>, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
 Joao Paulo Goncalves <joao.goncalves@toradex.com>, 
 Joy Zou <joy.zou@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
 Mathieu Othacehe <m.othacehe@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Tim Harvey <tharvey@gateworks.com>
In-Reply-To: <20240708084107.38986-1-frieder@fris.de>
References: <20240708084107.38986-1-frieder@fris.de>
Subject: Re: (subset) [PATCH v2 0/5] Add support for Kontron OSM-S i.MX93
 SoM and carrier board
Message-Id: <172045010254.68536.1973441424876478650.b4-ty@kernel.org>
Date: Mon, 08 Jul 2024 15:48:22 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Mon, 08 Jul 2024 10:40:30 +0200, Frieder Schrempf wrote:
> Patch 1-2: small DT binding fixups
> Patch 3: board DT bindings
> Patch 4: support PMIC driver without IRQ
> Patch 5: add devicetrees
> 
> Changes for v2:
> * remove applied patches 1 and 2
> * add tags
> * improvements suggested by Krzysztof (thanks!)
> * add missing Makefile entry for DT
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[2/5] dt-bindings: regulator: pca9450: Make interrupt optional
      commit: ef0b29e744965e8abc14260503a559366219035c
[4/5] regulator: pca9450: Make IRQ optional
      commit: 83808c54064eef620ad8645dfdcaffe125551532

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark



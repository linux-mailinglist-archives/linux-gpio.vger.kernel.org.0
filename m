Return-Path: <linux-gpio+bounces-4594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 773F2889639
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 09:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32253298731
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 08:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB65131735;
	Mon, 25 Mar 2024 05:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrPZZfZ0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD74C12B14A;
	Mon, 25 Mar 2024 01:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711331663; cv=none; b=q1c62OqYdTpHSPke6ZdlMT5fRk3FyWFYY/P6Z5TKC7V1QB4YqGkaUvKLeUmbItOzReSulKkP9/GpGMFHHXO/Cl1hlJBPjdyzL3q/6nltdZzF9PdASMrOjoZV/gEW+MKHYd8X2VtevCTsaKAAwNEZbEdAizUUNuJR1v3N8tX15jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711331663; c=relaxed/simple;
	bh=x6gbNWDUC3393woiAhRGtrXvkbgxFEKnVO43IWMARsU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eP6bQ1+sLouWjrmtFI5UxjaZoYJlgy49aWxyNu/JGZJ7cx06Ba4lf6oeW5TApEYLFZXE6HYRjmZLRG0CGrHgwmgJGnnsBYZJHNnT5JA/WA4xY136i7kZCGsv3xygvBdfF9Bf+dSI5JSGptKDsujTnlkPVMj82mAIyLIWbw8fV8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrPZZfZ0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70C87C433F1;
	Mon, 25 Mar 2024 01:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711331662;
	bh=x6gbNWDUC3393woiAhRGtrXvkbgxFEKnVO43IWMARsU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jrPZZfZ03PsaQD3fMGm9nq2UPpPmNCR2UhRG5lEG5sj1PDjplq8FZ75Zbzq4M++fX
	 Q6TVSgOVQbUvhZzKhKOQNbQwhQhy2BZ8MRkhAIEF+3w0ilwV/nWxm1rjxE/qfP/Mr+
	 E3yc5dSuBNp0Bm1L/KI5QDwiA8kFCuNjxzWIU7cCRVNPOgSNBZV+qUtQOY4O/YoTDT
	 PFwCgNm3HEFcmI1zG6v/j47VLsywRsjUKgaIEweM6/K8U5bK1qRIu9RKHx/KjIcwnX
	 cAPddvxMuoVuFBd1hKdjXjkxNm2QAvn+OmyKHTZvNymrjm/TZ8YaQVQ3vy0XdpqBcO
	 88LTlEfD/nBQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59B24D2D0E0;
	Mon, 25 Mar 2024 01:54:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 000/164] pwm: Improve lifetime tracking for pwm_chips
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <171133166235.9916.5159550524752322105.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 01:54:22 +0000
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@codeaurora.org
Cc: linux-pwm@vger.kernel.org, corbet@lwn.net, Jonathan.Cameron@huawei.com,
 james.clark@arm.com, andriy.shevchenko@linux.intel.com, broonie@kernel.org,
 marcan@marcan.st, sven@svenpeter.dev, claudiu.beznea@tuxon.dev,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com,
 shc_work@mail.ru, bleung@chromium.org, p.zabel@pengutronix.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, paul@crapouillou.net,
 vz@mleia.com, mika.westerberg@linux.intel.com, andy@kernel.org,
 linus.walleij@linaro.org, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, conor.dooley@microchip.com,
 daire.mcnamara@microchip.com, j.neuschaefer@gmx.net, heiko@sntech.de,
 krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 mwalle@kernel.org, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com,
 zhang.lyra@gmail.com, fabrice.gasnier@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, hammerh0314@gmail.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 sean.anderson@seco.com, michal.simek@amd.com, brgl@bgdev.pl,
 andrzej.hajda@intel.com, rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 pavel@ucw.cz, lee@kernel.org, quic_amelende@quicinc.com,
 quic_bjorande@quicinc.com, keescook@chromium.org, robh@kernel.org,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 kernel@pengutronix.de, linux-doc@vger.kernel.org, alyssa@rosenzweig.io,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 groeck@chromium.org, chrome-platform@lists.linux.dev, festevam@gmail.com,
 linux-imx@nxp.com, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-mediatek@lists.infradead.org,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 dianders@chromium.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 gustavoars@kernel.org, linux-hardening@vger.kernel.org

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
by Uwe Kleine-König <u.kleine-koenig@pengutronix.de>:

On Wed, 14 Feb 2024 10:30:47 +0100 you wrote:
> Hello,
> 
> this is v6 of the series introducing better lifetime tracking for
> pwmchips that addresses (for now theoretic) lifetime issues of pwm
> chips. Addressing these is a necessary precondition to introduce chardev
> support for PWMs.
> 
> [...]

Here is the summary with links:
  - [v6,001/164] pwm: Provide an inline function to get the parent device of a given chip
    https://git.kernel.org/chrome-platform/c/4e59267c7a20
  - [v6,003/164] pwm: Provide pwmchip_alloc() function and a devm variant of it
    https://git.kernel.org/chrome-platform/c/024913dbf99f
  - [v6,029/164] pwm: cros-ec: Change prototype of helpers to prepare further changes
    https://git.kernel.org/chrome-platform/c/7256c2e79b8e
  - [v6,030/164] pwm: cros-ec: Make use of pwmchip_parent() accessor
    https://git.kernel.org/chrome-platform/c/19a568a8d3c4
  - [v6,031/164] pwm: cros-ec: Make use of devm_pwmchip_alloc() function
    https://git.kernel.org/chrome-platform/c/452be9421eda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




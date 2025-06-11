Return-Path: <linux-gpio+bounces-21359-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF4BAD50E2
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 12:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F2A93A8A49
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8A1269CF5;
	Wed, 11 Jun 2025 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="Jxt6xsAg";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="Jxt6xsAg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5455626988E;
	Wed, 11 Jun 2025 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749636220; cv=none; b=ZM+bBLFI/kXfanKCnFnv99Cfbm9862Fn8gGk36PU3TinWNorfISRvq/MRq47X7FGuvOd4s6q+gw3e6Bcvf1hDpPiA2Ga66DS47AGaspDsRcftAymyMrqzKdLS2OqyDsczMI6PP9a5sMkeMd9+SJTuriwiYjw2DhdCnBpMOfekdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749636220; c=relaxed/simple;
	bh=ZELWje44IQXg+aqRqhMjZlzmAPP8bdbQVZYOFJq3M9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPwi2aCIyJBP1/jIqYMSsWp8Nr9duv8gpVAemQ20wbc4cbKB/W0p2uqFUkaZL5QygGnPBAZiThvwXbnoBQoeAJSEtcrNJH3AkQCqNr7TC/7I86hGxHxIXbaonHK8R4aimiR3rAZt5kNkhSL1n7iO8/0W/1BQqDoJocRH8dKh3OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=Jxt6xsAg; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=Jxt6xsAg; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1749635665; bh=ZELWje44IQXg+aqRqhMjZlzmAPP8bdbQVZYOFJq3M9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jxt6xsAgMAOUb4jl76i3Cw/ob+3g27CDrEJ11UaNWweARmh3pASKr9vGVkS92IFac
	 YPXA6hqSgGV5dnyifiEPzFxSuWmHwqtnnBorcndP4VXu30erdJBfP8YrJ46WtqkT2C
	 ZB5SXynEGjYF90uyMsBkLTP7/K9tKTjfvpNQc65M4ZFGcmOJyetoZJbQyfgMTcccnC
	 ovv/hF2800vFjHZenrXZ9Ib3Cs3634CyeipOu5H15sVoNWHX/j8qicu106Z5ZeHvjj
	 l5CXC3vkbBXv/RUgPw6tOFDOWz5MZGDnaCREKgxUUUqRvZgLkdcVlwdN1MIjOJGq3p
	 fGRPXfFbZHprg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 964313C153A;
	Wed, 11 Jun 2025 09:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1749635665; bh=ZELWje44IQXg+aqRqhMjZlzmAPP8bdbQVZYOFJq3M9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jxt6xsAgMAOUb4jl76i3Cw/ob+3g27CDrEJ11UaNWweARmh3pASKr9vGVkS92IFac
	 YPXA6hqSgGV5dnyifiEPzFxSuWmHwqtnnBorcndP4VXu30erdJBfP8YrJ46WtqkT2C
	 ZB5SXynEGjYF90uyMsBkLTP7/K9tKTjfvpNQc65M4ZFGcmOJyetoZJbQyfgMTcccnC
	 ovv/hF2800vFjHZenrXZ9Ib3Cs3634CyeipOu5H15sVoNWHX/j8qicu106Z5ZeHvjj
	 l5CXC3vkbBXv/RUgPw6tOFDOWz5MZGDnaCREKgxUUUqRvZgLkdcVlwdN1MIjOJGq3p
	 fGRPXfFbZHprg==
Message-ID: <2ae6aa29-ea42-4fdf-a0ae-8cd088c88786@mleia.com>
Date: Wed, 11 Jun 2025 12:54:21 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] pinctrl: Constify static 'pinctrl_desc'
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
 <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250611_095425_660571_DE75DF41 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message. 

On 6/11/25 09:13, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/pinctrl/berlin/berlin.c                    | 2 +-
>   drivers/pinctrl/cirrus/pinctrl-cs42l43.c           | 2 +-
>   drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2 +-
>   drivers/pinctrl/pinctrl-artpec6.c                  | 2 +-
>   drivers/pinctrl/pinctrl-bm1880.c                   | 2 +-
>   drivers/pinctrl/pinctrl-k210.c                     | 2 +-
>   drivers/pinctrl/pinctrl-lpc18xx.c                  | 2 +-

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

>   drivers/pinctrl/pinctrl-mlxbf3.c                   | 2 +-
>   drivers/pinctrl/pinctrl-tb10x.c                    | 2 +-
>   drivers/pinctrl/pinctrl-zynq.c                     | 2 +-
>   drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 2 +-
>   11 files changed, 11 insertions(+), 11 deletions(-)
> 

--
Best wishes,
Vladimir


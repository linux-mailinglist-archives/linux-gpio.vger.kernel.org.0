Return-Path: <linux-gpio+bounces-18660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5009FA8406D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 12:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D662C3A948B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 10:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5631F26FA69;
	Thu, 10 Apr 2025 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcovJHeT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1137020CCD9;
	Thu, 10 Apr 2025 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280031; cv=none; b=VTcYk70vsnLjDYB43ks31a+AHcj43IgrwpFCTqdySn3JjF6T+Bs0X2atgBRgPL4w348PzhjSkAu1Xlhl4IP/6H+/ekv8xMcIqFxgT3wYILlsME66ljYrseoqMdUfrn4rrE75541mFD64ubk1zFPB+gZM51T5rY6QNUC0NTpH4MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280031; c=relaxed/simple;
	bh=BENSn15Qjk13RK2VIHCjWB0plCM7aZZ2brzj0YV+5QU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RUH6FlGlyd2jdIRWntGMgFdnsumVAsIY8Hll9Zs8u3w3GfmkspQbymFkX3Ja5mgkDyXED4Ueri3DNHw6l8pIZTDDdCRGOcMEE6i1gO1kQbaGnwJvqdlfw+Kk51aNxgAClSK791j2lEI0XpWRSJLtpcWxWZhrHLxUxcEjA0ufyZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcovJHeT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3902AC4CEDD;
	Thu, 10 Apr 2025 10:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744280030;
	bh=BENSn15Qjk13RK2VIHCjWB0plCM7aZZ2brzj0YV+5QU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EcovJHeTXPaSf6/wgnbe8zGrmEERvqRxHkJLy9Hqat52TdTouVAUAx8/Za8FzJtSd
	 uLJrjSnr0tlWLc9uOepwfncZLcsR2rwSrmsM5n0b11PA1kxsNArZWA8kvKNGImHNkK
	 r1EOq3Vfa4hoD8fjWHt64UmWnOgFwjH+eb4uFtI2cQk8OUAyTQF5WerTaDAyV6mWYn
	 ut2/wOanC0z8h+DsHDgsBrvd3pOPuV48eRoawEHm/zXWBN+3eghHC8U5S7wz7sdnEg
	 RTPMkCNDkP57NYyQUFGK6krZgse4GOLJZqBWbM4QnC428A1AgcgPfnbhCO+OktZi38
	 pr3uhR3zpCIsg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-mfd-v1-0-43f4d86d01d1@linaro.org>
References: <20250407-gpiochip-set-rv-mfd-v1-0-43f4d86d01d1@linaro.org>
Subject: Re: [PATCH 0/3] mfd: convert GPIO chips to using new value setters
Message-Id: <174428002896.1707119.861401860713534508.b4-ty@kernel.org>
Date: Thu, 10 Apr 2025 11:13:48 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Mon, 07 Apr 2025 09:24:12 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all MFD GPIO controllers.
> 
> 

Applied, thanks!

[1/3] mfd: sm501: use new GPIO line value setter callbacks
      commit: f66349748885325eaa4abb4f99e0fb8fa36105d4
[2/3] mfd: tps65010: use new GPIO line value setter callbacks
      commit: 070502a0056fcebc1d66c39b46ecf7bc530a203f
[3/3] mfd: ucb1x00: use new GPIO line value setter callbacks
      commit: 9dcbd9f7238510e272780ac9af82528b4f7b9a87

--
Lee Jones [李琼斯]



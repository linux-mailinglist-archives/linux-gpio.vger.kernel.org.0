Return-Path: <linux-gpio+bounces-6009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F072C8B98B5
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 12:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B34EF284646
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 10:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE0F56B92;
	Thu,  2 May 2024 10:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Zlpb2JFh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C8D56B73
	for <linux-gpio@vger.kernel.org>; Thu,  2 May 2024 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714645343; cv=none; b=RskzozpyPi17HnmJRwpUROK7SRWgYQCWnmLViWAroAKR+IuX//sS0EZaxk2goCJXWPictrtijo9eO+9Dx0MunTVYyIRGrr0QVcDGcMCKsmv+I3P8ne49PgCr3SdxS6fcJmZU8M3hUZg52NcUJfyie0UM0I6VWgYcTRQ/dJmCXA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714645343; c=relaxed/simple;
	bh=2OZSV1+cT6t9B05uVNdfkG8bQP/A/P/SEoquilK6nSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrBhjNnZvYAwqII4WtMJCuEj30q94L0KCTrwivGbM+tOC++lb4Umw8mQ5QAK0PBHdHX0FjrkiMxvbp/xt1X3D3ZpSGOHn/u2ClQd6tgFdxPbH/L0TJGsC+lL/xGA/sqdxvjKhBAPYD+XIZx1aJE9llI47Lix15d26QRW2x93fkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Zlpb2JFh; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1714645328; x=1715250128; i=wahrenst@gmx.net;
	bh=sICtvae4w6fGUdaYH5UV2xHiPOrtsrr2tfTzWOa7cdY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Zlpb2JFhQRciu3mqt6wdLFBEfTy2qjqIPS1NkzzGL1mogBVjZiAr/pyYIWBbV2ff
	 IQRN7cEABQnRpEN09pm1/Pexaj8rG4aYyxFsWKY3GuzBaCIrXZtZCwgEOmelqjSWV
	 KpbkZKmZRHP0gnQlzvenPNXpCb3l7E05TGTJC/5Qw/9ZDl7BgKMwGE0nskiBZKzy5
	 8IKCHRAkpyj2qWX0X7lCkLS7XpoKaPkqlxqU61YQhKUhjs7iISEIlbaU8xB/RT2aK
	 4V92jEAl92fox+aFow5jBtjB58cl4WSfQLx8V9MxT85SgaBrDf/xLqxijB1d2sFUZ
	 pmoZBCp1bLtqbZCM+Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MG9gE-1rsYUW1Wuq-00GU2O; Thu, 02
 May 2024 12:22:08 +0200
Message-ID: <9a7fe0d8-ff44-4904-84cd-7b133f40a74b@gmx.net>
Date: Thu, 2 May 2024 12:22:07 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: bcm2835: Make pin freeing behavior configurable
To: Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Phil Elwell <phil@raspberrypi.com>, Kent Gibson <warthog618@gmail.com>
References: <20240419204057.86078-1-wahrenst@gmx.net>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240419204057.86078-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:n+xJqAdI+ugpAqwkCf+n8OnY8BjWTrkyhnY+IxIiXdPbzknRoD4
 gAIck8rASwZF+ZSggD+bTQDmtPtxlioiO4DjnV+YAnRn5RhoAOt4ozkwIDZy6gSoXzdgeTs
 4CsEz2sv1gRoVLk9GcuU0lebY0wQj5ISMRIm66GcST7fSboU7JtrNM38fPY52DHB4agR+t5
 qbqFr1M6w2sfSDWJ6QlZA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Iqa+feJShuY=;QZWfEBWFGGphMu6hSB/DSyVTyiH
 oaUe2VI8aNpiJtiaQWO3UyCnbHJqC2q3pBWyfng6pI8lSV260s+OvMSXl+uFjoldFCO0WekLe
 rp0Ole6DaAYSuYbkOBQgh872Zq7m3JAuseQM5C2WRw5dCbvPJA7xx9ijIChH8B01XdJV0RPJ+
 5eueocSjLqnVv7KJilm4YHfUf5WnP8cyrK24/q5bIuOan/aYEo0wI51FjzeoCSEBcIfvKeLm1
 CW/xMu4opPssrDfPQAAlACOB465y4nWj4NaQztc301tYvZAz7k18JMQdqme9KaKjIeU4qDkqx
 l8Wl4vTq8NY1Utiq0ln8lZLfNT6CWHr1hS94nSoEBqxy8C7Jy4D6BQYzcFeAp8Jb1fgPJyVxr
 KwKKjbDrZyDNJ3HPDy8qginPKt4yxd4MIS99Mk/xZTgdzupgiSuQIsTBdRTo6Omv9/bOp8afH
 WeZw9Iu4t6qkj4qxcsxd4LoKiIViet99SKbtI+7KsIN7KMZqYW5IWf+0VNnAD40EyzFbf1c/+
 ImmIlVQ2HP96upYTVBFCzkl7zijOvrbJPINAA2V3SvjZppvfj/kL8UhBS7eDWANcS8zn/IZ09
 gwfnsK7qJK8izAES9+Pkr4kdXvo+rMw1bw+P/lwYUiikCBVr/cQBJCSAKil9TDJIVvAHq+Zhv
 6JpQgGxKv9sBWR7sPD04TXj4hNJJ3DOWuft5l5/E1nwIv3Dv0+ZXhAKgQiWdxji7YgKGSKhii
 CoKfVAmx4cOGZ7q/VKb/zwHqUG79qLWAfbAzYuqD9+XSBUU7WC6k88I0hR4pBJASL3z0bJuQq
 ek7V86eCtzQK0muCeCOv9S6znQrMRd87jwwpeYuQIxAgU=

Am 19.04.24 um 22:40 schrieb Stefan Wahren:
> Until now after a bcm2835 pin was freed its pinmux was set to GPIO_IN.
> So in case it was configured as GPIO_OUT before the configured output
> level also get lost. As long as GPIO sysfs was used this wasn't
> actually a problem because the pins and their possible output level
> were kept by sysfs.
>
> Since more and more Raspberry Pi users start using libgpiod they are
> confused about this behavior. So make the pin freeing behavior of
> GPIO_OUT configurable via module parameter. In case
> pinctrl-bcm2835.strict_gpiod is set to 0, the output level is kept.
>
> This patch based on the downstream work of Phil Elwell.
>
> Link: https://github.com/raspberrypi/linux/pull/6117
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>   drivers/pinctrl/bcm/pinctrl-bcm2835.c | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
Gentle ping ...


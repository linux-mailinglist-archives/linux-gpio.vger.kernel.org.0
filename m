Return-Path: <linux-gpio+bounces-8979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3D095B342
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 12:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E1691C22DFA
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 10:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471D4183CA5;
	Thu, 22 Aug 2024 10:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="JIaK67v+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CD4183CA0;
	Thu, 22 Aug 2024 10:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724324076; cv=none; b=kFKcjD4/xFkhAs8agCp9d3ImXm/FBrZp+PiGuYhPLrAcxpvtTO0CU/+tJPZCzm0JgGG95FJnlaEh2vIASvqTsYBSjnaiLCQHmpA9o+p23vmKVXHAR0uONj7ZbEsNpdFd3mqze6D/HLOisPZ+f2P0wZUXQp01qCLM0GCm4+s/1Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724324076; c=relaxed/simple;
	bh=HiFsjXGDeGkHbNvJdIEgF9kVJxOiIPq/dIz6D60/P1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QyeuN71174Yd7BgZKsYMlpLCTMakcceySEUUg0A91ZSzwwlOgPeyyUxdhH9rgNsnYNOg9QhwmL3CFYvuMZDGapKq/e4cNqQB3MpXHPLGUhTEBPHW5sAqh9muxtzWx+J3yBrevqROW1mHHyvjNSojs52bQ1ZPKFB/9HQi0LGkoCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=JIaK67v+; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724324058; x=1724928858; i=wahrenst@gmx.net;
	bh=zOFP5BWBuetc2TrQOrHHuI03YWZfStPHpDr8stAP600=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JIaK67v+tbnyBGa0KffZ+TqajLehpZeO8GEE4+ktUNFnqzAVqA9qUNHiXf2wAER0
	 30QyJXsSEyjOfmrj54j7UCaP6qWAROcAx1auj6vn0NdOqfi4FRNEUE++/lO2lMArU
	 l0CWeLQK+s4KLphi3FdnTJrVh6dKPiArA1LwsnGYL08YpN3jFLV9uaGJkTq+JmczF
	 ut98nrN3GiBkHuYuOj516Mh1mK+D49vapsHYOWiX6BWVS+KGxVWJrQ0HCzmqbqqty
	 FwqTXCbSIjKmtGgtXemnc585bFU6haG05+K+M7tNYqEEod6lbGJ3w6Qa7HKL2K5Cz
	 ocqpB5HSkUjCNnIe4Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxlzI-1rvQTk2joU-00yTu6; Thu, 22
 Aug 2024 12:54:18 +0200
Message-ID: <3d29c7be-b1a8-46db-a6c9-d53ecaeda02d@gmx.net>
Date: Thu, 22 Aug 2024 12:54:17 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: Add support for Broadcom STB
 pin controller
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: "Ivan T. Ivanov" <iivanov@suse.de>, kernel-list@raspberrypi.com,
 florian.fainelli@broadcom.com, andrea.porta@suse.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 linus.walleij@linaro.org
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-2-iivanov@suse.de>
 <200d54a3-bedf-4bd3-bb7f-0d834c43ea78@gmx.net>
 <CAPY8ntB9Zf3sJejXuzrw6tUipfv71w4sDc26fg8cbMtRjrcPHg@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAPY8ntB9Zf3sJejXuzrw6tUipfv71w4sDc26fg8cbMtRjrcPHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:e6jzzM9cG8z7Se31hDznIvK6iI3JkgLsX6AzocJxQjOLoIB1EZh
 oGqHrL+bF4AvLnEb73lPCU32kiK0JAK5jJS87KvX53XUEDcyctoxkhHG9P+eianBYv4oLlx
 ETju6YYOyOR9yQxptgT4PnMK7J1Fvfp+Q24QLQEBC4ZXNdHhWe8jNAvM7s+mcT7//HsN4GF
 Fu/3xQTdRg+1YrKojFMaw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eI6EEVLqXOc=;woPS/4z2P8/ZPhzgvEsz6ILpy7Z
 4Xm7jGF5RVZPQyaTmonACqwqYQXNvamaiUO+tlpsb8Mv3XkOPRs3sITSGRvg3gbkF7ygjl0BE
 A69HXIGnCPxiOcqqH67IFufNRPpSi7gEkGYSiRfahtSVEmSi/uoR5b4us2MfX6xSwIAzCTT9v
 zzKD2dzaLJ6v/I7j5WhZl87Kit8OqNpQKuOwGexizcDXqEgQK6f9oA3rB+zH71rkfY5+waDKr
 7URAupUSkBNTg0W80rmDahc7c/jH4eiUCduVpTpDfQZnfC3Lyzus1fwSAlZnm670maHsRH+sj
 KYHfNAFWuqYQP787rnmHHgLeoj/WdcAd6n9KfY3SZbBNNKOjlVTMhQiN69kP5KtJlGufXq5Xu
 tFZeNkRlGK9AQEMrs592f/jQEGeFhDEsUTOIcWPcprSrHaelxUaxeGp+aTD44R4MFvICubBRp
 Sw4xvho/E1Fu2hl3pENqGWa7vc8C/HzyRPVhsNSEq+zB9u1W+jKf4RJincRXyqbhHJOL80qHC
 ssBi26PUz8e5OM8afBL7ZD2SbdNbQa3HrnCoPJt4buJrPz1Qg11mVyMwxJKjUnYe84wlMdkfb
 mDQVYD6hXWZ4sRFoNtRxhQqYkmG0v0WlNs8HqWRSAyGN0S9tLPVMlECJMzwfRXAhApnG/AQ9O
 5E0BCG/fjEcJTXQ4igiIn1E9zkg0xm6Z/YRfelUHZfwW6J+eU4Wetan54n/FpXCXF2H0OytNH
 Su/Q+JHydkLYSE763j1nvIpxIDMHwzj21IVYWKi+lfNkkz0NTi/UBTi0fIxp6zQX6Tn/JunMf
 ow1U7bjbp3rKupv8+sqfax2tSYJIuIFe2f6TE9RepmN/I=

Hi Dave,

Am 12.08.24 um 18:28 schrieb Dave Stevenson:
> Hi Stefan
>
> Sorry for the delay in responding - I was on holiday last week.
>
no problem and thanks for the explanations.
>> I'm missing an explanation in the commit message, what's the difference
>> between brcm,bcm2712-pinctrl and brcm,bcm2712-aon-pinctrl?
> Two separate instantiations of the same IP block, but they differ in
> the number of pins that are associated and the pinmux functions for
> each of those pins. AFAIK there is no way from DT to specify those
> pinmux function names, so otherwise
> /sys/kernel/debug/pinctrl/<node>/pins will give the wrong function
> mappings.
Yes, my request is that this or a similar explanation should go to the
commit message, because not all reviewers know the IP block. It would be
great to explain the aon part. Always on?
>> According to the driver brcm,bcm2712-pinctrl is the same as
>> brcm,bcm2712c0-pinctrl. So the former is more a fallback?
> I'd need to check with Phil (who's on holiday this week) or Dom, but I
> believe you are correct that "brcm,bcm2712-pinctrl" is a fallback.
> Most likely due to our early DT files not having the c0 designation.
> Obviously for mainline that is irrelevant, so dropping the
> non-specific compatibles is fine.
I agree.

Regards
>
> I hope that makes some more sense.
>
>    Dave
>
> [1] https://github.com/raspberrypi/linux/blob/rpi-6.6.y/arch/arm64/boot/=
dts/broadcom/bcm2712d0-rpi-5-b.dts
> [2] https://github.com/raspberrypi/linux/blob/rpi-6.6.y/arch/arm64/boot/=
dts/broadcom/bcm2712-rpi-5-b.dts


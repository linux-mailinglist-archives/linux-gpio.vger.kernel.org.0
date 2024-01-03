Return-Path: <linux-gpio+bounces-2000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE86823596
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 20:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B4441F24F0C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 19:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534E41CAA8;
	Wed,  3 Jan 2024 19:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="RVc/2TzO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8731CAA6
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 19:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1704310206; x=1704915006; i=wahrenst@gmx.net;
	bh=nHuUi5SfMms56Ibzm4hSkheF+BqJFDwXZ2pTCT9vxSE=;
	h=X-UI-Sender-Class:Date:In-Reply-To:To:Cc:From:Subject;
	b=RVc/2TzOHONJyBliwYufC5eQZqPKlg3m0izvM6TjNrPsXuS8nzf3PfMsL4tZm4sV
	 Q+aeLe9GPkBDi65yx93BVuAa0rSpLxE5+ktt6uZZrb9Lr+jubU9DEf/a+3pcT09Wz
	 DlGKz53AxExhd2nXwBpGPnUTvCZFCuX35uyUUGJX2zQhqJTpA45Ct5Vb7wphaPVTh
	 LnVKczK68afvP0k23ImxvRK4dx3Zjadh5DwsKH5szma8fpCkjUvUEB0kcgf4vxmpR
	 UGT1SsZzviWGTAvEHMhHuWlOtkMnUnf4TT1GiX3o04ZiIOmhVlLwQICelqFi56eFx
	 DZ8notlVlnZNprzFnw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6bfq-1r9RnE393u-0186jL; Wed, 03
 Jan 2024 20:30:06 +0100
Message-ID: <68431c5c-e74c-49a6-be3c-9a0d85cc0030@gmx.net>
Date: Wed, 3 Jan 2024 20:30:06 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
In-Reply-To: <20231228092915.GA67274@rigel>
To: Kent Gibson <warthog618@gmail.com>,
 Seamus de Mora <seamusdemora@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [libgpiod] Some thoughts following a brief test of libgpiod ver
 2.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gVRJjUi3JBaptJg40W2iKpEp6+XBU5sJOwgMf7mjR/rh6FyzAb2
 BnZqWPijh42KKDItvpP7Xld/xZ8U4wjb6xYyxCS5ycawrg8lKHuEMYX/WRgu3NgJ8JDCT8N
 2LmoPxpQxEzpEsQTcZAKF7qIvOErBZkYsPOzZbWF9qI2bLLvwiCP3J7TYvcHLCXCPYlCbjC
 mkGRX4rSJMzlrNKDYcptg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wA4zF4EG4vc=;Yp1kto117kEdodiKlYL8TMTkRAR
 aGGKM5cmWEz2kXiiHkHUcGR94obFq+FauvlFEqF5kyekARDqnYe5HC+X52Buc5VqCx0+iepKP
 /v7FseJqJKqPRneil2vMxuIoeU7n9o+TB0UjEC6IoN5n1zg9924Ki7+NXsLqKAw775+yp5cOg
 6Kj86ax29FNZXGkFp8IGY2CQCpLa9RIgTY71v2R0nA/bIYa/kcgsoqsnLtr/GqujeDV3Wj8/y
 kUZUKYwdX8eo3EmuJUWXeUytO43WJ5FYO0PUDarBkDLiicbgBotyMTbs7B/lP/UaeoHUIdGfZ
 YlwU+29Pt5s7SvNIzZ8622dY9VWXDt6EVggk2GfiOXPd6PxR1sW8UD3wj2qelM1i9J4K+DUTT
 EgHwQCOSaJBil4SgLFzVPtctkGwQLPzGcLKKUPd9MK4GQcKHz8ErIZAX+gw9XUyPBIStPyO+J
 ZjMqy+n0Ct2yjRYpDzaTWrf5dUTSpPxWu24YMoWDENKjVu8yNHoIR2LN/gsu1f22Odntijjzg
 j150y9NC/xcPHi9wjzLwbhKGa+1WkdXSyejy3jxHlZE7LSI50N+VgTSsA3CTk2C4wMsEIJHRw
 CtijclHZW1OVyI6MFyjU2US2WEPExLbkjLoC0t2hrxpra47Yo2yYtTtJilERxaFIJTIJwryPQ
 kCT1lzUfpeglrhQpi3IKUnsNvPvCVeN9i0E5Vg5cEkQ55YB+om6Iry55BxKtPn515M0gMrQp1
 6mrZC105gsVq+kigGgSMSxUZiS7uI4RO2WTjd7znDGESKghu622CdQ+3ymS2/dT4y49kXsxRj
 z3dyRhtaQbz/K7Ad+SDfYckdUvHSkp+YPuQOy7m4FfV3V/zaeuSmxVCvm3amurnNSN561B4gd
 oy7wAHJ38gugB3lJTanYio/KIl5UT06oMvRQNGMjUISDtj6huc32Aj9dkpWLoOk1wDhvK/Plz
 ScFAj2CrB7anWQ13nNEKvz2ImIQ=

Hi,

> Then you might want to update your kernel - the kernel device driver was
> changed to support peristing [1].
>
> I get this on my Pi4 running bookworm:

> $ gpioset -t0 GPIO23=3D0
> $ gpioinfo GPIO23
> gpiochip0 23	"GPIO23"        	output
> $ gpioget -a GPIO23
> "GPIO23"=3Dinactive
> $ gpioinfo GPIO23
> gpiochip0 23	"GPIO23"        	output
> $ gpioset -t0 GPIO23=3D1
> $ gpioget -a GPIO23
> "GPIO23"=3Dactive

in order to increase the confusion, i need to mention that this behavior o=
nly applies to the vendor kernel tree. The bcm2835 pinctrl driver in mainl=
ine kernel always falls back to GPIO input during the pin is freed since 2=
016.




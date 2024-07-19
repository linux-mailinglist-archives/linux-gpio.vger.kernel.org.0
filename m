Return-Path: <linux-gpio+bounces-8292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F40AC9372DA
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 05:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29DB31C20F3D
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 03:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9F122071;
	Fri, 19 Jul 2024 03:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="pXEx2qZE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ACA171CC;
	Fri, 19 Jul 2024 03:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721361212; cv=none; b=ltB4mdwBW0CudhgtLv+6Qp5voKpkpsvpygmKrqmP0IKLftZXV+Tcyr4pMOJF8N5+W/PrLEDZCoJbPEHYfAq6Ry3a9DGx5EOh3WBn5+mda+ZoFp2Bv/g8OVt094fAoDUg12mecv469PYVbx+yvTn7ViFWbyRPjGIJ6kQNuG+RJDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721361212; c=relaxed/simple;
	bh=VHlgZ/OTWe1/HExg1cxMRiz3lF6HHTHkZUtu+cuV81U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axMUIMOvlRwy4dfqq4aBDFn8uvd8KHnTv5BmJuegSJJgwJZehaCf72wWBaaAezf4oUr1VZcOTnylXa3UcKxlV5uYNXDj9K39KpqajwFRT2lonUBsUkDts2ul1f6qg8rdvXzO9FRKDplRMEDxudg/6S80Sj0LgOyOfPRPDxQ5ySI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=pXEx2qZE; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1721361206; x=1721966006; i=wahrenst@gmx.net;
	bh=VHlgZ/OTWe1/HExg1cxMRiz3lF6HHTHkZUtu+cuV81U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pXEx2qZEOE+lg9jNHCGsZgry9/UeZOCVU1Q7/PxgbUK/0ker6Ym7NEKeyHrIQcGa
	 6fVLyyKC63qBKeJy24A9bq493vT3wom4EIrVUj+eOpHHM+5XI9bgccTta7+X9Bim2
	 W0dOXum7P1i+2JLdp0QvYLHlpjE7rH4DHYPUkjLir82OTk6MO95Tut12UIUwPFKze
	 aobHliJsqQnaTcRgvbE5A10I3TmSkVYRHG567tUEk1EYnwnvQFrge/9FqBiWoeuKq
	 YWwREpXIx6m0ZOLF4EFkJ8ji4SZpailQqyRjXEqqyAf24Lg32Lyz9lXysP9hSAPDQ
	 3pTF+wDYVwWGczOQTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiJVG-1rsadU03ZG-00j9Sn; Fri, 19
 Jul 2024 05:53:26 +0200
Message-ID: <2e66b506-0b09-41dd-bc67-8c6935ce5157@gmx.net>
Date: Fri, 19 Jul 2024 05:53:24 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: vf610: always set GPIO to input mode when used as
 interrupt source
To: Bough Chen <haibo.chen@nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <CACRpkdaRxoEZT1_KyJ3QMDgBcciw1XUXKr=cEiPxbcwSnpmyiA@mail.gmail.com>
 <09eb7049-269e-4616-a33d-5b304c7aabf0@gmx.net>
 <DU0PR04MB9496F701AE831C2DEDA6205390AD2@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <DU0PR04MB9496F701AE831C2DEDA6205390AD2@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uAr16I2tM5ofjxieE8Bj3mCTCV2yUWQkgxW13YNVZu18Es32bl1
 KwK+GzoGZ2Te0PaSNC4s2rTLXOeVr9LvAmoeHEAd/gfdX1QrjkASTRiBWv+Vi7dncJ8QpPZ
 oyeRKNS3OzfaMH1pIQlMMZM2TlM/m2y1hpshOBJ0W5eKvVnB3iZFY4pWvk7JQkFdqIfxdas
 UG0tIY3qruMZh+nHENT6Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:glpSxpT8IEQ=;FWppbpOSmfcNWN4q9pn/pAX9nsg
 5mzek1kyptQm8B3Mh7XLLViIy0O/8yXIlNEX+zO+D7TdJpxV34VURwbP1qpgpRuXg5IQNLAoH
 cXwkvigyR79pvUEecT8qTMt4P3mX7zWyz/fiDnS1/+Q1VNNgqZGFVftPgCkbOlMzTg+a2j+is
 GPiumtfjPRDCb6p4o8dpZ+LjJKJTmNrfQ3BhraCcWHQwK7u8hqebdeJCuqU5YrZZB78CpVD2H
 foaOlvlj/eXcjvmjgKhBPh5YFg9yHA1JxNxBMwJ2K0hDVWDy60uxhopFPLxBAMgp4F6mON1jL
 fTFvnhiKTVzMSlh+w220iLvOtSu3+68MLbt/TVqMy2YtbO+PLNki5e9pRIqtSlsL9NSgG8G+M
 eKi/MCD6kkRlpMQt9trFZ2G5gws9pwTNIUosoekUw6NufFX14ljhtRg4oy8r9YM60Q4bzCX0o
 aGAhMH+HWR0HpGJFWNxnfAaBpw96kXkBQduAhCfiT5H71qIysE7w5F8eXuNjcMP7axCscGNFS
 Qt91kf/pTdY1qVnkbPdO0BZUL7st7FLYnJUgvWsFUT3bqGa+flMGTRvbZ0iQwp8giExyMrU5Y
 CFnovsWYitgR+4j3seVWGdGWZQaXTIbZNXFMEHVI1qDP35YGSf5jON6Xtsgx9y5FbhlVYrMiU
 +AzhNYcNaKYTurB0C7WU7ImKiP1vcHsO743kBzVQlVnTgoR1I0lGAXx0Byuf8cWpBozqqhFqG
 3I29e3caL6wXjYrMsQSrY+8b/5KInu+eH/80VrkbbK/tfmlHOkRz6/2wwKzYQNDvLKC+ywyoR
 2+duPfxPmWiCVAUYOMFHE+1g==

Am 19.07.24 um 03:46 schrieb Bough Chen:
>> -----Original Message-----
>> From: Stefan Wahren <wahrenst@gmx.net>
>> Sent: 2024=E5=B9=B47=E6=9C=8819=E6=97=A5 1:09
>> To: Bough Chen <haibo.chen@nxp.com>
>> Cc: Bartosz Golaszewski <brgl@bgdev.pl>; Linus Walleij
>> <linus.walleij@linaro.org>; open list:GPIO SUBSYSTEM
>> <linux-gpio@vger.kernel.org>; Linux Kernel Mailing List
>> <linux-kernel@vger.kernel.org>; imx@lists.linux.dev
>> Subject: Re: [PATCH] gpio: vf610: always set GPIO to input mode when us=
ed as
>> interrupt source
>>
>> Hi,
>>
>> I found this thread about the vf610 driver, because I noticed today tha=
t the
>> i.MX93 is missing the GPIO get_direction callback.
> I find the patch was wrong, we can't call gc.direction_input in vf610_gp=
io_irq_set_type(), because gc.direction_input will call pinctrl_gpio_direc=
tion_input(), this API can't be used in irq context.
>
> For get_direction callback, yes, I will send a patch this week.
Sounds great. You can add me to CC for it, because i'm usually
subscribed to linux-arm-kernel instead of linux-kernel.

Regards


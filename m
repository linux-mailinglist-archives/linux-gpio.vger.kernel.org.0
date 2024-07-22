Return-Path: <linux-gpio+bounces-8343-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBB6938D8A
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 12:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EDF01C20F46
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 10:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F7316A94F;
	Mon, 22 Jul 2024 10:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="l3ue96/2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF683234;
	Mon, 22 Jul 2024 10:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721644342; cv=none; b=Li8AR3JU3TBFv3OrdiZooutUUCpZR/zHQhc4/os1KwGFhYi/CeTyHwcFKUQqUPEvj8eALvXxZH0X+9yL245PE/gyf5b0bLXpTmurbUgm3Gbw2r3G7mN/6O6Z6MGrWByeh7+vUj6SkNevEnJH4pvM3n8lo8ACayxdDbwBL49mLVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721644342; c=relaxed/simple;
	bh=btFUX4plcXuFTLmwR5l/4caueJXQ4idgFbnHF3IAqAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fca11wsFrjY2VQwH9wJKb9Z2UqCPCXdGQAlnmPqBQwqnmrQo/vMEmPZcksz/B9wCudr0VBdZEWj4oaFm9I3PIZMheaAVVIuGbGSX841gqUVGyHt6Wty1NE/PvGJLMRxKyCKZJggaRqwMPzvxQ6a+TRrm0u94gZasXdvpcnsgcUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=l3ue96/2; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1721644336; x=1722249136; i=wahrenst@gmx.net;
	bh=wgF/b0K1qBqS0k3TASviN5h+UV78eV+HuEXOqpcazLo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=l3ue96/2JAnvnFzdVd2wzlu7kJK+/uVnwuvekEcTyKTE7oVMy85z5lD9aBDFxPY0
	 KSVasMpO1l7ddoFA8Hv23PpXss6CdipFRVSDk80kyV4Vqb2nion4ed0qZQLGnQH3f
	 ejd8UUYYoAC7rH/gOZrqjWHIDtm4V41jjf09x93GTaUhU8wF1pAYACpjBAQV7xhLp
	 GTHIsBmQ6paj7VrMikxI+3Jwr4jIracOu4qkelAu0ziwqTJz/9iUYrIeSO84vThxL
	 6pDyovEhr4Xu4LtfdhJKXN6qwIw+C58y1+ytYRhMMZOXm9i/xenaCd+2pHQYbJJzo
	 dwI9Ly2UA5fHxlaB7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvbBu-1sCncH42K6-015Ch0; Mon, 22
 Jul 2024 12:32:16 +0200
Message-ID: <8ebb5430-93fa-4239-b09a-59f35b0dd94d@gmx.net>
Date: Mon, 22 Jul 2024 12:32:15 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: vf610: add get_direction() support
To: haibo.chen@nxp.com, linus.walleij@linaro.org, brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20240722062809.915867-1-haibo.chen@nxp.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240722062809.915867-1-haibo.chen@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JtKrb3M07OxzgwfbJ0dLeGwVBAt5FEYl9+paBMqGKsp3C6tXL6P
 iZtk9lYVDXX7MOVEvb94vP7kApQkMDwjtHABvgmkUiJ2wvD4HBe3z5pLPIQNDuYE58kcII2
 mEbeRJ/66ARSHYesgSNaEWjWu0nyCSC8DXhFnDEGhDy8YVNG+NyyaoyRTtjCg6iyjNIJ541
 AMm36Kdnyb/BYgMvmYZ4A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QcmG+gQZ774=;FE8LxkvOE5lBLJMGeiyevjh2oLT
 t73tvdvw7RCjeldFRlTsWVS5E1UuZhmWvfBVmUdnaSZ2nmdZ4A/lzipKtVRE3NkKZDWhJVf+3
 VY3M4tgDK7o72mVf8gvtxHG8QX/PqQpvK2DEutFYk5jO+ArLO0a6I0AZMpuUIQjWlqGSQzLkq
 4pvbeFPhObyjXPX3sJQ9PG/k71kqf/Tv52I018RBz2DnogcVBI0KRc/jy6cOK2QeiPqVvwMIy
 rFOlFc8B/M2ILAS4U1DgIHzaC+XF/nfHKJrjg9ARCUmRkprhZWWIiaK4DwBQPGjvH0ujpzUNv
 pq/EqSEXqD5qqby4TCBOu5HlqMU8rnm/NPMtPD6/TEWhzytMV6uRv6Vx86HB62M4ofkmJ6qYq
 Fjpc94z27Oqjl1p1T/8Oh8/niGuonjgCerx+keCXkX7VAhDtegKLc6+667jkHEZXpM05hm4Bh
 kyBXuMqvprzM1a6VkUIbRTDa0TdcE6jlo59bOWg+hYxPvOQgXaxXvCEi7kU0VPEwYw8xQef3a
 LwB28zKm9HZdIdS+vZ0Cazu9bGgALQsoB1AvnULIy6jExHM6Yv+OfK4Urgn4PH7L3GK/lyz39
 Q1GmyGhae+WMpOMhIGn48x7nwjZ+cYrL2TZalhBW3EXpk/AY4NrcLQU3zyq+rIg9KOFJe2VEB
 eCyMtJsnG1scisyvEwGQMI0PpLmuJ8axk/tcTkRBu1+aVZ6QH+0Jt90UoxJ/IuqLiz/MqiDee
 0XmlUf4uVuOTho+vNu57BkKOPxp+6ceeacn9Dp+Yo9m9nMhPfjZWTCfw8mCSfpUrLacjR+2l6
 wvf+w9d6fDE9dke2ewqdfgtA==

Hi Haibo,

Am 22.07.24 um 08:28 schrieb haibo.chen@nxp.com:
> From: Haibo Chen <haibo.chen@nxp.com>
>
> For IP which do not contain PDDR, currently use the pinmux API
> pinctrl_gpio_direction_input() to config the output/input, pinmux
> currently do not support get_direction(). So here add the GPIO
> get_direction() support only for the IP which has Port Data
> Direction Register (PDDR).
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>   drivers/gpio/gpio-vf610.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index 07e5e6323e86..08ca8377b19c 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -151,6 +151,19 @@ static int vf610_gpio_direction_output(struct gpio_=
chip *chip, unsigned gpio,
>   	return pinctrl_gpio_direction_output(chip, gpio);
>   }
>
> +static int vf610_gpio_get_direction(struct gpio_chip *gc, unsigned int =
gpio)
> +{
> +	struct vf610_gpio_port *port =3D gpiochip_get_data(gc);
> +	unsigned long mask =3D BIT(gpio);
thanks for sending this patch. I'm fine with this patch, but could we
use u32 to make it clear about the range of the mask?

Regards
> +
> +	mask &=3D vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
> +
> +	if (mask)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
> +}
> +
>   static void vf610_gpio_irq_handler(struct irq_desc *desc)
>   {
>   	struct vf610_gpio_port *port =3D
> @@ -362,6 +375,12 @@ static int vf610_gpio_probe(struct platform_device =
*pdev)
>   	gc->get =3D vf610_gpio_get;
>   	gc->direction_output =3D vf610_gpio_direction_output;
>   	gc->set =3D vf610_gpio_set;
> +	/*
> +	 * only IP has Port Data Direction Register(PDDR) can
> +	 * support get direction
> +	 */
> +	if (port->sdata->have_paddr)
> +		gc->get_direction =3D vf610_gpio_get_direction;
>
>   	/* Mask all GPIO interrupts */
>   	for (i =3D 0; i < gc->ngpio; i++)



Return-Path: <linux-gpio+bounces-6478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E218CA0DF
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 18:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4798D1C210FD
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 16:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7885C13776F;
	Mon, 20 May 2024 16:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=freemail.hu header.i=@freemail.hu header.b="DnjPf2pL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from web-out.onbox.hu (fmfe37.freemail.hu [46.107.16.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB1879EF;
	Mon, 20 May 2024 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.107.16.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716223839; cv=none; b=rp4b5631qk8Iual39D4LBvsRgQ67e6rC9IMTjo76vZgZiBZVboXgRRWo+1eYM9CSb2GCR75kkxPCbJfyZ2agJUaO+OL11fXMqEc9zGjTktoensMLGIBFoexjxfFBB1BnAjfJu9DKM6xoUaGcWsR4hh7Ja6dBO3pg9S9S9mYIG4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716223839; c=relaxed/simple;
	bh=cG0hlyXh6vcW3V/UPL40CkMLlVDApVwQqePJso+0IcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MbedGWs5YK16lTeCuHK4E7DU16uWzoFjrKf6idM8RJBSM+PCeWhM7BErdswyOjIzaQ0NgKdHCIEeuBoWizSyY45wnE11a1hSleZXRI8ZEYGqu9mvy9QFUxdc1+OyvMkIB097iEH0hYj5h8nP1kB/0/GhaSOf8N7yhx1E5dN7hSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freemail.hu; spf=pass smtp.mailfrom=freemail.hu; dkim=fail (2048-bit key) header.d=freemail.hu header.i=@freemail.hu header.b=DnjPf2pL reason="signature verification failed"; arc=none smtp.client-ip=46.107.16.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freemail.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freemail.hu
X-fm-smtp-source: yes
Received: from localhost (localhost [80.98.74.198])
	by web-out.onbox.hu (Postfix) with SMTP id 4VjjxT1y1kz1Rqc;
	Mon, 20 May 2024 18:41:01 +0200 (CEST)
Message-ID: <3c0f28a0-9d07-4e15-ad8e-ad22f25ff979@freemail.hu>
Date: Mon, 20 May 2024 16:41:00 +0000 (GMT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpiolib: Introduce "linux,gpiochip-name" property for
 device tree of GPIO controller.
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240519144920.14804-1-egyszeregy@freemail.hu>
 <CAMRc=MctEsMiRgaV5UTiaxjoFDa2izX9wnLAU07=G8gBEcSKoQ@mail.gmail.com>
Content-Language: hu, en-US
From: =?UTF-8?Q?Sz=C5=91ke_Benjamin?= <egyszeregy@freemail.hu>
X-Mozilla-Draft-Info: internal/draft; vcard=0; receipt=0; DSN=0; uuencode=0;
 attachmentreminder=0; deliveryformat=1
X-Identity-Key: id1
Fcc: imap://egyszeregy%40freemail.hu@imap.freemail.hu/Sent
In-Reply-To: <CAMRc=MctEsMiRgaV5UTiaxjoFDa2izX9wnLAU07=G8gBEcSKoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Delivered-To: egyszeregy@freemail.hu
X-fm-smtp-source: true
X-AccountId: 2510275
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1716223262;
	s=20181004; d=freemail.hu;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	l=4071; bh=3BI+CILpAaJTRMcPmqa6NHbUdlNW9qh59WpRidgQl1g=;
	b=DnjPf2pLTD8FhNAqA0P8I66s+8zs8qhhfbOGdFHjhrYNF5WsWKB4qEcMgqpkzgN5
	hgDx6GwKlCtDeDsvYzh7RfuEu3M0HzsVc52JhrjQacz9hu6TanR9NMy29tJTudnj1fl
	sFwHE1P0aK3Clrl9HEqv9mKQ4o9TJF6u6QPXAoUdhZjT4a6ngj0Xv6+eIVXsvCDAjOF
	BJuq5nTfvAwOsC0t0S2VMWpAqhkMd/ukQjkyEHnLA9Mc1vpy9Wy+4usj2wBYjxYmR8g
	cAisSQHz9iZugp3yj59PLJfmn/2Fh+2RORNunVf1SF1uPIwY2mDCfheuhsTj7nQhvaO
	5BDZqvBGHQ==

2024. 05. 19. 19:27 keltezéssel, Bartosz Golaszewski írta:
> On Sun, May 19, 2024 at 4:49 PM <egyszeregy@freemail.hu> wrote:
>>
>> From: Benjamin Szőke <egyszeregy@freemail.hu>
>>
>> Optionally, a GPIO controller may have a "linux,gpiochip-name" property.
> 
> Oh, may it really?
> 
> $ git grep "linux,gpiochip-name" Documentation/devicetree/bindings/
> $
> 
> Doesn't look like it.
> 
>> This is a string which is defining a custom suffix name for gpiochip in
>> /dev/gpiochip-<name> format. It helps to improve software portability
>> between various SoCs and reduce complexities of hardware related codes
>> in SWs.
>>
>> Signed-off-by: Benjamin Szőke <egyszeregy@freemail.hu>
>> ---
>>   drivers/gpio/gpiolib.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index ce94e37bcbee..e24d8db1d054 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -860,6 +860,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>>                                 struct lock_class_key *lock_key,
>>                                 struct lock_class_key *request_key)
>>   {
>> +       const char *name;
>>          struct gpio_device *gdev;
>>          unsigned int desc_index;
>>          int base = 0;
>> @@ -896,7 +897,16 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>>                  goto err_free_gdev;
>>          }
>>
>> -       ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
>> +       /*
>> +        * If "linux,gpiochip-name" is specified in device tree, use /dev/gpiochip-<name>
>> +        * in Linux userspace, otherwise use /dev/gpiochip<id>.
>> +        */
>> +       ret = device_property_read_string(gc->parent, "linux,gpiochip-name", &name);
>> +       if (ret < 0)
>> +               ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
>> +       else
>> +               ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "-%s", name);
>> +
>>          if (ret)
>>                  goto err_free_ida;
>>
>> --
>> 2.39.3
>>
> 
> NAK, this is udev's task in user-space if you need this.
> 
> Bart

Hi,

Goal of this patch is to introduce this new mode to assign a custom name from 
lowlevel device tree to a gpio bank.

It is more maintainable then use udev in userspace for it.
For example there are three different SoCs: i.MX7, i.MX9, ZynqMP.

In Yocto project, the Linux image's SW environment is nicely configurable 
independently from what is the target MACHNIE. But if i like to deploy a SW 
which uses peripheries like gpiobanks, i2c-dev, spidev these /dev/... name will 
be totally different on each SoCs, more over in ZynqMP and any other Adaptive 
SoC platform, the index number for the gpiobanks or other can be not 
deterministic if it probed in run-time. Goal is to easily make a Linux OS image 
which can support multiple SoCs and in SW point of view it is flexible.

So, in Yocto project point of view the best, if any Machine specific settings is 
stored in the device tree files of the target MACHNIEs in driver levels/config, 
because it will be deterministic in 100% sure and it will be nicely separated 
from the SW meta layers which may not contains any machine specific hacking with 
udev and so on for building image.

So this way to assign a custom name for a gpiobanks from device tree is more 
efficient and more maintainable in SW developing point of view in 
Yocto/buildroot world because i need to just define a name like 
linux,gpiochip-name = "expander"; then use it with a fixed name in my generic SW 
under /dev/gpiochip-expander name. And there are no need to care about what will 
be the index number of this banks randomly after boot and how need to make an 
ugly append layer for udev and make it for all of machine variants which are the 
target to use with the same SW.

My opinion udev is ugly to use for it and more complicated, and no longer 
beneficial for new Adaptive SoCs where they can be not deterministic what kind 
of index number they got in driver probing (you will not know what index need to 
mapping for what custom name). It is much better to assign this suffix/name 
explicitly from device tree.



Return-Path: <linux-gpio+bounces-33152-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wG/lAw5+sWmACAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33152-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:37:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 29446265829
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 51BE33004D27
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FE83C4571;
	Wed, 11 Mar 2026 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rviWlpiO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9210F3B95F7
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239816; cv=none; b=gJZGN0HQ9vFgDRRG+PDd9kBzCbovNkW76C9GSDwX2vP25bTnnl0OOaRltd2+uioGy+vNRoXlJmKue1aQTGsIXJdWOPn75D+n5MRtAN/G4QlGOHX06cN31Wnznq3aayuigiialKHHp3hUWIuBP1mTqu946MDDkpiH8VWosxattTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239816; c=relaxed/simple;
	bh=MBr5BunAn3ZXoYBSlqDMj1jR3jbP1rLEfxBdY12hfcA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdMU3K5iQPS6mbYlqwU2W6JpNqSRiIdmcZBntaeARZPcGtiYKxWZ9LYzkHXfqJc0n2a2nlVyrxPyp0tBga6IKBrz8s9eVwMejuOxx5z8GVY0jNLWZgYJNCg3MTODxRWHfcrlwhkzwK+9QgLnpE/WQ4aNElMx53qbRq6FYXiXjvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rviWlpiO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2E2C2BCB5
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773239816;
	bh=MBr5BunAn3ZXoYBSlqDMj1jR3jbP1rLEfxBdY12hfcA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=rviWlpiOlDE78EpxkqeUZ3wSn5TkoY57yetFtZLs0Ix1iE9L1z2BfIn17BD8UIWtm
	 dtTzJh4IQz0LWDMlkwJbyvSD2+bvNoHVrGGMRfcIxwZyOR7FHNoY/V/F8sMaeY6RUI
	 ptxq5yJAXjoUoHwwrVYDWYgiCAhsZOGCf/jYVGZJgepMA1HW/WZUe2POCBKjZ2XJNU
	 ar5tGL5PzdiNLVZs89d0UJS3KBP8CFMuH9aQXWcAwUn7+gyyUFL3KpIbE6OMPM+rFi
	 17noxuU/FGeeVBGgkcQwqye5aUgunXtMWsLcKjPbP1pfnQHUaDHniBYtXl8VagvyGo
	 sxeSxyua6xg9w==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a38ccc217so1611fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 07:36:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQ+QoZ2OH54lweFUjX/0Nu2cln7fgqZeBf1fb11KN3wdbnw5XzsN2mOilxP7oE4PdZhMYF3/zaQUeZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyUcPFoW84iSA/oN1+A1nnarOkR0anOin4ChflIvENulfmHsWV+
	lwqYGCp0P8JTjAKu08yx/umCRRLoTknWXoJZ65D9KpCd33Grp3cU2P8mgrBDDkY1Z+hK0wdpW/D
	ZhbVwpFnZGpp1BR7JL3eBjX1/hBpGQHsBFCahRRRPXg==
X-Received: by 2002:a2e:bf02:0:b0:38a:3feb:d2ee with SMTP id
 38308e7fff4ca-38a67e68170mr10068421fa.32.1773239814928; Wed, 11 Mar 2026
 07:36:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 07:36:51 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 07:36:51 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMuHMdU0Xb=Moca5LUex+VxyHQa2-uYJgYf4hzHiSEjDCQQT=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223061726.82161-1-tzungbi@kernel.org> <20260223061726.82161-2-tzungbi@kernel.org>
 <CAMuHMdU0Xb=Moca5LUex+VxyHQa2-uYJgYf4hzHiSEjDCQQT=Q@mail.gmail.com>
Date: Wed, 11 Mar 2026 07:36:51 -0700
X-Gmail-Original-Message-ID: <CAMRc=McmrJLWGoXjKaqGuCWpLZU4mmcrgs9ESAaL8kG=_R89cw@mail.gmail.com>
X-Gm-Features: AaiRm506EOHf7dy_hA4ZaTp1VM_fbnHazOEtdGepT2lucGBsuxm6_fe44b4oDCs
Message-ID: <CAMRc=McmrJLWGoXjKaqGuCWpLZU4mmcrgs9ESAaL8kG=_R89cw@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] gpio: Access `gpio_bus_type` in gpiochip_setup_dev()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33152-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29446265829
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 12:44:31 +0100, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> Hi Tzung-Bi,
>
> On Mon, 23 Feb 2026 at 07:17, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>> To make the intent clear, access `gpio_bus_type` only when it's ready in
>> gpiochip_setup_dev().
>>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
>
> Thanks for your patch, which is now commit cc11f4ef666fbca0 ("gpio:
> Access `gpio_bus_type` in gpiochip_setup_dev()") in gpio/gpio/for-next.
>
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -901,6 +901,8 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
>>         struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
>>         int ret;
>>
>> +       gdev->dev.bus = &gpio_bus_type;
>> +
>>         /*
>>          * If fwnode doesn't belong to another device, it's safe to clear its
>>          * initialized flag.
>> @@ -1082,7 +1084,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>>          * then make sure they get free():ed there.
>>          */
>>         gdev->dev.type = &gpio_dev_type;
>> -       gdev->dev.bus = &gpio_bus_type;
>>         gdev->dev.parent = gc->parent;
>>         device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
>>
>
> Postponing this assignment does have an impact on early
> messages. E.g. on RBTX4927:
>
>     -gpio gpiochip0: Static allocation of GPIO base is deprecated, use
> dynamic allocation.
>     + gpiochip0: Static allocation of GPIO base is deprecated, use
> dynamic allocation.
>
> Or with CONFIG_DEBUG_GPIO=y, e.g. on BeagleBone black:
>
>     -gpio gpiochip0: (gpio-0-31): created GPIO range 0->7 ==>
> 44e10800.pinmux PIN 0->7
>     -gpio gpiochip0: (gpio-0-31): created GPIO range 8->11 ==>
> 44e10800.pinmux PIN 90->93
>     -gpio gpiochip0: (gpio-0-31): created GPIO range 12->27 ==>
> 44e10800.pinmux PIN 12->27
>     -gpio gpiochip0: (gpio-0-31): created GPIO range 28->31 ==>
> 44e10800.pinmux PIN 30->33
>     + gpiochip0: (gpio-0-31): created GPIO range 0->7 ==>
> 44e10800.pinmux PIN 0->7
>     + gpiochip0: (gpio-0-31): created GPIO range 8->11 ==>
> 44e10800.pinmux PIN 90->93
>     + gpiochip0: (gpio-0-31): created GPIO range 12->27 ==>
> 44e10800.pinmux PIN 12->27
>     + gpiochip0: (gpio-0-31): created GPIO range 28->31 ==>
> 44e10800.pinmux PIN 30->33
>      [...]
>
> Note the spaces at the beginning of the printed lines.
> Reverting the commit re-adds the "gpio" prefix.
>

As per the comment in gpiochip_add_data_with_key(): we may end up with
a functional chip before gpiochip_setup_dev() is called and so before we
assign the bus type.

dev_printk() helpers only read the name field of the bus type so it should
be safe, I don't see anyone else accessing it before we register it.

I think it makes sense to revert this commit. Tzung-Bi: what do you think?

Bart


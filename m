Return-Path: <linux-gpio+bounces-33120-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ3cKe9VsWmGtwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33120-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 12:45:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BCC2630FA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 12:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E497304276A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 11:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D533DD524;
	Wed, 11 Mar 2026 11:44:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95403CFF7B
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229487; cv=none; b=L2v4GGnMIMcPHb58IQ6Ou7mvB1SpoTsfUhgbMY0HdWTmTx2xnUHPy6Iqt22UOOsW+f2u3+h1whB5GibyuaFKP/bHM97UsfObpynGt8z0j6mdkH8KmdoRapsIN+sylpvOgQIOKPSoP66eeC1x9wKCbhmX3rxqPP4ShWfGeCYfXBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229487; c=relaxed/simple;
	bh=91YPfEButMB4Dd2zOu5KgfkAt2bAzw+tFr6ttZBOtAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwyJCHzeAcMFMZmzoVhEvtG7s0lgO/phj9EICB8VAEc/04kkVhcaRidpCf2XgayC3V3ZpmlmGNBKaVTInz8UqCiPmK3aIm767WWfuw3ICgJCERu2+gIZK7amJh0PiKa+Y5DR9G5AcjihAwIarjdeKEnnN5rJcfPoB8A5Vz3q3jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ffe68892efso3444522137.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 04:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229485; x=1773834285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7KfcYBgSfUu6P1T8nEVd1qT43qw4ZZIvyTvKKhSf7M=;
        b=OesvL/CWINooWfErQh70waL0xIb1ZUViK1mcNJzMYe0Mmj3gum+mkQ7GAt1A6TwI2T
         yoUNHu78U0u5rHb45PUJFZCtTFyArTh59mnCoWQ/0WObjQZHvf0haAnVK1eUniUqhn7s
         xZ8Vh7CrO5W6As9HhdFokT8h8utR0C87hLRPeDSlILtaONUXSAz7TFy8tAexMVwUmT42
         AS4q3xeEtMeUMYjmMYq53oqU2CvOt9MnTAo7b5t8dkJJFkDgKF3XYkagK261jc/QU/r0
         5ge1RGpOs9NJA7wURb0opTA8uKtmLPOUdX/8/k8+Yq7s8gAMxeWfVcgdMz1yroWfpyvF
         iLCw==
X-Forwarded-Encrypted: i=1; AJvYcCUSqqsFzcMov8NInilVgNdpx1X58IlodNVybOC7sW5pT9APAU+pFLt2BXs5I4Y9DhgLtuwCEOKiHhEP@vger.kernel.org
X-Gm-Message-State: AOJu0YzBol7F2LUlEIxd39POzHlwgPQwjdi7Kde1mXppiU85mIWhcdpa
	OM38PAhuVMynhzTrozjXs1FAo7QSyZQA6QZN2SwJQcguQZ0kEVEsAGtIW12uHsTp
X-Gm-Gg: ATEYQzxGf282cJZlKfeJcWxQ+voBl5ATT8ifUBGI8mijmUoILFjY3Mnu9Cgq7x5mRND
	OnttNJFKfIRpz30HEczPQuqLawvXvOPaJKnvshgFeeuXRwiTZuN9zIvseJo19wl3oqe5AoG5jpo
	3wnI2T3LG/9HgW6DTraoUMDQfwhmNl29HE0tNryQJ6ByNm7zVaRDhnvrGOoae2ToqKi2CakQ42G
	aAhSDgHmyVzAAotZUpCgkQp4Wys4sJ+VL3/b18Ga17LD28XQ7A6di1CMjcVcQakU9eP57r7CyrC
	CQNWFCWwqA8CJjOeqK+jSFMHcC6ph5qs9CqVZpcTV9s2GXutUyd4BZYo9VMYp1ZxrHR5/LgWofY
	TH4T9C6wHZInOzZWrgvMrTU8mbKgFChh8WYZAUDwzw8BiT84om55TIX9vRmZe4bttbo4GKNm1Gc
	jnpjbOkC/0KZ5SQddTUiYm+Wevn+i0WxtzO/9LHJlrlJg7kBHyY6oWleJCgtCx47Pg
X-Received: by 2002:a05:6102:390c:b0:600:d0f:bad2 with SMTP id ada2fe7eead31-601deb258cfmr1002042137.2.1773229484853;
        Wed, 11 Mar 2026 04:44:44 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601de74a9a5sm610118137.5.2026.03.11.04.44.44
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:44:44 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso10847414e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 04:44:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVssEBRxCxEvYU/Xjjj9a+Iahuv7l6Z2gXkalMYj+1fBLYKtI88JVKGElVnZDdIa5JrqPA4OJvJPWGN@vger.kernel.org
X-Received: by 2002:a05:6102:2aca:b0:600:20:74f8 with SMTP id
 ada2fe7eead31-601deb937d1mr897288137.13.1773229483828; Wed, 11 Mar 2026
 04:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223061726.82161-1-tzungbi@kernel.org> <20260223061726.82161-2-tzungbi@kernel.org>
In-Reply-To: <20260223061726.82161-2-tzungbi@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 12:44:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU0Xb=Moca5LUex+VxyHQa2-uYJgYf4hzHiSEjDCQQT=Q@mail.gmail.com>
X-Gm-Features: AaiRm526CPdI3xsQIkHSFIKuUm3bmXqbgoDrLhuyzTn4LwLbPOLadWtxPY6y_FQ
Message-ID: <CAMuHMdU0Xb=Moca5LUex+VxyHQa2-uYJgYf4hzHiSEjDCQQT=Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] gpio: Access `gpio_bus_type` in gpiochip_setup_dev()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 24BCC2630FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33120-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.849];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Tzung-Bi,

On Mon, 23 Feb 2026 at 07:17, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> To make the intent clear, access `gpio_bus_type` only when it's ready in
> gpiochip_setup_dev().
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Thanks for your patch, which is now commit cc11f4ef666fbca0 ("gpio:
Access `gpio_bus_type` in gpiochip_setup_dev()") in gpio/gpio/for-next.

> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -901,6 +901,8 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
>         struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
>         int ret;
>
> +       gdev->dev.bus = &gpio_bus_type;
> +
>         /*
>          * If fwnode doesn't belong to another device, it's safe to clear its
>          * initialized flag.
> @@ -1082,7 +1084,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>          * then make sure they get free():ed there.
>          */
>         gdev->dev.type = &gpio_dev_type;
> -       gdev->dev.bus = &gpio_bus_type;
>         gdev->dev.parent = gc->parent;
>         device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
>

Postponing this assignment does have an impact on early
messages. E.g. on RBTX4927:

    -gpio gpiochip0: Static allocation of GPIO base is deprecated, use
dynamic allocation.
    + gpiochip0: Static allocation of GPIO base is deprecated, use
dynamic allocation.

Or with CONFIG_DEBUG_GPIO=y, e.g. on BeagleBone black:

    -gpio gpiochip0: (gpio-0-31): created GPIO range 0->7 ==>
44e10800.pinmux PIN 0->7
    -gpio gpiochip0: (gpio-0-31): created GPIO range 8->11 ==>
44e10800.pinmux PIN 90->93
    -gpio gpiochip0: (gpio-0-31): created GPIO range 12->27 ==>
44e10800.pinmux PIN 12->27
    -gpio gpiochip0: (gpio-0-31): created GPIO range 28->31 ==>
44e10800.pinmux PIN 30->33
    + gpiochip0: (gpio-0-31): created GPIO range 0->7 ==>
44e10800.pinmux PIN 0->7
    + gpiochip0: (gpio-0-31): created GPIO range 8->11 ==>
44e10800.pinmux PIN 90->93
    + gpiochip0: (gpio-0-31): created GPIO range 12->27 ==>
44e10800.pinmux PIN 12->27
    + gpiochip0: (gpio-0-31): created GPIO range 28->31 ==>
44e10800.pinmux PIN 30->33
     [...]

Note the spaces at the beginning of the printed lines.
Reverting the commit re-adds the "gpio" prefix.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


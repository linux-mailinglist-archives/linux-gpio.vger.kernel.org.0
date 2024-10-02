Return-Path: <linux-gpio+bounces-10687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D7A98D2D4
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAAE31F232CB
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 12:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0D81CF7CB;
	Wed,  2 Oct 2024 12:10:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E21B1CF5F7;
	Wed,  2 Oct 2024 12:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727871041; cv=none; b=OIfQgDQMsigQawfIjsvhu5XxToymRIPa6I4P2/Cby5hDF183z2sAyEFkCgJVFfCxA49mHJ27dFas0XBaepz4VAyLEdP+m1+P/qE5+U9+DyJQD7bCgI6U2SHfRYVlkSFJYE4Jb31+KJ9eYWZBhHPOhDBhxmYoAdN9S6gBHo/Hp2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727871041; c=relaxed/simple;
	bh=Fvksa0iNMILeoXAqia39QdOl44rPJDo58115/hLsNVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFoIfcfP3TmiQHsPE74OHB2JRYnt3V95rN2KYaNigUQHdtdwyLRMNOxu9QXsE96YsSXjUb7cAsatTlAMgvFF8wjv8bpWrJVv5gh8GeUG26u91E3oA/gsADWJFuLK+06zjaAp/u3MNSxKkHPFmnx8xShWUyYQaxtfJVSBZIya47E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e25d405f255so5686352276.2;
        Wed, 02 Oct 2024 05:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727871038; x=1728475838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROuhH03n70iPDo/dg44LqUM9nlyhbM0k6XFT26deFGQ=;
        b=caek+e8i0VRLLuYTAgNqTw8QDnUUJ6JIOVAfQY5gTAsryGmvg7AigFRDaOqIJ20c/r
         Y5+H/vHr+Jr99VNQOuvKPeqjeKx2e6i+INb9DEtidBJr1wiXIuikMQRyqFkgF6WOcbkE
         Mj+Ge7t6EExpP0VomL9b0YETDaF8gLB0MaixVTB6EfhHBhisSfJJGGXAAVxpRG40kAlG
         ivJ8EFurMbkT0kf3G8X/xtdXUdhwCd93MkvQfus7k7qjqQQnbA127EzErMaaZM1beazw
         ueGRxqq5Vy1JcbNFX2tWzRas4SnWf5N1a8Wt+3SqfWThjysZ7cqX9AefrbBwgE3n8+Hj
         xTRA==
X-Forwarded-Encrypted: i=1; AJvYcCU4hC9XE5FC+U+Pbn6ugC4pbEe8d8lTNIb7MFORsGNURLJzDAtxRPG8PrbsiOgYzp0zE6lhiIx2BlXfpQ==@vger.kernel.org, AJvYcCUWxhd82DfJ62HNeTTX/Er4BEWDqcjux1q2m4NXInqWBTY5U7gb8i84pNE/J7a0y/WA4IwUwWopMSxo4Zzcq8E0M4c=@vger.kernel.org, AJvYcCVokRoS3ndDyWeiPJa5Ln/NrqqDtmoQ3nIH8uiaGcklz61uRlb60EUC+AyRXXw2NIcgFXC0Kquv4V8J@vger.kernel.org, AJvYcCX+Z2oNxgvloJ4HP5Pazc+O2BGaAXJ7aQC6vwUJP1zZZRfQv6PKjmvy31G2ybTIcASSRPYIYGZvnJYN@vger.kernel.org
X-Gm-Message-State: AOJu0YxK9XzLccmvSTI2tVOH6OtNvkuM6OeGBa/xvNjG/8c/6b5/vfiJ
	qTD1XVNJkOk4px03jNVkO6qPHfqdLjfPc4JCtrs4aTwrBalaRoPJ89biED/O
X-Google-Smtp-Source: AGHT+IErh1o9KMEPemeD2Jh5pwZ1GQZR5uJPgjiechB7xlKWS8fRhZZKKeZQmUCmjwDABsf4K25Erw==
X-Received: by 2002:a05:690c:6610:b0:686:1240:621a with SMTP id 00721157ae682-6e2a2ddcdfbmr24156087b3.31.1727871037963;
        Wed, 02 Oct 2024 05:10:37 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e24538d646sm24213237b3.124.2024.10.02.05.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 05:10:37 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e26048d1235so4611633276.0;
        Wed, 02 Oct 2024 05:10:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkuJGYtLPL2cvH3HaBoshGwoL4krUDjRr8n4/bTptdmQdwEESpnppPIPFPFJtXVoec43jQuCx9Fm+nzw==@vger.kernel.org, AJvYcCVCNKpCeUQsuPd2WBjk4rjgt2OE6AjR0773ZdcB3neMVlWwzken+wriQ6gjan5aexOF8du5SqGaVurH@vger.kernel.org, AJvYcCVze0ax+UXCy5Ipbum9UVwB4RCv9sF5KksP/QH6eVBw/ZqpJTpUseI0aNiBQJObyWkkN4u3z7G0dHBR@vger.kernel.org, AJvYcCW9CYzojT/LBmkWBOG5VHsxG0vFt98c7DSG8N+nBWZIeJaXKgKtWoHV4gHzbJdEWwneACKyoeRkiDPETOlHY4it/6M=@vger.kernel.org
X-Received: by 2002:a05:690c:6610:b0:686:1240:621a with SMTP id
 00721157ae682-6e2a2ddcdfbmr24155357b3.31.1727871036883; Wed, 02 Oct 2024
 05:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1727853953.git.geert+renesas@glider.be> <e9cf476ffac794bad7b0860dc89afd62a9ebc812.1727853953.git.geert+renesas@glider.be>
 <Zvz8yA4sIKpKP8eD@ninjato>
In-Reply-To: <Zvz8yA4sIKpKP8eD@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Oct 2024 14:10:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXGZPa8R78YjCd5izycug_t3o5wF0Kk_SpAw=k6uxpeZQ@mail.gmail.com>
Message-ID: <CAMuHMdXGZPa8R78YjCd5izycug_t3o5wF0Kk_SpAw=k6uxpeZQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: renesas,usbhs: Deprecate renesas,enable-gpio
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

CC gpio

On Wed, Oct 2, 2024 at 9:56=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > +  renesas,enable-gpios:
>
> Isn't this a good occasion to drop the "renesas"-prefix? Binding docs
> are full of plain "enable-gpios".

Well, that's of course another option (actually 3 ;-)
Compared to simply switching from "renesas,enable-gpio" to
"renesas,enable-gpios", dropping the vendor prefix requires changes to
the HS-USB driver and/or to gpiolib.  Worse, this would also become
a hard dependency for updating the DTS files.

Option A: Add a call to devm_gpiod_get_optional(dev, "enable", GPIOD_IN)
as a fallback to usbhs_probe().

Option B: Switch usbhs_probe() from "renesas,enable" to "enable"
and add quirks to of_find_gpio_rename():

    #if IS_ENABLED(CONFIG_USB_RENESAS_USBHS)
                   /*
                    * The Renesas HS-USB DT bindings happened before
enable-gpios
                    * was established as a generic property
                    */
                   { "enable",     "renesas,enable-gpio",
"renesas,rza1-usbhs" },
                   { "enable",     "renesas,enable-gpio",
"renesas,rza2-usbhs" },
                   { "enable",     "renesas,enable-gpio",
"renesas,rzg2l-usbhs" },
                   { "enable",     "renesas,enable-gpio",
"renesas,rcar-gen2-usbhs" },
                   { "enable",     "renesas,enable-gpio",
"renesas,rcar-gen3-usbhs" },
     #endif

Option C: Add a generic "strip vendor prefix" fallback to
of_find_gpio():

    const char *stripped;

    if (gpiod_not_found(desc) && con_id &&
        (stripped =3D strchr(con_id, ',')) && *(++stripped)) {
            for_each_gpio_property_name(propname, stripped) {
                    desc =3D of_get_named_gpiod_flags(np, propname, idx,
&of_flags);
                    if (!gpiod_not_found(desc))
                            break;
            }
    }

Option B adds a bit too much to my liking.
Option C may be useful for others (e.g. {ti,nxp,maxim},enable-gpio(s)),
but might be considered too dangerous as a general fallback?

Thoughts?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


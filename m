Return-Path: <linux-gpio+bounces-30250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E708D03BF6
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 16:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 187E93013D45
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 15:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D92346AEE;
	Thu,  8 Jan 2026 08:42:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB22346AD5
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861723; cv=none; b=mijBqj5Z0rgPkQO0s6hmK4XIMPp0/pKiKrwD0jO2L9ZUfinMlWlId7W+4GqCbia+MUQssuNu5mxOwI27v5+lajCeWKKs/FrDlb4OLTBGoFJDgMJhliQFvBlz7PEF5f7K4e+viqtNbOUlTBBfCWCYcsNdlLpag4KJoMlxTUPihTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861723; c=relaxed/simple;
	bh=9X/r2vj38C7ckuEFNFkLLoQCe9ZxM5qmA8RkRgtPHu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/cOimprQsoCwCV7lPAQ+a+D0jbMIEZQmDQ+hwiOiJbgArjxmE8kIZj2649xPF5Bs9t/A+SScZOAAocv3rbR2Wb+lvrOiBQxINHW6Uusbg9Gn2cjBE6+jT+D5XDewb81nG9Ihb1bj6PkNo/pGinM9yzaibsXRH7MWtvUz1SE+4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f196.google.com with SMTP id 71dfb90a1353d-55ad466ad1eso1010048e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 00:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767861710; x=1768466510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xns/JPqML0qCztDyyCuldpapQdflbeNCjFZrnYmJiTY=;
        b=mNqGWYf5j2Y3dWBYQhTvZRhnFzAwIgrBkN4PCgTyjb33yyRNX7J6nvlSamXnqLVcDN
         EW3woQG/4d4GB4foz6JpwbDc0N/XznO5JicnZoUxM7w+HV5HT8VWil1sNoHbnU4CiMJy
         wUOK8/BD1G2zwY4LjGoR4auduQVDGkreGjfh804NUfofS3hUyk5GSw+RNSQGu19kfz4X
         InG8Djt+yn9ohDcZ9dUev4/zbb9Aij0WMWwtLelkrTPHkcAUt0Q86+fj2iKgDhd3TLNj
         Am3nC8AxlN6T97OSfWiPuRemmh473M9D0g4i8JEjcS3JDFOv1StjfhrkOY3T5Wf249hg
         akrg==
X-Forwarded-Encrypted: i=1; AJvYcCU8V/4O3HrPwe7FKobSWRSQSUkBXvAqdm5fpTkTAkueaDtjUOKTKLyskzz+ExRdeAJ/r9l2E4gviCWA@vger.kernel.org
X-Gm-Message-State: AOJu0YyRVLK+NMe54DIVGC72/KnuYujGFWXMvGvie2hl/fcuuA8Zqrl7
	IvN9TzJkHuxOcX1CLh9r7BuhAT/C0HiXtbFvp/L7Himn3O2BoF9DzMRFTvW7R2Cd
X-Gm-Gg: AY/fxX6Bqj4SeH34c8TDnCHWnVHi1O1m5aw+Ughqao5Ijv9lFgrwFrOLeXJ9uP1RKAq
	GZJ571VTwAZ2XtLQWx/cOw+yy5hxQ29fh/5wKxkE4ePmFvN1X+UjFIn4mEp7J4v3T4kaCFf89jv
	9TQTPLi7lqsMqfH53yGeSa8BiCepkx2kiKWAMJQNR/0HtYLh3MR7qBJgABsuMZCuqmOe3fiAu80
	xn/Ua7S6tPPitczz42OEhbg0KwT1qXG9kOrD4sZHaJi9LPops+xQiNWkkSZQJ3MdMVslpB2H5QQ
	ilgj0zQ+bDiPgHSVL9/faxY5sQ6R7RgM9MklAgwNh5XG3+4wuQIYxuw+IjAKw/uuZUmFNKqF4U9
	gc3dEh030FBvTM4zJD5jOPFTuBfmANzKpguTi5T1a89E+krkQyAhRk6jGDAqMa3joyxxsJZ8OZV
	Dvv+9+F/iMcbJlLHV1lBuY0mB4k3YC8l6ufY92Q/q0J9d7myAp
X-Google-Smtp-Source: AGHT+IFdXbwvkASmdyo563mYZG2IxTwi+m5IfOHccT1WORxoBxemywvMvTcDMxvJi8NXNfN0HbQEqw==
X-Received: by 2002:a05:6122:f86:b0:559:eef7:3a1 with SMTP id 71dfb90a1353d-5634735d9f4mr1601384e0c.0.1767861709649;
        Thu, 08 Jan 2026 00:41:49 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a3f78d8sm5549467e0c.10.2026.01.08.00.41.49
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 00:41:49 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ec84929ddcso466104137.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 00:41:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsRLq68QJGZ7QjLF2GEAo7MB8lXez85/R+7eggbgn+optv7GksjJJbXANzgHI7SRn6PbtE/LBWsUl7@vger.kernel.org
X-Received: by 2002:a05:6102:cc8:b0:5df:ac57:b0ea with SMTP id
 ada2fe7eead31-5ecb68565afmr1696181137.10.1767861708843; Thu, 08 Jan 2026
 00:41:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217080843.70621-1-shorne@gmail.com> <20251217080843.70621-2-shorne@gmail.com>
 <CAMuHMdUaO_PwWygW8qss47W_ErB4pm1Z2HQ+edvw1-x7ce7oKw@mail.gmail.com> <aV9o1LL0Ahip0O3-@antec>
In-Reply-To: <aV9o1LL0Ahip0O3-@antec>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 09:41:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXYCNR0ANn152ghFExpWY_yZ5+kyFGGRwA+X-EFUvxZXw@mail.gmail.com>
X-Gm-Features: AQt7F2qP9J__FZqrZLV9_WL7FjGfkbxAjWs5PQwA8dHfLG4zYdATwoLKEBlozis
Message-ID: <CAMuHMdXYCNR0ANn152ghFExpWY_yZ5+kyFGGRwA+X-EFUvxZXw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: Add compatible string opencores,gpio
 to gpio-mmio
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux OpenRISC <linux-openrisc@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Stafford,

(reviving linusw)

On Thu, 8 Jan 2026 at 09:20, Stafford Horne <shorne@gmail.com> wrote:
> On Wed, Jan 07, 2026 at 03:35:45PM +0100, Geert Uytterhoeven wrote:
> > On Wed, 17 Dec 2025 at 09:15, Stafford Horne <shorne@gmail.com> wrote:
> > > In FPGA Development boards with GPIOs we use the opencores gpio verilog
> > > rtl.  This is compatible with the gpio-mmio.  Add the compatible string
> > > to allow as below.
> > >
> > > Example:
> > >
> > >         gpio0: gpio@91000000 {
> > >                 compatible = "opencores,gpio", "brcm,bcm6345-gpio";
> > >                 reg = <0x91000000 0x1>, <0x91000001 0x1>;
> > >                 reg-names = "dat", "dirout";
> > >                 gpio-controller;
> > >                 #gpio-cells = <2>;
> > >                 status = "okay";
> > >         };
> > >
> > > Link: https://opencores.org/projects/gpio
> > > Signed-off-by: Stafford Horne <shorne@gmail.com>
> >
> > Thanks for your patch, which is now commit f48b5e8bc2e1344f
> > ("dt-bindings: gpio-mmio: Add compatible string for opencores,gpio")
> > in gpio/gpio/for-next.
> >
> > > --- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > > +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > > @@ -18,11 +18,16 @@ description:
> > >
> > >  properties:
> > >    compatible:
> > > -    enum:
> > > -      - brcm,bcm6345-gpio
> > > -      - ni,169445-nand-gpio
> > > -      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> > > -      - intel,ixp4xx-expansion-bus-mmio-gpio
> > > +    oneOf:
> > > +      - enum:
> > > +          - brcm,bcm6345-gpio
> > > +          - ni,169445-nand-gpio
> > > +          - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> > > +          - intel,ixp4xx-expansion-bus-mmio-gpio
> > > +      - items:
> > > +          - enum:
> > > +              - opencores,gpio
> > > +          - const: brcm,bcm6345-gpio
> >
> > What is the rationale behind using brcm,bcm6345-gpio?
> > Given brcm,bcm6345-gpio has 32-bit registers, while opencores,gpio
> > has 8-bit registers, I doubt the latter is compatible with the former...

> I was following what we did for uart, where we have
> "opencores,uart16550-rtlsvn105", "ns16550a".

I assume the former is a 100% compatible plug-in for the latter.

> I am using brcm,bcm6345-gpio to match the drivers/gpio/gpio-mmio.c driver.
> The opencores,gpio is compatible with the same driver as brcm,bcm6345-gpio but
> not 100% the same as the brcm,bcm6345-gpio.  Since the device tree allows
> configuring the gpio-mmio driver to make it compatible with opencore,gpio I
> thought this would be OK.
>
> I switch the size from 32-bit to 8-bit using the reg = <* 0x1>, <* 0x1> setting.
> Also the reg addresses of "dat" and "dirout" are different for the real
> brcm,bcm6345-gpio.
>
> brcm,bcm6345-gpio. Example:
>
>        /* GPIOs 192 .. 223 */
>        gpio6: gpio@518 {
>                compatible = "brcm,bcm6345-gpio";
>                reg = <0x518 0x04>, <0x538 0x04>;
>                reg-names = "dirout", "dat";
>                gpio-controller;
>                #gpio-cells = <2>;
>        };
>
> vs opencores,gpio Example:
>
>        gpio0: gpio@91000000 {
>                compatible = "opencores,gpio", "brcm,bcm6345-gpio";
>                reg = <0x91000000 0x1>, <0x91000001 0x1>;
>                reg-names = "dat", "dirout";
>                gpio-controller;
>                #gpio-cells = <2>;
>        };

Exactly, the register space and register widths are different

> The opencores,gpio setup does work.
>
> Now that I think about it, would it have been better to just add opencores,gpio
> to gpio-mmio.c compatible list?

I think that would be better.

> If so I will can revise this patch and add patch to gpio-mmio.c.

DT maintainers: Given gpio-mmio is that generic/simple, is there a
specific reason there is no generic "gpio-mmio" compatible value that
can be used as a fallback, avoiding the need to keep on adding new
entries to gpio_mmio_of_match[]?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


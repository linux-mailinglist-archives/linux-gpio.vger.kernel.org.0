Return-Path: <linux-gpio+bounces-26719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2582ABB040B
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 13:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D6BE7A863B
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 11:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFDC2E6CC3;
	Wed,  1 Oct 2025 11:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e7vaYpAs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332CC2E62C0
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 11:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759319747; cv=none; b=P2+8IaoZPdp/FFTIpFM/cKdjc4XGF8BZvc2pLZ4RVq5NN51/RgT1mqCJUqNElicQ31wsshcPVZl/0yMzRsMWNFuTSyUjik3lOpWHuhP4JW044D/StxIUy9HJtdii/6oTLDqH9Z7PRAzDKdKSORpz44Z2C/ljsYuSTjDSIfr+J+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759319747; c=relaxed/simple;
	bh=xmpoeaaMf0gtwj7Q5LONEi34PrhfPqpYdxTWNSCI0iI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WA/DBXkSYZoGMaa+fPu+m+kxITQXzbU+oR8Rtgt5YwJCI2Yi0RzHGoiRHyAh9Q9jL7sB+hI1B37GhqUuYlHlb1S8HOMd9jJfAjqeFJVcFIxRWFkoXZzN/aUF4g6h+8sDoK/trm0tP8mrVBWNrulCQka3m9uuvwLhaDbfJI+bPE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=e7vaYpAs; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-36bf096b092so99240511fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 04:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759319742; x=1759924542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+Hd9ZpJ8NSMaaNJGGKXaZYsFab73oBzlTFfFDLABPU=;
        b=e7vaYpAspNmcIFje+4nUyWTVp88pgwtaN1REWoKj0+GTLjOWmLPktVPVDtPyAQ3nze
         +sqNBrfJ7dg3RRsjZ//R0/KuNnehwMqUKh+avWx0aIAdSJfH3kJYBOMAJ/QNwN47EFR/
         QlRpPuQW/1NcaCefOfBBlno3urt7Q0EU7BmRAs/oj7ip98ZN+8GDbWcQ4gwRd/aXIKHu
         jtvBdhUF2UmTxmYcXy0mfeYOfSmpwsKFq58vR9ai3i77tbtACPWAw5wyi3Wc2QDcU2tq
         dJVORC8iwWdXrQW8QXm0RefQtjbF9ldgVLSuB+Ea7FzqJlwIC8uJC3TDQXce1i7O9DvJ
         6lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759319742; x=1759924542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+Hd9ZpJ8NSMaaNJGGKXaZYsFab73oBzlTFfFDLABPU=;
        b=VOq+OweHEkOx8rqiv23Jt4rleoE1OfFg2kjGIgBFfsHzF56DImHBDNJ0+DaRv2KXCF
         T43BMKnYHB+smLbVv0uI6N/fQ7HNh6q6rmMV6js/lvyiUNzICQaQm2B1FuqIW6QxQApR
         nidIn0HfBEiqj2TV2Je6apZy3EY3tzpUNAJ5uoj2OXjmLjBivMOMkXnpCtcBEMQZsp10
         k+96HZnuBE27YLnZlFrn2EIQxyMyg2gtG9D+cSHjq00miZ/uJ+BkyubpuJJ6syhVGJ2t
         zWFTWKEhFWTpzIHWsohfhV4Vu1Yw8t92oiCGN0etOy4mkUoS37Kfmy9F64mwiJ7fxqWO
         533Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtrqZUL/WPS6xkNwjE03+Wq0sJA38vmdyyzSeWyuS2jpfZ16fHpGR+3oxwpKWeEH/EKBMFhYN0vr6J@vger.kernel.org
X-Gm-Message-State: AOJu0YxqYZcHCcp4eDHknl+Hgenfi3IHs1HssS/FwOLnPtco+jG23EEE
	X5zysRV8eKOnnFJJQmHEN6Z1zXqJmrfksUCtOs/0izfzB+gnjVMZe41TtGuk/GzgdqL2m7Sk6h0
	a24vYLJFW0xYV00bhTe/FUwR2AgUAzS5JhSAiWubnVA==
X-Gm-Gg: ASbGnctHPQNmv2uwjJTAOsEPkJodjnmH4u/b433oErS+Pv3a2JwtJHEIgdNz2OXUHai
	ep5F6P16Z9SuBtJuKXH2ewgLVuAZ92ng08aFseC2fae4lTPRTr1pxh52RiyUc7aWafegZphcnXM
	tBXgcstImPV+zN096nDKeWzatAYzcfvjBbkazxdAepQjWZisgD1b3Y45BmQHR1jjfM8iVpIbMDi
	f47qEVyjeMYze/TXDfoijJwa+61KOI=
X-Google-Smtp-Source: AGHT+IEkoQyCxkan5PgIYGHY6BH11JmyH8vUxK3/+mXmQXRCKdKilY7uyfLpRwifxnOw6EQlZfknfVKOeIZv4mjpxY4=
X-Received: by 2002:a2e:a99d:0:b0:372:9453:316d with SMTP id
 38308e7fff4ca-373a740494emr9691271fa.32.1759319742158; Wed, 01 Oct 2025
 04:55:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1758916484.git.marcelo.schmitt@analog.com>
 <5dc08b622dac1db561f26034c93910ccff75e965.1758916484.git.marcelo.schmitt@analog.com>
 <20250928111955.175680cb@jic23-huawei> <20250929143132.GA4099970-robh@kernel.org>
 <CAMknhBHzXLjkbKAjkgRwEps=0YrOgUcdvRpuPRrcPkwfwWo88w@mail.gmail.com> <20250930182649.GA3340740-robh@kernel.org>
In-Reply-To: <20250930182649.GA3340740-robh@kernel.org>
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 1 Oct 2025 13:55:31 +0200
X-Gm-Features: AS18NWAcLP4eem2ye_LYB7prG1UNgkoIDZ3u8vohBsn6PkgMfV3oCDoCC3aLQyo
Message-ID: <CAMknhBF-pEhMjB9MmmxpFf5wY0uvC0CCz5xtxKQ_GPCcgdW19Q@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] dt-bindings: iio: adc: adi,ad4030: Add ADAQ4216
 and ADAQ4224
To: Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Marcelo Schmitt <marcelo.schmitt@analog.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, michael.hennerich@analog.com, 
	nuno.sa@analog.com, eblanc@baylibre.com, andy@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, marcelo.schmitt1@gmail.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 8:26=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Sep 29, 2025 at 06:16:10PM +0200, David Lechner wrote:
> > On Mon, Sep 29, 2025 at 4:31=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Sun, Sep 28, 2025 at 11:19:55AM +0100, Jonathan Cameron wrote:
> > > > On Fri, 26 Sep 2025 17:40:47 -0300
> > > > Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> > > >
> > > > > ADAQ4216 and ADAQ4224 are similar to AD4030 except that ADAQ devi=
ces have a
> > > > > PGA (programmable gain amplifier) that scales the input signal pr=
ior to it
> > > > > reaching the ADC inputs. The PGA is controlled through a couple o=
f pins (A0
> > > > > and A1) that set one of four possible signal gain configurations.
> > > > >
> > > > > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > > > ---
> > > > > Change log v2 -> v3
> > > > > - PGA gain now described in decibels.
> > > > >
> > > > > The PGA gain is not going to fit well as a channel property becau=
se it may
> > > > > affect more than one channel as in AD7191.
> > > > > https://www.analog.com/media/en/technical-documentation/data-shee=
ts/AD7191.pdf
> > > > >
> > > > > I consulted a very trustworthy source [1, 2] and learned that des=
cribing signal
> > > > > gains in decibels is a common practice. I now think it would be i=
deal to describe
> > > > > these PGA and PGA-like gains with properties in decibel units and=
 this patch
> > > > > is an attempt of doing so. The only problem with this approach is=
 that we end up
> > > > > with negative values when the gain is lower than 1 (the signal is=
 attenuated)
> > > > > and device tree specification doesn't support signed integer type=
s. As the
> > > > > docs being proposed fail dt_binding_check, I guess I have to nack=
 the patch myself.
> > > > > Any chance of dt specification eventually support signed integers=
?
> > > > > Any suggestions appreciated.
> > > > >
> > > > > [1] https://en.wikipedia.org/wiki/Decibel
> > > > > [2] https://en.wikipedia.org/wiki/Gain_(electronics)
> > > >
> > > > I still wonder if the better way to describe this is to ignore that=
 it
> > > > has anything to do with PGA as such and instead describe the pin st=
rapping.
> > > >
> > > > DT folk, is there an existing way to do that? My grep skills are fa=
iling to
> > > > spot one.
> > > >
> > > > We've papered over this for a long time in various IIO drivers by c=
ontrolling
> > > > directly what the pin strap controls with weird and wonderful devic=
e specific
> > > > bindings. I wonder if we can't have a gpio driver + binding that re=
jects all
> > > > config and just lets us check the current state of an output pin.  =
Kind of a
> > > > fixed mode regulator equivalent for gpios.
> > >
> > > If these are connected to GPIOs, isn't it possible that someone will
> > > want to change their value?
> > >
> > > Other than some generic 'pinstrap-gpios' property, I don't see what w=
e'd
> > > do here? I don't feel like pin strapping GPIOs is something that we s=
ee
> > > all that often.
> > >
> > > Rob
> >
> > I think the idea is that it is not actually a GPIO, just a hard-wired
> > connection. We would want to have a "fixed-gpios" to describe these
> > hard-wired connections as GPIOs so that we don't have to write complex
> > binding for chip config GPIOs. I've seen configuration pins like on at
> > least half a dozed of the ADCs I've been working on/reviewing over the
> > last two years (since I got involved in IIO again).
>
> Until I read the example, I totally missed what you want here...
>
> Can you point me to some existing bindings?

Perhaps the best example is adi,ad7194.yaml [1]. It has odr-gpios for
a 2 pin input to select 4 possible ODR values in the case where they
are connected to gpios and can be configured at runtime. Then it has a
separate adi,odr-value property to give the hardwired value in cases
where they are not connected to gpios. The binding currently doesn't
allow having one pin connected to a gpio and one hardwired. The same
binding also has pga-gpios and adi,pga-value which work the same and
just control a different configuration parameter.

adi,ad7606.yaml [2] is a bit less complete. It has
adi,oversampling-ratio-gpios but it only has adi,sw-mode to indicate
that all 3 oversampling pins are hard-wired high. It doesn't have a
way to specify other hard-wired states. IIRC, the AD7616 chip in this
family also has some more similar config selection pins that aren't
documented yet.

In adi,ad7625 [3], we ended up making 4 enX-gpios for single
properties plus a adi,en0-always-on boolean flag property for each ENX
pin instead of a en-gpios array of 4 gpios. This was a case where it
was highly likely that there would be a mix of hard-wired pins and
gpio-connected pins, so it seemed to be the simplest way to describe
it at the time. It would have been much more ergonomic though if we
could have used the single array.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/devicetree/bindings/iio/adc/adi,ad7191.yaml#n52
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml#n127
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/devicetree/bindings/iio/adc/adi,ad7625.yaml#n70

>
> IIRC, Linus has expressed not caring for cases of using GPIO API on
> things that are not GPIOs. That was more like registers which can
> read the state of signals. Better let him weigh in before we go too far
> down this path.
>
> >
> > For example, there might be 4 mode pins, so we would like to just have
> > a mode-gpios property. So this could be all 4 connected to GPIOs, all
> > 4 hard-wired, or a mix.
> >
> > (The actual bindings would need more thought, but this should give the
> > general idea)
> >
> > fixed_gpio: hard-wires {
> >     compatible =3D "fixed-gpios";
> >     gpio-controller;
> >     #gpio-cells =3D <1>;
> > };
> >
> > gpio0: gpio-controller@4000000 {
> >     compatible =3D "vendor,soc-gpios";
> >     gpio-controller;
> >     #gpio-cells =3D <2>;
> > };
> >
> > spi {
> >     adc@0 {
> >         compatible =3D "vendor,adc";
> >         /* All gpios */
> >         mode-gpios =3D <&gpio0 0 GPIO_ACTIVE_HIGH>,
> >                      <&gpio0 1 GPIO_ACTIVE_HIGH>,
> >                      <&gpio0 2 GPIO_ACTIVE_HIGH>,
> >                      <&gpio0 3 GPIO_ACTIVE_HIGH>;
> >          /* or all hard-wired */
> >         mode-gpios =3D <&fixed_gpio 0 GPIO_FIXED_HIGH>,
> >                      <&fixed_gpio GPIO_FIXED_HIGH>,
> >                      <&fixed_gpio GPIO_FIXED_LOW>,
> >                      <&fixed_gpio GPIO_FIXED_LOW>;
> >          /* or mixed */
> >         mode-gpios =3D <&gpio0 0 GPIO_ACTIVE_HIGH>,
> >                      <&gpio0 1 GPIO_ACTIVE_HIGH>,
> >                      <&fixed_gpio GPIO_FIXED_LOW>,
> >                      <&fixed_gpio GPIO_FIXED_LOW>;
>
> The above seems reasonable to me.
>
> Just to throw out an alternative, phandle values of 0 and -1 are
> generally reserved. Historically that means just skip the entry.
> However, you could use that and do something like this:
>
> mode-gpios =3D <&gpio0 0 GPIO_ACTIVE_HIGH>,
>              <&gpio0 1 GPIO_ACTIVE_HIGH>,
>              <0>,
>              <0xffffffff>;
>
> So 0 means low and ~0 means high. The only advantage I see with it is

That works as long as we don't need other pin states like
high-impedance. I haven't seen anything like that yet though.

> you don't need a "fixed-gpios" driver. Also, I'm not sure how that would
> work with requesting GPIOs given you've essentially defined only 2 GPIO
> lines (high and low). Though Bartosz is doing some work on non-exclusive
> GPIOs.

Could work, or just dynamically allocate one when needed.

>
> Rob
>


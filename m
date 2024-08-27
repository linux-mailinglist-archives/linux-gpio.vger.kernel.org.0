Return-Path: <linux-gpio+bounces-9208-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC629604D0
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 10:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7CF928197C
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 08:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342D019D06C;
	Tue, 27 Aug 2024 08:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAeqqbCA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C76A19ADAC;
	Tue, 27 Aug 2024 08:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724748434; cv=none; b=ZjlBwkBctfLIzEB6SDWHgp7j6y1Te3OMSSuzgPRJvF7mMqNIWA0E2LvwwzVdGnAEyhCFq69J1XFZzuejEFcSm7E0kVtbkGcNHw65XdpKFs3Fv6nyMGgwbZ6dzXeUy4PMWtC7kt2IPa3qq5/WXyU1aLLhLUp0AZM8IItea57vZzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724748434; c=relaxed/simple;
	bh=/bKdA/fUgS6txw3PjDZjMyTtbG9DKmlJaGp1eA8pz6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgDcyM6q5wI8Ed0elDsZuu1BsoeOVHmB6V0YjFgoyXIeACojash7VeZRari/sf/UbZq984BTU9mJiqAro7HIG5z2A25g0PAVCcH3lwM6BM21xiSpgJC9L94jts2EICyhg61kMrgU1M/o4HWwCdXHkM8SGCotsaS3eba+H2+fzjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAeqqbCA; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f3f0a31ab2so57811561fa.0;
        Tue, 27 Aug 2024 01:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724748430; x=1725353230; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fGVlo+O+ebU/GFxqfUFQ4h31mc1K7cAiW2G4oCByTC0=;
        b=DAeqqbCAmXmcSkfizYqs8LDYY/z1bCA+7UKwHQsvfz9byFPdaIYJzeotNKd5pzL7Sj
         RsCsYfzHoq9PUXmueOyEkGyrnOoi1bi8toa8bCOkKeyddVHvbZ8UyG4e8jSHyL+A3keO
         5VbRMpI+/AUcq95Px5Yl1ky2U37jQxUdo12XdjdmqeCyulRUdP/G0VsruAbs7v8zfAFY
         qyp3w+lGtkUgDUvr4vKUnMdbirshI7Bo4b84k5z695ErvbomKRcFC0x/vxZDyaWyFBsD
         9gpCKhZiINMQHaYCDw0VWkUyl38AJktRk1nqGjE9vL1TLuuVJCyJJGorh/Uq0AW3q1u1
         z72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724748430; x=1725353230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGVlo+O+ebU/GFxqfUFQ4h31mc1K7cAiW2G4oCByTC0=;
        b=ETSgEYnE5S9VD/JiBJXUdUkl+2iziJ+AvIfWyU0EFvnm0DWLMHhgGEMeMBZ0ySM54r
         R4DEj2dmMVOQP6enbs7pjm2hJvs7l6BLBhbATizwg9/bpkVSjPQtUgSatYelJYlGdN/u
         oOBjSrEu5qRgvmNxz/HhJoebwHGMarX7grWm92dpVrd2CelhTs6tc6oO2WiyxexH96et
         4xNcdVZp87Y1WHVHGW08CNcH0KgNGqysvYwiizfhqgbpqq0haI3xjLnwsAERZzRDYncS
         pvs7vDyZNZVcAVT5XeFm77//JDxpymCQ0+yKKRnE7frO6+HO0ZP3Ye04sKRt6PmoGw8Q
         QzNg==
X-Forwarded-Encrypted: i=1; AJvYcCVFIIgW2i+1qL85a/B7e0z8S9vx/d1cG6I8zXaQiBRVqvE63ec6UtbB/SVTcJcIR20L2Mx9dhFbVurV@vger.kernel.org, AJvYcCWSi87zUPwGqS0QG2uqBkcRqISGrY7D24k9kBJC0Itge2N4r5nWyYPJzIUHrvC7DMKBPrXvGtFclF2rgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+RYosaHksBv8Jo1nao1BMihycU3X6s99qM0Bt8CDZSFhEejKM
	RojinD0FXIp07I5AVmL0SgUvVwHMjEJm+8uUHrxqEt6GUPUKfnV86qrq0Lnl/gkqO5+jXBux9Re
	Il2InGhW8YfJakeYAoZh770/W+so=
X-Google-Smtp-Source: AGHT+IF+7bMAIBWpPp9ZpYwoa+Iv2SEaNFgur+pE6KunkOxacIkCMQdQ0TOsiUNbIEVl+RbrIkKRo9Ai58gvP8G+H1Q=
X-Received: by 2002:a2e:bc1f:0:b0:2f5:487:e87a with SMTP id
 38308e7fff4ca-2f50487eaa3mr51459021fa.18.1724748429619; Tue, 27 Aug 2024
 01:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org> <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu> <20240823-darkened-cartload-d2621f33eab8@spud>
 <66c8c50f.050a0220.d7871.f209@mx.google.com> <Zsj8bmBJhfUdH6qT@lore-desk> <20240826-kinsman-crunching-e3b75297088c@spud>
In-Reply-To: <20240826-kinsman-crunching-e3b75297088c@spud>
From: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
Date: Tue, 27 Aug 2024 10:46:58 +0200
Message-ID: <CAA2SeNJ2Gi+3Za+jvAVqqbx7xEGLqkDBkJ8vL=pA=ZbKWOfp=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl controller
To: Conor Dooley <conor@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com
Content-Type: text/plain; charset="UTF-8"

>
> On Fri, Aug 23, 2024 at 11:17:34PM +0200, Lorenzo Bianconi wrote:
> > > On Fri, Aug 23, 2024 at 05:14:30PM +0100, Conor Dooley wrote:
> > > > On Thu, Aug 22, 2024 at 10:50:52PM +0200, Benjamin Larsson wrote:
> > > > > On 22/08/2024 18:06, Conor Dooley wrote:
> > > > >
> > > > >
> > > > > Hi.
> > > > >
> > > > > > before looking at v1:
> > > > > > I would really like to see an explanation for why this is a correct
> > > > > > model of the hardware as part of the commit message. To me this screams
> > > > > > syscon/MFD and instead of describing this as a child of a syscon and
> > > > > > using regmap to access it you're doing whatever this is...
> > > > >
> > > > > Can you post a link to a good example dts that uses syscon/MFD ?
> > > > >
> > > > > It is not only pinctrl, pwm and gpio that are entangled in each other. A
> > > > > good example would help with developing a proper implementation.
> > > >
> > > > Off the top of my head, no unfortunately. Maybe Rob or Krzk have a good
> > > > example. I would suggest to start by looking at drivers within gpio or
> > > > pinctrl that use syscon_to_regmap() where the argument is sourced from
> > > > either of_node->parent or dev.parent->of_node (which you use depends on
> > > > whether or not you have a child node or not).
> > > >
> > > > I recently had some questions myself for Rob about child nodes for mfd
> > > > devices and when they were suitable to use:
> > > > https://lore.kernel.org/all/20240815200003.GA2956351-robh@kernel.org/
> > > >
> > > > Following Rob's line of thought, I'd kinda expect an mfd driver to create
> > > > the devices for gpio and pwm using devm_mfd_add_devices() and the
> > > > pinctrl to have a child node.
> > >
> > > Just to not get confused and staring to focus on the wrong kind of
> > > API/too complex solution, I would suggest to check the example from
> > > Lorenzo.
> > >
> > > The pinctrl/gpio is an entire separate block and is mapped separately.
> > > What is problematic is that chip SCU is a mix and address are not in
> > > order and is required by many devices. (clock, pinctrl, gpio...)
> > >
> > > IMHO a mfd is overkill and wouldn't suite the task. MDF still support a
> > > single big region and in our case we need to map 2 different one (gpio
> > > AND chip SCU) (or for clock SCU and chip SCU)
> > >
> > > Similar problem is present in many other place and syscon is just for
> > > the task.
> > >
> > > Simple proposed solution is:
> > > - chip SCU entirely mapped and we use syscon
>
> That seems reasonable.

ack

>
> > > - pinctrl mapped and reference chip SCU by phandle
>
> ref by phandle shouldn't be needed here, looking up by compatible should
> suffice, no?

ack, I think it would be fine

>
> > > - pwm a child of pinctrl as it's scrambled in the pinctrl mapped regs
>
> The pwm is not a child of the pinctrl though, they're both subfunctions of
> the register region they happen to both be in. I don't agree with that
> appraisal, sounds like an MFD to me.

ack

>
> > > Hope this can clear any confusion.
> >
> > To clarify the hw architecture we are discussing about 3 memory regions:
> > - chip_scu: <0x1fa20000 0x384>
> > - scu: <0x1fb00020 0x94c>
>                   ^
> I'm highly suspicious of a register region that begins at 0x20. What is
> at 0x1fb00000?

sorry, my fault

>
> > - gpio: <0x1fbf0200 0xbc>
>
> Do you have a link to the register map documentation for this hardware?
>
> > The memory regions above are used by the following IC blocks:
> > - clock: chip_scu and scu
>
> What is the differentiation between these two different regions? Do they
> provide different clocks? Are registers from both of them required in
> order to provide particular clocks?

In chip-scu and scu memory regions we have heterogeneous registers.
Regarding clocks in chip-scu we have fixed clock registers (e.g. spi
clock divider, switch clock source and divider, main bus clock source
and divider, ...) while in scu (regarding clock configuration) we have
pcie clock regs (e.g. reset and other registers). This is the reason
why, in en7581-scu driver, we need both of them, but we can access
chip-scu via the compatible string (please take a look at the dts
below).

>
> > - pinctrl (io-muxing/gpio_chip/irq_chip): chip_scu and gpio
>
> Ditto here. Are these actually two different sets of iomuxes, or are
> registers from both required to mux a particular pin?

Most of the io-muxes configuration registers are in chip-scu block,
just pwm ones are in gpio memory block.
Gpio block is mainly used for gpio_chip and irq_chip functionalities.

>
> > - pwm: gpio
> >
> > clock and pinctrl devices share the chip_scu memory region but they need to
> > access even other separated memory areas (scu and gpio respectively).
> > pwm needs to just read/write few gpio registers.
> > As pointed out in my previous email, we can define the chip_scu block as
> > syscon node that can be accessed via phandle by clock and pinctrl drivers.
> > clock driver will map scu area while pinctrl one will map gpio memory block.
> > pwm can be just a child of pinctrl node.
>
> As I mentioned above, the last statement here I disagree with. As
> someone that's currently in the process of fixing making a mess of this
> exact kind of thing, I'm going to strongly advocate not taking shortcuts
> like this.
>
> IMO, all three of these regions need to be described as syscons in some
> form, how exactly it's hard to say without a better understanding of the
> breakdown between regions.
>
> If, for example, the chip_scu only provides a few "helper" bits, I'd
> expect something like
>
> syscon@1fa20000 {
>         compatible = "chip-scu", "syscon";
>         reg = <0x1fa2000 0x384>;
> };
>
> syscon@1fb00000 {
>         compatible = "scu", "syscon", "simple-mfd";
>         #clock-cells = 1;
> };
>
> syscon@1fbf0200 {
>         compatible = "gpio-scu", "syscon", "simple-mfd";
>         #pwm-cells = 1;
>
>         pinctrl@x {
>                 compatible = "pinctrl";
>                 reg = x;
>                 #pinctrl-cells = 1;
>                 #gpio-cells = 1;
>         };
> };
>

ack, so we could use the following dts nodes for the discussed memory
regions (chip-scu, scu and gpio):

syscon@1fa20000 {
    compatible = "airoha,chip-scu", "syscon";
    reg = <0x0 0x1fa2000 0x0 0x384>;
};

clock-controller@1fb00000 {
    compatible = "airoha,en7581-scu", "syscon";
    reg = <0x0 0x1fb00000 0x0 0x94c>;
    #clock-cells = <1>;
    #reset-cells = <1>;
};

mfd@1fbf0200 {
    compatible = "airoha,en7581-gpio-mfd", "simple-mfd";
    reg = <0x0 0x1fbf0200 0x0 0xc0>;

    pio: pinctrl {
        compatible = "airoha,en7581-pinctrl"
        gpio-controller;
        #gpio-cells = <2>;

        interrupt-controller;
        #interrupt-cells = <2>;
        interrupt-parent = <&gic>;
        interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
    }

    pwm: pwm {
        compatible = "airoha,en7581-pwm";
        #pwm-cells = <3>;
    }
};

What do you think?
If we all agree on the approach above, we can proceed with the
required changes in the clk/pinctrl and pwm drivers.

Regards,
Lorenzo

> And you could look up the chip-scu by its compatible from the clock or
> pinctrl drivers. Perhaps the "helper" bits assumption is incorrect
> however, and both the scu and chip scu provide independent clocks?
>
> > What do you think about this approach? Can we address the requirements above
> > via classic mfd driver?
>
>


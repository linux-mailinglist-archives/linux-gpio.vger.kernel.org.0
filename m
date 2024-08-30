Return-Path: <linux-gpio+bounces-9434-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F88965C15
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 10:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C590BB22E01
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 08:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A38216DC2E;
	Fri, 30 Aug 2024 08:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDpM+3Kq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350351D12F7;
	Fri, 30 Aug 2024 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007862; cv=none; b=NbgEaVuBglJ/rnHbAFOeZT9qh3CMUbYMQOgS4NJ8yewyNDgO/CmvBcMMrEkWacYtReN6sn87P5O+6ZWrwxxfz7QLysx1zRhj0RpqMVu8uAkomp980W1iTWoym4Sz3C1/HAsLZ0ar5pnN6OFRNmn0bwnBuMX6WRZSw+uiqguThC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007862; c=relaxed/simple;
	bh=+s6uKjSl876SfjsjCPodK6ABxL8IQc8gueIWMDLj/do=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLu77k3c4MxsHhPngkpudLNc1wbqClvwKjPjzrrNZE9k459eeyd1h/rp+IRREKZ3zJbiLvUFmnSpMThghakxbPwPsVJsp+Q26XfhKrGnZcgv9C+rXN1zlrxyPX2DWwed9MIjl4Jxv/pyWe3afB9eiFGxwIRkt7eeMNwBGlfBjjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDpM+3Kq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so14283655e9.2;
        Fri, 30 Aug 2024 01:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725007858; x=1725612658; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6OziwRUxyC3j96mdMIIg3OavGqoxpdJQW/+7PEbH1cs=;
        b=jDpM+3Kq6wnDO45HSXf3Yck5m98YTDRwus3UEvVtCwJPKKh4Cuu3a+7x7f02WEXcsn
         b42ldL2NOgWDPeftlX/z0s+UIHQcAA4oU3mvdm9GcNN5KrI+aIsO6Wc4t2L4bgzYFtsD
         w3IE83kJL9zCeaZGOI2G/xquyrD6RT6GSEQ9jKB5TSeuzPe1bR35lLuuRqCwCvr+9LEF
         +zog+PuSclbsNDLsGqt1vcLJNONRUGYXicLTvA8Yak65Kzneg4KZe0nKOyPvLzDr21o9
         MZKq6Nu22/U4VILmabrX1+tcl19Po3jws1W3SYzFLHLGDdNOlccysT+JAW3RHEilG1ld
         1rWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725007858; x=1725612658;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OziwRUxyC3j96mdMIIg3OavGqoxpdJQW/+7PEbH1cs=;
        b=S7ht8mABqPK8SDFL/Fw6dfTY0dN39K52drxju54/6BPMZieor6LtNzjn1QbzjfSwaw
         aZQiU/1h1Lh9vNyOtRFHaOF6TJfi8AnM9EvTYvaNYh7C+rDQEkMyIySDZ+VPIXhOhf/w
         /uS6dWbGlCiG1Jj5sNQGglO7kXvyRY7mRejsPxeGeclhTtKCs07ezrfCGj+RuFlvbcYe
         5YJIZmgeea3HmjlKlqVZviLbi05qzFuSDclk0LncW4IwO+UYmRWfI1GVpIstHPO0yh60
         dEYJ4C5qBStnzAI6SbhQU/932GZriQgRQgMRd/uEKrIAGr8CHUlB2ez07krzG7O1BPIX
         h2Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVtxITSAnz1pp2GOOsQNJhlQutVfWsFh8VdJ9B0RFGKqOeEjd/e0i7X+f01e9PsnBoUVbbeUqe/hGj4@vger.kernel.org, AJvYcCXqZC+SDW2awQC7u0h6fprBrDdWKFtSJTVdTPHs0wvAT0j0P3SPEupObpPBKodamLpXMB7M/HZFl1V9HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybJG7OwOjfzys03RYb6VkCidclgPmvOEPSlpAXNr1ZVLDV+5AD
	5vHVgQacxcENwm6qc7LmaruBZaEk4oC3vk1lDKYVMlG0OvFcW7JY
X-Google-Smtp-Source: AGHT+IHgZbN8ZqJx1LvmgAxQTgs7uHddgyhTVi3ZKrzZDekElTu7KefeyK2c9KlgWOrf7/rK3c5CyQ==
X-Received: by 2002:adf:e641:0:b0:368:12ef:92cf with SMTP id ffacd0b85a97d-3749b5896a6mr3908959f8f.48.1725007858115;
        Fri, 30 Aug 2024 01:50:58 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-1-209-141.retail.telecomitalia.it. [87.1.209.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df0a42sm38775625e9.11.2024.08.30.01.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:50:57 -0700 (PDT)
Message-ID: <66d187f1.050a0220.3213d8.ad53@mx.google.com>
X-Google-Original-Message-ID: <ZtGH745nmIMYZFEb@Ansuel-XPS.>
Date: Fri, 30 Aug 2024 10:50:55 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
	Conor Dooley <conor@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
References: <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
 <20240823-darkened-cartload-d2621f33eab8@spud>
 <66c8c50f.050a0220.d7871.f209@mx.google.com>
 <Zsj8bmBJhfUdH6qT@lore-desk>
 <20240826-kinsman-crunching-e3b75297088c@spud>
 <CAA2SeNJ2Gi+3Za+jvAVqqbx7xEGLqkDBkJ8vL=pA=ZbKWOfp=Q@mail.gmail.com>
 <CAL_JsqLBGwgX=PeCqP8+iFj6uvAO4O_dTvz7x1c+T1Kz+-q-QA@mail.gmail.com>
 <66ce1b04.df0a0220.a2131.6def@mx.google.com>
 <qro6jbupm27vvulymb4ckn7wm6qbvrvnydzjyd42metarlh2t2@hxdzvff4jdus>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qro6jbupm27vvulymb4ckn7wm6qbvrvnydzjyd42metarlh2t2@hxdzvff4jdus>

On Thu, Aug 29, 2024 at 08:20:10AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Aug 27, 2024 at 08:29:20PM +0200, Christian Marangi wrote:
> > On Tue, Aug 27, 2024 at 09:35:07AM -0500, Rob Herring wrote:
> > > On Tue, Aug 27, 2024 at 3:47 AM Lorenzo Bianconi
> > > <lorenzo.bianconi83@gmail.com> wrote:
> > > >
> > > > >
> > > > > On Fri, Aug 23, 2024 at 11:17:34PM +0200, Lorenzo Bianconi wrote:
> > > > > > > On Fri, Aug 23, 2024 at 05:14:30PM +0100, Conor Dooley wrote:
> > > > > > > > On Thu, Aug 22, 2024 at 10:50:52PM +0200, Benjamin Larsson wrote:
> > > > > > > > > On 22/08/2024 18:06, Conor Dooley wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Hi.
> > > > > > > > >
> > > > > > > > > > before looking at v1:
> > > > > > > > > > I would really like to see an explanation for why this is a correct
> > > > > > > > > > model of the hardware as part of the commit message. To me this screams
> > > > > > > > > > syscon/MFD and instead of describing this as a child of a syscon and
> > > > > > > > > > using regmap to access it you're doing whatever this is...
> > > > > > > > >
> > > > > > > > > Can you post a link to a good example dts that uses syscon/MFD ?
> > > > > > > > >
> > > > > > > > > It is not only pinctrl, pwm and gpio that are entangled in each other. A
> > > > > > > > > good example would help with developing a proper implementation.
> > > > > > > >
> > > > > > > > Off the top of my head, no unfortunately. Maybe Rob or Krzk have a good
> > > > > > > > example. I would suggest to start by looking at drivers within gpio or
> > > > > > > > pinctrl that use syscon_to_regmap() where the argument is sourced from
> > > > > > > > either of_node->parent or dev.parent->of_node (which you use depends on
> > > > > > > > whether or not you have a child node or not).
> > > > > > > >
> > > > > > > > I recently had some questions myself for Rob about child nodes for mfd
> > > > > > > > devices and when they were suitable to use:
> > > > > > > > https://lore.kernel.org/all/20240815200003.GA2956351-robh@kernel.org/
> > > > > > > >
> > > > > > > > Following Rob's line of thought, I'd kinda expect an mfd driver to create
> > > > > > > > the devices for gpio and pwm using devm_mfd_add_devices() and the
> > > > > > > > pinctrl to have a child node.
> > > > > > >
> > > > > > > Just to not get confused and staring to focus on the wrong kind of
> > > > > > > API/too complex solution, I would suggest to check the example from
> > > > > > > Lorenzo.
> > > > > > >
> > > > > > > The pinctrl/gpio is an entire separate block and is mapped separately.
> > > > > > > What is problematic is that chip SCU is a mix and address are not in
> > > > > > > order and is required by many devices. (clock, pinctrl, gpio...)
> > > > > > >
> > > > > > > IMHO a mfd is overkill and wouldn't suite the task. MDF still support a
> > > > > > > single big region and in our case we need to map 2 different one (gpio
> > > > > > > AND chip SCU) (or for clock SCU and chip SCU)
> > > > > > >
> > > > > > > Similar problem is present in many other place and syscon is just for
> > > > > > > the task.
> > > > > > >
> > > > > > > Simple proposed solution is:
> > > > > > > - chip SCU entirely mapped and we use syscon
> > > > >
> > > > > That seems reasonable.
> > > >
> > > > ack
> > > >
> > > > >
> > > > > > > - pinctrl mapped and reference chip SCU by phandle
> > > > >
> > > > > ref by phandle shouldn't be needed here, looking up by compatible should
> > > > > suffice, no?
> > > >
> > > > ack, I think it would be fine
> > > >
> > > > >
> > > > > > > - pwm a child of pinctrl as it's scrambled in the pinctrl mapped regs
> > > > >
> > > > > The pwm is not a child of the pinctrl though, they're both subfunctions of
> > > > > the register region they happen to both be in. I don't agree with that
> > > > > appraisal, sounds like an MFD to me.
> > > >
> > > > ack
> > > >
> > > > >
> > > > > > > Hope this can clear any confusion.
> > > > > >
> > > > > > To clarify the hw architecture we are discussing about 3 memory regions:
> > > > > > - chip_scu: <0x1fa20000 0x384>
> > > > > > - scu: <0x1fb00020 0x94c>
> > > > >                   ^
> > > > > I'm highly suspicious of a register region that begins at 0x20. What is
> > > > > at 0x1fb00000?
> > > >
> > > > sorry, my fault
> > > >
> > > > >
> > > > > > - gpio: <0x1fbf0200 0xbc>
> > > > >
> > > > > Do you have a link to the register map documentation for this hardware?
> > > > >
> > > > > > The memory regions above are used by the following IC blocks:
> > > > > > - clock: chip_scu and scu
> > > > >
> > > > > What is the differentiation between these two different regions? Do they
> > > > > provide different clocks? Are registers from both of them required in
> > > > > order to provide particular clocks?
> > > >
> > > > In chip-scu and scu memory regions we have heterogeneous registers.
> > > > Regarding clocks in chip-scu we have fixed clock registers (e.g. spi
> > > > clock divider, switch clock source and divider, main bus clock source
> > > > and divider, ...) while in scu (regarding clock configuration) we have
> > > > pcie clock regs (e.g. reset and other registers). This is the reason
> > > > why, in en7581-scu driver, we need both of them, but we can access
> > > > chip-scu via the compatible string (please take a look at the dts
> > > > below).
> > > >
> > > > >
> > > > > > - pinctrl (io-muxing/gpio_chip/irq_chip): chip_scu and gpio
> > > > >
> > > > > Ditto here. Are these actually two different sets of iomuxes, or are
> > > > > registers from both required to mux a particular pin?
> > > >
> > > > Most of the io-muxes configuration registers are in chip-scu block,
> > > > just pwm ones are in gpio memory block.
> > > > Gpio block is mainly used for gpio_chip and irq_chip functionalities.
> > > >
> > > > >
> > > > > > - pwm: gpio
> > > > > >
> > > > > > clock and pinctrl devices share the chip_scu memory region but they need to
> > > > > > access even other separated memory areas (scu and gpio respectively).
> > > > > > pwm needs to just read/write few gpio registers.
> > > > > > As pointed out in my previous email, we can define the chip_scu block as
> > > > > > syscon node that can be accessed via phandle by clock and pinctrl drivers.
> > > > > > clock driver will map scu area while pinctrl one will map gpio memory block.
> > > > > > pwm can be just a child of pinctrl node.
> > > > >
> > > > > As I mentioned above, the last statement here I disagree with. As
> > > > > someone that's currently in the process of fixing making a mess of this
> > > > > exact kind of thing, I'm going to strongly advocate not taking shortcuts
> > > > > like this.
> > > > >
> > > > > IMO, all three of these regions need to be described as syscons in some
> > > > > form, how exactly it's hard to say without a better understanding of the
> > > > > breakdown between regions.
> > > > >
> > > > > If, for example, the chip_scu only provides a few "helper" bits, I'd
> > > > > expect something like
> > > > >
> > > > > syscon@1fa20000 {
> > > > >         compatible = "chip-scu", "syscon";
> > > > >         reg = <0x1fa2000 0x384>;
> > > > > };
> > > > >
> > > > > syscon@1fb00000 {
> > > > >         compatible = "scu", "syscon", "simple-mfd";
> > > > >         #clock-cells = 1;
> > > > > };
> > > > >
> > > > > syscon@1fbf0200 {
> > > > >         compatible = "gpio-scu", "syscon", "simple-mfd";
> > > > >         #pwm-cells = 1;
> > > > >
> > > > >         pinctrl@x {
> > > > >                 compatible = "pinctrl";
> > > > >                 reg = x;
> > > > >                 #pinctrl-cells = 1;
> > > > >                 #gpio-cells = 1;
> > > > >         };
> > > > > };
> > > > >
> > > >
> > > > ack, so we could use the following dts nodes for the discussed memory
> > > > regions (chip-scu, scu and gpio):
> > > >
> > > > syscon@1fa20000 {
> > > >     compatible = "airoha,chip-scu", "syscon";
> > > >     reg = <0x0 0x1fa2000 0x0 0x384>;
> > > > };
> > > >
> > > > clock-controller@1fb00000 {
> > > >     compatible = "airoha,en7581-scu", "syscon";
> > > >     reg = <0x0 0x1fb00000 0x0 0x94c>;
> > > >     #clock-cells = <1>;
> > > >     #reset-cells = <1>;
> > > > };
> > > >
> > > > mfd@1fbf0200 {
> > > >     compatible = "airoha,en7581-gpio-mfd", "simple-mfd";
> > > >     reg = <0x0 0x1fbf0200 0x0 0xc0>;
> > > >
> > > >     pio: pinctrl {
> > > >         compatible = "airoha,en7581-pinctrl"
> > > >         gpio-controller;
> > > >         #gpio-cells = <2>;
> > > >
> > > >         interrupt-controller;
> > > >         #interrupt-cells = <2>;
> > > >         interrupt-parent = <&gic>;
> > > >         interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > > >     }
> > > >
> > > >     pwm: pwm {
> > > >         compatible = "airoha,en7581-pwm";
> > > >         #pwm-cells = <3>;
> > > >     }
> > > > };
> > > 
> > > I think this can be simplified down to this:
> > > 
> > > mfd@1fbf0200 {
> > >     compatible = "airoha,en7581-gpio-mfd";  // MFD is a Linuxism. What
> > > is this h/w block called?
> > >     reg = <0x0 0x1fbf0200 0x0 0xc0>;
> > >     gpio-controller;
> > >     #gpio-cells = <2>;
> > >     interrupt-controller;
> > >     #interrupt-cells = <2>;
> > >     interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > > 
> > >     #pwm-cells = <3>;
> > > 
> > >     pio: pinctrl {
> > >         foo-pins {};
> > >         bar-pins {};
> > >     };
> > > };
> > > 
> > > Maybe we keep the compatible in 'pinctrl'...
> > >
> > 
> > Hi Rob, thanks a lot for the hint, I hope we can finally find a solution
> > on how to implement this.
> > 
> > In Documentation the block is called GPIO Controller. As explained it does
> > expose pinctrl function AND pwm (with regs in the middle)
> > 
> > Is this semplification really needed? It does pose some problem driver
> > wise (on where to put the driver, in what subsystem) and also on the
> 
> Sorry, but no, dt-bindings do not affect the driver at all in such way.
> Nothing changes in your driver in such aspect, no dilemma where to put
> it (the same place as before).
>

Ok, from the proposed node structure, is it problematic to move the
gpio-controller and -cells in the pinctrl node? And also the pwm-cells
to the pwm node?
This is similar to how it's done by broadcom GPIO MFD [1] that also
expose pinctrl and other device in the same register block as MFD
childs.

This would be the final node block.

                mfd@1fbf0200 {
                        compatible = "airoha,en7581-gpio-mfd";
                        reg = <0x0 0x1fbf0200 0x0 0xc0>;

                        interrupt-parent = <&gic>;
                        interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;

                        pio: pinctrl {
                                compatible = "airoha,en7581-pinctrl";

                                gpio-controller;
                                #gpio-cells = <2>;

                                interrupt-controller;
                                #interrupt-cells = <2>;
                        };

                        pwm: pwm {
                                compatible = "airoha,en7581-pwm";

                                #pwm-cells = <3>;
                                status = "disabled";
                        };
                };

I also link the implementation of the MFD driver [2]

[1] https://elixir.bootlin.com/linux/v6.10.7/source/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
[2] https://github.com/Ansuel/linux/blob/airoha-mfd/drivers/mfd/airoha-en7581-gpio-mfd.c

> > yaml side with mixed property for pinctrl and pwm controller.
> 
> Hardware people mixed it, not we...
> 
> > 
> > I feel mixing the 2 thing might cause some confusion on the 2 block
> > device that are well separated aside from the unlucky position of the
> > regs.
> 
> I think the feedback you got is that essentially these are parts of the
> same device. Are you saying that hardware is really two separate
> devices?
> 
> > 
> > The suggested MFD implementation would consist of
> > - main node with MFD (map the entire GPIO controller regs)
> > -   2 child for PWM and pinctrl (no regs)
> > 
> > - driver in mfd/
> > - driver in pinctrl/
> > - driver in pwm/
> 
> This has nothing to do with bindings, except that you will need one
> driver somewhere which adds child devices, but you still could do
> everything as two drivers (as before).
> 
> Anyway how to structure drivers is rarely good argument about bindings.
> 
> > 
> > An alternative is the previous solution with pinctrl mapping all the
> > GPIO controller regs and PWM a child but Conor suggested that a MFD
> > structure might be better suited for the task. We have both implemented
> > and ready to be submitted. Hope we can find a common decision on how to
> > implement this simple but annoying block of devices.
> 
> Best regards,
> Krzysztof
> 

-- 
	Ansuel


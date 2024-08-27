Return-Path: <linux-gpio+bounces-9228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6E09616FE
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 20:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B7E5283FDE
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 18:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331341D1F4C;
	Tue, 27 Aug 2024 18:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jojjj+AU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAAD1C57A5;
	Tue, 27 Aug 2024 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724783369; cv=none; b=rq2ypN55C/EP/4UORJEuVey9UzVY+GL0NBMnx5bpp8DKoF1A8lGo3HDCLxrb5MlZG+Bh8zoX1AWpBFoa/QMqKeFrE6VJgtUmUKi1fQvv5ettNq1Ow44cR6wBXADNRlOmew1FJUQARs5IWokxcPgzaa/Yr4cZx0Lo+o8iHf2FyD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724783369; c=relaxed/simple;
	bh=EnYjS++9YilliVGA8wfsFMGybcXA/J3pmRuAWqg/ZXM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CA0UMZFSphh2POm7ukAAj2+LnI6l6QoputgKdKBYZq3U2rE1SMGx3/19/h4/Gam0O+1+YDrYhCJJFUCat2DHphcHF3pR+1L8YflW0K08x5J9NluDahwbgpFK0/53R7GJYeFsXa7xS0ykKoQnjKtHkCko53lUu9mC3dR7dLHZkpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jojjj+AU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-371b97cfd6fso3741565f8f.2;
        Tue, 27 Aug 2024 11:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724783365; x=1725388165; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WI1N1DgwDsJPwlRve7vkKC6KRtuD+miK3xK7WkyW/yM=;
        b=Jojjj+AUt19zb7B1JKRzzDcJNbDOyVc2kMkWblzijpXh+4tdIJQR7dOB5Ce12TkT7X
         TjM+QB6fH3tzKsup7jncWOQ2abEuwdDwR958ycqUvJXLDFTFFnMcpg4rBwshq84MQ4aY
         q336YEgXOa30CRY9rC09dsKWfvYUsX3QzT9iIkF7LXl9ogi0qFcxF5D9G2Gzv1SqIMh1
         7Gn+yK1Ltkp8/XaxvGj2OJ00uuMUMm5/+c/HLG7PI6OnDs3pHHayAH5cYr/UI5/hBThS
         3xDpt+ObUn57FXnmaz0jCZ6Xwgg3yrufe4EnsYSyD1oGlL3/83ix0tUsy2Y9CxjkwPKy
         VSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724783365; x=1725388165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WI1N1DgwDsJPwlRve7vkKC6KRtuD+miK3xK7WkyW/yM=;
        b=Nk0Ds4RFVSuIfD4gvTJG2vCdsW+dzT8ci1ve8xH3MsZ1jYxvd0df6b6ol0QFp0069b
         6mpdurkuyQrqpyzUFbZPkd5YWH9sj1nfdbHPWxzDMtxs8QsI7vztZXdX57OV7h6e2oYt
         sjkts76xHc5Oc2wk/zXQ7oc6pqx2+h2G4hE2PoipV2oSVwWj0toCPeRidnXvQIDKS8ae
         ZsSF0owT2IaDem4ks7n6z6YrPJ7e/Luab2BRYhqH2AiDx/SjwUar4q9wApwb+cinY+xy
         0FbFsi4n4aftmYqYrcQpPCU9itgYTB9vUAT8nmhEURxWS5euWwbHaclkJb+HQ6/kS5T3
         rQ7g==
X-Forwarded-Encrypted: i=1; AJvYcCW+t33L0B7Gd5PwBq5HcAOTnZQYvZ12xYe323bJS2yvbO/sSGJmALKaJDYlagHtLfmMqV3M3t5AfioA@vger.kernel.org, AJvYcCXpNsNLmh3goNuLuHDgQQWNxPJAP7H1zNTNUEf18uSgx6PwkWSs08gedKP1Tszg8svUcQq4dewuuLs7eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl8pFl6G5315xorzFlg5W4LjtmTZM6fm8OiNggE06yMHafjo+D
	jZm8rr1cFiF4mWdGLbKK3hQq6RNo3naOOzHDL+eRHKDNEEGnli0X
X-Google-Smtp-Source: AGHT+IEh8e9df02+VsFiaG+m2FW0LXgC8j4lKzwsfi4bbOggJsY8PNcGwyF+AYmZjvqrw4VScPcODg==
X-Received: by 2002:a5d:4903:0:b0:368:d0d:a5d6 with SMTP id ffacd0b85a97d-3748c81a27cmr1883813f8f.50.1724783364861;
        Tue, 27 Aug 2024 11:29:24 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-1-209-141.retail.telecomitalia.it. [87.1.209.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730817a2f4sm13703619f8f.61.2024.08.27.11.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 11:29:24 -0700 (PDT)
Message-ID: <66ce1b04.df0a0220.a2131.6def@mx.google.com>
X-Google-Original-Message-ID: <Zs4bADmXY6V4ukSg@Ansuel-XPS.>
Date: Tue, 27 Aug 2024 20:29:20 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
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
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
 <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
 <20240823-darkened-cartload-d2621f33eab8@spud>
 <66c8c50f.050a0220.d7871.f209@mx.google.com>
 <Zsj8bmBJhfUdH6qT@lore-desk>
 <20240826-kinsman-crunching-e3b75297088c@spud>
 <CAA2SeNJ2Gi+3Za+jvAVqqbx7xEGLqkDBkJ8vL=pA=ZbKWOfp=Q@mail.gmail.com>
 <CAL_JsqLBGwgX=PeCqP8+iFj6uvAO4O_dTvz7x1c+T1Kz+-q-QA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLBGwgX=PeCqP8+iFj6uvAO4O_dTvz7x1c+T1Kz+-q-QA@mail.gmail.com>

On Tue, Aug 27, 2024 at 09:35:07AM -0500, Rob Herring wrote:
> On Tue, Aug 27, 2024 at 3:47 AM Lorenzo Bianconi
> <lorenzo.bianconi83@gmail.com> wrote:
> >
> > >
> > > On Fri, Aug 23, 2024 at 11:17:34PM +0200, Lorenzo Bianconi wrote:
> > > > > On Fri, Aug 23, 2024 at 05:14:30PM +0100, Conor Dooley wrote:
> > > > > > On Thu, Aug 22, 2024 at 10:50:52PM +0200, Benjamin Larsson wrote:
> > > > > > > On 22/08/2024 18:06, Conor Dooley wrote:
> > > > > > >
> > > > > > >
> > > > > > > Hi.
> > > > > > >
> > > > > > > > before looking at v1:
> > > > > > > > I would really like to see an explanation for why this is a correct
> > > > > > > > model of the hardware as part of the commit message. To me this screams
> > > > > > > > syscon/MFD and instead of describing this as a child of a syscon and
> > > > > > > > using regmap to access it you're doing whatever this is...
> > > > > > >
> > > > > > > Can you post a link to a good example dts that uses syscon/MFD ?
> > > > > > >
> > > > > > > It is not only pinctrl, pwm and gpio that are entangled in each other. A
> > > > > > > good example would help with developing a proper implementation.
> > > > > >
> > > > > > Off the top of my head, no unfortunately. Maybe Rob or Krzk have a good
> > > > > > example. I would suggest to start by looking at drivers within gpio or
> > > > > > pinctrl that use syscon_to_regmap() where the argument is sourced from
> > > > > > either of_node->parent or dev.parent->of_node (which you use depends on
> > > > > > whether or not you have a child node or not).
> > > > > >
> > > > > > I recently had some questions myself for Rob about child nodes for mfd
> > > > > > devices and when they were suitable to use:
> > > > > > https://lore.kernel.org/all/20240815200003.GA2956351-robh@kernel.org/
> > > > > >
> > > > > > Following Rob's line of thought, I'd kinda expect an mfd driver to create
> > > > > > the devices for gpio and pwm using devm_mfd_add_devices() and the
> > > > > > pinctrl to have a child node.
> > > > >
> > > > > Just to not get confused and staring to focus on the wrong kind of
> > > > > API/too complex solution, I would suggest to check the example from
> > > > > Lorenzo.
> > > > >
> > > > > The pinctrl/gpio is an entire separate block and is mapped separately.
> > > > > What is problematic is that chip SCU is a mix and address are not in
> > > > > order and is required by many devices. (clock, pinctrl, gpio...)
> > > > >
> > > > > IMHO a mfd is overkill and wouldn't suite the task. MDF still support a
> > > > > single big region and in our case we need to map 2 different one (gpio
> > > > > AND chip SCU) (or for clock SCU and chip SCU)
> > > > >
> > > > > Similar problem is present in many other place and syscon is just for
> > > > > the task.
> > > > >
> > > > > Simple proposed solution is:
> > > > > - chip SCU entirely mapped and we use syscon
> > >
> > > That seems reasonable.
> >
> > ack
> >
> > >
> > > > > - pinctrl mapped and reference chip SCU by phandle
> > >
> > > ref by phandle shouldn't be needed here, looking up by compatible should
> > > suffice, no?
> >
> > ack, I think it would be fine
> >
> > >
> > > > > - pwm a child of pinctrl as it's scrambled in the pinctrl mapped regs
> > >
> > > The pwm is not a child of the pinctrl though, they're both subfunctions of
> > > the register region they happen to both be in. I don't agree with that
> > > appraisal, sounds like an MFD to me.
> >
> > ack
> >
> > >
> > > > > Hope this can clear any confusion.
> > > >
> > > > To clarify the hw architecture we are discussing about 3 memory regions:
> > > > - chip_scu: <0x1fa20000 0x384>
> > > > - scu: <0x1fb00020 0x94c>
> > >                   ^
> > > I'm highly suspicious of a register region that begins at 0x20. What is
> > > at 0x1fb00000?
> >
> > sorry, my fault
> >
> > >
> > > > - gpio: <0x1fbf0200 0xbc>
> > >
> > > Do you have a link to the register map documentation for this hardware?
> > >
> > > > The memory regions above are used by the following IC blocks:
> > > > - clock: chip_scu and scu
> > >
> > > What is the differentiation between these two different regions? Do they
> > > provide different clocks? Are registers from both of them required in
> > > order to provide particular clocks?
> >
> > In chip-scu and scu memory regions we have heterogeneous registers.
> > Regarding clocks in chip-scu we have fixed clock registers (e.g. spi
> > clock divider, switch clock source and divider, main bus clock source
> > and divider, ...) while in scu (regarding clock configuration) we have
> > pcie clock regs (e.g. reset and other registers). This is the reason
> > why, in en7581-scu driver, we need both of them, but we can access
> > chip-scu via the compatible string (please take a look at the dts
> > below).
> >
> > >
> > > > - pinctrl (io-muxing/gpio_chip/irq_chip): chip_scu and gpio
> > >
> > > Ditto here. Are these actually two different sets of iomuxes, or are
> > > registers from both required to mux a particular pin?
> >
> > Most of the io-muxes configuration registers are in chip-scu block,
> > just pwm ones are in gpio memory block.
> > Gpio block is mainly used for gpio_chip and irq_chip functionalities.
> >
> > >
> > > > - pwm: gpio
> > > >
> > > > clock and pinctrl devices share the chip_scu memory region but they need to
> > > > access even other separated memory areas (scu and gpio respectively).
> > > > pwm needs to just read/write few gpio registers.
> > > > As pointed out in my previous email, we can define the chip_scu block as
> > > > syscon node that can be accessed via phandle by clock and pinctrl drivers.
> > > > clock driver will map scu area while pinctrl one will map gpio memory block.
> > > > pwm can be just a child of pinctrl node.
> > >
> > > As I mentioned above, the last statement here I disagree with. As
> > > someone that's currently in the process of fixing making a mess of this
> > > exact kind of thing, I'm going to strongly advocate not taking shortcuts
> > > like this.
> > >
> > > IMO, all three of these regions need to be described as syscons in some
> > > form, how exactly it's hard to say without a better understanding of the
> > > breakdown between regions.
> > >
> > > If, for example, the chip_scu only provides a few "helper" bits, I'd
> > > expect something like
> > >
> > > syscon@1fa20000 {
> > >         compatible = "chip-scu", "syscon";
> > >         reg = <0x1fa2000 0x384>;
> > > };
> > >
> > > syscon@1fb00000 {
> > >         compatible = "scu", "syscon", "simple-mfd";
> > >         #clock-cells = 1;
> > > };
> > >
> > > syscon@1fbf0200 {
> > >         compatible = "gpio-scu", "syscon", "simple-mfd";
> > >         #pwm-cells = 1;
> > >
> > >         pinctrl@x {
> > >                 compatible = "pinctrl";
> > >                 reg = x;
> > >                 #pinctrl-cells = 1;
> > >                 #gpio-cells = 1;
> > >         };
> > > };
> > >
> >
> > ack, so we could use the following dts nodes for the discussed memory
> > regions (chip-scu, scu and gpio):
> >
> > syscon@1fa20000 {
> >     compatible = "airoha,chip-scu", "syscon";
> >     reg = <0x0 0x1fa2000 0x0 0x384>;
> > };
> >
> > clock-controller@1fb00000 {
> >     compatible = "airoha,en7581-scu", "syscon";
> >     reg = <0x0 0x1fb00000 0x0 0x94c>;
> >     #clock-cells = <1>;
> >     #reset-cells = <1>;
> > };
> >
> > mfd@1fbf0200 {
> >     compatible = "airoha,en7581-gpio-mfd", "simple-mfd";
> >     reg = <0x0 0x1fbf0200 0x0 0xc0>;
> >
> >     pio: pinctrl {
> >         compatible = "airoha,en7581-pinctrl"
> >         gpio-controller;
> >         #gpio-cells = <2>;
> >
> >         interrupt-controller;
> >         #interrupt-cells = <2>;
> >         interrupt-parent = <&gic>;
> >         interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> >     }
> >
> >     pwm: pwm {
> >         compatible = "airoha,en7581-pwm";
> >         #pwm-cells = <3>;
> >     }
> > };
> 
> I think this can be simplified down to this:
> 
> mfd@1fbf0200 {
>     compatible = "airoha,en7581-gpio-mfd";  // MFD is a Linuxism. What
> is this h/w block called?
>     reg = <0x0 0x1fbf0200 0x0 0xc0>;
>     gpio-controller;
>     #gpio-cells = <2>;
>     interrupt-controller;
>     #interrupt-cells = <2>;
>     interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> 
>     #pwm-cells = <3>;
> 
>     pio: pinctrl {
>         foo-pins {};
>         bar-pins {};
>     };
> };
> 
> Maybe we keep the compatible in 'pinctrl'...
>

Hi Rob, thanks a lot for the hint, I hope we can finally find a solution
on how to implement this.

In Documentation the block is called GPIO Controller. As explained it does
expose pinctrl function AND pwm (with regs in the middle)

Is this semplification really needed? It does pose some problem driver
wise (on where to put the driver, in what subsystem) and also on the
yaml side with mixed property for pinctrl and pwm controller.

I feel mixing the 2 thing might cause some confusion on the 2 block
device that are well separated aside from the unlucky position of the
regs.

The suggested MFD implementation would consist of
- main node with MFD (map the entire GPIO controller regs)
-   2 child for PWM and pinctrl (no regs)

- driver in mfd/
- driver in pinctrl/
- driver in pwm/

An alternative is the previous solution with pinctrl mapping all the
GPIO controller regs and PWM a child but Conor suggested that a MFD
structure might be better suited for the task. We have both implemented
and ready to be submitted. Hope we can find a common decision on how to
implement this simple but annoying block of devices.

-- 
	Ansuel


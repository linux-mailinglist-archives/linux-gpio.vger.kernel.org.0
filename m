Return-Path: <linux-gpio+bounces-9221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E15B960DB4
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 16:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 465FA283C3A
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 14:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171881C4EDF;
	Tue, 27 Aug 2024 14:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tGr6JwBq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33261A08A3;
	Tue, 27 Aug 2024 14:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724769321; cv=none; b=c2itc2Rn/cl6UfZA1YUXmnjOU1JlM/QP282MmTwFxZiKdPQroR0GR0vfuWPf1PhQx8m4Zx18dtJa2q9TZ3NOCfVgb09Ud638a58C8nPN92RO2E7sqJgY93MGPVxrlv9dC5F+Ro22B/gN4odLLxnFW8OqBfN8joGPWqJVbxLkpps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724769321; c=relaxed/simple;
	bh=gNluJD47zq0RXPw2iHM9bHCpK9FjaaskBf7oH7YFeiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qI63+PeZ0UwYF8zNXyVaL20mTjV1G7KIuYe/qUL77dF0m7B5O09C6fN9hwDUcdOQvpAlX4JI6iEH2O4geJ4a4ovz7sE0Ae+sRYGHddq1zMlxGk4U9ANvaNxnzA2jNm4hUkxMtVkB9VWrqhnhgW0eB8WEJ9H0bh8dfTYhzhD8u+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tGr6JwBq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9A4C4DE03;
	Tue, 27 Aug 2024 14:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724769321;
	bh=gNluJD47zq0RXPw2iHM9bHCpK9FjaaskBf7oH7YFeiE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tGr6JwBqvpKlL2WSqvTM0zBeNP9BGIhmHDTuVL/EDzIB7OXMs/g04bmEYxa3x0gJh
	 rOCMe8YnulbL9zyuJJ4JBB2El2kvRw7NKrek7thdyuGCxHUULqJhuqYI7rA/t6zw8b
	 Vrw7PLnN6wd1ZMexUBCuxs8O8J9l5vyHM+M8mUn27SvG/lvAiiIWI6qlVhBcf15yfu
	 LKj6GNgYswtXHQTWOomN9kIzpBpec100ukTOIxAxWSyV4Ky+YLKs0qfLShZfjqcSYb
	 OargYs6TscoB82kkPUQRDdL2N4xHqWtVjIWPZZyv/93OQ5yntY08piI5Adkxe7yac8
	 M5B3v5D1xT48Q==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-534366c1aa2so4733403e87.1;
        Tue, 27 Aug 2024 07:35:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTsrrGYcdz9Udj5IRNiMHyctHmktyFrbU8XnJVKVTYrPOziGrNznz4sAWgsCHf86NR42z5mCfkZjsb@vger.kernel.org, AJvYcCWCsavWtoFQ9EgkbpVr0qaF9otd+OwEt7HxFeFSvDjBDUaBwsaP0YlF+fCEWm65lT1Yc+3W2mAwSDvvRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5qOf3I4dDyiGOHqtyGXcT4yqSz7aBJpMsrlCJ557MdnCgfcrD
	BBEzO3foz5B9fMTsi8zSsUGfcCIikEMLU1+HDP88kJAvFhMFA2ksyFq1gIGAKzM8y0V7SuudMQd
	rzlb7V0QjOtNpcEaTuU6UVU6pew==
X-Google-Smtp-Source: AGHT+IETK3L2mjVlPumnK40JAlKHVIfPIiclM8cZkWecSRmLMhHXYPoru+qzxXDpx9WKIGo5byDbzmfb9xdvPci7Uk4=
X-Received: by 2002:a05:6512:1092:b0:533:7ce:20cd with SMTP id
 2adb3069b0e04-5343885f5e4mr8878903e87.39.1724769319607; Tue, 27 Aug 2024
 07:35:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org> <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu> <20240823-darkened-cartload-d2621f33eab8@spud>
 <66c8c50f.050a0220.d7871.f209@mx.google.com> <Zsj8bmBJhfUdH6qT@lore-desk>
 <20240826-kinsman-crunching-e3b75297088c@spud> <CAA2SeNJ2Gi+3Za+jvAVqqbx7xEGLqkDBkJ8vL=pA=ZbKWOfp=Q@mail.gmail.com>
In-Reply-To: <CAA2SeNJ2Gi+3Za+jvAVqqbx7xEGLqkDBkJ8vL=pA=ZbKWOfp=Q@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 Aug 2024 09:35:07 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLBGwgX=PeCqP8+iFj6uvAO4O_dTvz7x1c+T1Kz+-q-QA@mail.gmail.com>
Message-ID: <CAL_JsqLBGwgX=PeCqP8+iFj6uvAO4O_dTvz7x1c+T1Kz+-q-QA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl controller
To: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 3:47=E2=80=AFAM Lorenzo Bianconi
<lorenzo.bianconi83@gmail.com> wrote:
>
> >
> > On Fri, Aug 23, 2024 at 11:17:34PM +0200, Lorenzo Bianconi wrote:
> > > > On Fri, Aug 23, 2024 at 05:14:30PM +0100, Conor Dooley wrote:
> > > > > On Thu, Aug 22, 2024 at 10:50:52PM +0200, Benjamin Larsson wrote:
> > > > > > On 22/08/2024 18:06, Conor Dooley wrote:
> > > > > >
> > > > > >
> > > > > > Hi.
> > > > > >
> > > > > > > before looking at v1:
> > > > > > > I would really like to see an explanation for why this is a c=
orrect
> > > > > > > model of the hardware as part of the commit message. To me th=
is screams
> > > > > > > syscon/MFD and instead of describing this as a child of a sys=
con and
> > > > > > > using regmap to access it you're doing whatever this is...
> > > > > >
> > > > > > Can you post a link to a good example dts that uses syscon/MFD =
?
> > > > > >
> > > > > > It is not only pinctrl, pwm and gpio that are entangled in each=
 other. A
> > > > > > good example would help with developing a proper implementation=
.
> > > > >
> > > > > Off the top of my head, no unfortunately. Maybe Rob or Krzk have =
a good
> > > > > example. I would suggest to start by looking at drivers within gp=
io or
> > > > > pinctrl that use syscon_to_regmap() where the argument is sourced=
 from
> > > > > either of_node->parent or dev.parent->of_node (which you use depe=
nds on
> > > > > whether or not you have a child node or not).
> > > > >
> > > > > I recently had some questions myself for Rob about child nodes fo=
r mfd
> > > > > devices and when they were suitable to use:
> > > > > https://lore.kernel.org/all/20240815200003.GA2956351-robh@kernel.=
org/
> > > > >
> > > > > Following Rob's line of thought, I'd kinda expect an mfd driver t=
o create
> > > > > the devices for gpio and pwm using devm_mfd_add_devices() and the
> > > > > pinctrl to have a child node.
> > > >
> > > > Just to not get confused and staring to focus on the wrong kind of
> > > > API/too complex solution, I would suggest to check the example from
> > > > Lorenzo.
> > > >
> > > > The pinctrl/gpio is an entire separate block and is mapped separate=
ly.
> > > > What is problematic is that chip SCU is a mix and address are not i=
n
> > > > order and is required by many devices. (clock, pinctrl, gpio...)
> > > >
> > > > IMHO a mfd is overkill and wouldn't suite the task. MDF still suppo=
rt a
> > > > single big region and in our case we need to map 2 different one (g=
pio
> > > > AND chip SCU) (or for clock SCU and chip SCU)
> > > >
> > > > Similar problem is present in many other place and syscon is just f=
or
> > > > the task.
> > > >
> > > > Simple proposed solution is:
> > > > - chip SCU entirely mapped and we use syscon
> >
> > That seems reasonable.
>
> ack
>
> >
> > > > - pinctrl mapped and reference chip SCU by phandle
> >
> > ref by phandle shouldn't be needed here, looking up by compatible shoul=
d
> > suffice, no?
>
> ack, I think it would be fine
>
> >
> > > > - pwm a child of pinctrl as it's scrambled in the pinctrl mapped re=
gs
> >
> > The pwm is not a child of the pinctrl though, they're both subfunctions=
 of
> > the register region they happen to both be in. I don't agree with that
> > appraisal, sounds like an MFD to me.
>
> ack
>
> >
> > > > Hope this can clear any confusion.
> > >
> > > To clarify the hw architecture we are discussing about 3 memory regio=
ns:
> > > - chip_scu: <0x1fa20000 0x384>
> > > - scu: <0x1fb00020 0x94c>
> >                   ^
> > I'm highly suspicious of a register region that begins at 0x20. What is
> > at 0x1fb00000?
>
> sorry, my fault
>
> >
> > > - gpio: <0x1fbf0200 0xbc>
> >
> > Do you have a link to the register map documentation for this hardware?
> >
> > > The memory regions above are used by the following IC blocks:
> > > - clock: chip_scu and scu
> >
> > What is the differentiation between these two different regions? Do the=
y
> > provide different clocks? Are registers from both of them required in
> > order to provide particular clocks?
>
> In chip-scu and scu memory regions we have heterogeneous registers.
> Regarding clocks in chip-scu we have fixed clock registers (e.g. spi
> clock divider, switch clock source and divider, main bus clock source
> and divider, ...) while in scu (regarding clock configuration) we have
> pcie clock regs (e.g. reset and other registers). This is the reason
> why, in en7581-scu driver, we need both of them, but we can access
> chip-scu via the compatible string (please take a look at the dts
> below).
>
> >
> > > - pinctrl (io-muxing/gpio_chip/irq_chip): chip_scu and gpio
> >
> > Ditto here. Are these actually two different sets of iomuxes, or are
> > registers from both required to mux a particular pin?
>
> Most of the io-muxes configuration registers are in chip-scu block,
> just pwm ones are in gpio memory block.
> Gpio block is mainly used for gpio_chip and irq_chip functionalities.
>
> >
> > > - pwm: gpio
> > >
> > > clock and pinctrl devices share the chip_scu memory region but they n=
eed to
> > > access even other separated memory areas (scu and gpio respectively).
> > > pwm needs to just read/write few gpio registers.
> > > As pointed out in my previous email, we can define the chip_scu block=
 as
> > > syscon node that can be accessed via phandle by clock and pinctrl dri=
vers.
> > > clock driver will map scu area while pinctrl one will map gpio memory=
 block.
> > > pwm can be just a child of pinctrl node.
> >
> > As I mentioned above, the last statement here I disagree with. As
> > someone that's currently in the process of fixing making a mess of this
> > exact kind of thing, I'm going to strongly advocate not taking shortcut=
s
> > like this.
> >
> > IMO, all three of these regions need to be described as syscons in some
> > form, how exactly it's hard to say without a better understanding of th=
e
> > breakdown between regions.
> >
> > If, for example, the chip_scu only provides a few "helper" bits, I'd
> > expect something like
> >
> > syscon@1fa20000 {
> >         compatible =3D "chip-scu", "syscon";
> >         reg =3D <0x1fa2000 0x384>;
> > };
> >
> > syscon@1fb00000 {
> >         compatible =3D "scu", "syscon", "simple-mfd";
> >         #clock-cells =3D 1;
> > };
> >
> > syscon@1fbf0200 {
> >         compatible =3D "gpio-scu", "syscon", "simple-mfd";
> >         #pwm-cells =3D 1;
> >
> >         pinctrl@x {
> >                 compatible =3D "pinctrl";
> >                 reg =3D x;
> >                 #pinctrl-cells =3D 1;
> >                 #gpio-cells =3D 1;
> >         };
> > };
> >
>
> ack, so we could use the following dts nodes for the discussed memory
> regions (chip-scu, scu and gpio):
>
> syscon@1fa20000 {
>     compatible =3D "airoha,chip-scu", "syscon";
>     reg =3D <0x0 0x1fa2000 0x0 0x384>;
> };
>
> clock-controller@1fb00000 {
>     compatible =3D "airoha,en7581-scu", "syscon";
>     reg =3D <0x0 0x1fb00000 0x0 0x94c>;
>     #clock-cells =3D <1>;
>     #reset-cells =3D <1>;
> };
>
> mfd@1fbf0200 {
>     compatible =3D "airoha,en7581-gpio-mfd", "simple-mfd";
>     reg =3D <0x0 0x1fbf0200 0x0 0xc0>;
>
>     pio: pinctrl {
>         compatible =3D "airoha,en7581-pinctrl"
>         gpio-controller;
>         #gpio-cells =3D <2>;
>
>         interrupt-controller;
>         #interrupt-cells =3D <2>;
>         interrupt-parent =3D <&gic>;
>         interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
>     }
>
>     pwm: pwm {
>         compatible =3D "airoha,en7581-pwm";
>         #pwm-cells =3D <3>;
>     }
> };

I think this can be simplified down to this:

mfd@1fbf0200 {
    compatible =3D "airoha,en7581-gpio-mfd";  // MFD is a Linuxism. What
is this h/w block called?
    reg =3D <0x0 0x1fbf0200 0x0 0xc0>;
    gpio-controller;
    #gpio-cells =3D <2>;
    interrupt-controller;
    #interrupt-cells =3D <2>;
    interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;

    #pwm-cells =3D <3>;

    pio: pinctrl {
        foo-pins {};
        bar-pins {};
    };
};

Maybe we keep the compatible in 'pinctrl'...

Rob


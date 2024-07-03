Return-Path: <linux-gpio+bounces-8023-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B936E9268EF
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 21:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC18F1C2442F
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 19:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE9A18A952;
	Wed,  3 Jul 2024 19:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="RPoRTLfc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A0418754E
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 19:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720034393; cv=none; b=Hp3oTHcXtXwV6Env4Bedj42D7A0MIRWBLbvv6WPOGi/cP/RmiattgvKD99hLTA1FHeGnM2yjwcYJhyx+6+kOS5dsHWOzwg13+FutBoaXYFCKwR3jV9avdLBjtnNyydFqQY/mGFDKcBpxwR07ZyWSTMbz4b7yZOSZYr1eNGX9nKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720034393; c=relaxed/simple;
	bh=BJ6RC6onlGGX/XDQEkORvB1LJgrzC5L7WRNwulU/o9o=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeRDgRNLf4iM/t9JqXqKq8B2r1Ifk0VYekNc4gY8ZiSB6QXPr5MA2BAGGT/LN4WpnqPpUX2ngqwIixsFxb1fIntB+KKC5X5bSOb0mzqZ2sWNcxKz242erx474YdQhiEiFpk0rIJw3mExxnlUl3sxAeLrFJYV3FE6EEKf7/QhZmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=RPoRTLfc; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 655133FD42
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 19:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1720034384;
	bh=4AL8Q8t5GvaSDcDlTv2xvRzLk0BHc20eWebGxrnXzHw=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=RPoRTLfcfq+jMTLG2h1dXkBX7EkZr/zBB9s0Wx7ItaVrUSzDGfjsoPk9tIErmTrpf
	 dBm5nyYhLD1rXf9gQ/ob0at+cgEacw/C0gI4/aQqrhLhHHY5zG5GygvCagZXOjs0Ic
	 C2C5MrIMPbIFWsWciFn+aPiMpRfFjwcQJnd2v4agOFMdRi9YpOVHDCcaoZx/om/Nla
	 druJi5bYPGfSKL3LzI4LBd8W2Zogw1z/OaaIihiqC/c7D4zcBtoJWeVY93GJZWf6W9
	 DmkrCFAq1uxR+Qutq5SGHgAEv8Ijwsjmm+JXtH4Z4nQns+68MjKF7d/Yp17U8YdTyb
	 yOUZaHpRBNJWA==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-446102c711bso68751661cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2024 12:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720034383; x=1720639183;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4AL8Q8t5GvaSDcDlTv2xvRzLk0BHc20eWebGxrnXzHw=;
        b=cMQAX2WaHNUHjVNby8KgbK/+yB/6eT90hplScghTb6S2nJL5uwr/SYnQVWVH85aaPM
         JQVJdet6N6O4gRFQxF1RKVFkQNnFYgEt92/IGZpFy+cuiNiufW581zvfgeSVGmUkY4qk
         ZvVwbm4ajd2JQME01NduuC/nK0lGKxuAC0zfBSESNLcZ5bAwoolGTK1IUH+dSAW4pEY9
         vFzEVxTwmV1yCAi3EnERZIPSs9f33NRNFGs279cwEerhpgCEV0l9MazCADr1mpKGAAZQ
         GoSgyIyDxfE9kC47wEkZ2co9prpE/zGWJdTMYRD8HByB+tR7ZFqoioeOHyyHo8/Bz3y6
         bQtw==
X-Forwarded-Encrypted: i=1; AJvYcCWqc4ft5woAZUWiMKB8zu7L9HmTNzdACx+MDXhmdtGy5NlZb9Nla0sS5NA5rwlQ1QJphLjhJYgWzCBGt6/Bbt+UOuteYu/+tTdaxA==
X-Gm-Message-State: AOJu0YwUn/mFLhSXOepBqENdfjA4M1WgKf2DDpd2+dljVUtNplL7OIKm
	hcmafmUK+UnHcSfp2PGuDrAqQd9ig00TiJzVvgo2KwVRgmgl5d9d69BQoY03IBrdSrIkT1iPUcX
	Q0Vsn5g3RqwgzcPuMY1aDUT6cPffnMCfbV5LFTK4qN5y97rJEZL8j/6eC8iOLBE9HwThln2x2B8
	85fwzyCW5i15yOO/TuT8Ix6Z1y6hKF/cxCOWB4O4J2yYj8er4Nog==
X-Received: by 2002:a05:622a:4c6:b0:441:58c7:92fb with SMTP id d75a77b69052e-44662e48d9fmr131261081cf.47.1720034382933;
        Wed, 03 Jul 2024 12:19:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGac9ZwuaiHgni0ADiKooLH8mMTml1Wkk3i3pPQYN7kaucLcuApVxgidfFEb5Qy7OVYNbEL6OKn20MHspRgJho=
X-Received: by 2002:a05:622a:4c6:b0:441:58c7:92fb with SMTP id
 d75a77b69052e-44662e48d9fmr131260881cf.47.1720034382502; Wed, 03 Jul 2024
 12:19:42 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jul 2024 12:19:41 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240703135303.GA56155-robh@kernel.org>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
 <20240103132852.298964-2-emil.renner.berthing@canonical.com>
 <20240115173657.GA999912-robh@kernel.org> <CAJM55Z9xF6_WCcg02xJJfu=UCOj=4m64BXvJTaV4vX09WLhc0w@mail.gmail.com>
 <20240703135303.GA56155-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 3 Jul 2024 12:19:41 -0700
Message-ID: <CAJM55Z-ntP55uaTQob_=P-8ud43YNh7Gy0XgUfQ7-O8zPpuGxg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
To: Rob Herring <robh@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Drew Fustini <dfustini@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Rob Herring wrote:
> On Fri, May 17, 2024 at 07:48:17AM -0500, Emil Renner Berthing wrote:
> > Rob Herring wrote:
> > > On Wed, Jan 03, 2024 at 02:28:38PM +0100, Emil Renner Berthing wrote:
> > > > Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.
> > > >
> > > > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > > ---
> > > >  .../pinctrl/thead,th1520-pinctrl.yaml         | 372 ++++++++++++++++++
> > > >  1 file changed, 372 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > > > new file mode 100644
> > > > index 000000000000..d3ad7a7cfdd1
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > > > @@ -0,0 +1,372 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: T-Head TH1520 SoC pin controller
> > > > +
> > > > +maintainers:
> > > > +  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > > +
> > > > +description: |
> > > > +  Pinmux and pinconf controller in the T-Head TH1520 RISC-V SoC.
> > > > +
> > > > +  The TH1520 has 3 groups of pads each controlled from different memory ranges.
> > > > +  Confusingly the memory ranges are named
> > > > +    PADCTRL_AOSYS  -> PAD Group 1
> > > > +    PADCTRL1_APSYS -> PAD Group 2
> > > > +    PADCTRL0_APSYS -> PAD Group 3
> > > > +
> > > > +  Each pad can be muxed individually to up to 6 different functions. For most
> > > > +  pads only a few of those 6 configurations are valid though, and a few pads in
> > > > +  group 1 does not support muxing at all.
> > > > +
> > > > +  Pinconf is fairly regular except for a few pads in group 1 that either can't
> > > > +  be configured or has some special functions. The rest have configurable drive
> > > > +  strength, input enable, schmitt trigger, slew rate, pull-up and pull-down in
> > > > +  addition to a special strong pull up.
> > > > +
> > > > +  Certain pads in group 1 can be muxed to AUDIO_PA0 - AUDIO_PA30 functions and
> > > > +  are then meant to be used by the audio co-processor. Each such pad can then
> > > > +  be further muxed to either audio GPIO or one of 4 functions such as UART, I2C
> > > > +  and I2S. If the audio pad is muxed to one of the 4 functions then pinconf is
> > > > +  also configured in different registers. All of this is done from a different
> > > > +  AUDIO_IOCTRL memory range and is left to the audio co-processor for now.
> > >
> > > It is still not clear to me if each instance is a different programming
> > > model or the same with just different connections. The latter should
> > > be the same compatible string. That needs to be answered in *this*
> > > patch, not a reply.
> >
> > Hi Rob,
> >
> > Sorry for the late response. I honestly don't know exactly what you mean by
> > differenty programming models and what the difference is, so I'll need a bit of
> > help with what you want me to write here.
>
> Is the register interface of each instance the same? Looks like it is
> from the driver. So normally that's 3 instances of the same compatible.
>
> > Any driver for the TH1520 SoC (not just Linux) would need some way to discern
> > between the 3 pin controllers so they know how many pins to control and what
> > pinmux settings are valid. Basically they'd need the data in the three
> > th1520_group{1,2,3}_pins arrays in the driver and a way to know which of them
> > to use.
> >
> > https://lore.kernel.org/linux-riscv/20240103132852.298964-3-emil.renner.berthing@canonical.com/
>
> Why do you need to know how many pins? The DT says configure a pin and
> you just configure it. It's not the kernel's job to validate that the DT
> is correct.
>
> Aren't the pin names globally unique? So you just look up the pin name
> across all the arrays. Or you can just look up one pin from each
> instance to find which th1520_groupN_pins array goes with the instance.
> Or just have 1 array.

Just to be clear, do you mean to add just one node for all 3 instances like
this?

padctrl: pinctrl@ffe7f3c000 {
    compatible = "thead,th1520-pinctrl";
    reg = <0xff 0xe7f3c000 0x0 0x1000>,
          <0xff 0xec007000 0x0 0x1000>,
          <0xff 0xfff4a000 0x0 0x2000>;
    reg-names = "group2", "group3", "group1";
    clocks = <&apb_clk>, <&apb_clk>, <&aonsys_clk>;
    clock-names = "group2", "group3", "group1";
};

That will work since we can then register all pins at the same time. But I
can't see how it will work when keeping the 3 different nodes since each
instance needs to register the pins they control at probe time. So there will
need to be some way to tell the 3 different nodes apart.

/Emil


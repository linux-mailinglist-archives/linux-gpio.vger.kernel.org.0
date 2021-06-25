Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FC53B3A0A
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jun 2021 02:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232933AbhFYAMm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 20:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233081AbhFYAMa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 20:12:30 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6988C061767
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jun 2021 17:10:09 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p7so13362060lfg.4
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jun 2021 17:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FNTTrJ3FL1iq3YniplXZ8119Emiw8hp3FUgBfyLOtsY=;
        b=H/gWxWmhKDTGjRX15XTwo2KDADDg2PfwLeK8QAkQyJmNyuli18P+1mAV6lo10NgW+y
         VPNgQmBidtxHzk1bciUp4km2D5CazJCt/SL3vWjLfdaXvJzxdJF2c4PhoyuvQCxOl4tF
         KHhJXfveAViSCT4QZ6IH6n2KCo0MwAKTJD5uByEFEoi+heEJi9+R4v44lNRxE9hv+8yx
         uh0aMKqEBItpBCuLvmKqzUT8DCqEypJSLjGaUEIQgjyaDVfWYcazrjn2uDN0vLp0WRdg
         jynSvZhtlLomKu7cFBoX/D11D+s0FCTlyPJiVbsDYM4dHFTXWgrCCPfI8EIVLqWYuT7E
         yztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FNTTrJ3FL1iq3YniplXZ8119Emiw8hp3FUgBfyLOtsY=;
        b=szx6lJa9t25T2YtZqu0ShQ6sEO+r8e23waHIqX7OZX39Q3Ej2khCcf/qRZNEFG9YiE
         hKxLflclkk1gglMGkexbyySMMDarKi0BFZAuxs8VqosyTlTat0cS04CAAwXUGXu4dtAE
         GT2DEJ7yHcroL6PGMd2+B7rZzi+s535rbQsx1igOJrR5zirEAiWimw93o1zuPvZLNvwH
         9YD3qPdeyMTx4MNNiSlPfABmiVWwhJlI2ne58rAyJx83Fgub/noJfWzGF17PsTPv3NsT
         agtmJX/S6zfYLWNnD61FlIjqn1akpcRoJA0z5PsGz5nWW+nA89S2plEhDEFomKGMnssb
         t6Ag==
X-Gm-Message-State: AOAM533V1jtG+foT7FLJOf8Ceppz+ypFzw9+jh7LuHGJQ0Qnz9pd3j4a
        JVtROR1O7JJjuGaZw9HtNvhnBS6Mfme8MOZZbQSCTA==
X-Google-Smtp-Source: ABdhPJzhpdZ+qRb8l4M1S8NIRcHZuamvKemb8/lfE8nfui9Lb+u/kx6k4mY8D8H38j6ZEeiQ6LWsZQZbCm6ko+gfuM0=
X-Received: by 2002:a05:6512:3f08:: with SMTP id y8mr5640261lfa.649.1624579808001;
 Thu, 24 Jun 2021 17:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210622115604.GA25503@lpieralisi> <20210622121649.ouiaecdvwutgdyy5@pali>
 <18a104a9-2cb8-7535-a5b2-f5f049adff47@lucaceresoli.net> <4d4c0d4d-41b4-4756-5189-bffa15f88406@ti.com>
 <20210622205220.ypu22tuxhpdn2jwz@pali> <2873969e-ac56-a41f-0cc9-38e387542aa1@lucaceresoli.net>
 <20210622211901.ikulpy32d6qlr4yw@pali> <588741e4-b085-8ae2-3311-27037c040a57@lucaceresoli.net>
 <20210622222328.3lfgkrhsdy6izedv@pali> <CACRpkdai2cvoNFR8yH2MHP+R27nQm1HZNK4-mJ50mE7DHrBmXw@mail.gmail.com>
 <20210624233448.ouvczfbogmtnbrye@pali>
In-Reply-To: <20210624233448.ouvczfbogmtnbrye@pali>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 25 Jun 2021 02:09:56 +0200
Message-ID: <CACRpkdZyMr-8Qmf3S7R+RcWe5shhnMeBoEsJoQdREimpB-xw+g@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dra7xx: Fix reset behaviour
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-pci <linux-pci@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 25, 2021 at 1:34 AM Pali Roh=C3=A1r <pali@kernel.org> wrote:

> > gpiod_set_value(gpiod, 1) =3D=3D assert the line
> > gpiod_set_value(gpiod, 0) =3D=3D de-assert the line
>
> Problem is that some pci controller drivers (e.g. pci-j721e.c or
> pcie-rockchip-host.c) expects that gpiod_set_value_cansleep(gpiod, 1)
> de-asserts the line and it is already used in this way.
>
> Which is opposite of the behavior which you wrote above.

I sketched a way out of the problem using a quirk in
gpiolib in another response. We have a few of these
cases where we have to code our way out of mistakes,
such things happen.

The problem is common, and due to the fact that device tree
authors ignores the flag GPIO_ACTIVE_HIGH (which has
been around since the early days of device tree on PowerPC)
instead they opt to do the inversion in code. Which violates the
contract that the DT should describe the hardware.

The ambition of the DT specifications/schemas are to be operating
system independent, and this kind of stuff creates a situation
where other operating systems can't use the specification without
also going and looking at how Linux has implemented stuff.
Which is against the ambition of the device tree work.

> I would suggest to define enum/macro with word ASSERT and DEASSERT in
> its name instead of just true/false boolean or 0/1 int.
>
> In case of this PERST# misunderstanding, having assert/deassert in name
> should really help.

Hm that looks useful, Bart &co what do you think?

#define GPIOD_ASSERTED 1
#define GPIOD_DEASSERTED 0

in consumer.h, would that be helpful for users?

Yours,
Linus Walleij

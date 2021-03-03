Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD01732C7FD
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233856AbhCDAdV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:33:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241597AbhCCQZ0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 11:25:26 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A49C06175F;
        Wed,  3 Mar 2021 08:23:23 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id m1so6900850wml.2;
        Wed, 03 Mar 2021 08:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=0rnULfJA+dYkhzmaotW5cjGQwlA6v+gAKaZV3ZR+x3k=;
        b=cgxPBvWJIqEXf2Us8oeryoY9S0BtbIfK0ujDM0ov1KuQ2B7smEuDfeKA1vmqEgXuaI
         l7a9bfW+mAY1ldg+9vN4QmZDDHaKT9pWprGPANBmotUkfSlTtIg7doQ8dC1sjNrRcZMI
         Dt0esyI5GZucPenCoZszXf8KOWoaGgzIDtY0k5rdfjYuoqDXaPfC4PkVbxorqxQ6c/7X
         VGgmRVDUiYSD4JmdX692zI3auwtH1uwDl3wVLUaQoY74OEp1awbHUr+rIwZO0A5YScek
         s9lvE7Y8ihcQb/nVLQohNGwVjOKVTKqkw5cI6Aqip8YGnIqjawRucNtUnbtgT8RiVQCh
         wtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=0rnULfJA+dYkhzmaotW5cjGQwlA6v+gAKaZV3ZR+x3k=;
        b=cVs8gPu1+zqugHt+lY7s6wP++MInv3IzPIx+o/bHHR/Y0S1nxNB6Qi2vNO4F/7Ug6X
         ZMcJJhWUmjqq40eRmrA/MheJSpgYZDHAymq7qtr3uldS0mtMCvVhMM+IMNCLCV34teV5
         fRiIXFPtOmjAJ1lRkHhA8bjsb7lRmBRWjj5jim3Em3O6TVak09uIsfRdT7WbuD+D4NWC
         0mjzgE81E+Fngf/c8Q8i8apmBOchBUraFtz+4O0iQwYkaQ9gnTNoYeajAGgeA35ZoiCE
         JLJVlW4BXvmpiVbB6PXpU/fk44ogq0hQxebuZljwwsRZrOB/Iu8pAAj5gN+NQREdaSFx
         nU7w==
X-Gm-Message-State: AOAM530D6lrYXPR54zZWTGx5IkEGmHb49UmFCk1UYzpFMLJGPC8Hx1iU
        fRfTlTXhOHNURrye80RSYGM=
X-Google-Smtp-Source: ABdhPJwyElgMdoeajhuX8+SusPE3j4+qg9nI1cOEAOZrhiOnZthD6B5B8i2EjrA0QvPHChek6gos9A==
X-Received: by 2002:a1c:7312:: with SMTP id d18mr9689530wmb.155.1614788602097;
        Wed, 03 Mar 2021 08:23:22 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id n6sm8575079wmd.27.2021.03.03.08.23.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Mar 2021 08:23:21 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v3 00/14] pinctrl: add BCM63XX pincontrol support
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CACRpkdbi77SBsssMOnx43fP9RgqnzkUUw=TXaE2_LDexpE2WEg@mail.gmail.com>
Date:   Wed, 3 Mar 2021 17:23:20 +0100
Cc:     Rob Herring <robh+dt@kernel.org>, Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D875EBA4-F881-4F1E-A251-78CEF8E6A40B@gmail.com>
References: <20210303142310.6371-1-noltari@gmail.com>
 <CACRpkdbi77SBsssMOnx43fP9RgqnzkUUw=TXaE2_LDexpE2WEg@mail.gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

> El 3 mar 2021, a las 16:29, Linus Walleij <linus.walleij@linaro.org> =
escribi=C3=B3:
>=20
> On Wed, Mar 3, 2021 at 3:23 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>=20
>> v3: introduce new files for shared code and add more changes =
suggested by
>> Linus Walleij. Also add a new patch needed for properly parsing =
gpio-ranges.
>=20
> This looks very appetizing, I am ready to merge this once we cut some
> slack for DT review (a week or two).
>=20
> I'd like to merge it soon so you can start working on the IRQ add-on.
>=20
> I'd probably drop the IRQ-related selects from Kconfig
> when applying though (no big deal, no need to resend over that).

About that, it seems that GPIO_REGMAP should select GPIOLIB_IRQCHIP, =
since I couldn=E2=80=99t build the kernel due to the following error =
when I removed the IRQ-related selects:
  LD      vmlinux.o
  MODPOST vmlinux.symvers
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  LD      .tmp_vmlinux.kallsyms1
mips-linux-gnu-ld: drivers/gpio/gpio-regmap.o: in function =
`gpio_regmap_register':
gpio-regmap.c:(.text+0x704): undefined reference to =
`gpiochip_irqchip_add_domain'
make: *** [Makefile:1197: vmlinux] Error 1

Or maybe we could guard these lines of gpio-regmap.c with #ifdef =
GPIOLIB_IRQCHIP:
=
https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36dba37=
0f797/drivers/gpio/gpio-regmap.c#L282-L286

>=20
> Yours,
> Linus Walleij

Best regards,
=C3=81lvaro.=

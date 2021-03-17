Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1380C33EF68
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 12:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbhCQLV0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 07:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbhCQLVC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 07:21:02 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F3EC06174A;
        Wed, 17 Mar 2021 04:21:01 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id d8-20020a1c1d080000b029010f15546281so834063wmd.4;
        Wed, 17 Mar 2021 04:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=AKjOGXniI+OXQ90zBB2BndXhxeXvEdpt5ILolyKhHTY=;
        b=XHRqAU4zOE/7ec5SiVJVl+13z6tpEoniB8OW21yF2f4Jg57tcq32Ze8bdFkEubknMG
         UwSPuJABOCwEzZZDyMeATX5nBoWL5pzZhNAd6L3eYeIkyeVbBUYObOuF2l3wmO63r86/
         FO8rVZcJvhQzezHsI5Mz2jrVJM9NakqYAZil8Dtg8WUVUt3RIwL6aCCa6jbyZADfxYWX
         GtVPNGPcLS59g2LVwsyIq/ubEg4pbNuBfoPeL+b7Opr/Trdh5C5F5+Mt6B1ESy/FQVlM
         74bDSyG3fkkVJhqbq+3r9O3yXpJHR5mwwYEEPBh/AdVd2st06tin8UtdtfZYa+k73bHr
         R6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=AKjOGXniI+OXQ90zBB2BndXhxeXvEdpt5ILolyKhHTY=;
        b=f3komUyzqJLLvBLGE98NryODU0VTyDvUBN8Da5UiBPd9l8ykKjguiD0qO+Z3ZsqGxn
         d6Sp+g7vgILR7ZeXL4pAlLLxPJcxaFvJXPiNL1Dd1FepeTaIbxH/+ZbhHvvlykRpz2T5
         +7cJRF8PtgGj5gp/ykMKLY/s3aRR3qX3ebCRvaoa4ujX4wiYftkAk5rP0EcJDAHnkJY4
         3AYPbtGILRYffL8SW139xmzrg7aGhl2P85jfgCO65vgorUQwhmbbMohqL9JNT2/g3Fgt
         vaBl2hK62lsg3un/Fx+GGtTkNScUIbr8FvHaHuDvhd4+PDTqZa5qoJh4kKO7iy7V7DNk
         nj9g==
X-Gm-Message-State: AOAM5313GjMSObtfWdoMxfguKhFt4+GkSf9elgEMZtimqVGaLDqFSiVY
        oOrlphA21+YYbdaC55tr4Oo=
X-Google-Smtp-Source: ABdhPJyta8Pia6FUESAItxEIo/cKMe17seGwES4kGNURT5i9U9ADtXlXWtuLjDrBpk3HA7yJKIxJ0A==
X-Received: by 2002:a05:600c:224e:: with SMTP id a14mr3193108wmm.57.1615980058790;
        Wed, 17 Mar 2021 04:20:58 -0700 (PDT)
Received: from macbook-pro-alvaro.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id j4sm2098576wmo.10.2021.03.17.04.20.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Mar 2021 04:20:58 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v7 00/22] pinctrl: add BCM63XX pincontrol support
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CACRpkdYdHgP7QNWco4aN1G-GaRjOd2Y=_fkxv4zOKsQtXtpqfg@mail.gmail.com>
Date:   Wed, 17 Mar 2021 12:20:56 +0100
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <34672AEE-B28E-4B07-BFDA-8DF2F20FD410@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
 <CACRpkdYdHgP7QNWco4aN1G-GaRjOd2Y=_fkxv4zOKsQtXtpqfg@mail.gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

> El 16 mar 2021, a las 11:13, Linus Walleij <linus.walleij@linaro.org> =
escribi=C3=B3:
>=20
> On Mon, Mar 15, 2021 at 12:42 PM =C3=81lvaro Fern=C3=A1ndez Rojas
> <noltari@gmail.com> wrote:
>=20
>> v7: introduce changes suggested by Rob Herring.
>=20
> If Rob is happy with the bindings like this (GPIO as parallel node =
rathern
> than subnode) I am ready to merge this.

I appreciate that, but I=E2=80=99m having a hard time in understanding =
what Rob wants and since there are no examples available on most of the =
stuff he=E2=80=99s requesting this is really frustrating...

>=20
> As long as the bindings are OK I am pretty sure any remaining nits can
> be fixed in-tree.
>=20
> Yours,
> Linus Walleij

Best regards,
=C3=81lvaro.=

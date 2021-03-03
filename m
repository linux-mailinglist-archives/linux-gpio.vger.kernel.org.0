Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD5532BB4F
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 22:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237189AbhCCMVy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 07:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1843031AbhCCKYg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 05:24:36 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D24C035438;
        Wed,  3 Mar 2021 01:32:04 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id w11so22845558wrr.10;
        Wed, 03 Mar 2021 01:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=UKH6JyNVGycrje635cm8/24AFBzoSarHf1U+e9Q+8Ts=;
        b=aGGAUotLv4VqjycU5qpz5qXFjmjWfmlMEREwAEO1Dehpv6eXNl5IQuC2YOfXja3nCt
         tuuJeFDypcPv/N9yLQkkv69RwZHY3lppJaJ/hofGtsUVlLHj4QrjIOp68IqLNsdPcELy
         9E1lP9XfmEGd2+EDlL2OShmJb+/CeF537M0cdJ82rDR5mqp4EP+93kMpwr0xA7Z3v8qT
         UXgYeoOjJHnAcMcgbpDYokCSwQ2/9BT1R0S412rd4pJq63mXJBYjLX9BocCC3azE5eyU
         IEPiMatp3dKZhwl0aYRBvxlj2bbfKAn2AH8B63KBNWY81POEhNa4yEaDI0tAOZ0VVSdl
         X99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=UKH6JyNVGycrje635cm8/24AFBzoSarHf1U+e9Q+8Ts=;
        b=WvkzV+8lu03B0vBcdAr7fxyf8BEwDVoTvJtbfwfEHuYuAr3tvY87Y28WEdBh5kz7ra
         73XUrrcx2dht1tHyzgNvbK7Y96fOocKol43feZrf7ZtgpdTRzs9jsK4pQT/WTqWunwKA
         EDaoB5KPCXYIEIhfx/Wowns2V8/cz5iKrdNsixQTuKG6qtMySP2QeAAMSNcZbkontg6x
         Qe1EIajOVRE99JcO7/UKOQv51MfPZRGZ5slph70btI6zu+4aptFENgQ8M9JhBmU6anxW
         0KZwMBppY1Zd2D829ZOFvoJs97rRxTmEmPsLrGcN6AXV9ud3geQt94vHF0q0cqBEs4rm
         Bm5g==
X-Gm-Message-State: AOAM530vAETTTOaQowi1sQxbPTWzX01wv+aTH+dGUkIumQsg40Ycjf2f
        UFMSRR8Gnar8UiYSnLQWzcw=
X-Google-Smtp-Source: ABdhPJw4+XfbVZwH3cNB0g9yh1a/RXbhCsHP024nurdnI5Ltn2OZODJhZunn9lJpDOCosVyxuLjTAQ==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr17265889wrp.118.1614763923363;
        Wed, 03 Mar 2021 01:32:03 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id z7sm3616216wrt.70.2021.03.03.01.32.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Mar 2021 01:32:03 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2 00/12] pinctrl: add BCM63XX pincontrol support
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CACRpkdZQRtTi75KMFDpM6eJ9hVuPLNJBBs6bHKMt7_PNW8gcFQ@mail.gmail.com>
Date:   Wed, 3 Mar 2021 10:32:01 +0100
Cc:     Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3A67CEC5-C025-40F2-A0CE-0EFA10337E5A@gmail.com>
References: <20210302191613.29476-1-noltari@gmail.com>
 <CACRpkdZQRtTi75KMFDpM6eJ9hVuPLNJBBs6bHKMt7_PNW8gcFQ@mail.gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

> El 3 mar 2021, a las 10:29, Linus Walleij <linus.walleij@linaro.org> =
escribi=C3=B3:
>=20
> On Tue, Mar 2, 2021 at 8:16 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>=20
>> v2: introduce changes suggested by Linus Walleij and remove =
interrupts
>> - In order to use GPIO_REGMAP, the need to get gpio_chip from =
gpio_regmap
>> and use it for pinctrl_add_gpio_range() and =
gpio_chip.direction_input()
>> and gpio_chip.direction_output().
>=20
> Looking so much better don't you think? :)

Yeah :)

>=20
> If you also get rid of the exposed struct using DT gpio-ranges we are
> done I think, just need some DT review slack for the DT maintainers
> for the bindings.

I=E2=80=99m already preparing v3 series, introducing shared base code =
and simplifying everything :).

>=20
> Yours,
> Linus Walleij

Best regards,
=C3=81lvaro.=

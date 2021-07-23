Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE42C3D3B62
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 15:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235314AbhGWNF7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 09:05:59 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:34077 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235243AbhGWNF6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 09:05:58 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N7AEs-1l1fkw2VZM-017TAH; Fri, 23 Jul 2021 15:46:30 +0200
Received: by mail-wm1-f53.google.com with SMTP id j6-20020a05600c1906b029023e8d74d693so1649695wmq.3;
        Fri, 23 Jul 2021 06:46:30 -0700 (PDT)
X-Gm-Message-State: AOAM53176BGyy0OWAenUdEDF0gmmvu1UqqAzbEw5Aatu0UjeTJQloMJc
        Lg/kGKqd5ih3pTt5gBol3Ac57E9lyA+KmogbeBM=
X-Google-Smtp-Source: ABdhPJyfbJ/TTAuOw7j89Wul0Xg+2CYe0Hm+3Y35Empz4DlbpbFzr1NRRDGERsVfUMwmu0uZ4yYDMTYgM127TEzwEVk=
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr14345036wmk.84.1627047990248;
 Fri, 23 Jul 2021 06:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 23 Jul 2021 15:46:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1ax29ThCG867phtx1Xb12GgiJFcLDd8H9VLbsJQ1uoAw@mail.gmail.com>
Message-ID: <CAK8P3a1ax29ThCG867phtx1Xb12GgiJFcLDd8H9VLbsJQ1uoAw@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add STM32MP13 SoCs and discovery board support
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:/IYV4zP0nWsjHpTv3UBJIm4gesWafe7QOTye4w1rD945/TXM8/g
 8Q+SRjbfkrVbSKvikHvoqtehTd84cQx5IwqW9KEM/wGSSbkWyVEYXbhKzWfcyrJaO+OKs1x
 pNQ/uw17qpS7x4gqJqL8b2v+dIXAfvMoSratPfwFw+GRHuVqRS9gWynsv5IX7W3eg4uzFiu
 LpKW1hGCA85ESL3uvhI2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EfR3PoU4teQ=:m2wGIB5uFzC3E6SakfCPm6
 zvQwbWy3jU2Z1QKngVoi7clKwI51Wo7vlnRc5juVQ2rdpBeTNbXU4/q0hQzq6jA2KH/KZm2rV
 3bqRdhCHGGKOITjGKw1ZAFH/ueOPd/m7L0gdK+nLgVPKGTf9kdmEBSWE4hYjn4hexCDRq2MME
 1BP+fl3qXnk2D52YPVbkh2ZyLpUa5RmoanQdXPhBhWfomVExkJEBtTvKM5F42UZmBsyvQJiwT
 cW6OkGsu9pIp9MOrfg3Ln7HZnOYVxKiKNvc+rJdFcP8RND8t5T4qKnUexG/9l0n2eMJII9uZ/
 AcFh/bt9Hsl88qLG9e3N9eCyN4qdVehWvQW9i4ALzbgR0/tmuWsURuyj08ahV4C0gmzU8Ey8x
 NVnRydpFQjZ+chBu4kzFNVK5ogbMG7eFcdJSt+Mh4vJujntHlGeiIZvkU0Ib2b3dVsrx2TGDd
 b7vxjs+akXT5kfOTvCmcJOVKA4NnLkw9/JFdo7AGFlQtEQNbuYtwvHMbMTT53N7F7vHZKlyW3
 deRg8r24IQrpR2hDp92F76zrWtLRCz8vteWKhIKjr1I2jOt4YJtMugk2CIERh95gYG+ibscqe
 wBJxK3/pd/KOJ6LV1I9ebWMy8IWTJiNDxv5sgYKimPhQvX/Y05UypKhxGINq/ueNS6JGjBaKr
 LQlr/66o7aWb0/TzgiXoc3GJLVcMbJulYUSr7ibUwxAvPQRhGBiAgtNkR2lsu4prNB4+xJhcd
 9ySk/TsPhh9umIFpQl2wEUnOvh6sl7YQrF3qIuNpeToHFgM03uilJYp3l+1tBu+J7SMORhKHw
 S3zrLS7/VKXMh2IqokDc428Y6w0XwfjdFv2hK0ZZtD89rd7+FvcB0ko60FHsdr5VcXkg234
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 23, 2021 at 3:28 PM Alexandre Torgue
<alexandre.torgue@foss.st.com> wrote:
>
> This series enhance the STM32 MPU family by adding STM32MP13 SoCs support.
> It adds machine support and device tree diversity to support the whole
> stm32mp13 family (STM32MP131/STM32MP133/STM32MP135, plus security feature
> diversity).
>
> Basically STM32MP13 SoCs embeds one Cortex A7, storage (SD/MMC/SDIO, QSPI FMC),
> network (ETH, CAN), display (DCMIPP, LTDC, ...), audio(SAI, DFSDM, SPDIFRX),
> com (USB EHCI/OHCI, USB OTG, I2C, SPI/I2S, U(S)ART).
>
> This series also adds STM32MP135F Discovery board support (stm32mp135f-dk). It
> embeds a STM32MP135f SOC with 512 MB of DDR3. Several connections are available
> on this board:
>  - 4*USB2.0, 1*USB2.0 typeC DRD, SDcard, 2*RJ45, HDMI, Combo Wifi/BT, ...
>
> Only SD card, uart4 (console) and watchdog IPs are enabled in this commit.
>
> Note that file stm32mp135.dtsi doesn't define nodes but I add it now to ease adding
> of new nodes in a (close) future.

I had a brief look and it seems all fine to me, nice work!

The only (very minor) thing I noticed is that the crypto engine device node
has an unusual name 'cryp@' instead of the usual 'crypto@', but this is already
the case on stm32mp157.

With this changed,

Acked-by: Arnd Bergmann <arnd@arndb.de

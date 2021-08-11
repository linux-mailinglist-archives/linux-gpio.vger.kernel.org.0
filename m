Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C563E92FA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 15:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbhHKNrI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 09:47:08 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:44317 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbhHKNrG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 09:47:06 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N4i3j-1nDVou3Hyp-011iWG; Wed, 11 Aug 2021 15:46:39 +0200
Received: by mail-wm1-f41.google.com with SMTP id 203-20020a1c00d40000b02902e6a4e244e4so2026325wma.4;
        Wed, 11 Aug 2021 06:46:39 -0700 (PDT)
X-Gm-Message-State: AOAM531jQKlZl5JpWc7EyG8xhf8ovkJ04pR1+KbJEDT5MMPR5aKHxDrk
        27orYS2+URH1E4IkGaCQ2W2uk7gH5AlO68S2qko=
X-Google-Smtp-Source: ABdhPJzeHDd0FHBmfbs2ZDN/qKdPw/326OoOVEunTVNFojrgSBiRxcFRkHpVRPVIq6jZ54rermFnJzWU+XJ7JpAf3Wg=
X-Received: by 2002:a05:600c:3b08:: with SMTP id m8mr10139690wms.84.1628689599369;
 Wed, 11 Aug 2021 06:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210805174219.3000667-1-piyush.mehta@xilinx.com>
 <20210805174219.3000667-2-piyush.mehta@xilinx.com> <CACRpkdYo5e7uTJJRqnK1R4QLtUzRGNbsvNvm-47UFZOr4_R9Cw@mail.gmail.com>
In-Reply-To: <CACRpkdYo5e7uTJJRqnK1R4QLtUzRGNbsvNvm-47UFZOr4_R9Cw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 11 Aug 2021 15:46:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3ZdZSdiX6_AeSW4qSFhUp+wKrUe6S5z5bKDtcU068sjQ@mail.gmail.com>
Message-ID: <CAK8P3a3ZdZSdiX6_AeSW4qSFhUp+wKrUe6S5z5bKDtcU068sjQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] firmware: zynqmp: Add MMIO read and write support
 for PS_MODE pin
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Piyush Mehta <piyush.mehta@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>, Zou Wei <zou_wei@huawei.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Michal Simek <michal.simek@xilinx.com>, wendy.liang@xilinx.com,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, git <git@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:kzrHtECqBV9bGkTAErGbe1Ac/LDvSkXZRJAkQSl2LTdHw9dZGjL
 gLj4EqBwKcVu982Kus4skiECAZ58Dp6OrbIwH3koV7/eol5QUkx6Vsz324agwXsCGDodkXO
 csd6sB0ivJRanu7JWZELdnkmpncBHyueQvf1dxt9zZ3OQ5bFbsvhFmBjoTfQvCZEm8EY98q
 gD1fXt0FIF5XMtxLGMKMQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:a33CKD5cniU=:A9HLAxdrNpUz9ARLA5dO0l
 otDG4mlznSQJO2uZtp2s/jSI+pbJs7VvbAm7QvV5zwX3sE5K5DO4rzpJER/FXq2p6ru5HXjRj
 r27oZj5FfN/4xOgkJUOzdD4A1z9jH56CwhuKforrkgA/cM7YFaQIRN5ZAOO1Ts9CVEqdr2G61
 3bxjbfN4JKM53KlPVbUIJbatryzShUrL9cq2hn501f+Y1rIqbFJnw2bxZ++Y+baFaW8wL9BeU
 LBg5vyF5CV2uLpVlwSQmzmhnbVo6cVOAyYghlea5MFK41D8gFXVrbNLc8Jg104aYIOBlhi4vA
 GgTTEunThGtZlEQ6tVayFVAYsA5LUc/nNuvWFWsFmfNYRKeV4q5tGaSXmeegmkBnSmhuutU2s
 6fLQE66BhGOKgUo7U2vOD/6rL+wS5y1bjEsLP5UbqbkSytHZgseY1R8YrwIcKuQ0a6ku6C2Jz
 BkCar8l2/WxzfenV4/dtRox5Q1YPM1gPW+EjDufP7pJv3ACX+0TkhTG8lDOIs3vbI+RdACfOy
 lHYDURafyNTMO+zuC54OvKPY+yu/9Y6DO+DfCU9hiAvovSPe6y2whfd/u6TkIZoP1YukSu7od
 ZkogpY6feM3IRo9bzJdNagtpgGIgSsyI791xQiPJVCvafBDrR9AhcVV+CMdMij/itjbHgFIV/
 J0fOJp5XfEjL0fVrEczQsD8dODuyU3zFxuKVYtFofRc5dcOThDU5uqUoz/r3vQHJoJe5ro1kF
 rt3OCl3AY2GYT6leLxVPNC/k4deJsy3PYHOjYiNlUrGE070y7a53YY8/hZFnnVOJG4eu37zQm
 O0Y135iRV5FVgDFpjolnVL2aPAZZKRn+1tFyhKmcrObPY/Y2wkMaFSDcUyujeqodZOEAkfWSb
 MPGVebX1soeBl6UKMP6w9b72Fx8H/FfUutG9D7ZyKxvFUXbLVTMWiecLlei+14OmBzo0aqiKu
 XUlfJhniFZLsxM+hFBtIeETd/xEfG/HWc+Xr/8CzRSW1aV6d63u2g
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 11, 2021 at 3:08 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Aug 5, 2021 at 7:42 PM Piyush Mehta <piyush.mehta@xilinx.com> wrote:
>
> > Add Xilinx ZynqMP firmware MMIO APIs support to set and get PS_MODE
> > pins value and status. These APIs create an interface path between
> > mode pin controller driver and low-level API to access GPIO pins.
> >
> > Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
> > ---
> > Changes in v2:
> > - Added Xilinx ZynqMP firmware MMIO API support to set and get pin
> >   value and status.
>
> I doubt this is "GPIO".
> General Purpose? I think not. It seems to be about boot mode.

Agreed.

> If you need a userspace ABI, then add sysfs files to this firmware
> driver instead of bridging it to the GPIO subsystem.

I don't really want custom user interfaces in firmware drivers either.

What is the high-level description of the 'PS_MODE' here? Is
this perhaps something we already have a user interface for?

       Arnd

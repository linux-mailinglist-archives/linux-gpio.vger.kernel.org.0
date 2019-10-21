Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 146BBDF0C2
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 17:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728920AbfJUPEx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 11:04:53 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:38444 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbfJUPEx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 11:04:53 -0400
Received: by mail-io1-f66.google.com with SMTP id u8so16286178iom.5
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2019 08:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tWhc5uJs7MS/OG9cE4Cx7yK7L1yYTVuLaTuL5bFFTEk=;
        b=xhngFmRQQM1D4pq9bIoMfnS+5fCAmX6gmyeEmFG0ukm7A7X0Mje5muv4Cv+HO0X3bx
         jJXPVKEIDEe6ncTL0EP1ySuuHhrcDkueCwaJeAfTxOizLMwsd/lcBjMM2tRAtmO+XU6L
         Kxs9a51GuYICueb/prnKL3irvHY/Oep5zyBDgTE8hJXOT9LKJj7RU3FeoJ8r6miomECA
         cKhvvKHTcbBvaC/SPe6eRJUq347iOvczH/2CWTMkX7ZkORrw+6iE6Sc1q/NXgP4e1YLr
         jFwwB8iLe+zBTK3brgT8rnJcQhJrBvxbU9krMWtmEedSGWLFa6iT5eQaY7DrZvE0HL/g
         6J4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tWhc5uJs7MS/OG9cE4Cx7yK7L1yYTVuLaTuL5bFFTEk=;
        b=LhN1jHRmuKmDkwlciQiA2p1unBh+p6U7t2a+BBqc+T/S2ptKIihoHO7sPIdfmgtaKk
         8I+bKrbDWqbso0+VpjT7EQUTPF+ktRFPlWvVZvz+cx/U9fve7p7SNDVMpMaP7npFh/az
         yhPOgRBpzqiNBPDNK5eo5jBzGF41WHGvFjBRbPjFA/84IbBmORyCbx8CZhma5C4M1a7L
         Aw7IXFFzVZyMJ767NjcWi+79Hissqpou/d5LzxU1nb9aP6PswRK8KIYIUQXm4wQN4SWD
         XZd3QJFPyu4WxjJjezGmJ9uXhPGAkB92F2PuBhKR5K6nOm3pC8RcMPK2OGALZDqwhCUF
         Hzig==
X-Gm-Message-State: APjAAAV5v/6YpsFO0xDoDmrYzUOZcSNkej3F3ybjPFC/NIsbrXXBUm26
        50yihq2vdIZ/uoOaRLwQ39WwW6zJswNbFbweH/MbxQ==
X-Google-Smtp-Source: APXvYqyZtkP6PxsU3UaMQpu8AZwU/DkiQJeu4K/7glTT1ZkinSdT651Fwq7T77GW8oGg2nJltTvYwYQlVaCp648B1hU=
X-Received: by 2002:a05:6602:10f:: with SMTP id s15mr11394239iot.220.1571670290816;
 Mon, 21 Oct 2019 08:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191006053916.8849-1-brgl@bgdev.pl>
In-Reply-To: <20191006053916.8849-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 21 Oct 2019 17:04:39 +0200
Message-ID: <CAMRc=Me3Q=67fCDrFM38LAGXCd+apJybLYVfyrfwmwYa5L1CmQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] drivers: add new variants of devm_platform_ioremap_resource()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

niedz., 6 pa=C5=BA 2019 o 07:39 Bartosz Golaszewski <brgl@bgdev.pl> napisa=
=C5=82(a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> The new devm_platform_ioremap_resource() helper has now been widely
> adopted and used in many drivers. Users of the write-combined ioremap()
> variants could benefit from the same code shrinkage. This series provides
> a write-combined version of devm_platform_ioremap_resource() and uses it =
in a
> relevant driver with the assumption that - just like was the case
> previously - a coccinelle script will be developed to ease the transition
> for others.
>
> There are also users of platform_get_resource_byname() who call
> devm_ioremap_resource() next, so provide another variant that they can us=
e
> together with two examples.
>
> v1 -> v2:
> - dropped everything related to nocache ioremap as this is going away
>
> v2 -> v3:
> - don't call platform_get_resource() as an argument of devm_ioremap_resou=
rce(),
>   it actually decreases readability
> - add devm_platform_ioremap_resource_byname() as another variant
>
> Bartosz Golaszewski (8):
>   Documentation: devres: add missing entry for
>     devm_platform_ioremap_resource()
>   lib: devres: prepare devm_ioremap_resource() for more variants
>   lib: devres: provide devm_ioremap_resource_wc()
>   drivers: platform: provide devm_platform_ioremap_resource_wc()
>   misc: sram: use devm_platform_ioremap_resource_wc()
>   drivers: provide devm_platform_ioremap_resource_byname()
>   gpio: mvebu: use devm_platform_ioremap_resource_byname()
>   gpio: tegra186: use devm_platform_ioremap_resource_byname()
>
>  .../driver-api/driver-model/devres.rst        |  4 ++
>  drivers/base/platform.c                       | 39 +++++++++++-
>  drivers/gpio/gpio-mvebu.c                     | 19 +++---
>  drivers/gpio/gpio-tegra186.c                  |  4 +-
>  drivers/misc/sram.c                           | 28 +++------
>  include/linux/device.h                        |  2 +
>  include/linux/platform_device.h               |  6 ++
>  lib/devres.c                                  | 62 +++++++++++++------
>  8 files changed, 108 insertions(+), 56 deletions(-)
>
> --
> 2.23.0
>

Greg, Arnd,

gentle ping for this. I noticed that some maintainers are complaining
about being spammed with patches converting old drivers to using
devm_platform_ioremap_resource() and there's even a patch removing the
relevant coccinelle script on the list, but I think for new drivers
these are still useful. Do you want to pick them up for v5.5 (or at
all)?

Bart

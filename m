Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10466438C55
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 00:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhJXWYa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 18:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhJXWY3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 18:24:29 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C726BC061745;
        Sun, 24 Oct 2021 15:21:59 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id y10so10061144qkp.9;
        Sun, 24 Oct 2021 15:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9ncurX3TaX2r+KRIahQhViZWdSQLGqym5eYqOGdMFmY=;
        b=dy/qQaSfalOC797IGCHjeiHIGgOIKYRtzs+71nz8jiWATJK/JtNHcnKC2GszBndsRz
         DxCJWVUAEE/Jeu0XM2ZWTFjWCb6fBbhGsUrxqnR6vtUhzQ5oOOXYdR8Ryy9zpYxVlrr/
         GLVRyy6V1NMR6FkqjlbZqJnPHRrYkiiW6K+3m3vKkw+58uBQKQN7i2Y3+lT3pRYWNkGG
         t+NphDwcGy9h2FcTf+uuN8s64sn00pVbe4dopWeSwQy7gHRYLZifrc+kDzH1rJMIbrEu
         f+cd0BQpCmBOCzqk8GRUlLzVCj83HbHK+dA6hqJzZi/XjeaOw6jT2WSUxKjwrVzIe0z3
         pGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9ncurX3TaX2r+KRIahQhViZWdSQLGqym5eYqOGdMFmY=;
        b=B/Ub8itLV2ngdGWeIp9ZktLFXHUz5aIGM3kGzcUnYRjh5C+OTiNNsrM4Kj7Rjm+Pky
         gUYGW8jiAi6t+NayMvDn/8tBG9WWrA8Ao78OTJprnNvWm1ZAvjkafMqFtANGTLip/q/l
         yBIvegyY9+fGPRVUxhvkIj25BcHgnJusQhsrJf4zUcaGt0Amp7SLWRKvlI385p0tx0gf
         ImJFqFaPpAI+oyP6ee6p/nHYNFE+jX/0vSmNFisSapEF8x8z5DFmYhdIHHSaSdhs+gBj
         4Tr2O0LzUQQX7Ni0YBNwc0JOXFGJk6IRgR6Wpxl1nD02IPRDH9KRhX/AbKg3qo2Bk6+s
         W2+A==
X-Gm-Message-State: AOAM533T0fR4OoW0EThNAd0DPGuoDSVZi3Y+B5wiQpb7WjlyC6hj1bKp
        6pJRXXupQQcj0CoPWRZXgzsRFyy6E4IJBUKJ
X-Google-Smtp-Source: ABdhPJxH3dXajawJmgGedUFt/0s9RkSQOpUZRanfORVnF05b6MtQzzbf90iWYh6sgaNjBabsAL6DrA==
X-Received: by 2002:a37:9c57:: with SMTP id f84mr10900583qke.16.1635114118201;
        Sun, 24 Oct 2021 15:21:58 -0700 (PDT)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id i2sm6030226qti.92.2021.10.24.15.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Oct 2021 15:21:57 -0700 (PDT)
Subject: Re: [PATCH 00/13] This patchset aims to add initial support for the
 i.MXRT10xx family
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        gregkh <gregkh@linuxfoundation.org>,
        Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        giulio.benetti@benettiengineering.com,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        b20788@freescale.com, Andy Duan <fugang.duan@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <CAK8P3a3ccWgpQF8-Ej7Di_=eCs+cibDgiY5962iPKsMgzD_qSg@mail.gmail.com>
From:   Jesse Taube <mr.bossman075@gmail.com>
Message-ID: <b7132b95-4a9f-db7c-6010-3f9df99a3087@gmail.com>
Date:   Sun, 24 Oct 2021 18:21:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3ccWgpQF8-Ej7Di_=eCs+cibDgiY5962iPKsMgzD_qSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Arnd,

Giulio is in CC

On 10/24/21 3:32 PM, Arnd Bergmann wrote:
> On Sun, Oct 24, 2021 at 5:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>>
>> Add initial support for the i.MXRT10xx SoC family
>> starting with the i.IMXRT1050 SoC.
>> This patchset contains:
>> - i.MXRT10xx family infrastructure
>> - i.MXRT1050 pinctrl driver adaption
>> - i.MXRT1050 clock driver adaption
>> - i.MXRT1050 sd-card driver adaption
>> - i.MXRT1050 uart driver adaption
>> - i.MXRT1050-evk basic support
> 
> Can you expand the description a bit more so it makes sense as a changelog
> text for the merge commit? It's fairly rare these days that we add support for a
> MMU-less platform, so it would be good if the introductory text answers
> questions like:
> 
> - what is this platform used for, and what is the purpose of running Linux on it
>   in place of the usual RTOS variants?
> 
> - are you doing this just for fun, or are there any commercial use cases?

The purpose of this is for learning and fun, as far as we know there are no
commercial use cases, but we hope there will be.

> - what are the minimum and maximum memory configurations this has
>   been tested with?

We both have only tested with 32MB of ram on i.MXRT1050/60-evk.

> - what user space are you testing with: any particular distro that supports
>   this platform, and do you run elf-fdpic or flat binaries.

We are using Buildroot[1] and that only uses flat binaries.
i.MXRT1050/20 have already been up-streamed to U-Boot[2].

> - are you planning to also support the newer i.MXRT11xx or
>   Cortex-R based designs like the S32S?

We plan to support the i.MXRT11xx, but unsure about the S32x, it depends 
on the interest. 

> 
>        Arnd
>
[1]: https://github.com/Mr-Bossman/imxrt-linux-buildroot.git
[2]: https://source.denx.de/u-boot/u-boot/-/blob/master/configs/imxrt1050-evk_defconfig

Thank you, 
Jesse Taube.

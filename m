Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0A5F8A8E9
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 23:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfHLVEB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 17:04:01 -0400
Received: from mout.gmx.net ([212.227.15.18]:40659 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726707AbfHLVEA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Aug 2019 17:04:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565643821;
        bh=Z4dob6QFbBn2pjPUd/UPBrkeB6mcJHKlMV0DqcboR08=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=B4NG0dM8FysyLubkeDJwulk//hiefE+vWC0zHl0jeJUr4J/wKse1+Ie3RPn+YYT7t
         4ZBAfJyOqSwGvQlPB7Ker8RPVXP8aphQmmVEhdHMSBLmT1i6DPszA4zi5JBr91K21y
         K0GzfZoThtVjl9dCddbRLIlTosEFax2tc9KW6S2M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.106]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MUZG7-1hoj2U0bBb-00RFGz; Mon, 12
 Aug 2019 23:03:41 +0200
Subject: Re: [PATCH 04/18] ARM: dts: bcm283x: Define MMC interfaces at board
 level
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
 <1563774880-8061-5-git-send-email-wahrenst@gmx.net>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <b9ed2030-25de-4e21-7fc0-9382f6250630@gmx.net>
Date:   Mon, 12 Aug 2019 23:03:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1563774880-8061-5-git-send-email-wahrenst@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:uXhaVTZBIdtkgpQUvDbG0jujSsYTCHrV4MMU4Fp2mY1BMnzmFcu
 dj2zho2p1mWt4W8P9ca6cb4FZqTkfvwYrgsdpjsbunb2+OCQ26HuB5DQvg48g0xDpcdlvKS
 PKWvKVNaDW0nB3RUbs8GYcGeMbePtCkVYxcbQ/bcw7SN/CGkwcrSxiZq7HYkHxdcU9wlpbU
 5oKyiopkh2L982OwP3whA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:m77DRGs/jQw=:SUOdNsS/ZqhCJsJlR6MruL
 UMB+vVPWVjHskJr9GgrZboRMpxMbTP5+ajj+wh17Rb8Xrpm5qOdmm/sgaalaJQmiYcuOJA8B0
 ZFQ7m/CYO7oj78rnADsnr6FsDNvMRFEPJIDYDzq/mrIdtoFYBptRWmfVZY3KcAoOcljhOlpMj
 f9cisBARzc7TjkABHr7cgOjOQ1UvAFSDSetanMqSorRtK970Mzv1LyEMvP+0oDi81ACfXJTyj
 tgRgb8WO/d2Qei9frV1O3ILKY0zP3u9UoBON+WRlsn4RWh/MX/xvtr/ctgIfa2F0TKN+yHuxz
 VvGar7T1VwWLaGdDZSlV5bOrEVJIpDQMKJ92LMYNyF4q5xS5P6bdsFV/czPqcxlV8d7jQP93K
 U2MPwt6vWCqTUW4mONbuErQ2USTKHq7kfn2OnlIdyGqjALEnt6aQ5G5fA9znnqU44ZEI2UdTx
 CxrTPuIha5Y4b0vkb2XnXWyPv6oHgm4fE6ufHW8HT2I5HUM4ATpNE+BC8EP7t11NiqrDd4C5p
 WmiXgHlU198hAIxp+XeUd9qCRk7msfUWEDqCun4JcCklGHpYBEWjfpbHgZEQFAlZW5dMu1dt3
 ZZBM4KuWfKktyXqephuS9NeWQGDzkFaTYIKLlYqq3uBZt52lpo364MWDT05PVM3FOpRq7N0jZ
 tRUEOWhyHvGOYnTD0X+4JkZ6nzfUQTIJn05ln8AZTFI3SuywiJbwOXKQHgZyCpk4cmVHtC++s
 TO7IW2E/scQ7zwVraGsChU6QKlR6z5Vl53zGL78cHNah8fJTxWNcd3sOTxpncrLErZy5EqIP6
 om551ZL2ZtLz5VrfiTooZHHFrm0i4W8r3K7GBJFIm8g7zxSCE0evcnEtbAe2KI8l4JQAdjZ7I
 BnT3ais0cuF/FUCmJD8tg9Tdrk2CRfPMd7IsF+zYM1lalHCWGKjRigq8WwcFmRt8BVJM2pl9f
 +GQf0QRXDNQUGS6ImJGNFEJd9SE9sfgDwMeND3ZKI75uvqSA/5Em4VY4Q2dgTEMJyRR1d7C5E
 legBB0PgKurO3SDe3zf4uwZ+5l8Zo0meuYjB4bm/zG27xbuEfk0A+ecfa3/T/zy7VeHNhg8I2
 1YkyUA7vsdAygpN9A4xIIyd9SISAvtTBASpIbRxdZ6QUA+jsqDdhpkcUI1H+cPCo2JNllosGt
 Lx3Hc=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 22.07.19 um 07:54 schrieb Stefan Wahren:
> Starting with RPi 4 this is the first board, which doesn't use sdhost
> as default SD interface. So the MMC interfaces should be defined finally at
> board level. Since all boards using sdhci already does this, we can drop the
> pinctrl part from bcm2835-rpi.dtsi.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Applied to bcm2835-dt-next

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F233365112
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Apr 2021 05:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbhDTDrZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Apr 2021 23:47:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:46772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229508AbhDTDrZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Apr 2021 23:47:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 660A46135F;
        Tue, 20 Apr 2021 03:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618890413;
        bh=sRF3mDHWkOhN4jZw0niLknQBofJRnruRARpEIpOzBlo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vOATyaqSm28IA4iLHG6Be7utlWKwrpNRULADFTh7F5GI466FGjlG5dHFE0SS3DEcT
         dgRP1E7vfNMnaANtYC4vfh4fAiQFvCN3UlGvkFX6pxLHYxH7oGkPhmSEzi468j5BF1
         RDZyi/NQrhaRtycmZybOmPln6BijkIknSMylU96nbUeZczUhJb9kHq9uUwE/IDm5u7
         XlMZt636kE8g9bCTGsKNXV6crnEB080mZwvwbxEaW8n5Fmk0YzsKcry340Vb2wP883
         u3Tgx1/TA4F48SPFra+DCR436twxNvMt7ieXQHaGBIYPrTyZwwaX/Zfa1H7LTQ4IDy
         oNu/xwVtzUPoA==
Received: by mail-ej1-f50.google.com with SMTP id l4so56068467ejc.10;
        Mon, 19 Apr 2021 20:46:53 -0700 (PDT)
X-Gm-Message-State: AOAM530wTnfhmZt2fPeVw6p9sItvO/4rCzrS4C9H6aMCeBknNrVn1RYK
        fQ1y5lFCXM0HuWdTlTa5qh5srzUxnEUxt/gUpwc=
X-Google-Smtp-Source: ABdhPJyh/UiDgd2W1fp95NWhu3PkaJ1igUDabmmFo89E8fZ1N6+rf6H7UJOnKQdsb96oqo5GZq54pP6R6RoBrFCmSh4=
X-Received: by 2002:a17:906:fb81:: with SMTP id lr1mr24068386ejb.62.1618890411265;
 Mon, 19 Apr 2021 20:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210413055702.27535-1-zhiyong.tao@mediatek.com> <20210413055702.27535-3-zhiyong.tao@mediatek.com>
In-Reply-To: <20210413055702.27535-3-zhiyong.tao@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Mon, 19 Apr 2021 20:46:39 -0700
X-Gmail-Original-Message-ID: <CAGp9LzqiX1ZjcHr396=pq=wyo=C76dyMqjf6m_s5yU9Fo74tHQ@mail.gmail.com>
Message-ID: <CAGp9LzqiX1ZjcHr396=pq=wyo=C76dyMqjf6m_s5yU9Fo74tHQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] pinctrl: add pinctrl driver on mt8195
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com,
        =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= 
        <eddie.huang@mediatek.com>, jg_poxu@mediatek.com,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>,
        seiya.wang@mediatek.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 12, 2021 at 10:57 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This commit includes pinctrl driver for mt8195.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/Kconfig              |    6 +
>  drivers/pinctrl/mediatek/Makefile             |    1 +
>  drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  828 ++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h | 1669 +++++++++++++++++
>  4 files changed, 2504 insertions(+)
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8195.c
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h
>
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index eef17f228669..90f0c8255eaf 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -147,6 +147,12 @@ config PINCTRL_MT8192
>         default ARM64 && ARCH_MEDIATEK
>         select PINCTRL_MTK_PARIS
>
> +config PINCTRL_MT8195
> +       bool "Mediatek MT8195 pin control"
> +       depends on OF
> +       depends on ARM64 || COMPILE_TEST
> +       select PINCTRL_MTK_PARIS
> +
>  config PINCTRL_MT8516
>         bool "Mediatek MT8516 pin control"
>         depends on OF
> diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
> index 01218bf4dc30..06fde993ace2 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -21,5 +21,6 @@ obj-$(CONFIG_PINCTRL_MT8167)  += pinctrl-mt8167.o
>  obj-$(CONFIG_PINCTRL_MT8173)   += pinctrl-mt8173.o
>  obj-$(CONFIG_PINCTRL_MT8183)   += pinctrl-mt8183.o
>  obj-$(CONFIG_PINCTRL_MT8192)   += pinctrl-mt8192.o
> +obj-$(CONFIG_PINCTRL_MT8195)    += pinctrl-mt8195.o
>  obj-$(CONFIG_PINCTRL_MT8516)   += pinctrl-mt8516.o
>  obj-$(CONFIG_PINCTRL_MT6397)   += pinctrl-mt6397.o
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> new file mode 100644
> index 000000000000..063f164d7c9b
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> @@ -0,0 +1,828 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 MediaTek Inc.
> + *
> + * Author: Zhiyong Tao <zhiyong.tao@mediatek.com>
> + *
> + */
> +
> +#include "pinctrl-mtk-mt8195.h"
> +#include "pinctrl-paris.h"
> +
> +/* MT8195 have multiple bases to program pin configuration listed as the below:
> + * iocfg[0]:0x10005000, iocfg[1]:0x11d10000, iocfg[2]:0x11d30000,
> + * iocfg[3]:0x11d40000, iocfg[4]:0x11e20000, iocfg[5]:0x11eb0000,
> + * iocfg[6]:0x11f40000.
> + * _i_based could be used to indicate what base the pin should be mapped into.
> + */
> +
> +#define PIN_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits) \
> +       PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits, \
> +                      32, 0)
> +
> +#define PINS_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits) \
> +       PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits,  \
> +                      32, 1)
> +
> +static const struct mtk_pin_field_calc mt8195_pin_mode_range[] = {
> +       PIN_FIELD(0, 144, 0x300, 0x10, 0, 4),
> +};
> +
> +static const struct mtk_pin_field_calc mt8195_pin_dir_range[] = {
> +       PIN_FIELD(0, 144, 0x0, 0x10, 0, 1),
> +};
> +
> +static const struct mtk_pin_field_calc mt8195_pin_di_range[] = {
> +       PIN_FIELD(0, 144, 0x200, 0x10, 0, 1),
> +};
> +
> +static const struct mtk_pin_field_calc mt8195_pin_do_range[] = {
> +       PIN_FIELD(0, 144, 0x100, 0x10, 0, 1),
> +};
> +
> +static const struct mtk_pin_field_calc mt8195_pin_ies_range[] = {
> +       PIN_FIELD_BASE(0, 0, 4, 0x040, 0x10, 0, 1),
> +       PIN_FIELD_BASE(1, 1, 4, 0x040, 0x10, 1, 1),
> +       PIN_FIELD_BASE(2, 2, 4, 0x040, 0x10, 2, 1),
> +       PIN_FIELD_BASE(3, 3, 4, 0x040, 0x10, 3, 1),
> +       PIN_FIELD_BASE(4, 4, 4, 0x040, 0x10, 4, 1),
> +       PIN_FIELD_BASE(5, 5, 4, 0x040, 0x10, 5, 1),
> +       PIN_FIELD_BASE(6, 6, 4, 0x040, 0x10, 6, 1),
> +       PIN_FIELD_BASE(7, 7, 4, 0x040, 0x10, 7, 1),
> +       PIN_FIELD_BASE(8, 8, 4, 0x040, 0x10, 13, 1),
> +       PIN_FIELD_BASE(9, 9, 4, 0x040, 0x10, 8, 1),
> +       PIN_FIELD_BASE(10, 10, 4, 0x040, 0x10, 14, 1),
> +       PIN_FIELD_BASE(11, 11, 4, 0x040, 0x10, 9, 1),
> +       PIN_FIELD_BASE(12, 12, 4, 0x040, 0x10, 15, 1),
> +       PIN_FIELD_BASE(13, 13, 4, 0x040, 0x10, 10, 1),
> +       PIN_FIELD_BASE(14, 14, 4, 0x040, 0x10, 16, 1),
> +       PIN_FIELD_BASE(15, 15, 4, 0x040, 0x10, 11, 1),
> +       PIN_FIELD_BASE(16, 16, 4, 0x040, 0x10, 17, 1),
> +       PIN_FIELD_BASE(17, 17, 4, 0x040, 0x10, 12, 1),
> +       PIN_FIELD_BASE(18, 18, 2, 0x040, 0x10, 5, 1),
> +       PIN_FIELD_BASE(19, 19, 2, 0x040, 0x10, 12, 1),
> +       PIN_FIELD_BASE(20, 20, 2, 0x040, 0x10, 11, 1),
> +       PIN_FIELD_BASE(21, 21, 2, 0x040, 0x10, 10, 1),
> +       PIN_FIELD_BASE(22, 22, 2, 0x040, 0x10, 0, 1),
> +       PIN_FIELD_BASE(23, 23, 2, 0x040, 0x10, 1, 1),
> +       PIN_FIELD_BASE(24, 24, 2, 0x040, 0x10, 2, 1),
> +       PIN_FIELD_BASE(25, 25, 2, 0x040, 0x10, 4, 1),
> +       PIN_FIELD_BASE(26, 26, 2, 0x040, 0x10, 3, 1),
> +       PIN_FIELD_BASE(27, 27, 2, 0x040, 0x10, 6, 1),
> +       PIN_FIELD_BASE(28, 28, 2, 0x040, 0x10, 7, 1),
> +       PIN_FIELD_BASE(29, 29, 2, 0x040, 0x10, 8, 1),
> +       PIN_FIELD_BASE(30, 30, 2, 0x040, 0x10, 9, 1),
> +       PIN_FIELD_BASE(31, 31, 1, 0x060, 0x10, 13, 1),
> +       PIN_FIELD_BASE(32, 32, 1, 0x060, 0x10, 12, 1),
> +       PIN_FIELD_BASE(33, 33, 1, 0x060, 0x10, 11, 1),
> +       PIN_FIELD_BASE(34, 34, 1, 0x060, 0x10, 14, 1),
> +       PIN_FIELD_BASE(35, 35, 1, 0x060, 0x10, 15, 1),
> +       PIN_FIELD_BASE(36, 36, 1, 0x070, 0x10, 3, 1),
> +       PIN_FIELD_BASE(37, 37, 1, 0x070, 0x10, 6, 1),
> +       PIN_FIELD_BASE(38, 38, 1, 0x070, 0x10, 4, 1),
> +       PIN_FIELD_BASE(39, 39, 1, 0x070, 0x10, 5, 1),
> +       PIN_FIELD_BASE(40, 40, 1, 0x070, 0x10, 8, 1),
> +       PIN_FIELD_BASE(41, 41, 1, 0x070, 0x10, 7, 1),
> +       PIN_FIELD_BASE(42, 42, 1, 0x070, 0x10, 10, 1),
> +       PIN_FIELD_BASE(43, 43, 1, 0x070, 0x10, 9, 1),
> +       PIN_FIELD_BASE(44, 44, 1, 0x070, 0x10, 20, 1),
> +       PIN_FIELD_BASE(45, 45, 1, 0x070, 0x10, 21, 1),
> +       PIN_FIELD_BASE(46, 46, 1, 0x060, 0x10, 18, 1),
> +       PIN_FIELD_BASE(47, 47, 1, 0x060, 0x10, 16, 1),
> +       PIN_FIELD_BASE(48, 48, 1, 0x060, 0x10, 19, 1),
> +       PIN_FIELD_BASE(49, 49, 1, 0x060, 0x10, 17, 1),
> +       PIN_FIELD_BASE(50, 50, 1, 0x060, 0x10, 25, 1),
> +       PIN_FIELD_BASE(51, 51, 1, 0x060, 0x10, 20, 1),
> +       PIN_FIELD_BASE(52, 52, 1, 0x060, 0x10, 26, 1),
> +       PIN_FIELD_BASE(53, 53, 1, 0x060, 0x10, 21, 1),
> +       PIN_FIELD_BASE(54, 54, 1, 0x060, 0x10, 22, 1),
> +       PIN_FIELD_BASE(55, 55, 1, 0x060, 0x10, 23, 1),
> +       PIN_FIELD_BASE(56, 56, 1, 0x060, 0x10, 24, 1),
> +       PIN_FIELD_BASE(57, 57, 1, 0x060, 0x10, 29, 1),
> +       PIN_FIELD_BASE(58, 58, 1, 0x060, 0x10, 27, 1),
> +       PIN_FIELD_BASE(59, 59, 1, 0x060, 0x10, 30, 1),
> +       PIN_FIELD_BASE(60, 60, 1, 0x060, 0x10, 28, 1),
> +       PIN_FIELD_BASE(61, 61, 1, 0x060, 0x10, 8, 1),
> +       PIN_FIELD_BASE(62, 62, 1, 0x060, 0x10, 7, 1),
> +       PIN_FIELD_BASE(63, 63, 1, 0x060, 0x10, 10, 1),
> +       PIN_FIELD_BASE(64, 64, 1, 0x060, 0x10, 9, 1),
> +       PIN_FIELD_BASE(65, 65, 1, 0x070, 0x10, 1, 1),
> +       PIN_FIELD_BASE(66, 66, 1, 0x060, 0x10, 31, 1),
> +       PIN_FIELD_BASE(67, 67, 1, 0x070, 0x10, 0, 1),
> +       PIN_FIELD_BASE(68, 68, 1, 0x070, 0x10, 2, 1),
> +       PIN_FIELD_BASE(69, 69, 1, 0x060, 0x10, 0, 1),
> +       PIN_FIELD_BASE(70, 70, 1, 0x060, 0x10, 6, 1),
> +       PIN_FIELD_BASE(71, 71, 1, 0x060, 0x10, 4, 1),
> +       PIN_FIELD_BASE(72, 72, 1, 0x060, 0x10, 5, 1),
> +       PIN_FIELD_BASE(73, 73, 1, 0x060, 0x10, 1, 1),
> +       PIN_FIELD_BASE(74, 74, 1, 0x060, 0x10, 2, 1),
> +       PIN_FIELD_BASE(75, 75, 1, 0x060, 0x10, 3, 1),
> +       PIN_FIELD_BASE(76, 76, 1, 0x070, 0x10, 11, 1),
> +       PIN_FIELD_BASE(77, 77, 3, 0x030, 0x10, 1, 1),
> +       PIN_FIELD_BASE(78, 78, 3, 0x030, 0x10, 2, 1),
> +       PIN_FIELD_BASE(79, 79, 3, 0x030, 0x10, 9, 1),
> +       PIN_FIELD_BASE(80, 80, 3, 0x030, 0x10, 10, 1),
> +       PIN_FIELD_BASE(81, 81, 3, 0x030, 0x10, 11, 1),
> +       PIN_FIELD_BASE(82, 82, 3, 0x030, 0x10, 12, 1),
> +       PIN_FIELD_BASE(83, 83, 3, 0x030, 0x10, 13, 1),
> +       PIN_FIELD_BASE(84, 84, 3, 0x030, 0x10, 14, 1),
> +       PIN_FIELD_BASE(85, 85, 3, 0x030, 0x10, 15, 1),
> +       PIN_FIELD_BASE(86, 86, 3, 0x030, 0x10, 16, 1),
> +       PIN_FIELD_BASE(87, 87, 3, 0x030, 0x10, 3, 1),
> +       PIN_FIELD_BASE(88, 88, 3, 0x030, 0x10, 4, 1),
> +       PIN_FIELD_BASE(89, 89, 3, 0x030, 0x10, 5, 1),
> +       PIN_FIELD_BASE(90, 90, 3, 0x030, 0x10, 6, 1),
> +       PIN_FIELD_BASE(91, 91, 3, 0x030, 0x10, 7, 1),
> +       PIN_FIELD_BASE(92, 92, 3, 0x030, 0x10, 8, 1),
> +       PIN_FIELD_BASE(93, 93, 3, 0x030, 0x10, 18, 1),
> +       PIN_FIELD_BASE(94, 94, 3, 0x030, 0x10, 19, 1),
> +       PIN_FIELD_BASE(95, 95, 3, 0x030, 0x10, 17, 1),
> +       PIN_FIELD_BASE(96, 96, 3, 0x030, 0x10, 0, 1),
> +       PIN_FIELD_BASE(97, 97, 3, 0x030, 0x10, 20, 1),
> +       PIN_FIELD_BASE(98, 98, 3, 0x030, 0x10, 28, 1),
> +       PIN_FIELD_BASE(99, 99, 3, 0x030, 0x10, 27, 1),
> +       PIN_FIELD_BASE(100, 100, 3, 0x030, 0x10, 30, 1),
> +       PIN_FIELD_BASE(101, 101, 3, 0x030, 0x10, 29, 1),
> +       PIN_FIELD_BASE(102, 102, 3, 0x040, 0x10, 0, 1),
> +       PIN_FIELD_BASE(103, 103, 3, 0x030, 0x10, 31, 1),
> +       PIN_FIELD_BASE(104, 104, 3, 0x030, 0x10, 25, 1),
> +       PIN_FIELD_BASE(105, 105, 3, 0x030, 0x10, 26, 1),
> +       PIN_FIELD_BASE(106, 106, 3, 0x030, 0x10, 23, 1),
> +       PIN_FIELD_BASE(107, 107, 3, 0x030, 0x10, 24, 1),
> +       PIN_FIELD_BASE(108, 108, 3, 0x030, 0x10, 22, 1),
> +       PIN_FIELD_BASE(109, 109, 3, 0x030, 0x10, 21, 1),
> +       PIN_FIELD_BASE(110, 110, 5, 0x010, 0x10, 1, 1),
> +       PIN_FIELD_BASE(111, 111, 5, 0x010, 0x10, 0, 1),
> +       PIN_FIELD_BASE(112, 112, 5, 0x010, 0x10, 2, 1),
> +       PIN_FIELD_BASE(113, 113, 5, 0x010, 0x10, 3, 1),
> +       PIN_FIELD_BASE(114, 114, 5, 0x010, 0x10, 4, 1),
> +       PIN_FIELD_BASE(115, 115, 5, 0x010, 0x10, 5, 1),
> +       PIN_FIELD_BASE(116, 116, 6, 0x030, 0x10, 9, 1),
> +       PIN_FIELD_BASE(117, 117, 6, 0x030, 0x10, 8, 1),
> +       PIN_FIELD_BASE(118, 118, 6, 0x030, 0x10, 7, 1),
> +       PIN_FIELD_BASE(119, 119, 6, 0x030, 0x10, 6, 1),
> +       PIN_FIELD_BASE(120, 120, 6, 0x030, 0x10, 11, 1),
> +       PIN_FIELD_BASE(121, 121, 6, 0x030, 0x10, 1, 1),
> +       PIN_FIELD_BASE(122, 122, 6, 0x030, 0x10, 0, 1),
> +       PIN_FIELD_BASE(123, 123, 6, 0x030, 0x10, 5, 1),
> +       PIN_FIELD_BASE(124, 124, 6, 0x030, 0x10, 4, 1),
> +       PIN_FIELD_BASE(125, 125, 6, 0x030, 0x10, 3, 1),
> +       PIN_FIELD_BASE(126, 126, 6, 0x030, 0x10, 2, 1),
> +       PIN_FIELD_BASE(127, 127, 6, 0x030, 0x10, 10, 1),
> +       PIN_FIELD_BASE(128, 128, 3, 0x040, 0x10, 3, 1),
> +       PIN_FIELD_BASE(129, 129, 3, 0x040, 0x10, 1, 1),
> +       PIN_FIELD_BASE(130, 130, 3, 0x040, 0x10, 4, 1),
> +       PIN_FIELD_BASE(131, 131, 3, 0x040, 0x10, 2, 1),
> +       PIN_FIELD_BASE(132, 132, 6, 0x030, 0x10, 13, 1),
> +       PIN_FIELD_BASE(133, 133, 6, 0x030, 0x10, 12, 1),
> +       PIN_FIELD_BASE(134, 134, 6, 0x030, 0x10, 15, 1),
> +       PIN_FIELD_BASE(135, 135, 6, 0x030, 0x10, 14, 1),
> +       PIN_FIELD_BASE(136, 136, 1, 0x070, 0x10, 13, 1),
> +       PIN_FIELD_BASE(137, 137, 1, 0x070, 0x10, 12, 1),
> +       PIN_FIELD_BASE(138, 138, 1, 0x070, 0x10, 15, 1),
> +       PIN_FIELD_BASE(139, 139, 1, 0x070, 0x10, 14, 1),
> +       PIN_FIELD_BASE(140, 140, 1, 0x070, 0x10, 17, 1),
> +       PIN_FIELD_BASE(141, 141, 1, 0x070, 0x10, 16, 1),
> +       PIN_FIELD_BASE(142, 142, 1, 0x070, 0x10, 19, 1),
> +       PIN_FIELD_BASE(143, 143, 1, 0x070, 0x10, 18, 1),
> +};
> +
> +static const struct mtk_pin_field_calc mt8195_pin_smt_range[] = {
> +       PIN_FIELD_BASE(0, 0, 4, 0x0d0, 0x10, 0, 1),
> +       PIN_FIELD_BASE(1, 1, 4, 0x0d0, 0x10, 1, 1),
> +       PIN_FIELD_BASE(2, 2, 4, 0x0d0, 0x10, 2, 1),
> +       PIN_FIELD_BASE(3, 3, 4, 0x0d0, 0x10, 3, 1),
> +       PIN_FIELD_BASE(4, 4, 4, 0x0d0, 0x10, 4, 1),
> +       PIN_FIELD_BASE(5, 5, 4, 0x0d0, 0x10, 5, 1),
> +       PINS_FIELD_BASE(6, 7, 4, 0x0d0, 0x10, 6, 1),
> +       PIN_FIELD_BASE(8, 8, 4, 0x0d0, 0x10, 12, 1),
> +       PIN_FIELD_BASE(9, 9, 4, 0x0d0, 0x10, 7, 1),
> +       PIN_FIELD_BASE(10, 10, 4, 0x0d0, 0x10, 13, 1),
> +       PIN_FIELD_BASE(11, 11, 4, 0x0d0, 0x10, 8, 1),
> +       PIN_FIELD_BASE(12, 12, 4, 0x0d0, 0x10, 14, 1),
> +       PIN_FIELD_BASE(13, 13, 4, 0x0d0, 0x10, 9, 1),
> +       PIN_FIELD_BASE(14, 14, 4, 0x0d0, 0x10, 15, 1),
> +       PIN_FIELD_BASE(15, 15, 4, 0x0d0, 0x10, 10, 1),
> +       PIN_FIELD_BASE(16, 16, 4, 0x0d0, 0x10, 16, 1),
> +       PIN_FIELD_BASE(17, 17, 4, 0x0d0, 0x10, 11, 1),
> +       PIN_FIELD_BASE(18, 18, 2, 0x090, 0x10, 11, 1),
> +       PIN_FIELD_BASE(19, 19, 2, 0x090, 0x10, 10, 1),
> +       PIN_FIELD_BASE(20, 20, 2, 0x090, 0x10, 9, 1),
> +       PIN_FIELD_BASE(21, 21, 2, 0x090, 0x10, 11, 1),
> +       PIN_FIELD_BASE(22, 22, 2, 0x090, 0x10, 0, 1),
> +       PIN_FIELD_BASE(23, 23, 2, 0x090, 0x10, 1, 1),
> +       PIN_FIELD_BASE(24, 24, 2, 0x090, 0x10, 2, 1),
> +       PIN_FIELD_BASE(25, 25, 2, 0x090, 0x10, 4, 1),
> +       PIN_FIELD_BASE(26, 26, 2, 0x090, 0x10, 3, 1),
> +       PIN_FIELD_BASE(27, 27, 2, 0x090, 0x10, 5, 1),
> +       PIN_FIELD_BASE(28, 28, 2, 0x090, 0x10, 6, 1),
> +       PIN_FIELD_BASE(29, 29, 2, 0x090, 0x10, 7, 1),
> +       PIN_FIELD_BASE(30, 30, 2, 0x090, 0x10, 8, 1),
> +       PINS_FIELD_BASE(31, 33, 1, 0x0f0, 0x10, 4, 1),
> +       PIN_FIELD_BASE(34, 34, 1, 0x0f0, 0x10, 0, 1),
> +       PIN_FIELD_BASE(35, 35, 1, 0x0f0, 0x10, 1, 1),
> +       PIN_FIELD_BASE(36, 36, 1, 0x0f0, 0x10, 4, 1),
> +       PIN_FIELD_BASE(37, 37, 1, 0x0f0, 0x10, 2, 1),
> +       PINS_FIELD_BASE(38, 39, 1, 0x0f0, 0x10, 5, 1),
> +       PIN_FIELD_BASE(40, 40, 1, 0x0f0, 0x10, 14, 1),
> +       PIN_FIELD_BASE(41, 41, 1, 0x0f0, 0x10, 13, 1),
> +       PIN_FIELD_BASE(42, 42, 1, 0x0f0, 0x10, 16, 1),
> +       PIN_FIELD_BASE(43, 43, 1, 0x0f0, 0x10, 15, 1),
> +       PIN_FIELD_BASE(44, 44, 1, 0x0f0, 0x10, 25, 1),
> +       PIN_FIELD_BASE(45, 45, 1, 0x0f0, 0x10, 26, 1),
> +       PINS_FIELD_BASE(46, 47, 1, 0x0f0, 0x10, 5, 1),
> +       PINS_FIELD_BASE(48, 51, 1, 0x0f0, 0x10, 6, 1),
> +       PINS_FIELD_BASE(52, 55, 1, 0x0f0, 0x10, 7, 1),
> +       PINS_FIELD_BASE(56, 59, 1, 0x0f0, 0x10, 8, 1),
> +       PINS_FIELD_BASE(60, 63, 1, 0x0f0, 0x10, 9, 1),
> +       PIN_FIELD_BASE(64, 64, 1, 0x0f0, 0x10, 10, 1),
> +       PINS_FIELD_BASE(65, 68, 1, 0x0f0, 0x10, 3, 1),
> +       PINS_FIELD_BASE(69, 71, 1, 0x0f0, 0x10, 10, 1),
> +       PINS_FIELD_BASE(72, 75, 1, 0x0f0, 0x10, 11, 1),
> +       PIN_FIELD_BASE(76, 76, 1, 0x0f0, 0x10, 12, 1),
> +       PIN_FIELD_BASE(77, 77, 3, 0x0e0, 0x10, 0, 1),
> +       PIN_FIELD_BASE(78, 78, 3, 0x0e0, 0x10, 1, 1),
> +       PIN_FIELD_BASE(79, 79, 3, 0x0e0, 0x10, 6, 1),
> +       PIN_FIELD_BASE(80, 80, 3, 0x0e0, 0x10, 7, 1),
> +       PIN_FIELD_BASE(81, 81, 3, 0x0e0, 0x10, 8, 1),
> +       PIN_FIELD_BASE(82, 82, 3, 0x0e0, 0x10, 9, 1),
> +       PIN_FIELD_BASE(83, 83, 3, 0x0e0, 0x10, 10, 1),
> +       PIN_FIELD_BASE(84, 84, 3, 0x0e0, 0x10, 11, 1),
> +       PINS_FIELD_BASE(85, 88, 3, 0x0e0, 0x10, 14, 1),
> +       PIN_FIELD_BASE(89, 89, 3, 0x0e0, 0x10, 2, 1),
> +       PIN_FIELD_BASE(90, 90, 3, 0x0e0, 0x10, 3, 1),
> +       PIN_FIELD_BASE(91, 91, 3, 0x0e0, 0x10, 4, 1),
> +       PIN_FIELD_BASE(92, 92, 3, 0x0e0, 0x10, 5, 1),
> +       PIN_FIELD_BASE(93, 93, 3, 0x0e0, 0x10, 12, 1),
> +       PIN_FIELD_BASE(94, 94, 3, 0x0e0, 0x10, 13, 1),
> +       PINS_FIELD_BASE(95, 98, 3, 0x0e0, 0x10, 15, 1),
> +       PINS_FIELD_BASE(99, 102, 3, 0x0e0, 0x10, 16, 1),
> +       PINS_FIELD_BASE(103, 104, 3, 0x0e0, 0x10, 17, 1),
> +       PIN_FIELD_BASE(105, 105, 3, 0x0e0, 0x10, 18, 1),
> +       PINS_FIELD_BASE(106, 107, 3, 0x0e0, 0x10, 17, 1),
> +       PINS_FIELD_BASE(108, 109, 3, 0x0e0, 0x10, 18, 1),
> +       PIN_FIELD_BASE(110, 110, 5, 0x070, 0x10, 1, 1),
> +       PIN_FIELD_BASE(111, 111, 5, 0x070, 0x10, 0, 1),
> +       PIN_FIELD_BASE(112, 112, 5, 0x070, 0x10, 2, 1),
> +       PIN_FIELD_BASE(113, 113, 5, 0x070, 0x10, 3, 1),
> +       PIN_FIELD_BASE(114, 114, 5, 0x070, 0x10, 4, 1),
> +       PIN_FIELD_BASE(115, 115, 5, 0x070, 0x10, 5, 1),
> +       PIN_FIELD_BASE(116, 116, 6, 0x0c0, 0x10, 9, 1),
> +       PIN_FIELD_BASE(117, 117, 6, 0x0c0, 0x10, 8, 1),
> +       PIN_FIELD_BASE(118, 118, 6, 0x0c0, 0x10, 7, 1),
> +       PIN_FIELD_BASE(119, 119, 6, 0x0c0, 0x10, 6, 1),
> +       PIN_FIELD_BASE(120, 120, 6, 0x0c0, 0x10, 11, 1),
> +       PIN_FIELD_BASE(121, 121, 6, 0x0c0, 0x10, 1, 1),
> +       PIN_FIELD_BASE(122, 122, 6, 0x0c0, 0x10, 0, 1),
> +       PIN_FIELD_BASE(123, 123, 6, 0x0c0, 0x10, 5, 1),
> +       PIN_FIELD_BASE(124, 124, 6, 0x0c0, 0x10, 4, 1),
> +       PIN_FIELD_BASE(125, 125, 6, 0x0c0, 0x10, 3, 1),
> +       PIN_FIELD_BASE(126, 126, 6, 0x0c0, 0x10, 2, 1),
> +       PIN_FIELD_BASE(127, 127, 6, 0x0c0, 0x10, 10, 1),
> +       PIN_FIELD_BASE(128, 128, 3, 0x0e0, 0x10, 18, 1),
> +       PINS_FIELD_BASE(129, 131, 3, 0x0e0, 0x10, 19, 1),
> +       PIN_FIELD_BASE(132, 132, 6, 0x0c0, 0x10, 13, 1),
> +       PIN_FIELD_BASE(133, 133, 6, 0x0c0, 0x10, 12, 1),
> +       PIN_FIELD_BASE(134, 134, 6, 0x0c0, 0x10, 15, 1),
> +       PIN_FIELD_BASE(135, 135, 6, 0x0c0, 0x10, 14, 1),
> +       PIN_FIELD_BASE(136, 136, 1, 0x0f0, 0x10, 18, 1),
> +       PIN_FIELD_BASE(137, 137, 1, 0x0f0, 0x10, 17, 1),
> +       PIN_FIELD_BASE(138, 138, 1, 0x0f0, 0x10, 20, 1),
> +       PIN_FIELD_BASE(139, 139, 1, 0x0f0, 0x10, 19, 1),
> +       PIN_FIELD_BASE(140, 140, 1, 0x0f0, 0x10, 22, 1),
> +       PIN_FIELD_BASE(141, 141, 1, 0x0f0, 0x10, 21, 1),
> +       PIN_FIELD_BASE(142, 142, 1, 0x0f0, 0x10, 24, 1),
> +       PIN_FIELD_BASE(143, 143, 1, 0x0f0, 0x10, 23, 1),
> +};
> +
> +static const struct mtk_pin_field_calc mt8195_pin_pu_range[] = {
> +       PIN_FIELD_BASE(6, 6, 4, 0x0070, 0x10, 0, 1),
> +       PIN_FIELD_BASE(7, 7, 4, 0x0070, 0x10, 1, 1),
> +       PIN_FIELD_BASE(8, 8, 4, 0x0070, 0x10, 7, 1),
> +       PIN_FIELD_BASE(9, 9, 4, 0x0070, 0x10, 2, 1),
> +       PIN_FIELD_BASE(10, 10, 4, 0x0070, 0x10, 8, 1),
> +       PIN_FIELD_BASE(11, 11, 4, 0x0070, 0x10, 3, 1),
> +       PIN_FIELD_BASE(12, 12, 4, 0x0070, 0x10, 9, 1),
> +       PIN_FIELD_BASE(13, 13, 4, 0x0070, 0x10, 4, 1),
> +       PIN_FIELD_BASE(14, 14, 4, 0x0070, 0x10, 10, 1),
> +       PIN_FIELD_BASE(15, 15, 4, 0x0070, 0x10, 5, 1),
> +       PIN_FIELD_BASE(16, 16, 4, 0x0070, 0x10, 11, 1),
> +       PIN_FIELD_BASE(17, 17, 4, 0x0070, 0x10, 6, 1),
> +       PIN_FIELD_BASE(18, 18, 2, 0x0060, 0x10, 5, 1),
> +       PIN_FIELD_BASE(19, 19, 2, 0x0060, 0x10, 12, 1),
> +       PIN_FIELD_BASE(20, 20, 2, 0x0060, 0x10, 11, 1),
> +       PIN_FIELD_BASE(21, 21, 2, 0x0060, 0x10, 10, 1),
> +       PIN_FIELD_BASE(22, 22, 2, 0x0060, 0x10, 0, 1),
> +       PIN_FIELD_BASE(23, 23, 2, 0x0060, 0x10, 1, 1),
> +       PIN_FIELD_BASE(24, 24, 2, 0x0060, 0x10, 2, 1),
> +       PIN_FIELD_BASE(25, 25, 2, 0x0060, 0x10, 4, 1),
> +       PIN_FIELD_BASE(26, 26, 2, 0x0060, 0x10, 3, 1),
> +       PIN_FIELD_BASE(27, 27, 2, 0x0060, 0x10, 6, 1),
> +       PIN_FIELD_BASE(28, 28, 2, 0x0060, 0x10, 7, 1),
> +       PIN_FIELD_BASE(29, 29, 2, 0x0060, 0x10, 8, 1),
> +       PIN_FIELD_BASE(30, 30, 2, 0x0060, 0x10, 9, 1),
> +       PIN_FIELD_BASE(31, 31, 1, 0x00a0, 0x10, 13, 1),
> +       PIN_FIELD_BASE(32, 32, 1, 0x00a0, 0x10, 12, 1),
> +       PIN_FIELD_BASE(33, 33, 1, 0x00a0, 0x10, 11, 1),
> +       PIN_FIELD_BASE(34, 34, 1, 0x00a0, 0x10, 14, 1),
> +       PIN_FIELD_BASE(35, 35, 1, 0x00a0, 0x10, 15, 1),
> +       PIN_FIELD_BASE(36, 36, 1, 0x00b0, 0x10, 3, 1),
> +       PIN_FIELD_BASE(37, 37, 1, 0x00b0, 0x10, 6, 1),
> +       PIN_FIELD_BASE(38, 38, 1, 0x00b0, 0x10, 4, 1),
> +       PIN_FIELD_BASE(39, 39, 1, 0x00b0, 0x10, 5, 1),
> +       PIN_FIELD_BASE(40, 40, 1, 0x00b0, 0x10, 8, 1),
> +       PIN_FIELD_BASE(41, 41, 1, 0x00b0, 0x10, 7, 1),
> +       PIN_FIELD_BASE(42, 42, 1, 0x00b0, 0x10, 10, 1),
> +       PIN_FIELD_BASE(43, 43, 1, 0x00b0, 0x10, 9, 1),
> +       PIN_FIELD_BASE(44, 44, 1, 0x00b0, 0x10, 21, 1),
> +       PIN_FIELD_BASE(45, 45, 1, 0x00b0, 0x10, 22, 1),
> +       PIN_FIELD_BASE(46, 46, 1, 0x00a0, 0x10, 18, 1),
> +       PIN_FIELD_BASE(47, 47, 1, 0x00a0, 0x10, 16, 1),
> +       PIN_FIELD_BASE(48, 48, 1, 0x00a0, 0x10, 19, 1),
> +       PIN_FIELD_BASE(49, 49, 1, 0x00a0, 0x10, 17, 1),
> +       PIN_FIELD_BASE(50, 50, 1, 0x00a0, 0x10, 25, 1),
> +       PIN_FIELD_BASE(51, 51, 1, 0x00a0, 0x10, 20, 1),
> +       PIN_FIELD_BASE(52, 52, 1, 0x00a0, 0x10, 26, 1),
> +       PIN_FIELD_BASE(53, 53, 1, 0x00a0, 0x10, 21, 1),
> +       PIN_FIELD_BASE(54, 54, 1, 0x00a0, 0x10, 22, 1),
> +       PIN_FIELD_BASE(55, 55, 1, 0x00a0, 0x10, 23, 1),
> +       PIN_FIELD_BASE(56, 56, 1, 0x00a0, 0x10, 24, 1),
> +       PIN_FIELD_BASE(57, 57, 1, 0x00a0, 0x10, 29, 1),
> +       PIN_FIELD_BASE(58, 58, 1, 0x00a0, 0x10, 27, 1),
> +       PIN_FIELD_BASE(59, 59, 1, 0x00a0, 0x10, 30, 1),
> +       PIN_FIELD_BASE(60, 60, 1, 0x00a0, 0x10, 28, 1),
> +       PIN_FIELD_BASE(61, 61, 1, 0x00a0, 0x10, 8, 1),
> +       PIN_FIELD_BASE(62, 62, 1, 0x00a0, 0x10, 7, 1),
> +       PIN_FIELD_BASE(63, 63, 1, 0x00a0, 0x10, 10, 1),
> +       PIN_FIELD_BASE(64, 64, 1, 0x00a0, 0x10, 9, 1),
> +       PIN_FIELD_BASE(65, 65, 1, 0x00b0, 0x10, 1, 1),
> +       PIN_FIELD_BASE(66, 66, 1, 0x00a0, 0x10, 31, 1),
> +       PIN_FIELD_BASE(67, 67, 1, 0x00b0, 0x10, 0, 1),
> +       PIN_FIELD_BASE(68, 68, 1, 0x00b0, 0x10, 2, 1),
> +       PIN_FIELD_BASE(69, 69, 1, 0x00a0, 0x10, 0, 1),
> +       PIN_FIELD_BASE(70, 70, 1, 0x00a0, 0x10, 6, 1),
> +       PIN_FIELD_BASE(71, 71, 1, 0x00a0, 0x10, 4, 1),
> +       PIN_FIELD_BASE(72, 72, 1, 0x00a0, 0x10, 5, 1),
> +       PIN_FIELD_BASE(73, 73, 1, 0x00a0, 0x10, 1, 1),
> +       PIN_FIELD_BASE(74, 74, 1, 0x00a0, 0x10, 2, 1),
> +       PIN_FIELD_BASE(75, 75, 1, 0x00a0, 0x10, 3, 1),
> +       PIN_FIELD_BASE(76, 76, 1, 0x00b0, 0x10, 11, 1),
> +       PIN_FIELD_BASE(97, 97, 3, 0x0070, 0x10, 0, 1),
> +       PIN_FIELD_BASE(98, 98, 3, 0x0070, 0x10, 4, 1),
> +       PIN_FIELD_BASE(99, 99, 3, 0x0070, 0x10, 3, 1),
> +       PIN_FIELD_BASE(100, 100, 3, 0x0070, 0x10, 6, 1),
> +       PIN_FIELD_BASE(101, 101, 3, 0x0070, 0x10, 5, 1),
> +       PIN_FIELD_BASE(102, 102, 3, 0x0070, 0x10, 8, 1),
> +       PIN_FIELD_BASE(103, 103, 3, 0x0070, 0x10, 7, 1),
> +       PIN_FIELD_BASE(108, 108, 3, 0x0070, 0x10, 2, 1),
> +       PIN_FIELD_BASE(109, 109, 3, 0x0070, 0x10, 1, 1),
> +       PIN_FIELD_BASE(128, 128, 3, 0x0070, 0x10, 11, 1),
> +       PIN_FIELD_BASE(129, 129, 3, 0x0070, 0x10, 9, 1),
> +       PIN_FIELD_BASE(130, 130, 3, 0x0070, 0x10, 12, 1),
> +       PIN_FIELD_BASE(131, 131, 3, 0x0070, 0x10, 10, 1),
> +       PIN_FIELD_BASE(132, 132, 6, 0x0060, 0x10, 1, 1),
> +       PIN_FIELD_BASE(133, 133, 6, 0x0060, 0x10, 0, 1),
> +       PIN_FIELD_BASE(134, 134, 6, 0x0060, 0x10, 3, 1),
> +       PIN_FIELD_BASE(135, 135, 6, 0x0060, 0x10, 2, 1),
> +       PIN_FIELD_BASE(136, 136, 1, 0x00b0, 0x10, 14, 1),
> +       PIN_FIELD_BASE(137, 137, 1, 0x00b0, 0x10, 13, 1),
> +       PIN_FIELD_BASE(138, 138, 1, 0x00b0, 0x10, 16, 1),
> +       PIN_FIELD_BASE(139, 139, 1, 0x00b0, 0x10, 15, 1),
> +       PIN_FIELD_BASE(140, 140, 1, 0x00b0, 0x10, 18, 1),
> +       PIN_FIELD_BASE(141, 141, 1, 0x00b0, 0x10, 17, 1),
> +       PIN_FIELD_BASE(142, 142, 1, 0x00b0, 0x10, 20, 1),
> +       PIN_FIELD_BASE(143, 143, 1, 0x00b0, 0x10, 19, 1),
> +};
> +
> +static const struct mtk_pin_field_calc mt8195_pin_pd_range[] = {
> +       PIN_FIELD_BASE(6, 6, 4, 0x0050, 0x10, 0, 1),
> +       PIN_FIELD_BASE(7, 7, 4, 0x0050, 0x10, 1, 1),
> +       PIN_FIELD_BASE(8, 8, 4, 0x0050, 0x10, 7, 1),
> +       PIN_FIELD_BASE(9, 9, 4, 0x0050, 0x10, 2, 1),
> +       PIN_FIELD_BASE(10, 10, 4, 0x0050, 0x10, 8, 1),
> +       PIN_FIELD_BASE(11, 11, 4, 0x0050, 0x10, 3, 1),
> +       PIN_FIELD_BASE(12, 12, 4, 0x0050, 0x10, 9, 1),
> +       PIN_FIELD_BASE(13, 13, 4, 0x0050, 0x10, 4, 1),
> +       PIN_FIELD_BASE(14, 14, 4, 0x0050, 0x10, 10, 1),
> +       PIN_FIELD_BASE(15, 15, 4, 0x0050, 0x10, 5, 1),
> +       PIN_FIELD_BASE(16, 16, 4, 0x0050, 0x10, 11, 1),
> +       PIN_FIELD_BASE(17, 17, 4, 0x0050, 0x10, 6, 1),
> +       PIN_FIELD_BASE(18, 18, 2, 0x0050, 0x10, 5, 1),
> +       PIN_FIELD_BASE(19, 19, 2, 0x0050, 0x10, 12, 1),
> +       PIN_FIELD_BASE(20, 20, 2, 0x0050, 0x10, 11, 1),
> +       PIN_FIELD_BASE(21, 21, 2, 0x0050, 0x10, 10, 1),
> +       PIN_FIELD_BASE(22, 22, 2, 0x0050, 0x10, 0, 1),
> +       PIN_FIELD_BASE(23, 23, 2, 0x0050, 0x10, 1, 1),
> +       PIN_FIELD_BASE(24, 24, 2, 0x0050, 0x10, 2, 1),
> +       PIN_FIELD_BASE(25, 25, 2, 0x0050, 0x10, 4, 1),
> +       PIN_FIELD_BASE(26, 26, 2, 0x0050, 0x10, 3, 1),
> +       PIN_FIELD_BASE(27, 27, 2, 0x0050, 0x10, 6, 1),
> +       PIN_FIELD_BASE(28, 28, 2, 0x0050, 0x10, 7, 1),
> +       PIN_FIELD_BASE(29, 29, 2, 0x0050, 0x10, 8, 1),
> +       PIN_FIELD_BASE(30, 30, 2, 0x0050, 0x10, 9, 1),
> +       PIN_FIELD_BASE(31, 31, 1, 0x0080, 0x10, 13, 1),
> +       PIN_FIELD_BASE(32, 32, 1, 0x0080, 0x10, 12, 1),
> +       PIN_FIELD_BASE(33, 33, 1, 0x0080, 0x10, 11, 1),
> +       PIN_FIELD_BASE(34, 34, 1, 0x0080, 0x10, 14, 1),
> +       PIN_FIELD_BASE(35, 35, 1, 0x0080, 0x10, 15, 1),
> +       PIN_FIELD_BASE(36, 36, 1, 0x0090, 0x10, 3, 1),
> +       PIN_FIELD_BASE(37, 37, 1, 0x0090, 0x10, 6, 1),
> +       PIN_FIELD_BASE(38, 38, 1, 0x0090, 0x10, 4, 1),
> +       PIN_FIELD_BASE(39, 39, 1, 0x0090, 0x10, 5, 1),
> +       PIN_FIELD_BASE(40, 40, 1, 0x0090, 0x10, 8, 1),
> +       PIN_FIELD_BASE(41, 41, 1, 0x0090, 0x10, 7, 1),
> +       PIN_FIELD_BASE(42, 42, 1, 0x0090, 0x10, 10, 1),
> +       PIN_FIELD_BASE(43, 43, 1, 0x0090, 0x10, 9, 1),
> +       PIN_FIELD_BASE(44, 44, 1, 0x0090, 0x10, 21, 1),
> +       PIN_FIELD_BASE(45, 45, 1, 0x0090, 0x10, 22, 1),
> +       PIN_FIELD_BASE(46, 46, 1, 0x0080, 0x10, 18, 1),
> +       PIN_FIELD_BASE(47, 47, 1, 0x0080, 0x10, 16, 1),
> +       PIN_FIELD_BASE(48, 48, 1, 0x0080, 0x10, 19, 1),
> +       PIN_FIELD_BASE(49, 49, 1, 0x0080, 0x10, 17, 1),
> +       PIN_FIELD_BASE(50, 50, 1, 0x0080, 0x10, 25, 1),
> +       PIN_FIELD_BASE(51, 51, 1, 0x0080, 0x10, 20, 1),
> +       PIN_FIELD_BASE(52, 52, 1, 0x0080, 0x10, 26, 1),
> +       PIN_FIELD_BASE(53, 53, 1, 0x0080, 0x10, 21, 1),
> +       PIN_FIELD_BASE(54, 54, 1, 0x0080, 0x10, 22, 1),
> +       PIN_FIELD_BASE(55, 55, 1, 0x0080, 0x10, 23, 1),
> +       PIN_FIELD_BASE(56, 56, 1, 0x0080, 0x10, 24, 1),
> +       PIN_FIELD_BASE(57, 57, 1, 0x0080, 0x10, 29, 1),
> +       PIN_FIELD_BASE(58, 58, 1, 0x0080, 0x10, 27, 1),
> +       PIN_FIELD_BASE(59, 59, 1, 0x0080, 0x10, 30, 1),
> +       PIN_FIELD_BASE(60, 60, 1, 0x0080, 0x10, 28, 1),
> +       PIN_FIELD_BASE(61, 61, 1, 0x0080, 0x10, 8, 1),
> +       PIN_FIELD_BASE(62, 62, 1, 0x0080, 0x10, 7, 1),
> +       PIN_FIELD_BASE(63, 63, 1, 0x0080, 0x10, 10, 1),
> +       PIN_FIELD_BASE(64, 64, 1, 0x0080, 0x10, 9, 1),
> +       PIN_FIELD_BASE(65, 65, 1, 0x0090, 0x10, 1, 1),
> +       PIN_FIELD_BASE(66, 66, 1, 0x0080, 0x10, 31, 1),
> +       PIN_FIELD_BASE(67, 67, 1, 0x0090, 0x10, 0, 1),
> +       PIN_FIELD_BASE(68, 68, 1, 0x0090, 0x10, 2, 1),
> +       PIN_FIELD_BASE(69, 69, 1, 0x0080, 0x10, 0, 1),
> +       PIN_FIELD_BASE(70, 70, 1, 0x0080, 0x10, 6, 1),
> +       PIN_FIELD_BASE(71, 71, 1, 0x0080, 0x10, 4, 1),
> +       PIN_FIELD_BASE(72, 72, 1, 0x0080, 0x10, 5, 1),
> +       PIN_FIELD_BASE(73, 73, 1, 0x0080, 0x10, 1, 1),
> +       PIN_FIELD_BASE(74, 74, 1, 0x0080, 0x10, 2, 1),
> +       PIN_FIELD_BASE(75, 75, 1, 0x0080, 0x10, 3, 1),
> +       PIN_FIELD_BASE(76, 76, 1, 0x0090, 0x10, 11, 1),
> +       PIN_FIELD_BASE(97, 97, 3, 0x0050, 0x10, 0, 1),
> +       PIN_FIELD_BASE(98, 98, 3, 0x0050, 0x10, 4, 1),
> +       PIN_FIELD_BASE(99, 99, 3, 0x0050, 0x10, 3, 1),
> +       PIN_FIELD_BASE(100, 100, 3, 0x0050, 0x10, 6, 1),
> +       PIN_FIELD_BASE(101, 101, 3, 0x0050, 0x10, 5, 1),
> +       PIN_FIELD_BASE(102, 102, 3, 0x0050, 0x10, 8, 1),
> +       PIN_FIELD_BASE(103, 103, 3, 0x0050, 0x10, 7, 1),
> +       PIN_FIELD_BASE(108, 108, 3, 0x0050, 0x10, 2, 1),
> +       PIN_FIELD_BASE(109, 109, 3, 0x0050, 0x10, 1, 1),
> +       PIN_FIELD_BASE(128, 128, 3, 0x0050, 0x10, 11, 1),
> +       PIN_FIELD_BASE(129, 129, 3, 0x0050, 0x10, 9, 1),
> +       PIN_FIELD_BASE(130, 130, 3, 0x0050, 0x10, 12, 1),
> +       PIN_FIELD_BASE(131, 131, 3, 0x0050, 0x10, 10, 1),
> +       PIN_FIELD_BASE(132, 132, 6, 0x0040, 0x10, 1, 1),
> +       PIN_FIELD_BASE(133, 133, 6, 0x0040, 0x10, 0, 1),
> +       PIN_FIELD_BASE(134, 134, 6, 0x0040, 0x10, 3, 1),
> +       PIN_FIELD_BASE(135, 135, 6, 0x0040, 0x10, 2, 1),
> +       PIN_FIELD_BASE(136, 136, 1, 0x0090, 0x10, 14, 1),
> +       PIN_FIELD_BASE(137, 137, 1, 0x0090, 0x10, 13, 1),
> +       PIN_FIELD_BASE(138, 138, 1, 0x0090, 0x10, 16, 1),
> +       PIN_FIELD_BASE(139, 139, 1, 0x0090, 0x10, 15, 1),
> +       PIN_FIELD_BASE(140, 140, 1, 0x0090, 0x10, 18, 1),
> +       PIN_FIELD_BASE(141, 141, 1, 0x0090, 0x10, 17, 1),
> +       PIN_FIELD_BASE(142, 142, 1, 0x0090, 0x10, 20, 1),
> +       PIN_FIELD_BASE(143, 143, 1, 0x0090, 0x10, 19, 1),
> +};
> +
> +static const struct mtk_pin_field_calc mt8195_pin_pupd_range[] = {
> +       PIN_FIELD_BASE(0, 0, 4, 0x0060, 0x10, 0, 1),
> +       PIN_FIELD_BASE(1, 1, 4, 0x0060, 0x10, 1, 1),
> +       PIN_FIELD_BASE(2, 2, 4, 0x0060, 0x10, 2, 1),
> +       PIN_FIELD_BASE(3, 3, 4, 0x0060, 0x10, 3, 1),
> +       PIN_FIELD_BASE(4, 4, 4, 0x0060, 0x10, 4, 1),
> +       PIN_FIELD_BASE(5, 5, 4, 0x0060, 0x10, 5, 1),
> +       PIN_FIELD_BASE(77, 77, 3, 0x0060, 0x10, 1, 1),
> +       PIN_FIELD_BASE(78, 78, 3, 0x0060, 0x10, 2, 1),
> +       PIN_FIELD_BASE(79, 79, 3, 0x0060, 0x10, 9, 1),
> +       PIN_FIELD_BASE(80, 80, 3, 0x0060, 0x10, 10, 1),
> +       PIN_FIELD_BASE(81, 81, 3, 0x0060, 0x10, 11, 1),
> +       PIN_FIELD_BASE(82, 82, 3, 0x0060, 0x10, 12, 1),
> +       PIN_FIELD_BASE(83, 83, 3, 0x0060, 0x10, 13, 1),
> +       PIN_FIELD_BASE(84, 84, 3, 0x0060, 0x10, 14, 1),
> +       PIN_FIELD_BASE(85, 85, 3, 0x0060, 0x10, 15, 1),
> +       PIN_FIELD_BASE(86, 86, 3, 0x0060, 0x10, 16, 1),
> +       PIN_FIELD_BASE(87, 87, 3, 0x0060, 0x10, 3, 1),
> +       PIN_FIELD_BASE(88, 88, 3, 0x0060, 0x10, 4, 1),
> +       PIN_FIELD_BASE(89, 89, 3, 0x0060, 0x10, 5, 1),
> +       PIN_FIELD_BASE(90, 90, 3, 0x0060, 0x10, 6, 1),
> +       PIN_FIELD_BASE(91, 91, 3, 0x0060, 0x10, 7, 1),
> +       PIN_FIELD_BASE(92, 92, 3, 0x0060, 0x10, 8, 1),
> +       PIN_FIELD_BASE(93, 93, 3, 0x0060, 0x10, 18, 1),
> +       PIN_FIELD_BASE(94, 94, 3, 0x0060, 0x10, 19, 1),
> +       PIN_FIELD_BASE(95, 95, 3, 0x0060, 0x10, 17, 1),
> +       PIN_FIELD_BASE(96, 96, 3, 0x0060, 0x10, 0, 1),
> +       PIN_FIELD_BASE(104, 104, 3, 0x0060, 0x10, 22, 1),
> +       PIN_FIELD_BASE(105, 105, 3, 0x0060, 0x10, 23, 1),
> +       PIN_FIELD_BASE(106, 106, 3, 0x0060, 0x10, 20, 1),
> +       PIN_FIELD_BASE(107, 107, 3, 0x0060, 0x10, 21, 1),
> +       PIN_FIELD_BASE(110, 110, 5, 0x0020, 0x10, 1, 1),
> +       PIN_FIELD_BASE(111, 111, 5, 0x0020, 0x10, 0, 1),
> +       PIN_FIELD_BASE(112, 112, 5, 0x0020, 0x10, 2, 1),
> +       PIN_FIELD_BASE(113, 113, 5, 0x0020, 0x10, 3, 1),
> +       PIN_FIELD_BASE(114, 114, 5, 0x0020, 0x10, 4, 1),
> +       PIN_FIELD_BASE(115, 115, 5, 0x0020, 0x10, 5, 1),
> +       PIN_FIELD_BASE(116, 116, 6, 0x0050, 0x10, 9, 1),
> +       PIN_FIELD_BASE(117, 117, 6, 0x0050, 0x10, 8, 1),
> +       PIN_FIELD_BASE(118, 118, 6, 0x0050, 0x10, 7, 1),
> +       PIN_FIELD_BASE(119, 119, 6, 0x0050, 0x10, 6, 1),
> +       PIN_FIELD_BASE(120, 120, 6, 0x0050, 0x10, 11, 1),
> +       PIN_FIELD_BASE(121, 121, 6, 0x0050, 0x10, 1, 1),
> +       PIN_FIELD_BASE(122, 122, 6, 0x0050, 0x10, 0, 1),
> +       PIN_FIELD_BASE(123, 123, 6, 0x0050, 0x10, 5, 1),
> +       PIN_FIELD_BASE(124, 124, 6, 0x0050, 0x10, 4, 1),
> +       PIN_FIELD_BASE(125, 125, 6, 0x0050, 0x10, 3, 1),
> +       PIN_FIELD_BASE(126, 126, 6, 0x0050, 0x10, 2, 1),
> +       PIN_FIELD_BASE(127, 127, 6, 0x0050, 0x10, 10, 1),
> +};
> +
> +static const struct mtk_pin_field_calc mt8195_pin_r0_range[] = {
> +       PIN_FIELD_BASE(0, 0, 4, 0x0080, 0x10, 0, 1),
> +       PIN_FIELD_BASE(1, 1, 4, 0x0080, 0x10, 1, 1),
> +       PIN_FIELD_BASE(2, 2, 4, 0x0080, 0x10, 2, 1),
> +       PIN_FIELD_BASE(3, 3, 4, 0x0080, 0x10, 3, 1),
> +       PIN_FIELD_BASE(4, 4, 4, 0x0080, 0x10, 4, 1),
> +       PIN_FIELD_BASE(5, 5, 4, 0x0080, 0x10, 5, 1),
> +       PIN_FIELD_BASE(77, 77, 3, 0x0080, 0x10, 1, 1),
> +       PIN_FIELD_BASE(78, 78, 3, 0x0080, 0x10, 2, 1),
> +       PIN_FIELD_BASE(79, 79, 3, 0x0080, 0x10, 9, 1),
> +       PIN_FIELD_BASE(80, 80, 3, 0x0080, 0x10, 10, 1),
> +       PIN_FIELD_BASE(81, 81, 3, 0x0080, 0x10, 11, 1),
> +       PIN_FIELD_BASE(82, 82, 3, 0x0080, 0x10, 12, 1),
> +       PIN_FIELD_BASE(83, 83, 3, 0x0080, 0x10, 13, 1),
> +       PIN_FIELD_BASE(84, 84, 3, 0x0080, 0x10, 14, 1),
> +       PIN_FIELD_BASE(85, 85, 3, 0x0080, 0x10, 15, 1),
> +       PIN_FIELD_BASE(86, 86, 3, 0x0080, 0x10, 16, 1),
> +       PIN_FIELD_BASE(87, 87, 3, 0x0080, 0x10, 3, 1),
> +       PIN_FIELD_BASE(88, 88, 3, 0x0080, 0x10, 4, 1),
> +       PIN_FIELD_BASE(89, 89, 3, 0x0080, 0x10, 5, 1),
> +       PIN_FIELD_BASE(90, 90, 3, 0x0080, 0x10, 6, 1),
> +       PIN_FIELD_BASE(91, 91, 3, 0x0080, 0x10, 7, 1),
> +       PIN_FIELD_BASE(92, 92, 3, 0x0080, 0x10, 8, 1),
> +       PIN_FIELD_BASE(93, 93, 3, 0x0080, 0x10, 18, 1),
> +       PIN_FIELD_BASE(94, 94, 3, 0x0080, 0x10, 19, 1),
> +       PIN_FIELD_BASE(95, 95, 3, 0x0080, 0x10, 17, 1),
> +       PIN_FIELD_BASE(96, 96, 3, 0x0080, 0x10, 0, 1),
> +       PIN_FIELD_BASE(104, 104, 3, 0x0080, 0x10, 22, 1),
> +       PIN_FIELD_BASE(105, 105, 3, 0x0080, 0x10, 23, 1),
> +       PIN_FIELD_BASE(106, 106, 3, 0x0080, 0x10, 20, 1),
> +       PIN_FIELD_BASE(107, 107, 3, 0x0080, 0x10, 21, 1),
> +       PIN_FIELD_BASE(110, 110, 5, 0x0030, 0x10, 1, 1),
> +       PIN_FIELD_BASE(111, 111, 5, 0x0030, 0x10, 0, 1),
> +       PIN_FIELD_BASE(112, 112, 5, 0x0030, 0x10, 2, 1),
> +       PIN_FIELD_BASE(113, 113, 5, 0x0030, 0x10, 3, 1),
> +       PIN_FIELD_BASE(114, 114, 5, 0x0030, 0x10, 4, 1),
> +       PIN_FIELD_BASE(115, 115, 5, 0x0030, 0x10, 5, 1),
> +       PIN_FIELD_BASE(116, 116, 6, 0x0070, 0x10, 9, 1),
> +       PIN_FIELD_BASE(117, 117, 6, 0x0070, 0x10, 8, 1),
> +       PIN_FIELD_BASE(118, 118, 6, 0x0070, 0x10, 7, 1),
> +       PIN_FIELD_BASE(119, 119, 6, 0x0070, 0x10, 6, 1),
> +       PIN_FIELD_BASE(120, 120, 6, 0x0070, 0x10, 11, 1),
> +       PIN_FIELD_BASE(121, 121, 6, 0x0070, 0x10, 1, 1),
> +       PIN_FIELD_BASE(122, 122, 6, 0x0070, 0x10, 0, 1),
> +       PIN_FIELD_BASE(123, 123, 6, 0x0070, 0x10, 5, 1),
> +       PIN_FIELD_BASE(124, 124, 6, 0x0070, 0x10, 4, 1),
> +       PIN_FIELD_BASE(125, 125, 6, 0x0070, 0x10, 3, 1),
> +       PIN_FIELD_BASE(126, 126, 6, 0x0070, 0x10, 2, 1),
> +       PIN_FIELD_BASE(127, 127, 6, 0x0070, 0x10, 10, 1),
> +};
> +
> +static const struct mtk_pin_field_calc mt8195_pin_r1_range[] = {
> +       PIN_FIELD_BASE(0, 0, 4, 0x0090, 0x10, 0, 1),
> +       PIN_FIELD_BASE(1, 1, 4, 0x0090, 0x10, 1, 1),
> +       PIN_FIELD_BASE(2, 2, 4, 0x0090, 0x10, 2, 1),
> +       PIN_FIELD_BASE(3, 3, 4, 0x0090, 0x10, 3, 1),
> +       PIN_FIELD_BASE(4, 4, 4, 0x0090, 0x10, 4, 1),
> +       PIN_FIELD_BASE(5, 5, 4, 0x0090, 0x10, 5, 1),
> +       PIN_FIELD_BASE(77, 77, 3, 0x0090, 0x10, 1, 1),
> +       PIN_FIELD_BASE(78, 78, 3, 0x0090, 0x10, 2, 1),
> +       PIN_FIELD_BASE(79, 79, 3, 0x0090, 0x10, 9, 1),
> +       PIN_FIELD_BASE(80, 80, 3, 0x0090, 0x10, 10, 1),
> +       PIN_FIELD_BASE(81, 81, 3, 0x0090, 0x10, 11, 1),
> +       PIN_FIELD_BASE(82, 82, 3, 0x0090, 0x10, 12, 1),
> +       PIN_FIELD_BASE(83, 83, 3, 0x0090, 0x10, 13, 1),
> +       PIN_FIELD_BASE(84, 84, 3, 0x0090, 0x10, 14, 1),
> +       PIN_FIELD_BASE(85, 85, 3, 0x0090, 0x10, 15, 1),
> +       PIN_FIELD_BASE(86, 86, 3, 0x0090, 0x10, 16, 1),
> +       PIN_FIELD_BASE(87, 87, 3, 0x0090, 0x10, 3, 1),
> +       PIN_FIELD_BASE(88, 88, 3, 0x0090, 0x10, 4, 1),
> +       PIN_FIELD_BASE(89, 89, 3, 0x0090, 0x10, 5, 1),
> +       PIN_FIELD_BASE(90, 90, 3, 0x0090, 0x10, 6, 1),
> +       PIN_FIELD_BASE(91, 91, 3, 0x0090, 0x10, 7, 1),
> +       PIN_FIELD_BASE(92, 92, 3, 0x0090, 0x10, 8, 1),
> +       PIN_FIELD_BASE(93, 93, 3, 0x0090, 0x10, 18, 1),
> +       PIN_FIELD_BASE(94, 94, 3, 0x0090, 0x10, 19, 1),
> +       PIN_FIELD_BASE(95, 95, 3, 0x0090, 0x10, 17, 1),
> +       PIN_FIELD_BASE(96, 96, 3, 0x0090, 0x10, 0, 1),
> +       PIN_FIELD_BASE(104, 104, 3, 0x0090, 0x10, 22, 1),
> +       PIN_FIELD_BASE(105, 105, 3, 0x0090, 0x10, 23, 1),
> +       PIN_FIELD_BASE(106, 106, 3, 0x0090, 0x10, 20, 1),
> +       PIN_FIELD_BASE(107, 107, 3, 0x0090, 0x10, 21, 1),
> +       PIN_FIELD_BASE(110, 110, 5, 0x0040, 0x10, 1, 1),
> +       PIN_FIELD_BASE(111, 111, 5, 0x0040, 0x10, 0, 1),
> +       PIN_FIELD_BASE(112, 112, 5, 0x0040, 0x10, 2, 1),
> +       PIN_FIELD_BASE(113, 113, 5, 0x0040, 0x10, 3, 1),
> +       PIN_FIELD_BASE(114, 114, 5, 0x0040, 0x10, 4, 1),
> +       PIN_FIELD_BASE(115, 115, 5, 0x0040, 0x10, 5, 1),
> +       PIN_FIELD_BASE(116, 116, 6, 0x0080, 0x10, 9, 1),
> +       PIN_FIELD_BASE(117, 117, 6, 0x0080, 0x10, 8, 1),
> +       PIN_FIELD_BASE(118, 118, 6, 0x0080, 0x10, 7, 1),
> +       PIN_FIELD_BASE(119, 119, 6, 0x0080, 0x10, 6, 1),
> +       PIN_FIELD_BASE(120, 120, 6, 0x0080, 0x10, 11, 1),
> +       PIN_FIELD_BASE(121, 121, 6, 0x0080, 0x10, 1, 1),
> +       PIN_FIELD_BASE(122, 122, 6, 0x0080, 0x10, 0, 1),
> +       PIN_FIELD_BASE(123, 123, 6, 0x0080, 0x10, 5, 1),
> +       PIN_FIELD_BASE(124, 124, 6, 0x0080, 0x10, 4, 1),
> +       PIN_FIELD_BASE(125, 125, 6, 0x0080, 0x10, 3, 1),
> +       PIN_FIELD_BASE(126, 126, 6, 0x0080, 0x10, 2, 1),
> +       PIN_FIELD_BASE(127, 127, 6, 0x0080, 0x10, 10, 1),
> +};
> +
> +static const struct mtk_pin_field_calc mt8195_pin_drv_range[] = {
> +       PIN_FIELD_BASE(0, 0, 4, 0x000, 0x10, 0, 3),
> +       PIN_FIELD_BASE(1, 1, 4, 0x000, 0x10, 3, 3),
> +       PIN_FIELD_BASE(2, 2, 4, 0x000, 0x10, 6, 3),
> +       PIN_FIELD_BASE(3, 3, 4, 0x000, 0x10, 9, 3),
> +       PIN_FIELD_BASE(4, 4, 4, 0x000, 0x10, 12, 3),
> +       PIN_FIELD_BASE(5, 5, 4, 0x000, 0x10, 15, 3),
> +       PINS_FIELD_BASE(6, 7, 4, 0x000, 0x10, 18, 3),
> +       PIN_FIELD_BASE(8, 8, 4, 0x010, 0x10, 6, 3),
> +       PIN_FIELD_BASE(9, 9, 4, 0x000, 0x10, 21, 3),
> +       PIN_FIELD_BASE(10, 10, 4, 0x010, 0x10, 9, 3),
> +       PIN_FIELD_BASE(11, 11, 4, 0x000, 0x10, 24, 3),
> +       PIN_FIELD_BASE(12, 12, 4, 0x010, 0x10, 12, 3),
> +       PIN_FIELD_BASE(13, 13, 4, 0x010, 0x10, 27, 3),
> +       PIN_FIELD_BASE(14, 14, 4, 0x010, 0x10, 15, 3),
> +       PIN_FIELD_BASE(15, 15, 4, 0x010, 0x10, 0, 3),
> +       PIN_FIELD_BASE(16, 16, 4, 0x010, 0x10, 18, 3),
> +       PIN_FIELD_BASE(17, 17, 4, 0x010, 0x10, 3, 3),
> +       PIN_FIELD_BASE(18, 18, 2, 0x010, 0x10, 6, 3),
> +       PIN_FIELD_BASE(19, 19, 2, 0x010, 0x10, 3, 3),
> +       PIN_FIELD_BASE(20, 20, 2, 0x010, 0x10, 0, 3),
> +       PIN_FIELD_BASE(21, 21, 2, 0x000, 0x10, 27, 3),
> +       PIN_FIELD_BASE(22, 22, 2, 0x000, 0x10, 0, 3),
> +       PIN_FIELD_BASE(23, 23, 2, 0x000, 0x10, 3, 3),
> +       PIN_FIELD_BASE(24, 24, 2, 0x000, 0x10, 6, 3),
> +       PIN_FIELD_BASE(25, 25, 2, 0x000, 0x10, 12, 3),
> +       PIN_FIELD_BASE(26, 26, 2, 0x000, 0x10, 9, 3),
> +       PIN_FIELD_BASE(27, 27, 2, 0x000, 0x10, 15, 3),
> +       PIN_FIELD_BASE(28, 28, 2, 0x000, 0x10, 18, 3),
> +       PIN_FIELD_BASE(29, 29, 2, 0x000, 0x10, 21, 3),
> +       PIN_FIELD_BASE(30, 30, 2, 0x000, 0x10, 24, 3),
> +       PINS_FIELD_BASE(31, 33, 1, 0x010, 0x10, 0, 3),
> +       PIN_FIELD_BASE(34, 34, 1, 0x000, 0x10, 21, 3),
> +       PIN_FIELD_BASE(35, 35, 1, 0x000, 0x10, 24, 3),
> +       PIN_FIELD_BASE(36, 36, 1, 0x010, 0x10, 0, 3),
> +       PIN_FIELD_BASE(37, 37, 1, 0x010, 0x10, 21, 3),
> +       PINS_FIELD_BASE(38, 39, 1, 0x010, 0x10, 3, 3),
> +       PIN_FIELD_BASE(40, 40, 1, 0x010, 0x10, 27, 3),
> +       PIN_FIELD_BASE(41, 41, 1, 0x010, 0x10, 24, 3),
> +       PIN_FIELD_BASE(42, 42, 1, 0x020, 0x10, 3, 3),
> +       PIN_FIELD_BASE(43, 43, 1, 0x020, 0x10, 0, 3),
> +       PIN_FIELD_BASE(44, 44, 1, 0x030, 0x10, 0, 3),
> +       PIN_FIELD_BASE(45, 45, 1, 0x030, 0x10, 3, 3),
> +       PINS_FIELD_BASE(46, 47, 1, 0x010, 0x10, 3, 3),
> +       PINS_FIELD_BASE(48, 51, 1, 0x010, 0x10, 6, 3),
> +       PINS_FIELD_BASE(52, 55, 1, 0x010, 0x10, 9, 3),
> +       PINS_FIELD_BASE(56, 59, 1, 0x010, 0x10, 12, 3),
> +       PINS_FIELD_BASE(60, 63, 1, 0x010, 0x10, 15, 3),
> +       PIN_FIELD_BASE(64, 64, 1, 0x010, 0x10, 18, 3),
> +       PINS_FIELD_BASE(65, 68, 1, 0x000, 0x10, 27, 3),
> +       PIN_FIELD_BASE(69, 69, 1, 0x000, 0x10, 0, 3),
> +       PIN_FIELD_BASE(70, 70, 1, 0x000, 0x10, 18, 3),
> +       PIN_FIELD_BASE(71, 71, 1, 0x000, 0x10, 12, 3),
> +       PIN_FIELD_BASE(72, 72, 1, 0x000, 0x10, 15, 3),
> +       PIN_FIELD_BASE(73, 73, 1, 0x000, 0x10, 3, 3),
> +       PIN_FIELD_BASE(74, 74, 1, 0x000, 0x10, 6, 3),
> +       PIN_FIELD_BASE(75, 75, 1, 0x000, 0x10, 9, 3),
> +       PIN_FIELD_BASE(76, 76, 1, 0x010, 0x10, 18, 3),
> +       PIN_FIELD_BASE(77, 77, 3, 0x000, 0x10, 0, 3),
> +       PIN_FIELD_BASE(78, 78, 3, 0x000, 0x10, 15, 3),
> +       PIN_FIELD_BASE(79, 79, 3, 0x000, 0x10, 18, 3),
> +       PIN_FIELD_BASE(80, 80, 3, 0x000, 0x10, 21, 3),
> +       PIN_FIELD_BASE(81, 81, 3, 0x000, 0x10, 28, 3),
> +       PIN_FIELD_BASE(82, 82, 3, 0x000, 0x10, 27, 3),
> +       PIN_FIELD_BASE(83, 83, 3, 0x010, 0x10, 0, 3),
> +       PIN_FIELD_BASE(84, 84, 3, 0x010, 0x10, 3, 3),
> +       PINS_FIELD_BASE(85, 88, 3, 0x010, 0x10, 15, 3),
> +       PIN_FIELD_BASE(89, 89, 3, 0x000, 0x10, 3, 3),
> +       PIN_FIELD_BASE(90, 90, 3, 0x000, 0x10, 6, 3),
> +       PIN_FIELD_BASE(91, 91, 3, 0x000, 0x10, 9, 3),
> +       PIN_FIELD_BASE(92, 92, 3, 0x000, 0x10, 12, 3),
> +       PIN_FIELD_BASE(93, 93, 3, 0x010, 0x10, 6, 3),
> +       PIN_FIELD_BASE(94, 94, 3, 0x010, 0x10, 9, 3),
> +       PINS_FIELD_BASE(95, 98, 3, 0x010, 0x10, 18, 3),
> +       PINS_FIELD_BASE(99, 102, 3, 0x010, 0x10, 21, 3),
> +       PINS_FIELD_BASE(103, 104, 3, 0x010, 0x10, 24, 3),
> +       PIN_FIELD_BASE(105, 105, 3, 0x010, 0x10, 27, 3),
> +       PINS_FIELD_BASE(106, 107, 3, 0x010, 0x10, 24, 3),
> +       PINS_FIELD_BASE(108, 109, 3, 0x010, 0x10, 27, 3),
> +       PIN_FIELD_BASE(110, 110, 5, 0x000, 0x10, 3, 3),
> +       PIN_FIELD_BASE(111, 111, 5, 0x000, 0x10, 0, 3),
> +       PIN_FIELD_BASE(112, 112, 5, 0x000, 0x10, 6, 3),
> +       PIN_FIELD_BASE(113, 113, 5, 0x000, 0x10, 9, 3),
> +       PIN_FIELD_BASE(114, 114, 5, 0x000, 0x10, 12, 3),
> +       PIN_FIELD_BASE(115, 115, 5, 0x000, 0x10, 15, 3),
> +       PIN_FIELD_BASE(116, 116, 6, 0x000, 0x10, 27, 3),
> +       PIN_FIELD_BASE(117, 117, 6, 0x000, 0x10, 24, 3),
> +       PIN_FIELD_BASE(118, 118, 6, 0x000, 0x10, 21, 3),
> +       PIN_FIELD_BASE(119, 119, 6, 0x000, 0x10, 18, 3),
> +       PIN_FIELD_BASE(120, 120, 6, 0x010, 0x10, 3, 3),
> +       PIN_FIELD_BASE(121, 121, 6, 0x000, 0x10, 3, 3),
> +       PIN_FIELD_BASE(122, 122, 6, 0x000, 0x10, 0, 3),
> +       PIN_FIELD_BASE(123, 123, 6, 0x000, 0x10, 15, 3),
> +       PIN_FIELD_BASE(124, 124, 6, 0x000, 0x10, 12, 3),
> +       PIN_FIELD_BASE(125, 125, 6, 0x000, 0x10, 9, 3),
> +       PIN_FIELD_BASE(126, 126, 6, 0x000, 0x10, 6, 3),
> +       PIN_FIELD_BASE(127, 127, 6, 0x010, 0x10, 0, 3),
> +       PIN_FIELD_BASE(128, 128, 3, 0x010, 0x10, 27, 3),
> +       PINS_FIELD_BASE(129, 130, 3, 0x020, 0x10, 0, 3),
> +       PINS_FIELD_BASE(131, 131, 3, 0x010, 0x10, 12, 3),
> +       PIN_FIELD_BASE(132, 132, 6, 0x010, 0x10, 9, 3),
> +       PIN_FIELD_BASE(133, 133, 6, 0x010, 0x10, 6, 3),
> +       PIN_FIELD_BASE(134, 134, 6, 0x010, 0x10, 15, 3),
> +       PIN_FIELD_BASE(135, 135, 6, 0x010, 0x10, 12, 3),
> +       PIN_FIELD_BASE(136, 136, 1, 0x020, 0x10, 9, 3),
> +       PIN_FIELD_BASE(137, 137, 1, 0x020, 0x10, 6, 3),
> +       PIN_FIELD_BASE(138, 138, 1, 0x020, 0x10, 15, 3),
> +       PIN_FIELD_BASE(139, 139, 1, 0x020, 0x10, 12, 3),
> +       PIN_FIELD_BASE(140, 140, 1, 0x020, 0x10, 21, 3),
> +       PIN_FIELD_BASE(141, 141, 1, 0x020, 0x10, 18, 3),
> +       PIN_FIELD_BASE(142, 142, 1, 0x020, 0x10, 27, 3),
> +       PIN_FIELD_BASE(143, 143, 1, 0x020, 0x10, 24, 3),
> +};
> +
> +static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
> +       [PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8195_pin_mode_range),
> +       [PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8195_pin_dir_range),
> +       [PINCTRL_PIN_REG_DI] = MTK_RANGE(mt8195_pin_di_range),
> +       [PINCTRL_PIN_REG_DO] = MTK_RANGE(mt8195_pin_do_range),
> +       [PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt8195_pin_smt_range),
> +       [PINCTRL_PIN_REG_IES] = MTK_RANGE(mt8195_pin_ies_range),
> +       [PINCTRL_PIN_REG_PU] = MTK_RANGE(mt8195_pin_pu_range),
> +       [PINCTRL_PIN_REG_PD] = MTK_RANGE(mt8195_pin_pd_range),
> +       [PINCTRL_PIN_REG_DRV] = MTK_RANGE(mt8195_pin_drv_range),
> +       [PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt8195_pin_pupd_range),
> +       [PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8195_pin_r0_range),
> +       [PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8195_pin_r1_range),
> +};
> +
> +static const char * const mt8195_pinctrl_register_base_names[] = {
> +       "iocfg0", "iocfg_bm", "iocfg_bl", "iocfg_br", "iocfg_lm",
> +       "iocfg_rb", "iocfg_tl",
> +};
> +
> +static const struct mtk_eint_hw mt8195_eint_hw = {
> +       .port_mask = 0xf,
> +       .ports     = 7,
> +       .ap_num    = 225,
> +       .db_cnt    = 32,
> +};
> +
> +static const struct mtk_pin_soc mt8195_data = {
> +       .reg_cal = mt8195_reg_cals,
> +       .pins = mtk_pins_mt8195,
> +       .npins = ARRAY_SIZE(mtk_pins_mt8195),
> +       .ngrps = ARRAY_SIZE(mtk_pins_mt8195),
> +       .eint_hw = &mt8195_eint_hw,
> +       .nfuncs = 8,
> +       .gpio_m = 0,
> +       .base_names = mt8195_pinctrl_register_base_names,
> +       .nbase_names = ARRAY_SIZE(mt8195_pinctrl_register_base_names),
> +       .bias_set_combo = mtk_pinconf_bias_set_combo,
> +       .bias_get_combo = mtk_pinconf_bias_get_combo,
> +       .drive_set = mtk_pinconf_drive_set_rev1,
> +       .drive_get = mtk_pinconf_drive_get_rev1,
> +};
> +
> +static const struct of_device_id mt8195_pinctrl_of_match[] = {
> +       { .compatible = "mediatek,mt8195-pinctrl", },
> +       { }
> +};
> +
> +static int mt8195_pinctrl_probe(struct platform_device *pdev)
> +{
> +       return mtk_paris_pinctrl_probe(pdev, &mt8195_data);
> +}
> +
> +static struct platform_driver mt8195_pinctrl_driver = {
> +       .driver = {
> +               .name = "mt8195-pinctrl",
> +               .of_match_table = mt8195_pinctrl_of_match,
> +       },
> +       .probe = mt8195_pinctrl_probe,
> +};
> +
> +static int __init mt8195_pinctrl_init(void)
> +{
> +       return platform_driver_register(&mt8195_pinctrl_driver);
> +}
> +arch_initcall(mt8195_pinctrl_init);
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h
> new file mode 100644
> index 000000000000..de4a8a80bf1d
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h
> @@ -0,0 +1,1669 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 MediaTek Inc.
> + *
> + * Author: Zhiyong Tao <zhiyong.tao@mediatek.com>
> + *
> + */
> +
> +#ifndef __PINCTRL_MTK_MT8195_H
> +#define __PINCTRL_MTK_MT8195_H
> +
> +#include "pinctrl-paris.h"
> +
> +static const struct mtk_pin_desc mtk_pins_mt8195[] = {
> +       MTK_PIN(
> +               0, "GPIO0",
> +               MTK_EINT_FUNCTION(0, 0),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO0"),
> +               MTK_FUNCTION(1, "TP_GPIO0_AO"),
> +               MTK_FUNCTION(2, "MSDC2_CMD"),
> +               MTK_FUNCTION(3, "TDMIN_MCK"),
> +               MTK_FUNCTION(4, "CLKM0"),
> +               MTK_FUNCTION(5, "PERSTN_1"),
> +               MTK_FUNCTION(6, "IDDIG_1P"),
> +               MTK_FUNCTION(7, "DMIC4_CLK")
> +       ),
> +       MTK_PIN(
> +               1, "GPIO1",
> +               MTK_EINT_FUNCTION(0, 1),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO1"),
> +               MTK_FUNCTION(1, "TP_GPIO1_AO"),
> +               MTK_FUNCTION(2, "MSDC2_CLK"),
> +               MTK_FUNCTION(3, "TDMIN_DI"),
> +               MTK_FUNCTION(4, "CLKM1"),
> +               MTK_FUNCTION(5, "CLKREQN_1"),
> +               MTK_FUNCTION(6, "USB_DRVVBUS_1P"),
> +               MTK_FUNCTION(7, "DMIC4_DAT")
> +       ),
> +       MTK_PIN(
> +               2, "GPIO2",
> +               MTK_EINT_FUNCTION(0, 2),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO2"),
> +               MTK_FUNCTION(1, "TP_GPIO2_AO"),
> +               MTK_FUNCTION(2, "MSDC2_DAT3"),
> +               MTK_FUNCTION(3, "TDMIN_LRCK"),
> +               MTK_FUNCTION(4, "CLKM2"),
> +               MTK_FUNCTION(5, "WAKEN_1"),
> +               MTK_FUNCTION(7, "DMIC2_CLK")
> +       ),
> +       MTK_PIN(
> +               3, "GPIO3",
> +               MTK_EINT_FUNCTION(0, 3),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO3"),
> +               MTK_FUNCTION(1, "TP_GPIO3_AO"),
> +               MTK_FUNCTION(2, "MSDC2_DAT0"),
> +               MTK_FUNCTION(3, "TDMIN_BCK"),
> +               MTK_FUNCTION(4, "CLKM3"),
> +               MTK_FUNCTION(7, "DMIC2_DAT")
> +       ),
> +       MTK_PIN(
> +               4, "GPIO4",
> +               MTK_EINT_FUNCTION(0, 4),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO4"),
> +               MTK_FUNCTION(1, "TP_GPIO4_AO"),
> +               MTK_FUNCTION(2, "MSDC2_DAT2"),
> +               MTK_FUNCTION(3, "SPDIF_IN1"),
> +               MTK_FUNCTION(4, "UTXD3"),
> +               MTK_FUNCTION(5, "SDA2"),
> +               MTK_FUNCTION(7, "IDDIG_2P")
> +       ),
> +       MTK_PIN(
> +               5, "GPIO5",
> +               MTK_EINT_FUNCTION(0, 5),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO5"),
> +               MTK_FUNCTION(1, "TP_GPIO5_AO"),
> +               MTK_FUNCTION(2, "MSDC2_DAT1"),
> +               MTK_FUNCTION(3, "SPDIF_IN0"),
> +               MTK_FUNCTION(4, "URXD3"),
> +               MTK_FUNCTION(5, "SCL2"),
> +               MTK_FUNCTION(7, "USB_DRVVBUS_2P")
> +       ),
> +       MTK_PIN(
> +               6, "GPIO6",
> +               MTK_EINT_FUNCTION(0, 6),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO6"),
> +               MTK_FUNCTION(1, "TP_GPIO6_AO"),
> +               MTK_FUNCTION(2, "DP_TX_HPD"),
> +               MTK_FUNCTION(3, "I2SO1_D4"),
> +               MTK_FUNCTION(4, "UTXD4"),
> +               MTK_FUNCTION(5, "CMVREF3"),
> +               MTK_FUNCTION(7, "DMIC3_CLK")
> +       ),
> +       MTK_PIN(
> +               7, "GPIO7",
> +               MTK_EINT_FUNCTION(0, 7),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO7"),
> +               MTK_FUNCTION(1, "TP_GPIO7_AO"),
> +               MTK_FUNCTION(2, "EDP_TX_HPD"),
> +               MTK_FUNCTION(3, "I2SO1_D5"),
> +               MTK_FUNCTION(4, "URXD4"),
> +               MTK_FUNCTION(5, "CMVREF4"),
> +               MTK_FUNCTION(7, "DMIC3_DAT")
> +       ),
> +       MTK_PIN(
> +               8, "GPIO8",
> +               MTK_EINT_FUNCTION(0, 8),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO8"),
> +               MTK_FUNCTION(1, "SDA0"),
> +               MTK_FUNCTION(2, "PWM_0"),
> +               MTK_FUNCTION(4, "SPDIF_OUT"),
> +               MTK_FUNCTION(6, "LVTS_FOUT"),
> +               MTK_FUNCTION(7, "DBG_MON_A0")
> +       ),
> +       MTK_PIN(
> +               9, "GPIO9",
> +               MTK_EINT_FUNCTION(0, 9),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO9"),
> +               MTK_FUNCTION(1, "SCL0"),
> +               MTK_FUNCTION(2, "PWM_1"),
> +               MTK_FUNCTION(4, "IR_IN"),
> +               MTK_FUNCTION(6, "LVTS_SDO"),
> +               MTK_FUNCTION(7, "DBG_MON_A1")
> +       ),
> +       MTK_PIN(
> +               10, "GPIO10",
> +               MTK_EINT_FUNCTION(0, 10),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO10"),
> +               MTK_FUNCTION(1, "SDA1"),
> +               MTK_FUNCTION(2, "PWM_2"),
> +               MTK_FUNCTION(3, "ADSP_URXD0"),
> +               MTK_FUNCTION(4, "SPDIF_IN1"),
> +               MTK_FUNCTION(6, "LVTS_SCF"),
> +               MTK_FUNCTION(7, "DBG_MON_A2")
> +       ),
> +       MTK_PIN(
> +               11, "GPIO11",
> +               MTK_EINT_FUNCTION(0, 11),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO11"),
> +               MTK_FUNCTION(1, "SCL1"),
> +               MTK_FUNCTION(2, "PWM_3"),
> +               MTK_FUNCTION(3, "ADSP_UTXD0"),
> +               MTK_FUNCTION(4, "SPDIF_IN0"),
> +               MTK_FUNCTION(6, "LVTS_SCK"),
> +               MTK_FUNCTION(7, "DBG_MON_A3")
> +       ),
> +       MTK_PIN(
> +               12, "GPIO12",
> +               MTK_EINT_FUNCTION(0, 12),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO12"),
> +               MTK_FUNCTION(1, "SDA2"),
> +               MTK_FUNCTION(2, "DMIC3_DAT_R"),
> +               MTK_FUNCTION(3, "I2SO1_D6"),
> +               MTK_FUNCTION(6, "LVTS_SDI"),
> +               MTK_FUNCTION(7, "DBG_MON_A4")
> +       ),
> +       MTK_PIN(
> +               13, "GPIO13",
> +               MTK_EINT_FUNCTION(0, 13),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO13"),
> +               MTK_FUNCTION(1, "SCL2"),
> +               MTK_FUNCTION(2, "DMIC4_DAT_R"),
> +               MTK_FUNCTION(3, "I2SO1_D7"),
> +               MTK_FUNCTION(7, "DBG_MON_A5")
> +       ),
> +       MTK_PIN(
> +               14, "GPIO14",
> +               MTK_EINT_FUNCTION(0, 14),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO14"),
> +               MTK_FUNCTION(1, "SDA3"),
> +               MTK_FUNCTION(2, "DMIC3_DAT"),
> +               MTK_FUNCTION(3, "TDMIN_MCK"),
> +               MTK_FUNCTION(7, "DBG_MON_A6")
> +       ),
> +       MTK_PIN(
> +               15, "GPIO15",
> +               MTK_EINT_FUNCTION(0, 15),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO15"),
> +               MTK_FUNCTION(1, "SCL3"),
> +               MTK_FUNCTION(2, "DMIC3_CLK"),
> +               MTK_FUNCTION(3, "TDMIN_DI"),
> +               MTK_FUNCTION(7, "DBG_MON_A7")
> +       ),
> +       MTK_PIN(
> +               16, "GPIO16",
> +               MTK_EINT_FUNCTION(0, 16),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO16"),
> +               MTK_FUNCTION(1, "SDA4"),
> +               MTK_FUNCTION(2, "DMIC4_DAT"),
> +               MTK_FUNCTION(3, "TDMIN_LRCK"),
> +               MTK_FUNCTION(7, "DBG_MON_A8")
> +       ),
> +       MTK_PIN(
> +               17, "GPIO17",
> +               MTK_EINT_FUNCTION(0, 17),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO17"),
> +               MTK_FUNCTION(1, "SCL4"),
> +               MTK_FUNCTION(2, "DMIC4_CLK"),
> +               MTK_FUNCTION(3, "TDMIN_BCK"),
> +               MTK_FUNCTION(7, "DBG_MON_A9")
> +       ),
> +       MTK_PIN(
> +               18, "GPIO18",
> +               MTK_EINT_FUNCTION(0, 18),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO18"),
> +               MTK_FUNCTION(1, "DP_TX_HPD")
> +       ),
> +       MTK_PIN(
> +               19, "GPIO19",
> +               MTK_EINT_FUNCTION(0, 19),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO19"),
> +               MTK_FUNCTION(1, "WAKEN"),
> +               MTK_FUNCTION(2, "SCP_SDA1"),
> +               MTK_FUNCTION(3, "MD32_0_JTAG_TCK"),
> +               MTK_FUNCTION(4, "ADSP_JTAG0_TCK"),
> +               MTK_FUNCTION(5, "SDA6")
> +       ),
> +       MTK_PIN(
> +               20, "GPIO20",
> +               MTK_EINT_FUNCTION(0, 20),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO20"),
> +               MTK_FUNCTION(1, "PERSTN"),
> +               MTK_FUNCTION(2, "SCP_SCL1"),
> +               MTK_FUNCTION(3, "MD32_0_JTAG_TMS"),
> +               MTK_FUNCTION(4, "ADSP_JTAG0_TMS"),
> +               MTK_FUNCTION(5, "SCL6")
> +       ),
> +       MTK_PIN(
> +               21, "GPIO21",
> +               MTK_EINT_FUNCTION(0, 21),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO21"),
> +               MTK_FUNCTION(1, "CLKREQN"),
> +               MTK_FUNCTION(3, "MD32_0_JTAG_TDI"),
> +               MTK_FUNCTION(4, "ADSP_JTAG0_TDI"),
> +               MTK_FUNCTION(5, "SCP_SDA1")
> +       ),
> +       MTK_PIN(
> +               22, "GPIO22",
> +               MTK_EINT_FUNCTION(0, 22),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO22"),
> +               MTK_FUNCTION(1, "CMMCLK0"),
> +               MTK_FUNCTION(2, "PERSTN_1"),
> +               MTK_FUNCTION(5, "SCP_SCL1"),
> +               MTK_FUNCTION(7, "MD32_0_GPIO0")
> +       ),
> +       MTK_PIN(
> +               23, "GPIO23",
> +               MTK_EINT_FUNCTION(0, 23),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO23"),
> +               MTK_FUNCTION(1, "CMMCLK1"),
> +               MTK_FUNCTION(2, "CLKREQN_1"),
> +               MTK_FUNCTION(3, "SDA4"),
> +               MTK_FUNCTION(4, "DMIC1_CLK"),
> +               MTK_FUNCTION(5, "SCP_SDA0"),
> +               MTK_FUNCTION(7, "MD32_0_GPIO1")
> +       ),
> +       MTK_PIN(
> +               24, "GPIO24",
> +               MTK_EINT_FUNCTION(0, 24),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO24"),
> +               MTK_FUNCTION(1, "CMMCLK2"),
> +               MTK_FUNCTION(2, "WAKEN_1"),
> +               MTK_FUNCTION(3, "SCL4"),
> +               MTK_FUNCTION(4, "DMIC1_DAT"),
> +               MTK_FUNCTION(5, "SCP_SCL0"),
> +               MTK_FUNCTION(6, "LVTS_26M"),
> +               MTK_FUNCTION(7, "MD32_0_GPIO2")
> +       ),
> +       MTK_PIN(
> +               25, "GPIO25",
> +               MTK_EINT_FUNCTION(0, 25),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO25"),
> +               MTK_FUNCTION(1, "CMMRST"),
> +               MTK_FUNCTION(2, "CMMCLK3"),
> +               MTK_FUNCTION(3, "SPDIF_OUT"),
> +               MTK_FUNCTION(4, "SDA6"),
> +               MTK_FUNCTION(5, "ADSP_JTAG0_TRSTN"),
> +               MTK_FUNCTION(6, "MD32_0_JTAG_TRST")
> +       ),
> +       MTK_PIN(
> +               26, "GPIO26",
> +               MTK_EINT_FUNCTION(0, 26),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO26"),
> +               MTK_FUNCTION(1, "CMMPDN"),
> +               MTK_FUNCTION(2, "CMMCLK4"),
> +               MTK_FUNCTION(3, "IR_IN"),
> +               MTK_FUNCTION(4, "SCL6"),
> +               MTK_FUNCTION(5, "ADSP_JTAG0_TDO"),
> +               MTK_FUNCTION(6, "MD32_0_JTAG_TDO")
> +       ),
> +       MTK_PIN(
> +               27, "GPIO27",
> +               MTK_EINT_FUNCTION(0, 27),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO27"),
> +               MTK_FUNCTION(1, "HDMIRX20_HTPLG"),
> +               MTK_FUNCTION(2, "CMFLASH0"),
> +               MTK_FUNCTION(3, "MD32_0_TXD"),
> +               MTK_FUNCTION(4, "TP_UTXD2_AO"),
> +               MTK_FUNCTION(5, "SCL7"),
> +               MTK_FUNCTION(6, "UCTS2"),
> +               MTK_FUNCTION(7, "DBG_MON_A18")
> +       ),
> +       MTK_PIN(
> +               28, "GPIO28",
> +               MTK_EINT_FUNCTION(0, 28),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO28"),
> +               MTK_FUNCTION(1, "HDMIRX20_PWR5V"),
> +               MTK_FUNCTION(2, "CMFLASH1"),
> +               MTK_FUNCTION(3, "MD32_0_RXD"),
> +               MTK_FUNCTION(4, "TP_URXD2_AO"),
> +               MTK_FUNCTION(5, "SDA7"),
> +               MTK_FUNCTION(6, "URTS2"),
> +               MTK_FUNCTION(7, "DBG_MON_A19")
> +       ),
> +       MTK_PIN(
> +               29, "GPIO29",
> +               MTK_EINT_FUNCTION(0, 29),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO29"),
> +               MTK_FUNCTION(1, "HDMIRX20_SCL"),
> +               MTK_FUNCTION(2, "CMFLASH2"),
> +               MTK_FUNCTION(3, "SCL5"),
> +               MTK_FUNCTION(4, "TP_URTS2_AO"),
> +               MTK_FUNCTION(6, "UTXD2"),
> +               MTK_FUNCTION(7, "DBG_MON_A20")
> +       ),
> +       MTK_PIN(
> +               30, "GPIO30",
> +               MTK_EINT_FUNCTION(0, 30),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO30"),
> +               MTK_FUNCTION(1, "HDMIRX20_SDA"),
> +               MTK_FUNCTION(2, "CMFLASH3"),
> +               MTK_FUNCTION(3, "SDA5"),
> +               MTK_FUNCTION(4, "TP_UCTS2_AO"),
> +               MTK_FUNCTION(6, "URXD2"),
> +               MTK_FUNCTION(7, "DBG_MON_A21")
> +       ),
> +       MTK_PIN(
> +               31, "GPIO31",
> +               MTK_EINT_FUNCTION(0, 31),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO31"),
> +               MTK_FUNCTION(1, "HDMITX20_PWR5V"),
> +               MTK_FUNCTION(2, "DMIC1_DAT_R"),
> +               MTK_FUNCTION(3, "PERSTN"),
> +               MTK_FUNCTION(7, "DBG_MON_A22")
> +       ),
> +       MTK_PIN(
> +               32, "GPIO32",
> +               MTK_EINT_FUNCTION(0, 32),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO32"),
> +               MTK_FUNCTION(1, "HDMITX20_HTPLG"),
> +               MTK_FUNCTION(3, "CLKREQN"),
> +               MTK_FUNCTION(7, "DBG_MON_A23")
> +       ),
> +       MTK_PIN(
> +               33, "GPIO33",
> +               MTK_EINT_FUNCTION(0, 33),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO33"),
> +               MTK_FUNCTION(1, "HDMITX20_CEC"),
> +               MTK_FUNCTION(2, "CMVREF0"),
> +               MTK_FUNCTION(3, "WAKEN")
> +       ),
> +       MTK_PIN(
> +               34, "GPIO34",
> +               MTK_EINT_FUNCTION(0, 34),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO34"),
> +               MTK_FUNCTION(1, "HDMITX20_SCL"),
> +               MTK_FUNCTION(2, "CMVREF1"),
> +               MTK_FUNCTION(3, "SCL7"),
> +               MTK_FUNCTION(4, "SCL6"),
> +               MTK_FUNCTION(7, "DBG_MON_A24")
> +       ),
> +       MTK_PIN(
> +               35, "GPIO35",
> +               MTK_EINT_FUNCTION(0, 35),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO35"),
> +               MTK_FUNCTION(1, "HDMITX20_SDA"),
> +               MTK_FUNCTION(2, "CMVREF2"),
> +               MTK_FUNCTION(3, "SDA7"),
> +               MTK_FUNCTION(4, "SDA6"),
> +               MTK_FUNCTION(7, "DBG_MON_A25")
> +       ),
> +       MTK_PIN(
> +               36, "GPIO36",
> +               MTK_EINT_FUNCTION(0, 36),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO36"),
> +               MTK_FUNCTION(1, "RTC32K_CK"),
> +               MTK_FUNCTION(7, "DBG_MON_A27")
> +       ),
> +       MTK_PIN(
> +               37, "GPIO37",
> +               MTK_EINT_FUNCTION(0, 37),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO37"),
> +               MTK_FUNCTION(1, "WATCHDOG"),
> +               MTK_FUNCTION(7, "DBG_MON_A28")
> +       ),
> +       MTK_PIN(
> +               38, "GPIO38",
> +               MTK_EINT_FUNCTION(0, 38),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO38"),
> +               MTK_FUNCTION(1, "SRCLKENA0"),
> +               MTK_FUNCTION(7, "DBG_MON_A29")
> +       ),
> +       MTK_PIN(
> +               39, "GPIO39",
> +               MTK_EINT_FUNCTION(0, 39),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO39"),
> +               MTK_FUNCTION(1, "SRCLKENA1"),
> +               MTK_FUNCTION(2, "DMIC2_DAT_R"),
> +               MTK_FUNCTION(7, "DBG_MON_A30")
> +       ),
> +       MTK_PIN(
> +               40, "GPIO40",
> +               MTK_EINT_FUNCTION(0, 40),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO40"),
> +               MTK_FUNCTION(1, "PWRAP_SPI0_CSN"),
> +               MTK_FUNCTION(3, "SPIM3_CSB"),
> +               MTK_FUNCTION(7, "DBG_MON_A31")
> +       ),
> +       MTK_PIN(
> +               41, "GPIO41",
> +               MTK_EINT_FUNCTION(0, 41),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO41"),
> +               MTK_FUNCTION(1, "PWRAP_SPI0_CK"),
> +               MTK_FUNCTION(3, "SPIM3_CLK"),
> +               MTK_FUNCTION(7, "DBG_MON_A32")
> +       ),
> +       MTK_PIN(
> +               42, "GPIO42",
> +               MTK_EINT_FUNCTION(0, 42),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO42"),
> +               MTK_FUNCTION(1, "PWRAP_SPI0_MO"),
> +               MTK_FUNCTION(2, "PWRAP_SPI0_MI"),
> +               MTK_FUNCTION(3, "SPIM3_MO"),
> +               MTK_FUNCTION(7, "DBG_MON_B0")
> +       ),
> +       MTK_PIN(
> +               43, "GPIO43",
> +               MTK_EINT_FUNCTION(0, 43),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO43"),
> +               MTK_FUNCTION(1, "PWRAP_SPI0_MI"),
> +               MTK_FUNCTION(2, "PWRAP_SPI0_MO"),
> +               MTK_FUNCTION(3, "SPIM3_MI"),
> +               MTK_FUNCTION(7, "DBG_MON_B1")
> +       ),
> +       MTK_PIN(
> +               44, "GPIO44",
> +               MTK_EINT_FUNCTION(0, 44),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO44"),
> +               MTK_FUNCTION(1, "SPMI_M_SCL"),
> +               MTK_FUNCTION(2, "I2SI00_DATA1"),
> +               MTK_FUNCTION(3, "SCL5"),
> +               MTK_FUNCTION(4, "UTXD5"),
> +               MTK_FUNCTION(7, "DBG_MON_B2")
> +       ),
> +       MTK_PIN(
> +               45, "GPIO45",
> +               MTK_EINT_FUNCTION(0, 45),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO45"),
> +               MTK_FUNCTION(1, "SPMI_M_SDA"),
> +               MTK_FUNCTION(2, "I2SI00_DATA2"),
> +               MTK_FUNCTION(3, "SDA5"),
> +               MTK_FUNCTION(4, "URXD5"),
> +               MTK_FUNCTION(7, "DBG_MON_B3")
> +       ),
> +       MTK_PIN(
> +               46, "GPIO46",
> +               MTK_EINT_FUNCTION(0, 46),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO46"),
> +               MTK_FUNCTION(1, "I2SIN_MCK"),
> +               MTK_FUNCTION(2, "I2SI00_DATA3"),
> +               MTK_FUNCTION(3, "SPLIN_MCK"),
> +               MTK_FUNCTION(7, "DBG_MON_B4")
> +       ),
> +       MTK_PIN(
> +               47, "GPIO47",
> +               MTK_EINT_FUNCTION(0, 47),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO47"),
> +               MTK_FUNCTION(1, "I2SIN_BCK"),
> +               MTK_FUNCTION(2, "I2SIN0_BCK"),
> +               MTK_FUNCTION(3, "SPLIN_LRCK"),
> +               MTK_FUNCTION(7, "DBG_MON_B5")
> +       ),
> +       MTK_PIN(
> +               48, "GPIO48",
> +               MTK_EINT_FUNCTION(0, 48),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO48"),
> +               MTK_FUNCTION(1, "I2SIN_WS"),
> +               MTK_FUNCTION(2, "I2SIN0_LRCK"),
> +               MTK_FUNCTION(3, "SPLIN_BCK"),
> +               MTK_FUNCTION(7, "DBG_MON_B6")
> +       ),
> +       MTK_PIN(
> +               49, "GPIO49",
> +               MTK_EINT_FUNCTION(0, 49),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO49"),
> +               MTK_FUNCTION(1, "I2SIN_D0"),
> +               MTK_FUNCTION(2, "I2SI00_DATA0"),
> +               MTK_FUNCTION(3, "SPLIN_D0"),
> +               MTK_FUNCTION(7, "DBG_MON_B7")
> +       ),
> +       MTK_PIN(
> +               50, "GPIO50",
> +               MTK_EINT_FUNCTION(0, 50),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO50"),
> +               MTK_FUNCTION(1, "I2SO1_MCK"),
> +               MTK_FUNCTION(2, "I2SI5_D0"),
> +               MTK_FUNCTION(4, "I2SO4_MCK"),
> +               MTK_FUNCTION(7, "DBG_MON_B8")
> +       ),
> +       MTK_PIN(
> +               51, "GPIO51",
> +               MTK_EINT_FUNCTION(0, 51),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO51"),
> +               MTK_FUNCTION(1, "I2SO1_BCK"),
> +               MTK_FUNCTION(2, "I2SI5_BCK"),
> +               MTK_FUNCTION(7, "DBG_MON_B9")
> +       ),
> +       MTK_PIN(
> +               52, "GPIO52",
> +               MTK_EINT_FUNCTION(0, 52),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO52"),
> +               MTK_FUNCTION(1, "I2SO1_WS"),
> +               MTK_FUNCTION(2, "I2SI5_WS"),
> +               MTK_FUNCTION(7, "DBG_MON_B10")
> +       ),
> +       MTK_PIN(
> +               53, "GPIO53",
> +               MTK_EINT_FUNCTION(0, 53),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO53"),
> +               MTK_FUNCTION(1, "I2SO1_D0"),
> +               MTK_FUNCTION(2, "I2SI5_MCK"),
> +               MTK_FUNCTION(7, "DBG_MON_B11")
> +       ),
> +       MTK_PIN(
> +               54, "GPIO54",
> +               MTK_EINT_FUNCTION(0, 54),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO54"),
> +               MTK_FUNCTION(1, "I2SO1_D1"),
> +               MTK_FUNCTION(2, "I2SI01_DATA1"),
> +               MTK_FUNCTION(3, "SPLIN_D1"),
> +               MTK_FUNCTION(4, "I2SO4_BCK"),
> +               MTK_FUNCTION(7, "DBG_MON_B12")
> +       ),
> +       MTK_PIN(
> +               55, "GPIO55",
> +               MTK_EINT_FUNCTION(0, 55),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO55"),
> +               MTK_FUNCTION(1, "I2SO1_D2"),
> +               MTK_FUNCTION(2, "I2SI01_DATA2"),
> +               MTK_FUNCTION(3, "SPLIN_D2"),
> +               MTK_FUNCTION(4, "I2SO4_WS"),
> +               MTK_FUNCTION(7, "DBG_MON_B13")
> +       ),
> +       MTK_PIN(
> +               56, "GPIO56",
> +               MTK_EINT_FUNCTION(0, 56),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO56"),
> +               MTK_FUNCTION(1, "I2SO1_D3"),
> +               MTK_FUNCTION(2, "I2SI01_DATA3"),
> +               MTK_FUNCTION(3, "SPLIN_D3"),
> +               MTK_FUNCTION(4, "I2SO4_D0"),
> +               MTK_FUNCTION(7, "DBG_MON_B14")
> +       ),
> +       MTK_PIN(
> +               57, "GPIO57",
> +               MTK_EINT_FUNCTION(0, 57),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO57"),
> +               MTK_FUNCTION(1, "I2SO2_MCK"),
> +               MTK_FUNCTION(2, "I2SO1_D12"),
> +               MTK_FUNCTION(3, "LCM1_RST"),
> +               MTK_FUNCTION(7, "DBG_MON_B15")
> +       ),
> +       MTK_PIN(
> +               58, "GPIO58",
> +               MTK_EINT_FUNCTION(0, 58),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO58"),
> +               MTK_FUNCTION(1, "I2SO2_BCK"),
> +               MTK_FUNCTION(2, "I2SO1_D13"),
> +               MTK_FUNCTION(3, "I2SIN1_BCK"),
> +               MTK_FUNCTION(7, "DBG_MON_B16")
> +       ),
> +       MTK_PIN(
> +               59, "GPIO59",
> +               MTK_EINT_FUNCTION(0, 59),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO59"),
> +               MTK_FUNCTION(1, "I2SO2_WS"),
> +               MTK_FUNCTION(2, "I2SO1_D14"),
> +               MTK_FUNCTION(3, "I2SIN1_LRCK"),
> +               MTK_FUNCTION(7, "DBG_MON_B17")
> +       ),
> +       MTK_PIN(
> +               60, "GPIO60",
> +               MTK_EINT_FUNCTION(0, 60),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO60"),
> +               MTK_FUNCTION(1, "I2SO2_D0"),
> +               MTK_FUNCTION(2, "I2SO1_D15"),
> +               MTK_FUNCTION(3, "I2SI01_DATA0"),
> +               MTK_FUNCTION(7, "DBG_MON_B18")
> +       ),
> +       MTK_PIN(
> +               61, "GPIO61",
> +               MTK_EINT_FUNCTION(0, 61),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO61"),
> +               MTK_FUNCTION(1, "DMIC1_CLK"),
> +               MTK_FUNCTION(2, "I2SO2_BCK"),
> +               MTK_FUNCTION(3, "SCP_SPI2_CK"),
> +               MTK_FUNCTION(7, "DBG_MON_B19")
> +       ),
> +       MTK_PIN(
> +               62, "GPIO62",
> +               MTK_EINT_FUNCTION(0, 62),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO62"),
> +               MTK_FUNCTION(1, "DMIC1_DAT"),
> +               MTK_FUNCTION(2, "I2SO2_WS"),
> +               MTK_FUNCTION(3, "SCP_SPI2_MI"),
> +               MTK_FUNCTION(7, "DBG_MON_B20")
> +       ),
> +       MTK_PIN(
> +               63, "GPIO63",
> +               MTK_EINT_FUNCTION(0, 63),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO63"),
> +               MTK_FUNCTION(1, "DMIC2_CLK"),
> +               MTK_FUNCTION(2, "VBUSVALID"),
> +               MTK_FUNCTION(3, "SCP_SPI2_MO"),
> +               MTK_FUNCTION(4, "SCP_SCL2"),
> +               MTK_FUNCTION(5, "SCP_JTAG1_TDO"),
> +               MTK_FUNCTION(6, "JTDO_SEL1"),
> +               MTK_FUNCTION(7, "DBG_MON_B21")
> +       ),
> +       MTK_PIN(
> +               64, "GPIO64",
> +               MTK_EINT_FUNCTION(0, 64),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO64"),
> +               MTK_FUNCTION(1, "DMIC2_DAT"),
> +               MTK_FUNCTION(2, "VBUSVALID_1P"),
> +               MTK_FUNCTION(3, "SCP_SPI2_CS"),
> +               MTK_FUNCTION(4, "SCP_SDA2"),
> +               MTK_FUNCTION(7, "DBG_MON_B22")
> +       ),
> +       MTK_PIN(
> +               65, "GPIO65",
> +               MTK_EINT_FUNCTION(0, 65),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO65"),
> +               MTK_FUNCTION(1, "PCM_DO"),
> +               MTK_FUNCTION(2, "AUXIF_ST0"),
> +               MTK_FUNCTION(3, "UCTS2"),
> +               MTK_FUNCTION(5, "SCP_JTAG1_TMS"),
> +               MTK_FUNCTION(6, "JTMS_SEL1"),
> +               MTK_FUNCTION(7, "DBG_MON_B23")
> +       ),
> +       MTK_PIN(
> +               66, "GPIO66",
> +               MTK_EINT_FUNCTION(0, 66),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO66"),
> +               MTK_FUNCTION(1, "PCM_CLK"),
> +               MTK_FUNCTION(2, "AUXIF_CLK0"),
> +               MTK_FUNCTION(3, "URTS2"),
> +               MTK_FUNCTION(5, "SCP_JTAG1_TCK"),
> +               MTK_FUNCTION(6, "JTCK_SEL1"),
> +               MTK_FUNCTION(7, "DBG_MON_B24")
> +       ),
> +       MTK_PIN(
> +               67, "GPIO67",
> +               MTK_EINT_FUNCTION(0, 67),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO67"),
> +               MTK_FUNCTION(1, "PCM_DI"),
> +               MTK_FUNCTION(2, "AUXIF_ST1"),
> +               MTK_FUNCTION(3, "UTXD2"),
> +               MTK_FUNCTION(5, "SCP_JTAG1_TRSTN"),
> +               MTK_FUNCTION(6, "JTRSTn_SEL1"),
> +               MTK_FUNCTION(7, "DBG_MON_B25")
> +       ),
> +       MTK_PIN(
> +               68, "GPIO68",
> +               MTK_EINT_FUNCTION(0, 68),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO68"),
> +               MTK_FUNCTION(1, "PCM_SYNC"),
> +               MTK_FUNCTION(2, "AUXIF_CLK1"),
> +               MTK_FUNCTION(3, "URXD2"),
> +               MTK_FUNCTION(5, "SCP_JTAG1_TDI"),
> +               MTK_FUNCTION(6, "JTDI_SEL1"),
> +               MTK_FUNCTION(7, "DBG_MON_B26")
> +       ),
> +       MTK_PIN(
> +               69, "GPIO69",
> +               MTK_EINT_FUNCTION(0, 69),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO69"),
> +               MTK_FUNCTION(1, "AUD_CLK_MOSI"),
> +               MTK_FUNCTION(2, "I2SIN2_BCK"),
> +               MTK_FUNCTION(3, "PWM_0"),
> +               MTK_FUNCTION(4, "WAKEN"),
> +               MTK_FUNCTION(7, "DBG_MON_B27")
> +       ),
> +       MTK_PIN(
> +               70, "GPIO70",
> +               MTK_EINT_FUNCTION(0, 70),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO70"),
> +               MTK_FUNCTION(1, "AUD_SYNC_MOSI"),
> +               MTK_FUNCTION(2, "I2SIN2_LRCK"),
> +               MTK_FUNCTION(3, "PWM_1"),
> +               MTK_FUNCTION(4, "PERSTN"),
> +               MTK_FUNCTION(7, "DBG_MON_B28")
> +       ),
> +       MTK_PIN(
> +               71, "GPIO71",
> +               MTK_EINT_FUNCTION(0, 71),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO71"),
> +               MTK_FUNCTION(1, "AUD_DAT_MOSI0"),
> +               MTK_FUNCTION(2, "IDDIG_2P"),
> +               MTK_FUNCTION(3, "PWM_2"),
> +               MTK_FUNCTION(4, "CLKREQN"),
> +               MTK_FUNCTION(7, "DBG_MON_B29")
> +       ),
> +       MTK_PIN(
> +               72, "GPIO72",
> +               MTK_EINT_FUNCTION(0, 72),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO72"),
> +               MTK_FUNCTION(1, "AUD_DAT_MOSI1"),
> +               MTK_FUNCTION(2, "USB_DRVVBUS_2P"),
> +               MTK_FUNCTION(3, "PWM_3"),
> +               MTK_FUNCTION(4, "PERSTN_1"),
> +               MTK_FUNCTION(7, "DBG_MON_B30")
> +       ),
> +       MTK_PIN(
> +               73, "GPIO73",
> +               MTK_EINT_FUNCTION(0, 73),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO73"),
> +               MTK_FUNCTION(1, "AUD_DAT_MISO0"),
> +               MTK_FUNCTION(2, "I2SI02_DATA0"),
> +               MTK_FUNCTION(4, "CLKREQN_1"),
> +               MTK_FUNCTION(5, "VOW_DAT_MISO"),
> +               MTK_FUNCTION(7, "DBG_MON_B31")
> +       ),
> +       MTK_PIN(
> +               74, "GPIO74",
> +               MTK_EINT_FUNCTION(0, 74),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO74"),
> +               MTK_FUNCTION(1, "AUD_DAT_MISO1"),
> +               MTK_FUNCTION(2, "I2SI02_DATA1"),
> +               MTK_FUNCTION(4, "WAKEN_1"),
> +               MTK_FUNCTION(5, "VOW_CLK_MISO"),
> +               MTK_FUNCTION(7, "DBG_MON_B32")
> +       ),
> +       MTK_PIN(
> +               75, "GPIO75",
> +               MTK_EINT_FUNCTION(0, 75),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO75"),
> +               MTK_FUNCTION(1, "AUD_DAT_MISO2"),
> +               MTK_FUNCTION(2, "I2SI02_DATA2")
> +       ),
> +       MTK_PIN(
> +               76, "GPIO76",
> +               MTK_EINT_FUNCTION(0, 76),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO76"),
> +               MTK_FUNCTION(1, "SCP_VREQ_VAO"),
> +               MTK_FUNCTION(2, "I2SI02_DATA3"),
> +               MTK_FUNCTION(7, "DBG_MON_A26")
> +       ),
> +       MTK_PIN(
> +               77, "GPIO77",
> +               MTK_EINT_FUNCTION(0, 77),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO77"),
> +               MTK_FUNCTION(1, "DGI_D0"),
> +               MTK_FUNCTION(2, "DPI_D0"),
> +               MTK_FUNCTION(3, "I2SI4_MCK"),
> +               MTK_FUNCTION(4, "SPIM4_CLK"),
> +               MTK_FUNCTION(5, "GBE_TXD3"),
> +               MTK_FUNCTION(6, "SPM_JTAG_TCK")
> +       ),
> +       MTK_PIN(
> +               78, "GPIO78",
> +               MTK_EINT_FUNCTION(0, 78),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO78"),
> +               MTK_FUNCTION(1, "DGI_D1"),
> +               MTK_FUNCTION(2, "DPI_D1"),
> +               MTK_FUNCTION(3, "I2SI4_BCK"),
> +               MTK_FUNCTION(4, "SPIM4_MO"),
> +               MTK_FUNCTION(5, "GBE_TXD2"),
> +               MTK_FUNCTION(6, "SPM_JTAG_TMS")
> +       ),
> +       MTK_PIN(
> +               79, "GPIO79",
> +               MTK_EINT_FUNCTION(0, 79),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO79"),
> +               MTK_FUNCTION(1, "DGI_D2"),
> +               MTK_FUNCTION(2, "DPI_D2"),
> +               MTK_FUNCTION(3, "I2SI4_WS"),
> +               MTK_FUNCTION(4, "SPIM4_CSB"),
> +               MTK_FUNCTION(5, "GBE_TXD1"),
> +               MTK_FUNCTION(6, "SPM_JTAG_TDI")
> +       ),
> +       MTK_PIN(
> +               80, "GPIO80",
> +               MTK_EINT_FUNCTION(0, 80),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO80"),
> +               MTK_FUNCTION(1, "DGI_D3"),
> +               MTK_FUNCTION(2, "DPI_D3"),
> +               MTK_FUNCTION(3, "I2SI4_D0"),
> +               MTK_FUNCTION(4, "SPIM4_MI"),
> +               MTK_FUNCTION(5, "GBE_TXD0"),
> +               MTK_FUNCTION(6, "SPM_JTAG_TDO")
> +       ),
> +       MTK_PIN(
> +               81, "GPIO81",
> +               MTK_EINT_FUNCTION(0, 81),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO81"),
> +               MTK_FUNCTION(1, "DGI_D4"),
> +               MTK_FUNCTION(2, "DPI_D4"),
> +               MTK_FUNCTION(3, "I2SI5_MCK"),
> +               MTK_FUNCTION(4, "SPIM5_CLK"),
> +               MTK_FUNCTION(5, "GBE_RXD3"),
> +               MTK_FUNCTION(6, "SPM_JTAG_TRSTN")
> +       ),
> +       MTK_PIN(
> +               82, "GPIO82",
> +               MTK_EINT_FUNCTION(0, 82),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO82"),
> +               MTK_FUNCTION(1, "DGI_D5"),
> +               MTK_FUNCTION(2, "DPI_D5"),
> +               MTK_FUNCTION(3, "I2SI5_BCK"),
> +               MTK_FUNCTION(4, "SPIM5_MO"),
> +               MTK_FUNCTION(5, "GBE_RXD2"),
> +               MTK_FUNCTION(6, "MCUPM_JTAG_TDO")
> +       ),
> +       MTK_PIN(
> +               83, "GPIO83",
> +               MTK_EINT_FUNCTION(0, 83),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO83"),
> +               MTK_FUNCTION(1, "DGI_D6"),
> +               MTK_FUNCTION(2, "DPI_D6"),
> +               MTK_FUNCTION(3, "I2SI5_WS"),
> +               MTK_FUNCTION(4, "SPIM5_CSB"),
> +               MTK_FUNCTION(5, "GBE_RXD1"),
> +               MTK_FUNCTION(6, "MCUPM_JTAG_TMS")
> +       ),
> +       MTK_PIN(
> +               84, "GPIO84",
> +               MTK_EINT_FUNCTION(0, 84),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO84"),
> +               MTK_FUNCTION(1, "DGI_D7"),
> +               MTK_FUNCTION(2, "DPI_D7"),
> +               MTK_FUNCTION(3, "I2SI5_D0"),
> +               MTK_FUNCTION(4, "SPIM5_MI"),
> +               MTK_FUNCTION(5, "GBE_RXD0"),
> +               MTK_FUNCTION(6, "MCUPM_JTAG_TCK")
> +       ),
> +       MTK_PIN(
> +               85, "GPIO85",
> +               MTK_EINT_FUNCTION(0, 85),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO85"),
> +               MTK_FUNCTION(1, "DGI_D8"),
> +               MTK_FUNCTION(2, "DPI_D8"),
> +               MTK_FUNCTION(3, "I2SO4_MCK"),
> +               MTK_FUNCTION(4, "SCP_SPI1_B_CK"),
> +               MTK_FUNCTION(5, "GBE_TXC"),
> +               MTK_FUNCTION(6, "MCUPM_JTAG_TDI")
> +       ),
> +       MTK_PIN(
> +               86, "GPIO86",
> +               MTK_EINT_FUNCTION(0, 86),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO86"),
> +               MTK_FUNCTION(1, "DGI_D9"),
> +               MTK_FUNCTION(2, "DPI_D9"),
> +               MTK_FUNCTION(3, "I2SO4_BCK"),
> +               MTK_FUNCTION(4, "SCP_SPI1_B_MI"),
> +               MTK_FUNCTION(5, "GBE_RXC"),
> +               MTK_FUNCTION(6, "MCUPM_JTAG_TRSTN")
> +       ),
> +       MTK_PIN(
> +               87, "GPIO87",
> +               MTK_EINT_FUNCTION(0, 87),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO87"),
> +               MTK_FUNCTION(1, "DGI_D10"),
> +               MTK_FUNCTION(2, "DPI_D10"),
> +               MTK_FUNCTION(3, "I2SO4_WS"),
> +               MTK_FUNCTION(4, "SCP_SPI1_B_CS"),
> +               MTK_FUNCTION(5, "GBE_RXDV"),
> +               MTK_FUNCTION(6, "SSPM_JTAG_TDO")
> +       ),
> +       MTK_PIN(
> +               88, "GPIO88",
> +               MTK_EINT_FUNCTION(0, 88),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO88"),
> +               MTK_FUNCTION(1, "DGI_D11"),
> +               MTK_FUNCTION(2, "DPI_D11"),
> +               MTK_FUNCTION(3, "I2SO4_D0"),
> +               MTK_FUNCTION(4, "SCP_SPI1_B_MO"),
> +               MTK_FUNCTION(5, "GBE_TXEN"),
> +               MTK_FUNCTION(6, "SSPM_JTAG_TMS")
> +       ),
> +       MTK_PIN(
> +               89, "GPIO89",
> +               MTK_EINT_FUNCTION(0, 89),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO89"),
> +               MTK_FUNCTION(1, "DGI_D12"),
> +               MTK_FUNCTION(2, "DPI_D12"),
> +               MTK_FUNCTION(3, "MSDC2_CMD_A"),
> +               MTK_FUNCTION(4, "I2SO5_BCK"),
> +               MTK_FUNCTION(5, "GBE_MDC"),
> +               MTK_FUNCTION(6, "SSPM_JTAG_TCK")
> +       ),
> +       MTK_PIN(
> +               90, "GPIO90",
> +               MTK_EINT_FUNCTION(0, 90),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO90"),
> +               MTK_FUNCTION(1, "DGI_D13"),
> +               MTK_FUNCTION(2, "DPI_D13"),
> +               MTK_FUNCTION(3, "MSDC2_CLK_A"),
> +               MTK_FUNCTION(4, "I2SO5_WS"),
> +               MTK_FUNCTION(5, "GBE_MDIO"),
> +               MTK_FUNCTION(6, "SSPM_JTAG_TDI")
> +       ),
> +       MTK_PIN(
> +               91, "GPIO91",
> +               MTK_EINT_FUNCTION(0, 91),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO91"),
> +               MTK_FUNCTION(1, "DGI_D14"),
> +               MTK_FUNCTION(2, "DPI_D14"),
> +               MTK_FUNCTION(3, "MSDC2_DAT3_A"),
> +               MTK_FUNCTION(4, "I2SO5_D0"),
> +               MTK_FUNCTION(5, "GBE_TXER"),
> +               MTK_FUNCTION(6, "SSPM_JTAG_TRSTN")
> +       ),
> +       MTK_PIN(
> +               92, "GPIO92",
> +               MTK_EINT_FUNCTION(0, 92),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO92"),
> +               MTK_FUNCTION(1, "DGI_D15"),
> +               MTK_FUNCTION(2, "DPI_D15"),
> +               MTK_FUNCTION(3, "MSDC2_DAT0_A"),
> +               MTK_FUNCTION(4, "I2SO2_D1"),
> +               MTK_FUNCTION(5, "GBE_RXER"),
> +               MTK_FUNCTION(6, "CCU0_JTAG_TDO")
> +       ),
> +       MTK_PIN(
> +               93, "GPIO93",
> +               MTK_EINT_FUNCTION(0, 93),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO93"),
> +               MTK_FUNCTION(1, "DGI_HSYNC"),
> +               MTK_FUNCTION(2, "DPI_HSYNC"),
> +               MTK_FUNCTION(3, "MSDC2_DAT2_A"),
> +               MTK_FUNCTION(4, "I2SO2_D2"),
> +               MTK_FUNCTION(5, "GBE_COL"),
> +               MTK_FUNCTION(6, "CCU0_JTAG_TMS")
> +       ),
> +       MTK_PIN(
> +               94, "GPIO94",
> +               MTK_EINT_FUNCTION(0, 94),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO94"),
> +               MTK_FUNCTION(1, "DGI_VSYNC"),
> +               MTK_FUNCTION(2, "DPI_VSYNC"),
> +               MTK_FUNCTION(3, "MSDC2_DAT1_A"),
> +               MTK_FUNCTION(4, "I2SO2_D3"),
> +               MTK_FUNCTION(5, "GBE_INTR"),
> +               MTK_FUNCTION(6, "CCU0_JTAG_TDI")
> +       ),
> +       MTK_PIN(
> +               95, "GPIO95",
> +               MTK_EINT_FUNCTION(0, 95),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO95"),
> +               MTK_FUNCTION(1, "DGI_DE"),
> +               MTK_FUNCTION(2, "DPI_DE"),
> +               MTK_FUNCTION(3, "UTXD2"),
> +               MTK_FUNCTION(5, "I2SIN_D1"),
> +               MTK_FUNCTION(6, "CCU0_JTAG_TCK")
> +       ),
> +       MTK_PIN(
> +               96, "GPIO96",
> +               MTK_EINT_FUNCTION(0, 96),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO96"),
> +               MTK_FUNCTION(1, "DGI_CK"),
> +               MTK_FUNCTION(2, "DPI_CK"),
> +               MTK_FUNCTION(3, "URXD2"),
> +               MTK_FUNCTION(4, "I2SO5_MCK"),
> +               MTK_FUNCTION(5, "I2SIN_D2"),
> +               MTK_FUNCTION(6, "CCU0_JTAG_TRST")
> +       ),
> +       MTK_PIN(
> +               97, "GPIO97",
> +               MTK_EINT_FUNCTION(0, 97),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO97"),
> +               MTK_FUNCTION(1, "DISP_PWM0"),
> +               MTK_FUNCTION(2, "DVFSRC_EXT_REQ")
> +       ),
> +       MTK_PIN(
> +               98, "GPIO98",
> +               MTK_EINT_FUNCTION(0, 98),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO98"),
> +               MTK_FUNCTION(1, "UTXD0")
> +       ),
> +       MTK_PIN(
> +               99, "GPIO99",
> +               MTK_EINT_FUNCTION(0, 99),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO99"),
> +               MTK_FUNCTION(1, "URXD0")
> +       ),
> +       MTK_PIN(
> +               100, "GPIO100",
> +               MTK_EINT_FUNCTION(0, 100),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO100"),
> +               MTK_FUNCTION(1, "URTS1"),
> +               MTK_FUNCTION(2, "DSI_TE"),
> +               MTK_FUNCTION(3, "I2SO1_D8"),
> +               MTK_FUNCTION(4, "KPROW2"),
> +               MTK_FUNCTION(5, "PWM_0"),
> +               MTK_FUNCTION(6, "TP_URTS1_AO"),
> +               MTK_FUNCTION(7, "I2SIN_D0")
> +       ),
> +       MTK_PIN(
> +               101, "GPIO101",
> +               MTK_EINT_FUNCTION(0, 101),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO101"),
> +               MTK_FUNCTION(1, "UCTS1"),
> +               MTK_FUNCTION(2, "DSI1_TE"),
> +               MTK_FUNCTION(3, "I2SO1_D9"),
> +               MTK_FUNCTION(4, "KPCOL2"),
> +               MTK_FUNCTION(5, "PWM_1"),
> +               MTK_FUNCTION(6, "TP_UCTS1_AO"),
> +               MTK_FUNCTION(7, "I2SIN_D1")
> +       ),
> +       MTK_PIN(
> +               102, "GPIO102",
> +               MTK_EINT_FUNCTION(0, 102),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO102"),
> +               MTK_FUNCTION(1, "UTXD1"),
> +               MTK_FUNCTION(2, "VBUSVALID_2P"),
> +               MTK_FUNCTION(3, "I2SO1_D10"),
> +               MTK_FUNCTION(4, "SSPM_UTXD_AO"),
> +               MTK_FUNCTION(5, "TP_UTXD1_AO"),
> +               MTK_FUNCTION(6, "MD32_1_TXD"),
> +               MTK_FUNCTION(7, "I2SIN_D2")
> +       ),
> +       MTK_PIN(
> +               103, "GPIO103",
> +               MTK_EINT_FUNCTION(0, 103),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO103"),
> +               MTK_FUNCTION(1, "URXD1"),
> +               MTK_FUNCTION(2, "VBUSVALID_3P"),
> +               MTK_FUNCTION(3, "I2SO1_D11"),
> +               MTK_FUNCTION(4, "SSPM_URXD_AO"),
> +               MTK_FUNCTION(5, "TP_URXD1_AO"),
> +               MTK_FUNCTION(6, "MD32_1_RXD"),
> +               MTK_FUNCTION(7, "I2SIN_D3")
> +       ),
> +       MTK_PIN(
> +               104, "GPIO104",
> +               MTK_EINT_FUNCTION(0, 104),
> +               DRV_GRP4,
> +               MTK_FUNCTION(0, "GPIO104"),
> +

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 580A978D21
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 15:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfG2Nqp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 09:46:45 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:22738 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfG2Nqp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 09:46:45 -0400
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x6TDkd2c004063;
        Mon, 29 Jul 2019 22:46:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x6TDkd2c004063
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564407999;
        bh=cWonGbORACMO992JEG6wXpUqVMiORjcWPcSpyfVWOk0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YiaN9TvKEiAy5f9FiC7CIBYwMpyY2i4mh9BVD3eZYHuWmzxzbeMeNYnqzqzr2jSgx
         kB1YPbCyWnRwwSpeQNg2EkndNVjq0ItYxyJY4pb0mAVx+3LcB+Da4F5QLyb0hgJ5//
         c9iFonMEFGqEPNojbYIuZjXdjT17oK3un8zV8v/r+9Z/SKHwr49xKSET/QwxpFwfO3
         M1aNvrc3fV+QGQRCx/ljkmpU3S90hU0z/502lt88/HVZY/JhzKKL8jzukKbE3TxlBC
         CA5sCqpmDTAAuYwQ+/zdmZdEwOMWE36BCmCAHrexFtRH2Q4FQZDxyq7JElB175GCRN
         5oCKD/G5U2YMw==
X-Nifty-SrcIP: [209.85.221.178]
Received: by mail-vk1-f178.google.com with SMTP id f68so11958376vkf.5;
        Mon, 29 Jul 2019 06:46:39 -0700 (PDT)
X-Gm-Message-State: APjAAAWzcM6x8MeUZdRCq1VHqSTTXSB74JXUsITWTE3wA2JuZ6DGnYaQ
        q+nWNfpIpZ5EpUiIW/pNFbcBo4xg4CStYRciqY8=
X-Google-Smtp-Source: APXvYqwBJsXVFguSWM2zN6i1W5HEZ0K0TTlacTQ34Up1dQRt6B588UuGnxnYplz478eRNNtsGmGRMZj0/96+C/dgC7c=
X-Received: by 2002:a1f:a34c:: with SMTP id m73mr27781226vke.74.1564407998326;
 Mon, 29 Jul 2019 06:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <1562668156-12927-1-git-send-email-hayashi.kunihiko@socionext.com> <1562668156-12927-5-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1562668156-12927-5-git-send-email-hayashi.kunihiko@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 29 Jul 2019 22:46:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT7irhQWdMkKsY9E8Qwgvwqobs8GF1Mvmoe9wfTqVE4nA@mail.gmail.com>
Message-ID: <CAK7LNAT7irhQWdMkKsY9E8Qwgvwqobs8GF1Mvmoe9wfTqVE4nA@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: uniphier: Add Pro5 PCIe pin-mux settings
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 9, 2019 at 7:29 PM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> Pro5 PCIe interface uses the following pins:
>     XPERST, XPEWAKE, XPECLKRQ
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
> index 1d418e3..577f12e 100644
> --- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
> +++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
> @@ -855,6 +855,8 @@ static const unsigned usb1_pins[] = {126, 127};
>  static const int usb1_muxvals[] = {0, 0};
>  static const unsigned usb2_pins[] = {128, 129};
>  static const int usb2_muxvals[] = {0, 0};
> +static const unsigned pcie_pins[] = {109, 110, 111};
> +static const int pcie_muxvals[] = {0, 0, 0};

Please keep the alphabetical sorting.


>  static const unsigned int gpio_range_pins[] = {
>         89, 90, 91, 92, 93, 94, 95, 96,         /* PORT0x */
>         97, 98, 99, 100, 101, 102, 103, 104,    /* PORT1x */
> @@ -925,6 +927,7 @@ static const struct uniphier_pinctrl_group uniphier_pro5_groups[] = {
>         UNIPHIER_PINCTRL_GROUP(usb0),
>         UNIPHIER_PINCTRL_GROUP(usb1),
>         UNIPHIER_PINCTRL_GROUP(usb2),
> +       UNIPHIER_PINCTRL_GROUP(pcie),

Ditto.

>         UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range),
>  };
>
> @@ -957,6 +960,7 @@ static const char * const uart3_groups[] = {"uart3"};
>  static const char * const usb0_groups[] = {"usb0"};
>  static const char * const usb1_groups[] = {"usb1"};
>  static const char * const usb2_groups[] = {"usb2"};
> +static const char * const pcie_groups[] = {"pcie"};
>
>  static const struct uniphier_pinmux_function uniphier_pro5_functions[] = {
>         UNIPHIER_PINMUX_FUNCTION(emmc),
> @@ -979,6 +983,7 @@ static const struct uniphier_pinmux_function uniphier_pro5_functions[] = {
>         UNIPHIER_PINMUX_FUNCTION(usb0),
>         UNIPHIER_PINMUX_FUNCTION(usb1),
>         UNIPHIER_PINMUX_FUNCTION(usb2),
> +       UNIPHIER_PINMUX_FUNCTION(pcie),

Ditto.



>  };
>
>  static int uniphier_pro5_get_gpio_muxval(unsigned int pin,
> --
> 2.7.4
>


--
Best Regards
Masahiro Yamada

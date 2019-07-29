Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23F5D78D18
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 15:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbfG2NpT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 09:45:19 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:57174 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbfG2NpT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 09:45:19 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x6TDj3T2027235;
        Mon, 29 Jul 2019 22:45:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x6TDj3T2027235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564407904;
        bh=JLUFjbOKV2nbZtck/lHJfZDzqVkrmAgAJ0NT4kGB4Pk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yVyEi/3AxhfcCm94gODojYkps7a18E/mRz1RqzaYL2lwY6tezM/OnVmNctijkA5jB
         kwjDCtjziIroxaRYMe0L42yvPv0qYh2ZCPm/8Bo+Fuw/pirXZXD826Su6inoOcIhYu
         xYWfSop15FR3Se4PmQLBxUWJEi7ONHeKYlCTDN+D1YzmyS3V/jcPcmm3PdRXS6U3PV
         WLCS5KhxCipnkcdvwdlGErPpKXbBikjn0OGM7hcAanvrL81/xx9ZvQkLcFLqIKF5AN
         TTyTj3QGSccrdGP5ZQmKXl6gxjLED5ZtmGtEUys4unz3qxuAY/bKAE0eYgQV4FjZsx
         QONa4YUpX1Bow==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id y16so40731741vsc.3;
        Mon, 29 Jul 2019 06:45:04 -0700 (PDT)
X-Gm-Message-State: APjAAAU/yA0z28DKHeb6PkaZ7b3rP4tFUxssPVVTWq9FesX0RziEuaJn
        iK1t00Lfy/4jUga4x0FUnKSnQJ977lzpxtivduQ=
X-Google-Smtp-Source: APXvYqyBxvnX/hskxLT1gfGXlo1tF2MDV/GDj4ZZRsWqRaqUXU+AAdJ/4SGLb5lBhBeifox3fimyZoOFR3ipsGfkDiM=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr6080037vsq.179.1564407902846;
 Mon, 29 Jul 2019 06:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <1562668156-12927-1-git-send-email-hayashi.kunihiko@socionext.com> <1562668156-12927-3-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1562668156-12927-3-git-send-email-hayashi.kunihiko@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 29 Jul 2019 22:44:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNASuNMij8Fttup6T6hd=vyKSEu=B7HCPMAezWK6T2b0Gfg@mail.gmail.com>
Message-ID: <CAK7LNASuNMij8Fttup6T6hd=vyKSEu=B7HCPMAezWK6T2b0Gfg@mail.gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: uniphier: Add another audio I/O pin-mux
 settings for LD20
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
> This adds support for pinmux settings of aout1b groups. This group includes
> aout1 signals derived from xirq pins.
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
> index 28e54b3..2c66e70 100644
> --- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
> +++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
> @@ -544,6 +544,8 @@ static const struct pinctrl_pin_desc uniphier_ld20_pins[] = {
>
>  static const unsigned aout1_pins[] = {137, 138, 139, 140, 141, 142};
>  static const int aout1_muxvals[] = {0, 0, 0, 0, 0, 0};
> +static const unsigned aout1b_pins[] = {150, 151, 152, 153, 154, 155, 156};
> +static const int aout1b_muxvals[] = {1, 1, 1, 1, 1, 1, 1};
>  static const unsigned aoutiec1_pins[] = {135, 136};
>  static const int aoutiec1_muxvals[] = {0, 0};
>  static const unsigned int emmc_pins[] = {19, 20, 21, 22, 23, 24, 25};
> @@ -664,6 +666,7 @@ static const unsigned int gpio_range2_pins[] = {
>
>  static const struct uniphier_pinctrl_group uniphier_ld20_groups[] = {
>         UNIPHIER_PINCTRL_GROUP(aout1),
> +       UNIPHIER_PINCTRL_GROUP(aout1b),
>         UNIPHIER_PINCTRL_GROUP(aoutiec1),
>         UNIPHIER_PINCTRL_GROUP(emmc),
>         UNIPHIER_PINCTRL_GROUP(emmc_dat8),
> @@ -708,6 +711,7 @@ static const struct uniphier_pinctrl_group uniphier_ld20_groups[] = {
>  };
>
>  static const char * const aout1_groups[] = {"aout1"};
> +static const char * const aout1b_groups[] = {"aout1b"};

If this has the same functionality as "aout1",
shouldn't it be a part of aout1_groups?




-- 
Best Regards
Masahiro Yamada

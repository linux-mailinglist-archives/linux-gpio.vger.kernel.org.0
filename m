Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E53A777761
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 13:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235444AbjHJLlm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 07:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbjHJLll (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 07:41:41 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0167391
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 04:41:40 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d18566dc0c1so765454276.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 04:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691667700; x=1692272500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hx/5YT6XegydpQ9HDHKXuTgMelH8UKyh2sBTXOs3F14=;
        b=zI1ChKG6BqfjxsQCmESQ5twa91fhue0geikSkeOpKgnIixMRg4cbf+/FTiCEQzzA8D
         et5yfTBCE8Y+RPZQzCcubrNaA6ClPkx1nunw3PKvReKZQ6cn0bGbcJEYVX7xFvDbkyfX
         dQJoKGxA0gvnsBV4wUzwWp6Tcjx8GEMLgHJ72fu4o6Ltp5/u8PVWLavM01Tcy+UjB6RP
         6SYeZ4fZwqgmGMHF79vT9z6uMt8ZyP1X1iGojgZmQgdvsXJA0TINASs9X4IJDxl185HX
         DbeTjG0VcMKsvTtfyAR0MFfbk3AnWaIHZTE74fZ8TabxGTQWIst28ALmXKZyYqKoM9Sp
         2W7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691667700; x=1692272500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hx/5YT6XegydpQ9HDHKXuTgMelH8UKyh2sBTXOs3F14=;
        b=Z8iH3iNYl0l3209JDwryWoZI8vZlH11lfneYVgngv9JdcJDwBSC/zc2L+fYwYss6AE
         rugASpF9Yw7Lr0zzM+kt+UWuiJ90HlgTPk5s0RBuvM2pyhX3y00rvb9KtjRBSDQDPm+7
         acIQEO1DjFvMgFTDMmY8NSar/IDUM0DkD/D8krkZzDmgOixdHB8Om2u+kYOc1YkeVANa
         4vdE6Gn0ZWnlO9KY0oEsiqZa67PKYeENwEeDpby0zZ3RFjhYUWlXBsze4OPrYUYPcPlr
         Kpa71YW++CKs7YgijIqDBRrEycoS7tfZ+Qh6iXor6OQ8YSBbXGXuiAMdoCpUnJc0r5EB
         Ku7w==
X-Gm-Message-State: AOJu0Yyz05pPqbuNM4ZTfHI+oijVuLS4xasviWZZAbbpSJDXQ17r6y8f
        9VarC7CXOeI9tekDmOz4NgsqsZ3vtBh85LuEZ05hJg==
X-Google-Smtp-Source: AGHT+IE4BfMBftMeTXrU03NCKJ45qCrOgvo8LFmqhmlU0Il2bHBNJk0wLdRyZNhGZgFS3z9OoV5Mk7FswmxaRX2G6Fg=
X-Received: by 2002:a25:6809:0:b0:bcb:9b43:5a89 with SMTP id
 d9-20020a256809000000b00bcb9b435a89mr2222229ybc.61.1691667700236; Thu, 10 Aug
 2023 04:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230808145601.9401-1-larry.lai@yunjingtech.com> <20230808145601.9401-3-larry.lai@yunjingtech.com>
In-Reply-To: <20230808145601.9401-3-larry.lai@yunjingtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Aug 2023 13:41:29 +0200
Message-ID: <CACRpkdZZ020mQ8MuKzjab3_qwEcPuQ8=OcrRAz6OtN+B9_JgUw@mail.gmail.com>
Subject: Re: [PATCH V5 2/3] pinctrl: Add support pin control for UP board CPLD/FPGA
To:     "larry.lai" <larry.lai@yunjingtech.com>
Cc:     lee@kernel.org, andriy.shevchenko@linux.intel.com, pavel@ucw.cz,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org, GaryWang@aaeon.com.tw,
        musa.lin@yunjingtech.com, michael.wang@yunjingtech.com,
        jack.chang@yunjingtech.com, noah.hung@yunjingtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Larry,

thanks for your patch!

I would really like Andy to look at this, because ACPI and I'm not good at
ACPI.

On Tue, Aug 8, 2023 at 4:57=E2=80=AFPM larry.lai <larry.lai@yunjingtech.com=
> wrote:

> The UP Squared board <http://www.upboard.com> implements certain
> features (pin control) through an on-board FPGA.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Gary Wang <garywang@aaeon.com.tw>
> Signed-off-by: larry.lai <larry.lai@yunjingtech.com>
(...)

> +               if (strstr(pctrl->pctldesc->pins[offset[i]].name, "I2C") =
||
> +                   strstr(pctrl->pctldesc->pins[offset[i]].name, "PINMUX=
")) {

I think there is something like match a string list in the kernel,
Andy will know.

> +static int upboard_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct upboard_pinctrl *pctrl =3D container_of(gc, struct upboard=
_pinctrl, chip);
> +       unsigned int pin =3D pctrl->rpi_mapping[offset];
> +       int gpio =3D upboard_rpi_to_native_gpio(gc, offset);
> +
> +       if (gpio < 0)
> +               return gpio;
> +
> +       /* APL03 board open drain GPIO */
> +       if (pctrl->ident =3D=3D BOARD_UP_APL03) {
> +               int val =3D 0;
> +
> +               switch (pin) {
> +               case 0:
> +               case 1:
> +               case 9:
> +               case 23:
> +                       val =3D readl(pctrl->pins[pin].regs);
> +                       return val & 0x00000003;
> +               default:
> +                       break;
> +               }
> +       }
> +
> +       return gpiod_get_value(gpio_to_desc(gpio));

I don't really like this construction bouncing us back into the global GPIO
numberspace to get to the descriptor of the corresponding native GPIO.
gpio_to_desc() is an uglyhack and shall not be used.

You need to come up with something better here: request all the underlying
GPIO descriptors with gpiod_get(dev, .. ASIS) and store them in an array.
Look in e.g.
drivers/gpio/gpio-aggregator.c
drivers/gpio/gpio-latch.c
for examples of how we do this in other drivers.

The underlying GPIO lines need to be specified somehow, in worst case
using descriptor tables.

> +/* DMI Matches for older bios without fpga initialization */
> +static const struct dmi_system_id upboard_dmi_table[] __initconst =3D {
> +       {
> +               .ident =3D BOARD_U

A DMI table OK....

> +static struct platform_driver upboard_pinctrl_driver =3D {
> +       .driver =3D {
> +               .name =3D "upboard-pinctrl",
> +       },
> +};
> +module_platform_driver_probe(upboard_pinctrl_driver, upboard_pinctrl_pro=
be);

OK I don't know ACPI, but what I've seen the DMI table is supposed
to be used for some kind of lookup, such as checking in .init if the
device is there, so I don't get this. Also doesn't ACPI drivers use
the ACPI bus?

Yours,
Linus Walleij

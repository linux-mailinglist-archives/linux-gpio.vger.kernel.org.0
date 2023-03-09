Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B436C6B24A8
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 13:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbjCIMzs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 07:55:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjCIMzX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 07:55:23 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F82E2757;
        Thu,  9 Mar 2023 04:55:17 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id bo10so1278162qvb.12;
        Thu, 09 Mar 2023 04:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678366517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cUlOpUs0YKH6oxr4GFJidYgbXUmKxgjeJ+EFxxzZ2g=;
        b=WYw2Mu3fvjvXEAtstyD1EYGAFIJq8CwFHS8+ovHQhgRCYUWc674i8yH2vajCzrDWXc
         gGcLdlQn3UFSG10ucwUTS/kU6TsqtIRZGkTHX+MoojgRi+3WjhNPLiUwQKL1uOHmHgdV
         8UxPZxM5YjgeqKltyGwRFrbr1aKZT3R0T+Pr/mjLyfG9sre6ehV8pnMQfPE7ORPktTbr
         8gY8t5eKh1yPVvm5XT4wLzXBb2zmKEGlkG2F0uKWqxWqdsxOrzurFrFOlGyQ4FFRwHNS
         iHAQWCswyz8vyUlwTIsX2olWL9JB5Ct9h/HCDWZVQC/naAZSYvX9uDc6+K6BZ4NpdQ8W
         LpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678366517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cUlOpUs0YKH6oxr4GFJidYgbXUmKxgjeJ+EFxxzZ2g=;
        b=AN6waIeRKEB9ZyS150LzodzXeIoPszIK9b1w8/Uhg7g2weYC/pWEadUlZXRkX7CuHf
         FR24r/l93NSPzSsxoKUdulNRNS7VhwcUDbdSI9Vnh3Lw4PXXBep56zPVIgfJcm7G2GQT
         JzVXEi25rAcpVEZje5/PDgNtMBlEKfu+rRs4xqffGkuLxPAWqboULVv10BwWIFPKUtiw
         Ahz4m4j3MkYM44EqUR4wHFopM/zelijznQsdKQQQ5WgOdYOrtMD7ZLhXYiuZENZiMQMK
         kTo2RJi6fkFNDlRrOfsmxzF/FqEDbfXuwst3btYin3phWXFRKCESxkgXftN2L9xivIgn
         Qq7w==
X-Gm-Message-State: AO0yUKVsHPX0zIhCqiRR7YNAt+ZLjK9TMxJYMD4sO4W2/JrpX31gp9QZ
        2m42xJW7pJwOq0UsisnSgIVZRzdueYp6WT2XEkQ=
X-Google-Smtp-Source: AK7set9lqSfC3Vax4Uzxtk6YeMTCS1tE41JPhd0vujwZIkQxEx+njJJoL38Ppf8P/mOFpkKYBZD3HsPuhv5EXfeoIK0=
X-Received: by 2002:a05:6214:9c9:b0:56e:8fe6:dfd8 with SMTP id
 dp9-20020a05621409c900b0056e8fe6dfd8mr5820406qvb.1.1678366516926; Thu, 09 Mar
 2023 04:55:16 -0800 (PST)
MIME-Version: 1.0
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com> <ZAZ4LY+xG2LGiHwh@surfacebook>
 <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Mar 2023 14:54:41 +0200
Message-ID: <CAHp75Vd6qTG67_1DGiemy8n-mQn=9kiGrC0rEYw2XO0rm4Tbag@mail.gmail.com>
Subject: Re: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 7, 2023 at 10:13=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > Subject: Re: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
> > Mon, Mar 06, 2023 at 09:00:02AM +0000, Biju Das kirjoitti:

...

> > > Add pinctrl_get_device() to find a device handle associated with a
> > > pincontrol group(i.e. by matching function name and group name for a
> > > device). This device handle can then be used for finding match for th=
e
> > > pin output disable device that protects device against short circuits
> > > on the pins.
> >
> > Not sure I understand the use case. Please, create a better commit mess=
age.
>
> OK, Basically pinmux_enable_setting allows exclusive access of pin to a d=
evice.
> It won't allow multiple devices to claim a pin.

Which is correct. No? Show me the schematics of the real use case for that.

The owner of the pin is the host side. I can't imagine how the same
pin is shared inside the SoC. Is it broken hardware design?

...

> > Also it is missing the explanation why there will be no collisions when
> > looking by the same pair of function and group name from different devi=
ce.
>
> setting->data.mux will be unique for a pin. So there won't be a collision=
 when
> looking by the same pair of function and group name from different device=
.
>
> > (Always imagine that you have 2+ same IP blocks on the platform before =
doing
> > any pin control core work. This will help you to design it properly. )

Not sure how the pair function_name group_name makes the device unique.

--=20
With Best Regards,
Andy Shevchenko

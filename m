Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA275578D4F
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 00:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbiGRWGg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 18:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235717AbiGRWGg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 18:06:36 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12E4313B4
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 15:06:33 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id tk8so12477552ejc.7
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 15:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=s8XpAnbXEflWvni+yl25gWJnxrEC+HWpP/MJWFr8nI4=;
        b=ivfnkdfH7ppiKCWvoBqw6RjjXX2zvpTM0RYL/CeZXPRLIMHL96M+DQCaqjvUA6O2nx
         Lwh6dOGo3lYIcbFm43wy9G5oSmop5/xYwdUswW2s2gAJg5b0tRCHv+pO68RrUFWWeeJi
         Mvl4X0B8CPurk6WHtk9GXtJm5zhP2P83sjEigY5x2v9b2A8CCr8K8goBa49Hh4/6VWjx
         0msJ4JQrWDQEnOFBjeLCYUT1JFPXSv3K7499h6Pzg959J9LFHEgn1awrSKd9WBj0al2U
         A8Qm0DPCk9xkU6i+t1gtPIyz18DKS6xjO85WM6BzARIJZEsKrO4EbZtwe4jMhRlI6vJi
         YFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=s8XpAnbXEflWvni+yl25gWJnxrEC+HWpP/MJWFr8nI4=;
        b=Q7BXM61GnslX+ufqOtfQi9J5GV0NOcbuMB0vz+drwcqKwLrrsC4kn2Hr3zHscru48c
         GnCtdYH/DdIXASxtkTa3tl8hhN0pe2khmD7cJcyRjdFeL1BakxJh17KqSZ96BNUprxCG
         e68ntpCcbi3/b6EyJvMM8Dt423QmE3bikq5txF1rPNyaNaJDB5CuFyBkpGrdHB6kR0m8
         7Xg0FzcQcZJ6IeplHCZBdArCaUHi6lyuFE0/kzTnMZ8TjOzBCCL2XJN9gWJ4nI/wmqz/
         Iek8veLicEc/Yy4Fmdjaz+qpAf+v0AgilNh0E9p+TWNfFyDIFC3PsYOKccCH9HqWbmCP
         2RbQ==
X-Gm-Message-State: AJIora8k6hP7dgYFaiZUAnRjkoLbad3NzhXNJozYga2kcJaikF5N1uUF
        5FWmdqDKD6xYEf1PIhZJy6UauWgq/FSrwcELxdTuB7Qx9Mkb1P9r
X-Google-Smtp-Source: AGRyM1vagiqZ2KpSXNK48oL6P8RLg8VwUNHY/RONt7Yn3PQGXDxRkm+cnvTTSYdgpQmAucrNe2QWv1LvwilivN5si+M=
X-Received: by 2002:a17:907:75da:b0:72b:3ce0:2524 with SMTP id
 jl26-20020a17090775da00b0072b3ce02524mr27749758ejc.394.1658181992217; Mon, 18
 Jul 2022 15:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220718202205.ssf3k2dqkuvc6bgm@pengutronix.de>
In-Reply-To: <20220718202205.ssf3k2dqkuvc6bgm@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 19 Jul 2022 00:05:55 +0200
Message-ID: <CAHp75VeRfguxwjf3y3qWSQCwQF=cOFvt7iP0KVJMnGwdyPvUnA@mail.gmail.com>
Subject: Re: Is a multiplexer using latches a gpio controller?
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
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

On Mon, Jul 18, 2022 at 10:27 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> we have a customer board here that uses two 8 port latches to drive
> LEDs. The setup looks as follows:
>
> CLK0 ----------------------.        ,--------.
> CLK1 -------------------.  `--------|>    #0 |
>                         |           |        |
> IN0 -----------------+--|-----------|D0    Q0|-----|=E2=97=81
> IN1 ---------------+-|--|-----------|D1    Q1|-----|=E2=97=81
> IN2 -------------+-|-|--|-----------|D2    Q2|-----|=E2=97=81
> IN3 -----------+-|-|-|--|-----------|D3    Q3|-----|=E2=97=81
> IN4 ---------+-|-|-|-|--|-----------|D4    Q4|-----|=E2=97=81
> IN5 -------+-|-|-|-|-|--|-----------|D5    Q5|-----|=E2=97=81
> IN6 -----+-|-|-|-|-|-|--|-----------|D6    Q6|-----|=E2=97=81
> IN7 ---+-|-|-|-|-|-|-|--|-----------|D7    Q7|-----|=E2=97=81
>        | | | | | | | |  |           `--------'
>        | | | | | | | |  |
>        | | | | | | | |  |           ,--------.
>        | | | | | | | |  `-----------|>    #1 |
>        | | | | | | | |              |        |
>        | | | | | | | `--------------|D0    Q0|-----|=E2=97=81
>        | | | | | | `----------------|D1    Q1|-----|=E2=97=81
>        | | | | | `------------------|D2    Q2|-----|=E2=97=81
>        | | | | `--------------------|D3    Q3|-----|=E2=97=81
>        | | | `----------------------|D4    Q4|-----|=E2=97=81
>        | | `------------------------|D5    Q5|-----|=E2=97=81
>        | `--------------------------|D6    Q6|-----|=E2=97=81
>        `----------------------------|D7    Q7|-----|=E2=97=81
>                                     `--------'
>
>
> So to change output 2 of latch #1 you have to apply the changed level on
> IN2, apply the previous level on the other inputs (to keep the other
> outputs constant) and toggle CLK1 once.
>
> This way you can drive 16 LEDs (or in general outputs) using only 10
> GPIOs. (And with a higher number of latches the proportion becomes a bit
> more useful.)
>
> Actually this construct is a general GPO (no input :-) controller, and I
> wonder if you would accept a driver that models it as a gpio controller.
>
> The dt binding could look as follows:
>
> latch-gpo {
>         compatible =3D "latch-gpo";
>         pinctrl-0 =3D <...>;
>         pinctrl-names =3D <...>;
>
>         clk-gpios =3D /* CLK0 */ <...>, /* CLK1 */ <...>;
>         data-gpios =3D /* IN0 */ <...>, /* IN1 */ <...>, ...;
> };
>
> What do you think?

Bart, what happened to the [1]? Is it abandoned, forgotten?

Uwe, isn't it what you need?

[1]: https://lore.kernel.org/linux-gpio/20220205215918.8924-1-maukka@ext.ka=
psi.fi/

--=20
With Best Regards,
Andy Shevchenko

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF3EE578D5A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 00:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233749AbiGRWMf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 18:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiGRWMe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 18:12:34 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF45F313B5
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 15:12:33 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id v12so17218101edc.10
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 15:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2QVt17zQW633vZxJEnkel1LUXR2DFr8/4hQ8qSpdaFM=;
        b=pQ2RfkWtVBwrcb2wh4h6wFaEJxTEBN7B8A7OGIxZ0ozO7F8EURh7ochh5ybz8pjzCS
         rBF6QqN8W61l+u2s1DcDIiFUzC/RYONKPumObIdmYld0jKhwGuA/xCduJfUR5IBc87yV
         SNg/nwaY8EidvdAdRGN8IAUpAvfRqGif3IzJpoM/sUeYPumsAjsauka3K9Eild/ap8im
         jPB5RiglTbVVVhiQe/o3RNZJkzT7IeEH9wIA7LjmrKXUCph+46hUPSLOUPsgx0xJEv1v
         FoU/gu0vFPYuyVh/YzLIBpxIzMgj14kl+QlmHLRVYxpUTNz55+iv4uBYJlmX3X6CgU7+
         Hgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2QVt17zQW633vZxJEnkel1LUXR2DFr8/4hQ8qSpdaFM=;
        b=aVoZUpDAHQLop0QAxj4ysBP8YIUH55VNQS1jym5Cr8/otmB82Pgc8H0l8Jikx+Jxsy
         LqQ9RrYwrxofA82yigpdoUgvNwQ9LTIornhlfZLBLJROU3ke6aP0pVzgFak/IRFAk2Rf
         EwnUGqxfAimMXpl2wbF2/AhKNF4s/rzYFLAq8C4UXpQyE3wkD/7uhqf2gXrULuL89Bst
         HlRsfZDo/BckzWxzo7LHUD66hflmc51qEtmRlK5cTqbEQwTRfGpJpDi73JOexx5OXgmo
         g39PAfeFn/0JcFwudQL4ajHW3gUuDijvUuPR6c2gUpb4iElq5DuZJbVFKR7cDwOCR3bf
         pCbA==
X-Gm-Message-State: AJIora9jKfSLHzlAIx5Gv8neUmzwk7A49AfYc7h7TYDQ11QaMEP809DD
        eoNELLsnlaytMuTxiwv/2PVtBdKrJrpiNsjqLkI=
X-Google-Smtp-Source: AGRyM1vQ1sBzOEiVlR4DUPx2qIrmCixFjNUqnHvJ+KoIUNhxU1OSD5Z7CyruWYU24ZsUQuYBEwcMVk3LbxUOOCOX+8c=
X-Received: by 2002:a05:6402:2553:b0:43a:caa2:4956 with SMTP id
 l19-20020a056402255300b0043acaa24956mr39088332edb.406.1658182352332; Mon, 18
 Jul 2022 15:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220718202205.ssf3k2dqkuvc6bgm@pengutronix.de> <CAHp75VeRfguxwjf3y3qWSQCwQF=cOFvt7iP0KVJMnGwdyPvUnA@mail.gmail.com>
In-Reply-To: <CAHp75VeRfguxwjf3y3qWSQCwQF=cOFvt7iP0KVJMnGwdyPvUnA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 19 Jul 2022 00:11:56 +0200
Message-ID: <CAHp75Vdx+2zJ_dNAgXHnRPhMn7csX=P-NPcvHWmMJ1iLZ_WYBg@mail.gmail.com>
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

On Tue, Jul 19, 2022 at 12:05 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Jul 18, 2022 at 10:27 PM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Hello,
> >
> > we have a customer board here that uses two 8 port latches to drive
> > LEDs. The setup looks as follows:
> >
> > CLK0 ----------------------.        ,--------.
> > CLK1 -------------------.  `--------|>    #0 |
> >                         |           |        |
> > IN0 -----------------+--|-----------|D0    Q0|-----|=E2=97=81
> > IN1 ---------------+-|--|-----------|D1    Q1|-----|=E2=97=81
> > IN2 -------------+-|-|--|-----------|D2    Q2|-----|=E2=97=81
> > IN3 -----------+-|-|-|--|-----------|D3    Q3|-----|=E2=97=81
> > IN4 ---------+-|-|-|-|--|-----------|D4    Q4|-----|=E2=97=81
> > IN5 -------+-|-|-|-|-|--|-----------|D5    Q5|-----|=E2=97=81
> > IN6 -----+-|-|-|-|-|-|--|-----------|D6    Q6|-----|=E2=97=81
> > IN7 ---+-|-|-|-|-|-|-|--|-----------|D7    Q7|-----|=E2=97=81
> >        | | | | | | | |  |           `--------'
> >        | | | | | | | |  |
> >        | | | | | | | |  |           ,--------.
> >        | | | | | | | |  `-----------|>    #1 |
> >        | | | | | | | |              |        |
> >        | | | | | | | `--------------|D0    Q0|-----|=E2=97=81
> >        | | | | | | `----------------|D1    Q1|-----|=E2=97=81
> >        | | | | | `------------------|D2    Q2|-----|=E2=97=81
> >        | | | | `--------------------|D3    Q3|-----|=E2=97=81
> >        | | | `----------------------|D4    Q4|-----|=E2=97=81
> >        | | `------------------------|D5    Q5|-----|=E2=97=81
> >        | `--------------------------|D6    Q6|-----|=E2=97=81
> >        `----------------------------|D7    Q7|-----|=E2=97=81
> >                                     `--------'
> >
> >
> > So to change output 2 of latch #1 you have to apply the changed level o=
n
> > IN2, apply the previous level on the other inputs (to keep the other
> > outputs constant) and toggle CLK1 once.
> >
> > This way you can drive 16 LEDs (or in general outputs) using only 10
> > GPIOs. (And with a higher number of latches the proportion becomes a bi=
t
> > more useful.)
> >
> > Actually this construct is a general GPO (no input :-) controller, and =
I
> > wonder if you would accept a driver that models it as a gpio controller=
.
> >
> > The dt binding could look as follows:
> >
> > latch-gpo {
> >         compatible =3D "latch-gpo";
> >         pinctrl-0 =3D <...>;
> >         pinctrl-names =3D <...>;
> >
> >         clk-gpios =3D /* CLK0 */ <...>, /* CLK1 */ <...>;
> >         data-gpios =3D /* IN0 */ <...>, /* IN1 */ <...>, ...;
> > };
> >
> > What do you think?
>
> Bart, what happened to the [1]? Is it abandoned, forgotten?
>
> Uwe, isn't it what you need?

It needs "downstream" GPIO and ->get_direction(), etc should act accordingl=
y.

> [1]: https://lore.kernel.org/linux-gpio/20220205215918.8924-1-maukka@ext.=
kapsi.fi/

--=20
With Best Regards,
Andy Shevchenko

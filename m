Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEDE46C8B3
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Dec 2021 01:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242823AbhLHAeP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Dec 2021 19:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242303AbhLHAeN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Dec 2021 19:34:13 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C074CC061746
        for <linux-gpio@vger.kernel.org>; Tue,  7 Dec 2021 16:30:42 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id r26so1713101oiw.5
        for <linux-gpio@vger.kernel.org>; Tue, 07 Dec 2021 16:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Nfzrxbng620nq55va9tM6ci7p9ooL9rZlFRg4+vJocI=;
        b=XyVq5SFNrvOi4TkILERaoNaya5/oARhF1g7bse1eQ30DGYzdyEjXYazTaTvR+Zi/LS
         h/zipq06MtE3fOmvK3hUyIOK5pfNHm+XY3y9ruxiVEQmZMxbANHglVpVEXQsPMqA5nDO
         YplHNbkXiTURZp3f4PylfGreENdjRAuCAiNGV1v+TaYyQgszNb9KV8Q/veZn2iky4V1C
         AcN44GXRBaMhOLngi/KlutgK2wDaTM9DpSFPnQBNV/G+RK+ro1NYTR1OJPOXH4p3GIeh
         j5fk/qQHvSzIRut0kX59Eq3UYkRkqMDOSYVKXiaIZrHjOrOuj2rrx0JBVNiA43QBeO9J
         qOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Nfzrxbng620nq55va9tM6ci7p9ooL9rZlFRg4+vJocI=;
        b=STl+p/s2LDfuRl8R6a+3M8fEcL0ae833hmH7rqrRsEKPGR/7A+QqMYrMpcHjC9hemn
         PHqGM4DlYx5M9XY45k7GpGgkkA4uy8A/LUE1HyfjsV3wgJAA2xZ23AAL8alxF5QWT+yn
         fQG3zAYImh2QKHvzVPRZsOz19Lv8ckVWxjYLN321LKwDqvfsMv2s65AzuOgX5xrDFW5L
         0n8BrIN0uBUFxhJg/BfTRXu2L0pq02grF/abCA1H9YbqAnZa6FSMk4jY8lrTynammDci
         G9nIPh+/UyHakwvYAhsbzWTfLPRsiyscytYeSnu8LW7drQbzmIi7bjaJU+3b3BTph4Ga
         g+og==
X-Gm-Message-State: AOAM533eYSWT5t7y102fGnS7s9Tw/W8bQJY97C/gvEqcD1OdSf7ZYt4K
        rOqoS36se9uCrbF3XtRFwCJndPMSbPagL5rSWx05og==
X-Google-Smtp-Source: ABdhPJw9S5TQMu49bJHYKaS5oZkP3xYufwZOfM+nx3Jf5zHddvMejJrdZNbZn2yAn2uQ+EXDKtzbO8g6TUrMN8xcJFA=
X-Received: by 2002:a54:4791:: with SMTP id o17mr8686539oic.114.1638923442094;
 Tue, 07 Dec 2021 16:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl> <CAHp75VcPhSvQvjA5WBO72Lb5idc6vkkodai_V=YmLWtsz-qg1A@mail.gmail.com>
In-Reply-To: <CAHp75VcPhSvQvjA5WBO72Lb5idc6vkkodai_V=YmLWtsz-qg1A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Dec 2021 01:30:29 +0100
Message-ID: <CACRpkda2d9j7_HOM1Q1dEsK+U4-4KmbvjvTAEvx2AbxMQtOgFA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] pinctrl: can_sleep and pinctrl_gpio_direction
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 7, 2021 at 11:14 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Monday, December 6, 2021, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrot=
e:
>>
>> Hi all,
>>
>> Based on this discussion:
>>
>> https://lore.kernel.org/linux-gpio/CACRpkdb3q4-9O3dHS6QDWnZZ5JJjXWXS9KPv=
wXVaowLMRhcejA@mail.gmail.com/T/#t
>>
>> I propose this RFC series.
>
>
> When I first saw your report I was thinking about actually adding a new c=
allback ->set_direction_atomic()
> and then make pinctrl use it, otherwise like you do, I.e. issue a warning=
 when it=E2=80=99s called in atomic context

The problem is inside of pinctrl core, not in any driver. It takes a
mutex when going over
the GPIO ranges.

I suggested maybe just replacing these mutexes with spinlocks, or RCU.

Yours,
Linus Walleij

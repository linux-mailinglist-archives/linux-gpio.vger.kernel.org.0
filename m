Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04456271E1
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2019 23:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729752AbfEVVs7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 May 2019 17:48:59 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41768 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729381AbfEVVs7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 May 2019 17:48:59 -0400
Received: by mail-lj1-f196.google.com with SMTP id q16so3506134ljj.8
        for <linux-gpio@vger.kernel.org>; Wed, 22 May 2019 14:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iOQBrNwTYw1SJ63/WnHNyssBXV9YJJ2k4UCp73ToEmY=;
        b=qp7ksrqLx5ft/ImrAs4PupVHbiOySR7j6SkKW6uxuR8rBj9z12Uj+F7+UyVWnv3ZHz
         W/Ns+ZonjORK43hZe/WgphVUkLMjHRH7+C2CNrYMyTxOBeGlmhgZvFCL3PHMXZmIupnV
         Y2hwr1kXNAqp9r+XIOwauIZzoI8Lf/63GwjL23s1Vuiuc+XwA+i9mAAypjha7jlDGIAc
         X1S4iBB9s9w2hOve0jwvAT44+DQbAXUFZIBTrQLJLV064mcfUB8fUhoDVxPJogbRtnJH
         JgXNXOCEvNqmZWHkGd1aN6+yQ+zGUCJ4ndPiPzuSsnpNVvkz4tIcl79YBJdEbf44d11d
         JSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iOQBrNwTYw1SJ63/WnHNyssBXV9YJJ2k4UCp73ToEmY=;
        b=g3OYVBgyZ5ozCghKLb47vpryT73WUdFeQqfvYLQcLjrGgXX/X20Ngv6BUbR/bcMxN1
         HUrWlnL2U02JrKQAl9Ie0v0NyDFZ8sTFQNRI0rwepj5uzNFwAb6BTNQkmZRG6Ck/l1Pb
         nUg/QCksz8DOs05eTOyIu5+3l8X9Gr4ZWjiaksNkA5nCyYLvgpsMk1tp4NZnwwdLEeI1
         aVHI1p/x72u1ELuhEdbXUJLr5s7ldtWzUB1ltYo2ilW9XFRGOYNe3WNMEMpD6qaX7/2S
         lkExdGHo/9DPthY83ognRTGyQ/EDsp4aVZwgrGogkuUogwCSW2xxcH2gP4joh2ND0bDz
         /n/w==
X-Gm-Message-State: APjAAAXiJjZZPjr83+x22t6aWNu4WVTr/GJmPFB9Je7tfiq10sEZ8FZT
        Fhmr0JdDVzA8pbSl0Je3fbsvb8wu/WWCrmhTTp6cEA==
X-Google-Smtp-Source: APXvYqwn7Y1cj8wPhej94OTp0JB16CcRc/bDKnwG8PWg9M3eToMM02XbJOSHxYn9oeKK6KCeZ6o6KloIF4NRh2kbJzU=
X-Received: by 2002:a2e:95d2:: with SMTP id y18mr24141079ljh.167.1558561737233;
 Wed, 22 May 2019 14:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
 <20190522054833.GB4574@dell> <eb8425ec-989a-9701-7fee-61bd1d2b93c1@st.com>
 <20190522084133.GF4574@dell> <bc1b5f1d-23b0-141d-f58f-b54ac303fe20@st.com>
In-Reply-To: <bc1b5f1d-23b0-141d-f58f-b54ac303fe20@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 May 2019 23:48:45 +0200
Message-ID: <CACRpkdYmdpwEvCBrL6i1V+Zxd0OSpZmD8BJPSZu9jYNeJkoimQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is
 not defined
To:     Amelie DELAUNAY <amelie.delaunay@st.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 22, 2019 at 11:21 AM Amelie DELAUNAY <amelie.delaunay@st.com> w=
rote:

> ../drivers/pinctrl/pinctrl-stmfx.c:409:20: error:
> =E2=80=98pinconf_generic_dt_node_to_map_pin=E2=80=99 undeclared here (not=
 in a function)
>    .dt_node_to_map =3D pinconf_generic_dt_node_to_map_pin,
>
> OF_GPIO depends on OF.
>
> So either
>      depends on OF || (OF && COMPILE_TEST)
> or
>      depends on OF || (OF_GPIO && COMPILE_TEST)
>
> and
>
>      select OF_GPIO

I would use just:

depends on OF_GPIO

Because OF_GPIO already depends on OF, and
compile tests will not work without OF_GPIO which
require OF so...

Besides it is what most other GPIO drivers do.

So just keep that one line and drop the rest.

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 951CB21B93D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 17:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgGJPSX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 11:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbgGJPRr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jul 2020 11:17:47 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDB3C08C5CE
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 08:17:47 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e4so6890620ljn.4
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 08:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MBzd4hH+xPa5cF7la/kEb0Nq4FT5rPywUwxxeRP0m34=;
        b=M0mq7C3QBlaEOLnOCZmhgM2MN0Zmag4gdlB/fhTCAniT2to+O/qQQPQFgTIeYlu3/U
         2YXqlfjdhejw+ZHKaTUyNRcciJeAjPrtyCUuom3EnwKp9SaQMwDzPFw2SGcIqMv0uVKE
         t6iZjPgQV44AXsacEaDOJvzq59ZEUruDI5zPMHgutVxL6aTPM6yK8NMDEFGfmweIYOkT
         aCgr2TcQECncWnJ8IDQEK4nDD7ruv/u1S06moasIAyqWUE8sKpOBA58VXsN/kUlaAYGS
         uEQCMVM4TTFRQyD4l2xlcTjOBNsn+gWwx3JG4ZyyLFD5kTa/7x8NMxILq7DZeNh8DKm7
         JiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MBzd4hH+xPa5cF7la/kEb0Nq4FT5rPywUwxxeRP0m34=;
        b=P3PtVo17AXk9gezHAaNHlkIUAcApGObS5pPtZmiO45+6ZdnHKR6R2aZKAGBvUwADnw
         jvxbiA6v7ZngY0ISiAExQwbbEGr8O2JBKPzaCec+Yow3y3cg3CgM8onR3MwQadVxG9R+
         tSa6TeaCvPTjt60zwTvqzy2wQWgiZkuvP4rjOerTYMFZz8Fh2W+8NGbiitm4iIe/L/Up
         3RT/a/467YsHZKuHIqfn/mJHtgRKpDoKvZVaEW1/+BRBpGggHhxSyLzUBC3sutWj/Dku
         9X8gHkOuHhCUYnO3ff/U0UKZ5MknWgk7PpNShk/UOmLDDZHY6EFNVM8zF0CUcUW5yZMN
         /1IQ==
X-Gm-Message-State: AOAM5333raXfKcx3CsH59itOpDRFNX66hrhxIiunsGT8MhJ4tvWzphVj
        xMAY1Gr66p751Gsk+HqLdT1w1eRob44Ko7qrB+7QPQ==
X-Google-Smtp-Source: ABdhPJxRJJCZmyMgIi7ROiq/VnFe3L6378lev7x65S/YgiNtVOyASHMYenf1xU7L95S0S6KO7wz7zEeyvO+aDEGd+/A=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr34496205ljg.144.1594394265987;
 Fri, 10 Jul 2020 08:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200709063929.9789-1-uwe@kleine-koenig.org>
In-Reply-To: <20200709063929.9789-1-uwe@kleine-koenig.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Jul 2020 17:17:35 +0200
Message-ID: <CACRpkdbccHbhYcCyPiSoA7+zGXBtbL_LwLkPB3vQDyOqkTA7EQ@mail.gmail.com>
Subject: Re: [PATCH RFC] dt-bindings: gpio: introduce hog properties with less ambiguity
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 9, 2020 at 8:39 AM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org=
> wrote:

> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> For active low lines the semantic of output-low and output-high is hard
> to grasp because there is a double negation involved and so output-low
> is actually a request to drive the line high (aka inactive).
>
> So introduce output-inactive and output-active with the same semantic as
> output-low and output-high have respectively today, but with a more
> sensible name.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> no code changes yet. Just asking for feedback if you consider this
> sensible.

It makes sense, and it is in line with earlier inversion problems that
people have had.

Could you use the properties:
output-asserted
output-deasserted
?

(The anglo-saxon can maybe comment on whether it should be
"deasserted" or "unasserted", sorry for bikeshedding.)

This was the terminology we discussed wrt changing the prototypes
of gpiod_set_value() from:

void gpiod_set_value(struct gpio_desc *desc, int value);

to:

void gpiod_set_value(struct gpio_desc *desc, bool asserted);

This latter simple semantic change over the entire kernel is
something "someone should do" possibly with a script or
Cocinelle.

Yours,
Linus Walleij

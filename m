Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2F382A7860
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 08:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgKEH5G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 02:57:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgKEH5G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 02:57:06 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD673C0613D3
        for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2020 23:57:05 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id 126so928004lfi.8
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2020 23:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=308hJZzaUbmvdeU54RQUNo8pQhYrFfiuEQmHsqSUMhs=;
        b=lHHA3F+j6jJOXITRA7KesznGB7VEYOeoHiKIVjdrK4MaiIGlwgL2s7HfGM8t4YmjAR
         IPscvhLw0bGvf/bJsGGSTXhbgpylfVvl/VBvMeJdKgrxldgmVewtHHDy02H9yXZVW1Hk
         rXXnrqM3Zghn9J4fm+sbZoPTK+dgekCFpQ7qvEP+FEB+TPTRSUSSJ3FTANRbHzNETr8Z
         sJ1sZzjJXx9NUlfQi/srVNhvIpUwqmE3KwYMo6A1z1u1ma8fsH2VvXS/ge8Ff2nTJHVL
         9k72VfLBM1NFV2qbicOskSJkcA62twAmVJoT4jWy5ggDaiMZwmqkZg79cOAXgvpBu0kz
         Bvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=308hJZzaUbmvdeU54RQUNo8pQhYrFfiuEQmHsqSUMhs=;
        b=mOzYD9TB9+E5WnZh160c3k68fZr66npjT+4BjHa/6aS4FaUsFG4U93Afgu+lZP0XK6
         UM+7DLAfIsjW+/aSoT0k8kjiIVYuyCvk91LjajHDOSrMhKIFvCrPaJv3X+tkn+MO6boI
         6woGkvf+fqt6ytkavweSTLzYTTKF8U2w9N1vKg1pGaN2pMAeGYwhwjmYo3ZbaOEhttF8
         hwVO0Fim3wldTiPm5UH7snyLsoZg+ykkxv1yf7hPj5Doo1FnZD9KKL5ODk6O8tFiQK1f
         N4yJwdKYhM4MaGujsAYY5xTrY79UWRqhXBWRUItE1I8CEVAlqEDDkCm8pYCP954gdCq0
         aw/A==
X-Gm-Message-State: AOAM5303T99xXjFz0O+Y7jAtrwcyWXzGEhHcC1ErqWQJTlrTEjf47AIO
        gDxv6XVHel4DpXdhdJPV9i8wXem/jqyJdEDP2r2UZw==
X-Google-Smtp-Source: ABdhPJx16ZrBT1WG+PwPGLY85+LISLAnsGCJv8llI9La0Ohi7AJGnXDejqIaHXt2hwlZrKqx2cBKbJdNwXec7/1JTZ0=
X-Received: by 2002:a05:6512:322d:: with SMTP id f13mr452676lfe.571.1604563024053;
 Wed, 04 Nov 2020 23:57:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl> <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 08:56:53 +0100
Message-ID: <CACRpkdb=XisqsuGSftKo4GbRm37av3GFCJUhcD9sH369czc=Cg@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: tps65910: use regmap accessors
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 27, 2020 at 1:59 AM Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.=
qmqm.pl> wrote:

> Use regmap accessors directly for register manipulation - removing one
> layer of abstraction.
>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

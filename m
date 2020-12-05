Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA4C2CFF81
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 23:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbgLEWYh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 17:24:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbgLEWYh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 17:24:37 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2340C0613CF
        for <linux-gpio@vger.kernel.org>; Sat,  5 Dec 2020 14:23:56 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id r24so12684784lfm.8
        for <linux-gpio@vger.kernel.org>; Sat, 05 Dec 2020 14:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rtueaL/2T+kfYoehWzI4q5sv0eJHKAAbwWAcuBOxVmQ=;
        b=bNqblOsVxlUxovVmNPGElMq6nn508+RPSEIh3zDSBO+rdAXafZCe/AgIChAinRihVu
         1DgHeY2jjUI5RM3II28XU3g23BvwAou3MkSy63YGvgZ6ZlrlrGAICm8a1pwbUM1y/FrT
         uEblCF2OscLR60zavKDL5NiducT/70E97B6Ukbye20u3tabxTQ9aCDC+d4oI4yfymszM
         OqtsrW5ns6N65wSn4yyV5dI/5j9m8HEjmeU5vrUMfCgFdl6+/2Zv9HnLPpCa9L7HJoHl
         EsrxnQhQvcojXvdKF31Y23LK8bl/6rZoIofALVJ3MPiGDhVZ2sP6qbju9qGvAotgFwrR
         sETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rtueaL/2T+kfYoehWzI4q5sv0eJHKAAbwWAcuBOxVmQ=;
        b=cmnje/6jfSlhDVGvQFGNX2M6d9ZzpEY/cLELRlcQU79f45BKcDQ5nwID4FhsfWvZbl
         jrOoGZaBhauuFQP9l6wcNhIut1nWfo8wRlwfyajEJ81iYEZUkZtd4wV3DTEU2IBs6t0t
         aCQQVoj3lmZ89NsJXnzKtbNA5wfs0Fe/G8Kr91t/oJW9yIcfO1oeAKb+1iKuPPNzDRG+
         j/dTrphPDvlIcht3UPDTlBpxnKEO6ggzsFppr5OrEnwxMQgm9Pt/1QuUB1eA6PybZe1u
         EM+5IO2OXEbOVJ6JONirvA4RiQWLfd87cuH3IsVVHDVLPQC8vdSrpSZLE8CzsmgCaneR
         yBTQ==
X-Gm-Message-State: AOAM530wQEIjWjH+SE+B3tk9rCFOZAs1BNdyY6ohX6kwmfO4gjkrrkah
        C+8kKfS9MqatIl6+RAle/pMzZqPDz+/CSpWy+4xmyw==
X-Google-Smtp-Source: ABdhPJyeTUZrB/GIwlYkQiXOIIfREuMiljhZLELv3swyL7PaQ3D8mrFdb8t5Tr51vtaU+3IuGnuyyxzIhuqbFixNMVY=
X-Received: by 2002:ac2:4308:: with SMTP id l8mr5341405lfh.260.1607207035463;
 Sat, 05 Dec 2020 14:23:55 -0800 (PST)
MIME-Version: 1.0
References: <20201014231158.34117-1-warthog618@gmail.com>
In-Reply-To: <20201014231158.34117-1-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Dec 2020 23:23:44 +0100
Message-ID: <CACRpkdYbh4GGKqSPa2vOjkr1FJHdSGg9D7xdpD8VPTb3zHQCuQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpiolib: cdev: allow edge event timestamps to be
 configured as REALTIME
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 15, 2020 at 1:12 AM Kent Gibson <warthog618@gmail.com> wrote:

> This patch set adds the option to select CLOCK_REALTIME as the source
> clock for line events.
>
> The first patch is the core of the change, while the remaining two update
> the GPIO tools to make use of the new option.
>
> Changes for v2:
>  - change line_event_timestamp() return to u64 to avoid clipping to 32bits
>    on 32bit platforms.
>  - fix the line spacing after line_event_timestamp()

I applied the v2 patch set for v5.11 now, it seems to work fine!

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61CDE1D6014
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2020 11:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgEPJlo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 May 2020 05:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725997AbgEPJlo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 May 2020 05:41:44 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AFA7C061A0C
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:41:42 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id d21so4756311ljg.9
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ETnQEurEj2D9S0skz5vWgXCGMnqttYf8X7vq+AyGws4=;
        b=hbdzU3b1sUtVTpY94DKNXrGnHP3CM6+4lLyAdYNx6YAjjHqouc3xqKHTr1Kora27l8
         s+PGJ/ZkScqc5OhvSCPkV40a/pB2zVYyJ4k7SlmIs1O71UYd27JLlmN0EVhourGSv2kJ
         GR7Jd+MZqulDetVv923CZqSAmratk3mzrAawCcTdNNNPtcXOjL8ro4Z9S4scL0CHunwv
         aiK6LXOUXNNdlWwbNsQkqm4RMrRR10z/NKwzL0wPK2vJ06ACPNFoVi6OirpuEnOCrwoH
         WhTQKduxvKAkMo4jyO7pDUZFCth2yvlIGaD3Igog/6fpitpBsqJjNvQ3vn8OGGdRhmrj
         /r2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ETnQEurEj2D9S0skz5vWgXCGMnqttYf8X7vq+AyGws4=;
        b=K31x8M0UXF6tZWhzWAvBTBxg0NuCy1+XIqcV9t2q8Kms3qAwufxBi/8Xg1EuLG7b1t
         rcerLst99qBGng/hfjh1YSIOubVnqaTSlGBVl4/OS+RuU9Q3gEGDOPx0CnugFWD2pDlr
         5T/u34H/MzsI55al6DBT3nUajWKx3JertPdR5Oo0bkJY3zSawzYz4RmMmq2fpiReTR/W
         e3fx6vhKv0zZOwLBg9vv1R9rO05L5Vbhxhljqv+k1slDgt6EqEVM6On8c8D3hJJSuAYG
         Er6AnkBNeZl5fIZ0S5SB6XsYI9anG/olCsJFCQSejuIKm5MycgcUOpELDgPgeQtYNsLY
         0+xA==
X-Gm-Message-State: AOAM533+fiALkbnzbScwackOZoyvLcTCukKeOx4Pp26nqybN5khBHRxk
        PaUKxgL+VImSQIGKHt8qvg7WnAYJSxXaM6M3KBkDQQ==
X-Google-Smtp-Source: ABdhPJxDkwfUTvewS4ROJo+TNf5A2Ro2WwL7rcwxC/8KOUEXpWDdaTekM+CoT//aGEX0bP7RFp6SZcRNMEiVw0qQ2+Y=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr5010874ljh.223.1589622100904;
 Sat, 16 May 2020 02:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200511101828.30046-1-geert+renesas@glider.be> <CAMpxmJXD9WgrFnKvS2a=iOCVuYiqdTGwp+r2BjOv2RJH2R=s1Q@mail.gmail.com>
In-Reply-To: <CAMpxmJXD9WgrFnKvS2a=iOCVuYiqdTGwp+r2BjOv2RJH2R=s1Q@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 16 May 2020 11:41:30 +0200
Message-ID: <CACRpkdaJk2G8MF6UMVSc2LdFPdpm9L2hox3c-rxD6RhyMg_25Q@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Document that GPIO line names are not globally unique
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 12, 2020 at 12:43 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> pon., 11 maj 2020 o 12:18 Geert Uytterhoeven <geert+renesas@glider.be>
> napisa=C5=82(a):
> >
> > gpiochip_set_desc_names() no longer rejects GPIO line name collisions.
> > Hence GPIO line names are not guaranteed to be globally unique.
> > In case of multiple GPIO lines with the same name, gpio_name_to_desc()
> > will return the first match found.
(...)
> This makes me wonder whether I should do something about this in
> libgpiod? Looks to me like gpiod_chip_find_line() and the global
> gpiod_line_find() are no longer reliable and should probably return
> all lines whose names match.

Hm. You probably know how consumers of libgpiod work better than me.

The background is historical and this happens because gpiolib had a
mechanism to name lines before I even took over maintenance, and
that did not require line names to be unique. So
when I created the character device I had to face the fact.

We also had to deal with the fact that when naming lines, the
"NULL alternative" (no name on the line at all) is always a valid
fallback.

And all lines named NULL are still valid and all have the same name
so...

Yours,
Linus Walleij

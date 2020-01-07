Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D266132157
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 09:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgAGIZ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 03:25:59 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:34404 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgAGIZ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 03:25:59 -0500
Received: by mail-qt1-f196.google.com with SMTP id 5so44689183qtz.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 00:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P1qNd7psLj1vN7YrSNjPLisR1SYB4sdk/yxx7a4dqv0=;
        b=bzrYxlco4uNeu7RE3s8e2uVp04X/ylErL+05vS7qIpO+v/86iOTebSWfPL5kFVs1ee
         vQlUC/RCwSEJjK/JplOZO0A1p5YdUhdaUBPkIhp6gWYMNeosBUUwPH+/Uch6kg19MaeN
         mqHSzPq1GskwNO05/rUG2U+JMl2Y9BrePYB+scQSMkzxn9cjXxvsSEUwPFMFzFbw5QEz
         L3UFTxDcGYy6VZkM5z+aWtlCpDKj2o95XuLrHr8mJu5Q1RGEnFSlQv2Buz3+x8z4A1Wl
         0C8JA879OWzxmHzfBCefMKAyftykJuQYapTgBDT2/VtRyGBBdLuy+EgGLy+/CX5vle8o
         USDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P1qNd7psLj1vN7YrSNjPLisR1SYB4sdk/yxx7a4dqv0=;
        b=FnnN2QBkXzy2Seox3m91HN3hB8GMEs/pdvzM1SyIKXqSm4w5/aAv8lU9J1Q/IUe8Pg
         5zKHAiDcH5SyblM3b/Faam7oeeesTJWKT2uYV2wTMP4CkVVB2rmCSWBQKZPDHhxCRII1
         +6BtY+2acOUQJfinmhyZeW9Sos6Cm55WrT2VUUfmHFLpp5lrSMuL7l1oLlzztPGEvMOg
         SE5Kb857YgzYPZ5Kch0ZGtCbLWT6EXyGX5loEDwpOP3WBGWyiYzITBSOOKwzPDPoyVP1
         cERS+YUeOnj2Fy2NR1k7n/P47ARuKhdRswmofmbFUGK5DP2b71I5hbe06jLrcVbjdK+E
         Pa/A==
X-Gm-Message-State: APjAAAWvWKqu/PyaCzO5C/5k4/jwPDJAnDy/j5iodAu8grGhT83RgrsU
        j+wu+IrH4K0FR45cV4H8j1ayTDTePLCZVrfeTJAbbA==
X-Google-Smtp-Source: APXvYqzjhkSvCozGISHl98iBSuMlg0RKAZKkYeLKPjudgFxA5+wsaLdBqZ41PxHunEVSDcVUly1rZyC2ez3w7BJow5U=
X-Received: by 2002:ac8:6784:: with SMTP id b4mr75846060qtp.27.1578385558120;
 Tue, 07 Jan 2020 00:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20191215183047.9414-1-digetx@gmail.com> <CACRpkdYAKS50-CNmE0nRNQanFxKejoHrwxho3fZXROoLZUb4+Q@mail.gmail.com>
In-Reply-To: <CACRpkdYAKS50-CNmE0nRNQanFxKejoHrwxho3fZXROoLZUb4+Q@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 7 Jan 2020 09:25:47 +0100
Message-ID: <CAMpxmJVi1hy6a72M7rAHP0AXW1Z4cGp8H0O6ayLMwFm9UL3WPQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Tegra GPIO: Minor code clean up
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 6 sty 2020 o 23:59 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Sun, Dec 15, 2019 at 7:31 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> > I was investigating why CPU hangs during of GPIO driver suspend and in
> > the end it turned out that it is a Broadcom WiFi driver problem because
> > it keeps OOB wake-interrupt enabled while WLAN interface is DOWN and th=
is
> > may cause a bit weird CPU hang on writing to INT_ENB register during of
> > GPIO driver suspend. Meanwhile I also noticed that a few things could b=
e
> > improved in the driver, that's what this small series addresses.
> >
> > Dmitry Osipenko (3):
> >   gpio: tegra: Use generic readl_relaxed/writel_relaxed accessors
> >   gpio: tegra: Properly handle irq_set_irq_wake() error
> >   gpio: tegra: Use NOIRQ phase for suspend/resume
>
> All three patches applied with Thierry's review/test tag.
>
> Yours,
> Linus Walleij

Ugh, I now noticed I responded to Thierry only after applying this to my tr=
ee.

Anyway, it shouldn't be a problem. I'll take more care next time.

Bart

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90D6D5507E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 15:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbfFYNin (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 09:38:43 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41106 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbfFYNin (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 09:38:43 -0400
Received: by mail-lf1-f67.google.com with SMTP id 136so12664161lfa.8
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 06:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LSvTpOLyyXh49qYBGomCHftsOmnYZkhBKlFO4JP7Wco=;
        b=M1mbYUFtUWy7KV2CuQ8M5nj8o/ooJsFihAJz7osC5AgX0PriOKLOv/57c+Ud2pPZYz
         WabUrZRYC8iJuFTzI+CQWCu+xBqiuAf8oRQcslmGumQMVZ8/HwBktQVUQspZBYce1zfd
         taGw+T6bJepqGs0Y5bw2kZRLDxW4ifJKz3myqKSs5EOoMyqCaY61mJtrIZyu7pBjOPZg
         m6FQARBJw27QQbskEvQ3AdcukASou0VIzpTSRdz1ayrC68xRuw55bhY/bfgKdqRJoDng
         cO9dQwy4TpzMe3SEJovusplELhe37+JoMC9g22TShMSob/tkCjfUqp2LJKCayQgtTFzk
         DOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LSvTpOLyyXh49qYBGomCHftsOmnYZkhBKlFO4JP7Wco=;
        b=Ujbm2OXwjnphfRtKq+RxcBrLG+RO2/YW5oxPGP8kEbVd9VLBQvt6XQVtVV+NxJBtLb
         nrmJZwijeTlffzW7fJqBOdYk0DozjE6fandST9mj8LGJKOll8z8wYXTJ+jMTgoA+IMXW
         /Q33gULfUHmAatEBGgom8MRe9NtpY2HAIAZUk9ag54CvY4/V/fJo2MYTm4IYDeQMZE/m
         AwOgvRRDniQ6MwyaU3VvtK1H6j4mS5kTdamvesHiArgLWh+tghRdWVVW2CgD0RJ9Ta0V
         glbJVvm+WClwJEEBIbRmoD043t752gAyDyctQwVVy+Nk+kX0scn1JzvnBu+fN6pv1wRP
         2Dfw==
X-Gm-Message-State: APjAAAWAGUAQSp61w9+TB/R2sPR8N/9OjPmXH6JX6aRaKIgOAnZZlqxk
        +TYHGbv94y5X7t73a36qs7BdsO80grLeh0XqAcA+Kw==
X-Google-Smtp-Source: APXvYqw1szRm5IYELBubgoE074wOtxRYIQ93MVfFMiHW+jrrnby9r1otXbCpvLC/2ZO07gSJ2SF1xJN/82oqxqNsyBo=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr25221480lfm.61.1561469921507;
 Tue, 25 Jun 2019 06:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com> <1561345379-2429-4-git-send-email-skomatineni@nvidia.com>
In-Reply-To: <1561345379-2429-4-git-send-email-skomatineni@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 15:38:29 +0200
Message-ID: <CACRpkda0=HeRco8kExdf6TmiLOnCec3Ek06s-MdjNJvVGw3ZNQ@mail.gmail.com>
Subject: Re: [PATCH V4 03/18] gpio: tegra: use resume_noirq for tegra gpio resume
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Stefan Agner <stefan@agner.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        jckuo@nvidia.com, Joseph Lo <josephl@nvidia.com>, talho@nvidia.com,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>, spatra@nvidia.com,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 24, 2019 at 5:03 AM Sowjanya Komatineni
<skomatineni@nvidia.com> wrote:

> During SC7 resume, PARKED bit clear from the pinmux registers may
> cause a glitch on the GPIO lines.
>
> So, Tegra GPIOs restore should happen prior to restoring Tegra pinmux
> to keep the GPIO lines in a known good state prior to clearing PARKED
> bit.
>
> This patch has fix for this by moving Tegra GPIOs restore to happen
> very early than pinctrl resume.
>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Can this patch be applied in isolation from the other patches?

WOuld be nice to have at least Thierry's ACK on it before I
apply it.

Yours,
Linus Walleij

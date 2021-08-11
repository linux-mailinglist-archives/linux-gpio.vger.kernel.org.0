Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0403E8CC7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 11:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236321AbhHKJEX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 05:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235902AbhHKJEW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 05:04:22 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E002EC0613D3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 02:03:58 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id h9so3382585ljq.8
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 02:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yfj42KHxPMVmtJg396WnGN+LpkioAwqLUSTvDjH+oO4=;
        b=gFm6cO8eTmlgX16tbdhRpHgSqwyC0Cqztn+02tzdbLm+WZeoZXySH+UXcncpWt12Dd
         2Pig+K15tbN50iDtGYJ/77QsJtZefLLRM+3otAaAFr5ZRQNIMaeTzQy3ogArumEPrj8B
         9yxEY5Y/nCqY8EEjkO7e0byxRPFEguwWol57bPDu+6GcNkoFQuNVAYerYpmG8J/+FrB+
         3sG3c4V2w0YFGtHU0xGC9SezoOg6nAYGO/tIOyWBTzvfVYO5lynMZG3zM4cwRQoONdli
         yvHBjW9BqZHSh/rMxjqlq1ceUvuNqBvVMeqg8FFsF4SOLooy8q9lZiM2bfOPzXuBNW5Q
         sK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yfj42KHxPMVmtJg396WnGN+LpkioAwqLUSTvDjH+oO4=;
        b=UTeUYrbFe+4WNlsODhIMI/aBrqNh5xefdSWSMBq5r6TBoJ4X11U0P9QxO+sL7wtSmB
         SMD//CAvbfApj5QnYwQnb+oYOU5DN07MLtd5QfTmZ5GinmA2+eY8jh/x09TwHOGptP+z
         FtBR3OZeyW8B9NW9Q9m+rzFpe9Gad7Ssk/5XNZ9gFTS2RFCTD1co7oRrYFlV+jVebwaN
         GQL+4I6zICZx/EH1jD1DA6i6Eb2INbVUyk0IHu+vEDb0qZFJzUvqhqLVqsEpgFKwvGsL
         pbv2bg27dfUjeEskyC9MqT5fngcMxIu3Oz8hR/Rc2m8A0d96AL1LbE6Chtzk8sDiaSWB
         ETFg==
X-Gm-Message-State: AOAM530bOhCT8m2W/EMVOl7akRzPK1kHZVF2dzG5lGc89DVqbgRqqK0v
        bIFJbl8D6n1pa8aItd5+cxxMAigs79x/vE6uY/w+2Q==
X-Google-Smtp-Source: ABdhPJyNY94nczC2kPDrtmSJ30d69h7ydl+BK2umxWNNGDkg1mg3awt0R/CRu8GIXmXzBKN0i3YlELKp2YF6IcwvvSk=
X-Received: by 2002:a2e:a4ab:: with SMTP id g11mr29387ljm.273.1628672637309;
 Wed, 11 Aug 2021 02:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210728041253.15382-1-sergio.paracuellos@gmail.com> <CAMpxmJUnXpOhvaQuNPbFt3TY363vrsEWV1KXxhyBm7cJ-PWvwQ@mail.gmail.com>
In-Reply-To: <CAMpxmJUnXpOhvaQuNPbFt3TY363vrsEWV1KXxhyBm7cJ-PWvwQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 11:03:46 +0200
Message-ID: <CACRpkdbHzdCnHB8358Wi6zojMhfi5urhdm2XOiPmhph7q_L1ew@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip banks per device
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        NeilBrown <neil@brown.name>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 29, 2021 at 7:43 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Wed, Jul 28, 2021 at 6:12 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:

> Patches queued for next. Thanks!

Thanks to all for fixing this hairy situation with composite
GPIO controllers. I think there are some more controllers
that need this actually.

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82F4511E770
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 17:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbfLMQDs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 11:03:48 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35908 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728029AbfLMQDr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 11:03:47 -0500
Received: by mail-lf1-f67.google.com with SMTP id n12so2345078lfe.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 08:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kvwPLR8XH8zayvVN3UCZB+7bnWFYQS/MV8OjCwXgshE=;
        b=Lm3EUMhHLF/p5ts9CtLbB2fyDZXRoWjputOXrBtc8w7ehCGKjKtMXvoPrTasEbwr9L
         Q3AtGb4t5b12A4UETL2BUWgG5Cn3ExxVW9Yl6AUo8cXmMYvCfobKGRsZm6pxrhmK0a9z
         6zhXvlJpLeBhB8oPfsi5pCryXMJx1gJbvGiSkKx+RtK40sUMHfAm6omvG+NKM8ZxMty/
         w20SMAR0w64D3FA4cvC4PtT51ker8sPYcr61mC8aVoUs/PGoA1VNm+lQDmAsk/4duDpA
         C1NaXWrGkDcKqm5BN9O+v2tClo6BGzebqA+UgrlOucQnwmsRGpCP/fmpfk0BdXurfeE0
         TwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kvwPLR8XH8zayvVN3UCZB+7bnWFYQS/MV8OjCwXgshE=;
        b=lFAl5kGDfk3zmFDHM79Xd8bjdQyctKE/hKVtMgidt5VvSezlopgXCMv4uOp4zDc4xG
         UOnQmAKZNuIVJPedd7loVsWuQvqPk9x3840xk25voO2kamlyKLyNzixhKst86cetCPKN
         7Xf6V50JNRgfpxey1404LH3FiLvTZM+rhGCIMem0QuTMIRvjwRD5R/KXB9YsbKWhwazj
         VVqG63jaSUNaLa7zb2rGyDyVRBqXCiRwIQZsWRJUzwqbv2SNrvoQkZEuddGcvvVfQwc3
         5E7KDxPJmvTSuVMnGla5I9fcG3zyKaXYE0QdIdlimb3+Nzyzaphn/XPgiic342cSfegB
         b8CQ==
X-Gm-Message-State: APjAAAX+Pz08BVlLccBziRKuKptliCvBxnsc78tq21msTfKTCzLhS84M
        UQGok6JXkdjtZ/FrhAhkVo5KQ/XEuUuxHKWI8AFZOg==
X-Google-Smtp-Source: APXvYqzlUqj1JYbmvToLn4WKba8fTKOUKLwpvrIjGBIxwKCLtbdTwf4N8ZSiv2/s71Wmfh8n29zU9ltAma3PI2ii6Ck=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr9176651lfi.93.1576253025593;
 Fri, 13 Dec 2019 08:03:45 -0800 (PST)
MIME-Version: 1.0
References: <20191209163937.8156-1-krzk@kernel.org> <20191211182739.GA6931@kozik-lap>
In-Reply-To: <20191211182739.GA6931@kozik-lap>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 17:03:33 +0100
Message-ID: <CACRpkdYX+-GWvUhhXvJiJ1bCib-qjyEvZ0qYB35q+OT7hy=56Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: samsung: Enable compile test for build coverage
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 11, 2019 at 7:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Mon, Dec 09, 2019 at 05:39:36PM +0100, Krzysztof Kozlowski wrote:
> > The Samsung pinctrl drivers require only GPIOLIB and OF for building.
> > The should be buildable on all architectures so enable COMPILE_TEST.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  drivers/pinctrl/samsung/Kconfig | 8 +++++---
>
> Applied both to my tree. I'll send them to you Linus later in pull
> request (unless 0-day catches some build failures).

Ah I see OK that's fine, forget my comments about not being able
to apply patches then, I'll just wait for the pull request :)

Yours,
Linus Walleij

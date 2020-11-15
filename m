Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79FC52B35FF
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Nov 2020 17:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgKOQEX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Nov 2020 11:04:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgKOQEX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Nov 2020 11:04:23 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25775C0613D1
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2020 08:04:21 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id x9so16898578ljc.7
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2020 08:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hCr673H/Yn2fBC5SYLBr7olqdWNdjytKrx20Eb1RGVw=;
        b=Y1yenbxWDkfp6xCuUVaoyoH6kkg1EhpLcv9ArvNBhmN46Z9cff6JZZ6Afhami6ZQo2
         U1hVMjaI9dR8fUbLLCJhAlOStQVhXW9D0s6UJ+63LlrYW2aFJqJtfhftR5din1wi9nJn
         eUhh277sLy1LNbxZpKXpazh06bitrGt3OPOBRitkoi6p4KYDwizA8h5h8u6Dxs6Mjoef
         eExiJsZFd5DZKvrqXOzhYAk5RmWR99snbBih2emQo9FyLe01EkG03fNsT5g3+aiKV9ey
         1JiOGfOSu70TA8sgS5tO4Qo5QPwa2aKdZJx2Gz4IXcLoQEG2Y0EOE5vXjknB2UE3o5JU
         vGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hCr673H/Yn2fBC5SYLBr7olqdWNdjytKrx20Eb1RGVw=;
        b=P+20nzIE3Xa1Qbs9frqM7Y6rizpDVcRxsAX4yDpeM6V7Pb+YPVund50sud5yIV2Xkw
         a965YjY37DbZRaTCTEOluVQNP+J1bkPZIvZxIqUz11FfGS+qjpb198wBNe4jlyNH4Qrr
         r6pRtCh4oNnoL57P/3ffe9uTR1RHHLVIBPcZytjOLCE+jcxp3dGQCGs94V+GohceEbI5
         jjhI2G6hG1oANp0JRfrCJSLg/1C9rOk8IZSpn1hgG62/u5XUZklwKS+B0wuz6WocJuoR
         u9S884CNGADSl8W9yotzW6yPAzmB+tYTBVd9UYthx2jc0UGzSRNpU8ueqaxY1qYtIV5e
         ajXA==
X-Gm-Message-State: AOAM533qZEv82qBWdNwRv4fKOMSoC3pnvj8J2Hqjz8Q0+NuIyw76xQxt
        FP5d/DSSLOPkqCRzYUFTOwfry96/A35vuWQtL4OZkA==
X-Google-Smtp-Source: ABdhPJxCYu3rejDRIFy/zJ5yaEV7Z8FhFZgnK0LcY7vDHTbFtfw1DRWxcCx239SpOYESERCqBaKtQ9/3J+YQuBu5wLU=
X-Received: by 2002:a2e:95d2:: with SMTP id y18mr5218966ljh.286.1605456259664;
 Sun, 15 Nov 2020 08:04:19 -0800 (PST)
MIME-Version: 1.0
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
 <CAHp75Vcfr-=v5Ba3VhR5NTnJM3gEYevUNJUdBnhdh4YUvTzVLA@mail.gmail.com> <CAHp75Vd68Kb+b4PoZ-LZcs=Bqx+t1wK7pi_5JyRLpKdr1=uMfA@mail.gmail.com>
In-Reply-To: <CAHp75Vd68Kb+b4PoZ-LZcs=Bqx+t1wK7pi_5JyRLpKdr1=uMfA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 15 Nov 2020 17:04:08 +0100
Message-ID: <CACRpkdawP_6MKx803ecQMtZ-DgnNbXKt2uu4GGHrvfK+-REudg@mail.gmail.com>
Subject: Re: [PATCH v7 00/18] gpiolib: acpi: pin configuration fixes
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jamie McClymont <jamie@kwiius.com>,
        Coiby Xu <coiby.xu@gmail.com>,
        Vasile-Laurentiu Stanimir 
        <vasile-laurentiu.stanimir@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 3:16 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Linus, Bart, it would be nice to hear from you about GPIO library
> cleanups and in general about the series...

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Can you send me a pull request for the contents of the v7 patch series
so I can pull it in?

Yours,
Linus Walleij

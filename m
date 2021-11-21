Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30154458741
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 00:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231770AbhKUX6s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 18:58:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhKUX6r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Nov 2021 18:58:47 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C601C061714
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 15:55:42 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id t19so34414203oij.1
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 15:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=udpE3/zEru3Mj9IZ3w84u936favJ/D9k+WiEZ+0XTXc=;
        b=xBZGeDl/Y929xwm6HBgZVrdBxoqRbALrFi4KfiYU1T6Ckuuse4pcZk7S+YYkwWBMnm
         Xn07mwHcZgq/iKYstp4Xhrs81e/0wpnAsnJr7tUFLuUbiIWdlKtplzVvoFioaKsfZ3gu
         qJw8PLLYxLQepRcebguJiTPCo5n6Z/EHy8Tie0BMjonDtBcEvpDqV8Fqop87bHYc8o59
         Q0OagjwL1RxWGbQo+BwpYH7z2/U8OxjlH2a6I+B9NTVPFxbpX2GsfujVjBMPwvhxoQn+
         DqmZ4MM91ubG96O94KyJXkHCzOH1hXJU3jJqNrfl3pM4HcZbQjFPPmGhgd/Us+GJPUb7
         MVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=udpE3/zEru3Mj9IZ3w84u936favJ/D9k+WiEZ+0XTXc=;
        b=FqtlDBbJnkEih54lL6rjUMugYJPx1HpxpGB6YRCSiOcrH7FOxVZmnLaysp0X8rwZ7x
         AupOIpMuGRKRiutBXFiMyFfdBMl5DNGcKXiWtzWFrvtlRq3NNIIiMhU4nHmWUEF7sZZd
         7parIxsWVQhlDUUcLUQzuy3W2I2HZwB6+gosU2k2ZOwCNISa2rIMaFvydSzMuDGXCja8
         54oyotDb/gOn3TbKQltM/bHuOf2CSX5fw96rAosRSH8hrSkxUrZteOPPVsvpo/hl7FAe
         G1JylVDsH43AJfxEZ37H7Axbem9bmc5C0zz9dXydK/uSfDsDKRng73e8Fdxy2bijTSb3
         bUiw==
X-Gm-Message-State: AOAM531UmD94q9QuSvxGXo8kA172E0BgjhechiRmCodWFVwAVq6d9Fy4
        DP6FfCkQ7aCgBU9wxmrzolNfyF2OrLFB1mcOTyyukA==
X-Google-Smtp-Source: ABdhPJwbOG5ndds+RoCXADWk+MVC3NLd2ex5UxdFPAfqd1zU+VvJcfpSeCgctGGvnF2DXrZZjLcnkFI82xOcZ/C6CpA=
X-Received: by 2002:a54:4791:: with SMTP id o17mr18060160oic.114.1637538941705;
 Sun, 21 Nov 2021 15:55:41 -0800 (PST)
MIME-Version: 1.0
References: <20211118145142.14519-1-brgl@bgdev.pl> <20211118145142.14519-2-brgl@bgdev.pl>
In-Reply-To: <20211118145142.14519-2-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 00:55:30 +0100
Message-ID: <CACRpkdbu=6XGQjfg+59h167i3Buq5ikPAVpnu_H7m8YW7wLXGw@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] gpio: sim: new testing module
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 3:51 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Implement a new, modern GPIO testing module controlled by configfs
> attributes instead of module parameters. The goal of this driver is
> to provide a replacement for gpio-mockup that will be easily extensible
> with new features and doesn't require reloading the module to change
> the setup.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

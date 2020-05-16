Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4851D5FF7
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2020 11:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbgEPJXq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 May 2020 05:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726264AbgEPJXq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 May 2020 05:23:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B39C061A0C
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:23:45 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u15so4757429ljd.3
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ng5C8qf/Nt+8gpVeeV4P3Xvp8a/ob86c/GdMNuqDnds=;
        b=K/Y9pUOQ+3Oupn6rhtT42v7jtiCAWeqgGanLpPXiMh4aj6FAqRAtC5UAY3WAbP3KtI
         CFW16Zc6qogMxR5H3AK8E6Ev/WW3ybIZ+KdP//x+Mn6qrufOb8WkBqfVzu6Gik7YKCwr
         CWb29z82DXXcUpo5iJJKQSszV5vEoCKFN0+hPrkyieBhp/m97Ayi+ztUjgc4AIg+j7UX
         lCq7Kour3guwwSX42EXHSENPZMuA5ZCTX1CLpbmO2aAzo1mc3QDNrgJym4wZjTps7vYH
         SAa3OdWFaflfKLcvIhhr+nMutpNj8Aqk9sKcbAZM1MDTWq+3C3VfgePmbYGsnuFFnY7J
         xSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ng5C8qf/Nt+8gpVeeV4P3Xvp8a/ob86c/GdMNuqDnds=;
        b=GpIOQxpwSTZ6KICZAZSiTWp9yL+DWlahGhKIIBwPipYKhWn/0ZMReuqp2o1CDYL+V3
         b1Z+tmTsL4/0fbaGG5/5JGz8UhY5ffyB2tg6xEgyyj27pTVXS4CSVZt+wM7KbVz7PJqJ
         DwF3TlArWp8O5lgpybu4nflttB8XYk80DZNTMpftsJD92i/vzUOoNtKREoLN+RNjqe1G
         tFb8xZC8+zQivWp5M5rsHbneaXnJIdzOeAdRBOyfBINXuUwpbLDfbGFUgEKmdUcrdcOy
         8QrUKD93c3FSQ+NfXAUcXinPQKfuFJdq0ja5BClr4nZxvmzjBqHk0TOnrVw3nlNEL38A
         22ZA==
X-Gm-Message-State: AOAM5326dXiY/Nyl6BoLmEEsilmDINfNjRIWvTfOrqhcdrODTUVgQwAm
        GbVqNEKVjTb9/XCJWE/4A+9097IOKNqxExTvS3Tq9g==
X-Google-Smtp-Source: ABdhPJwBG6Jia5zGuqqYIE6pBh0mzFfZbFFdRkhraTVqK4iU7vgT8wBplSbDrH9vt+rZxavtaUJF3CQ24QqoHRBy+W4=
X-Received: by 2002:a2e:b609:: with SMTP id r9mr4699485ljn.125.1589621024005;
 Sat, 16 May 2020 02:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200507113751.24213-1-geert+renesas@glider.be>
In-Reply-To: <20200507113751.24213-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 16 May 2020 11:23:33 +0200
Message-ID: <CACRpkdboTjDZ+=MGJD74u2OrMHGRjmDQyUsEKJ3+KOSfU-x14w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Add ACPI dependency
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Ken Xue <Ken.Xue@amd.com>, Arnd Bergmann <arnd@arndb.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 7, 2020 at 1:37 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Currently the AMD pin controller driver supports ACPI platform only.
> Make the PINCTRL_AMD config symbol depend on ACPI, to avoid asking the
> user about it when configuring a kernel without ACPI support.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied!

Yours,
Linus Walleij

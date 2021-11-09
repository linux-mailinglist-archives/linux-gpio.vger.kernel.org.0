Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020E044ACEB
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343643AbhKILyJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:54:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343639AbhKILyI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:54:08 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61CA4C061764
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:51:22 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id m6so7258508oim.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kMK6SnHP7XOL/nzbm1KS22pVeT/yVqRtpG4D5bAlLtY=;
        b=o9FwO7JCulklcAOt08HURze6MgADdmgcfLw3Yl4MCHTMoFLONnBFI0Vc09v1fn4Ru1
         a8sSgNlHwT73XBbn3Rtvl9qOR9H/8XdGjeZ2kt9amCQmP/vrh9Ql/m9TqCEzKxmn2ck2
         1iZItOphR9RBsP/Wx5Rh7PRHJcs87JiPoPXQLYosgsujYhKXvfklJlb8zp2WDcG+SCLz
         Zh5hPpuhnG76txv0tu3QIahyuXIMUFjknLT4m3kjK66ydWl3NrN61xyanki+aMIiExYK
         kz6K4gZOzlyomsHYCPRrpYTMDak6kyS29r3Z+mBeSKbX/Bb9XbUjiEnUBJ6FaLtnuuQE
         K3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kMK6SnHP7XOL/nzbm1KS22pVeT/yVqRtpG4D5bAlLtY=;
        b=dUP5tm/frtSql/uDuQX78a2Bc17tsbAQAE25m8Yvi6rR4hkx6ZxQm5cyIb8gy8qKSA
         co6nklFcYSjK+fposciBirmTR5Fv+qDWrl07jiQywU9edM/nqMARFnp7SHgBRFqzDl64
         RtCy8rHQ2g2ODwr2W/qkV+SLyQl/W1KmglMgexCThnHEnt1692qur0RhoZGEr1FqZzEu
         6srPgxxYI84dr1xa2FUD1uCZ9JL5XCVkc/e05JdmXLQ4Jdtzg/Ny1gel1p9VK+OiY+GS
         knz6WPM7Nvmadz545HNZirdWxkJeEb6aIyiBIZKZ0AQ5HtKQxv+uqlzjWQeK3cpE5o8i
         RbeA==
X-Gm-Message-State: AOAM530XtkkBhLs8Agz/USNSsEcHrGR1XTW8gnVIGiMhr6MXxvrd6Zy4
        Nzxi11eYUgsxbx1tHAJMa8BcZMyj0i9xzMAY8N8qMw==
X-Google-Smtp-Source: ABdhPJzh5h6N1umE+Ysu5XocKatjpgfgpDggcSizG4BYyhksOtzOtMD8oSphQQMP0yAmmkHhJPnOvtLfi83T4u+8cUM=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr5237493oih.162.1636458681847;
 Tue, 09 Nov 2021 03:51:21 -0800 (PST)
MIME-Version: 1.0
References: <20211105130338.241100-1-arnd@kernel.org> <20211105130338.241100-2-arnd@kernel.org>
In-Reply-To: <20211105130338.241100-2-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 12:51:09 +0100
Message-ID: <CACRpkdZ=z2YZ0rtD3=xqEQOMbwph-BEb-3xP_LajCzykmpYgSg@mail.gmail.com>
Subject: Re: [RFC 2/3] gpiolib: remove empty asm/gpio.h files
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org,
        gerg@linux-m68k.org, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
        dalias@libc.org, ysato@users.sourceforge.jp,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 5, 2021 at 2:04 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The arm and sh versions of this file are identical to the generic
> versions and can just be removed.
>
> The drivers that actually use the sh3 specific version also include
> cpu/gpio.h directly. This leaves coldfire as the only gpio driver
> that needs something custom for gpiolib.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Excellent!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suggest Bartosz can queue this in the GPIO tree.

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 556252A9787
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 15:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgKFOU6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 09:20:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbgKFOU6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 09:20:58 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70CFC0613D2
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 06:20:56 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id e18so1440977edy.6
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2020 06:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XvGhP5pLsf0B0u2tuGH3UbcyyuOyAH/WnGeMUTp7xNw=;
        b=A5bYF8XZhmmzbd3kw/XPVAZwdDIzVf5dHAPaW+k1HHXVHxlZAmC7I8DEpPVvS0hSLB
         S5WNXGDGWUu3m0XWFUSksDqA+5BThBp0Yr1/rU8OXHKYO3tJ/mOC7Z7NSAfa2NIzG5HO
         9ac9tYUoaQvOlSFFQaYWjJnUc7mSJZEURAEyvtEFGuLZ6zELs22Eu2l+YU3N7lVrZRzE
         0zkkzxDre7ShKg6+Vi/K6xujbxG4jWDNlTtEi0YCu+RoGWfQDDN++4WPdrXMpdsWAT8h
         AtPIgFygGFT+TaLg1txvuyH8RC6t6dECkMiuOPXDyY80VIdYtovRY2o6h4oFR8QPsPed
         xp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XvGhP5pLsf0B0u2tuGH3UbcyyuOyAH/WnGeMUTp7xNw=;
        b=qC6OsqBOmRkyGSy6Vdc75iQHAIbPwv+d88cfKE0Ekb606H8/GmLfJMUCcu0btyng5y
         qfts7kMAM18pzVUzkxO/YbigTk3XGu6kPoUZVod/SMKBeplus1KS812znxhBhd9Z/WBZ
         NJMunukS3kT2/gaVZ7ASjNgQ9Gj6CeCu2Z1tV5Fl5wf5jLtFsotteqporl5Bc8LamJaL
         UirXyAfuInFtA5Ma9AKOaOfMFme/vVpBPFCKJUrWyrVg97wYnK9M04TVoOeHkKpsryDX
         0H36X1UnB9FS3Zk+444z9RN5IEyV3xGabL38fFevPQwHmMnizXtrImqRqI1YNmNaCRcB
         kopA==
X-Gm-Message-State: AOAM530DZl2tSgI5pdpBb7HwfYw3B888vhccMA+7Uh0F6cphy2PNo4pI
        egHL/ouwWNm71J0pd2kCRaENFGzyCrBHx4bu5rV5xA==
X-Google-Smtp-Source: ABdhPJyLAuO4e9Xu8isMl9ymdQ7AI+ydtOG1AwlidXvhIBrkX9CnRqhd3kfJL4eIm3v1nON8i4JlLMbpTvPHazNZM1k=
X-Received: by 2002:a50:e442:: with SMTP id e2mr2312104edm.186.1604672455336;
 Fri, 06 Nov 2020 06:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20201104152455.40627-1-quarium@gmail.com>
In-Reply-To: <20201104152455.40627-1-quarium@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 6 Nov 2020 15:20:44 +0100
Message-ID: <CAMpxmJVFBRwzzyLxi1DQ2ScrggfETFy-5g2bN0Avo9DK5V+GFA@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio: pcie-idio-24: Fix IRQ handling
To:     Arnaud de Turckheim <quarium@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 4, 2020 at 4:25 PM Arnaud de Turckheim <quarium@gmail.com> wrote:
>
> This patch set fixes the irq_mask/irq_unmask functions and enables the
> PLX PEX8311 local interrupts.
>
> With the current version of the driver, gpiomon (from libgpiod) or a
> poll(2) on the sysfs value are not working. According to
> /proc/interrupts, there is no interruption triggered.
> The main issue is that the local interrupts are not forwarded by the
> PEX8311 to the PCI.
>
> There is also two bugs:
>     - The IRQ mask is not correctly updated when unmasking an
>       interruption.
>     - The COS Enable Register value is not correctly updated when
>       masking/unmasking an interruption.
>
> It seems this problems exist since the initial commit.
>
> Arnaud de Turckheim (3):
>   gpio: pcie-idio-24: Fix irq mask when masking
>   gpio: pcie-idio-24: Fix IRQ Enable Register value
>   gpio: pcie-idio-24: Enable PEX8311 interrupts
>
>  drivers/gpio/gpio-pcie-idio-24.c | 62 ++++++++++++++++++++++++++++----
>  1 file changed, 56 insertions(+), 6 deletions(-)
>
> --
> 2.25.1
>

Series queued for fixes, thanks!

Bartosz

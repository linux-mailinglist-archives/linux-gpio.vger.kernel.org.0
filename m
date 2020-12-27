Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBF812E3307
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Dec 2020 22:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgL0ViD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Dec 2020 16:38:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgL0ViC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2020 16:38:02 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E388C061795
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 13:37:22 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id o19so20168596lfo.1
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 13:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+i5gcSrm6q/8nFooRN/AQ71bCz7/QCSgRKeWd4XhemA=;
        b=bQeRFwvT8c9tCXwanLGGjLqZ0d/EnrhH9dwzmzhyS34cOmBIWXgHKX4tqUKrBQgu5c
         ON5sts08nEqoAqnNrpLwkbDxcEpThc17qIM+33kJ5EQkhPOCoHN1S285W46SOjmdGQy8
         ttb9NPM1eMw9RUfQrmxOLwb/9DKioxl3BGxCgZ1S1z0eS3IJVPNgm6GpIrOnWltn8pD2
         OsIX0whzoNDsDNKIpcCnPBn7XFfGBbYtVNtM4LsjPjhIyEvb3baH+o8hKoSSPLkzA9Z9
         Z+xvfQqckTejGcNvN0QyGgdxvn4Qe2ww+zP/I9Oga6Z7loS4s02jlBO/7Jin3t2Qckc6
         AYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+i5gcSrm6q/8nFooRN/AQ71bCz7/QCSgRKeWd4XhemA=;
        b=D7kweTSMgHgM09nKG/iD/QbZsf4Y8H4c2eE6cFOi/6DkF/jvKHmqLSBqwB0+yyGgcV
         LtB+qq1Z2rCp45OKDrsVwP2AdiTNE8hZ28rQZTodOy/K1TJoOpaovX4ar3BDLFpvxXpp
         uOZ6XiJv8xu305tYvBo/jgnG+S45AkrInl3cR59/VXUjS7zGve3Uw/W9iFIkpKAqOXKf
         hPqu2/Hw+wgSeP99YF1Om9/dhOHarTysRfRIHPPf4Pk4ZO+Zx9rH4fCa9OlEmjJ6LEfs
         xmOi/0ylYCzjGB1yxMMIvN80o6UbDpP5xtz8r2xcWjrtF5AbHT7GOIIIpCo/KGfxP2M3
         CquA==
X-Gm-Message-State: AOAM533GcnhoT1Y6vP+d1MnwFh0fNEjaThqb8AjoyrC+AAu506gjWIz3
        /mnFsTN1LXnR84mtVvPofbiohyYRpKJyQuRr6r4eQQ==
X-Google-Smtp-Source: ABdhPJz1l0q/Rz6oEDylYqSr4C7rGmi78uW0PNdYU5Ir6hn1cuQIRPrSVr5XZuuUdp1TxdfW+enmU9jJaGU7CnHUxy0=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr19639077ljl.467.1609105040797;
 Sun, 27 Dec 2020 13:37:20 -0800 (PST)
MIME-Version: 1.0
References: <20201227161040.1645545-1-warthog618@gmail.com>
In-Reply-To: <20201227161040.1645545-1-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Dec 2020 22:37:09 +0100
Message-ID: <CACRpkdYk9U_=AOyy7NSKL9+Aoe0+qCdZVN9EXWLn7NUcUajipQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: fix frame size warning in gpio_ioctl()
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 27, 2020 at 5:11 PM Kent Gibson <warthog618@gmail.com> wrote:

> The kernel test robot reports the following warning in [1]:
>
>  drivers/gpio/gpiolib-cdev.c: In function 'gpio_ioctl':
>  >>drivers/gpio/gpiolib-cdev.c:1437:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>
> Refactor gpio_ioctl() to handle each ioctl in its own helper function
> and so reduce the variables stored on the stack to those explicitly
> required to service the ioctl at hand.
>
> The lineinfo_get_v1() helper handles both the GPIO_GET_LINEINFO_IOCTL
> and GPIO_GET_LINEINFO_WATCH_IOCTL, as per the corresponding v2
> implementation - lineinfo_get().
>
> [1] https://lore.kernel.org/lkml/202012270910.VW3qc1ER-lkp@intel.com/
>
> Fixes: aad955842d1c ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

That's an interesting regression.
Anyway the kernel look better after than before the patch, so
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Bartosz will pick patches for Torvalds this kernel cycle.

Yours,
Linus Walleij

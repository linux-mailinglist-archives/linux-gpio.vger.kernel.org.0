Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E523BF2886
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 08:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfKGH4P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 02:56:15 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35663 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727415AbfKGH4P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 02:56:15 -0500
Received: by mail-lf1-f66.google.com with SMTP id y6so850951lfj.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2019 23:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7mVzEAC3PYZ6lpwiL+xf/9aZ7Qv1sjEzD+JY+8MBtWg=;
        b=o/vg6xLElk2f7BrBS3YYNQnsdnM6poifIjeLagf3IT4HY0bFneDxgynYdByIcS7dHo
         EzLmS6pL/TyvIYJdQEOzBEsnwOAM7Njv1CFAh7AuC54CbmAw47HZJmHVO7et+nczCN+W
         7+8o/Voh8wDjNUOFjhCx4CMK4KOz+BHiUSJCtkBLzC40fA5Qb0zg2BvUW7Hm+07pAMXB
         0lLuQBKWtKJ5TGKj2EMx7k5O722aqWp0xbmm+Bc3j5P+DXUw2Q0hnvWWj88ZONlxPSjo
         npqEAZU/xnP17zcGp5HbfLkqVBsC7eilbm/0NAMCMG057MaAubYC5365OtbgJSB2ih+c
         McEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7mVzEAC3PYZ6lpwiL+xf/9aZ7Qv1sjEzD+JY+8MBtWg=;
        b=j0pS/dxglx5BTsZRPblghEgB61U0qAi3Yk+BN6iGQ73x88E8J+FsoUXMtJz2R+Znw7
         s2tAkh5FtXg1Gu6mkzr37TY7um+6mlc0y4cBOolk6ioC04qXiuEKb34uTloVvSz1S7Nm
         jS30BFOVcXJhmrXSV1spajzOXoWHVliX1B2znyjQ4C8IsZktLICUGWYJ9QjfSoehfsis
         SIsTjr23HGneum1NCm/XddGtBCtw4b33vcUOXVPYnQADnGf8LjQFwHY8AxtsxuKUiBlR
         L+AHHwjklxkK+p+85eZvN3/pnxm8Q+NvzFC0QG+J/sFxo8UP1Uh4Uv4XbE2Z3mGSnsrg
         lZ1A==
X-Gm-Message-State: APjAAAU8CeGT3AcGX9EtrYUPOXJykX4MH/Rt3HV2MgltlLigRbcMoDnK
        J5uXTrL/WEEgg7EyuslnGC3mXAnbnsntV9/petGfhJh/F+c=
X-Google-Smtp-Source: APXvYqz/ohb7JsLP5oPlc3mF5OTWP6CRzEQS9/wJ3HgdeOitF87zrMa4v8J9ow3u2rGgz4TVrAbl+ne6JhgEadI2dHA=
X-Received: by 2002:ac2:51dd:: with SMTP id u29mr1354160lfm.135.1573113373506;
 Wed, 06 Nov 2019 23:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20191105124915.34100-1-broonie@kernel.org>
In-Reply-To: <20191105124915.34100-1-broonie@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Nov 2019 08:56:02 +0100
Message-ID: <CACRpkdYps-xADSrObMyF4bMK8vm0bbE+d_o2V9W4iTFBTYBmTg@mail.gmail.com>
Subject: Re: [PATCH] gpio: xgs-iproc: Fix section mismatch on device tree
 match table
To:     Mark Brown <broonie@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 5, 2019 at 1:49 PM Mark Brown <broonie@kernel.org> wrote:

> The table of devicetree identifiers is annotated as __initconst
> indicating that it can be discarded after kernel boot but it is
> referenced from the driver struct which has no init annotation leading
> to a linker warning:
>
> WARNING: vmlinux.o(.data+0x82d58): Section mismatch in reference from the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gpio_of_match
> The variable bcm_iproc_gpio_driver references
> the variable __initconst bcm_iproc_gpio_of_match
>
> Since drivers can be probed after init the lack of annotation on the
> driver struct is correct so remove the annotation from the match table.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Oh thanks a LOT Mark!

Hurriedly applied this with the ACKs and pushed out so
linux-next starts working.

Quite interesting bug, I guess I'll comment on it in the other
thread.

Yours,
Linus Walleij

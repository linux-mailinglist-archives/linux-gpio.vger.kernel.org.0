Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD4A1E0EDC
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 14:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388756AbgEYM6L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 08:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388738AbgEYM6L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 08:58:11 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C2CC061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 05:58:11 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z13so10976513ljn.7
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DweVMDnkssdJ1l/E3hLMWpoz4bkGZXDi9+0Yqeu/ZaE=;
        b=UZq6s2clM1RD2mh4utZxk9t3iiXA0X6d8NpVc7y+TF2ljeXpnMglq4bsDoZgePeqxf
         N0qJxb644qs7A4pQD5coU5bzcVyFTXbXI2hTAG/VKwgp6TYs67/Ajf4jwFSTY8YT8hFj
         hZDZwYpHFDCeBvnqa3wCOepvvWo9UAGRK1fF+rh0/wmVdQZydGJOP1N9GN9lhASdLxid
         P+bUDkpMkMV3Y7v4JC6mnmMLjPJJGObca9Ysxr3Bh5zUo4hd6Di0sMeJPl+y81/EWd8F
         bvJ6zq+pYttjMkOz00BvOXTq8e91zxPAZZYDViXpYglFhqYUYthUtTn1yM3V2HD1lEmQ
         Njeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DweVMDnkssdJ1l/E3hLMWpoz4bkGZXDi9+0Yqeu/ZaE=;
        b=r66g/rNVhHcHEMWrKZc2WHmlI/DVZCj0Ba0q0nlKNDyfe0+PIf28560R4wKFVMRsxp
         EgfB5CLh8BNSnccWpqQn3T8hcWyAtPQNJ+BsjvK4RqtvEHUfVmcHwNyWFTjcMog++i6S
         qzlNGQF7muJkBh8x3m0UkAnqQwo97aWfFZIyidd0CYL8lQ55lF5EkZ34lM7vQa7XYl2k
         LdvorxbA3InpSjHZC4uiLLZA7HH5LMphZzB1I27UOgwfi9bptKLiP7+XcHwsrdIm4HKs
         Ucen7BYUySRisXzy7CphK6r/CbCEHfsdBQ6m/VdtlkiA2uvIpmljynZDGIUaXPdzXTkl
         qTyw==
X-Gm-Message-State: AOAM531/sRJb/QZ3ticWHiTL66tbhMuybf9GxfCqbAp6UYRHSbaCrFjj
        WRTBWR3C0BTzko2fwD0P52KlzrVcOO+rfwNwToKt4w==
X-Google-Smtp-Source: ABdhPJxY5iSfVemzA70OTL8vZ69zYNg69QkGeS8B/GEkcQKh5USuFDIdV0i8H/pMUGGqMw+Rph8p+i1nFXzs4uIufUg=
X-Received: by 2002:a2e:9716:: with SMTP id r22mr14401276lji.293.1590411489701;
 Mon, 25 May 2020 05:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200525054833.28995-1-saraon640529@gmail.com>
In-Reply-To: <20200525054833.28995-1-saraon640529@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 14:57:59 +0200
Message-ID: <CACRpkdbubY-DjuTx=-vj9rrLuSGgZekDw0J4DHpnU5bf5BorZw@mail.gmail.com>
Subject: Re: [PATCH] GPIO: Submit a new GPIO driver
To:     Richard Hsu <saraon640529@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Richard_Hsu@asmedia.com.tw, Yd_Tseng@asmedia.com.tw,
        Andrew_Su@asmedia.com.tw,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Richard!

Thanks for your patch!

On Mon, May 25, 2020 at 7:48 AM Richard Hsu <saraon640529@gmail.com> wrote:

> This driver provide GPIO functionality on Asmedia 28XX and 18XX PCI-E
> Bridge
>
> Signed-off-by: Richard Hsu <saraon640529@gmail.com>
> ---
>  patch | 312 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

There is something off with how this patch is generated.

> diff --git a/patch b/patch
> index 0000000..a713f91
> --- /dev/null
> +++ b/patch
> @@ -0,0 +1,312 @@
> +diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c
> +--- linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c   1970-01-01 08:00:00.000000000 +0800
> ++++ linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c     2020-05-22 11:55:13.736272177 +0800

Definitely off. Can't you just generate it from the git repo using
git format-patch HEAD^..HEAD or something?

> ++#include <linux/module.h>
> ++#include <linux/kernel.h>
> ++#include <linux/gpio/driver.h>
> ++#include <linux/pci.h>
> ++#include <linux/spinlock.h>
> ++#include <linux/pm_runtime.h>

#include <linux/bits.h>
Because you use BIT().

Maybe the PCI maintainer could look at how the pci_* accessors are
used in this driver because that beats me.

Yours.
Linus Walleij

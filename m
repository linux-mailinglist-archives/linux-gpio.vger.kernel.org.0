Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5DA3905D8
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 17:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbhEYPuD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 11:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbhEYPuD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 11:50:03 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD365C061574
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 08:48:32 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id q1so4378663lfo.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 08:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cUH0C9YA74DmOby3SjTaaqOPA2l5Tlfgp975+242RWc=;
        b=aAXqVkw9K0Q+3ipt9oeczZHWCkHVFaEYNXvcnaXWcz3wz/Ok7QkhkDpaXqzUVpcqF4
         ZzIRyxX0wGTV/loRRz2cev/7bgrRLZkC8rmGQP85UQYqs9yckCC5rUgpl2y5IIyXPobI
         veRLivly1kJpoktOmbsc6sr94r5P2mGqHk46tLpunBLupOSTyjI8m96rSCSKMFMedGuD
         uCi+xjZAAYi6UdkpuWWFoz3+B49MZ69H7m/oHrCEFONciSFGw2GAefXDup94SDTb0CFN
         gsnvi+/M3Pu/n7qUToEO97gfmKPEICngd06mgD9cc9K9DTIBKPswOZNUHl+i9zx1uBv2
         0gvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cUH0C9YA74DmOby3SjTaaqOPA2l5Tlfgp975+242RWc=;
        b=TDl4BgGhFP9wPjtgKGS8RP80rkjF8yamWwtrNAC33DN0TKmbsYR3ibG2O5Upls6ucf
         jDOg6mVpFfb0qqEHFz3/MvWb7XYkcvWOafnDNiVc0aXKVSAzIMUUqFzbSvVIAYRIJ3+C
         Xsm9Kg8LjyG7i2V2MYYGAxNHUfyGBTx8gEqjkBeAAHLBHAGkqawc49tpE1/f7PLLiIH2
         37bGMNebSrJ2ARIRGih0TUSv1NvTd1yXoD3BUmF2yBz2L8Pao32A6PiOCMXI9VqFQ2Bu
         8TGNiND0QQZnma9XOHjd+XbtISu2oqGqfvcdXtnYRNf0p0rSWmRcw0Gp59/NIeoRUtVB
         FHVA==
X-Gm-Message-State: AOAM531RwihWvLQ7tmVfhWxrp6RY7TP0rLT6fj8li9OfsNbFBZe11QeT
        KCdJaa9mmcKolJjWeCvY34pOrDNQBG6SCwkf3MzFag==
X-Google-Smtp-Source: ABdhPJyylFuPSxPUXUe7VyvUvEl5I9x3iooRMA8+QA4JKTcuDNfIss36TV0cUzhsZv+iI5nDGOcwm3Rrn9Bw5PU3ELs=
X-Received: by 2002:a05:6512:11ea:: with SMTP id p10mr13968637lfs.157.1621957711276;
 Tue, 25 May 2021 08:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210520171310.772-1-mark.kettenis@xs4all.nl> <20210520171310.772-3-mark.kettenis@xs4all.nl>
In-Reply-To: <20210520171310.772-3-mark.kettenis@xs4all.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 May 2021 17:48:20 +0200
Message-ID: <CACRpkdbATikRypCBUX2ETHsBBKqsUo=REiFD5vzPJ1vcLDJjSg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: apple: Add pinctrl nodes
To:     Mark Kettenis <mark.kettenis@xs4all.nl>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Mark Kettenis <kettenis@openbsd.org>,
        Hector Martin <marcan@marcan.st>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 20, 2021 at 7:13 PM Mark Kettenis <mark.kettenis@xs4all.nl> wrote:

> From: Mark Kettenis <kettenis@openbsd.org>
>
> Add pinctrl nodes corresponding to the gpio,t8101 nodes in the
> Apple device tree for the Mac mini (M1, 2020).
>
> Clock references are left out at the moment and will be added once
> the appropriate bindings have been settled upon.
>
> Signed-off-by: Mark Kettenis <kettenis@openbsd.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

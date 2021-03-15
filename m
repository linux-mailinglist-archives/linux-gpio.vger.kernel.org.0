Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47CB233C1F7
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 17:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbhCOQdI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 12:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233873AbhCOQck (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 12:32:40 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20448C06175F
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 09:32:40 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id y1so16996000ljm.10
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 09:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9x36cr7sfYTbtX9K9YpSG1gMw2te24dVSovNQkqAfNY=;
        b=ypIWuPXz4w1n/1s1mLqibXK95L3fsuPf8Ey3O+EZn37oTglyTgr/ChphFNV/FxNk6+
         HcZo7wZ51e7zo1wiumftIpbdHEaQHJ7CunqU8jkJLFQZ/lTXrVN117tR10WCGpr3bbd2
         XXmD2E1pLgGYf9RhtcCtWcJwFHDJR3hJDioMc2FJxe7/uyDJipemOVDifLutmaklZMzm
         xAWC9CY2zzTnuzVVd3EKkf+JW3Z0u6sazi8xCcZHEAg67Mocp9v8vdx1uzlj34jlUjLE
         9MFFxflGIr11JgzzpWikNaj6Wl4mQ6JgKCvkwSpOcDyOUvJzU6uanI2mieygBKqlinLo
         IPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9x36cr7sfYTbtX9K9YpSG1gMw2te24dVSovNQkqAfNY=;
        b=RzDbU1qNOHqxs9lTJ5I2k93nkcGipqBaXZyDnNKGhHcPFm+iTloYYC5r18Kmpjdlcf
         Tl0NdCwUOLJA0d8wh181c4S9fLn9Ni46AKdrGGppNvSp/yr3nHw87t2KOEEJHyZG2ZG1
         kU/GKDr9rstKQj0/4RhKxipibouNCK5jUHg3LG9ueaze0EMrk9KjkEOYCpjr4lJfNfC+
         wJE+YpfiBVIK4t4wiHCkkAY09x9eeYizey71dnacNvfzmB+R/Vy7RuQ5uKsSYmXcxsGG
         P/VUvU1yHKTD/m4CdDEQBbnK1gYU9VBmYm1/XkVl2Q91r0uOZE/Grz9cvphY9TDVgB0e
         NfBQ==
X-Gm-Message-State: AOAM533VZdoawMBjMivv723xnH0zTO/Yvmv0AV5mW4RXjCSBj+3+CROZ
        0JA7DPPGgh6eUGGnco5N5h+5GUx34MUIk8IDbFL1UA==
X-Google-Smtp-Source: ABdhPJxL6hEsF+7OqsUsZkHySTZyK3uwo5RHhA6dChnV53dav/IKHTYB6GIVaJo9OFJivkN6tv2e3nPh/02h8b22jzg=
X-Received: by 2002:a2e:700a:: with SMTP id l10mr11130205ljc.368.1615825958642;
 Mon, 15 Mar 2021 09:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210311024102.15450-1-shawn.guo@linaro.org>
In-Reply-To: <20210311024102.15450-1-shawn.guo@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 15 Mar 2021 17:32:27 +0100
Message-ID: <CACRpkdanRjuErV17ZsSTOX8VpKQZuWge9b_vuKtgjyG9h6XV9g@mail.gmail.com>
Subject: Re: [PATCH v5] pinctrl: qcom: sc8180x: add ACPI probe support
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 11, 2021 at 3:41 AM Shawn Guo <shawn.guo@linaro.org> wrote:

> It adds ACPI probe support for pinctrl-sc8180x driver.  We have one
> problem with ACPI table, i.e. GIO0 (TLMM) block has one single memory
> resource to cover 3 tiles defined by SC8180X.  To follow the hardware
> layout of 3 tiles which is already supported DT probe, it adds one
> function to replace the original single memory resource with 3 named
> ones for tiles.  With that, We can map memory for ACPI in the same way
> as DT.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> Changes for v5:
> - Keep .ngpios number as 190 to match SoC spec.
> - Add comments for sc8180x_pinctrl_add_tile_resources().
> - Drop redundant error message.

This v5 version applied!
Thanks for your perseverance and excellent work as always Shawn!

Special thanks to Andy for helping out in getting all ACPI details right!

Yours,
Linus Walleij

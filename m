Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9281BC070
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 16:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgD1OAu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 10:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgD1OAt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Apr 2020 10:00:49 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB0BEC03C1AB
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 07:00:49 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id l11so16992506lfc.5
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 07:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CwLBtHMxIouz6WBeC7Ry6rusTbPMGQuVa1Crv6UC2Xo=;
        b=BU+9LphHkBjB7hH3z9ucS+MQDbJGncdMqaSIrZNJDwbF7FB/iurPpMj9+WTW1eINtV
         S+zPTDnJ2xc37hyY/wcVjeGHslM6ThBq1dhnjpBW/0YueJvJrSSUE4hAHM9EEyacv3Ro
         B4Za1VsqsZSuElBjM85ap7CwkGKyGxqqN7dtffSV9ZXfDzfNtS9JLqmcjjuPzSrfUaBK
         svAItVmk9afH4cQWB3NgbC+jjqW/aQxBvNk83ZIHRMWRmn1wKI1nxz2I3zt0djJgqNvX
         6pfBW4YM3wGhGZ0YVH8s1R7KHYvSvKB3Tydn+/GBEY6VmzY0tVzY4gNFP0OsRxKZZLkF
         EAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CwLBtHMxIouz6WBeC7Ry6rusTbPMGQuVa1Crv6UC2Xo=;
        b=T+YRrOg46qfT6/jqmmywsL8Tc280z6sOYGasTSqEIr1zyspp3i+H/RISOU7GmTzBfm
         TVptzbER85QWChoB2wVzFT7TSARw6Wckbr5zCPDmkOLdUIBzYjEft+6o66/Xu7XFHW/E
         fgQWwOuVV2PQQRfd3A8IBTRmMVMrfh3RRwYBtWY9tpofsDKIfH+1HUX8ntKh8O4eTY8+
         bLT67t5wnXSzb01tQq1IZgG8Irt/arAsbipCRretiYnYUzLgceaymw+qTAiHHy8+8W5J
         Sd2Er48TjxmvSyMCNX9j1znZL04ciIpKYFZB/7oq7QHHuuXKR3SLqgwxooDkwNxBSWRg
         R2mw==
X-Gm-Message-State: AGi0PuaYN5oUOnReKOTikhlsGzLXy9XXftgySlPNXXqRmFkuwiCWwUUR
        RMmtpxY5E45/ShfBFSFI9oG/jxfMJlZLD1h8T3MKUg==
X-Google-Smtp-Source: APiQypIYzSbT7CAknI2cCMtFL2RX7gZahBzPYkhQq2sZJSILQBDs0uGsOEbqwcRELaTFxqJh/6Pd64SWJfEU4rNWbvI=
X-Received: by 2002:ac2:5c4e:: with SMTP id s14mr19555025lfp.77.1588082448005;
 Tue, 28 Apr 2020 07:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200425044655.166257-1-davidgow@google.com>
In-Reply-To: <20200425044655.166257-1-davidgow@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 16:00:36 +0200
Message-ID: <CACRpkdY=CvSyKO+LpGqu06XVq5pdwycMwyey3U=-qzFY+Dpv4g@mail.gmail.com>
Subject: Re: [PATCH] gpio: of: Build fails if CONFIG_OF_DYNAMIC enabled
 without CONFIG_OF_GPIO
To:     David Gow <davidgow@google.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Frank Rowand <frank.rowand@sony.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 25, 2020 at 6:46 AM David Gow <davidgow@google.com> wrote:

> The symbol 'gpio_of_notifier' doesn't exist without both CONFIG_OF_GPIO
> and CONFIG_OF_DYNAMIC enabled, but is referenced when only
> CONFIG_OF_DYNAMIC is enabled.
>
> This broke building with 'make ARCH=um allyesconfig':
> ---------------
> /usr/bin/ld: drivers/gpio/gpiolib.o: in function `gpiolib_dev_init':
> ./drivers/gpio/gpiolib.c:5293: undefined reference to `gpio_of_notifier'
> collect2: error: ld returned 1 exit status
> ---------------
>
> Fixes: 63636d956c45 ("gpio: of: Add DT overlay support for GPIO hogs")
> Signed-off-by: David Gow <davidgow@google.com>

Patch applied for fixes since it fixes a regression,
I recommend looking a bit down the dependency
chain as indicated by Geert if you have time!

Yours,
Linus Walleij

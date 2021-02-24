Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F513244A6
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Feb 2021 20:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233734AbhBXTbu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Feb 2021 14:31:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233626AbhBXTbt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Feb 2021 14:31:49 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE416C061574;
        Wed, 24 Feb 2021 11:31:09 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id a24so1800081plm.11;
        Wed, 24 Feb 2021 11:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hZiOhC5cVS/lH5CzukG4XTtpL4jg+ky/PDgUBqULPBk=;
        b=apqJN9hPuBFNX+xBGKzYNYUjKJqYmR+xHT6o1uGGIGKxvxq2KjpUAuW357RIAfn6O/
         d3Z4eN9H1AhnneKW765UzmcczdhXHbqCBEEpv45+COVZsEYos0vCdQB0RuanRK1MK3iG
         VL8gV0X7z3C6HUgMdHaEQbBFSmHcAaIEvEB2BsQVeovpmFHclOg0HyOWDE8yl7mqDrZu
         HJYl4dtFKWYSDEIymDXlVfISAzTP0eM5eOm28rS9I+HFl6A45ME2cl4iLFSu6ni0zhjY
         1z4rsglw+AGoQsig8cEuR8a04h4gZ0xwsYc/H4Tw1w6XTqpk5eZe+N3eiZ2nQREZVs8W
         sZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hZiOhC5cVS/lH5CzukG4XTtpL4jg+ky/PDgUBqULPBk=;
        b=EX57gx3B75qhQBD7DEJ/MrE6oFFZU00753h0WKWOq6lomkXMKdM2gR/F2Lew/+yb2n
         MfyAu2e7YkAr7lSniiF9/gBvnRbqRwQwjXH3ml8AmWBC5T0Jwzqr1xIpJ5NsCRA4A5EK
         GCzyM11scpTSuc6hqT5PBNMVPXUCBvY+xotunANAK7+D0JXJxnWg0vX8/NrJvkGB7zeo
         SgllthipjKD87Sx4VI9ZgFfjLkmKWhGo7BT1NJlJClwjEfz6TX/yELjneWiswSX9kEEQ
         kSBJTTujJ2qmqRTyZryDy54NHzhZTIhJp1tAaLwIC/+ceKkHD+Gzs6lBbeLG0DvJ7b8j
         ZX5Q==
X-Gm-Message-State: AOAM533kJAkhqu/15l2FpHCddar4wnVYZtcKcNDbTnRvjka7FllWtfhU
        s5uRujj2RRAjeteHr0Cps2Y=
X-Google-Smtp-Source: ABdhPJyCiCFdIsYMF31z9fvpkljGBP1Ang6kl1t8ml4xCOZNuOCQwco6FdeKp58AeAJVsMs+AfB0QQ==
X-Received: by 2002:a17:90a:6347:: with SMTP id v7mr6172113pjs.22.1614195069272;
        Wed, 24 Feb 2021 11:31:09 -0800 (PST)
Received: from sol (106-69-185-142.dyn.iinet.net.au. [106.69.185.142])
        by smtp.gmail.com with ESMTPSA id w200sm3692537pfc.200.2021.02.24.11.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 11:31:08 -0800 (PST)
Date:   Thu, 25 Feb 2021 03:31:03 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] selftests: gpio: update .gitignore
Message-ID: <20210224193103.GA75630@sol>
References: <20210224185316.17942-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210224185316.17942-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 24, 2021 at 07:53:16PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The executable that we build for GPIO selftests was renamed to
> gpio-mockup-cdev. Let's update .gitignore so that we don't show it
> as an untracked file.
> 
> Fixes: 8bc395a6a2e2 ("selftests: gpio: rework and simplify test implementation")
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  tools/testing/selftests/gpio/.gitignore | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/gpio/.gitignore b/tools/testing/selftests/gpio/.gitignore
> index 4c69408f3e84..a4969f7ee020 100644
> --- a/tools/testing/selftests/gpio/.gitignore
> +++ b/tools/testing/selftests/gpio/.gitignore
> @@ -1,2 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -gpio-mockup-chardev
> +gpio-mockup-cdev
> -- 

Thanks for picking this one up - I missed it as I don't build the
selftests in the same environment that I edit them in, and overlooked
that there was a .gitignore in play.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.


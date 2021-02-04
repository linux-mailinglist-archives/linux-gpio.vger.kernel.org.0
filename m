Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4BE30E963
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Feb 2021 02:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233967AbhBDBUQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Feb 2021 20:20:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234496AbhBDBUJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2021 20:20:09 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF48C0613ED
        for <linux-gpio@vger.kernel.org>; Wed,  3 Feb 2021 17:19:29 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id j12so1014275pfj.12
        for <linux-gpio@vger.kernel.org>; Wed, 03 Feb 2021 17:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cCFawwj3mLVJWuSEyajNtzc8AqiTjLYcvTk0XNz+cvA=;
        b=QCAxg4HTk021ot0qteFnETTrOn8LSI2RA608dT6s2KLuol+XvfQyVBGe8JdoFVOW45
         QNZQ2W2Ft/Y9zT4T4VQtbQUwKsYXzKUTWW50HD6q8lJ4mUUK6GUDviYgkqw9DLMBY6aT
         HDAx2IDO01bz+Zv54jyPh3tnM4UQ+ol4M1T7J6+7Bs4mMV8Yoy7OHxcrY1ECAy9FGNEE
         PlPYfa96Zj46avLpEYxRil0fD4Tr1cDAfya8niIjnI5VLW1WGP1eN4MDpt5RSAuLX+jJ
         bC5CB3mc1v3+aqMKILLns5y9h3aDinAVHG9bB40hgRm4NoBwpe+/hE2XEetgl/PABfpg
         Bing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cCFawwj3mLVJWuSEyajNtzc8AqiTjLYcvTk0XNz+cvA=;
        b=Nt3ADMpLm71CHS5TWYIcrgYkUR5tcJWyl92i/0wN0Uq1+9BkPNOI8vH/OUQckQepDh
         JGsM8Ewu86m7acp2UnHSor1OAx+kRspV8vr7tl2MxNe+lhJ1gZoDDaDAgQrB4ZNHg9HD
         iFp8PNq27wAEfAYK1CLPJIu/gsVNylqnABNvMAjvEF8pg0nZENcqT6ZX/A1schvQO8ie
         MqWbuj1156KSXAyFjRm0JaVejP0kHdxyJ8/AQiTwYPeVLbQ+CEwqqqoyGlv0+/CShQ/L
         puiKq6C8Og0sjx5qR6+3H7QeCqezlXl8w2yUKKxlepqZzhEBxaOrmzz1Xg+sV+UxnhNV
         3Uzw==
X-Gm-Message-State: AOAM533usYevIgOsCueuaNlTkzKr+/9XrsfjtLjGx+ze1C1/6ae/CF8j
        D9HqGIMbGp/NP0niMEbWHhE=
X-Google-Smtp-Source: ABdhPJxPkpO6tETDBkfaB8DnMvfn3elhQu3dE3Joavoee81OHk7f98tbu8DcRSfxuR9bmVItMBDC3g==
X-Received: by 2002:a62:5881:0:b029:1c9:d72d:34d5 with SMTP id m123-20020a6258810000b02901c9d72d34d5mr5738252pfb.68.1612401569150;
        Wed, 03 Feb 2021 17:19:29 -0800 (PST)
Received: from sol (106-69-169-43.dyn.iinet.net.au. [106.69.169.43])
        by smtp.gmail.com with ESMTPSA id 21sm3410535pfh.56.2021.02.03.17.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 17:19:28 -0800 (PST)
Date:   Thu, 4 Feb 2021 09:19:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH] COPYING: organize the licenses in a separate
 LICENSES directory
Message-ID: <20210204011923.GA9515@sol>
References: <20210203122325.19427-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203122325.19427-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 03, 2021 at 01:23:25PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Add the LICENSES directory as suggested by Greg KH. It will contain the
> license files relevant to this project that is: LGPL-2.1 for the library
> and GPL-2.0 & the Linux-syscall-note for the Linux Kernel uAPI header.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I see you are following the kernel licencing rules wrt license file
naming and formatting.
Have you considered following the REUSE spec, as Greg also suggested,
instead?

Cheers,
Kent.


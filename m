Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A13F72F1873
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 15:40:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbhAKOkh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 09:40:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbhAKOkg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 09:40:36 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD2C6C061786
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 06:39:56 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id c22so12604221pgg.13
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 06:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yIjhso1Cj9QGYJXz+3U4evYPN4k9/udZlE3jxdkVWJw=;
        b=ni0dz5t+a5nVEr0jrDlV+jJSmeuuNyihJ6gMfF2SVruiivGFeXcHqyYRsRxPZ/w0HF
         lRbS/HwGWAQ2A7iiHSMMt/LqHx/V8lPbi0qbNHTN3L3yipFrEry0nwr8N8k8bSjKb2Nd
         s83jD+YRnMax/BT6TyruV3Ncgep2sSfuzKbeWMnfzuYRL64GBWTI4ecHOdw7iVsZs8Yi
         F/L3kiCFZa5FIoKbtnI4rLIYrfbQxP/nbDhkuQ9tBv/uzjpvfXgrPdtBispPlQVHr/K0
         kFjwQSGn8qGVF9Mc6p2JNPLO9fAIrkdCnCqx5VkY6cO1u1ZkhBCKn79aoSMI+UNfn2Vr
         Brwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yIjhso1Cj9QGYJXz+3U4evYPN4k9/udZlE3jxdkVWJw=;
        b=i5oP12fHfAU6BJ5l6wAJBYM4qLiiV17WXvtVohxvOQZAdHF6A2Od5VwahoYtAYpG8n
         KDN3LtSuVtmOQBqjhN2mS0mCVY34jEwx1YqOOgkd8sYrnBD3WoRZrRzggMsQE2IPMVcF
         dpFoTcBwKO3+aVh3c45aul5Sz6yTKZqd4tukHNy67aDzwDl94MEUfFYa4lBuhu0NF4Io
         OK5sm/zpOgG4nJatGqPlXhP6kpBSnpIFBo/YBhziOl7r4wJhzF75m9m3cc5rpOEQhA+F
         qXi1hooyG4lMPqQ2Wo8BB+m4hkAq1Ut6USC84/+ZgxSz3XmYYgCSHhUrSudPklhnpmg1
         yUAA==
X-Gm-Message-State: AOAM530UABEbMXIA5TrK/h90hwhPy34BL+eDyVMBA+bxMYopA6noOLjm
        jespJ6yL4QOAhLy8JNjwYdtKO+ZADX/0gw==
X-Google-Smtp-Source: ABdhPJy59oxlcLiT5GLponzUtukuKEoz/3xdIAfPJ35LFwFD8DnSKBwrn5kCz5P1B54BICQnvnHkOA==
X-Received: by 2002:a63:1b22:: with SMTP id b34mr19995695pgb.132.1610375996450;
        Mon, 11 Jan 2021 06:39:56 -0800 (PST)
Received: from sol (106-69-181-20.dyn.iinet.net.au. [106.69.181.20])
        by smtp.gmail.com with ESMTPSA id g26sm18481855pfo.35.2021.01.11.06.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 06:39:55 -0800 (PST)
Date:   Mon, 11 Jan 2021 22:39:51 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH 4/6] treewide: make drive settings an enum
Message-ID: <20210111143951.GB1036910@sol>
References: <20210111133426.22040-1-brgl@bgdev.pl>
 <20210111133426.22040-5-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111133426.22040-5-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 11, 2021 at 02:34:24PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Open-source and open-drain drive settings are mutually exclusive just like
> the bias settings. Make them into an enum so that becomes clear.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  bindings/cxx/gpiod.hpp                 | 24 +++++----
>  bindings/cxx/line.cpp                  | 18 +++----
>  bindings/cxx/tests/tests-line.cpp      | 45 ++++++----------
>  bindings/python/gpiodmodule.c          | 73 ++++++++++++++------------
>  bindings/python/tests/gpiod_py_test.py | 18 +++----
>  include/gpiod.h                        | 26 +++++----
>  lib/core.c                             | 12 ++---
>  tests/tests-line.c                     | 36 ++++++-------
>  tools/gpioinfo.c                       | 14 ++++-
>  9 files changed, 134 insertions(+), 132 deletions(-)
> 
> diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
> index fb675fc..f9c341d 100644
> --- a/bindings/cxx/gpiod.hpp
> +++ b/bindings/cxx/gpiod.hpp
> @@ -332,16 +332,10 @@ public:
>  	GPIOD_API bool is_used(void) const;
>  
>  	/**
> -	 * @brief Check if this line represents an open-drain GPIO.
> -	 * @return True if the line is an open-drain GPIO, false otherwise.
> +	 * @brief Get current drive setting of this line.
> +	 * @return Current drive setting.
>  	 */
> -	GPIOD_API bool is_open_drain(void) const;
> -
> -	/**
> -	 * @brief Check if this line represents an open-source GPIO.
> -	 * @return True if the line is an open-source GPIO, false otherwise.
> -	 */
> -	GPIOD_API bool is_open_source(void) const;
> +	GPIOD_API int drive(void) const;
>  
>  	/**
>  	 * @brief Request this line.
> @@ -482,6 +476,18 @@ public:
>  		/**< Line's direction setting is output. */
>  	};
>  
> +	/**
> +	 * @brief Possible drive settings.
> +	 */
> +	enum : int {
> +		DRIVE_NONE = 1,
> +		/**< Drive setting is unknown. */

Unlike bias, the drive setting is never unknown - if zero the pin is
assumed push-pull.

And to me DRIVE_NONE implies a high impedance state.

Cheers,
Kent.

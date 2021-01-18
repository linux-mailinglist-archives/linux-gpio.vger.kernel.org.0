Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3682F968F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 01:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730340AbhARAXH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Jan 2021 19:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730336AbhARAXE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Jan 2021 19:23:04 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCECC061573
        for <linux-gpio@vger.kernel.org>; Sun, 17 Jan 2021 16:22:23 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id be12so7696811plb.4
        for <linux-gpio@vger.kernel.org>; Sun, 17 Jan 2021 16:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xiGPKIIQgdpUFVuYvQFq3IoBWtyPmgyta6sdSAImJtQ=;
        b=bNbpjZpZYYxI6UF7Ch9qb0fdlGNTRd7JrK50DqbRBwPl39uj/EpQ/R2MmDfviE2Ssj
         ailTh8cLCWw0ANai6J8/DFsDAAsgJrm73yJ1z0AhvecNfTRnm093MqOtnBavrKk6+MOK
         MiCGV314lbzRBu59r+PEKzwiS2oCfH/kYQpWal06n62FKXZul/Gj1aKq4fBYLXhXwRKD
         KeNrXOLSF2gd7A5iTHFM8BdjzLCZMdlx07E6fFUCxNgx+WpuDJmNoOM7agQc2URHVaT+
         GbvBW1YmUjiuuoiLhwHOfiFdcBP+lE12go+ZccUftPUuhMjj5j6exPlXL/NMnm5zDeXZ
         J4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xiGPKIIQgdpUFVuYvQFq3IoBWtyPmgyta6sdSAImJtQ=;
        b=oqcb+cBbjpolgFFeLSRO6IO5RsE4lZ0BmMn3M75+vpdl4JfZvXkGUIKDbeZOw1L+mb
         9kygPM4PQltl0P6gvusSSzcEFvm9bXxBz0ippHN/JSauKY3Tk2fCapxLwsRV0SoJ5HSD
         nvwvDwRMY3542lZ/ZFCkZgCu2M69OuN91H8LcdLzeLuA91Rlzhrzq026TIt2AW47tKMb
         zpTfGrlYC+b+yy2GFr0EpMEBYvU7tl99A9Do8dyNeD+pDnzLmmbGUJw/oO1a7W3WLeVF
         iJy5Zmnv/Gbm2a+erhdOqUrBJ/VD77fBLjuvWaA7a3vkYz0qu1X6ZNMDtM/qHeTDp91m
         SClA==
X-Gm-Message-State: AOAM532l2/NvHGk0mlK7DHO9qjDuIVqHtw1+pK7FF27AGDNdmAQRaYh8
        +qfKD8zSJzQejGLD42Q+MXs=
X-Google-Smtp-Source: ABdhPJy7NvDgclq8bYsBaBWNzoCIEYZosYcASC7PCjUc7nbVzgtubNFnaV8jJaf647+ckBJwc8aJvg==
X-Received: by 2002:a17:903:228a:b029:da:d645:ab58 with SMTP id b10-20020a170903228ab02900dad645ab58mr24214320plh.25.1610929343282;
        Sun, 17 Jan 2021 16:22:23 -0800 (PST)
Received: from sol (106-69-181-154.dyn.iinet.net.au. [106.69.181.154])
        by smtp.gmail.com with ESMTPSA id w27sm14166957pfq.104.2021.01.17.16.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 16:22:22 -0800 (PST)
Date:   Mon, 18 Jan 2021 08:22:18 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH v2 7/7] core: add the kernel uapi header to the
 repository
Message-ID: <20210118002218.GC6841@sol>
References: <20210115103018.27704-1-brgl@bgdev.pl>
 <20210115103018.27704-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115103018.27704-8-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 15, 2021 at 11:30:18AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> In order to avoid any problems with symbols missing from the host linux
> kernel headers (for example: if current version of libgpiod supports
> features that were added recently to the kernel but the host headers are
> outdated and don't export required symbols) let's add the uapi header to
> the repository and include it instead of the one in /usr/include/linux.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  configure.ac    |  12 +-
>  lib/Makefile.am |   2 +-
>  lib/core.c      |   3 +-
>  lib/uapi/gpio.h | 522 ++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 528 insertions(+), 11 deletions(-)
>  create mode 100644 lib/uapi/gpio.h
> 

[snip]
> +enum gpio_v2_line_flag {
> +	GPIO_V2_LINE_FLAG_USED			= _BITULL(0),
> +	GPIO_V2_LINE_FLAG_ACTIVE_LOW		= _BITULL(1),
> +	GPIO_V2_LINE_FLAG_INPUT			= _BITULL(2),
> +	GPIO_V2_LINE_FLAG_OUTPUT		= _BITULL(3),
> +	GPIO_V2_LINE_FLAG_EDGE_RISING		= _BITULL(4),
> +	GPIO_V2_LINE_FLAG_EDGE_FALLING		= _BITULL(5),
> +	GPIO_V2_LINE_FLAG_OPEN_DRAIN		= _BITULL(6),
> +	GPIO_V2_LINE_FLAG_OPEN_SOURCE		= _BITULL(7),
> +	GPIO_V2_LINE_FLAG_BIAS_PULL_UP		= _BITULL(8),
> +	GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN	= _BITULL(9),
> +	GPIO_V2_LINE_FLAG_BIAS_DISABLED		= _BITULL(10),
> +};

Perhaps include the header from v5.11-rc3 that includes the
GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME flag?

Unless your intent is for the next libgpiod release to explicitly target
v5.10?

+1 for including the header, btw.  Targetting a specific kernel header
simplifies the build.  We are always going to have to deal with current
apps being run on old kernels, either way, and anyone that cares to use
current features has to ensure they have a current kernel, either way.

Cheers,
Kent.

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1864677913
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jan 2023 11:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbjAWKXg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 05:23:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbjAWKXf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 05:23:35 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DDA21E9E9
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 02:23:33 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id n190so12306223vsc.11
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 02:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0+bDwqx6yW80+u59N/fhK19/WfO7tr6mrBd/7psIuo=;
        b=rI+JXjiyiX5BBScLC1bTnlVdD2aK4jKE0wLvA0YzIP+uY/Bcbu3pZ5KspVdZxlKM+5
         +egkC+dQgvWN3NLVyGKSwG8MvVYkCecLAmQaeErDRUVCa47CZrkZjbJm9kq6oP9Q1TQ3
         Ya6YLMcS/k5dOenjxoC5gq6g77/3fUcQ3MhfQp8gCR+QpnrFpB21reNOuQPz6e6hyqfh
         oc/Yxa493i5kKmofqrDHaOmOD9AWk3IUt40xA1Nw6qf6D3pjYjeERAO7uX1VPydH/A9F
         IZx1J+bnHp2XmK3MArmKpvWwLT4OnGt+6McqsaXfLIjihnJHOLZTMOpObepz1lOlax+a
         k4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0+bDwqx6yW80+u59N/fhK19/WfO7tr6mrBd/7psIuo=;
        b=SGSGwmRL9a9fEYpBShjsOeC//uLVj3ITVKgoQAtEY7Dz0fwx+MwsQmhAL4tbYzMLwV
         B/pVbdYhDKyzys8iXwY7BkRRWQFiwRvhW53/8Wrf4lCU7rqzpEroj1wScMpn0VF/M4HV
         OtsUzj3Dinc0GOAVxDg7OjnGUK2bFVBKgC1WbrFndAQ9e4hCfOE31NTr+TnmZCqw12iT
         Rqob5pdLEw3nQXTCpDA01MzC3fX0ynftwxpU4nGqG5D8CN22Jl+es7PsECaOBuVLCI2h
         rLp7+hQ4azJB5F9IoEDCyD7C+/1XblyxANHlhRBnm7x164JCbrYs9mSL1Fn08jlAJZot
         sa6g==
X-Gm-Message-State: AFqh2kpYnh3z/CyTFLQDMDwOLjQduu1Cb4yeLMJiVfQ/JUJVq4KmP3b2
        knJQnt4oOW1ScH7lnkdR+4XReHMx4h2wqVCWHixKfQ==
X-Google-Smtp-Source: AMrXdXty70hxjPCgYD8XV5hJ9kH3qHLSYPw+8/dCvZSjWu9TSrSZnfIzPnoGDq+M9RIt3TWxW1tsCXguzWQEEMVYRJ4=
X-Received: by 2002:a05:6102:3e08:b0:3c5:1ac1:bf38 with SMTP id
 j8-20020a0561023e0800b003c51ac1bf38mr3515045vsv.78.1674469412649; Mon, 23 Jan
 2023 02:23:32 -0800 (PST)
MIME-Version: 1.0
References: <20230121111835.35245-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230121111835.35245-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 23 Jan 2023 11:23:21 +0100
Message-ID: <CAMRc=MckM2Ry0ihnZ2FD=YRRnj0Xy9=nSc3yNFmT0PfovS40rA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: zevio: Add missing header
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Moses Christopher Bollavarapu <mosescb.dev@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 21, 2023 at 12:18 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The commit 899f6a9c4364 ("gpio: zevio: Use proper headers and drop
> OF_GPIO dependency") missed one header this driver depends on. Add it.
>
> Fixes: 899f6a9c4364 ("gpio: zevio: Use proper headers and drop OF_GPIO dependency")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>
> Seems I somehow messed up with the series. Here is the missing part.
> Feel free apply it separately or fold into the original patch.
>
>  drivers/gpio/gpio-zevio.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
> index 778ae82413e4..0223c69b9d7b 100644
> --- a/drivers/gpio/gpio-zevio.c
> +++ b/drivers/gpio/gpio-zevio.c
> @@ -10,6 +10,7 @@
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>
> --
> 2.39.0
>

Applied, thanks for the quick fix.

Bart

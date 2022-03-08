Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 376A24D12AA
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 09:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345122AbiCHIts (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 03:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345137AbiCHIr4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 03:47:56 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B56A3FD83
        for <linux-gpio@vger.kernel.org>; Tue,  8 Mar 2022 00:46:55 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id bg10so37586722ejb.4
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2022 00:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YWDxW77171tKULic9PATZflHGAWN9agWbTs/Al0RNIA=;
        b=yDq6cJj7scG6xMfY6mQBRZI2teHCxzKWxFahnkYD75apQHz+R+CrU3MTQ6xyW1c0UW
         JM2b+S5Npi2BSgCR+6cTMscJ4fJKrQaMDWQcH7ijwSRS2Bt5UvmcWMqOK/NyyXnPmkQp
         4HohBUjbccLAZubYdl0A9y9x/z7KFrLl6oBijkyfSp7IFSWfg8hRZc1Ut8VVgTbK1y8q
         Pq0OULrEwQpV+7ivCIdE5aUvHQ+Dm1f7J5VYHOvkw4OAZtwR/hkX1B9jY1uC0cST7Mvm
         jfQDMJwUwcj40vAoPr++9qB5Z6sp1LfMVI5MN1mGAa76lb76s40yOR/r/8XauNvsQBfK
         8cNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YWDxW77171tKULic9PATZflHGAWN9agWbTs/Al0RNIA=;
        b=365yDRfuF5XvXgJIVt0XMmhSAxyUEsmrvThPO0SAHNK/CyRFW8+KjM7xDDIlRxLQtD
         mVkgh5inr1wYXPSB/o7pq3GvxIWfoh8BRPcS7qnt/UOuZSMOlj4XmYcDXu7lonL6yC5A
         Jeroz9MkuF9mSEGjVRrzBZNzp8pKtCcQWuh/mlK5wxg2M0rzpQb9OBR7tTcrqaZWM2fq
         /j+82daDOEwBDpp7zolRhcfszfPmbj0SQY1iPG6pkYgFCP87KR9JkTUekUBxEM7rEus/
         3W+LNPDp/RwBNHgEem0xVTQHOwjyGJeXp4UHWWvivKoWlNDnSZFdvWPazzSwPaG7r3Na
         xniQ==
X-Gm-Message-State: AOAM5317RllEjPPC89J4kvBlIkturJAxCALI15ruT8BX/0qmLGny3ub7
        HJ4SU0KqzC75N1N57dzDcNNbfJ7VgJGowiAYNWuE9g==
X-Google-Smtp-Source: ABdhPJw2uMD2RB52Mu2RDi0WheUdgR/Sw7e1yql8YPmxsLsQoIY5nRZis9nQH5Ko1YfJ7Y6TG+EtlW8T6gqs6LEV6dI=
X-Received: by 2002:a17:906:888e:b0:6da:ed04:5e40 with SMTP id
 ak14-20020a170906888e00b006daed045e40mr12736944ejc.286.1646729213855; Tue, 08
 Mar 2022 00:46:53 -0800 (PST)
MIME-Version: 1.0
References: <20220307163840.64495-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220307163840.64495-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 8 Mar 2022 09:46:43 +0100
Message-ID: <CAMRc=Mf_gRcrc+AECb+Y5zLFdr-muKfxhFZr3+qkvLHB4ajndw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: sim: Declare gpio_sim_hog_config_item_ops static
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 7, 2022 at 5:38 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Compiler is not happy:
>
>   warning: symbol 'gpio_sim_hog_config_item_ops' was not declared. Should it be static?
>
> Fixes: cb8c474e79be ("gpio: sim: new testing module")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-sim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 153fe79e1bf3..bb9bb595c1a8 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -1322,7 +1322,7 @@ static void gpio_sim_hog_config_item_release(struct config_item *item)
>         kfree(hog);
>  }
>
> -struct configfs_item_operations gpio_sim_hog_config_item_ops = {
> +static struct configfs_item_operations gpio_sim_hog_config_item_ops = {
>         .release        = gpio_sim_hog_config_item_release,
>  };
>
> --
> 2.34.1
>

Queued for fixes, thanks!

Bart

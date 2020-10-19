Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEAC292233
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 07:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgJSFdd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 01:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgJSFdd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 01:33:33 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A57C061755
        for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2020 22:33:33 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id b6so2796796pju.1
        for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2020 22:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KFWrTk4/MZRsh73cemPCA+garm+vxmS38qR0bZiOZMU=;
        b=D5m23CSAnlxOO264W+obGZxOzdlnF5kbJtbqFPYGXT/1ng15hfHIkYILhDQXXsvy4j
         zL+zDNS/DuvNsPsob4Nm1eUo22ayfH+h3/i+USeUoR2pkGMl+tfUYgTc6Um04L+dicoe
         wPFdXJin4rGYOiJmznv8KWU++Lhsmp/dLJ/3BzqUke55Ao/p+yD1RSyew0dnUA/yGzB5
         F95ePr1i8cXh8XtkcRaxp09dMDGJUm90GGpWo+uN6XqNEmwI+Br94ux670UWfcGpVdBx
         oHWPjKSxhqOCkWM9Bac0XZCY34DZcoQ+KP8Iw/+OEShRMBnj8KbT9qXcofaVztOdhNR/
         2LeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KFWrTk4/MZRsh73cemPCA+garm+vxmS38qR0bZiOZMU=;
        b=Ho1i5ZWGQA1M1TZbJas87jSU05nXew4JQS1AZ8xlxrSbTn+/OkdNoGy9JVBsyRxWU/
         sSws2OGAv+gkwB0eJXvNKrsZjM+v0pamsFCS+RHa+1GSaxJ7TccHOr8LcFIs+S2dbGu0
         zLZD3GJaxrmt6MOSiVA8g724ftsbdAxoXtQDnz1hIpX2MEZnU7Krs8H+4BGG+PHmDo2o
         Zkjgl4mriQV1nAq2nlHcfiStSjBrkSYu/+Sg3W/J0l0I1qnrXjtdGBJJ1Qk5XlDjozWV
         fTN8J7+Sse9Xp5tYBCWmg/73p44sHXW8GgftXoHPxpeEp9WpRrS8x/kjdLUfMiovSj5r
         LbDw==
X-Gm-Message-State: AOAM530zXOfqBMMg2hjn0CTO4If/UpmGJ4SOtb9y3bINLqWHqex0W67l
        7eKT7tQ9d+tUbvxB5ADFJlA=
X-Google-Smtp-Source: ABdhPJxKgO51xEOj5gm51q6eAqM7pKz0IiBuhoU/oD9zmT7Jv0FsRD5MIHf9f2kMRzvcaon12XRAFQ==
X-Received: by 2002:a17:90a:f685:: with SMTP id cl5mr15761445pjb.210.1603085612528;
        Sun, 18 Oct 2020 22:33:32 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
        by smtp.gmail.com with ESMTPSA id q6sm10759022pfn.10.2020.10.18.22.33.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Oct 2020 22:33:31 -0700 (PDT)
Date:   Sun, 18 Oct 2020 22:33:25 -0700
From:   Tao Ren <rentao.bupt@gmail.com>
To:     Billy Tsai <billy_tsai@aspeedtech.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        joel@jms.id.au, andrew@aj.id.au, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH] gpio: aspeed: fix ast2600 bank properties
Message-ID: <20201019053324.GA4300@taoren-ubuntu-R90MNF91>
References: <20201019045026.10732-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019045026.10732-1-billy_tsai@aspeedtech.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Billy,

On Mon, Oct 19, 2020 at 12:50:26PM +0800, Billy Tsai wrote:
> GPIO_T is mapped to the most significant byte of input/output mask, and
> the byte in "output" mask should be 0 because GPIO_T is input only. All
> the other bits need to be 1 because GPIO_Q/R/S support both input and
> output modes.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

You may want to add "Fixes" tag if you take it as a bug fix? For
example:

Fixes: ab4a85534c3e ("gpio: aspeed: Add in ast2600 details to Aspeed driver")

> ---
>  drivers/gpio/gpio-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index d07bf2c3f136..f24754b3f6d1 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1114,6 +1114,7 @@ static const struct aspeed_gpio_config ast2500_config =
>  
>  static const struct aspeed_bank_props ast2600_bank_props[] = {
>  	/*     input	  output   */
> +	{4, 0xffffffff,  0x00ffffff}, /* Q/R/S/T */

Reviewed-by: Tao Ren <rentao.bupt@gmail.com>

>  	{5, 0xffffffff,  0xffffff00}, /* U/V/W/X */
>  	{6, 0x0000ffff,  0x0000ffff}, /* Y/Z */
>  	{ },
> -- 
> 2.17.1
> 

Cheers,

Tao

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D077769A9AF
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Feb 2023 12:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjBQLGI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Feb 2023 06:06:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbjBQLGB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Feb 2023 06:06:01 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56BBA4FCB5
        for <linux-gpio@vger.kernel.org>; Fri, 17 Feb 2023 03:05:32 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id x6so366489vsp.7
        for <linux-gpio@vger.kernel.org>; Fri, 17 Feb 2023 03:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=toBaX5YPaEnb2T7DV6Vy0F6H0IDE/B5PyKIZF63pqnk=;
        b=eEFuHyiCf8se5MYq3zCE5aqE+fVeRTHe0XtrR4UFov8zDTExBDd+dkslNeTxIQ32E6
         R/h7mxHoL1b0IgjuWri0tzO5fkyQkC28kIxi76EIhOHYOyVLuTfdJt9AuHJjnUUiQF0+
         jx6GNbkZIMSYfNj6jAVhs1DcgVQIppSLSaxEaMlYtZWUyegZEj7qDu4dNcgUbvKC1KBk
         x125+i6u4HMmhG5jDzPSGJR6U/T67huXlx/cphlyJqrfLVzh3Vppq9LrsXOA89r40YTx
         idehOVFbP5zmmmuhh3+qcOLxBXWCjmyM87WjVEQ6u2MS++XmyKBNOux2PxU9SkgsGYxw
         E26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toBaX5YPaEnb2T7DV6Vy0F6H0IDE/B5PyKIZF63pqnk=;
        b=XUBbp3VVmsllq1/lZ4VT0LpA0E0NqH5XDw2O6kY9Mascdbo4JF7pYBaOkj00LVwxkn
         Rn7hR224SJwxvZ23zVM9KxoXfNTmg0339v65XIjknv6PX8RmL5vY9j+qqGEuBOFB72MN
         HTmpPRKr5ASS89eDe+X2hE0vbycZxAEmd5BI0ZxtBqgFCnn5taVLxX1oAhOEOHBtA2Ge
         XmuXUOksR5pPHRG40gR1e8ke+36hTqyJ+5edaxgnNmQfWtD+pHISumtFuWnY+AZQURDy
         3acT1xGsGwaHIgzaQHxUTafeKTANGlYi5Lvs3RX74yYwx12yBRYqVr+lqG3zOZ5RbeuA
         TjXg==
X-Gm-Message-State: AO0yUKVp9BNtqdPChfYKuArLDRKqirUxNUdQ9scfl0PO007O8Ploc+E6
        qFNfwANrm02/ZHlj9a9i+sQ0BC9CE4S9f35H28CwjQ==
X-Google-Smtp-Source: AK7set81mrS2IJOaPepXYHxWWLkaluscX71nK5xpa8C+29wzYllSDrS8x3cIrhLXWgRJdMdDForqFRxTz5tJxkUqMok=
X-Received: by 2002:a05:6102:7db:b0:410:e23:4ba with SMTP id
 y27-20020a05610207db00b004100e2304bamr1500666vsg.80.1676631930851; Fri, 17
 Feb 2023 03:05:30 -0800 (PST)
MIME-Version: 1.0
References: <20230216141555.116219-1-brgl@bgdev.pl>
In-Reply-To: <20230216141555.116219-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 17 Feb 2023 12:05:19 +0100
Message-ID: <CAMRc=MfGCLFwzaV_pbHkrfRUCcM8E6zQtEAeXxEherdvcNo14A@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: fix a memory leak
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 16, 2023 at 3:16 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Fix an inverted logic bug in gpio_sim_remove_hogs() that leads to GPIO
> hog structures never being freed.
>
> Fixes: cb8c474e79be ("gpio: sim: new testing module")
> Reported-by: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  drivers/gpio/gpio-sim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 60514bc5454f..9e3893b19e4f 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -736,7 +736,7 @@ static void gpio_sim_remove_hogs(struct gpio_sim_device *dev)
>
>         gpiod_remove_hogs(dev->hogs);
>
> -       for (hog = dev->hogs; !hog->chip_label; hog++) {
> +       for (hog = dev->hogs; hog->chip_label; hog++) {
>                 kfree(hog->chip_label);
>                 kfree(hog->line_name);
>         }
> --
> 2.37.2
>

Applied and fixed the email address used.

Bart

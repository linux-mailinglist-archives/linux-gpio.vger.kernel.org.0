Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9E3B4F3EB7
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Apr 2022 22:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345388AbiDEOfW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Apr 2022 10:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387611AbiDENPW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2022 09:15:22 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6049712E170
        for <linux-gpio@vger.kernel.org>; Tue,  5 Apr 2022 05:20:46 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id d10so9877634edj.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2022 05:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pEqCOWOz4xgrxd0giUCx9NsDzzIWyIrHtogC8XOTUzE=;
        b=vQapLbel1yCXuH6GmdojAb8GugegWJl+fxGhwDF9atQlUvGzvn/4Y6yUGfK8vLfmxD
         du9DXRs/IV8UjMx/BuNyDQMSAU+WEZbwBW6VYzQugY5FN1FTKNO4bGw7/R9qVpmKGeTD
         hC93Nw68LKZE50qwuxOUuJzaidAihRJ4nrDUpaeZLKsIgCfNpHfRWjyuiBwgFgF4Epqz
         iWCbjdxDCgXjtNlVB0SG7RCDrZo260wDtiJCp7FyBwrNCOrYkLLYqW22xZ2PL5eiCUJ/
         QnuYib47iSig9U84lQ0rZ8MmnSRG4tkzgHSEnYvQrZInW7l8YG5NrqXHElYFtCsNuUOe
         d74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pEqCOWOz4xgrxd0giUCx9NsDzzIWyIrHtogC8XOTUzE=;
        b=45tMMPGk9PeYvv0JCdwan+neVCJptYYBpH66WiwphOPf6APZItwrpkLOOvWCnjyVP9
         Y05Zu8jqWzaFI9pKjxBRK9GpqSMTUXIO6O9+kahQIAHx4tCrGOFkTaqduj9ILbQ42Vo9
         MTtz5NtqssiFvLXzEqmPvYaERrXh0RDH4uglKTBH2UJCKn5GmYtZf3ltSQhor+zgyNch
         JzmgTETKSQQS/CPwSR2R7KeEQ5eOToMrYLvR4s9K5+t5LLW0ZpmA4ddVYGMASCGKSe2W
         3L1JmDMbzjMQYjTB4LF99acjWx46FfTBnRJ8Uyg3P8aX3JQafGerY9FfJ/g+zkCmXjry
         nXJQ==
X-Gm-Message-State: AOAM531jixgekY8HX90y5O7QRGI9Mw/aKys9uIf3wEjp6WG/oLJkv/yE
        vK6ryvF4gdFgyKofE0JpfLXyypi7MMqyZeEl9cw5Jn/RrDLeJA==
X-Google-Smtp-Source: ABdhPJzPcUZJUkjG68RIi0zF7G2pdh+mSzjC64mp73QtY54GjSTBmBaup9OZEVLLzoEWNRSHGiI6uU10f7LtmUaHtto=
X-Received: by 2002:a50:9f8e:0:b0:41c:d8e5:96f0 with SMTP id
 c14-20020a509f8e000000b0041cd8e596f0mr3345886edf.69.1649161244777; Tue, 05
 Apr 2022 05:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220330150620.2490-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220330150620.2490-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 5 Apr 2022 14:20:34 +0200
Message-ID: <CAMRc=Mdyv5Et0ZsncgrxNkKa_F=VNzBqc9obnz-XH-1jgWSjdg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: Get rid of redundant 'else'
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

On Wed, Mar 30, 2022 at 5:06 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> In the snippets like the following
>
>         if (...)
>                 return / goto / break / continue ...;
>         else
>                 ...
>
> the 'else' is redundant. Get rid of it. In case of IOCTLs use
> switch-case pattern that seems the usual in such cases.
>
> While at it, clarify necessity of else in gpiod_direction_output()
> by attaching else if to the closing curly brace on a previous line.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bart

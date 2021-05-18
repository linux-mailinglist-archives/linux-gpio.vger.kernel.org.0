Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173B8388332
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 01:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235337AbhERXky (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 19:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235219AbhERXky (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 May 2021 19:40:54 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7E1C06175F
        for <linux-gpio@vger.kernel.org>; Tue, 18 May 2021 16:39:35 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id e2so7098077ljk.4
        for <linux-gpio@vger.kernel.org>; Tue, 18 May 2021 16:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=30rScBJo8uULxD5ipt3Sa9ymjgFXOH8NzusRi+CaGpg=;
        b=MuKUMsjEQiqHFi2QvWTt06EwL26zYB/aSQbsD4TYjYU0+kQY7EBw/YYlF83hZY5+9q
         44l7n3S+qASlRBoUxL9DJGpFC1OZJnkKex8odoJyeh/LEIP9ggsnAdHGnEHvXGmJlDm0
         FHKGDrW6Pe1ub5udjdeustdM1ABkbutH9Sj5bGHFWtnHQy2II9694+c5Z6NnlDg6NofF
         SQ4XUJWZq8AYTR9nCtNQBUh07LKyRz/S/zQckVkqbD4mzwKLTThW2UbMjYi3rJui5Qfn
         F8MqggBA71cwUPDDI8udeM7AKGhAILeGkAZ0uo3pooQakA4PGZKt+h4WGjPLly/zFl3W
         Zj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=30rScBJo8uULxD5ipt3Sa9ymjgFXOH8NzusRi+CaGpg=;
        b=MLjItUAHxdYti253hQLBwi8d06BmEVPaRBKebbkW3eRnk0T8JZLMxNo5ilXT8WcSPo
         qtY1YFEIhipBrLqfcXTnFNsEInSxU1aiMLZaTlv/sFPcErzk/aG9wk0x9/2AxcCtWIC1
         z1TRsROBmlA/evmfDrMQvlexV4kOLYUx7YT5FUWYrkcD3Y4rq6GTaDrJRERnL/gqsiou
         cuv/zCk+GtN2x+iD31HQUr6BZPtgGumY0pCxu8foxjnguoScCFpO/usGNc16kc/kowWi
         vvqvl9zL5eUoJcYvVwTrWmIuym6Fr3dGgzjqRMAQwmX4oAL2VeyqhIOmoImWQhqhWuLK
         vtYA==
X-Gm-Message-State: AOAM533aYWL7nmgwUVtYQDekJ9kIfQLANZkqsfe79sa8kh5iI9DYJeon
        9ZxokkVK/HNCqJBYWct+yyBgggM7SwKI4WAhlyEzZg==
X-Google-Smtp-Source: ABdhPJxvHyW/cy/hKdyDcaLVXXKGHq2yMPf9XlYSp3YWPIjz5v+Lu7yRC0bI9otqzJh1b2JFETDfuZRTBcR80F8h10E=
X-Received: by 2002:a2e:2e12:: with SMTP id u18mr5907001lju.200.1621381173379;
 Tue, 18 May 2021 16:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210518084619.29949-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210518084619.29949-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 19 May 2021 01:39:22 +0200
Message-ID: <CACRpkdbJBp3zExyanVt3EAYPHar5DMxex-rxEeg4EBt6bXPwBw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Make use of assign_bit() API (part 2)
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 18, 2021 at 10:46 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> We have for some time the assign_bit() API to replace open coded
>
>         if (foo)
>                 set_bit(n, bar);
>         else
>                 clear_bit(n, bar);
>
> Use this API in GPIO library code.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Now I understand what assign_bit() is for...
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

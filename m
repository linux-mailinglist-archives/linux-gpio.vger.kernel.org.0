Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242803899E9
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 01:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhESXeT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 19:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbhESXeS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 19:34:18 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37FAC061574
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 16:32:56 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id c10so628264lfm.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 16:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lYA1H9yr7s1Wr5c16h/hdrAgkZtt+5bqTRMIye4dM1g=;
        b=Rodkj5cnwnEFsXy3OyNTU3ErfGxXNfGmTtzEFWuMu+B+HSkllD1EwBFreljmHj2yLe
         yJlh/zdoO8rpztTpRkLyA/9iBz6w9mQ0vdEQPU5OYIqJqdfc4cDJKJI86D39Y0K60YOF
         l7fAtyohfiD4hDQ9Xwf3LHYEy3waUoacCnyIdVgwrNa77i+dUOUNagM/E8RMEyQujF4e
         x01Ydwq664N3bhHS8ZvJ2KFFAq8v2UXL70ED/p0jCkk6iuWBZsEkxmhlnNcm8+NCrwgH
         a4/gZ7M3xbyNi0PyaocUlY/mOh8I/w9C0VA7xDJnp41+6fvTc68+68o4K5FytDmVwOZy
         pxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lYA1H9yr7s1Wr5c16h/hdrAgkZtt+5bqTRMIye4dM1g=;
        b=Qi3sBRgNOQW/fAfi8yuoLRfPL84vIUJU3S/gmZgojv23Gvm1KG7Af8cVzLQ2O2FqIV
         SYWWw+aGaifHu/w9qOYLYhBwNaumc4RPo7GTLWF+8J/Wr8KQIaJitCG73oC0hCyw33AH
         m2rFUq8yvi+8jKywI23tK3GYiCWYGU/RE0/yKgxUCTp5oWCQTJzS8hfr5duVNefcLLGW
         +wwjUSmV2Zm+WKJUTbPlNpKac9S0qgIwEDYKOWobbIDA0+ZIMNup0exvuePkICsluBO3
         d/P4/rx0+QAdO/OSH9af9a+pCw86qq07yu3/fYVTszd+RU4MnYiQsAMvfMRKT2fGtI5s
         8wDQ==
X-Gm-Message-State: AOAM533kYArF+Qq0sr+x+n6pekXO/L1U2VSZsxpKuu1vBZY70onCns5U
        wlTdIMTcdickUrHt/6gfQEGcWTdzyw4X/7p4iwdxhg==
X-Google-Smtp-Source: ABdhPJzxqvOkDbyd4/b9MJuVrBisnL4C/8J72qCT/6CYcQTw+i+DNDdhZeo30goEyw0JR78B0HhV6b2tSnfdj2eASms=
X-Received: by 2002:a05:6512:49b:: with SMTP id v27mr1367660lfq.29.1621467175115;
 Wed, 19 May 2021 16:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210510195221.12350-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210510195221.12350-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 May 2021 01:32:44 +0200
Message-ID: <CACRpkdba0WdkMPdQe9VpUR9SQZdYM47TvgyO+4HA66EdV2==mg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Drop duplicate offset check in gpiochip_is_requested()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 10, 2021 at 9:52 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> gpiochip_get_desc() already does the check, drop a duplicate in
> gpiochip_is_requested().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFD59A7C6
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 08:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392381AbfHWGsV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 02:48:21 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45320 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389682AbfHWGsV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 02:48:21 -0400
Received: by mail-lj1-f193.google.com with SMTP id l1so7810461lji.12
        for <linux-gpio@vger.kernel.org>; Thu, 22 Aug 2019 23:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LPzj3SnbXNaaSGakHsn0orBoQcjUrpMBwsltADATCFc=;
        b=YKMr5jK9uApQ3zAe5T9oA1YLlD9Da+zRXU5sdBe7/gqIDekdpGv6ciEAh4sDSjSgHC
         RyMn07xm/Jy8K4V6OkZ8gx0bDWlW1u4m5g5lHKCtezbuSjr/meClGkEdcAGt6lJZWgof
         ITiv05KcbzuLuhT+WiqLfFKgU0kBNUrGq8jYFGS/XacBb22DFY21KeV9NIGRYFizNw64
         vdyWbudJuk+LHYF8s+W1IS6t07J9BmWAimUX+BUhgfemMz+/ip0gHDGGux52VuNy0zI8
         4IsDtrtSKVL84xbD4NR7nqVXdmjdHSbpROz7nmq72XLr3/wkyMsYvov79Xudbr8waeuM
         u6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LPzj3SnbXNaaSGakHsn0orBoQcjUrpMBwsltADATCFc=;
        b=SC4xQQlLrq7rSeja/cqhgL2hKgwnIgW9kvBYyP3ea70H3Y4y1pVz5UeYgNjZe4oyLl
         mg9glB1n1BVZ48AaBtTCcfgpl+pLc9VtLSBKUdURPvvj+oddyMHcLalYjcZjqyh5JfjJ
         /AAR8WgTzHeJXVC8eciuHP9qyQ/cVPIAPdwGyKwc2TXewO/CvXXkdaCHwko6XQ3Al6g2
         kxvOpYzerdVc/56xYXfF0mDEDJQqgATMnAUU7PdZv/WEhkgFxvr+lxgqhygGVzu9pYhG
         m/mmjJrn/1Xv1xOEK5sqPh9yMS5WTrRSGQN/spqwuwZrns8P336rdhBpzLCv6HKIfgMM
         4Uyg==
X-Gm-Message-State: APjAAAXGExvulRYBLERHVUf0Mr0LmkfVeebYxu2SWhTDCxFLc4AFbC/A
        qS/0rzMClOq9IsnI+bSs8JRqXfNjnrQWDNGc1qfUlJT+37A=
X-Google-Smtp-Source: APXvYqxs8AbsugvLhLLnZRENtf6TtA4GIBL5isErpZ4UsOwMIF7LLQE3JlTuc5/DI/aYAIwY1tsk8aWZH6lu/sd3G0I=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr1898272ljc.28.1566542898692;
 Thu, 22 Aug 2019 23:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190820080527.11796-1-linus.walleij@linaro.org>
In-Reply-To: <20190820080527.11796-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 08:48:07 +0200
Message-ID: <CACRpkdY+hG=LjPOoKMz2E4q_is-CwKSyjsnZvqdKyVaw15gzMg@mail.gmail.com>
Subject: Re: [PATCH] gpio: Fix irqchip initialization order
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Wei Xu <xuwei5@hisilicon.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 20, 2019 at 10:05 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> Wei: it would be great if you could test this and
> confirm if it solves your problem, so I can apply this
> for fixes.

Wei, could you test this patch? I have a strong urge
to push it to Torvalds as a fix for this problem but it'd
be super if you could test it.

Yours,
Linus Walleij

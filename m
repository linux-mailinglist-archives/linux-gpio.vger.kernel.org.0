Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8D37D3439
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 01:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfJJXSg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 19:18:36 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44668 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfJJXSg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Oct 2019 19:18:36 -0400
Received: by mail-lf1-f67.google.com with SMTP id q12so5623830lfc.11
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2019 16:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pUcKPLBWJnq8ctURh84+bbbGfQ3zuQYcg6i34rG2P/w=;
        b=YGi5e4SSj/Gk8tfY1A+F6240m5leij1ZQvXwFhwb1lvGnRCxIcLiqbVT0hbXZmi1cT
         1KdWcU2EMu8IzjGYcw8K6CShvEpumTl9+QNFHoA5VzNgmb2a4b8eM1GkO546mz76SFgf
         qcD6BVVqaIV2kK2LghUUTLWDBWNIC9xWUuQVF2r7d5QCymhF9O6oDPHVFmz8WAS089JK
         hUbha//Fmgz32Be7MGGxam41jG/JLT+mrUSvFQo8ogiyZnja3WgMfuLCJjfYIbXZ4Uxr
         DiII76XIjImX+GRwnv2u2/eBSjPQi4Yp7dDQm5tCAMew7p7E4jHiz3VIWBBYrMhv9pJX
         NChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pUcKPLBWJnq8ctURh84+bbbGfQ3zuQYcg6i34rG2P/w=;
        b=tKoZ+WgTW2TEdQGZRo9lJyKoU9St8iPlHd8wGZffk5URH5R28yphXNsgonzb4lvKOx
         RhdLZUEgHxU2mxGIz36LGxq6IWUKxHWADAj6gkogFkApM2Orkf1SjAGCXdBFLP1GoK+Y
         c2ZKXpNHb0KRHXmnBLmvYTPvtcYaiCGxVlJ++pqA8fdb20+12mOPRsh8vlm5gBmlGJYT
         SyhhwEiZbPHYVqEENb8B/zBOgXFLcebFaPTTLFdSb7e5dazMc8wsvCS9TkoR10gF8d52
         VRE+W+rweDro8s1r5Ao0Gt+SahXcnUJ4am/d4bXZS6UxF7Hfbckm4yE6UInFlzcz+yI+
         sMcw==
X-Gm-Message-State: APjAAAWNPoZNVnFUPvSNxLA2RFHlnQ0hSEZPXZ8WCHs+STp4ZnUwCARf
        2/KJZANRrydnSY9B22F05QxFsu+bgX+x2+PZXramBA==
X-Google-Smtp-Source: APXvYqwwVArvRo9nzuut1pnk+DywxfIz9SmZ61w0gdBeUYI9ejZO4Vc1bXM7s2/5mc4QZv5nHg9iWJY+hUiU6Mdu/zg=
X-Received: by 2002:a19:f11e:: with SMTP id p30mr6782765lfh.152.1570749513883;
 Thu, 10 Oct 2019 16:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com> <20191009165056.76580-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191009165056.76580-3-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Oct 2019 01:18:21 +0200
Message-ID: <CACRpkdZLuY+UjyVt=ptKX53hJo1sAwdHrpqKz-3H6Bq22x_Q+Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] gpiolib: Initialize the hardware with a callback
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 9, 2019 at 6:51 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> After changing the drivers to use GPIO core to add an IRQ chip
> it appears that some of them requires a hardware initialization
> before adding the IRQ chip.
>
> Add an optional callback ->init_hw() to allow that drivers
> to initialize hardware if needed.
>
> This change is a part of the fix NULL pointer dereference
> brought to the several drivers recently.
>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Ouch!

But a very nice fix.

I will pull in the series.

Thanks for fixing this up so nicely Andy!

Yours,
Linus Walleij

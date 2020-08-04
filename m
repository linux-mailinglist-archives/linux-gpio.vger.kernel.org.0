Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06AC23BFE2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Aug 2020 21:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbgHDT2R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Aug 2020 15:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgHDT2Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2020 15:28:16 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A8DAC06174A
        for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2020 12:28:16 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id h21so25471419qtp.11
        for <linux-gpio@vger.kernel.org>; Tue, 04 Aug 2020 12:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QZPv3vyb9T7Ph9oNjo817uichWZWclCWnCIRIilrMbI=;
        b=luRCZFvNv1qw6XK0lP5bctiCtoKipS1zkSan+vF/4w0QNcp7tvBGPSXhl2Hu55Zni2
         IVovI6W03P4sCwu3UjBAbkx9wSEIM5mQM1b/oB7V1Z/USbGH+S+9dq8ORM02WibWYy9b
         bgog7iYT5g2zlN7dzdekrUfbBalT2olGkwJrp7/9NhFWIV2ca2WOjnWPWf+Dn0IvLV1u
         /rmJodWFshUyd/AfAbXgpT+mnlWds6J8r8y3ipFHdaov9xAMXc+gV2A4Kn6NNbfyijtK
         RC6Atw7BnwPqoTwMP2okxisEmbqsqUZo0D27Afy3247WVNWN8l89zGmUWslqyy5QQDiD
         eWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QZPv3vyb9T7Ph9oNjo817uichWZWclCWnCIRIilrMbI=;
        b=g60y3c+U/AOW3+mAR5UP8Hkq0IJpZwq/Inww/VjG6oynPWyYJ8CZ9wZRkukbxR+WX2
         JSm8ElWlQZd9z8a8AOg89SPUD+cFMiY4Tjo2lc1+fqCBPF5S/jvHtUSTNTbRgGKT98No
         K4qqCO03roVFrkwsA4WGVgGzysBqnNepaNBdqjae3tCnFp86qB6eHltg5/rucnBdxMKH
         09TUZ0CsSxVUPo4q5DvaFoQUNdCI4P08agazjLrO6sFxUtJgeqns2lQqx+IDonvwwsir
         u50VHZJhpMNWYRlRvXyymNYUaTnJJbcPGGBuFgBNuvLUFb0GtyWiIrZ6X3/XuJ1Vl8h6
         xuOg==
X-Gm-Message-State: AOAM531pJM870H8/Du3+6svYDLIylNK2iCe0xQ9GaC+JCevAHWIENnjw
        pYwoIwmR9hkzlcF8MVFu9NxogmAY7KudJ+d9QjwFMg==
X-Google-Smtp-Source: ABdhPJymsHefVLQVuV4G3IAFDTvR9UK59lInyk68B5dA9v9fdqqex2N6jbzDONS0DrBScUcDbjSWF5ZEeQa/M1q+dpA=
X-Received: by 2002:aed:21da:: with SMTP id m26mr23617075qtc.197.1596569295695;
 Tue, 04 Aug 2020 12:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200725041955.9985-1-warthog618@gmail.com> <20200725041955.9985-8-warthog618@gmail.com>
In-Reply-To: <20200725041955.9985-8-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 4 Aug 2020 21:28:04 +0200
Message-ID: <CAMpxmJW+RqW5=ugXru3ggRnLsPvtGEJ64_sBaY2GAXjeWT50qA@mail.gmail.com>
Subject: Re: [PATCH v2 07/18] gpiolib: cdev: support edge detection for uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 25, 2020 at 6:21 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add support for edge detection to lines requested using
> GPIO_GET_LINE_IOCTL.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

[snip!]

> +
> +static irqreturn_t edge_irq_thread(int irq, void *p)
> +{
> +       struct edge_detector *edet = p;
> +       struct line *line = edet->line;
> +       struct gpio_desc *desc = edge_detector_desc(edet);
> +       struct gpioline_event le;
> +       int ret;
> +
> +       /* Do not leak kernel stack to userspace */
> +       memset(&le, 0, sizeof(le));
> +
> +       /*
> +        * We may be running from a nested threaded interrupt in which case
> +        * we didn't get the timestamp from edge_irq_handler().
> +        */
> +       if (!edet->timestamp) {
> +               le.timestamp = ktime_get_ns();

IIRC Marc suggested using smp_rmw() here before reading the timestamp.
Do we still need it or something changed?

Bartosz

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F41DCAF9DB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 12:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbfIKKFD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 06:05:03 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44714 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbfIKKFB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 06:05:01 -0400
Received: by mail-lf1-f67.google.com with SMTP id q11so1015725lfc.11
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 03:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aEBAvzyvKwKy4+z0icRgfRVKXYXcNb1iM7EN7yrDUow=;
        b=b5WLEtD03nLPtyVSE+wLZn9h7qijVtAN+cYaeN6IYy+aFGDtEbDuL/gYsMMM/a/5ed
         Bm/8bSgVFY582J67Cdazp0Jc7/0Ip0JtCwnp1Jwa0sBRHurYKd3AFT/MOoX9EgKmv7Wt
         THm606K5uucv2RO6R7HvnwPXo9zNI5/SCpU50YcpK5nYOIZ/jeKlZyT4JwA91pyBCRGY
         76K3WnTq/FQ1cFtQhenLCpIb3UROTl/67IWPqHB+hXeomfMlanRc/zaQHe3r5hBODnQq
         lVYiLeCNz+Ewk8X+yoLY0VvEITQNeFzHI7YN8tMAZaUuIjZtJqEzFplZ9DoSsXHDz63B
         er6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aEBAvzyvKwKy4+z0icRgfRVKXYXcNb1iM7EN7yrDUow=;
        b=V5nHNpHSMChqySPD7J+7Mr4Eh0vY2E0ivJfj6CT7t+MxFgQkFt3S8h+QxujkuQ2YcJ
         wVJ4sl6XYzlNrTrmdQgLup0/Iu3FsSGE785+V42R9ll8nKC50y2low3iBozd+OV7tnm7
         dJrK+OwRyihcp5fFDN4zM5O9mGHAKCTInIpzFFBRL6UwwW+5J5MY3Aiuk97Sz160VWhS
         DbGiYEcO58S5S5q1N8JSPUoU5c7/otJw4c6AY1VFJdc362huZfrGpRhCkiiYWvCeFomT
         G8Z3/Ago5i9yz1CVYlyaKg61Q7FCRPPRTLxbWrKi5DN+f5jYlcpGmZncYaN1j5w3VuH0
         AFlQ==
X-Gm-Message-State: APjAAAUzDbnWCDxH4NB+L2VIvzFXaDv4GGYq2ElWJpM5xcVPUO7YrcGH
        RAFP3V8U7zwU1Pb05VP8lzYFL/s7PSKNCmaO53tC3w==
X-Google-Smtp-Source: APXvYqyC+pv5N0Vcj+RE52xkcBxAzDFKvxknvjpMo7X5lxTEnajzZlDFTx5W6vtzY7meOzprM4Zolus/zI1aT2yhpaQ=
X-Received: by 2002:a19:117:: with SMTP id 23mr23845320lfb.115.1568196299188;
 Wed, 11 Sep 2019 03:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190906062623.13354-1-rashmica.g@gmail.com>
In-Reply-To: <20190906062623.13354-1-rashmica.g@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 11:04:47 +0100
Message-ID: <CACRpkdZvBHk65Vs93YbrTR92-8o0SgtUUWMBXeABQH0PZwpRxQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] gpio/aspeed: Fix incorrect number of banks
To:     Rashmica Gupta <rashmica.g@gmail.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 6, 2019 at 7:26 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:

> The current calculation for the number of GPIO banks is only correct if
> the number of GPIOs is a multiple of 32 (if there were 31 GPIOs we would
> currently say there are 0 banks, which is incorrect).
>
> Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij

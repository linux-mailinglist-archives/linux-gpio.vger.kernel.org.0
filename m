Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837A41D719C
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 09:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgERHRS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 03:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgERHRS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 03:17:18 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A82C061A0C
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:17:18 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id e125so6311627lfd.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kbVcXJSHBUEKZSSGyj/DRkAv14rsMqLE2kjnxXBmOA8=;
        b=TiY1SpQCWfGea3I7E9IdXmJzygQ9DP3M2pn8NIa3V1raBrgkNJwfTRMC/LbbDb6OYT
         A9Q5rSIduaXG4jNa92EfhyIxRB3HGLNP+VBkZCdqePOq4bhvjcFfS0xjxmx/p+exnJag
         x7wYIrUk9ruxbiAzDDdm3hfPKyGdyTISRnbr7DwXcEOWkSCZwFso0y+Y0+HGiqZumBxf
         JsBov/UTkOJAGpuxzgeckBHvda4/9X3MRQnISLi2uDahAedJ8egh2nZLM8GltfiSvfpc
         4mTQ4NHDTBKTyzcWUvKF2ifSX1DZRX+V1+7UVIca/LPJkIn/J/LN8IstGDPKVAUffyTd
         Xc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kbVcXJSHBUEKZSSGyj/DRkAv14rsMqLE2kjnxXBmOA8=;
        b=fcwjHLywkhlojwHT3MsBynWZvbS2/PvRGYLyrHW1++xU8rqR0XM2fXTSGy4A6MvQpf
         qaTubnAirhY+L/pVOZ5WLY+AEZr+7lnwRHDl+iYLxXrf7B9OKXYi+8++shG4fg3EWi9c
         pD/IAOh5JwCzsTWzwAN/a38Xpsd59YhmYVfYn/Y3cLrdwu+np5xyckz13WsvQAAmD3eK
         5758vj68GqNutjA0J4SWiptZfEnCP6itx9+S8HdxfZvVpoJhpp9PPdMYUCoyyO7Akyak
         h+gbj7wSdenf3k+PZ9S6fA3sh48hZ7D4zOPzAxpGxvtwA3drMu8aQWjEXnZo2lFN9WGr
         b64w==
X-Gm-Message-State: AOAM532pRaLYTS5KG0AN6aOErlALE9DKV+LeXpvK/mraONbuDZuGa169
        5ZbS27uiQ9d0D07/5wxzPitKHUmQP/1WpdNrHwYN2A==
X-Google-Smtp-Source: ABdhPJy0OlmIXe71/0Rx6SnxKBcL0Ty0fR7e6LKP7gdqyclgJmq/XKeWk+HjfFvEasf0wCiIi+35PbdDMxtcMOY4opI=
X-Received: by 2002:a19:c8cb:: with SMTP id y194mr7704588lff.89.1589786236533;
 Mon, 18 May 2020 00:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200512182721.55127-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200512182721.55127-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:17:05 +0200
Message-ID: <CACRpkdYzYLyjYdE1tvZGGnM6-nSJ=GhE1zVpEpmmOiOAawa8HQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: xgene-sb: Drop redundant OF_GPIO dependency
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 12, 2020 at 8:27 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is nothing in the driver requires OF_GPIO. Moreover, driver
> supports ACPI and OF_GPIO may be a quite overhead on such configurations.
>
> Drop dependency for good and replace of_gpio.h to of.h since we have
> one function to be defined from there.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5832B2B72EF
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 01:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbgKRARh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 19:17:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgKRARg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 19:17:36 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCD6C0617A6
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:17:34 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id 142so341699ljj.10
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=itEmzLXgCFTsEMcLeMQFGTZ6eyauUN+nMLUP2RUCNQw=;
        b=SD/i7W8Kd1DZxajpdO0JE2KkHfMFm18jKRvy8zwWdTpalEBE7ZpzBRs1XmIW7LGQPG
         3iVv8Z4oDk8aEx6k1zhrBke5P9rkMv/V6Pxjo79Si+P6sqgF+YeTB60H9KIsp1IrLWyL
         Yrp8ztYnjz0jNZhGPmCauhvjj8BzXMtmOaN5xnX+GTVDR7MX/Je67hSgjBu387/17cYf
         o6gmolahdP7rpSzfATNttVCTR9kzjBbmXHMlz7SR1JyzY/INn5Ti1pC1Z4b4A0aJVspw
         T7tnQcdVCNwsXdaxsqQdfP0/xKEnpRPgHdLL+Z0S+SVXkLJGdmd3fBfoTbnPJKgXOret
         OrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=itEmzLXgCFTsEMcLeMQFGTZ6eyauUN+nMLUP2RUCNQw=;
        b=BNua21uL2fZlvzZ3twtos2YXVA1gKHMvKpWOFHVS5PE9OCwuoz4dQizmMLrFDczs1J
         mcgMJuHU1XVCVWL6z45f8GA4usGQ6OD+lyWX7mxy7TFnRmKgag2a/+uAqGjaIdxdltFi
         wZ6MjMr9yua37Cnxy47YOzYPOdfsAo4Q5rJdT30RszJVubbmJ9mGNPUsstsjWEikvEgj
         EuA69bARdQmEeXvbWKgiwYOXF0z0jz8KXdg5jrL2tIYJxrb2hL/MDXiCx7+1yVdUZymv
         VnwnfkaPRjYUGL+mXaoTYRHmWtEOK2I4xQiVfsxnBYleZdF4X9XLJCSSyLnJKqApaAN2
         oJJg==
X-Gm-Message-State: AOAM5317eRcfRQ7lRQU9zGcZMf+Y+qxD7YrSWLrL3od1RPE0IZekL63p
        E65OEfWi0se5TPGG6UxfBSGswnmIfqHofwztma82Gw==
X-Google-Smtp-Source: ABdhPJzqGBIETrUOwWe711WB62z05yQi+shXIPIXgRCLYa9CIu7//O4+TmZ+ma9DFYOKZzUOtjh17WD72SI2hv05Ieo=
X-Received: by 2002:a2e:7c03:: with SMTP id x3mr2581893ljc.338.1605658653361;
 Tue, 17 Nov 2020 16:17:33 -0800 (PST)
MIME-Version: 1.0
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com> <1605201148-4508-7-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1605201148-4508-7-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Nov 2020 01:17:22 +0100
Message-ID: <CACRpkdZpz3LtJ9W6R+AwLf7LAT6Bppzjkpqywn_GS-Wx=c0j_Q@mail.gmail.com>
Subject: Re: [LINUX PATCH V3 6/9] gpio: gpio-xilinx: Add remove function
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, Robert Hancock <hancock@sedsystems.ca>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 6:13 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:

> Added remove function support.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
> Changes in V3:
> -Created new patch for remove function.

Patch applied despite not applying 4 or 5: this needs to go
in with the clock support.

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6D0E369F09
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Apr 2021 08:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhDXGWU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Apr 2021 02:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhDXGWP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Apr 2021 02:22:15 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C96E5C061574
        for <linux-gpio@vger.kernel.org>; Fri, 23 Apr 2021 23:21:37 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id z16so36642543pga.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Apr 2021 23:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cKXei1xdQ+fu4f+TurzziSylf1siKskarIOy2DJy2qI=;
        b=PFyEeD0fM3AWJAq1JeqcNZ5c9R7IA8GwOxdpymg8IFAdzlLif3FxZ4qAKuKjJKEUDd
         wPMTx0+PTKmvEcgDB2o7p8CBpq2jzopKTruq0zavYWj9QnJwQmR0HURnDaWL2jEJ8laP
         F6kd8BvMvNgvsKIf4hoUxrCBY7ggU/dRFc/GlqNjYv3M9VhzueicSzGfqfDYkRM9o+Lj
         Px88M9JgQR/MIY2SPFno4LKCQmKOTNM/5MBUdvAUyxOAqYibpHS9t4dw/r1Fxx7rn+t4
         foDdOT3v5PJE4MYA8o0mxCZzaRi/lBwkKr5Bef+wdXgxmjQ/ay6Mbkw86XU85Epo/0/W
         9dbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cKXei1xdQ+fu4f+TurzziSylf1siKskarIOy2DJy2qI=;
        b=BXvkefYfbmv5vmXF9WV5xzvQsoOaRceJ9zIzYqziR3VeowSdAvMLiYl1bSG8yCd4cw
         SYf2qqwRJKZvdlXiUzM/M8Q2tIjrTFgLT5wvDXAkXzZEnGMGy99Mqi1HihZJ4nL1Ojvd
         dLXZ5kN4rZA1+hssOcETCOpzzWaMhWH6qBwv0X5l6cdAFEOLCxXeGRKsIwx6RkPhZSyb
         D0SbSYBgcC3/Du37LbEXKiz024q18kqHNGk90CJ+BgYMzgOzCdFye9h8SD/1q8xI4RVG
         Re1vpyI0DdDzb1IvTsuLfRRTqPzSfs6dhz8zej6mhnyGY6g8b84GRaVMSzlEs/j9hNAy
         MobQ==
X-Gm-Message-State: AOAM531LAtWMzG4UhnqIyI08liwATekK9k7NHoyV6EYN6PPTrS4KkLmV
        knl9sPAkO71N/fhZv28tWFuyKKSYvcc=
X-Google-Smtp-Source: ABdhPJz17kudDx0S84Jybdj2oyi98+9STMfOcnWEh6KylgVeQGDt+sY/6uHFF8GPKKFV6cb1nttrlA==
X-Received: by 2002:a63:b09:: with SMTP id 9mr7204477pgl.107.1619245297339;
        Fri, 23 Apr 2021 23:21:37 -0700 (PDT)
Received: from sol (106-69-187-97.dyn.iinet.net.au. [106.69.187.97])
        by smtp.gmail.com with ESMTPSA id l18sm8654853pjq.33.2021.04.23.23.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 23:21:36 -0700 (PDT)
Date:   Sat, 24 Apr 2021 14:21:32 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] Request an output line, without modifying the value
Message-ID: <20210424062132.GA14885@sol>
References: <6e26b4e5-277b-459f-29e7-7eb7e949e6a5@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e26b4e5-277b-459f-29e7-7eb7e949e6a5@axentia.se>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 23, 2021 at 05:32:15PM +0200, Peter Rosin wrote:
> Hi!
> 
> I'm wondering if there is a way to request an output line using
> libgpiod without clobbering the previous value. I would like for
> an application to take a peek at this previous value of an output
> gpio and behave slightly different for 0/1.
> 
> Cheers,
> Peter

Assuming it is still an output then GPIOD_LINE_REQUEST_DIRECTION_AS_IS
should do what you are after.
But there is no guarantee that the line state is preserved across
requests, so YMMV.

Cheers,
Kent.

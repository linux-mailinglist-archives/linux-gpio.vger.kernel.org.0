Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C6C245355
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Aug 2020 00:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729636AbgHOWAk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Aug 2020 18:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728824AbgHOVvf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Aug 2020 17:51:35 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E3DC06123D;
        Fri, 14 Aug 2020 23:53:15 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x25so5617636pff.4;
        Fri, 14 Aug 2020 23:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pVKGZSGZNhPJKOQuv9oilwXJQTmZT9NWxjcZcAW1Dkc=;
        b=T/paDNBwrJPd7tpI4px6vg1iXEHldiMa+fmuF2H1V+N0u081TAs9Qlrw68enOZhGuh
         YfgZFNB1V38/Q8shdcgR4KA3i9sgcBiar5OKerPRbFWouzGYAFxdcKiF6LuekieSxEw+
         7ZcZS8+AgqxMHKpRMhtRTAeUngPUQrp9ndSNkyMPORAOoskbAAEm9qtLqu4A6LPuubYK
         3gOo5rw5bsmotyhM3xbMf0jDtJM6rfnmReKatfEGZSbqwk5tHl78cc93cMVzyICHts5D
         d9lgByOtkGXkgUdQPL8gA9u7YwgjV4ipPrrwsSjibkrVFZ88dU67L9bzNNHFjza5t31d
         +ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pVKGZSGZNhPJKOQuv9oilwXJQTmZT9NWxjcZcAW1Dkc=;
        b=LJWZebfDKOXTv77wbooBwfcl5J937su0CpzaSF7L5aTnwMyoju1qZgCzbejmMSuglS
         7H2JptATZbsXLYzP5q/5P3tchQWSAPvn5McUpVWkV/9gLH2rXM7WM3/u8ndF/WJzWfyd
         d+iqMLhr3JKrKf/OUqmKLOu2GqjeHqfa/yVdo15RHY0CsfKas9htXXFDHnLrsjheUIEr
         dCYQuQ7kMemV39Dx3L3xX52umF3Uyaq3yCmXIai9NTkc3EpmxHr4/5Q2Up0KIQ80cfZO
         aIqmQur/F2dlPUOVCf17DMRbKIb43c5cxqhvReLJilvyHkiY+1+gs3USY4YZY7sdvDLu
         i0Iw==
X-Gm-Message-State: AOAM531a+bDfxtAbjrgiE5XVZq7aJMsS/iU/4Exzsf1XovSZ/uWRw95O
        9zUP5lf4cLLPHViYvufVlJ7fh23+BlM=
X-Google-Smtp-Source: ABdhPJz/+FljT4cxQeY7+rTXYiiKIvIyoPaJtCubwetrLQ2346ifFhuRCW/LhJUv+eNmPF044AWmhg==
X-Received: by 2002:a62:8c89:: with SMTP id m131mr4310246pfd.288.1597474394763;
        Fri, 14 Aug 2020 23:53:14 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id x136sm10952194pfc.28.2020.08.14.23.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 23:53:13 -0700 (PDT)
Date:   Sat, 15 Aug 2020 14:53:09 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
Message-ID: <20200815065309.GA13905@sol>
References: <20200814030257.135463-1-warthog618@gmail.com>
 <20200814030257.135463-8-warthog618@gmail.com>
 <CAMpxmJXdGUnnomfWNRmpi979jLPMj17JuA=0K2Nq-oVS_-oQ3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJXdGUnnomfWNRmpi979jLPMj17JuA=0K2Nq-oVS_-oQ3A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 14, 2020 at 09:31:29PM +0200, Bartosz Golaszewski wrote:
> On Fri, Aug 14, 2020 at 5:04 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
> > returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> 
> Hi Kent,
> 
> not many comments here, just a couple minor details below.
> 

[snip]

> > +
> > +/**
> > + * struct line - contains the state of a userspace line request
> > + * @gdev: the GPIO device the line request pertains to
> > + * @label: consumer label used to tag descriptors
> > + * @num_descs: the number of descriptors held in the descs array
> > + * @descs: the GPIO descriptors held by this line request, with @num_descs
> > + * elements.
> > + */
> > +struct line {
> 
> How about line_request, line_request_data or line_req_ctx? Something
> more intuitive than struct line that doesn't even refer to a single
> line. Same for relevant functions below.
> 

As I've mentioned previously, I'm not a fan of names that include _data,
_ctx, _state, or similar that don't really add anything.

I did consider line_request, but that was too close to the
gpio_v2_line_request in gpio.d, not just the struct but also the
resulting local variables, particularly in line_create() where they
co-exist.

Given the ioctl names, GPIO_V2_GET_LINE_IOCTL and
GPIO_V2_LINE_GET/SET_xxx, that all create or operate on this struct, and
that this is within the scope of gpiolib-cdev, the name 'line' seemed the
best fit.

And how does it not refer to a single line - what are the descs??

No problems with your other comments.

Cheers,
Kent.


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E553888ED
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 10:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhESIGE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 04:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbhESIGC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 04:06:02 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7BE0C06175F;
        Wed, 19 May 2021 01:04:40 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id h7so6581541plt.1;
        Wed, 19 May 2021 01:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1a/3BQnqnwQwhdVRgfo9exWw4oG0eTb7Km72R5HPSzs=;
        b=La+rgrvuHBKodAiDpmronThGYpO38NvKFMmguymd+qFiys5iCJXNJsczIzqj8mQ1PA
         tOrCkhkPB1BgZDVipdM732+EIhk4/9rpJXdMsaXjCFKUVthBw/p2x8iOB8j7uT9gWpBd
         +vxRXDjrxHl+i6fl6YJc/5gAzKvo9diAUGfipw0lwm2XlnQhJy9IhoSU3nyTetj6ZZn1
         QGUu1ANl9AJ92rqRJq9sEK1BB5mOO/4IKXuvqvYsufMzob1pqqRueYqZcRBbZNSl3l2P
         dz71KuYc2xnz7HS/rnYG+IStaqqSXnfkq5b+137GvYTVUnotWQsob9p7FVbENkuZU7XN
         SLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1a/3BQnqnwQwhdVRgfo9exWw4oG0eTb7Km72R5HPSzs=;
        b=nT10ZzaWHSDok88SbA+j/3yoc17SUiJdbJrxSTl5iOAIAd2t6spDRFyQaGNEC83ifu
         Uj2ppHVCtoDGRHQMok16EQRfRIhewqUhNTyoV1fI1Jgt5XNXYxYWQid7bXPxCG4X+xGt
         PcD4MQuZxshIGqQht4fmUeC5kna6Z7BwrkC87u4W6vUQxf25OpBdCkAmFC/MpTZeFQrH
         iIq1Yu/dQ2xxOmG3RhwEZnYO5UwzD3Du5W678Kuio5+XVdyKcs9EXxbR0eYLKgVZZGL6
         2bPmThSsArtN+tBL681BNILJZsU2qB+JbFgEOOxqsWjNyRUgLwd2WfyuraO7jdZ1z9re
         uBkg==
X-Gm-Message-State: AOAM530y5OtKa2oRPnIGNlY5Y6bKsF31mBQe8FJvQlMMIJxaUw1BhayC
        EdjcS0TsOPLz9FReVcwJPrc=
X-Google-Smtp-Source: ABdhPJwsRweAo/OuJYkGF7oa7HYO4hWypHV7DuRd1Yuan5yRZ9NNmjBZOjczUTC6YrtFdDHsfFnoNg==
X-Received: by 2002:a17:90b:f0e:: with SMTP id br14mr10052633pjb.121.1621411480208;
        Wed, 19 May 2021 01:04:40 -0700 (PDT)
Received: from sol (106-69-175-91.dyn.iinet.net.au. [106.69.175.91])
        by smtp.gmail.com with ESMTPSA id u6sm13266463pfi.44.2021.05.19.01.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 01:04:39 -0700 (PDT)
Date:   Wed, 19 May 2021 16:04:34 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Suresh Balakrishnan <suresh.balakrishnan@intel.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Never return internal error codes to
 user space
Message-ID: <20210519080434.GA22854@sol>
References: <20210518155013.45622-1-andriy.shevchenko@linux.intel.com>
 <20210518232451.GA7362@sol>
 <YKTCDNcyUlrgE0Y4@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKTCDNcyUlrgE0Y4@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 19, 2021 at 10:45:16AM +0300, Andy Shevchenko wrote:
> On Wed, May 19, 2021 at 07:24:51AM +0800, Kent Gibson wrote:
> > On Tue, May 18, 2021 at 06:50:12PM +0300, Andy Shevchenko wrote:
> > > Currently it's possible that character device interface may return
> > > the error codes which are not supposed to be seen by user space.
> > > In this case it's EPROBE_DEFER.
> > > 
> > > Wrap it to return -ENODEV instead as sysfs does.
> 
> > > Fixes: d7c51b47ac11 ("gpio: userspace ABI for reading/writing GPIO lines")
> > > Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > > Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")
> 
> ...
> 
> > You immediately revert this patch in patch 2.
> > My understanding is that is not allowed within a patch set.
> 
> > Why split the patches instead of going direct to the new helper?
> 
> It's for backporting to make it easier. (I deliberately left the context above)
> 
> I can fold them if maintainers think it's okay to do.
> 

Not sure what the constraints are on backporting, but wouldn't it be
simpler and cleaner to backport the new helper?

But, as you say, it is the maintainers' call.

Cheers,
Kent.


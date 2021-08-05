Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7823E1473
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 14:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237830AbhHEMIu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 08:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232222AbhHEMIt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Aug 2021 08:08:49 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4212DC061765;
        Thu,  5 Aug 2021 05:08:34 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id f42so10585505lfv.7;
        Thu, 05 Aug 2021 05:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aScZkbb/5ZiuN37rlwqVKOBH127Feu3HCQ0ibyVkBUs=;
        b=XmFz63jRxLr9uS2/XywHpaOTqRHNYlyiXeiE2yzpV2i7LF3n9kmeZ9/MXFL0RSERRP
         LDpORCRxivFvLWwJayU6eGk7l+8fBOPYCGsPg9I5wAkYPtzcYjIkwKuEQisaeRBEKxsQ
         OuKZdlISYrbIapFbvab7IG+1lLDGekzOxye91ZrPuH3YX7zlqo/tKq5hLsS/P5zJQR4l
         0N9fqaRQ54jFUOzuQRX2uYgyjz1f+GeJGUyG0H6kHUpImSd4opVpN9KePmrGkeUYkk14
         u8aMlsn6/FJiTaijeEKlYDsFdjQ0+zYzvdtKlKCzjAofY/GNDx9MJIs6Sl+VWu4DNnr7
         t34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aScZkbb/5ZiuN37rlwqVKOBH127Feu3HCQ0ibyVkBUs=;
        b=duDCoAtEdqT+tBZqieagspo5X5IlmkK0ZWGUSJsgn1ahwrCaujPdfYash9jQPckQSg
         kRhMj9uazk7tX4lbD+5qNJryCJizhAhZmoPgaA113ohdIAy05DFsAy3EbIYJ3tiGH7DM
         wJITKYZNW0HnLpKDJrjy7UlIJy983Av1IpvAOLUhzu89qifzzBDSiv+nck2XG6Rf7U17
         plLAO6ZDiUxKCBRBoOdU3du8vVsy6jDOCoOYuTGnYxEWZZTpPA5g/xAkNrtG9yltW+uG
         ADu40Zfixh9MOf7o93+LKDaWM1mdR0OPMrJa/ZML6kOwZKCN9iWoUcH+JWeOJyAVoVhY
         D9Kw==
X-Gm-Message-State: AOAM533IEcefcQntsrWYHmexypL1dmeQ9RWkFLTgTGxgDN6JNjGOxm6x
        wo/Uwe5Z3RGScaJyuZ5aiM4=
X-Google-Smtp-Source: ABdhPJyR1z0aIIPjNsJTUBlSBWZhZpF4VttMvLL+Pe92PtYtRT0aAkUNHKIwUO92S6jupm8Z+0BH+Q==
X-Received: by 2002:a05:6512:5c5:: with SMTP id o5mr3605940lfo.93.1628165312639;
        Thu, 05 Aug 2021 05:08:32 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id p21sm495938lfa.264.2021.08.05.05.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 05:08:30 -0700 (PDT)
Date:   Thu, 5 Aug 2021 15:08:28 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 2/4] gpio: dwapb: Read GPIO base from gpio-base
 property
Message-ID: <20210805120828.kv22vb35d5b5b4li@mobilestation>
References: <20210804160019.77105-1-andriy.shevchenko@linux.intel.com>
 <20210804160019.77105-2-andriy.shevchenko@linux.intel.com>
 <YQu/tscUCweZdoCo@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQu/tscUCweZdoCo@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy

On Thu, Aug 05, 2021 at 01:38:46PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 04, 2021 at 07:00:17PM +0300, Andy Shevchenko wrote:
> > For backward compatibility with some legacy devices introduce
> > a new (*) property gpio-base to read GPIO base. This will allow
> > further cleaning up of the driver.
> > 
> > *) Note, it's not new for the GPIO library since the mockup driver
> >    is using it already.
> 
> Serge, I haven't put any tags here since the patch has been modified.
> It still works for my case. I hope that's what you wanted me to do.


Thanks for the update. Yep, it works like a charm. No gpio-base is read
from DT.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
Acked-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> 
> Since Lee gave his ACKs, this is the last in the series to be reviewed.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

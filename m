Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1F01ACAD6
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 17:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503878AbgDPPkT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 11:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2897523AbgDPNhm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 09:37:42 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFADC061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 06:37:42 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id r7so7795211ljg.13
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 06:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DJQlrf1AH1rITIkf2KD3HocUoGW47WJyihl8ONsy9kY=;
        b=ayVJmxZotkmJPt+F7XcUZ3Iv8uurttChbM1o/FVXJSt9/QoOCVkdlfF5xky1S5zVJK
         XmeRz6xNmFis9Mdh2hnLzW1ueByRgkdZ87GBO/ymLG9g4PeY5apDaPnOUJNz4ZkLdmAW
         ZE+M+EZ43T+5I0RP94UvzrGScwGfSplqUpTLAvMAh1foLXXB6fku7jK9TJILpwG77D88
         d3wAl9aUaW3/4+uzl9nHihvrdNXjAalcqeczmH1N1UTuw/fo5Dblk32kXC3MMSqtun8r
         r71/y6dT/OpSxqX9GdbtU/5z85YAgwz5CbkEAh4T7/byOiFok0iBDO815AXMBR5Q+vry
         8LIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DJQlrf1AH1rITIkf2KD3HocUoGW47WJyihl8ONsy9kY=;
        b=ZqQ7JE3S8zWoT4cpEGVzmgj01Bag9IR1JFN1D6vA3X5V52P43tAXy6Esz1QkZ4cefd
         6RmB+NlU7B9ZK0Olwe1RO09gY52/ZHGuGHjlJ7l/yHx28Q15GQi3QCS6BGNPnyKK46at
         HXWut6LIbgmcSw7YLcjBG0XI0++nHb9/TAz6z0nx457dbG/otmfDmj7pNzY8cbroieZN
         6AIzarpHpoJ+8fP+URS0aXxCOiVntitLd89qL48hNjAhxij0QIeXkI4cbDjf43gIUZaj
         8BWNN/OYyYuNmGTRelsX7RA+hUtxelf2sF/LHiWZlyE5MlNjj6aLsCvFF8XVA8LL5X5k
         YXSQ==
X-Gm-Message-State: AGi0PuZMWqxB+INy06pJnMvRYwLBjh0WRVv/ZemUjRbPHDd+hd9zvRYo
        461CqMNbzAKnILG61QEF2MU=
X-Google-Smtp-Source: APiQypJfb7H42RjdRwMMEKfs7kh7QHM33MkbK0+lYHxB3DRgijcH+S4iqAv6LWOTa1ttU+Xp0IhNPA==
X-Received: by 2002:a2e:b0ee:: with SMTP id h14mr6676418ljl.35.1587044260528;
        Thu, 16 Apr 2020 06:37:40 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id m13sm4067052ljb.64.2020.04.16.06.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 06:37:39 -0700 (PDT)
Date:   Thu, 16 Apr 2020 16:37:37 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 14/14] gpio: dwapb: Amend indentation in some cases
Message-ID: <20200416133737.lvve4svqak6tbgwn@mobilestation>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-15-andriy.shevchenko@linux.intel.com>
 <20200415171516.cugbzhvjua6cygnq@mobilestation>
 <20200416105614.GZ185537@smile.fi.intel.com>
 <20200416110613.4yyrlcle4oiy46a7@mobilestation>
 <CACRpkdacW7_Q7YW1WOazLaP_HKBbNKev3caJyKSNMBbXp7j1Zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdacW7_Q7YW1WOazLaP_HKBbNKev3caJyKSNMBbXp7j1Zw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 02:14:10PM +0200, Linus Walleij wrote:
> On Thu, Apr 16, 2020 at 1:06 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> 
> > Ah, Linus already pulled the series in. Next time then.)
> 
> Yeah sorry, I was a bit stressed by a big mail backlog and also a bit
> infatuated with my new b4 tool.
> 
> Is it fine to fix any remaining issues with extra patches?

I see. No worries. Andy did a good work fixing the indentations. But that
caused the 80 chars line rule violation in some cases. The best way would
be to avoid the rule violation in the first place, though sometimes it's
just impossible without weakening the code readability. I suggested to fix
some of the issues by reducing the error messages length and in another
case just to remove the no-op &-operation. So If there were following up
patches with fixes it would have been great. Though since we have got a
violation for several chars in just a few lines of code, we can leave
with that for now. So if Andy doesn't have a time to send the followup
patches, I'll do this sometime later in the framework of my next patchset.

Regards,
-Sergey

> 
> Yours,
> Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA371FACE2
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 11:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbgFPJkY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 05:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgFPJkX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 05:40:23 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E590FC05BD43;
        Tue, 16 Jun 2020 02:40:23 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k2so1184327pjs.2;
        Tue, 16 Jun 2020 02:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o61zf+amu71GcpKa4g+8zipO/x1nrz7DOb/lUv1IKqE=;
        b=HKrWDusJfnZ0JorBAsyfen9XqsKv61VukW4k8WO82AEYiH/lqRriDBVCkQZGCh5m1x
         odRWfuOT4Gop01fYuLlQgCHMrZXFIAsOEEx4qu+8+8d6Q25Y6aR6l1+GhxnwypNsASH2
         SyImxNxuTGnkGEGSebYkh+6GGB1I7xMoLQIX4NvKNMbgK4ozR46pLyVN6rRliZtbMn8J
         CjZ1cHrHHvmDeGkhRKECQ3RRklrf2Y1ZHYU2w/GAej6vspe1afMcG06Uldw7m5Vv+JZK
         dPs/i0cqTV1DyYCGG4dFKx6JiF6AzAIBAW09HDytAt4MPizPIboxlYoZMNR4rNs0v79J
         2kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o61zf+amu71GcpKa4g+8zipO/x1nrz7DOb/lUv1IKqE=;
        b=sSuhmHV9boEDn8wSjgxu2OzXzfE+0uPJP5DrN9rkCpRwYShif8qctMxN1cC9+BLO9D
         6L+ykhzXKYKt3iZkJI+VXX4Pa7ae0JwDW1ewkstLJKByEW0MYUAIATUh3mIYQA5fk5Vv
         xss38Me/p30mdxY35ZK9bdy6U6U23M79gUU7oLBq/JLwu4yuD9iC9XUTwYq/XbeKeo9E
         mHcglwchM1px5zezpYOPQ47RE5oZzZ4PFY+pe9Iqpd+rFEuE1AR3ovKd1ozoabePUxjy
         SrIPNSpOzXb1yFAOHPBIPUDtx7ayuWwBbV6oZKIY6C7s+9RNp2oBVGf4j4kjmM4m1/G/
         +VWw==
X-Gm-Message-State: AOAM531oSntS2EsKQGQYrJYB3kHjO4vsHa/GRgExDq6DHMbCO12nOBcH
        veDJ73bknN7FIId8JN17vNk=
X-Google-Smtp-Source: ABdhPJxdcoOoqQjpkzBdwwQThw9R/l4QSTBNADgC0pFL2q1yMO4TqlMl2Uv59u8b3VyTUqRf4qNTPA==
X-Received: by 2002:a17:90b:3651:: with SMTP id nh17mr2004943pjb.4.1592300423037;
        Tue, 16 Jun 2020 02:40:23 -0700 (PDT)
Received: from sol (220-235-122-244.dyn.iinet.net.au. [220.235.122.244])
        by smtp.gmail.com with ESMTPSA id 12sm16529428pfj.149.2020.06.16.02.40.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 02:40:22 -0700 (PDT)
Date:   Tue, 16 Jun 2020 17:40:17 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3] gpiolib: split character device into gpiolib-cdev
Message-ID: <20200616094017.GA5118@sol>
References: <20200609235135.10414-1-warthog618@gmail.com>
 <CACRpkdZ9to8LRMFiGNW5gd-v901j2AsKDWKojw=f4dRaJSm4kQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ9to8LRMFiGNW5gd-v901j2AsKDWKojw=f4dRaJSm4kQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 16, 2020 at 10:37:32AM +0200, Linus Walleij wrote:
> On Wed, Jun 10, 2020 at 1:52 AM Kent Gibson <warthog618@gmail.com> wrote:
> 
> > Split the cdev specific functionality out of gpiolib.c and into
> > gpiolib-cdev.c. This improves the readability and maintainability of both
> > the cdev and core gpiolib code.
> >
> > Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> >
> > ---
> >
> > Changes in v3:
> >  - updated the gpiolib-cdev.c file comment.
> >  - rebased to latest gpio/devel (no changes impacted this patch)
> >  - dropped the patch commentary as the points mentioned are mostly
> >   resolved - there still remain a couple of commits in gpio/fixes that will
> >   conflict...
> 
> I rebased my GPIO tree on v5.8-rc1 and the old version of the patch did
> not apply and neither did this, could you rebase this patch so I can
> apply it? Sorry for the moving target, the merge window times are
> a bit bumpy. :/
> 

No problem - I was expecting a rebase to be in that patch's future from
the beginning.

Give v4 a try.

Cheers,
Kent.

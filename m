Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420D026F4F3
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Sep 2020 06:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgIRETH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Sep 2020 00:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIRETH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Sep 2020 00:19:07 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A73BC06174A;
        Thu, 17 Sep 2020 21:19:07 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id c3so2301137plz.5;
        Thu, 17 Sep 2020 21:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uf0XaWxmSBWPs5Ykw52VMS2PajAcQCq1xNqnxZFMyic=;
        b=jmFM5Hk0uI1NV5zSmzm/rM5GMZnWpZNWRRVoGKaPVl9lvOS2eCjrtzS+6z8u19qAgd
         sDTmAtyKcKBy06InOtgbTb4X4PyMhqiMocmFrX0qvXPVrm1krkpyMVj2Rc099XEYRg8a
         8tDLZ4PQsuimizomOQJRZ2C5l4UWsPY35hg3IB5pzLWkR+OXNmwx48yAtPQ1HJa3jURB
         QZJBfzF971iHAG1Y5/v1cd2O3WvfuUzK7qRBVCPlj0aJJpcyj8D7x8hJqdLHOtVy7Ns3
         p2ksQWCSyqxpTv2Emz4KefLL+HH9ZIIr7refP2C/I9oBemQPvmiCj1yskQYAb27T6svY
         E6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uf0XaWxmSBWPs5Ykw52VMS2PajAcQCq1xNqnxZFMyic=;
        b=M/fargzO8ckqYGK7PGnVMQHAbEfUb0smdmGMqIehSZor1B9G3sIyV609RmYWJJiqGw
         D/kHuTue27Q/bYVQp0iPtuT4xiDysCfXFE8wpRcWZYHBd25cToe3oM4sDK1/i2X0AIq4
         h25OLeKm4ayGYnJ/0lzTCp5kAHdtL9HjgOGAL4v9yVIEjyPIvZzpjORjk2pnGJckvSQz
         zxmkLbZAoyDdIiQTun6qv5/Hty3jvQ0xZGwqadgb54KtPIvgh38gWAdGXtJhd9Dw3wz5
         qVHqzNKLn3BoGluk09MkruNV5d1tJw13caHx6MJui89EPr/EaxDnkKDzJ+aYBqHPkM+b
         bfJA==
X-Gm-Message-State: AOAM532c40m90lIqzh+xkBM+E/GJvr+ErGHFyBYjLHePdFcHRqwPWwC2
        lA1pMYFNjr1gGjuEEB8F/9Y=
X-Google-Smtp-Source: ABdhPJyTMd0Gg5Oqyr+rhgTmOWmBD6MN+kyK6wNEcYWw7fpphO5ZfvEVBe4QGl3Mhi+fBlLXTDQBqA==
X-Received: by 2002:a17:902:c40c:b029:d1:9bc8:1624 with SMTP id k12-20020a170902c40cb02900d19bc81624mr30237552plk.1.1600402746335;
        Thu, 17 Sep 2020 21:19:06 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
        by smtp.gmail.com with ESMTPSA id c24sm1326854pfd.24.2020.09.17.21.19.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 21:19:05 -0700 (PDT)
Date:   Thu, 17 Sep 2020 21:18:59 -0700
From:   Tao Ren <rentao.bupt@gmail.com>
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, Tao Ren <taoren@fb.com>
Subject: Re: [PATCH] gpio: aspeed: fix ast2600 bank properties
Message-ID: <20200918041858.GA14246@taoren-ubuntu-R90MNF91>
References: <20200916204216.9423-1-rentao.bupt@gmail.com>
 <60f9f14a-c9be-45ac-b3a8-516ab73d9bee@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60f9f14a-c9be-45ac-b3a8-516ab73d9bee@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 08:42:27AM +0930, Andrew Jeffery wrote:
> 
> 
> On Thu, 17 Sep 2020, at 06:12, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > GPIO_U is mapped to the least significant byte of input/output mask, and
> > the byte in "output" mask should be 0 because GPIO_U is input only. All
> > the other bits need to be 1 because GPIO_V/W/X support both input and
> > output modes.
> > 
> > Similarly, GPIO_Y/Z are mapped to the 2 least significant bytes, and the
> > according bits need to be 1 because GPIO_Y/Z support both input and
> > output modes.
> > 
> > Fixes: ab4a85534c3e ("gpio: aspeed: Add in ast2600 details to Aspeed driver")
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> 
> Thanks Tao,
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks Andrew for the quick review.

Cheers,

Tao

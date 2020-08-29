Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50562563FF
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Aug 2020 03:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgH2Bfm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 21:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgH2Bfj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 21:35:39 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF33BC061264;
        Fri, 28 Aug 2020 18:35:38 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id p11so1506037pfn.11;
        Fri, 28 Aug 2020 18:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZNK0OiZAzuMKTfZWlKjgsVU7byDX2P1YFCMooQsFrd4=;
        b=CLEcEkSV3Y48hXfAfNsrbsbJbcwI2Rn6gvp5OCrupluNy+q6oqIuyxIVAWgHuYFABj
         +v1VNBT8QLRwbQvrTgNev27DaMB/JJ9FnuXgqq/blerwnBPaFWphpX9BbdteoGsavPUk
         JRu5PzLmdyBidO0ZDxCFg0QCcTVlx0SWzNOR3YmG6tfKODQ5/AnHDauFem/VgOVVdj6S
         FLDRTgaac//Fhem9QtCSuV4dBQ1BbhIY3l8kSpaaW0B3CRDcTNdjjMRmt5e96e2TXduZ
         lpfSIXm0kRlQ+/io6z2ByuL07/jGvqOZUdkjDu6Er0XlEAQroDYJTz0cpXsl1co+Gn/+
         04Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZNK0OiZAzuMKTfZWlKjgsVU7byDX2P1YFCMooQsFrd4=;
        b=mBXg5ycJ9bv+/LkJZOioGkMhv2w9G2s1Qw+LBpuzlpN82l1cWcnoRS83ETxa/IqA9A
         GoOAXFzr8MLw4U6+WLZBvkrvl09E71jM+gwHWuwTV1YDuH5cdJcol4340FZ4zWJHkxMC
         4cbF6S3IBdaoUHKS32Sa6aahrcyAabZnbS3Yv+V4iXnfrI9RQ0xD1+yVbZGNWYtH3Ya6
         Xf9tf3ftMKPiHLC4Go0dzUrkayQ6gin3vsrw3D4xV+/auzUo5uUl82fFYKeBSHHGqkE5
         UIRzAaw4GJr9gFNz0lsG7vetDGIpJtOBAYr/Sfrve+V14XwnHhpbVu/ib8XQjmnXNNs2
         sbdA==
X-Gm-Message-State: AOAM532pU2xCi9gnynaBRy4YiD4Kdw00mOvXEskvpfSj9uTbfKQqI4tk
        Z14HqfIc81cHKXGnjUjaSiHoBcpkLkE=
X-Google-Smtp-Source: ABdhPJxSwMN816NwN1bLo4HR+IvCdFRKbphlREduyXq+9LOfSFQL0m2LBTouIqNhGH8v2v/BQYoarw==
X-Received: by 2002:aa7:9910:: with SMTP id z16mr1405785pff.120.1598664938108;
        Fri, 28 Aug 2020 18:35:38 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id a13sm669975pgn.17.2020.08.28.18.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 18:35:37 -0700 (PDT)
Date:   Sat, 29 Aug 2020 09:35:32 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 00/20] gpio: cdev: add uAPI v2
Message-ID: <20200829013532.GA5905@sol>
References: <20200827140020.159627-1-warthog618@gmail.com>
 <CACRpkdZZMbfpKy4gcfAzNq53LkYLcL9wm3Qtzyj_K8vkUW9RfQ@mail.gmail.com>
 <CAMpxmJXRY2wqqN3SzfJN+QTWAHYSYz4vEjLKWU82Y=PAmcm=5w@mail.gmail.com>
 <20200827224742.GA3714@sol>
 <CACRpkdZroNFFsHoBHUFTUUQij7nOcPQiXP-567+fH-Xerv=L4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZroNFFsHoBHUFTUUQij7nOcPQiXP-567+fH-Xerv=L4w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 28, 2020 at 04:37:19PM +0200, Linus Walleij wrote:
> On Fri, Aug 28, 2020 at 12:47 AM Kent Gibson <warthog618@gmail.com> wrote:
> 
> > The particular use case I am considering is one I had been asked about -
> > changing a requested line from input with edge detection to output, and
> > vice versa. Losing interrupts isn't really an issue for this use case -
> > it is expected.  Yet the current implementation requires a re-request.
> 
> This is possible to do for in-kernel users, but I don't know if that makes
> sense for userspace. It is for one-offs and prototyping after all, there
> is no need (IMO) to make it overly convenient for users to implement
> all kind of weirdness in userspace unless there is a very real use case.
> 

Fair point - in fact it is the same one that made me reconsider why I
was so concerned about potentially losing an edge event in a few rare
corner cases.

Another point for this change are that it actually simplifies the kernel
code, as it takes as much code to detect and filter these cases as it
does to include them in the normal flow.

I had a play with it yesterday and the change removes two whole
functions, gpio_v2_line_config_change_validate() and 
gpio_v2_line_config_has_edge_detection() at the expense of making
debounce_update() a little more complicated. I'm happy to put together a
v6 that incorporates those changes if there aren't any strenuous
objections - we can always revert to v5.  Or I could mail the couple of
patches I've made and if they seem reasonable then I could merge them
into this set?

Cheers,
Kent.

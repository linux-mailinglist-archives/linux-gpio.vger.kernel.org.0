Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA1239D43B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 07:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbhFGFCq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 01:02:46 -0400
Received: from mail-pj1-f46.google.com ([209.85.216.46]:38828 "EHLO
        mail-pj1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhFGFCq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 01:02:46 -0400
Received: by mail-pj1-f46.google.com with SMTP id m13-20020a17090b068db02901656cc93a75so11129599pjz.3
        for <linux-gpio@vger.kernel.org>; Sun, 06 Jun 2021 22:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TBzkw3pjuLvtwqzaoprCbt8qAHs6UjkaGogTqGGAYtc=;
        b=EwNUpP4e2UljMG9Yu6GlBUaQffTdmpIredF1PjrHjk6AVhcZ7v3gZM5pe/2M6jESew
         nJJjTBrTpKYZIeyAA9RymzUBQgY2TnkqzV2A4yQx+Jh6zJQ9Y5LVA5ltydsFX/O1TGMs
         QTlfB5IM0bkHp1yUn+eVzpulJPVnM1JOyK3Wkizd/orTaqpPhKSrLRSJNgUFFeZJ6BT0
         7Gd7VueEaTP1qsXi5rJA8sg2srxx7UjYqMHIZivkxzlEMqOtndHVpTTXkLwNuxsiW8wI
         tdyK7kXzGoNRM3pnCfm+Lmu1iiOogB2NIM6n2li2dwHlifbhxggl1FtI+hL3YiyfyEE7
         JlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TBzkw3pjuLvtwqzaoprCbt8qAHs6UjkaGogTqGGAYtc=;
        b=ZbQxqfCsSmg/Y1fFwPBbiD7UnGHNT2Ihu7aoJaI0Y4s6jTuY242JJh4izMy/YqmTE6
         F8ZV6+wDPe9FPgdO9VLBIt2+uY0VWZbgU+KIgSx3QQLz3W+soAdaEfsST3XJVxeI+K2n
         Tt3dl0iWWHVRe3sXDkLxYrAXvqlGPMEFjXD9ADOYajjE554yspcZSDTi8Y18/6Vn8rAg
         N6uMAQvI00TnTuYtiUoN72Mu7HmOp4HTzmMoGtPs3iMzFcQ9sBoMsEI66424kLkJALEc
         GnxGoje+VF5pD/Tp1+N4z5S9NBJdphM+7ZbhSRXm4H9MDLJYYeAK8wGQPrBDvgyZXgW2
         zVYw==
X-Gm-Message-State: AOAM5338QF9Bng6mFUPdZv1uYnJT9DeHSw9BrFW7BInFZKVHabGJWSqj
        95WVrPLUzYG+8Fc64iuDlT0SWncWgfM=
X-Google-Smtp-Source: ABdhPJwgsZGxUR6tJ+o1F2KwXYft/gr4/Tvean/m04f8qkTIp4IH8+CD8LkKgqFlvuiw5ZsMcfqZCQ==
X-Received: by 2002:a17:902:b683:b029:ee:f0e3:7a50 with SMTP id c3-20020a170902b683b02900eef0e37a50mr16127677pls.7.1623041995595;
        Sun, 06 Jun 2021 21:59:55 -0700 (PDT)
Received: from sol (106-69-174-31.dyn.iinet.net.au. [106.69.174.31])
        by smtp.gmail.com with ESMTPSA id o3sm7486115pgh.22.2021.06.06.21.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 21:59:54 -0700 (PDT)
Date:   Mon, 7 Jun 2021 12:59:50 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH v3] core: implement v2.0 API
Message-ID: <20210607045950.GA18318@sol>
References: <20210604094100.30075-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604094100.30075-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 04, 2021 at 11:41:00AM +0200, Bartosz Golaszewski wrote:
> This is the bulk of changes for the core C library.
> 
> The documentation has been extended to document the lifetime management
> of objects explictly.
> 
> The concept of attributes has been removed - instead the translation from
> configuration options to kernel request happens at the time of the line
> request call and can only fail at this stage - the config mutators no
> longer return any value.
> 
> If the caller has passed a config that is too complicated, the request
> function will set errno to E2BIG which stands for: "Argument list too
> long". If the caller has passed an invalid value to any of the line config
> mutators, the error will be returned at the time of making the request.
> 
> The direction and edge options have been split from the former
> request_type.
> 
> The objects are no longer reference counted and no longer can be the
> responsibility for their lifetime shared.
> 
> There are many other minor tweaks everywhere.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
> Hi Kent,
> 
> this is another iteration of the new API. This time there are no big
> changes, mostly just documentation and naming-convention tweaks.
> 
> I will push it out to a semi-official next/libgpiod-v2.0 branch and any
> follow-up changes will be squashed into the v2.0 API there.
> 

I haven't looked through all the code, but gpiod.h looks good to me, and
I'm sure any issues in the implementation will come out in the wash, so
go for it.

Cheers,
Kent.

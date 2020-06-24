Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B074207587
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 16:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391201AbgFXOTV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 10:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391194AbgFXOTT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 10:19:19 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F175CC0613ED;
        Wed, 24 Jun 2020 07:19:18 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id g17so1101608plq.12;
        Wed, 24 Jun 2020 07:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hKkOlSil9sHYk/GFk5A0jOfZma/H2TL7bZJKmneZ+Co=;
        b=KvgCFQYv6ZAYZmcyQI0BM3TdJUCc1/KrkgPVGjPcx7ApMqYlKxWH+o6H8/eFOTLA0d
         yoTtIZxwjaUZLh3uMnLsTepvdJOAVaCCqdx5qeqxUO5smEH/qZJLzxDimY6fg0a0NNsk
         tAHctNvR41JiSIsfWw5ttpUIDtOs9KOeR+IogKrFsuI2i4m/pgXjUTZncm+izzqyY+Nk
         NMK0bP31oFT+8wgrc4zlC1c49LfopUU4oRcminHmj5uIlR1EC2HfFE6jgBMB6F9YnHxd
         mAhMFK7WNtwpe5apulWAgqf1bjdXY3Pc3zQzbxo0trU7W6tuOe5AcrDoibmzH73zhd8E
         8/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hKkOlSil9sHYk/GFk5A0jOfZma/H2TL7bZJKmneZ+Co=;
        b=ERii7EhepnGrBo4k8mO83XEpDawSBfz6LDvFzHhX0817l7zYvQaOMhJpPggBNqvjAM
         jjtP0FFeBcI3XEl5fgEV2etb+X23CbuL/yml/AOyPn4jPwteEBAIiTHvSDhwrVFD3Fhq
         mSHaaYYbEQS/BFDUhwUO4istJkLJB4h8O1va6jH21P32hxi5fLlStZnOYuJpZzaQTzMm
         bjTYFnlgio4fxZBa3y+z349lK5+YxG7S4UnanFB8HqD0va1aZy7gHuevu1lx0/D30NWV
         JxzhsaCdtH3WtJ32L24+0mvg7gBjTQ2zqhLsbTqbh0ihzvi6ms1oYrkh69R/r0gBxiD7
         IG5w==
X-Gm-Message-State: AOAM533KSKBN7dwag1tr5VutZz4FzwBMSj6rMDqyA6X3du/lKrMpCypE
        oecUmQ4QM8dwABmSt24rR2IcPMePj5s=
X-Google-Smtp-Source: ABdhPJwhrBWHIET9uAyzEmsZbYue/XncS+KLW5GKCDdhR0G9xIrcwkhlD10RXW2UrGyVCOhGSFIvdA==
X-Received: by 2002:a17:90a:1117:: with SMTP id d23mr29014164pja.136.1593008358437;
        Wed, 24 Jun 2020 07:19:18 -0700 (PDT)
Received: from sol (220-235-99-174.dyn.iinet.net.au. [220.235.99.174])
        by smtp.gmail.com with ESMTPSA id l195sm20939094pfd.18.2020.06.24.07.19.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 07:19:17 -0700 (PDT)
Date:   Wed, 24 Jun 2020 22:19:12 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 09/22] gpiolib: cdev: rename priv to gcdev
Message-ID: <20200624141912.GB7569@sol>
References: <20200623040107.22270-1-warthog618@gmail.com>
 <20200623040107.22270-10-warthog618@gmail.com>
 <CAMpxmJUWZGhB3eeSquOJZQegTAwyb7yyKzBSeOjG7FSzq=BAkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJUWZGhB3eeSquOJZQegTAwyb7yyKzBSeOjG7FSzq=BAkg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 24, 2020 at 04:04:09PM +0200, Bartosz Golaszewski wrote:
> wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Rename priv to gcdev to improve readability.
> >
> > The name "priv" indicates that the object is pointed to by
> > file->private_data, not what the object is actually is.
> > It is always used to point to a struct gpio_chardev_data so renaming
> > it to gcdev seemed as good as anything, and certainly clearer than "priv".
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> >
> 
> Ugh now it's gcdev and gdev everywhere and it doesn't really make it
> more readable. Maybe chardev_data or cdev_data?
> 

Agreed, it isn't ideal visually, but is at least more unique than priv.
Linus was going for short names recently (e.g. gc for gpiochip), so I was
going for something short.

And I try avoid names ending in _data or _state or similar where they
don't really add anything.

Would chardev or gchardev work for you?

Cheers,
Kent.

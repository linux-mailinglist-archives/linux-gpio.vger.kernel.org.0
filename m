Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06AC366968
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Apr 2021 12:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhDUKre (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 06:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbhDUKrd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 06:47:33 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFFCFC06174A;
        Wed, 21 Apr 2021 03:46:59 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id q10so29399490pgj.2;
        Wed, 21 Apr 2021 03:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oU6hXhwQ5Ignvwty2TH1odpK5v3+ZCsNoAjU9Fo3lIU=;
        b=hOxjl8X6uMuYBL9+aQSGO/Fa/xlDJigVP2oZetR/626YXkBKAIfrrbpYcrLA790z4i
         xJGlXubw0zz6ydJG1hTfyp/APxG98MPTnt5Vfc8rxmd8KwJR64Ib2jarknCDY+k8/Sc1
         s+cNVYfM2TDNzHEJKiVDKlstkkXneVGSvVJbzdnVPEOPUzZZfpkVwfooNVJtLNezzma7
         UMmnvZACUuvKwZUqXOYYX9seOUECaEAu0+pMbpODpt6xBFsB45PjCDh8tRGyn0bXvfrR
         UdC+t/etKilXjvj/GVkZaSw9HO/MZ4UVv8950xlpUNg36/dgG9dSAvyVNE/7sGXhq7/m
         g4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oU6hXhwQ5Ignvwty2TH1odpK5v3+ZCsNoAjU9Fo3lIU=;
        b=Nu2DsVNiBqqc8EKWG2NLDT4Pkg+5YH+eUECZTD+ZnH3fObtAb56PrCRp1nZEUOt/F7
         ku4oA336h9rVtwP6kFkqykWdsTgtaiNS8lkQTS3+jfagmeO8uBBnhOC2bkxdsqRhjS8C
         09YF+2TTKNwcPppuWJ3LDpnv2DL1MfHa4jNVpbogqsfxbV0FHxGBa9MXP6ZXPrtFV46f
         A0Dq2sP+XF6n6s3NTsLNTwdjYMdOSVJ6D+vAHIAuYjiSf13gxoVizcTS8dmnL8OR7iiW
         OKL8F7R9yF/Anq+Fulk1/YOaXc8TUnf01jM9+l1tt+Us3xOZ9qHlltgFkfVy0Xo2ds3G
         2YAA==
X-Gm-Message-State: AOAM5312q+e9d905mXgCjMSU03b1blj6wpd9ytfWUTS/+4vkPWIeqHE1
        hNL5gdAymfrsyvXUnp/haax6psKeE5znsAyCbF8=
X-Google-Smtp-Source: ABdhPJyYtLn8/QBD0Cvv7B92/uc66d+TdHzb8pXDCdyUXwG7YJ3TXhoQQJa7L7NjXSgCYCh2jVMzahw8GS++SUrf1Og=
X-Received: by 2002:a17:90b:1c0f:: with SMTP id oc15mr10746828pjb.228.1619002019111;
 Wed, 21 Apr 2021 03:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210420123932.24634-1-tsbogend@alpha.franken.de>
 <CAHp75VcQ4WXm3uS2r=uDpA4+0vPWdKjev6=vV_JDxMLPzpHDRw@mail.gmail.com>
 <20210421083214.GA5694@alpha.franken.de> <CAHp75VeeWTdYjSgyjgzmFSpO=Zc+Q6SCS-06LVcVoghuF9vNgA@mail.gmail.com>
 <20210421091843.GA6174@alpha.franken.de> <CAHp75Vf921iQUR=VgMXTD-M_Ah+8UeAmKXXqgvB8WFz58pQ5Qg@mail.gmail.com>
 <20210421103720.GA7390@alpha.franken.de>
In-Reply-To: <20210421103720.GA7390@alpha.franken.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 21 Apr 2021 13:46:43 +0300
Message-ID: <CAHp75VdgUus64zbbaD5enV0-sof4jYSs3soORqyBTkxVhM4b6A@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 21, 2021 at 1:37 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Wed, Apr 21, 2021 at 12:54:53PM +0300, Andy Shevchenko wrote:
> > As I promised you, I will do a deep review later on, I'm giving you
> > time to find issues yourself. That's how you may actually learn the
> > things. It's solely your choice to follow or not, my promise will be
> > kept and you will get an answer anyway.
>
> so let's make it a challenge ;-)
>
> I see I could use gpiochip_get_data() in few place.
>
> Is there more you see ?

Good.

For now:
- dead code due to driver not being compiled as module
- too verbose Kconfig machinery (it's not about the "help" part!)
- open coded stuff in IRQ handler
- whatever you found.

-- 
With Best Regards,
Andy Shevchenko

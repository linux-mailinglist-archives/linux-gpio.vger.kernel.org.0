Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31C23AFB28
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jun 2021 04:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhFVCon (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 22:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbhFVCon (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 22:44:43 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9EFC061574;
        Mon, 21 Jun 2021 19:42:27 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id t9so15866929pgn.4;
        Mon, 21 Jun 2021 19:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ny9bOX9z51IwOfXzFDcc71+1MJQxhyDMs+64/Dzgpxc=;
        b=aKtPAh8+bmzUtdlkTccd13w7XsR4SDTk5khVLra7ax1XbotsI+bowSvi9SYeJsKQTG
         p3LQWycVYaz8fvU7AKGFrJPlpaGONgwASXG9MLERqnjLXzTysZGnujvBKDIGsl01GVpC
         RsIbyyUpfiCzDd0V0H29+JxG99AVGdBcPJMbKHYdszWN1XU/O3A+Vzh/GcNgvGXpXcHi
         PsInkZK0Tg69UYsfphG4S26ZFj+3B7iM8DJ29aI2gU63mbpp3oxRTICL9+W22byCItiv
         xOiZLUHIbJA4MrwuPwTDzvmjvKsXEBXSBRld9WxWEO3IZMajswu/FJ49aBxs34OLvqmo
         FDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ny9bOX9z51IwOfXzFDcc71+1MJQxhyDMs+64/Dzgpxc=;
        b=NqZHQcAm22/EaWEXc9Re/4cXiVeNTmkGlCLs3X/NNU6K+y1rr8HwDhxf3cqt8BBf3k
         6Cb0tzGE+iVS2PYzXwY4mcOfWhjCJBGpfuzlfUsM0/kHMoCvsLotNPx4w+IHJcOtj0pw
         3zyUrvdz/NkYYDhUY++/7YgSTrLlGPSgpNp8atWQHWrWOzuBIYudVOljcdpw3BIIYKbK
         LQU5PpiHxgBFsgBoU2/4uoIOzbX5E0sl8MhfKZw5sBTrBFUi8ihgYWhDizKjdS/AmxHs
         3lu/Lv8Prkh3E0MI91KpPve6VLuL0fr8383rImRDMInFldPtk75lRuDnlZJbuXponU3C
         8NFw==
X-Gm-Message-State: AOAM531bh3cGdaFnbubZMn++AjRwJhlx9BKwpASqHsYy0kWKriLQI2g0
        H7fiuSCaXY8/iEz6pm6tSxc=
X-Google-Smtp-Source: ABdhPJxrM6YODy6Ywfvt2Tp6pw0j9aFb7vS0zduNEohOTWcSy+2Y9wUn02kF8SYzG9UHliin3ytrEw==
X-Received: by 2002:a63:1c0a:: with SMTP id c10mr1515606pgc.306.1624329746452;
        Mon, 21 Jun 2021 19:42:26 -0700 (PDT)
Received: from sol (106-69-169-160.dyn.iinet.net.au. [106.69.169.160])
        by smtp.gmail.com with ESMTPSA id s126sm7245401pfb.164.2021.06.21.19.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 19:42:25 -0700 (PDT)
Date:   Tue, 22 Jun 2021 10:42:20 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Gabriel Knezek <gabeknez@linux.microsoft.com>,
        bgolaszewski@baylibre.com
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, andy.shevchenko@gmail.com
Subject: Re: [PATCH v3] gpiolib: cdev: zero padding during conversion to
 gpioline_info_changed
Message-ID: <20210622024220.GA61485@sol>
References: <1624314539-17396-1-git-send-email-gabeknez@linux.microsoft.com>
 <20210622020655.GA8794@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622020655.GA8794@sol>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 22, 2021 at 10:06:55AM +0800, Kent Gibson wrote:
> On Mon, Jun 21, 2021 at 03:28:59PM -0700, Gabriel Knezek wrote:
> > When userspace requests a GPIO v1 line info changed event,
> > lineinfo_watch_read() populates and returns the gpioline_info_changed
> > structure. It contains 5 words of padding at the end which are not
> > initialized before being returned to userspace.
> > 
> > Zero the structure in gpio_v2_line_info_change_to_v1() before populating
> > its contents.
> > 
> > Fixes: aad955842d1c ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and
> > GPIO_V2_GET_LINEINFO_WATCH_IOCTL")
> > Signed-off-by: Gabriel Knezek <gabeknez@linux.microsoft.com>
> > ---
> > Changes in v3:
> >   - Include the Fixes tag referencing the code being fixed and properly
> >     version the patch.
> > 
> > Changes in v2:
> >   - Update commit message and subject with suggestions about clarity.
> >   - Patch series at https://www.spinics.net/lists/linux-gpio/msg62163.html
> > 
> > v1:
> >   - Initial patch
> >   - Patch series at https://www.spinics.net/lists/linux-gpio/msg62084.html
> > 
> >  drivers/gpio/gpiolib-cdev.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> > index ee5903aac497..af68532835fe 100644
> > --- a/drivers/gpio/gpiolib-cdev.c
> > +++ b/drivers/gpio/gpiolib-cdev.c
> > @@ -1865,6 +1865,7 @@ static void gpio_v2_line_info_changed_to_v1(
> >  		struct gpio_v2_line_info_changed *lic_v2,
> >  		struct gpioline_info_changed *lic_v1)
> >  {
> > +	memset(lic_v1, 0, sizeof(*lic_v1));
> >  	gpio_v2_line_info_to_v1(&lic_v2->info, &lic_v1->info);
> >  	lic_v1->timestamp = lic_v2->timestamp_ns;
> >  	lic_v1->event_type = lic_v2->event_type;
> > -- 
> > 2.25.1
> > 
> 
> <sigh> The joe.reviewer@hotmail.com in the git send-email example that I
> provided off list was just that - an example that you were supposed to
> replace with the actual reviewers :|.
> 
> I wouldn't generally bother with the links to the previous patch
> versions, though it might be helpful given the rename and version
> issues of the previous patches in this case.  If you are going to
> provide links, use reference style with all the links at the bottom of
> the mail.
> 
> Other than that, the only problem I have is that the Fixes tag line
> shouldn't wrap - it is an exception to the rule.
> Bart, are you ok with fixing that on the way in - assuming there are no
> other objections?
> 
Nearly forgot...

Reviewed-by: Kent Gibson <warthog618@gmail.com>

> Cheers,
> Kent.
> 

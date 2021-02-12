Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9257E31A3BB
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 18:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbhBLRiZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 12:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbhBLRiY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 12:38:24 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D98C061574
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 09:37:45 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id m6so6251357pfk.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 09:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kW4kCcmZpN9DXSNX16HNa+NYisnsmMLvFLsGVM7NGGs=;
        b=g66WvT5ybaijeCWJNQ81WWGHK/fuYsNV9UWhFxQKOZiHHzOGOCJhGA60plFJiyfz07
         /d5zAV1tJmJ/kGv0BH9afH0V8OTzVozqgSAONLVAEUPfidijmpdD2LDjxlhCXQNpAhwR
         KCpEFEUCZtd95p8fnBx0DwB6wEao3NHA355ie+igGBchUnEfyhxDn+Z3nyzNtkF6d5m3
         iI8qvIgEBnHWscmKOonGvrFAtNgtMOAy861tNxp9aUOuBt/RODni1Qx2Qc/G+ebClGhp
         wuBKefmKjpocn4fxU7HxYbXeErEGGLzg7M6TcxgIU7Tfi0Y1MQsjh9dKt+6gGhajZJuq
         ieNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kW4kCcmZpN9DXSNX16HNa+NYisnsmMLvFLsGVM7NGGs=;
        b=k7X7xo+zqF15Cq6tkcTyqSbxUopm5iqOEaiR/YWv/u6eAWTWq7LwcZUATCWZUcTtXo
         G1VT+6bAUFTCGUKidg5g3ofTssdle18h/ewMAJGZRBm09RaGB7d3hx5+NVeOgzPprqwj
         eFVx+MDFaXABhvHcNQlJvEwS4gpQRjK7jBdmdrIXzBR092XmomtRIUlxpfvcyRIZI4Uz
         5ZESt25qCCin0A9psXEPh/P725QLa68WY9eg7UqLK/lJvL8iD9iRjfsf36ZBuDgdvC2C
         MwBtlFTrRXh3zgzBRELYPWCixRY+WmLIrI99YRZ+20phWwophtOtZtfS3lIbOZgt1fkr
         7vzw==
X-Gm-Message-State: AOAM531vFcLl+JjaqPIf2H6NuHwwMehCqZXwq2QY4yusL3eDGqtsuB+N
        rKhozLMyJR1bLFE1fc1oICdfug==
X-Google-Smtp-Source: ABdhPJy9io6J3C5KbIOyrn6eZ6xjVshGEO1x8G1WfrqbgwVjf7IUtCx//OIUGA7PcYhEwPErP30bQg==
X-Received: by 2002:a63:a552:: with SMTP id r18mr4143162pgu.19.1613151464942;
        Fri, 12 Feb 2021 09:37:44 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:55c2:10c0:c1dd:8558])
        by smtp.gmail.com with ESMTPSA id 17sm9948748pgy.53.2021.02.12.09.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 09:37:44 -0800 (PST)
Date:   Fri, 12 Feb 2021 09:37:42 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: use to octal permissions for debugfs files
Message-ID: <20210212173742.GA660547@x1>
References: <20210126044742.87602-1-drew@beagleboard.org>
 <CACRpkdbcOvOS4OSZt8cAWV7+-D8sHN7HWhrxGLU7fqKiwB1CCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbcOvOS4OSZt8cAWV7+-D8sHN7HWhrxGLU7fqKiwB1CCg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 12, 2021 at 08:58:58AM +0100, Linus Walleij wrote:
> On Tue, Jan 26, 2021 at 5:55 AM Drew Fustini <drew@beagleboard.org> wrote:
> 
> > Switch over pinctrl debugfs files to use octal permissions as they are
> > preferred over symbolic permissions. Refer to commit f90774e1fd27
> > ("checkpatch: look for symbolic permissions and suggest octal instead").
> >
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> 
> That's right. Patch applied!
> 
> Yours,
> Linus Walleij

Thanks, Linus.  However, Andy suggested I make this a series as it was
prep for my patch to add 'pinmux-select' to debugfs.  I posted it as
part of a 2 patch series [1].  In addition, Joe Perches noticed I forgot
3 instances of debugfs_create_file() in core.c so I was about to fix
that in v5 of the patch series.  v5 is mostly addressing comments on the
pinmux-select feature.

Thank you,
Drew

[1] https://lore.kernel.org/linux-gpio/20210210222851.232374-1-drew@beagleboard.org/

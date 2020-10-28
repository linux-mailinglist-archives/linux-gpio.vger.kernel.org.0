Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20B029DA72
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 00:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390289AbgJ1XXZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 19:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390203AbgJ1XWR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 19:22:17 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97571C0613D2;
        Wed, 28 Oct 2020 16:22:17 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id o129so762946pfb.1;
        Wed, 28 Oct 2020 16:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z+hUYyDlaEK4lCFCCWRp2JTvLMWl+QVZfGI9YkRMX4U=;
        b=ArN/lxLfAZjVgWV9asnrwIh3k9U916Fctx3VFWPYecAv6IjyEkF9qFbbMEL8QbiqhP
         W/WWcCSSxsmjqSfxPkNuJyvxbVF54HRhRrTWWZU7cs9+SVvOLoyNlX6oExP6KpJFX+N+
         DQ5KXjS8Nrx6Ms03yEo9sSsR/E6z7vbqgMBDv8TNsnKayPNc7qJfOZo2oWyhv9/sxYKc
         kd3wrKYUt2Kq2FYLtZLMLPhVsQSzQYIGKeUM2bbU4YNIq06spM94N9VZnNUjWSOljPry
         TsX1/uhALeG1GuBeVJI/lu9MVMrqkPzYLzOMq23iv6PIeUO/DnQUDg9kr5ydTL/QRe9o
         nHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z+hUYyDlaEK4lCFCCWRp2JTvLMWl+QVZfGI9YkRMX4U=;
        b=osYyD3lZqZ30QRYgRR7bEYplnW8VOME7bsiwvjL0N1jPtcEfUSkL7DBSmtpcBdnkB9
         n17MkXLp1dt1SkutRo2fPlb/Kyd0t+MADHMwR4jXGJSo+JWLBWUO/IP4nr2Rhnoc0uBc
         fnibLxTrNJl3u7T2UIZk1lATq1ebS/awwzIlu0X5vuLtSmJ/sitPb9GI2jhh8R20k5DH
         0WujDk0NR+EIiwq+ejdaTg/1Z0X17AG80oO0aAD/lfZBNJSFA0DrwNW3qauoOgWCEhE0
         YjkRYZ6pq3M12J2LmT9QK5uwwCmdOr1fmdqdviis+856DAQMmaKgYehhqqLU9NgFQaQC
         EO9g==
X-Gm-Message-State: AOAM530ViReM9k1dXSDDXt0YQx4RcykydgWLbvz0qF+SUJq3WzSf5SfP
        rgnLDIWIcgQtMyHMkz1jyoRfv7rIAyPLCw==
X-Google-Smtp-Source: ABdhPJzJR/CrflVVwZohuLxz8b71t2b4N1qNYlGl/mluP5YARvLTLBec++coW0wanH5vMaK238BYug==
X-Received: by 2002:a17:90a:9f8a:: with SMTP id o10mr1205982pjp.160.1603927337156;
        Wed, 28 Oct 2020 16:22:17 -0700 (PDT)
Received: from sol (106-69-179-84.dyn.iinet.net.au. [106.69.179.84])
        by smtp.gmail.com with ESMTPSA id q35sm472345pja.28.2020.10.28.16.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 16:22:16 -0700 (PDT)
Date:   Thu, 29 Oct 2020 07:22:11 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 0/3] gpiolib: cdev: allow edge event timestamps to be
 configured as REALTIME
Message-ID: <20201028232211.GB4384@sol>
References: <20201014231158.34117-1-warthog618@gmail.com>
 <CACRpkdbTsN6p4n3f9SJrgAjdkzDu2S67rU3tLWwX0X50ekjctQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbTsN6p4n3f9SJrgAjdkzDu2S67rU3tLWwX0X50ekjctQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 05:01:49PM +0100, Linus Walleij wrote:
> On Thu, Oct 15, 2020 at 1:12 AM Kent Gibson <warthog618@gmail.com> wrote:
> 
> > This patch set adds the option to select CLOCK_REALTIME as the source
> > clock for line events.
> >
> > The first patch is the core of the change, while the remaining two update
> > the GPIO tools to make use of the new option.
> >
> > Changes for v2:
> >  - change line_event_timestamp() return to u64 to avoid clipping to 32bits
> >    on 32bit platforms.
> >  - fix the line spacing after line_event_timestamp()
> 
> Where are we standing with this patch set? Good to go so
> I should just try to merge it?
> 

I'm fine with it, especially now that I've tested it on 32bit platforms
as well as 64bit.

Bart was ok with v1, and I doubt the changes for v2 would negatively
impact that, though I did overlook adding his review tag.

Cheers,
Kent.

> Yours,
> Linus Walleij

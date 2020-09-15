Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C2726A4F7
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 14:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgIOMTS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 08:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgIOMSX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 08:18:23 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE03C06178A
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2020 05:18:22 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id gf14so1619895pjb.5
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2020 05:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pWEw/qDhsQAyU0+vHxDM5WmiBgcVHYH7fWhv876tLgg=;
        b=QD9hXLyB3ihfFe0EtE7OoD6iqa7mg8zq7pclzgy2OK8fmaFnF7mNUw8tyDHfmLgAo0
         S8/9fvq6ZW4b1yiEyT9AHqXCnKG2yE2ybGvgEt0k7agOWXsMJewbS8knhaIlUo7y1L1O
         eDXHeXU/TsIPxwUq5WtLZRspwOtD0DTnIkME3KGmdEVTkTeiB7TV612SmuVXzIQIIK9N
         Uxch0ZNWtF6MBr4uHf1OPwsk3gysAlb93P+5rI5o4p25mSPDmiDUAm0mYT1NksDuVIHF
         vVErg3z0K6aqnZ6Dy5yoGW1UNTFY4VrOxgEMjVltATwoGQM0Wg0hfNBuG+9OCIpqwbyC
         a5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pWEw/qDhsQAyU0+vHxDM5WmiBgcVHYH7fWhv876tLgg=;
        b=hSfrQHaVIEwVq62PYz8Jm9k6Pqm/6qc7hYxhnZ2D1/HlxOsYTMdX2kHEgCKRzP387L
         fF5vTum0BbU1M+PV96OxcPHCZ61sxQVKYH9FoDwlf2ROCzC00d5cgWCv39bZAKPEu4dZ
         wAQDW47EtVNxhvne+MT6waJj/v59+oBqdZMCFIVUiZj+yTTYDCRWcA29ny2TSrf1IeYK
         zG1geC1LRxU+2y8UNl03CEpkmQackC60gO505NCLsrV37C/U5raUTIZGX5MCcnXWMyEo
         BH0kHmCYoTCLbaev06NgszLdHeG6GHSXgljMABSsMWC44Ihck4tXTXFBh+sJzaJ4DqNs
         XHbQ==
X-Gm-Message-State: AOAM531KGFRyybBYUfQ5Y9tTEudvnoDDFA5UdA3hWKTzfq6bcsEh14GI
        yL2NL0XwXJ8U66dmFxTPC6s=
X-Google-Smtp-Source: ABdhPJxttvri+GgO5zVZFs7FSOa9AxQ8rhtGTgznadDCc+J4OEr1wR1ie3KEPTbANKDaTHFzRHIUlg==
X-Received: by 2002:a17:90a:71c9:: with SMTP id m9mr3799061pjs.146.1600172300712;
        Tue, 15 Sep 2020 05:18:20 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id s16sm11257164pgl.78.2020.09.15.05.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 05:18:19 -0700 (PDT)
Date:   Tue, 15 Sep 2020 20:18:15 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] gpiolib: Fix line event handling in syscall
 compatible mode
Message-ID: <20200915121815.GA98308@sol>
References: <20200914143743.39871-1-andriy.shevchenko@linux.intel.com>
 <20200914230526.GA4138@sol>
 <20200915092022.GR3956970@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915092022.GR3956970@smile.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 15, 2020 at 12:20:22PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 15, 2020 at 07:05:26AM +0800, Kent Gibson wrote:
> > On Mon, Sep 14, 2020 at 05:37:43PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > It can return size_t now.
> 
> > >  	ssize_t bytes_read = 0;
> > > +	ssize_t ge_size;
> > 
> > Similarly here.
> 
> I deliberately left the ssize_t type to be consistent with the returned type of
> the function and bytes_read. If you insist on the type change I will do, though
> I personally like my approach.
> 

Bart prefers to use unsigned ints where variables are never negative,
and lineevent_get_size() never returns negative so should be size_t.
And it feels like a sizeof() to me so should return a size_t.

By the same logic bytes_read is never negative so it should be size_t as
well.  It seems reasonable to assume that bytes_read will always be less
than SSIZE_MAX so any cast to ssize_t for the return would be harmless.
Though changing that would probably mean a separate patch?

> Thanks for your review. Before I'm going on it, can you confirm that these are
> the only issues with the patch and after addressing them you will be okay with
> the patch?

I have suggested renaming ge_size to event_size, but that is just personal
preference. You have more than enough documentation describing the issue
where it is assigned, so I'm fine with that.

These are just my suggestions. Feel free to ignore them.

Cheers,
Kent.

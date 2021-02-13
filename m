Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26FF331A8C0
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Feb 2021 01:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhBMAYW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 19:24:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbhBMAYV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 19:24:21 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B04C061756
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 16:23:41 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id e9so563151pjj.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 16:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fNaB+Z8UtZPx/Yeh2IrJ1nsVH7Wdo5mwB6XRElv2VJw=;
        b=lkST1u/4/y4kRoUDcbqjQLH2jMgln5li97tYq+vsDMq8v5R6Iijwj+AQGeni9tPs+N
         jioxQpfvEu4qj49aPU7TkT6wXRyIXZORoqAiv5EpBxMQRObgphxXft43aBRipnBp3j4W
         R8tf4Aa2TfnFC9/dsHzwK1CMARZEwxsCW6PEujRO83vtIcPxa+qs2hYRn2hoAU9rn4Ip
         AqdMQLv3rxabmqwOpOwrgY1jCUM2BX1VUonUWtAPhm2M4ZSI1JOokjO+me1gQWQ4LNT4
         jI35WAnQDp2yR5E06bo8rF4P2CjCUuyPfnZnjt3JhSZJmHUoOXDDsPt16spS/ckdXk5u
         t9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fNaB+Z8UtZPx/Yeh2IrJ1nsVH7Wdo5mwB6XRElv2VJw=;
        b=VNurQqJ6v4cybvk8e3yuZ86Jz80fYpwuosJTXqMAP8knlDzFidH4HolBZ2wlm7iQtr
         bnri666IAdvCB1Teln6GCcu/AJI/i+aj3FzQo34zq8aVzCy4gh0E0+TD7aBNBUZZfCRX
         muW94xMz3cJdkbgDgbuZAnEnkujQkTFY2IGRHMUKzcF2/wxbxI781gitL8l3kyi+OF6i
         CUCHUU7fuJ68ol1875Ls1y3UuXCPfd+ki5sZDGtMJreJxLp3DVFwx8zBsK+cAOSui7th
         gthp74koO1zuwww5mKTidJu15btotEIuoZx7Mq6wLkA0ltwADjsFRZjaUp3c4RzpSQGw
         J9IA==
X-Gm-Message-State: AOAM53210DFDUI4pH+efXnrhkuwOYu7On8irhFLJM6ybOLy991U+rLSn
        YnvOq/Tf+QpMCMh1sqzvWuE=
X-Google-Smtp-Source: ABdhPJwAp2dN3ihJkGvPC6ttR6u/TSkI1M0rzfaMpmLNxk/u0qPq/mreWAINwD2+VqErehUeTjhgmQ==
X-Received: by 2002:a17:90a:aa8a:: with SMTP id l10mr5120025pjq.86.1613175820933;
        Fri, 12 Feb 2021 16:23:40 -0800 (PST)
Received: from sol (106-69-179-46.dyn.iinet.net.au. [106.69.179.46])
        by smtp.gmail.com with ESMTPSA id z31sm8712619pjj.47.2021.02.12.16.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 16:23:40 -0800 (PST)
Date:   Sat, 13 Feb 2021 08:23:36 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Pedro Botella <pbotella@gmail.com>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod] Bug in python binding when requesting output?
Message-ID: <20210213002336.GA7405@sol>
References: <CAJAEvhib-M-UQeoCDs+aex-hdE-vJSQk=C5B7z4A9WmR+JcxQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJAEvhib-M-UQeoCDs+aex-hdE-vJSQk=C5B7z4A9WmR+JcxQQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 11, 2021 at 09:54:22PM +0100, Pedro Botella wrote:
> Hi,
> 
> I'm experiencing what I think is a bug in the python bindings for libgpiod.
> I believe a line.request with type gpiod.LINE_REQ_DIR_OUT always
> results in that line being set to '0'.

That is correct - when requesting a line as output at the kernel uAPI
the initial value must always be provided.  If you do not provide
default_vals via the Python API then the output should be defaulted to
'0' by the Python binding.

> To reproduce:
> 1. request a line with type gpiod.LINE_REQ_DIR_OUT
> 2. set the line to '1'
> 3. release the line
> 4. request the same line with type gpiod.LINE_REQ_DIR_OUT
> 5. get the value, it should now be '0'
> 

To clarify, the expected behaviour is that the output is defaulted
to '0' if default values are not provided.
So the problem you are seeing is that the output is not consistently '0'?

If you are expecting to see a '1' then you are expecting the lack of
default_vals in the kwds to leave the output value as is, but that is
not the case - it should default to '0'.

> I think the issue is in "gpiod_LineBulk_request" in
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/bindings/python/gpiodmodule.c
> There a call to "gpiod_line_request_bulk" with default_vals being
> passed as a pointer. Later on in the code, this parameter is checked
> for NULL, if it is not NULL then the values in the array are used as
> default_vals.
> I believe that a NULL pointer should be passed instead if no
> default_vals have been requested when doing a Line.request from
> Python.
> 

Agreed - passing default_vals uninitialized to gpiod_line_request_bulk()
is a bug.
It should be zeroed, or a NULL pointer should be passed if the
default_vals were not provided in the kwds. Otherwise the output
value will be set based on the uninitializezd contents of default_vals.

Would you like to provide a patch?

In the meantime the obvious workaround is to always provide default_vals
in the kwds.

Cheers,
Kent.

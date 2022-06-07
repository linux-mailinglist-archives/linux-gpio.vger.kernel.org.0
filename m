Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA38053F392
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jun 2022 03:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233175AbiFGBwa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jun 2022 21:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbiFGBw3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jun 2022 21:52:29 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D92913E3B
        for <linux-gpio@vger.kernel.org>; Mon,  6 Jun 2022 18:52:27 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id d129so14439209pgc.9
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jun 2022 18:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OvTWtejSTY6u8yv/R5Va1oEpUbKZkWjIfU845GeauGE=;
        b=H0a4yMAWph1gxVbTJbyrhWzNGWOKy5rm9mTrBVftnU8LyIsHjRZS/DLQWOcUbCm9/L
         CHdtsWHSKFifz4lY7otvKPMotADjGaqu8zlgTZxA3PudlwYEacv/zoqP2LSFK1YfL9aq
         Dp9QwJAc/lCx6LWaihEBERuMmmiiBz4I/GJCKydKyJO4oqRRQR6yfdZVjqVGY9L54Z3n
         6GZJJ4KPNaj/WT5CYCKDR9+asrRHsUkKUVHkydr9HuG6teV+V6fVBICSJNgaC3ufbq3O
         IsbfkvC6WHpZNV/YKGplCG1vTjWLxusyqxXILEVuQ/twIAHfU/6Fn9hsQSt7NsXQVodi
         19aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OvTWtejSTY6u8yv/R5Va1oEpUbKZkWjIfU845GeauGE=;
        b=PfkUTICHA6DVV09mFd9oFl6Mgo+b2FlLQ5X1ibJqlWi7KVi59KNgR/iEYEuGOUJdRj
         VILg44yumPyULZhejDaspU0wYCWIIJERMdmAoSzxiLHmLzKCfd5m0rqTDdtBg5hJ1HDf
         DKOGuqhdtdzKnwhYl425SPcpyGBI0t7ts1i/+Cn3o5iIitiZL5b2mONiYwExLvFGs2ID
         F0iM9WFSN5+MC+J0u7wXrc4Iq7UApbpWo5BM1P+oJZpwBGFdkQmhOnRyP7RCpNkC3rfi
         siK3Ek1d+CSFWg9VjPuGIdkRFnY22p6zg7NncSYVbus2CIEOds+TkDp5KTMvpXuXLbCz
         2MNg==
X-Gm-Message-State: AOAM532PP1qmEdRF2TgopJZElJE7h7bzdTHv4ByTRJwZNQqzs+aTPtpP
        y34NrAhiHTHJZ62LcEUTCJs=
X-Google-Smtp-Source: ABdhPJz8A1cpeeF+oTfmlHdrLQQmlxTx9sKpkVdw3gkaB2KrOwYMs0J5bWlvCUo5d+YgBeC7HMJxdw==
X-Received: by 2002:a62:db81:0:b0:51b:ed38:c409 with SMTP id f123-20020a62db81000000b0051bed38c409mr17638562pfg.37.1654566746699;
        Mon, 06 Jun 2022 18:52:26 -0700 (PDT)
Received: from sol ([203.221.89.174])
        by smtp.gmail.com with ESMTPSA id o7-20020a170902778700b0015e8d4eb273sm11124463pll.189.2022.06.06.18.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 18:52:25 -0700 (PDT)
Date:   Tue, 7 Jun 2022 09:52:20 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH 3/5] bindings: python: add examples for v2
 API
Message-ID: <20220607015220.GA9430@sol>
References: <20220525140704.94983-1-brgl@bgdev.pl>
 <20220525140704.94983-4-brgl@bgdev.pl>
 <20220603124600.GA35695@sol>
 <20220604024131.GB13574@sol>
 <Yp3TmNg2uBlC0XzI@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yp3TmNg2uBlC0XzI@smile.fi.intel.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 06, 2022 at 01:14:48PM +0300, Andy Shevchenko wrote:
> On Sat, Jun 04, 2022 at 10:41:31AM +0800, Kent Gibson wrote:
> > On Fri, Jun 03, 2022 at 08:46:00PM +0800, Kent Gibson wrote:
> > > On Wed, May 25, 2022 at 04:07:02PM +0200, Bartosz Golaszewski wrote:
> 
> ...
> 
> > > The focus of my comments above is to simplify the API for the most common
> > > case, and to make it a little more Pythonic rather than mirroring the C
> > > API, in both cases by hiding implementation details that the casual user
> > > doesn't need to know about.
> > > 
> > 
> > Further to this, and recalling our discussions on tool changes, it would
> > be great if the Python API supported identification of line by name, not
> > just (chip,offset).
> > 
> > e.g.
> >     with gpiod.request_lines(
> >         lines=("GPIO17", "GPIO18"),
> >         edge_detection=Edge.BOTH,
> >     ) as request:
> >         for event in request.edge_events():
> >             print(event)
> > 
> > with the returned event extended to contain the line name if the line
> > was identified by name in request_lines().
> > 
> > The lines kwarg replaces offsets, and could contain names (strings) or
> > offsets (integers), or a combination.  If any offsets are present then
> > the chip path kwarg must also be provided.  If the chip isn't provided,
> > request_lines() would find the corresponding chip based on the line name.
> 
> From Python programmer perspective it's a good idea, but from GPIO (ABI)
> perspective, it may be confusing. Line name is not unique (globally) and
> basically not a part of ABI.
> 

"basically not a part of the ABI"???
Damn - we should've removed it from the line info for uAPI v2 ;-).

A common request from users is to be able to request lines by name.
Of the libgpiod bindings, Python is the best suited to allow that
possibility directly as part of its core API.
It also happens to be the one most likely to be used by said users.

While identifying line by name can't be guaranteed to work universally,
that doesn't mean that we should automatically exclude the possibility.
It is possible with the current ABI - it is awkward, but possible.
In libgpiod v1, gpiod_ctxless_find_line(), gpiod_chip_find_line() et al.,
and in v2 gpiod_chip_get_line_offset_from_name(), do just that -
I'm merely suggesting that similar functionality be incorporated into
request_lines().

Line names should be unique in well configured systems, even if the
kernel itself does not guarantee it.
The binding would perform an exhaustive search to ensure the requested
line name is unique, and throw if not (unlike the libgpiod v1 functions
that return the first match - yikes).
(We could always extend the GPIO uAPI to make the mapping process less
painful, e.g. an ioctl to perform the name to offset mapping, including
uniqueness check, for a chip.)
For applications targetting systems that don't guarantee uniqueness, the
(chip,offset) approach remains available.
And if the line names are thought to be unique within a chip, the middle
ground of (chip,name) is also available.

Wrt confusion, the alternative would be to provide a separate name based
API wrapper, or insist that the user jump through the name mapping hoops
themselves prior to calling the offset based API.
Are either of those less confusing?

But if the purpose of the Python binding is purely to minimally wrap the
C ABI, warts and all, then my suggestion should most certainly be ignored.

Cheers,
Kent.

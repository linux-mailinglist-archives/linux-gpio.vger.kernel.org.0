Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE1E27D20F
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 17:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728973AbgI2PEi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 11:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgI2PEi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 11:04:38 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172A0C061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 08:04:37 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id jw11so2816834pjb.0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 08:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/vIUrHdizZPofoCv4SNJRNjNZCzYwZgAg7O8e2XM+Uk=;
        b=lM4fHZ+AM15t7IPHkLBimYO/uQ0ysgIh3xoEg62mo0Fh9gNrXjwT79Jg5zUxHJ8kKQ
         i5laP6VvWccQGiAeCU7m2xzSblR+p/EH1g7s6Y5M6fATTUM62UCT38KwngGqdkZZVwq4
         PqEjBYM/Ss/gD5qI7e2cBc9mv5GMMUWTpqVFft5wPlQDUg/7w4o3IzYI+876SwFUk5jr
         Khu7kJix4i2g18Dh+4Dk42IFLplLj/VuhpDFldBn7QARsprT+0RpOOi6gsCDPBD1GvAz
         Cv3hc9xaxBvs6N4damSDu2sLUrg+SKo7FEscMfnDYtgWKmy2l/IP6eEO3hKZ/K1Bt3lG
         AOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/vIUrHdizZPofoCv4SNJRNjNZCzYwZgAg7O8e2XM+Uk=;
        b=kEQEhYM7vk2ZBtPnx7g1YEh/Gfj+wZDv1tvLCZEl+FIjUAA6I3AOLa2hGiYrYWwM2Y
         EioVd7MHBtlRdXI0wpbl80NUicj4QC0eTQrJKZIFJUAp/YH61JFwSkrAl0YF8I78qBNe
         MMDHpBdaHBpk6fuaxDRuCaRgHqS1WhFdrAJ2YrJCdNZc36TV99LaahB6aanxcV0zhhru
         N0rMAaBaSHRDe2OojwmPW6EGwuV++xz7HFsFCNzy+DirUPHpErgomIqGUV1BO+QiXudr
         /ZjR9kVc58LgQsTd0dPYLlkfuxr349rnIIYjdfpLBCZOABwwhS+OeLqisdCNBCr0V+hG
         w8qA==
X-Gm-Message-State: AOAM531RuguECwNzHZbOMNZ/pdMRbPdhvhPxP8iXxWHufUEQGC0bVOg2
        YHKpPVmEeH86rdKANm+HuiM=
X-Google-Smtp-Source: ABdhPJwRJPJ9Hr0qpSt0X+15qQPp+kApAW+lgtPNarDft9ebMiV626SysOawFuVO7H285QXM2qG0hg==
X-Received: by 2002:a17:90a:cc17:: with SMTP id b23mr4337813pju.32.1601391876219;
        Tue, 29 Sep 2020 08:04:36 -0700 (PDT)
Received: from sol (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id t198sm5087674pgb.82.2020.09.29.08.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 08:04:35 -0700 (PDT)
Date:   Tue, 29 Sep 2020 23:04:30 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: strace decoding for GPIO uAPI
Message-ID: <20200929150430.GA551060@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-5-warthog618@gmail.com>
 <CAK8P3a1o4fp=-gU=SpwR540Xw+oySJ_ESkG+YXZJsDV-N6UF5w@mail.gmail.com>
 <CAMpxmJVsBYY0w5BCyYaRDGR-cQD7o4VkJRatc0Ww5wXRA+3bhA@mail.gmail.com>
 <20200928134217.GA1247496@sol>
 <CAMRc=MeUOOq9Zw+fvab1+rwKf066j9GqEMJ4mCHqVjMfwdo-Gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeUOOq9Zw+fvab1+rwKf066j9GqEMJ4mCHqVjMfwdo-Gw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 03:20:22PM +0200, Bartosz Golaszewski wrote:
> On Mon, Sep 28, 2020 at 3:42 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Sep 22, 2020 at 11:50:51AM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Sep 22, 2020 at 9:41 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > >
> > > > On Tue, Sep 22, 2020 at 4:34 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > +/**
> > > >
> > > > Having different-sized members in the union makes it hard for
> > > > something like strace to print the contents. How about just making
> > > > them all __aligned_u64 even when 32 bits are sufficient?
> > > >
> > >
> > > Ah yes, adding support for GPIO ioctl()'s to strace has been on my
> > > TODO list for 3 years now. :(
> > >
> >
> > I'm looking at doing this as it would be useful to have.
> >
> > Just starting with the v1 uAPI, as v2 isn't merged yet.
> >
> > I think I've got it basically done, but I thought I'd run it past you
> > before sending a patch to the strace list.
> >
> > Successful calls currently look like this:
> >
> > ioctl(3, GPIO_GET_CHIPINFO_IOCTL, {name="gpiochip1", label="gpio-mockup-B", lines=8}) = 0
> >
> > ioctl(3, GPIO_GET_LINEHANDLE_IOCTL, {lines=8, lineoffsets=[3, 2, 1, 0, 4, 5, 6, 7], flags=GPIOHANDLE_REQUEST_INPUT, default_values=[0, 0, 0, 0, 0, 0, 0, 0], consumer_label="", fd=7}) = 0
> >
> > ioctl(0, GPIO_GET_LINEEVENT_IOCTL, {lineoffset=2, handleflags=GPIOHANDLE_REQUEST_INPUT, eventflags=GPIOEVENT_REQUEST_BOTH_EDGES, consumer_label="high to low", fd=3}) = 0
> >
> > ioctl(3, GPIO_GET_LINEINFO_IOCTL, {line_offset=1, flags=GPIOLINE_FLAG_KERNEL|GPIOLINE_FLAG_IS_OUT, name="gpio-mockup-A-1", consumer="output atv-lo to as-is atv-hi"}) = 0
> >
> > ioctl(7, GPIOHANDLE_GET_LINE_VALUES_IOCTL, {values=[1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...]}) = 0
> >
> > ioctl(7, GPIOHANDLE_SET_LINE_VALUES_IOCTL, {values=[1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...]}) = 0
> >
> > ioctl(7, GPIOHANDLE_SET_CONFIG_IOCTL, {flags=GPIOHANDLE_REQUEST_ACTIVE_LOW, default_values=[0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...]}) = 0
> >
> > ioctl(3, GPIO_GET_LINEINFO_WATCH_IOCTL, {line_offset=3, flags=0, name="gpio-mockup-A-3", consumer=""}) = 0
> >
> > ioctl(3, GPIO_GET_LINEINFO_UNWATCH_IOCTL, {offset=3}) = 0
> >
> > For unsuccessful calls it only prints the input fields, and drops the
> > output fields. e.g.
> >
> > ioctl(3, GPIO_GET_LINEINFO_WATCH_IOCTL, {line_offset=3}) = -1 EPERM (Operation not permitted)
> >
> > Does that work for you?
> >
> 
> Kent,
> 
> This is perfect! Thanks for doing this! For the error cases: I'm not
> sure how strace handles this for other ioctls() - maybe we could print
> something like 'flags=N/A'? Unless what you did is the standard way,
> then leave it.
> 

I think that is pretty standard, but I will double check.

Just debugging the uAPI v2 decoding now, though I wont submit that
until the uAPI is in an -rc.  It may be useful for debugging in the
meantime, so I'll push a copy to my github fork[1] shortly - the v1
decoding is there already.

I've noticed a few things I want to tidy up in the v1 decoding
before I submit that though.  Should have it ready to submit in the
next few days.

Cheers,
Kent.

[1] https://github.com/warthog618/strace/tree/gpio

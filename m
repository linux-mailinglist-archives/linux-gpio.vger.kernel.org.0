Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD44A27AF41
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 15:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgI1NmX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 09:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgI1NmX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 09:42:23 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C801C061755
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 06:42:23 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s31so908532pga.7
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AHypWayAA/i/NFo+wjy6+P0N8wpJqx5C3CDmi7auf2A=;
        b=q/Hqm65pbo8iR9mlig/RygXg1Y6yjJQYmDha/kXwLU+1eQU+D3bmr2IAYxAFEuvBNM
         huiPuad+yHbVcpqnUhSwvY8X+DEXxnergBNwa/mykQ8/nFJmJiXUI9SG00q7LTwGuLdk
         p+4bkyd/+Wa85U7bPflFgie+NRp1gaafOl5zlSHJMhoIP9q7rokfGa5bZ319n78VoaLL
         +Llln7L8mVN/M7pUjG3fByX6a3+DrRjr7fFGBQNAORRs5bW9UetcNdx7YWUd4X+G80m0
         8Y5TnPAx6bVLBlp2ShOejCfh5hhjz0vATTv1Ag0WUGCBv++UVd+nlsSZ97L9veVPVXA5
         joig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AHypWayAA/i/NFo+wjy6+P0N8wpJqx5C3CDmi7auf2A=;
        b=WvwB3/4sTSCKit6yRUyIjKn3FV4WPpq29+GNAtqikAaL8nmhMvMQQzHTOAPzgdw+Qu
         zSo6FVJigkAbYd9l6Svf2GhUAMvBfu2bJYQp52pCCd6dskFM23A0J2bYHIxbgzdlqPRW
         InibG12lnhWXh+hLIXNYZRRrjfgvgGftmUEc0U4wTHxP+IeCOQuLdBhspoQ67WM9utvc
         2A7MIJEshlQ8AFGY3HEg5FYcvJPb9nT3lnKzW7cCPDNqUs7yabtz6ol/eSAX2LAnknho
         TIFin1XzE2Jo6ZOutE3XVqAkx43OJfWDUzRNdZAxVIbu754roEZNihlx0GaHom+Sqerg
         jA6Q==
X-Gm-Message-State: AOAM532r4NJqzgNkxC0cLjTsrD81x+lNE2L5wga8t4eRVMjHaW0fHPr0
        rPfMyvnP/pDv+arMDUn1oWeBu87ZsmictQ==
X-Google-Smtp-Source: ABdhPJwtUzPAEP5jYBDpt1clquzdG8hllV7PtrPaZBOYMu5s0/xyY3/3No4oIKRDHLPtNVF39ro6rA==
X-Received: by 2002:aa7:971d:0:b029:13e:d13d:a08a with SMTP id a29-20020aa7971d0000b029013ed13da08amr1495982pfg.33.1601300542449;
        Mon, 28 Sep 2020 06:42:22 -0700 (PDT)
Received: from sol (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id 17sm1733904pfi.55.2020.09.28.06.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:42:21 -0700 (PDT)
Date:   Mon, 28 Sep 2020 21:42:17 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: strace decoding for GPIO uAPI
Message-ID: <20200928134217.GA1247496@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-5-warthog618@gmail.com>
 <CAK8P3a1o4fp=-gU=SpwR540Xw+oySJ_ESkG+YXZJsDV-N6UF5w@mail.gmail.com>
 <CAMpxmJVsBYY0w5BCyYaRDGR-cQD7o4VkJRatc0Ww5wXRA+3bhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJVsBYY0w5BCyYaRDGR-cQD7o4VkJRatc0Ww5wXRA+3bhA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 22, 2020 at 11:50:51AM +0200, Bartosz Golaszewski wrote:
> On Tue, Sep 22, 2020 at 9:41 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Sep 22, 2020 at 4:34 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > +/**
> >
> > Having different-sized members in the union makes it hard for
> > something like strace to print the contents. How about just making
> > them all __aligned_u64 even when 32 bits are sufficient?
> >
> 
> Ah yes, adding support for GPIO ioctl()'s to strace has been on my
> TODO list for 3 years now. :(
> 

I'm looking at doing this as it would be useful to have.

Just starting with the v1 uAPI, as v2 isn't merged yet.

I think I've got it basically done, but I thought I'd run it past you
before sending a patch to the strace list.

Successful calls currently look like this:

ioctl(3, GPIO_GET_CHIPINFO_IOCTL, {name="gpiochip1", label="gpio-mockup-B", lines=8}) = 0

ioctl(3, GPIO_GET_LINEHANDLE_IOCTL, {lines=8, lineoffsets=[3, 2, 1, 0, 4, 5, 6, 7], flags=GPIOHANDLE_REQUEST_INPUT, default_values=[0, 0, 0, 0, 0, 0, 0, 0], consumer_label="", fd=7}) = 0

ioctl(0, GPIO_GET_LINEEVENT_IOCTL, {lineoffset=2, handleflags=GPIOHANDLE_REQUEST_INPUT, eventflags=GPIOEVENT_REQUEST_BOTH_EDGES, consumer_label="high to low", fd=3}) = 0

ioctl(3, GPIO_GET_LINEINFO_IOCTL, {line_offset=1, flags=GPIOLINE_FLAG_KERNEL|GPIOLINE_FLAG_IS_OUT, name="gpio-mockup-A-1", consumer="output atv-lo to as-is atv-hi"}) = 0

ioctl(7, GPIOHANDLE_GET_LINE_VALUES_IOCTL, {values=[1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...]}) = 0

ioctl(7, GPIOHANDLE_SET_LINE_VALUES_IOCTL, {values=[1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...]}) = 0

ioctl(7, GPIOHANDLE_SET_CONFIG_IOCTL, {flags=GPIOHANDLE_REQUEST_ACTIVE_LOW, default_values=[0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...]}) = 0

ioctl(3, GPIO_GET_LINEINFO_WATCH_IOCTL, {line_offset=3, flags=0, name="gpio-mockup-A-3", consumer=""}) = 0

ioctl(3, GPIO_GET_LINEINFO_UNWATCH_IOCTL, {offset=3}) = 0

For unsuccessful calls it only prints the input fields, and drops the
output fields. e.g. 

ioctl(3, GPIO_GET_LINEINFO_WATCH_IOCTL, {line_offset=3}) = -1 EPERM (Operation not permitted)

Does that work for you?

Cheers,
Kent.

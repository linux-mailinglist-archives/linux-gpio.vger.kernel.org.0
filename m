Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C099027CEF0
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 15:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbgI2NUe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 09:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728462AbgI2NUd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 09:20:33 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65E3C061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 06:20:33 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id b17so1546636ilr.12
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 06:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3MGBD6EjefdFqLmBsBZLdGW4A8EXeoPLo9Upcobd0kg=;
        b=WCuivicQc57N1nQr5GnsUj0z4zFkOxbgwPZKaS3jkAlftqmHrwjaKDRtMifO7mVtAI
         +QsRkWKwRbp/4xRmmVxXFQ4dd5Sr2aUJcVB+AoT4dgK+XYBoPdl7fM/rLVyIkcAeDNIi
         LVtZ3YEwHQA2SBGpeSlZ4KokIQo8vgfwo0BaBAWVMO0epsKCcK+hmiXNyT2L9fZ9XVbr
         yUzX31Vo0TAwIUzD32IOoOQgzacp1g5XZlvSiicdQ4h2f1dnGbUIJm43nE5F6PaYLdyM
         846uOgmAH/ydY3UWVbzKqFg6qalgqSMPBqqoDg1RNXDSQTT19j9VLtxynGo5EbbGjIjS
         AYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3MGBD6EjefdFqLmBsBZLdGW4A8EXeoPLo9Upcobd0kg=;
        b=f4uPTz0Jx6HEmlfv0ijFO/RnzZytkuM58khoq4R29kCHjZeLA/tI7dIrJUXFEhOjhD
         q9y7FNYHnSExgDdfmQE3mqFkHihmjFabD80v1f8IwBV+0BSlmtvb56P5zIfaillACqrd
         9prHJwSyGTcFtnafWRCjMDgycr3iJoBxCemMGMN/GhP/Le8WcSj6ABlMoVAcrnAJYOp/
         0aQPlfuIfAabVKS7wC3pGAtQOGzEKqKXOWIJikGNIHxD97aTpJ2kNgpYxIkdfZy/OQze
         UQG+HKPFwnS2s7M49lViSLn38qpcD2tRFCwWJPlFOs+Q5uWL/FJ/TQ4QTD3HA2ISc8du
         6iCA==
X-Gm-Message-State: AOAM530dIk3Obi33L8q08NoiMBppX1lFbjBWsNT8NILbSCBU7wxTSnQW
        71cK0CXeDLOfgtZ4IjMdoz32O0B1lyZ5NC/TrRSyvuvLMXI=
X-Google-Smtp-Source: ABdhPJzFCbMMcFDz999esnyTEzwfRjYXqTzkg4UHyykV0eC7L/b838sT0UmiP+lMUAXIf1+UrBX662NmTYwfmKzyyfI=
X-Received: by 2002:a92:1952:: with SMTP id e18mr2922335ilm.189.1601385632944;
 Tue, 29 Sep 2020 06:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-5-warthog618@gmail.com>
 <CAK8P3a1o4fp=-gU=SpwR540Xw+oySJ_ESkG+YXZJsDV-N6UF5w@mail.gmail.com>
 <CAMpxmJVsBYY0w5BCyYaRDGR-cQD7o4VkJRatc0Ww5wXRA+3bhA@mail.gmail.com> <20200928134217.GA1247496@sol>
In-Reply-To: <20200928134217.GA1247496@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 29 Sep 2020 15:20:22 +0200
Message-ID: <CAMRc=MeUOOq9Zw+fvab1+rwKf066j9GqEMJ4mCHqVjMfwdo-Gw@mail.gmail.com>
Subject: Re: strace decoding for GPIO uAPI
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 3:42 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Sep 22, 2020 at 11:50:51AM +0200, Bartosz Golaszewski wrote:
> > On Tue, Sep 22, 2020 at 9:41 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Tue, Sep 22, 2020 at 4:34 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > +/**
> > >
> > > Having different-sized members in the union makes it hard for
> > > something like strace to print the contents. How about just making
> > > them all __aligned_u64 even when 32 bits are sufficient?
> > >
> >
> > Ah yes, adding support for GPIO ioctl()'s to strace has been on my
> > TODO list for 3 years now. :(
> >
>
> I'm looking at doing this as it would be useful to have.
>
> Just starting with the v1 uAPI, as v2 isn't merged yet.
>
> I think I've got it basically done, but I thought I'd run it past you
> before sending a patch to the strace list.
>
> Successful calls currently look like this:
>
> ioctl(3, GPIO_GET_CHIPINFO_IOCTL, {name="gpiochip1", label="gpio-mockup-B", lines=8}) = 0
>
> ioctl(3, GPIO_GET_LINEHANDLE_IOCTL, {lines=8, lineoffsets=[3, 2, 1, 0, 4, 5, 6, 7], flags=GPIOHANDLE_REQUEST_INPUT, default_values=[0, 0, 0, 0, 0, 0, 0, 0], consumer_label="", fd=7}) = 0
>
> ioctl(0, GPIO_GET_LINEEVENT_IOCTL, {lineoffset=2, handleflags=GPIOHANDLE_REQUEST_INPUT, eventflags=GPIOEVENT_REQUEST_BOTH_EDGES, consumer_label="high to low", fd=3}) = 0
>
> ioctl(3, GPIO_GET_LINEINFO_IOCTL, {line_offset=1, flags=GPIOLINE_FLAG_KERNEL|GPIOLINE_FLAG_IS_OUT, name="gpio-mockup-A-1", consumer="output atv-lo to as-is atv-hi"}) = 0
>
> ioctl(7, GPIOHANDLE_GET_LINE_VALUES_IOCTL, {values=[1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...]}) = 0
>
> ioctl(7, GPIOHANDLE_SET_LINE_VALUES_IOCTL, {values=[1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...]}) = 0
>
> ioctl(7, GPIOHANDLE_SET_CONFIG_IOCTL, {flags=GPIOHANDLE_REQUEST_ACTIVE_LOW, default_values=[0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...]}) = 0
>
> ioctl(3, GPIO_GET_LINEINFO_WATCH_IOCTL, {line_offset=3, flags=0, name="gpio-mockup-A-3", consumer=""}) = 0
>
> ioctl(3, GPIO_GET_LINEINFO_UNWATCH_IOCTL, {offset=3}) = 0
>
> For unsuccessful calls it only prints the input fields, and drops the
> output fields. e.g.
>
> ioctl(3, GPIO_GET_LINEINFO_WATCH_IOCTL, {line_offset=3}) = -1 EPERM (Operation not permitted)
>
> Does that work for you?
>

Kent,

This is perfect! Thanks for doing this! For the error cases: I'm not
sure how strace handles this for other ioctls() - maybe we could print
something like 'flags=N/A'? Unless what you did is the standard way,
then leave it.

Bartosz

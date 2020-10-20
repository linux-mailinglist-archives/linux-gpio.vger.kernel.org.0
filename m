Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAF3293558
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 08:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404711AbgJTG7H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 02:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404710AbgJTG7H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Oct 2020 02:59:07 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9616EC061755
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 23:59:05 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id b8so1549824ioh.11
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 23:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oQ8GDjfspMGXyS8UXIyM7zzvUgdhYtP5hpcsB1MoYmo=;
        b=GYhRWYNfD5mwum1GStkpUqfScCNZEmOgfuP41FnAtz48zue2vJdqFq7LXA78DsLqgT
         Ap9bw5XlDU6ZtTePUVuYMhGOKMcUh+GJ6URacw8kNQ8godRchuYgL69lPBLegwvWqO2C
         UWtWk0Suzxal8iMn0lgB1eu/jQqVgQM5zgWMwcBu4uixyLeagM/LcRiJ2kiXOQugLuGE
         E3B/Pv7n39Fb78OnjI49NtR8+t/uWP54fpVL+O0jj2BkhDUmKZoKmREO3eZ9Lbkmfcob
         F+aWrvBjM/7TemGMX4cxQULvcpvlUK+W8CTElu6c656DXj/EtH9eC2Tp2VmA0e/8eFgl
         n2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oQ8GDjfspMGXyS8UXIyM7zzvUgdhYtP5hpcsB1MoYmo=;
        b=QmKbLOqOsXHoM3/mcK7Ll8DpaFVZWQXk8yBWBKAcfUQnl4B7VNnGm3lXO2V5Rbpqjn
         Kd2wbJK0TO9uMXKhI2SDr+Z3KCzxHcYmoLNMJVbFTU/cGRAzfqbAvXhbFPI7H57eFWW2
         ZidijnNvsO625yE2RzuBEYkQMfpcZnF0+A4XIxUOWW3oyX5iE2tlyoTY4+B0U/xyNBj3
         8cwoUHzNmlVzliNtKUaO3kZfE4tBtiiHFQ7sitj5wHgBscRqUwxffVZ+I8ilwWTqpy0w
         FQIfgkKLWeHXq/vIbNpoIsBKrjKavM39npNLAJZiqnL47IAPUmVvN6pNY3/AeKpeFnTF
         Q8rA==
X-Gm-Message-State: AOAM53135kMhsLM7zhZbRPTpsl/tHnypr6gt3QL36GJ7qXrz6fnGBDPp
        D9Ls68PB5GGW7Yhige5n9y3CWOlty+4ocb8mz81R+iCQD06jqg==
X-Google-Smtp-Source: ABdhPJyGl0g9XyKWW9WCiBPTVP6HdvWB5Sr2Cr26ZLxdBLNE/ALAyXE9ohgQXnH/h6A7/x9Bf4g9avjuNqkdWna0Qck=
X-Received: by 2002:a6b:8bd7:: with SMTP id n206mr1110275iod.13.1603177144942;
 Mon, 19 Oct 2020 23:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201016090949.24456-1-brgl@bgdev.pl> <20201016102937.GA22245@laureti-dev>
 <CAMRc=Md1RxGiv+v27dZOSsGX4v1OEc=E-EJvd-4_8tMjgFicoA@mail.gmail.com>
 <CAMRc=MfjBai0PECzvXjLN9w_sP-ZE4QBxGL0-puow2zDKJd+Uw@mail.gmail.com>
 <20201019123801.GA5116@laureti-dev> <CAMpxmJU0y5Zze3we-NjnLi1fCG69v38fMwvTgCe0JXGK+RxLNQ@mail.gmail.com>
 <20201020055714.GA10256@laureti-dev>
In-Reply-To: <20201020055714.GA10256@laureti-dev>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 20 Oct 2020 08:58:54 +0200
Message-ID: <CAMRc=Meo5vcCo9hoA8-nbr_f7WHLL=AP87uwAZgMRiTmxVqxBw@mail.gmail.com>
Subject: Re: [libgpiod][RFC PATCH] bindings: cxx: demote the line's parent
 chip reference to a weak_ptr
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 20, 2020 at 7:57 AM Helmut Grohne <helmut.grohne@intenta.de> wrote:
>
> On Mon, Oct 19, 2020 at 03:06:18PM +0200, Bartosz Golaszewski wrote:
> > But this still forces us to do
> >
> >     return chip(::std::shared_ptr<::gpiod_chip>(this->_m_owner));
> >
> > instead of a much more elegant
> >
> >     return chip(this->_m_owner);
> >
> > in line.cpp and there's an even less elegant thing in iter.cpp. Or am
> > I missing something?
>
> I confirm the behaviour you see. My intuition that the conversion would
> happen implicitly was wrong.
>
> Still the sticking point is this: Your constructor should allow for most
> flexibility to the caller and in this case that means it should consume
> a shared_ptr by value.
>
> In order to make the case with a weak_ptr bearable, I suggest adding a
> delegating constructor:
>
>     chip(const ::std::weak_ptr<::gpiod_chip>& chip_ptr) :
>         chip(::std::shared_ptr<::gpiod_chip>(chip_ptr)) {}
>
> That way your desired way of calling should continue to work while not
> forcing callers to convert a real shared_ptr to weak_ptr and back.
>
> Sorry for the confusion about this.

This is a private constructor though and it's not meant to be exposed
to callers of library interfaces. Only internal users will call it and
they'll pass a weak_ptr to it alright. I really think it's fine the
way it is now.

Bartosz

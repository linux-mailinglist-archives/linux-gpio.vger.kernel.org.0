Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B5A3DD1BD
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 10:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbhHBIND (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 04:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbhHBINC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 04:13:02 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B8EC061796
        for <linux-gpio@vger.kernel.org>; Mon,  2 Aug 2021 01:12:52 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id hs10so20868852ejc.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 01:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ALQjZJEiyWOt6jqRU+2ULQP/fQS0nGSJjaQXN/Wtd4I=;
        b=v3Ix30UvbSkcu6gMs9+ZCKT7td8W1WBhUu+ehaLoQlYinzcYUTTSZjCly5+QTouhIs
         goj1Enb9AVE9x/mysMKQa6FiHSptNziOg5uREh2XSYsfiJiFR/8wJKSWHdJ+xYhq2ESw
         XR3UlHzh5eo/L28XfhlJLCtU+l1ZXJaUUA1EwTEVTa6hnCSjKXzZNwizAGUf2mQFFg2r
         VEKdK4F/Vpp3A5jMTml+ibmzOI5WwM2u1cF90yA9mcDYhH8GyTcdhnthpqBHNwe6uz8G
         n5M3lPHgQDKYyhDnm+xndm+G/KUleVUD8P9cgOf+u+flcHEh7WdHqJxkVgWEvcF4va2z
         ip8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ALQjZJEiyWOt6jqRU+2ULQP/fQS0nGSJjaQXN/Wtd4I=;
        b=NkGlQvtdBVS6CHknBvecipUdapfyw7cp4nxGEzSFisoXiwBjO+xKUDaLKJss2TTcp+
         nsgC0dEbeRU3P0xezNUhXKeak0vn3eJmyC5CaxKC/aJr3e4wP0BNtQYq0oNIma/wnflM
         kFF35QaZlyMk7PwLoC0EE/tnT38WRpsXAgkbI6mNf5crKoPrmputMaBN5HMIsnlytYaW
         rgwwQRLTVQ2vaOWL9o/T4YiP2b9zPwxRpJpy/16bcz+CTRnez+TryOv71dGVkIpnZA+e
         Ve9kKz1LsQS/h5Ac6kmLv/lE7h8GZSnSgw+Jxvvz+KjySFJ9/qdppnuFeTGbrptUIAkg
         jRMA==
X-Gm-Message-State: AOAM530ojw4joDJ6UkVdYQCNRDPYQoNiy8Re+xkFx/68chKGsWGpiAHJ
        e8WjwQt5iFe5RogJBoeOda4BQonad2LIlIteWjXinA==
X-Google-Smtp-Source: ABdhPJxrtMqg6F0OamRb1pRNxk9sDzh1rs0kvEqibDZfNpUg9BvePVl8tEHUY2aHbV3HR5utXsJiO5eeXt9sMPD9bLY=
X-Received: by 2002:a17:907:e92:: with SMTP id ho18mr14089468ejc.261.1627891971179;
 Mon, 02 Aug 2021 01:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144356.23079-1-brgl@bgdev.pl> <20210730144356.23079-3-brgl@bgdev.pl>
 <20210731022732.GA4434@sol>
In-Reply-To: <20210731022732.GA4434@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Aug 2021 10:12:40 +0200
Message-ID: <CAMRc=MfKxA624Fmt-XpxVyiWwNzu9PeooyP4pQtpZ_kGsX3mwA@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 2/3] line-info: provide gpiod_line_info_get_event_clock()
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 31, 2021 at 4:27 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Jul 30, 2021 at 04:43:55PM +0200, Bartosz Golaszewski wrote:
> > Provide a new getter for the line-info object that becomes the
> > counterpart for the setter used to configure the event clock type with
> > line_config. It allows to check which even clock the line uses for
> > edge detection.
> >
>
> "to check which even" -> "checking which event"
>
> That is my only comment for the whole patch set - eveything else looks
> good.
>
> Cheers,
> Kent.

This will be squashed with the big v2 commit, thanks!

Bart

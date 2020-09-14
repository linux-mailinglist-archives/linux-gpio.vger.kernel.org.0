Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1386268FEF
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 17:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbgINP3u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 11:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbgINPQy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 11:16:54 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD73BC06174A
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 08:16:53 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x123so12898525pfc.7
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 08:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HinnqGo5MWBZSkkvZZmZ02b7vFPPIN3J2a/AHHehDRs=;
        b=ompm89i4w/248lXdVl9QIIZxrid7tlOdrN9So68RqCNqzfHN4B5LocmpX+OtSfNCHC
         gpgeeHMIOSgpd9U7VM38GAUpzhAycL11QvjInhgTRKWZ3kXjn0L4Kva0Gnx7kAhvtZE7
         GoRhtKvLcyeH8nuOuIyp81TzXCskFOtoid+3K6tvg0ruUngEOOXUBScc3N1apFaIe/6x
         40HatIThHvnATFFrQJWhj4yzNKfnZDSx6YW5KjwRBKd4Fsriyh/Va8JSnuYGVieTR+yH
         vv4vGr6wVjn0VW6rKyIG8BTt4uHNdt+aAwegw1U2SqoUARpLDtfVS/eRndGI3VHzTw3u
         YLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HinnqGo5MWBZSkkvZZmZ02b7vFPPIN3J2a/AHHehDRs=;
        b=kj/uAMnuU4FEEBL/stSUNkmvcuO/3V0iESemN0rGRMJCF5xPZTta8Wh4ht1uUm+Dtt
         Ksx0koDsVW46Fi29e2DYJ76Mr0FyRlf8K8g7tFKhUNCLsutVgomtpmfkLQvxf8L6jWiP
         J5iARJnW64oiphNVEGYSpgvzP1T1xjhnpZrAA2jNv4HPm/824toe+np6Q11HS5UKX55w
         hOMScUq6aQw3ZnzR+kiSL0yF9BsgdRTm/gBr8Zt5jCN76e9vCWi6a0XxeZxTzXeQ4NyQ
         uLMBm7A/q6qY4CXE4xaA8XW+RS71pryrv/2xBTedCx4CmkB01TuzLptyCewka7t1VhyQ
         Gnng==
X-Gm-Message-State: AOAM533LG0y8wBfW66bubn+e+LrPn9sgZ5cThutchqYPHIUA7GDCuk2m
        arheFWxwHp3IEe2GI9tC5xsYaNuSsD0tXJQt3cE=
X-Google-Smtp-Source: ABdhPJwq0IW7q1qeUYqKLNUPxgZWiC8D9Iep20dbXLxFpjBqoWpmtZfNsZjwlNEefo2EMKgNNU48FVNzLC9oNoAUWqI=
X-Received: by 2002:a17:902:6bc1:b029:d0:cbe1:e76e with SMTP id
 m1-20020a1709026bc1b02900d0cbe1e76emr15429949plt.21.1600096612603; Mon, 14
 Sep 2020 08:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200912081105.1615496-1-warthog618@gmail.com>
 <20200912081105.1615496-3-warthog618@gmail.com> <CAMpxmJWM4UZ2iDO047-H7sMeCR0BD2exmiMFo3=eF1UmYJZkQA@mail.gmail.com>
In-Reply-To: <CAMpxmJWM4UZ2iDO047-H7sMeCR0BD2exmiMFo3=eF1UmYJZkQA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Sep 2020 18:16:35 +0300
Message-ID: <CAHp75VeFWQCkeXne+7i2FEUNy97yjPiMwsQqkm7mqhtXiGac7A@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 2/2] core: fix reading subset of available events
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 11:16 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Sat, Sep 12, 2020 at 10:11 AM Kent Gibson <warthog618@gmail.com> wrote:

> > Fixes: 44921ecc9a00 (core: provide functions for reading multiple
> > line events at once)
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>


> Will apply shortly and backport it to stable branches too.

Please note that
 - Fixes (or actually any tag) should be one per line
 - no blank lines in the tag block

-- 
With Best Regards,
Andy Shevchenko

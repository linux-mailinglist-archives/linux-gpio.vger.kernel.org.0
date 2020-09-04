Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42AE25D930
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 15:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730247AbgIDNCj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 09:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729897AbgIDNCi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 09:02:38 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE821C061244
        for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2020 06:02:37 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id c8so6017705edv.5
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2020 06:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=py331tU/dS8B+p+QL/GfpvBAThxgQcvBqHpIco6OZf4=;
        b=XPTAekBXdjp1zg6XcrQsSDBhv6Td+yjs6TQWmt2e6ABqt6Ces7wnkkjU3DyWIAxlg5
         lLBbFAE7DfQBzEcwyBIKUKTNN+PVRtgyuZonLh5E9k/N7OW14qhI0wzljO6Dx4Gzi7DL
         zTbx45tIpaCydCDj8jvjwd6bT+julciQyTgPuU+Ov21SE1fnFu5Y8/qgzoDNAATmg1EG
         lkHJpWUHGwmUCdOel8ILmqCgXI17fzK/GPOrGEP4BNBHaaSJEaxD3+gKeZZuDCJqaaJX
         /QPknR2xkDKg/orAul0g2pWtPRlrBy8fFV4yXko3JI5BbAjWMA8gA+GKuP+UZsfikazY
         w4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=py331tU/dS8B+p+QL/GfpvBAThxgQcvBqHpIco6OZf4=;
        b=VWQQYOfKNkS/i1Ljxqij2WTsmHMRvQOa/z62M95tPiKN1LxWOO2NWzWGgFmkNQD+zB
         bUu9gH5lWJNyzktipv5/AwNtdncLWu2Rc/S0CCaPNgmD4+2bYI7Y5JC7TemwHrzZ333w
         oW5Lvlm4lfI+/or2Ybc/N30Gq27iYIVn7yYTf8XBlmQLCWKQhf80IUZrzhwLCXeWBc0A
         CIcU20tjkt3aLP+VFDB/V2H1lHHY/QI9Vj+lyRNwxunnpsS96mHoIlTgaI6jyqKtdyrV
         KcNZ7TWmAhhgIPNSrn2YVhX5kIAHwRoD1igeaR+SdePfdsOSyVSr9jTvwsC4u5rItrdz
         tn9w==
X-Gm-Message-State: AOAM532jWojSjE6t+XmSf8l1J0Gprtsy/RF8iEiTz9bQ1hJWuYNFUd0B
        1X1UtyuNNvr7ACsNBF5Wx827W2jxB36RgTq0Deq+lg==
X-Google-Smtp-Source: ABdhPJxENorReiMcFJ1ELBNazOkBgXgqx3iK4DDfOdoXejxOa5mDrshUwTYC4EVFHSsuoljPmK+RzhLQAe85psy+ReM=
X-Received: by 2002:a50:e79c:: with SMTP id b28mr8612901edn.371.1599224556598;
 Fri, 04 Sep 2020 06:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200831032006.1019978-1-warthog618@gmail.com>
 <CAMpxmJUETJgmxzWzHumOVr+vWFQ27P71MtcdSdf_=jvtrSfRPg@mail.gmail.com>
 <20200903083750.GA17445@sol> <20200904125250.GA323947@sol>
In-Reply-To: <20200904125250.GA323947@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 4 Sep 2020 15:02:25 +0200
Message-ID: <CAMpxmJWVZ8Bf1gPibvbk=E5XNvQ_i76E430MMhUWwE1ACoPTQg@mail.gmail.com>
Subject: Re: [PATCH v6 00/20] gpio: cdev: add uAPI v2
To:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 4, 2020 at 2:52 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Sep 03, 2020 at 04:37:50PM +0800, Kent Gibson wrote:
> > On Thu, Sep 03, 2020 at 10:02:04AM +0200, Bartosz Golaszewski wrote:
> > > On Mon, Aug 31, 2020 at 5:21 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> [snip]
> > >
> > > To me it looks good, just a couple nits here and there and some questions.
> > >
> > > I think it's worth deciding whether we want to keep the selftests in
> > > tools/testing/selftests/gpio/ and then maybe consider porting
> > > gpio-mockup-chardev.c to V2 or simply outsource it entirely to
> > > libgpiod.
> > >
> >
> > Ooops - I wasn't even aware they existed - though it had crossed my mind
> > that the kernel should have some selftests somewhere - I use the libgpiod
> > tests, from my libgpiod port, and my own Go based test suite for my testing,
> > as well as some smoke tests with the tools/gpio.
> >
> > The libgpiod tests only cover v1 equivalent functionality, while my Go
> > tests cover the complete uAPI, and both v1 and v2.
> >
> > It would be good for the kernel to at least have some smoke tests to
> > confirm basic functionality, even thorough testing is left to a
> > userspace library.  So the existing tests should be ported to v2, though
> > should also retain the v1 tests if v1 is still compiled in.
> >
>
> I've got a v7 ready to submit that includes a couple of patches for the
> gpio-mockup selftests (their primary purpose appears to be testing the
> mockup module, rather than the GPIO ABI), but I now notice that the
> selftests/gpio section of the tree has a different maintainer:
>
> scripts/get_maintainer.pl 0021-selftests-gpio-port-to-GPIO-uAPI-v2.patch
> Bamvor Jian Zhang <bamv2005@gmail.com> (maintainer:GPIO MOCKUP DRIVER)
> Shuah Khan <shuah@kernel.org> (maintainer:KERNEL SELFTEST FRAMEWORK)
> linux-gpio@vger.kernel.org (open list:GPIO MOCKUP DRIVER)
> linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
> linux-kernel@vger.kernel.org (open list)

Bamvor, Shuah: do you still have interest in maintaining these, or can
we update MAINTAINERS?

Bart

>
> The v7 patch up to that point restores the functions that the selftests
> are using so that they build and run again.
> So I should hold off on the selftest patches and submit them separately
> after the GPIO changes are in?
>
> Cheers,
> Kent.

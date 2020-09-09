Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029FA262462
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 03:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbgIIBJO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 21:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgIIBJI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 21:09:08 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B2BC061573;
        Tue,  8 Sep 2020 18:09:08 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id l126so655272pfd.5;
        Tue, 08 Sep 2020 18:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GTdyLYMl1xU9EKiVnTMJfey7WT3gOOJTgLq/KVpR8XA=;
        b=iB+ayOqtfIXSz0AYJxV0DAhvucA4l2NikgdHIetrmgYThYSoqhD+ONpt65ASnaAJXn
         5W6Rze3Z8cmF/J4Ol4kzrX6snFykj+2SRRe838Sl2hMXiQb0k4+BtOmdQs9Of8I0lyWh
         AX1vZrbDVlIwb3aKULUl5lGuHI6o2RdMz9KPcIzIu6d3jGbeo6UhORaO7czF8324vLQ/
         J9IipX9s4ExPD9xtw6r7iABnAuNuMKScPB7mIluIekrdDj7elXWeMB6FTwZU5V/WxVBV
         bJ116KtSAJ7lYywAo2k3WBmIOjGtXeqZr9Uv8lC2m9xyRzuATgIqePQpnGH0ALX8Dsos
         wacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GTdyLYMl1xU9EKiVnTMJfey7WT3gOOJTgLq/KVpR8XA=;
        b=hvo8/95w8YGQi8aCh5lolgC32MvZT8Xu9ctDH78fL+n3qKR/6rwGmnoWE4oA2inlu0
         ZV+lHXaaWALQdKmmu/YiIjyLk5rCevPf0DHlduz6rs1PfdI//YAbAfyLWqMfwcHAE1s+
         Z0QHDx2qfFslBHVL3+oOorPKCg5rsfrfRY71JKkkiwbw96/pltGuTcoVBNtSebR1lqKa
         IXKPWg5DdSwOG/P9Jlu+lP6F4ElDAl6zhJTJ/yXntKO3bBSHrZWy8EorjTveaF5vXOxG
         KI/nHQeXoen308lBhlzOrm2n4iHiztWTGZ4frMJsX0J6ygDdxPVwZhMoQIvD269gEhFg
         uQAA==
X-Gm-Message-State: AOAM533cIlwQ//i4h9corsK3oYIghJnl6R3AJYo8qUz5TN47IVdV7076
        EZzr8lB2OfoxM0Dkbk13OUc=
X-Google-Smtp-Source: ABdhPJwz+PRrcl9ZbgIqBADKOcdKJeSziX8d7H5IyAmNRVu6hc241uhU2UcpOWj1WP8WJaiopihsBw==
X-Received: by 2002:a63:ce4e:: with SMTP id r14mr1024963pgi.353.1599613747350;
        Tue, 08 Sep 2020 18:09:07 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id s28sm578062pfd.111.2020.09.08.18.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 18:09:06 -0700 (PDT)
Date:   Wed, 9 Sep 2020 09:09:00 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 00/20] gpio: cdev: add uAPI v2
Message-ID: <20200909010900.GA8496@sol>
References: <20200831032006.1019978-1-warthog618@gmail.com>
 <CAMpxmJUETJgmxzWzHumOVr+vWFQ27P71MtcdSdf_=jvtrSfRPg@mail.gmail.com>
 <20200903083750.GA17445@sol>
 <20200904125250.GA323947@sol>
 <CAMpxmJWVZ8Bf1gPibvbk=E5XNvQ_i76E430MMhUWwE1ACoPTQg@mail.gmail.com>
 <9db62b42-9a1e-0264-e88c-e636004cb629@linuxfoundation.org>
 <CAMpxmJVbujnp+Z0b3utDsGmhUgCbhydorOo-9e-=gVctT55NAg@mail.gmail.com>
 <af4036b7-72b7-16f3-92de-4976b49d857e@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af4036b7-72b7-16f3-92de-4976b49d857e@linuxfoundation.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 08, 2020 at 10:04:05AM -0600, Shuah Khan wrote:
> On 9/8/20 9:54 AM, Bartosz Golaszewski wrote:
> > On Tue, Sep 8, 2020 at 5:24 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
> > > 
> > > On 9/4/20 7:02 AM, Bartosz Golaszewski wrote:
> > > > On Fri, Sep 4, 2020 at 2:52 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > 
> > > > > On Thu, Sep 03, 2020 at 04:37:50PM +0800, Kent Gibson wrote:
> > > > > > On Thu, Sep 03, 2020 at 10:02:04AM +0200, Bartosz Golaszewski wrote:
> > > > > > > On Mon, Aug 31, 2020 at 5:21 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > > > > 
> > > > > [snip]
> > > > > > > 
> > > > > > > To me it looks good, just a couple nits here and there and some questions.
> > > > > > > 
> > > > > > > I think it's worth deciding whether we want to keep the selftests in
> > > > > > > tools/testing/selftests/gpio/ and then maybe consider porting
> > > > > > > gpio-mockup-chardev.c to V2 or simply outsource it entirely to
> > > > > > > libgpiod.
> > > > > > > 
> > > > > > 
> > > > > > Ooops - I wasn't even aware they existed - though it had crossed my mind
> > > > > > that the kernel should have some selftests somewhere - I use the libgpiod
> > > > > > tests, from my libgpiod port, and my own Go based test suite for my testing,
> > > > > > as well as some smoke tests with the tools/gpio.
> > > > > > 
> > > > > > The libgpiod tests only cover v1 equivalent functionality, while my Go
> > > > > > tests cover the complete uAPI, and both v1 and v2.
> > > > > > 
> > > > > > It would be good for the kernel to at least have some smoke tests to
> > > > > > confirm basic functionality, even thorough testing is left to a
> > > > > > userspace library.  So the existing tests should be ported to v2, though
> > > > > > should also retain the v1 tests if v1 is still compiled in.
> > > > > > 
> > > > > 
> > > > > I've got a v7 ready to submit that includes a couple of patches for the
> > > > > gpio-mockup selftests (their primary purpose appears to be testing the
> > > > > mockup module, rather than the GPIO ABI), but I now notice that the
> > > > > selftests/gpio section of the tree has a different maintainer:
> > > > > 
> > > > > scripts/get_maintainer.pl 0021-selftests-gpio-port-to-GPIO-uAPI-v2.patch
> > > > > Bamvor Jian Zhang <bamv2005@gmail.com> (maintainer:GPIO MOCKUP DRIVER)
> > > > > Shuah Khan <shuah@kernel.org> (maintainer:KERNEL SELFTEST FRAMEWORK)
> > > > > linux-gpio@vger.kernel.org (open list:GPIO MOCKUP DRIVER)
> > > > > linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
> > > > > linux-kernel@vger.kernel.org (open list)
> > > > 
> > > > Bamvor, Shuah: do you still have interest in maintaining these, or can
> > > > we update MAINTAINERS?
> > > > 
> > > 
> > > I maintain kselftests and gpio selftest falls under that. Please send
> > > selftest patches to me so I can review them.
> > > 
> > > As for the gpio mock driver and test itself, you will have to wait for
> > > Bamvor to respond.
> > > 
> > 
> > Hi Shuah,
> > 
> > I've been de facto maintaining gpio-mockup for a couple years now.
> > Bamvor has been quite inactive as far as gpio testing goes. I think
> > it's fine if you ack the selftests changes.
> > 
> 
> That is fine. I can do quick review and Ack so you can take them
> through gpio tree.
> 
> > In fact: I don't want selftests to block getting V2 uAPI upstream so
> > if that'll look like it's going to take more time then I'm for merging
> > V2 without any changes to selftests - in the end we have tests in
> > user-space already.
> > 
> 
> Tests and features go through subsystem trees to avoid delays. Please
> make sure the test doesn't break the default kselftest build/run.
> 
> In the future it would help if you include all the maintainers on the
> patch series, so I can review the tests from the framework angle to
> see if they build/run correctly.
> 

To clarify, the patches have been submitted to the correct maintainers.
While this v6, and those before, inadvertently broke the gpio selftests
by removing code they depend on, there have been no code changes in the
selftest tree, and so nothing for you to review.  The v7 of this series
restored the functions that the selftests use so that they again build
and run - still nothing for you to review.

While I had patches for the selftests available for v7, I pulled them
from the patch series as I didn't want to bother you or Bamvor with the
other patches that you wouldn't be interested in.  Further, the gpio
selftests are intended to test the gpio-mockup, as evidenced by Bamvor
being their maintainer and the code itself.  There have been no changes
to the mockup here, and the existing selftests remain valid without being
ported to the latest GPIO uAPI.  Porting them to the latest uAPI, and then
removing the resulting dead code from tools/gpio, is a nice to have that
can wait and shouldn't block getting the uAPI changes in tree.

Cheers,
Kent.

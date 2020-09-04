Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2006125D901
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 14:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730178AbgIDMw5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 08:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730114AbgIDMw5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 08:52:57 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF1BC061244;
        Fri,  4 Sep 2020 05:52:57 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id q3so1100664pls.11;
        Fri, 04 Sep 2020 05:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qPY2otdvdYKHrSDH2JSuHl9RwKdbgP3H7sIRbpWvU/0=;
        b=JxQE5vkwkqpi+phl2JYXrq6ANaMMo4a6mqr9EoLsQSckADwANyv8kJ2rDfb/7zuZq0
         aX/ZGS5K/rZtelQLMgjXvmi4y2QHNpdqIbRbk/YaObBXzRhTN/3CaseZxjBxYamaw/hd
         L1FUcjYRpkOrSf+LQ0yJVrxdf84gqOaDfTxIrghVbht699lNShW2/fYVYYRXCTlJlISk
         mFEMzbtv0S7DgB3NN05laU0gqGT6KW+Zy0g12RGvvdLUTN16xpE3JXCFmMCQFTOiYSxr
         93dri4OSxLq2IR95MLG8nlMBzwpkU5fz7KZGZszL6yczikJYPP1oGHvlxw6tb3u7CnAa
         6sHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qPY2otdvdYKHrSDH2JSuHl9RwKdbgP3H7sIRbpWvU/0=;
        b=przmODVCRE2vChAeNC70ivjuD5xPOrQOyqbm7AnESt3YjjJl5rvWOzhCoTtA00kSoi
         KO++3lKovH4LKM5LDI3InuZIXLBAcreDHGpwGepgK7H6z+XL9zS+4pqE9EyNSkNGlXlf
         9Xq2z9qnu2MhQK7NnbBsD5DRonA3Kw/eHivj+sQmMp6wgfmlF8iqLXgeW376xuQRWHfM
         72F3Jt4W4UkhNzo/OXTACMhQt6OofuWjFGYziwpoWDX0TFE95YYkpD9nV2KTTr7lk7WZ
         l2BaqxQhqJ3gXz2I+kkFR9hkh1Yl4urD1N78jv1wsMjeLiO93nsgFVC0w2nV1Y2NoN7h
         Mleg==
X-Gm-Message-State: AOAM532UMd4MjAcqNcGYkYMfeqd2NjC3A9UzBM/zwYQ/l0hNOe/aIHpu
        7dkFxZcuomG7CVgvgEXobA8=
X-Google-Smtp-Source: ABdhPJwX9hyEaxc8P6PcH/rCAhZpOO76zijV2bcot1QOThINl3Dlb1JNItVkPX5nt8P+zfD6tFK0SA==
X-Received: by 2002:a17:902:6bc3:: with SMTP id m3mr8285193plt.137.1599223976385;
        Fri, 04 Sep 2020 05:52:56 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id 68sm6604790pfd.64.2020.09.04.05.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 05:52:55 -0700 (PDT)
Date:   Fri, 4 Sep 2020 20:52:50 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 00/20] gpio: cdev: add uAPI v2
Message-ID: <20200904125250.GA323947@sol>
References: <20200831032006.1019978-1-warthog618@gmail.com>
 <CAMpxmJUETJgmxzWzHumOVr+vWFQ27P71MtcdSdf_=jvtrSfRPg@mail.gmail.com>
 <20200903083750.GA17445@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903083750.GA17445@sol>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 03, 2020 at 04:37:50PM +0800, Kent Gibson wrote:
> On Thu, Sep 03, 2020 at 10:02:04AM +0200, Bartosz Golaszewski wrote:
> > On Mon, Aug 31, 2020 at 5:21 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
[snip]
> > 
> > To me it looks good, just a couple nits here and there and some questions.
> > 
> > I think it's worth deciding whether we want to keep the selftests in
> > tools/testing/selftests/gpio/ and then maybe consider porting
> > gpio-mockup-chardev.c to V2 or simply outsource it entirely to
> > libgpiod.
> > 
> 
> Ooops - I wasn't even aware they existed - though it had crossed my mind
> that the kernel should have some selftests somewhere - I use the libgpiod
> tests, from my libgpiod port, and my own Go based test suite for my testing,
> as well as some smoke tests with the tools/gpio.
> 
> The libgpiod tests only cover v1 equivalent functionality, while my Go
> tests cover the complete uAPI, and both v1 and v2.
> 
> It would be good for the kernel to at least have some smoke tests to
> confirm basic functionality, even thorough testing is left to a
> userspace library.  So the existing tests should be ported to v2, though
> should also retain the v1 tests if v1 is still compiled in.
> 

I've got a v7 ready to submit that includes a couple of patches for the
gpio-mockup selftests (their primary purpose appears to be testing the
mockup module, rather than the GPIO ABI), but I now notice that the
selftests/gpio section of the tree has a different maintainer:

scripts/get_maintainer.pl 0021-selftests-gpio-port-to-GPIO-uAPI-v2.patch
Bamvor Jian Zhang <bamv2005@gmail.com> (maintainer:GPIO MOCKUP DRIVER)
Shuah Khan <shuah@kernel.org> (maintainer:KERNEL SELFTEST FRAMEWORK)
linux-gpio@vger.kernel.org (open list:GPIO MOCKUP DRIVER)
linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
linux-kernel@vger.kernel.org (open list)

The v7 patch up to that point restores the functions that the selftests
are using so that they build and run again.
So I should hold off on the selftest patches and submit them separately
after the GPIO changes are in?

Cheers,
Kent.

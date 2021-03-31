Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B0E350659
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 20:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235109AbhCaSbd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 14:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235108AbhCaSb2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 14:31:28 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546F0C06175F
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 11:31:27 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 8so22144024ybc.13
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 11:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7jlof/pNjkC0LExRdM7E0LmWgRs1tjM6/e1u7N+Efkc=;
        b=htVxUbA9Mfr5t0HtFExDE8JZMnNHBDy4/VRicG2GAFsRoetik0xCsQwDdbmPSW8hYL
         djrulSGwMQaNb9JZFUoxaLN6oDL+dQ3kfmCkOUK7ioAqdZAVxq14im8uA8TDi1U+cfVD
         F/QE63rj2NF6F3cICQaPal6wDDMfk1A3N/9kyl+5wyM3tu6564JByr8/S6LgUiAaQGrK
         fL1XkHayuORUysW8HzeJnInGZKZ1LrqQqqJY3Eqg93coVu1Tbg572P1H5wx1gMpkdPIv
         XsmM7k7mb99MOnyz5MBMQym++Uj1EBXyYNYPkucZod2/m8fSdIi10JYDB1vy0BxY/h92
         tqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7jlof/pNjkC0LExRdM7E0LmWgRs1tjM6/e1u7N+Efkc=;
        b=frwqwABUAAPAjMnewoUplKWJS197CXOXk/aWsItc9+JGLEa2vlw5f0Oqs0nJfX0lh2
         +2y2U7SFUSWUsB9mV12zocUo6mD5eh+xJH2UOOB15lfenEKqL9nZP3OhRKFscGlgqtO/
         wFFu2B9e52mAVsMFatwCI4uk+rIM5Zfcz6W1uHdNbsGZjYoVktuxg69Pr6VVQJCFGX+Y
         dSBvI6FxMkOph/SFtafxY9u+UqXtwHWj7id8LjCKAeTe/DDU1DQxsvVtS0Na4ccinmgU
         58nhqZFABf4AhgG0c2pd6Skpd5K+SrI1k9up23iAX0TXHlPj+fsBNXeM+yn3NuCf5jgn
         0HhA==
X-Gm-Message-State: AOAM532WlyZyaZa83EUp7TvrfIrNhf4tngMVXcmaK+PbitgJTa8Mu53A
        juGM5kPP6TmaQNfnEpgFcgykUYn+GaQ2sE9wmNESNQ==
X-Google-Smtp-Source: ABdhPJxpmgjd76pWGD+FESc/KM3zqDsAUVN2y3sQ4/D6QZxHWdYPhKxrIno6Bs+eJeNOFFtdktHNc4yYXxfX4SZTU34=
X-Received: by 2002:a25:c588:: with SMTP id v130mr6398245ybe.312.1617215486701;
 Wed, 31 Mar 2021 11:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210329111648.7969-1-ada@thorsis.com> <20210329111648.7969-2-ada@thorsis.com>
 <CAHp75VdqtWS15YPvaPvy4yj5TdW7DDgFB+_bbavFqPBp1zm6eg@mail.gmail.com> <YGRw3PlLBYCPvPn1@ada-deb-carambola.ifak-system.com>
In-Reply-To: <YGRw3PlLBYCPvPn1@ada-deb-carambola.ifak-system.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 31 Mar 2021 20:31:16 +0200
Message-ID: <CAMpxmJV6F5Q4dt71JvY6_awswDFhLFRUsNvx_oP8Wds=PfJwNA@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs: gpio: mockup: Fix parameter name
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Alexander Dahl <ada@thorsis.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 31, 2021 at 2:53 PM Alexander Dahl <ada@thorsis.com> wrote:
>
> Hello Andy,
>
> Am Wed, Mar 31, 2021 at 03:27:05PM +0300 schrieb Andy Shevchenko:
> > On Mon, Mar 29, 2021 at 2:18 PM Alexander Dahl <ada@thorsis.com> wrote:
> > >
> > > Module probing with the parameter documented yielded this in kernel log:
> > >
> > >         gpio_mockup: unknown parameter 'gpio_named_lines' ignored
> > >
> > > The parameter documented did not match the parameter actually
> > > implemented with commit 8a68ea00a62e ("gpio: mockup: implement naming
> > > the lines") long before introducing the documentation.
> > >
> > > Fixes: commit 2fd1abe99e5f ("Documentation: gpio: add documentation for gpio-mockup")
> >
> > Alexander, in the entire series you are using the wrong format for the
> > Fixes tag.
> > I highly recommend to add in your .gitconfig file an alias:
> >         one = show -s --pretty='format:%h (\"%s\")'
>
> You're right. Sorry, I messed things up. I first had that line without
> the additional "commit", and added it because I thought checkpatch
> complained (which it probably did not).
>
> The actual format is documented of course:
>
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
>
> I actually have a slightly different setting for pretty.fixes in my
> ~/.gitconfig for other demands. I'll go and make that project
> dependent now.
>
> Thanks for pointing this out.
>
> Greets
> Alex
>
> >
> > `git one <commit ID>` will give you proper value to refer to the
> > commit in question.
> >
> > --
> > With Best Regards,
> > Andy Shevchenko

FYI no need to resend, I fixed it in my tree.

Bart

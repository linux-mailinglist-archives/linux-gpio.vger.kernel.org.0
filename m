Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 404F73EB1D8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 09:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239509AbhHMHph (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 03:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239479AbhHMHpe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Aug 2021 03:45:34 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB71C061756
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 00:45:08 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id n1-20020a9d1e810000b0290514da4485e4so8333776otn.4
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 00:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7I7hjG8Cm7rdENKuKCqMsBsJThZ+KJZfT9mSkLFEHNM=;
        b=Bmi8E8LVVk7j4i1o3o3/FlzW2InYO9PJp+Y470vJpnzndvcL2UUOrKY8Nt0Z/9P+lE
         GiHi6xYS+U4FIZI+D8BCjLQRRZL8MJB2ahfjrdKPgqllo8sTBbFIP9fUhtUrT0uWesK1
         H9a2OycNHwbMleJq/6HaX6cIl+jf8T+bLZPkSAkZWRmi01rBnUpXDfDqLyiWnykuwTfl
         67YzfanLkLN2r/z06XQ2SrQWnGQRG0KJbHVSEeFg5P/2se85A7r+qNvs4cItQKEfJDjo
         gNseQNEyIu8bbPqq6tlwXmxmyjRvCIU4CNefv8D6j54A676gRvgPXXHK5E1JSgyTYeyf
         RZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7I7hjG8Cm7rdENKuKCqMsBsJThZ+KJZfT9mSkLFEHNM=;
        b=Irv2+1vG+zZv25HgbavgTqQh+yKAamtdAfTCJPWjXEWG3CXTYnlq9HCl7ycIRZtDPe
         J9BtuMvjaB1qf6oSE9n4nObKf13prq/8tmTi2TNHUDFHslM+GvKd3twJcpVIKsqRUgfG
         rkV4wcoSzuEaVyYJcTop0MLYsN3G2vYtHqdMmHH6XxhYC97+KGixk4FiATya3xFdz9aB
         GTYqUOb7UZc3Swmi9+T5WULMWC/3y8mNdhO8sM/N9RAfkQEpYg2eQZJTdqdBNLK9R8/S
         U/8/IvedCsUbaXuDyA/p0xM4s0HaCBWuWmk3VZCVD8/3H0k7uOHWCkNp0XKPqxtw6zME
         Wf5Q==
X-Gm-Message-State: AOAM533NoRGsBEcgwF8GdJ/Ns3KiHWWFTyamy4T/MRSj6O/2kFndm19q
        3ek5whLw3SPXBr1LYhmW/uXoMfl8CfDR0GlWy4llVOMZCZ4=
X-Google-Smtp-Source: ABdhPJwwI/RoxNEI/j0PdQ357CnupJAfzk+dk9HVpojF34RE4trz+hHS1E1BhWI2opyQ8Kijr7GzkWYR35CA9VzmyHI=
X-Received: by 2002:a05:6830:11d4:: with SMTP id v20mr1055378otq.358.1628840707720;
 Fri, 13 Aug 2021 00:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <cc4926af-95bb-4178-a760-d55821dfb626@www.fastmail.com>
In-Reply-To: <cc4926af-95bb-4178-a760-d55821dfb626@www.fastmail.com>
From:   =?UTF-8?Q?Bartosz_Go=C5=82aszewski?= <bartekgola@gmail.com>
Date:   Fri, 13 Aug 2021 09:44:57 +0200
Message-ID: <CAFdkumhOs95j6GA6N3dHKhd+w0x2p2wKPD5vXPg_RV7g2T52-g@mail.gmail.com>
Subject: Re: [libgpiod]: Meson wrap for libgpiod
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 13 sie 2021 o 04:24 Andrew Jeffery <andrew@aj.id.au> napisa=C5=82(a):
>
> Hi Bartosz,
>
> I use libgpiod as part of supporting various platforms in
> OpenBMC[1][2], among other things. OpenBMC generally targets ARM SoCs,
> and this means cross-compiling applications and their dependencies as
> part of the day-to-day work.
>
> While cross-compilation for (complex) userspace can be achieved using
> distro systems like buildroot and openembedded/bitbake or their SDKs,
> the meson build system[3] provides dependency resolution and (cross)
> builds as explicit features through subprojects[4] and the wrap package
> system[5]. In my experience, these features are compelling.
>
> To help me develop userspace applications that depend on libgpiod I've
> opened a pull-request against meson's wrap database[6] to add libgpiod
> support for v1.6.3:
>
> https://github.com/mesonbuild/wrapdb/pull/130
>
> Meson overlays this reimplementation of the build system along side the
> source as shipped in the tag, enabling meson dependency management
> without any impact on the upstream project. However, as you might
> guess, the wrap implementation is non-trivial as it transliterates the
> autotools scripts. While maintenance of this approach doesn't require
> any work on your part, it does have to adapt as the autotools scripts
> change. As such:
>
> How do you feel about switching from autotools to meson for the build
> system of libgpiod?
>

My main concern is this: I know autotools and feel comfortable using
it. I don't know meson and would most likely struggle trying to
maintain this new build system. Does it make any sense to have two
build systems supported at the same time? Possibly with meson files in
a special 'contrib' directory so that we make it clear it's a
secondary build system and may not work when something in the
autotools change?

Maybe this way I'll get used to it and we'll change eventually? Does
this make sense?

Bart

> If this is something you're interested in we can rebase the work in the
> pull-request above on libgpiod master and have something that's mostly
> ready. If you're not interested, I can at least carry on maintaining
> the wrap, but I felt like it was worth asking the question :)
>
> Interested in your thoughts!
>
> Andrew
>
> [1] https://www.openbmc.org/
> [2] https://github.com/openbmc/openbmc/
> [3] https://mesonbuild.com/
> [4] https://mesonbuild.com/Subprojects.html
> [5] https://mesonbuild.com/Wrap-dependency-system-manual.html
> [6] https://mesonbuild.com/Wrapdb-projects.html

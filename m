Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8B7638026
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Nov 2022 21:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbiKXUZV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Nov 2022 15:25:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKXUZU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2022 15:25:20 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC15B7027
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 12:25:18 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id 7so2869592ybp.13
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 12:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J8sxuo2UPMLbk/V0b/6PsXoto/AsE3qIgIJ53xxnA+8=;
        b=DzXikZWt9RzyR2Tig/Uev1rpm8j3JK/odvcOSeTkB+jtQRuRWy7GNIsighIyvp/Bl6
         VFXnor0yB/AuevLW5+ZNmQ8EMviA+lpiielFCoGza7EuVZHn2CCzQjlLLO4oMQs9Xsb2
         6fn40o9SiNJ01WyhjA54A1HNqjV7IZHKM+MdzlR0FlwD6Z0kXN+pkAhyHrCRvcxyw9Iv
         F5NjoDe/x+sCpJ3ZvrXnX1izL5zG1dFhZYtwcwTTqy5nRyrwaxgkUrezk8vACnzeOiSe
         FVQj0Jv54ZpJfdKEPUXLnzLUhsYdKhdXm7MwySiY6LZYEHWEsQL6EkBeSryVl/wUEpbV
         Dvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8sxuo2UPMLbk/V0b/6PsXoto/AsE3qIgIJ53xxnA+8=;
        b=tvptQ0xIl6LSNLnPKo+0l6TVnfHNqEtHcXc0ik2YU2QYzFza2QFrhWW5JOQHmuzWVH
         rAN4It9veB0HSmZYtNa2SV9a6/V93Ge/B2u1K/7gzbtkVcnNInWr0TgXvfKboyBHWJHC
         rWumSb51fPoDUpF+ziZT56bsFZA19BYodq/WBJXVfyqxbzscv8nIYIZyLrCpc3fzrwGg
         r80MoColX+PeRIDrpMjdnUUb8zaZR3oVv9TbRNc1TtWkUVrD9NJikJZS9jpWw+C2WuQH
         KguQ04rt6amN75rOuPlJhjn0cIGjdvY7cSSglBGCmcpI1ulFEL0rCjJb1nWyqSrAvM9D
         SFiA==
X-Gm-Message-State: ANoB5pkwulCFhNYEx+4C+eHBMaijvKwyxF0D6LnFin//mfINSjyp+6qF
        9WxmCXNlPTmA2l5+kqmApoeZ0yPZdJmL590e4dfa6ePlbbs=
X-Google-Smtp-Source: AA0mqf4vQwrE8ITUtBgb8RTbYfpPz89lsJSFGC64L/IZhQQoE/1PgQrK42KWyAw8k1ncUEeY0d73XK1ja31mipt0Phw=
X-Received: by 2002:ab0:3724:0:b0:418:dbdc:cd6f with SMTP id
 s4-20020ab03724000000b00418dbdccd6fmr9125053uag.66.1669321506207; Thu, 24 Nov
 2022 12:25:06 -0800 (PST)
MIME-Version: 1.0
References: <cc4926af-95bb-4178-a760-d55821dfb626@www.fastmail.com>
In-Reply-To: <cc4926af-95bb-4178-a760-d55821dfb626@www.fastmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 24 Nov 2022 21:24:55 +0100
Message-ID: <CAMRc=Mda8UnyH+_GxeX_4MyKd+DPN0BVH5K+J+VWnMJNC1vwTQ@mail.gmail.com>
Subject: Re: [libgpiod]: Meson wrap for libgpiod
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     bartekgola@gmail.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 13, 2021 at 4:24 AM Andrew Jeffery <andrew@aj.id.au> wrote:
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

Hey Andrew!

The libgpiod project has undergone significant changes recently. A new
major release (v2) is getting closer and I'm thinking that it may be
the right moment to rethink updating the build system. Would you be
willing to take a look at the current master branch and see if you can
swap our current autotools in favor of meson while keeping all the
current switches in place (translated to meson of course)?

I would be willing to accept meson into the master branch as the main
and only build system for libgpiod.

Thanks,
Bartosz

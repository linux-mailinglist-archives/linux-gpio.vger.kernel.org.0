Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBAC697ADE
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Feb 2023 12:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjBOLdx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Feb 2023 06:33:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjBOLdw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2023 06:33:52 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F0C99
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 03:33:33 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-52ec329dc01so241734817b3.10
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 03:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oj2P9NKMVMnSiHo+/0bBvpkftuasnb/1Zqo6PRSg2Ho=;
        b=Pnlw//355ECERe7jIkjr3lHZBlm0m9Lhv8tU6WeRcN0T5pd+UG/2iWx2EfOa5A5zIJ
         PMnrvXFWglBupXfsTQubNlyxZp9L+LJjWxeWivhlbszw6svjJ8RWJHk/oJhgYvpFHr3r
         wtA+WLYf7dmQFcZewM95I/3r31NZJVHbWxJ0YlA2kRGmlSSD7Bvd18cX9JjnKKxJOrbR
         bNkNWb0YQvExTa1Hd1P+Kd7KxXyDsi3KoOJJTn6CZI5DUbPqv1bRmyl2ufR9CCacKglI
         06dF+PiynCvuHSIyAaS5YDy+L1/TmSwucSfZBy8+Wut4WN6927QeiB7flskHjIWk1Qd6
         HYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oj2P9NKMVMnSiHo+/0bBvpkftuasnb/1Zqo6PRSg2Ho=;
        b=UUnAOBgwNnn/dX+EW6ZjO+VCVnVgOluwQUSq1R+l+O6dCoxiZ6vHUpTtoUgta3Uv4U
         dKihNSHBlj5xsNr5NdZn0dRVb/T1LqCUL03Q+dc7Lem+Nt0Svxi4+yubFQ2Mc+tBW1Gt
         BVzjYPWB5/fP1rm59LFHFg2zuG0ukfXmHjQY2mUSb6G9Vofr3zxCUarHCiEmTpEoMuW3
         fiH/mgCP2eYBpkVnJUibaya/Oxnp4d0GVNNlOJUHLWMm0XQTbq++Su4V53ltJRPChyAf
         7SjghtDu0cgNNEsfXyZ5N+6TMsNtRe/RFeHfdYVespgclj6+7QewCNqT5bAXGyQ8HfQV
         mqDQ==
X-Gm-Message-State: AO0yUKX+oTbFp9x0/0ktuNxVP4BnmFghWXeX54nYG+T4iMW7t2/KSF7a
        mLHAKlX//F8z54K05QHUj+jmRNzVDGwxXldwoQJUsA==
X-Google-Smtp-Source: AK7set8OrXoKmaG52cIMHBiL3yt57kB2vJE3raatZO5Eei7L5TPvJKqKP/95rUSCn/1I1rOgvvYVEhX/2JAqjGZWR4k=
X-Received: by 2002:a0d:e4c2:0:b0:527:af4a:6a12 with SMTP id
 n185-20020a0de4c2000000b00527af4a6a12mr248826ywe.297.1676460806859; Wed, 15
 Feb 2023 03:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20230214073638.571417-1-alexander.stein@ew.tq-group.com>
 <CACRpkdaV3Jv8=ynw5HUH8x7VGuCjFAiULbt-tRMZAU3T+Wo1Ug@mail.gmail.com> <86wn4jxjph.wl-maz@kernel.org>
In-Reply-To: <86wn4jxjph.wl-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Feb 2023 12:33:15 +0100
Message-ID: <CACRpkdbSN-FzKB4FT7YX6h5U+rojO4OcmYJMJw3khdOqTeDmoQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: vf610: make irq_chip immutable
To:     Marc Zyngier <maz@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 15, 2023 at 12:16 PM Marc Zyngier <maz@kernel.org> wrote:

> > We fixed quite a few of these now, Marc do you have an idea about
> > how much we have left until we can make immutable the default?
>
> I haven't tracked that, and making it the default would probably mean
> getting rid of the code that patches the irqchip structures. I'd say
> that once -rc1 is out, we replace the polite nag with something
> nastier (WARN_ON() of some sort), and push that into -next.
>
> Leave the warning in place for a couple of releases (until the next
> LTS), and then drop the patching code. The not-so-nice part is that
> that drivers that haven't been fixed will break silently. The good
> side is that these drivers will not have been touched over 2 LTS
> releases, and are thus most likely abandonware.

Hmmm I will take a round and fix some more that are simple and
obvious, I know some that are definitely used but just sees low attention
from users.

Yours,
Linus Walleij

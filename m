Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10EEC57673F
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jul 2022 21:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbiGOTRO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jul 2022 15:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiGOTRO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jul 2022 15:17:14 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119E760518
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jul 2022 12:17:12 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id n138so3341944iod.4
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jul 2022 12:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7CtY+MK3bRa50uVEq170RamxPObgJKo/2DNHD6NQCe4=;
        b=Gyloh7lxk+RAqgNSoPBgG4zniuAt++70jq8OeYOQ3zEnVLAm8VkehWKcm/WxdwnX0y
         mQhTuKw9Nz3FUBuy5WIb/OvvVaWcq0PY8oS6Xi/evyWxUH4lJcRCWwyeIVaMBsCArOfC
         imo3b256TvSP1+GrGxMCBTBi9aJnsdr2Zx4xbgqrGjWliTm3rY6oh5hB65oxywb2tQif
         hEUMfeHRSirbgtZCLQX2Bvw0tzCMoYwyLseOU8Fv9bo35vv2MLr3aNexgBuLqEz7t6gt
         mcPLwzV0dpiOCmbBK5PNNTr73LhRWqcYTcrIpR3LJcGbRabVZZlnhO4DdeOkzqtZA7uz
         Nnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7CtY+MK3bRa50uVEq170RamxPObgJKo/2DNHD6NQCe4=;
        b=MBpB5iXME23+4fvGfwpg2s224xyN6AZT5qvOuDTLGiiqBBWiHB0Wp9USoWAqm7hTli
         Ir+FuWVJWiRpknegKEcfjp2jfVfZ+ELGVvRkPAMCpG1Ww/Hp88Z0TFrE3HCbn7+Yk1tL
         uPkKT2JWxCMdYvIQPjaK19IzKLGoST82p9pdwPUEKQnkPxU9AHYYBCleyZXTmp/+yosm
         sxIJE5A0q4WU3k73kU7w8lqfgM/C5En8vWaRilLpHDuhTYAHFsss+TJbpbqC1k6oAhW9
         nYcOP9kTgD3gBFlQEMoPw2VGYqYmT4evCg2xlLlM6K+mOqKi8MG1GM04B3TX7ZR7PXge
         fl/g==
X-Gm-Message-State: AJIora/bCXfUaaTN7AIcNgdBnaGQatT3i53EOayYoHdj9O5jM2bg3dTo
        SJUwHNQ8OUUK7NBKl1iKod8iTi5yUeLgoguiJFs=
X-Google-Smtp-Source: AGRyM1sbMG7nSID6bM4gdtDmn79AAaGO3jXS3iaxBN0kMa30ILx8Dc9x5aaNL8rTmcfh2juVsJYWZWO+YNn48/63hu0=
X-Received: by 2002:a05:6602:2a42:b0:678:84be:c9ec with SMTP id
 k2-20020a0566022a4200b0067884bec9ecmr7499514iov.64.1657912631515; Fri, 15 Jul
 2022 12:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657279685.git.viresh.kumar@linaro.org> <CAMRc=MdLJ_uM_Dy=L5nb-5HVhMFcixaVpD3WQvrDgp8s2bUW9w@mail.gmail.com>
In-Reply-To: <CAMRc=MdLJ_uM_Dy=L5nb-5HVhMFcixaVpD3WQvrDgp8s2bUW9w@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 15 Jul 2022 21:17:00 +0200
Message-ID: <CANiq72mZM1OYb27z63aEtzNJ+7WuzL+EwBqqoj5xBeTfd1LT9w@mail.gmail.com>
Subject: Re: [PATCH V4 0/8] libgpiod: Add Rust bindings
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Fri, Jul 15, 2022 at 9:08 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Rust noob here: I have my cargo installed using rustup for my local
> user but I can't run it via sudo or as root (to run tests) because I'm
> seeing this:
>
>     error: no override and no default toolchain set
>
> What is the right way to use cargo as root? I'm hesitant to just curl
> a random script and pipe it to shell as root honestly.

If by "random script" you mean the rustup installer, you can always
download rustup on its own, or even directly a Rust "standalone
installer", which are signed and do not require rustup, from:

    https://forge.rust-lang.org/infra/other-installation-methods.html#standalone

However, since it appears that you have rustup installed, maybe you
don't mean that. In any case, if rustup is installed, maybe you can
try something like:

    rustup default stable

or similar to install a toolchain.

Cheers,
Miguel

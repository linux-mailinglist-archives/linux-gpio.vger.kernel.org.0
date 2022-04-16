Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 926C5503825
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Apr 2022 22:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233005AbiDPUOJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Apr 2022 16:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233007AbiDPUOI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Apr 2022 16:14:08 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8AB36E30
        for <linux-gpio@vger.kernel.org>; Sat, 16 Apr 2022 13:11:25 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id t11so20715620eju.13
        for <linux-gpio@vger.kernel.org>; Sat, 16 Apr 2022 13:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=94b98jHIz8L2pOB45OOT7luJfA/+sL2eaMOfE0F9TsY=;
        b=SFiglluXtzvdX6k9dHav2jTSy6MYu5tr6t9GqNCRsgidyAb67xpuIdy43TOmtoA44J
         YsGobYD+UVbKJPIend4G2sBPEp3z2ZmTFJFrjpzgveZTlp9/xMLt+6QjteWXts6T6Sz4
         LB8uzNIswyxWL4AHz3LxuOoI+8mTu0M6nbHfK60RDpnjRP4Qzs9C3gAnplKwpuwe8FQz
         gH7XUFnGlhsRR013Xr8fsTQ3sE6nL0gVlN0YBEkSC7sfDd8y+EnqhrSoXyyJasLVgTSk
         pkS0oja99buqM9p1LUSYLCxvagWSR1AyBaTqn+Gm/QHgEk2LNXCgbGi0RJRveE9enLCq
         5IVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=94b98jHIz8L2pOB45OOT7luJfA/+sL2eaMOfE0F9TsY=;
        b=DdVTvlmKzojKvptScL+Fw0phXR1KrwOBseui7oYFmZ4UNyM6suHtr3NnUPk4Dq43k+
         gwlsesEzpB9sFg2OT8aYRjefTlx1BTxnAYErV60IZj0T4JTi5UIP9apI/boXan3bGtnS
         JWc1Z5P5adnwTnt506Ug9Lx6gpb8ax99DYvCp/YCHJFSWDKXQXujUPGCdBrWf/hkEmMU
         MuRBgs7pITJYy+8MrIw1gk2mCAJdCQZA2ZNVWRAMSA5E/Gq4Z9o2D29BJnrAthtcbNHf
         C42TUesfe3PQ3ILO8YToSl/TlLvE50pfHD6/1gMrqSj52eb0KfqaiKL8MUPJ2rn96ptL
         Czvw==
X-Gm-Message-State: AOAM532zJceV7kEj3DEThIY0mf/ujnjVfZssMImhhQRJ67HHIO7lGlnP
        GRf/w7q3HIqD3BpMOI203qs0fMNvISb5Naz5ABKTLg==
X-Google-Smtp-Source: ABdhPJzHoa41KfBJMUwlP9frYawX/9DeGGftQhKuil/Xt5c+/HIfvpam6n3vKdafoyXnsT6lo27wSwXvk4pSIo9GMC8=
X-Received: by 2002:a17:906:d7a2:b0:6e8:9a34:c954 with SMTP id
 pk2-20020a170906d7a200b006e89a34c954mr3571770ejb.697.1650139884068; Sat, 16
 Apr 2022 13:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <YlQ5B6+iE0o2xe0e@black.fi.intel.com>
In-Reply-To: <YlQ5B6+iE0o2xe0e@black.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 16 Apr 2022 22:11:13 +0200
Message-ID: <CAMRc=MdVtOjFcEJeWZJPT5ua-haWoCRwQdaaDdg-FWW9m6uMrg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.18-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 11, 2022 at 4:19 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> Couple of fixes related to GPIO ACPI library. Second one is not a fix per se,
> but coupled together, so we won't have other issues WRT unsignedness of the
> pin from ACPI tables. Please, pull.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
>
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.18-2
>

Pulled, thanks! Could you please use the publicly accessible version
of the address in the future?

Bart

> for you to fetch changes up to 0c2cae09a765b1c1d842eb9328982976ec735926:
>
>   gpiolib: acpi: Convert type for pin to be unsigned (2022-04-08 15:13:22 +0300)
>
> ----------------------------------------------------------------
> intel-gpio for v5.18-2
>
> * Couple of fixes related to handling unsigned value of the pin from ACPI
>
> The following is an automated git shortlog grouped by driver:
>
> gpiolib:
>  -  acpi: Convert type for pin to be unsigned
>  -  acpi: use correct format characters
>
> ----------------------------------------------------------------
> Andy Shevchenko (1):
>       gpiolib: acpi: Convert type for pin to be unsigned
>
> Linus Torvalds (1):
>       gpiolib: acpi: use correct format characters
>
>  drivers/gpio/gpiolib-acpi.c   | 22 ++++++++++++----------
>  include/linux/gpio/consumer.h |  8 +++++++-
>  2 files changed, 19 insertions(+), 11 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

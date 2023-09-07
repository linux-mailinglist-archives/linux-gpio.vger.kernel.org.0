Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D390B797A57
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 19:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244938AbjIGRiX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 13:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245071AbjIGRiL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 13:38:11 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE31E10EC
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 10:37:51 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-34ca22e3b3dso4923375ab.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694108268; x=1694713068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuYVBuRk1qSk/vysKkYAGZLoaF4hP5KwSrbdU9HLCHc=;
        b=GSrlpC1iwXzIkc44GIzlFpjGxNOFWrh6rAJ8dAhIor/KtFCAFZwaRcWIwlenvHDRGm
         XuZOBFNUT29Z+nICyMoIEAEwVbX5qWlM3soxqqf/sRBnjwNL2A+S/nO0r98ppYT/6hre
         WjbynGqIH6HAulr/fw5TAQmw6p6rhvFWb1y23cxxUEa/kGEioYgnmmXoFU2SDWxoNXKb
         qUautCvKMYFsdoZgNHvEfPHd/VZ1IJHbaq20ZqSjIG/uMMsrnzsf3UtDmi2W8cpUvqbM
         dbf+D8wC4okllowdRi+ZgdAwbCjDumFOWaBGQo/+0+Ntvm6R13LwKnXhoyTG9Ku6CFqL
         Ijzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694108268; x=1694713068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuYVBuRk1qSk/vysKkYAGZLoaF4hP5KwSrbdU9HLCHc=;
        b=tuUKDUb0tBO3VAjKDHVGo6/hFWlkOlbmLKCBz+HmyNMoCgR7rsfBLRecHTyLAsPZxu
         M9qVCISNFSzJJF7jpj7h0jBG8aMbVguBhZIMNJOVMr7mADjK5dVStLjdd/R8czaPXsE6
         7kqzb8ifQF5sRQrKF63N2Q36o5we9a0NYOshWe77Fk9nVjx/OuwMHXuwHijfYxboQqFJ
         vu5bmKhA5xIZGSbvXWb1GsEcfVwz1DDxdxTmGKBjc58gZKrSXUT1nmXXab+/4gN0az7K
         UKKGqc6MSrZe+6C0Qt1tnbDcR+Wd27x767AtvlnftLlhegldY6qLMbKk2/Fp+RNZejJ/
         FyGw==
X-Gm-Message-State: AOJu0YzyhQz9RDRclD4Se2RdIDQipv98Q7TtWXi3OtXBK0UzMSgajfVg
        uadjaVAkdRp90ZVEZzQGzJ3RgAgEPngJWvwWhoPeTYK3pyqZznTk
X-Google-Smtp-Source: AGHT+IFH+TTCwwws89F7SNPi0GGOZFWp/OkGv5hkCV0kl2J1CUqPAY/iOB9bwWhCU9n1g7MoTzaR/hVwP1cetSs2hGI=
X-Received: by 2002:a67:ebd9:0:b0:44e:a3e9:68d1 with SMTP id
 y25-20020a67ebd9000000b0044ea3e968d1mr5642709vso.1.1694071890893; Thu, 07 Sep
 2023 00:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-13-brgl@bgdev.pl>
 <CACRpkdYJhP5otaFXbn49sK_33GJMy85MszyD9rqoQT1-fqd9dA@mail.gmail.com>
In-Reply-To: <CACRpkdYJhP5otaFXbn49sK_33GJMy85MszyD9rqoQT1-fqd9dA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 7 Sep 2023 09:31:19 +0200
Message-ID: <CAMRc=MdXU_EiG4iYhHJd7faRPEQ21hXHhRpPAqTa-TiMiraZpw@mail.gmail.com>
Subject: Re: [PATCH 12/21] hte: allow building modules with COMPILE_TEST enabled
To:     Linus Walleij <linus.walleij@linaro.org>,
        Dipen Patel <dipenp@nvidia.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 7, 2023 at 9:22=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Allow building all HTE modules with COMPILE_TEST Kconfig option enabled=
.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This should be a separate patch should it not?
> Just send it separately to Dipen so he can merge it.
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

Dipen,

Can you just pick this up and the other patch addressing a comment in
a HTE driver separately? Would spare a resend to the list and I'd drop
it from the series.

Bart

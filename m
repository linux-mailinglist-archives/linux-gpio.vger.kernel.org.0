Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9587E59A6
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Nov 2023 16:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbjKHPEF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Nov 2023 10:04:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjKHPEE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Nov 2023 10:04:04 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A240C1BE4
        for <linux-gpio@vger.kernel.org>; Wed,  8 Nov 2023 07:04:02 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3b56b618217so4059223b6e.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Nov 2023 07:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1699455841; x=1700060641; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7iX/HSApVgScQksKy0tQtcxZF6kjICaL1GH/gdnl/Hk=;
        b=uI1rbNinz5kdT0T768bb+bb56Hvq1BD1lTddEZpcRTYAvLx8y34F1QaL93S+ebjfJj
         0OpYXYz3nSa4tGUQ+HOdCxoqu3d3sNCB07bKT7dzS9ZvfGdy2zRlHPScEOPJ2ZyuJ9kK
         nUl/NR62jkIHVvQkdniwEONF+3x23dEv95C5D9/DuEPwXevLcTcCrvAqBzHt8gO7M5Vh
         2Ml6yx0OmuzsJnxUzmMU4eXXheE3BOcjsbXvVwluK/SCxIdqSDMv4TixyXBH0brH7r79
         WzRKp6oO5bPhOOvswJ7UuB4CjyUzGMhKCHprtP9LIK/C2oJEZh7M72Tfk+W7Fn8PUE/4
         Kqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699455841; x=1700060641;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7iX/HSApVgScQksKy0tQtcxZF6kjICaL1GH/gdnl/Hk=;
        b=Kn9ZMWzOW4/DAKmCIta5Zs7wWFJhAn3jEdZ47rsVr++/zxdK7ua+AR9vVgX5RPuIiD
         pZsIzR4qeHL1Z82FT/5HmqFSHYGkrddOpOGi/weo5A1iPr3X36EjD4nL/GMfbGJ2B/ze
         ejFjRw9/geGnswrp5gfPogWTjip40Pcup2Pahyk1g16XYRfNgi/GYO7Whuhs3gVdck+P
         pwEHZdNWhpSxLrzsqeJ76GvG62qjB6dme9NMSeQcqNf3l326aPCsSyeBR9eG4mgOrsp4
         t5l1tPWr5fEXM8z5K61IBU+jCbwx9Y6Yk0weFFox6BsK+6OhT69dMnbcfZz9Iy1aNcYl
         TQgQ==
X-Gm-Message-State: AOJu0YzX2dpetB4FtGclLlyw9TZd7so3Cd5CCwfneHfCI6YLow9A6qhK
        4GUo2LkjueFLsSXW++Dvlf/Wxlbrrzy7BZhgC/25rg==
X-Google-Smtp-Source: AGHT+IEO9wxB8bemfHDXt/MhOayNPMslNWeHA7+zIOxT17aZoYR2pzSKPDcSuCzZ7KXJM4WWH9waQnDIlQhH6Pc2sJ4=
X-Received: by 2002:a05:6358:9391:b0:16a:d75:d6a8 with SMTP id
 h17-20020a056358939100b0016a0d75d6a8mr1990757rwb.18.1699455841661; Wed, 08
 Nov 2023 07:04:01 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Nov 2023 07:04:00 -0800
From:   Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20231107215156.2961942-2-phil@gadgetoid.com>
MIME-Version: 1.0
References: <20231107215156.2961942-1-phil@gadgetoid.com> <20231107215156.2961942-2-phil@gadgetoid.com>
Date:   Wed, 8 Nov 2023 07:04:00 -0800
Message-ID: <CAMRc=McSbDxZwrARhFPPvHoDVPb0h0-T0CNj1rKBgHaSD=5HPA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/1] bindings: python: standalone build tooling
 for tests
To:     Phil Howard <phil@gadgetoid.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 7 Nov 2023 22:51:56 +0100, Phil Howard <phil@gadgetoid.com> said:
> Move extension definitions and tooling for building tests into
> `build_tests.py` and update Makefile.am to call it with appropriate path
> prefixes.
>
> `build_tests.py` will perform a standalone build of the text extensions,
> keeping any build noise in a temporary directory and copying the final
> built modules automatically out to `tests/gpiosim` and `tests/procname`.
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---

I'd like to be able to run the tests from the source tree but without
--inplace the core C extension is no longer built in-tree so I cannot do:

    PYTHONPATH=./bindings/python
LD_LIBRARY_PATH=./lib/.libs/:./tests/gpiosim/.libs/:bindings/python/
python -B -m tests

Could you somehow keep this behavior?

Bart

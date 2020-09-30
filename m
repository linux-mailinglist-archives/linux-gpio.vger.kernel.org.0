Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1060527E3F8
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 10:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbgI3ImK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 04:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgI3ImK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 04:42:10 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522C4C0613D0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 01:42:08 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id b12so911695edz.11
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 01:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iD+QRHVRU6u1+rD8tFvnIfeMmBl5eerGMBaWYTeY2Dw=;
        b=hb7bY8ElUVvhPpsRUuoKkcY8k5s6gQhB3SHVhxpmhZdBsFWWwV8E5EVnpO7+ssO7GJ
         5bYBFr/WAyQYJtfw+lHEqI+mnRA44A/1RTDCvMoR4PukmgsvhkMXAZvhqu8NJp0TjfbT
         emD5kVAWTfxhwIIE/Nbm0UD59m4heZWLX03XtI0ab8m6GXSzSvLRBALNdjOGaeJZfle+
         r+tmIlJLvzbDOmbfM9BASD0uXQzgsg3QsYn9U3nKTnkY8Sy6KK3Sw+surbFpN0AxSGF2
         xbkly4d1fgWxfmgAVadEAQI4WckyhNpzy2zTmTwqABzZVNJfi6mzLwuM+WHDOQqNRg5J
         Fbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iD+QRHVRU6u1+rD8tFvnIfeMmBl5eerGMBaWYTeY2Dw=;
        b=b0du1fnMeAHEcFPKHTQtuNBckx5IOCqxkc2QE5VckbVt3/geE8DeA18BDP7Bfds4IQ
         0oKDSrIgL4qQbnLk5HlVcqc0oM58C1m+OYdkM8mCxhWsUUU9SfSiyyiGyjGrFmvMZd1h
         hJ8L53zfqoWugSyHxjkUhko59/JmOVXjMsgudLj80qhRUHbJGwLx04JZRbVhJY5tS50x
         I5T7SNys5JeEyr32zpQKLieG7RYPgZxaapciHPBxNajes6aEAa595dAuFcL1IlGYkt14
         q47arBFl98NlohCpdhZVM2K3IF6oIXGf8tptcHvssJC2Udy67z1phuM7CorXre3dk/5v
         Me7A==
X-Gm-Message-State: AOAM533WXF0FcRYZaI5tTw+l2q8gZU7t5fNd0vi/s3RGRU9vT/FxZuQs
        3GLeCFAh5zKhoRwl29ynvcuZksYON92RkaXlgielcA==
X-Google-Smtp-Source: ABdhPJzMTuQs57fGeFNaSTqCbGJbitH1AyrupA9dPqPv7eqa93L7lPWy87Dm5XFIXyqmSx2bMIZYNi8NMRMcv41+JLk=
X-Received: by 2002:a50:99d5:: with SMTP id n21mr1557090edb.88.1601455326930;
 Wed, 30 Sep 2020 01:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200930074211.30886-1-michael@walle.cc>
In-Reply-To: <20200930074211.30886-1-michael@walle.cc>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 30 Sep 2020 10:41:56 +0200
Message-ID: <CAMpxmJXm5DB8hcJ7-sUWM6vNq_D59xN=QKc_EtGKkq_DZ5tMUQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc8xxx: simplify ls1028a/ls1088a support
To:     Michael Walle <michael@walle.cc>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 9:42 AM Michael Walle <michael@walle.cc> wrote:
>
> Some Layerscape/QoriQ SoCs have input buffers which needs to be enabled
> first. This was done in two different ways in the driver. Unify it.
>
> This was tested on a LS1028A SoC.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---

Looks good, applied.

Thanks!
Bartosz

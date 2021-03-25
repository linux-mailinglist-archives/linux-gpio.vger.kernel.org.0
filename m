Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA17A348CEC
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 10:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhCYJaF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 05:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhCYJaA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 05:30:00 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4509FC06175F
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:29:59 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id f26so2225537ljp.8
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vmKMFioY0zVZQp03F1ln+3gU2DK5top6vTpPu+FZnDs=;
        b=KpfFtXzYNEauysABC3X5zU0EiEkxsudLmFnRzACbzQq+9rckx4xi2e6dfZb7bQEFEB
         ifq+Mx5xaYTPSVq8raYbw2/d1ssOGWbNiaLpnDe9IQmUsl35oIXzDA6JfoQkdoEyc7c2
         8BmEZUd55RaM2Xc3PUVnujU99sZ5neuBVDcIaeTDh+YxJ02gkwPjjkOMqHL8hKJ/DCgh
         Md5dTPVuajkoRQ63aJsG9MgYGrEYzvNbdWhR+VZE4jlYrtoGCRSLVQy45hjLbPDYPPsZ
         5lo5rnjwY8dC/cGe12ryE4X/bRn4zVP8nlY4b++QsDtHpXheRVaMwxWnAO03UzYoAtZg
         rZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vmKMFioY0zVZQp03F1ln+3gU2DK5top6vTpPu+FZnDs=;
        b=a3pXqAWWkxFy0tiJs1d0731MR2ssm//dq8GF9oXLTghJqb6UipME4j6TGVJFHQl7fk
         nFPBiAG3hJAGg03q3ihlvm/EZKH+t/9Cc3JYr+5S4AVK3A6EpL7V1YhR7ox4ulIcnX0y
         ABZL5Bk0D+Iket1IEcyHybw5/flBKJEzhMlTMtdCXRT+sVyaE/3MJb+8Dbe6hemyV5Et
         YQ23IX32c13Hb/8HACjv3rsmVCx8iXhhJoJ7PTo03G7fPoVXil6mITmJe6/wsX3995+I
         NyZEBg8rkL6GlEMLO1ie/Jnr5w0n+DVQ7BDBeFL8PyQkg64ylz4cd37Diw6yFPFB2HEw
         VLIw==
X-Gm-Message-State: AOAM531qHtODO00AXwLl2f5zUfwpqcMKm4IF8lZlHRrAehmAUqikVG7i
        6H5IYD+C0i91bvCLoT9xxz0TYQ1ySrd25+QRZvZZf0qCWH4uDNiI
X-Google-Smtp-Source: ABdhPJxB/I6kt1nPORWmNNUzemQAZpFOwtiNSsfBP3HL3imlrcuJEDouMOsJrxmy/ls2i8ggSYMfVxwKEFHNH5/x3N0=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr5244812ljw.74.1616664597825;
 Thu, 25 Mar 2021 02:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210315091400.13772-1-brgl@bgdev.pl> <CAMRc=MfQnofWQKz9tbnTA_1M8BkN37FcxbJpK4hs0RoRebWWkw@mail.gmail.com>
In-Reply-To: <CAMRc=MfQnofWQKz9tbnTA_1M8BkN37FcxbJpK4hs0RoRebWWkw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 10:29:46 +0100
Message-ID: <CACRpkdZbGDjAJarJJN91gGfHqXEG3puj=OwsQu=OZ5L+tpWt6A@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] gpio: implement the configfs testing module
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 3:32 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> FYI The configfs patches from this series have been on the mailing
> list for months (long before the GPIO part) and have been re-sent
> several times. You have neither acked or opposed these changes. I
> don't want to delay the new testing driver anymore so I intend to
> apply the entire series and take it upstream through the GPIO tree by
> the end of this week.

I say go ahead.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

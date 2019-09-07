Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36080AC9D7
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Sep 2019 01:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727361AbfIGXQ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Sep 2019 19:16:58 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34160 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727487AbfIGXQ5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Sep 2019 19:16:57 -0400
Received: by mail-lj1-f194.google.com with SMTP id h2so2754083ljk.1
        for <linux-gpio@vger.kernel.org>; Sat, 07 Sep 2019 16:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9X3MKRZqOo2i+lBy2G/QGJAeOe0J15Q83MeqXScx3cw=;
        b=CEYzz/MmRgqZr7zKGlzRuwOB/YJc8yJbxOzgvmGryCwopa2g/e/AIlPD+SkmY0Wl4M
         9F2cHsH3JOzdGpdacMDzn1HkMQmMsObFxUDUXwsxXL36+RII4K3D2Q/soWoGpUdzAGLd
         61g53edF66mG2Rs9aCBDDs7s+K8o3b3q5Jz2BFom+x+CD7vgthL5XfbIk0u5oGR57oj9
         yKouEjP3H3dBOeE4r2sUMmLLkG3qGz3yRfcr/YPTQGQH4VCzqMWMG1nDOFdik3GXcwV0
         mDstjobZRUu1u7cylBhxPJJQ2m6BYItJW2ZZsQveLSi8JUC7KjYRwErxu8Jy7dx/nMnF
         oZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9X3MKRZqOo2i+lBy2G/QGJAeOe0J15Q83MeqXScx3cw=;
        b=ZmAnYVDYfYaSiHX0807tv2jHf7ibRSjg97v2jxF3hj5n3g9NQEH2C92ezeLGi+WqmV
         djp13A9ezHFaQSDnC2nCXdD6kzeFb1SoThNijUjEIwyNJMwaqUyjelJOJXmwDQEHfg4C
         1zQa3oNwfQRj5EVfrg61KUScO4QSyyIIXBwRJ+FnI+0w7iuoQca7PcBbyHdJP2BS0RSY
         Y02PT3NkyYxip/hmEK5oTeI90abV7Bp9QgQby4XlVoUfYl5vvjcvCZzhNuLHfxbVasSe
         cuoVCNVxWcPLsAASBiZ/b3elFELYzZVs0k8IPh8kiRL5gXfSN3a/6MhxxdpdYaneSdHT
         F2qg==
X-Gm-Message-State: APjAAAVHvKc09zoqdjDVtDrNFuPF7Fv9QqlTqBPIj8uyZkuEJs+st6kE
        2Yt73Mja4JRcoUPddpSpxxic28LVDKGo2iqUT9FfRQ==
X-Google-Smtp-Source: APXvYqzYsR5xXNtHIykfabC3Q23kUEYzNOjacszj2IiGRhPXodUhW/vFEvfKRFkUbKVcmWLetYb679KGODk59RjIXW0=
X-Received: by 2002:a2e:654a:: with SMTP id z71mr10575644ljb.37.1567898215290;
 Sat, 07 Sep 2019 16:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190907010534.23713-1-jhubbard@nvidia.com>
In-Reply-To: <20190907010534.23713-1-jhubbard@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 8 Sep 2019 00:16:41 +0100
Message-ID: <CACRpkdbmw-EOm5Os=BjoX1G+ZDxRGnJ3Zd3BWtDksnQ46aJ_JA@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix build failure: gpiochip_[un]lock*() static/non-static
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     YueHaibing <yuehaibing@huawei.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 7, 2019 at 2:05 AM John Hubbard <jhubbard@nvidia.com> wrote:

> While building with !CONFIG_GPIOLIB, I experienced a build failure,
> because driver.h in that configuration supplies both a static and
> a non-static version of these routines:

I think this is fixed in my latest version of the "devel" branch?

Yours,
Linus Walleij

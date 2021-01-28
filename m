Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FC8307555
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 12:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbhA1L6h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 06:58:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbhA1L6g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 06:58:36 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44ACCC061573
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2021 03:57:55 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id r14so5991299ljc.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2021 03:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HoMOBJThzXerD1B5eqMbs1auuz0GIc2u3gEbh1anF2Q=;
        b=RJA1Oatr7liQLuVNqEwPVHcjnNDcjxjB79zzIaVNzGWLRndifubGGTMfe7uDikNHTQ
         fCBqeuAzw+hkCYoR551ns1A47rufKvOj3IST2EFT2y8bKOj3m0quhNUNoTt7wGykmnKB
         rCC+7hF4tesMM9jpMHRzaljG6/XkhKdwHkgS4UlRPNM/JNgN+Ym6PKpegAN+kK7DrKpy
         YIhFwFIyhw79uFS3ColWHGGbkNQZjmPs0PQKUQOx8VVQhnKakGPK7gRCVtOHrR8JdzhX
         LpgfJJDyfGjBpHFYm7m7EfXLSqW8gIHmjBWrAGnRXmOGzQpaPe6hKrLEbqJQ0M68ODU3
         tLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HoMOBJThzXerD1B5eqMbs1auuz0GIc2u3gEbh1anF2Q=;
        b=YEXqO7ns0+Yj60IOiBi8n+xgQpTstL2J0Tvzfhz0Fiqaoh0KUZGZANoqEPmRrcS6Jv
         cj7TED9eIaD6qwP1XL38+yMiRDVDDDVpkufEP8z1S9QPBi9vkmvIfq02xgJ9YyASdHgY
         FM1G1vmGHCr5izAvciDaS2Rll8rMT5tZxrd/ewZtWeMbgKpqnahrqaFLFNCQ6STzDWRi
         IW8l5o5CdKnpz+d/hH0lJbfYhMr3amm/+fP4kgOK7G6kCcOu/+oZ+lMm0wNujhmCsofQ
         9fEJOiCwEkQWYh1exj3Xrm5efAVV0SZqbzFranSJG9Q533kwS9q3YuJ84dC2E8Xpf/p4
         TOdg==
X-Gm-Message-State: AOAM532S4599qt2NyIc8hTcGGJHJFNmHkwMpZ4N0p6r23Sp1oadN7F4o
        0A1H3f3x/l90h2zDueiHIH6kAaBXUDK7nqx1uqAJeQ==
X-Google-Smtp-Source: ABdhPJwG9m5Wn1gurcbOyqKjX7kvvKuJQkXbCno0nBjtvdak7Op2rYnzDQQ67qhv1+XrUC6cN0l17D9aQmigdm+rnOg=
X-Received: by 2002:a2e:964f:: with SMTP id z15mr8124244ljh.368.1611835073798;
 Thu, 28 Jan 2021 03:57:53 -0800 (PST)
MIME-Version: 1.0
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
 <20210127104617.1173-1-nikita.shubin@maquefel.me> <CACRpkdYPYua-NuxVC7aBxJtLYFEECL-60jr4pYgK4=fd5Mb-6g@mail.gmail.com>
 <7b932babfe5ad5756eed70effe32bdc03b901d84.camel@gmail.com>
In-Reply-To: <7b932babfe5ad5756eed70effe32bdc03b901d84.camel@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Jan 2021 12:57:43 +0100
Message-ID: <CACRpkdZmepnXck1eV6fXSYaiKbkz56eT9p-D7qVGu3+DzWthXg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] gpio: ep93xx: fixes series patch
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 28, 2021 at 11:19 AM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:

> as we don't have a dedicated EP93xx tree, would you like to take
> the series in one of your trees?

Bartosz is managing the GPIO tree right now and I think he will
queue it once all reviews are finished.

Yours,
Linus Walleij

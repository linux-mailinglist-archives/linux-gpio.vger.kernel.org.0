Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28756328668
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 18:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236529AbhCARJ5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 12:09:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232388AbhCARI2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Mar 2021 12:08:28 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7668FC06178B
        for <linux-gpio@vger.kernel.org>; Mon,  1 Mar 2021 09:07:45 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id n195so17674469ybg.9
        for <linux-gpio@vger.kernel.org>; Mon, 01 Mar 2021 09:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OicOE3mre0h3AyQVp3nU/XHFNAr6XLpp3rW1VAOQfcs=;
        b=q4DIapvl5CGpANyplWTase15rpB/6y/JyINXNKAwWfdKMZc/MzjB3Xh4O3ihj5IE3e
         U5vCePaPQa8it2MEE8JQo5VL7dzFrOh9szmapfrvqKvG3RBQBzwfsKWU6ikZOwYXNxN+
         3SJA0By2TQQbiZ0RMFaaAmIm+nKpMWX8u4RvAdc/JgAc379nP/3Ua7KekJgaxyB2Rqad
         u03b48mESOH05GCEZbWPtYH4w5iykPlGOf3+d62+Gv9mmrFNJ1smkSf1cfP3iIW7fmYE
         T4NHzGfg4GmopWLlBGJHN5B6rQyddZ1JFT42It3D/Cx5iBUXZKNUtr/FuHSvD+PDEr9V
         sAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OicOE3mre0h3AyQVp3nU/XHFNAr6XLpp3rW1VAOQfcs=;
        b=M5bpdspMS/ik2VkWfp5Uw5NJocJmEeWPaGWOLOpyz2VCm7uOlKCpDJ0+/o0KYkSKx5
         yocWD7eGIqj5btAWwNSkmlMXVudOTc+0Qwe6maprYmMZDfYLMFskNOYge5gmTGirs1dL
         W9dJ1n0VEs5bvkebRXZedEJDT6MuY+fWgqm5KlpiRQvUzqnA2Dc+aBqKHpLUqQIdNOgu
         ZNK0/fU2uAvGf7xITDfX8yziB9+tCpXKz+VOOxYaQwt4cD9ezCVKIyxMkTNCxDc9NC/e
         /LGgWe3GFkTGCKyojz5lci2VSmAkr9OIEl2emTDE/pgg3DjYdjwGZpqlSJy58AxIzHpp
         HxwQ==
X-Gm-Message-State: AOAM531WKQaULl4FQKb27WITdLGTxj/V7kEae/knYvcNBwUdw41nRqpn
        5B1VKvx4td5ofPB7Zehi4dGZEwmIG2lOBS1PZloIEg==
X-Google-Smtp-Source: ABdhPJyMtrS9U6p4JJlZ8XJBzZx6DZiarptt1gQA8TbEfVZgHBwKYdbWAsgprV2lonmd0EcuADE+CIQKKz8dzjlDxaI=
X-Received: by 2002:a25:dc94:: with SMTP id y142mr24538620ybe.346.1614618464592;
 Mon, 01 Mar 2021 09:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20210301090519.26192-1-johan@kernel.org> <CAMpxmJXfyM89vfFDQfvOU+CX5EQSp_n_UrbEYC5MP0T-0phc-Q@mail.gmail.com>
In-Reply-To: <CAMpxmJXfyM89vfFDQfvOU+CX5EQSp_n_UrbEYC5MP0T-0phc-Q@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 1 Mar 2021 09:07:08 -0800
Message-ID: <CAGETcx9QnxJaSJQNVskMNHMs-ysjiDq5Bky1WT6pfqbiUCiAmw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: regression fixes
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 1, 2021 at 1:12 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Mon, Mar 1, 2021 at 10:05 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > Here's a fix for a regression in 5.12 due to the new stub-driver hack,
> > and a fix for potential list corruption due to missing locking which has
> > been there since the introduction of the character-device interface in
> > 4.6.
> >
> > Johan
> >
> > Changes in v2
> >  - drop the corresponding drv_set_drvdata() which is no longer needed
> >    after patch 1/2
> >  - add Saravanas's reviewed-by tag to patch 2/2
> >
> >
> > Johan Hovold (2):
> >   gpio: fix NULL-deref-on-deregistration regression
> >   gpio: fix gpio-device list corruption
> >
> >  drivers/gpio/gpiolib.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > --
> > 2.26.2
> >
>
> Patches applied, thanks!

Thanks Johan and Bartosz!

-Saravana

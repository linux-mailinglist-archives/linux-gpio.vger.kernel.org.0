Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE2367E1BD2
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Nov 2023 09:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbjKFIUq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Nov 2023 03:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjKFIUp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Nov 2023 03:20:45 -0500
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0653E0
        for <linux-gpio@vger.kernel.org>; Mon,  6 Nov 2023 00:20:41 -0800 (PST)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-49d8dd34f7bso1640500e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Nov 2023 00:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1699258841; x=1699863641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3T4kfamSxdgUWeGX07iWKCV1k5yLjv63beDfNBxqvQ=;
        b=Yh/jGR3iF+HcxqFK0uiotjoKgFyBFJYIpMOjp0AVxLohi6BwFKdkNBqB4w986CcgpA
         NFItXJXoq2J+yXqUfw6S9CqyBA1qN0Xjo9TlrEGferikhKeKDmFEMEx4yu1lC09kensi
         jl7HFwRaeNJcf7l3t07B6NyxES4LQZOJpQYnBOCi5OrYszvSaSUIq8zqRso95D/4ccxY
         ZMTRLpsM7OEffMvTKh4Nc0PG1jinxTlD9n8kssQE74adnMUvckU0jDQj67xrJo4ZAh7y
         we4WofnMAwZe/Yv8iClU0oCGLfU5dNBmNYxsMAFcMnxi1utMLcitPbqi1zS2XUplnpav
         czxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699258841; x=1699863641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3T4kfamSxdgUWeGX07iWKCV1k5yLjv63beDfNBxqvQ=;
        b=d9w4nZIeR3KXSEbGr5HlUBSDTmRuDZJzqJG/tygRY9MK+5lwi865m4fAsAERfVIhUg
         ygXJSk11SU2gIuen/grVKzdKF5hbZHqFHW17fOCN0uGxC/bOHVBvkgwp9RcTYZi3PMdC
         Ej5RdezqB5bJNmpJJpDzmo91GKpAL8F9cZl8BNW9u+P5pA13Zi/K+jpQAmg5/KYTFKQR
         HBQ711zW1gNB5h6VUy0GL4UBht8L6vOXWWvwAwTBwRoYQ38YMO/a4DEKoL7REe79oSgZ
         DObLYbD7z4DHwrMk4qPz8FYQR9WfLOgBkv5oYk/pM707zKd5XB4PF4Mmy9pWL2Xkrcmd
         13bA==
X-Gm-Message-State: AOJu0Yyo5tR7KK/pkfGWR6/N1wSmJYP/uPfbUX/z8Y4cOK9/WAJrOUPV
        re9Bl49jJZZRigAc2cBIaeZe4IX9Dm29L2bq5MelG6md/w7XQrgGILo=
X-Google-Smtp-Source: AGHT+IGR1qosCgU2eR2zoO1d7hC+PXzFV8HkqWsrwoHyGwmWKxItKjbLbhKSDU331sk57pkSXY5sZbKztne/A5P1+Oo=
X-Received: by 2002:a1f:1305:0:b0:4ac:49ea:9156 with SMTP id
 5-20020a1f1305000000b004ac49ea9156mr1800150vkt.2.1699258840912; Mon, 06 Nov
 2023 00:20:40 -0800 (PST)
MIME-Version: 1.0
References: <20231104-no-y-uapi1-default-v1-1-f60d318b6fbe@linaro.org>
 <ZUbsAhXyk-d4R2M9@rigel> <CACRpkdYP7kO99wV2q8=2q-Q-jgDQf9JHHVdLZEs1tN7AmQF5EQ@mail.gmail.com>
In-Reply-To: <CACRpkdYP7kO99wV2q8=2q-Q-jgDQf9JHHVdLZEs1tN7AmQF5EQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Nov 2023 09:20:30 +0100
Message-ID: <CAMRc=McZGW698rCECoNGw32mroT=_cNtFTpE4XN_zbHDY81ibA@mail.gmail.com>
Subject: Re: [PATCH] RFC: Do not enable the v1 uAPI by default
To:     Linus Walleij <linus.walleij@linaro.org>,
        Phil Howard <phil@gadgetoid.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 5, 2023 at 4:39=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Sun, Nov 5, 2023 at 2:12=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> > If you want to provide the end user with two years to migrate, and give=
n
> > that libgpiod is the major consumer, you might want to hold off for
> > another year.
>
> OK then, just testing the waters.
>
> Probably we need to encourage libgpiod 2.x a bit.
>

Thanks to Phil Howard's work on python bindings, they should soon be
more widely adopted. They are now the first thing that pops up in
google when searching for "libgpiod python" and now have a proper
homepage in pypi. Running 'pip3 install gpiod' will now work on
systems with no libgpiod installed too as it's vendored with libgpiod
v2.1 sources. I also plan to finally get around to using breathe and
exhale to produce proper sphinx docs. So hopefully we'll start getting
traction soon.

Bart

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDFCC2E316A
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Dec 2020 15:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgL0OBR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Dec 2020 09:01:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726172AbgL0OBR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2020 09:01:17 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD2FC061794
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 06:00:36 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id l11so18663812lfg.0
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 06:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ztmsy3K+Ey+0jvh9ciJaUiQRnuezIihWXMRPUQ8Gg7c=;
        b=siSLaQGwdPUJjXc9toTqmiS6hbbelm0t4AgiKsBY7gkBG0mSxCDaStCEFMZz90h4Dz
         LKwaE7UHAGMLilr77+FluFHUZtZbLj2CJirnYNI56Nz5W46FYcvwhHRZwy8/vaozZDCK
         1wBGF/ZbnE6TJ55tcFX22dVnBzlpn5jHOjY4HPZYUphw6HwPVSKi6OntS4+7YxLzJZM/
         jYq+3i/sS5q1gWCxzdnb4KPhlGYGMJGphM1NZ/I/6CMnufEeG8a7lZLDcJ0SGF2D/Xxx
         D4d9iyldmOdFjwZDKD3CLNtFmwvToPCCww9Fq/zEhvVNVYLIlZYyV/XevUDTVaWIJbei
         NtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ztmsy3K+Ey+0jvh9ciJaUiQRnuezIihWXMRPUQ8Gg7c=;
        b=teQHEteQhkKVKnWbbrfEmvWitroGRDQY1VixLluO8LhV6KDNafbfQISgO4qJ/tPfFj
         PXFWbTK6JP3noYKUZAdH4icWgoNPaw2/k9ZhffrIAdGTey0Q1T2naZPK+VKCOL0v4RtT
         sy5zzeAsobO7s0jaZgKRd242cKnKAYCP/MCHk6KipmMIjeQt3kUkaREsdGyxcOchJrit
         YUEvSekx3pERb1US5Y5u3jBqSLC6oEnRfw0pnekLwoyhHeA9nCjcttyRN9GGImJ8I3dU
         W7oNg20MxgawgxUjzhuIqTjWELoO5H4193KQ/eMlG0nQBH0TCBs0Xmtzv4prlIVHEcBD
         5oDg==
X-Gm-Message-State: AOAM530JD4d37mV+Z9dirhcUuNASrSaK4TtHxXI0qDUUafTMDHAKL2T3
        sDP7qSDJIew7XDGD6TJrBoLR+CHSAundpe+6nReP3ir/WK2w2A==
X-Google-Smtp-Source: ABdhPJxfN253chwIKm/lfZmMq8CuvoniZTMtcN562fVFeHIw7fqLxdI4cCWLIWe2e+9NaRYVNem4CPEBWjBlCqpFKFw=
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr18862017ljj.438.1609077634553;
 Sun, 27 Dec 2020 06:00:34 -0800 (PST)
MIME-Version: 1.0
References: <20201224112203.7174-1-nikita.shubin@maquefel.me> <CAHp75VfJ_3XKhFeQv9h0QDeeS4TrNH0aKUXUD3BBff0xUCAf0Q@mail.gmail.com>
In-Reply-To: <CAHp75VfJ_3XKhFeQv9h0QDeeS4TrNH0aKUXUD3BBff0xUCAf0Q@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Dec 2020 15:00:23 +0100
Message-ID: <CACRpkdY2sDVNPhv9nkXfmamopVVcK1xO8BbmsRC7xzoaon5TZQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] gpio: ep93xx: convert to multi irqchips
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 26, 2020 at 6:34 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> I personally consider it quite nice to have support even for outdated
> hardware (reminds me about a recent LWN article about 32-bit
> architectures and a comment there how it could affect the environment
> if we drop them from being supported).
>
> So I fully support this series.

I had a lecture on the subject actually where EP93xx came up:
https://docs.google.com/presentation/d/1pv9MTCDpb0EgzrzicA9JF3pdUL6EcUmKhTavk5_hOHs

As seen it is considered a "fully developed product" and it would not
surprise me if Cirrus is taping out new EP93xx chips even.

This SoC is definitely on my shortlist of stuff we need to support.
(I wish Cirrus would provide some manpower but ...)

Yours,
Linus Walleij

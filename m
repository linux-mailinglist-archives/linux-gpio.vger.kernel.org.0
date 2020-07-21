Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A742227D9F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 12:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgGUKup (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 06:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgGUKup (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 06:50:45 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BEA8C061794;
        Tue, 21 Jul 2020 03:50:45 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k71so1393513pje.0;
        Tue, 21 Jul 2020 03:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mq+/oZmJHKNxNLqfBH78yn3pkWtDXKt6O59loeeGP3Y=;
        b=lZyHoXWxzQG/BnBBXBQ21pSle5hxdB1B9yJETOVyQThMylzRiwpSYvKbjWdYWFiIzF
         1f7QDvsIv9yNIcZ/zj+JqrT0jkubICMrsiqdVmp58L+elx5nmmuXg3noPPfF2J6bIAoa
         Xe/Oa1ButCrY1RyydJLlS/gIFDtra6AQ9rzgDfzbNfjtyLe/VacjL/XvpGvbEISxyqRd
         OWiAkGx/fSZCzO6lEHK32aYCu3ST3l5fpltu8jHWtPXHxTSWTq82FSzMX79cs+uLIEUW
         KM/J4idFh+sTKBv3nJFCS7t1vfAWUuWUN/sCmKS8KiwTwmb1gP4y2aELcLelBzOnV+3D
         3GSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mq+/oZmJHKNxNLqfBH78yn3pkWtDXKt6O59loeeGP3Y=;
        b=KXA9dAZZilcSrLMmGVqECcZy4QYfWqzJV80oeoEzwQ8mRl2y3SaG4RYpBN0lVOISpU
         pYwJIXAnbebwg2KdYAU4mWrXxIQEf6g/KbPWSdZiSK2E6Yd3t//wDJfmLpPN86t79Pk+
         7GrDRNwfZmoaA2pODPgm+SD2upidIiWdaHMMDPRPy9PiLOkT5DE3vmzSU2+HRskm/zha
         Ln0EaXHntD7ighS3B6X3C+lDdfj2f1Bal+lFTDmTBOiM7/m+Fy2p+JY0/LlDqzdJrEiD
         oGBy0X1To9kD0DNC21c39LKYKjO24TgvwCyCTESoesGmL6puJnBso2qahfUH30qY65Nz
         mqwA==
X-Gm-Message-State: AOAM533OvPrIgHX/Ox1E/wL/KIpwZur4iowduBbz/mvQZwlk4jGA9D3Z
        o9Lq3RBdAdB6YKBNhdGSgfMLlhqJuAamR1gMp9o=
X-Google-Smtp-Source: ABdhPJzZr6ANv3MDff7R/H6ZrxWU5bMtUSAHimSb/NlnjU6Zxap+vbytpk/B+P6uJjQ5sLPojdHHLOmFyL3HMeku/Ko=
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr4091894pjb.181.1595328644648;
 Tue, 21 Jul 2020 03:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200721093522.2309530-1-abanoubsameh@protonmail.com>
In-Reply-To: <20200721093522.2309530-1-abanoubsameh@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Jul 2020 13:50:30 +0300
Message-ID: <CAHp75VfLNpyDV81X17yq4yOfVRmyGXsEPaEP63GqkazNHiUPGg@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpio: fixed coding style issues in gpio-crystalcove.c
To:     Abanoub Sameh <abanoubsameh8@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 21, 2020 at 12:35 PM Abanoub Sameh <abanoubsameh8@gmail.com> wrote:

Thanks for an update. In each patch you unfortunately missed:
- driver prefix, should be gpio: crystalcove: here and similar in the rest
- commit message (even one line of why this change is done)

Waiting for v2.

> Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>


-- 
With Best Regards,
Andy Shevchenko

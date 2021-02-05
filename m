Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808633109B2
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 12:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbhBEK6I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 05:58:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbhBEKzu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 05:55:50 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE285C06178A;
        Fri,  5 Feb 2021 02:48:36 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id o16so4273393pgg.5;
        Fri, 05 Feb 2021 02:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nvOsHelKE3NoYQRwSFnShdJJADzBqt5azwahC+OL1LA=;
        b=E4bs8pbqzmgEEXH8cPsrYh6h1cjzp+kUMi6FOvxji+rhwRj3Cz9lGNES2Qy6v6P8IG
         Fd7MJIKw64yGXGFxsxuemxUkyb5zKfStOhsl7HOyC6wIcSnAozMKhUxAU3MCc/Gb6Wb4
         o7vQfgME6ETp5NjCAY0K88bRdCqa8JPhDAoqunUIH/YvMOWxmIOQiZsiFjkK5U8sfoGv
         u+7Smk45pYepRFxEro18L7ieZE/dzyyQHC4Qgt1oRSy+Qp/nSnnT0lJpT38Qviy3ZxWp
         wM7KJuhuiAgRRSpuQNiM/S2e8KPEJL7AjgRE205Jo9utmc1eq21BqHyW+Ld3sN96VzlX
         5J6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nvOsHelKE3NoYQRwSFnShdJJADzBqt5azwahC+OL1LA=;
        b=Lmn2D9g+qFDciTAzuh24FeuwyFZf2sGtC5orndocc5rv5dRfGnNrfE5nT/7djBenNh
         X/3QIEMaKf0LO7I+UZR1YavY68ECMDGCwkMtAmPvE1SwdYkjZ1KyckeF5S3nfRYuVr6w
         z6UOfv1e3JFxzoTtyNDu/hKh28HFbRoXHRMuHJgOfNL1lKzz5XcR2ThzOt1Z6IPoiY65
         oRei2TdBz4rH+Yu8qcpIeo4eEHRtGv+DELE7zC7SnFuV0Mc5Owc2aMn9+269rZCjx0iz
         Rcid6Y7gdDXbpwQd3NzYYXro5X1n0C+Mi2kkE6XWBbu/Jp5zilpL1blGHovzK4YOwhTt
         Y7zQ==
X-Gm-Message-State: AOAM531EmcA48yoN48XkyfcFZGjENGTlN9RZx6F6wIPr57HUyitrhnt/
        jV6AUxTuftwMVE9nxYutxXI9iec+1ojof6RJqq6eLL2hz0hngA==
X-Google-Smtp-Source: ABdhPJxlTApZ806yKNYO6k06V/vEwEzIhSMuNQoKbhCdh16qI3OfiVGamKxyKHeFEzIVN77WwmXRGgROTpKwxf5dokc=
X-Received: by 2002:a63:e50:: with SMTP id 16mr3762998pgo.74.1612522116542;
 Fri, 05 Feb 2021 02:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20210205080507.16007-1-nikita.shubin@maquefel.me> <CAMpxmJVNwB5Pwj_QduBmMY76OUdjsFBFP=0o731rCGHOLYWP2w@mail.gmail.com>
In-Reply-To: <CAMpxmJVNwB5Pwj_QduBmMY76OUdjsFBFP=0o731rCGHOLYWP2w@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Feb 2021 12:48:20 +0200
Message-ID: <CAHp75VfsyrW7chDeK60ZdZGva71ztaX6YVDWod0KTAeiiB_XHw@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] gpio: ep93xx: fixes series patch
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 5, 2021 at 12:34 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> Nikita,
>
> please include the review tags from previous series in the future.
> Linus has left his Reviewed-by: under v3.

As far as I can tell some patches probably can't carry tags due to
design changes, otherwise absolutely true, please keep tags for
unchanged changes from all previous reviews.

-- 
With Best Regards,
Andy Shevchenko

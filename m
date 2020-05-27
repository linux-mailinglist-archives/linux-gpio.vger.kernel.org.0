Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 164C51E417C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 14:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729856AbgE0MIE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 08:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729635AbgE0MIC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 08:08:02 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146F2C08C5C1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 05:08:02 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id f89so11010131qva.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 05:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4vi3g6Kg2eArm6YQR+VjmO4Cl111PfgTkWTFRx3YFzM=;
        b=o8Np2/+rmgxneTK6PS47PIN13VoWncVxY/yUve1Q9dXjVTGz3YoUuYmB/B6VXy7fRA
         wCCdcPM+mP1q7JxBPXGdPCB0Yh/51FHI/Uh6B1Alaq8rQZyMRjia2RSoaWI020lqQZx+
         lWZnNT/OtiO++MWS8Q6PFW4jrT/3J/roOh4oe6yYnm11ikzMaM5pl3xTI3/ogooxCRmb
         LfR3J1G1TIK6B5iB7jj/muTtOB6/DZWMRcG/MLrzeeHqoHPxUTm590YBk7nThSuj9X5h
         obTrOdlzm0n2zl6Uy9Th812RGuHmvTHcccLxOP3WHqzxL3DB0xBMBPEFFl8q8ZXXpr3e
         aUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4vi3g6Kg2eArm6YQR+VjmO4Cl111PfgTkWTFRx3YFzM=;
        b=M/vkOv0Nr3s72zuaNjiHXF4jv/jq7uaH3w7W9wLViUFiBlN8i39NQmulk5FC6rHPK3
         wzs+JIGz4BEjjAVqkCb26ajbqc8uJfko5n7LddPNIjPhXbbCAeFY618scUe8rHPnyrER
         eUM0gMWFRNHeC6Y9KtrHHYMQvpUOa5MHK5zzAbaK8HyPBFJu3ZV1jrH5mCpWFzXz37gr
         biahZaTrj//odYNQk5abcGeykXwLh2e2F1MZf1MsQ7ZwdokTKFHdkPJomn8Uu42xisUO
         GwqxqljvP+YC1c3tOLA0LaGj/GOfULtFK1pL5qTuzQlejxVWzGtJSye2a5RaSJqeKFc4
         9dzA==
X-Gm-Message-State: AOAM531qnB++oCnbxjUtAbR31miMWd1uvZoeizFRDaQOvIjJf7fq4A4P
        WR5/kkHB8z0/drOjz8wzqtTgMq8BlRwVMDDQVsGHAA==
X-Google-Smtp-Source: ABdhPJyG6VXNbsxymPRNqaYF+YFioK1Pxjn4FDJXTJB1Su1AdXodf5RRkVZG4W5s+hKaBMt/fLzM0EIOBaan1hxOX+M=
X-Received: by 2002:a0c:e5cc:: with SMTP id u12mr18082446qvm.134.1590581281380;
 Wed, 27 May 2020 05:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200527010904.12542-1-warthog618@gmail.com>
In-Reply-To: <20200527010904.12542-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 27 May 2020 14:07:50 +0200
Message-ID: <CAMpxmJV++HDy=E5n8b-Yj+LbbRjpq0fmQDJ2-Di2-OLJ0BcU_w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] tests: remove debug asserts
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 27 maj 2020 o 03:09 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> Remove asserts that are a hangover from debugging test cases.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> Those asserts were initially there to debug the test cases when they
> were failing, and I forgot to remove them.  The are not part of the
> test, as errno is indeterminate unless the function returns -1.
> And that clearly isn't the case as the asserts immediately prior verify.
> Having them there can cause spurious test failures and head scratching.
>
>  tests/tests-line.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/tests/tests-line.c b/tests/tests-line.c
> index 97b7df9..334046f 100644
> --- a/tests/tests-line.c
> +++ b/tests/tests-line.c
> @@ -980,7 +980,6 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
>
>         ret =3D gpiod_line_get_value(line);
>         g_assert_cmpint(ret, =3D=3D, 1);
> -       g_assert_cmpint(errno, =3D=3D, 0);
>
>         gpiod_line_release(line);
>
> @@ -1001,7 +1000,6 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
>
>         ret =3D gpiod_line_get_value(line);
>         g_assert_cmpint(ret, =3D=3D, 0);
> -       g_assert_cmpint(errno, =3D=3D, 0);
>
>         gpiod_line_release(line);
>  }
> --
> 2.26.2
>

Applied, thanks!

Bartosz

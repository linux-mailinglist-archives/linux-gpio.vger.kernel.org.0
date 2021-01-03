Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEBD22E8CDE
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Jan 2021 16:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbhACP3f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Jan 2021 10:29:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbhACP3e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Jan 2021 10:29:34 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFC5C0613D3
        for <linux-gpio@vger.kernel.org>; Sun,  3 Jan 2021 07:28:54 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id b2so24685372edm.3
        for <linux-gpio@vger.kernel.org>; Sun, 03 Jan 2021 07:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cVxie154lwcYJHzWP5EaChslDwpWBJ7L2NzbdmB4OZU=;
        b=oJ2v8x0Osh/+G8kXhwmKJgl84cO4EsZ+APuOzLBNgbSKftFG5+h23CJPwff+oC9KXS
         UIWTpPOhIoHvTCUCwYwYYEpBoE4VwgN4ujfNlLKClNgYIuaYy+VEamY76FlxSen/Srh2
         qaZwIFUIPS+f4zsLSfVcevNGRJdRZ+xWjLVfGCYDK95ZTAglal8xvrYqWJRk5U26JLVD
         YkSTniCCcvTVfnz3QSal0nMtLy2y2g89tnAUi6ybG4pkd1nuxuqO5VvavnCgQfZJpDnQ
         2zjAVzG1Q4fWwNBGzJXgO3Sg7Rj0YSnvx8Y5rhTdvQMm4BJ81H1EAWFPBptUGRCJg8eT
         P9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cVxie154lwcYJHzWP5EaChslDwpWBJ7L2NzbdmB4OZU=;
        b=DKfCe/c6g0pXYlGHCHxmqm7tABQDyIAF0w9XULMI0vLlUBziFHtwMARVrpObjMafB9
         HLop3je2HAUYWPND3SaqVyQqq7E2e/eY5c03RxkAQhZFaEOrN5pjLZpDDmnllUbK3OA8
         W6y5MpXrfY3BzS7Nd94CPzKfyx8mDLCH8dlWS1inl5wLGzncGtcPB/Ug8b2q7FD7tV8P
         EliQZm1FeMZkhSpzBjHMmLg8lr6R0ImAy1A72bq7iNrL7HKSi9QVETjBdIIHBKKs0iIg
         d7s7brt/G3KUvro4LHA20yHALxELc5PK1gUnoNG5wwqxySXW8oia6sIW7GEpmu5RlPr0
         ilSA==
X-Gm-Message-State: AOAM533nktOlZWt2GZNqGHAQw1uu3pTvFVlq8tkALLrDmQWtYPtJ3gdU
        gNO6dbX/FxBUTQNIojxp471XwoPk7QBLru5kuRtDlQ==
X-Google-Smtp-Source: ABdhPJx7BUORFSkexk8pG46uBaKZQazMDyCjUt083mvamnGA66PaqfhHeefe9C1LbVRK+ez4mo3DBUIzS+7vR+pjetk=
X-Received: by 2002:a05:6402:14c5:: with SMTP id f5mr66313213edx.232.1609687733208;
 Sun, 03 Jan 2021 07:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20210101200052.967482-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210101200052.967482-1-j.neuschaefer@gmx.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 3 Jan 2021 16:28:42 +0100
Message-ID: <CAMpxmJVQ_zhV_Bc+CgREd45QzV4FpPGTqi9sBCSUVR9g+Pqy=g@mail.gmail.com>
Subject: Re: [PATCH] docs: gpio: Fix formatting in description of
 gpiod_*_array_* functions
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-doc <linux-doc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 1, 2021 at 9:09 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> The gpiod_*_array_* functions take four arguments, not three.
> Additionally, the formatting of the "value_bitmap" line results in
> misformatted HTML, so fix that.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  Documentation/driver-api/gpio/consumer.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/d=
river-api/gpio/consumer.rst
> index 173e4c7b037d0..22271c342d923 100644
> --- a/Documentation/driver-api/gpio/consumer.rst
> +++ b/Documentation/driver-api/gpio/consumer.rst
> @@ -361,12 +361,13 @@ corresponding chip driver. In that case a significa=
ntly improved performance
>  can be expected. If simultaneous access is not possible the GPIOs will b=
e
>  accessed sequentially.
>
> -The functions take three arguments:
> +The functions take four arguments:
> +
>         * array_size    - the number of array elements
>         * desc_array    - an array of GPIO descriptors
>         * array_info    - optional information obtained from gpiod_get_ar=
ray()
>         * value_bitmap  - a bitmap to store the GPIOs' values (get) or
> -                         a bitmap of values to assign to the GPIOs (set)
> +          a bitmap of values to assign to the GPIOs (set)
>
>  The descriptor array can be obtained using the gpiod_get_array() functio=
n
>  or one of its variants. If the group of descriptors returned by that fun=
ction
> --
> 2.29.2
>

Applied, thanks!

Bartosz

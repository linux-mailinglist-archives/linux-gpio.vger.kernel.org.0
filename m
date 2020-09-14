Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC3D26864F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 09:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgINHni (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 03:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgINHng (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 03:43:36 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66816C06174A
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 00:43:36 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id b12so16514047edz.11
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 00:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tw9ZJ35dFwUhfS33cdHLXHUq44wX8Nde0TclgXbxItY=;
        b=mUvvJkY8SLZUDOT2z0vo/RkkC5MXMwg6b6u7utGpbVHis7ZcYg2BglGdoHKtRvNcau
         /5Wr+tJsEWv8e0Sq8ppDOK4Si3FyBl0J7vh88HrVcXs3cNHN9ubf+g3JjO7+XhKwXUHy
         qBhoCSGyaR3ZFrZJF/mHf7QzLiTgbD9CFPAfZO3CloW15/ksSgUdymMYsGinibvdoPOE
         xlmQS3OoYB2CADJDQ7SCLtlnI3KYoHnKxM9ydG/W5+LHZ6DSGThKguZ1VfNzvqk7uiZ7
         J3ogOlplkCpzqyXn4RqcNAaHv9eYzvIcqNqGmi+u5P1slEI2e8zKoBypl8TYrMSW6+GF
         k36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tw9ZJ35dFwUhfS33cdHLXHUq44wX8Nde0TclgXbxItY=;
        b=RxtJM3NOyKe/CuMOYoiGK645hL1vv25Ox4B/qqXVP+ay/TC+DIHUPGDKYSK+bld8n0
         utITPvvefYZx+a73nnaom/k/yjI6LLbxVf+VfIGIMYMqmmht15jXEWdq9Sujjxy3nZgx
         0ts8UU4V/VdtC19nwQ8FwyAdi7jfhtY5eMOIO4ewgu06EITQ/tvOe8mwFyuXqBVWlTfQ
         DZB5teccs8Ir75EL1/ZmKyKOLFyLuzsc06XtGngiCEnAtf5iiUm/aWLt0FSTA62SAaW7
         kK1GVySrwir3RJH1lI9Yh19J0zp33LPrgZunOd+TKXBYDCa7Bxq2pybSB5l3ZTGTxenK
         08dw==
X-Gm-Message-State: AOAM5331zhinwSAzVDLw4Qfu3khxWGMwzMI16dIngggKC8Y2VRaxdr/F
        XYvE+daWN0IdNnPsGZSuBCTgSMAutbBSCBWFOQ7Slw==
X-Google-Smtp-Source: ABdhPJy2Q7ohtTfHewPfc44Zj8u/TiIzpCLeLBHMfzc/jaT3S2rrpqiOQMpe1cn4hY0Wepl4hQSx2AqrOqEa2S4mnOk=
X-Received: by 2002:a05:6402:b72:: with SMTP id cb18mr15450368edb.299.1600069415101;
 Mon, 14 Sep 2020 00:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200909014003.11487-1-warthog618@gmail.com>
In-Reply-To: <20200909014003.11487-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 14 Sep 2020 09:43:24 +0200
Message-ID: <CAMpxmJWiPOxnW3V+J+75sHf8vRqnwF2W7E-uYFcB-9SB7CCaCA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: cxx: fix event timestamp calculation
 for 32bit
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>, florian-evers@gmx.de
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 9, 2020 at 3:40 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Use appropriate C++ chrono library functions to convert the event
> timestamp from a struct timespec to ::std::chrono::nanoseconds to
> ensure correct conversion independent of platform.
>
> Reported-by: Florian Evers <florian-evers@gmx.de>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> Florian suggests a C cast before the multiply, but using the C++ library
> to do all the work, which removes the 1000000000 as well, seems the more
> correct way to go to me.
>
> I don't have a 32bit setup handy to test this, so perhaps Florian could
> check if it works for him?
>
> Cheers,
> Kent.
>
>  bindings/cxx/line.cpp | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
> index 11deae6..b71b6db 100644
> --- a/bindings/cxx/line.cpp
> +++ b/bindings/cxx/line.cpp
> @@ -215,8 +215,9 @@ line_event line::make_line_event(const ::gpiod_line_event& event) const noexcept
>         else if (event.event_type == GPIOD_LINE_EVENT_FALLING_EDGE)
>                 ret.event_type = line_event::FALLING_EDGE;
>
> -       ret.timestamp = ::std::chrono::nanoseconds(
> -                               event.ts.tv_nsec + (event.ts.tv_sec * 1000000000));
> +       ret.timestamp = ::std::chrono::duration_cast<::std::chrono::nanoseconds>(
> +                                       ::std::chrono::seconds(event.ts.tv_sec))
> +                               + ::std::chrono::nanoseconds(event.ts.tv_nsec);
>
>         ret.source = *this;
>
> --
> 2.28.0
>

Patch applied, thanks!

Bartosz

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBDF281693
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 17:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388016AbgJBP2S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 11:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387893AbgJBP2S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 11:28:18 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC1EC0613E3
        for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2020 08:28:17 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id z23so2517791ejr.13
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2020 08:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qLBFqOLPIIeVNrecDqmKe5pDCo6M469dtuJMB6uozXY=;
        b=1VfqE7IhuhjWt2NxSpY15JryJ4J2/wHwj6pro6Ab90rqqm8/jnAVHYuhYtDTCzQj27
         qCVkiPCKG0thGXfpo43leTkloWXb4f+aSyC/GcOJlqBMlYqh+AGg849MK067CQU5ldCf
         y7tpVFmABANjpGYnFo5WLqmYQ41qC+ME8ppKzuX3BRgQSNWxZ0GJ9CEMFB40/B1wXST9
         n23jsNHX38mqMVu5SbLFKT0BduDAckW26cEGXunyhSdVex7tpB2jYLTevLOdJEkx6aFp
         ZszJ9hK9yZsFo8UmiOMKW5ggGe40u1a3gIBFv2GPKBSZ3yIKQdfnYDCIHMrxaA9ZVlK3
         xXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qLBFqOLPIIeVNrecDqmKe5pDCo6M469dtuJMB6uozXY=;
        b=nsjCoTq4iNmvNIuSjXd1+JSvBWNus3nUCECrOzKYvcsoWcovkDv+7/i2pu5bHS/N4e
         F6JAJb1FfqqyGg4gkRmINF1HGR/c0TFSBMhAD1+yVNPaLqlak+lZwBnY0h4bvgSS6KJA
         yfCVp4ueKtyPndD7zTrkc7RlpKDvlSdSiQ0uBWr9VozLJlS+H/uGhqs7Jdws5z4ePue7
         GQl/hqqxiPhmyvJYCJ+UWZZHHH76I6vzCE9dXNIY7cWQdh902SuSR0k8MzGS1NBDKlpj
         1Er/k8DzD3Y44KaAWoJdvxNNRjMktoKhu1DCH5n0eQmdz0PIiwQfThgdXt8yxjXoRTga
         75rw==
X-Gm-Message-State: AOAM530GQEWJExjoxcQmDYcBjD0QcgCeRL4E7pit08coiUhX2GC/h34f
        aorYED2HhV8VwnNDtu2/Nm/qsy35hf4zZ7AWbuSzOQ==
X-Google-Smtp-Source: ABdhPJyvVLldlJNq+Qx04LRovUfTW9uBVrkIrXj2nd3NucyIIBNdVg8NpMeAvgfX8qFLTRRUYxH+2khsTnKfRz5NXLI=
X-Received: by 2002:a17:906:d159:: with SMTP id br25mr2948371ejb.155.1601652496574;
 Fri, 02 Oct 2020 08:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1601616399.git.mchehab+huawei@kernel.org> <bad4d85c218d59c1bf69157df8e1012577680d88.1601616399.git.mchehab+huawei@kernel.org>
In-Reply-To: <bad4d85c218d59c1bf69157df8e1012577680d88.1601616399.git.mchehab+huawei@kernel.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 2 Oct 2020 17:28:05 +0200
Message-ID: <CAMpxmJV8jkktBuHB=1r=twm2QhxT+DaB0DaCJ=0A3sBi2huQgg@mail.gmail.com>
Subject: Re: [PATCH 6/6] docs: gpio: add a new document to its index.rst
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 2, 2020 at 7:49 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> There's now a new ReST file. Add it to the index.rst file.
>
> Fixes: ce7a2f77f976 ("docs: gpio: Add GPIO Aggregator documentation")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/admin-guide/gpio/index.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/admin-guide/gpio/index.rst b/Documentation/admin-guide/gpio/index.rst
> index ef2838638e96..7db367572f30 100644
> --- a/Documentation/admin-guide/gpio/index.rst
> +++ b/Documentation/admin-guide/gpio/index.rst
> @@ -9,6 +9,7 @@ gpio
>
>      gpio-aggregator
>      sysfs
> +    gpio-mockup
>
>  .. only::  subproject and html
>
> --
> 2.26.2
>

Good catch, thanks!

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

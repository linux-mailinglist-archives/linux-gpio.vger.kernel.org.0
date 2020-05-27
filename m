Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C611E4167
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 14:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729796AbgE0MH5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 08:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729731AbgE0MHy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 08:07:54 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA74BC08C5C1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 05:07:52 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id l17so639176qvd.9
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 05:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2If1fEd2k/S8gKcGUgkONwpDgH8ehjOCm3CLevDRaX4=;
        b=IWc/IH8Ot43Ce9SSOWllmsqapoaIn3IkPQ8KFFexclKx9OWVAKc5j+6r/RIjAsWwja
         7qCALstjxujZHv2mLdo3fAE5/pk6Tm3+x6pkyh9gqePodErO28GsnseXKdRJY20wZniR
         lEBkQsVac/wXq0FDpoLhEj4oGCWvX4St6MyS+4HRZaoKR4LyXKjQbid2qrb3/Cr6Rdvr
         aNx8SkQxOqMiNF6tl2qkSSAb+GG9dwx3gse2it6/reCJNW7BC1MH02SaAqKzrwrMAz12
         QtcFiwoQWVn2LKPA8IL1YjmN7UradAtBMrHpbuO+3Ek+KXInRpENEJ4Oi7zWMb+9qJkd
         8Z3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2If1fEd2k/S8gKcGUgkONwpDgH8ehjOCm3CLevDRaX4=;
        b=kV5++ss6u1+jNOV7MgmRJNjoBLCTkb5Wx1EdLaTDg/3QHQOYEzqw0Hx6+hezfzS2gd
         hNgx2p4p4zYCRySkKsJN7BA9lfPDdQaByJUzPDUI3xQnory8zfQVpHfcNdZnZeMNd91T
         C2obWRBX0LHvxMq57vw74jsZ2JZlr4dKnI6lEq6JkrId0wGIzCmJoCGd005GaO9RhtIl
         GA23GXOuaSzawg7t4zs5tejsxJ2+5VYNJeHAE48+tdLkVNKFkl70JMTFrJyySvpw+kLD
         o84NuE2gk8VudmbbDEwQ8Ur69Yuhr97yBbuAwIIWqHD/t9MUvOPyyHEvEtyv0Vezl8X3
         8bVw==
X-Gm-Message-State: AOAM531SC6afsRDLnjSKD68Q43mf2bG4QBC7qQKm2bCxbkUXoJnKHvgP
        elH+agvpEp7M0PA8wRoAiNRlM5UYsKKcoh/kE2H8yrPu
X-Google-Smtp-Source: ABdhPJyg5a+B3CEE8mo3AZPCE1Hb8RZWliGJ1qzj+1qVQvFJz9Eoawaq8S9aAaOqiJ2+S7elsJ1NDsRQNah/csjKl1Q=
X-Received: by 2002:a0c:fecf:: with SMTP id z15mr24183007qvs.76.1590581272225;
 Wed, 27 May 2020 05:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200527011055.12726-1-warthog618@gmail.com>
In-Reply-To: <20200527011055.12726-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 27 May 2020 14:07:41 +0200
Message-ID: <CAMpxmJWQA4q=XhFQq2c+v2c-rpqcbLDNXL6_oHcYE5Niyop3Ow@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] doc: fix comment mix up in gpiod.h
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 27 maj 2020 o 03:11 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> A couple of the doc comments for GPIOD_LINE_REQUEST_XX values
> document the wrong value.
> Switch them so that they document the appropriate value.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  include/gpiod.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 3af97c4..f03ce95 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -956,11 +956,11 @@ enum {
>         GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
>         /**< Request the line(s) for setting the GPIO line state. */
>         GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE,
> -       /**< Monitor both types of events. */
> +       /**< Only watch falling edge events. */
>         GPIOD_LINE_REQUEST_EVENT_RISING_EDGE,
>         /**< Only watch rising edge events. */
>         GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES,
> -       /**< Only watch falling edge events. */
> +       /**< Monitor both types of events. */
>  };
>
>  /**
> --
> 2.26.2
>

Applied, thanks!

Bartosz

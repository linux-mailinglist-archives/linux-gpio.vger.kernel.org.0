Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C69901EE87D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 18:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729811AbgFDQXD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 12:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729540AbgFDQXC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 12:23:02 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D7AC08C5C1
        for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2020 09:23:01 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id w9so5741739qtv.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2020 09:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nqdDkPxs64ydqRZazVkSDcMKoD2Di9Ao1rMLrjlRa40=;
        b=lIGU5Nixoiwye1ScjlGD3/K2YeYoQabVSjX04sSyQxDyvPaxKRT8TJj3xMOoOYk6yI
         81H5zLY2Bw16UbLU9Yg92hwWYnsCfRzMIYUvDKcVdQfkH+neTuaT7i3zrYwt023gjKHz
         YU2+uHXxTJaaQJ2Z7cgPvgNKV3LwmHsAWgog29FTR3ZQVbPOrfpqxElHvLq+VuIup8h+
         D95gQsIz3GGBSMcA+AkXywLvMguY0E5nHWqPAG8nzYOkrfT2h/0Vw9E/b7dn+QzLET2k
         egVe7UAUsf2Qn1efCfL6k9n2r2gtOV30t0i3RBkkp/qFnDkFXrbWLMUZA5YTP6fwumI+
         L+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nqdDkPxs64ydqRZazVkSDcMKoD2Di9Ao1rMLrjlRa40=;
        b=pfZcABiGnVOuEQLqwKLo3TI/Pv3THwLfplorxdi8IrlpUHdTkBRGzIBupGvmgtt5MP
         qFwW+hNVxfPO+Zw4AZ7ULVtGfwqsjM00DBT/MJPXeYLvJYmtfKnrARkIv2I4+ag01+9R
         j+KtBJ6tfq5W1dWQb+nLn0FqFoF284vBQpGvZl2jWB5h/z7X2oQRS7QXu04E3sjunDFo
         n4PHsQkN8jmE+hcIHnMKze/4E48HOkFrgFpvvqXK/20fbWgKYXJs0UouVtkhsnI4ixQB
         cHoTkqBI8G3ZBDEM8EWNbcuNouN4SXhn6M32kjINWI837OmUXszSSKq2gxFatvwSeFfl
         nUqA==
X-Gm-Message-State: AOAM533IYv8prHCbvgYEV9zvrqA8lr5fPVQdRbIVZNHxppYvT9LBOUa8
        Cvdf0LQSxryu+q0JvT5wGKvbkXQLyPVzyUIKfvj1sr3b
X-Google-Smtp-Source: ABdhPJy4d7VT76E7k/ybcQ/SJ9K8NuFI9ReH3yPrZWlYI9gyMK/Mv0CjdvOtx3sY+E7UfFZlglY0CFoFUiaU4uJE7wU=
X-Received: by 2002:a37:5b47:: with SMTP id p68mr5596853qkb.120.1591287774973;
 Thu, 04 Jun 2020 09:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200602141048.1995-1-warthog618@gmail.com> <CAMpxmJUjYn5SHg3BpCeKbYc_OpCjd8d943yfYL_TF15wyTenfA@mail.gmail.com>
 <20200604141804.GA5050@sol>
In-Reply-To: <20200604141804.GA5050@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 4 Jun 2020 18:22:43 +0200
Message-ID: <CAMpxmJXyVO4unLQOzC0xf47CTmK6VurTk+Q=9RDWhcP0pu73pQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: split character device into gpiolib-cdev
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 4 cze 2020 o 16:18 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> >
> > Is this comment relevant for the character device?
> >
>
> True - that comment should stay in gpiolib, and gpiolib-cdev should get
> one of it's own.
>
> Any suggestions on how to maintain line history?
> I know you can trick git by moving the original file into two new ones,
> then moving one of those back to the old name, but not sure if that is
> what you would want to see in a patch.
>

People don't seem to care much about this in the kernel. Files get
moved and git blame results get lost all the time. Don't stress about
it.

Bart

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7672FB988
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 15:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405500AbhASOcv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 09:32:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389751AbhASMqZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 07:46:25 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34CB3C061574
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jan 2021 04:45:45 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id ke15so20606714ejc.12
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jan 2021 04:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2WUya7+5IGqjt8qAdysqD/38MxbinafCy/KFWnkGaFA=;
        b=GBvAMjsNyc1KwbcthQYQW5GVYHx2lUvo09MvmbVSBtBubbd5uZbBhrMfoN66JwDgEJ
         RjF62+B7wxJFtp1Ha/dJwHbUMYJH5u/pq1IPhbKb/b900pw0igY7wnFULlHODuK/aKuv
         fQ01bO7TBI3nnaE9uPkcsVJzTs8eJ+rzht4vG3xphpuJ3jENEpbOTKMtao7V9NUFefA9
         OFLkt0zd9eLv6AbEAhmXA7qbfJki4Itn9YOi2Xov2WmVJXQlD6IXhr4bXgvSGbs8yOax
         1BQUL8i8CN3ZYjplXIw/SZ1JbG5vyYnYEtYSj5hWQ7KWeeIm4gYhzYGhxVJ1Pd0H/2pD
         7ULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2WUya7+5IGqjt8qAdysqD/38MxbinafCy/KFWnkGaFA=;
        b=p2S1WmjGRhXp/IbZumqI3YinHTZBD27nKXgGz1TJojhZEgmD6jVeIU/mc9539rzECs
         9+vVp4qzWPEhmd0ua3S9j1uMmDnruGhwpYVw8JJbGMVzvBESTQpC19UphYXJa5R2Th4/
         P6OYay/05FJoduzaBRRhuU6LicEALxn7pPA0wKYWHhmIHj48Og9wz2VlAacFfFjo9T34
         DDwecidWeBxiwM0Z+oQQx1vRmoIAA4y/0gmf/IO1zCbMYuvBy95/QSxR85AdDm7n05Nm
         TCATuZqHY3KWVhpx9GwPajcJver9mYzHH7tPZETU3qqn0+vZWbiZiogVmSTym0GApJBo
         +XSA==
X-Gm-Message-State: AOAM533eWJF3CC282PZgCjAcEUDba1BEsS0VAawAX0JNumRYlBfysRPx
        hL9xmTCfmYvmPkT1sepjyBCSjyvMT8iCK9yD4BjaQg==
X-Google-Smtp-Source: ABdhPJyuri53Lipmasye8wf+k1fH8XTfNEYApHNNFB4TKoAJIeXibPQX4MIUb9qFN+ASQENiw63w8NY/OURkJsg/h4w=
X-Received: by 2002:a17:906:19c3:: with SMTP id h3mr2823601ejd.429.1611060343774;
 Tue, 19 Jan 2021 04:45:43 -0800 (PST)
MIME-Version: 1.0
References: <20210115164658.187681-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210115164658.187681-1-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 19 Jan 2021 13:45:31 +0100
Message-ID: <CAMpxmJWjy-KbTswA2_8iigzRB7eDoR0P+xYPPWLpfXj-E=wEVg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpio: pca953x: Add support for pca9506
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 15, 2021 at 5:47 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> compared to (implicit) v1 (Message-Id:
> 20210113194952.104734-1-u.kleine-koenig@pengutronix.de) I split the
> patch #1 into driver adaption and dt documenation (i.e. patches #1 and
> #2 here).
>
> For patch #3 I did s/chips/lines/ in the commit log and capitalized
> "Increase" in the summary line.
>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (3):
>   gpio: pca953x: Add support for pca9506
>   dt-bindings: gpio: pca953x: Document new supported chip pca9506
>   dt-bindings: gpio: pca953x: Increase allowed length for
>     gpio-line-names
>
>  Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 3 ++-
>  drivers/gpio/gpio-pca953x.c                              | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
>
> base-commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
> --
> 2.29.2
>

Applied, thanks!

Bartosz

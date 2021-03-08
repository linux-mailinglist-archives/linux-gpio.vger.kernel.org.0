Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B68913311E7
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 16:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhCHPQQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 10:16:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhCHPQF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 10:16:05 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A983C06174A
        for <linux-gpio@vger.kernel.org>; Mon,  8 Mar 2021 07:16:05 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id w9so15168911edt.13
        for <linux-gpio@vger.kernel.org>; Mon, 08 Mar 2021 07:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wME0xxypILqfkGLAgLbk6QlOoimfje6iWFu2oEHWfOs=;
        b=n0RdWFb3wQqQnw/sAXyDL81fOug2MleJFDzS9JHqJa0Xf/qxNoBmnvMYUgDZwTcYF+
         rYOXffjH/llx/sf/D5I0Gf9zZCatLig7eBUI+6yU1cupnL/YEbHvxJ1BrIrpFOmh9NKM
         6+R+6zxoYU8hwDNHKyhnCqwmPXpOioanlM5z9Jh/OEu88RIpHdu95lXQ+oyIloNX+zuE
         ERLhcYqYKlHLSOjifxsIe26Dtx9ZZdWZFQLgOf431yV5Prm0Ri9tmMXTuBRA9V+4rZGD
         kULkYNbckRRXsNuQBV7HQlKnoAqDcoGkZEWOP0KTZcRsndJXIvXw1mHiiSmYRpLVEgAC
         QjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wME0xxypILqfkGLAgLbk6QlOoimfje6iWFu2oEHWfOs=;
        b=pcngbPYNFwdi938/0IJ6rK3uLkJrDgxTTkyVbs+Rou1u6alUFj8XYjBJ9rRH1gXfdY
         3+vTMzfbX4cWY66QlBViLAv+wM1AcPxTuvtuwBwKp/3i3KmgRO4TBl9yniOx1Ej0pUSS
         /MKsHKlBQVEjZ8dBWFOIpqWRVIY3uP8i1yr2PV1QbYAy0tZtrRjFzoPDOtXgLSg2sN73
         U0FpxKNfvBf5XXVML6kMSKbPhso7IDAvtYKA4T+C8tPG89ghU8DFUFavW0sVego4Kr53
         YHOFnVnlZy2vzDiWp+DMSsMR5H7Di0cxLV5NQaW0nsDoaErKbP9L2UgKgQzrylwhgF9E
         +8fw==
X-Gm-Message-State: AOAM533m/gY6eR4gysDvp6wd1u0nFXvLagEzls1bUD9EheA6/BcECw8R
        gvOTXURlk9AfURAVtcOU5oz5chks6ZRggg1HxG5qWE//Bds=
X-Google-Smtp-Source: ABdhPJxBFaI+hm/G4Y0wTEXCDtli4Oap8zfigY5PX7vLldku4lyAIN75HyumbkvqaFZfvVhuxHIhzsRYSYaQMIP0cKk=
X-Received: by 2002:a05:6402:b31:: with SMTP id bo17mr22440599edb.113.1615216564092;
 Mon, 08 Mar 2021 07:16:04 -0800 (PST)
MIME-Version: 1.0
References: <20210303203444.3140677-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210303203444.3140677-1-j.neuschaefer@gmx.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 8 Mar 2021 16:15:53 +0100
Message-ID: <CAMpxmJXs+hVS4c7PBfE8U73q15utehRdfZKz70cP3b-4Rb0Nvw@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: gpio: consumer: Mark another line of
 code as such
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 3, 2021 at 9:43 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> Make it so that this #include line is rendered in monospace, like other
> code blocks.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  Documentation/driver-api/gpio/consumer.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/d=
river-api/gpio/consumer.rst
> index 22271c342d923..3366a991b4aa7 100644
> --- a/Documentation/driver-api/gpio/consumer.rst
> +++ b/Documentation/driver-api/gpio/consumer.rst
> @@ -12,7 +12,7 @@ Guidelines for GPIOs consumers
>
>  Drivers that can't work without standard GPIO calls should have Kconfig =
entries
>  that depend on GPIOLIB or select GPIOLIB. The functions that allow a dri=
ver to
> -obtain and use GPIOs are available by including the following file:
> +obtain and use GPIOs are available by including the following file::
>
>         #include <linux/gpio/consumer.h>
>
> --
> 2.30.1
>

Patch applied, thanks!

Bartosz

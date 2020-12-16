Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA3E2DBED5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 11:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgLPKhz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 05:37:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgLPKhy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 05:37:54 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1D8C0617A7
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 02:37:14 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id p22so24228374edu.11
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 02:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bsYmkfEVvQqgzD1O+aSIpPO4CsKO+u0Ea3O6N1E481c=;
        b=E1gRWKOIK1EEv0yOYoQV3P1kGDMjSZejlfc9pBHAb3Ok+GL+cHeIuNDOxsqtxGH7Ef
         TItAt0jy8MO6I7jrtnl/EtsFj0NIH1iYsicmOwSPqBC1WpEozE46gxcOkApFuK3yM67H
         3kAry0qXXNXvRk60jFkvTEZAae8Qsj65vAyBAUKRnpHNAwnLStkzn9Vg5UxXlJKu3xpl
         subhgINJugcYcDXVXRZF/R2lvLpHgjtSBDprPGBKaHegBUYMCngYjKnV0iQpkn1k/D1c
         YT3MZIqrg5HTPLQjTDj2jiSiTcHfX6l7pl6tyiuZGhOajtlGx2wi/GcI+CwN3awjt/km
         I9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bsYmkfEVvQqgzD1O+aSIpPO4CsKO+u0Ea3O6N1E481c=;
        b=J+tEMmr3YqdAfY+b5OEw7wTwiJjcQ1fkoZN92i3V85cHrg1NOXUxHTABjHvn3Kx5j8
         qozC3BC3wOwhFjw+LjktO3pdkTBLhMRA5SSWKAPcRHlqGZuAG/0Eb8db7/VDqz9gAcd5
         uTpZEnf/72tiWxtQOv2oiKKMGvN2JIfsTjfrD/8/ZXuObxSEhY79UaHuY6Y7ZAYsLump
         NYxr5tBb4Ahe9JXFkeOC79yvBOTVR5D5NdAfT4ZDm6WX8Ak2H3WTx8FvlXLVChYqUFNu
         WOO89HlP5rBuSSIkY8rfJneY4u6S5DbpfM4bCqpmpnFBK1YPw/dMcclmOC/yb6N5QC1o
         UdLQ==
X-Gm-Message-State: AOAM5321W4ZTASGLpPBNL4/bK3Klcxd/v5767Qt3pxklZbKoMMGAzK+7
        8ndh51b0fjYw4x4t6J/71Rh4/1oA8C2H0tRA868dDg==
X-Google-Smtp-Source: ABdhPJwS+suNBsnmqdweQsc8crfYev1Kw3Evg9H2jPGzz2d+ZRjYUcCPzp4JsF4gaLfvS+QySSxQ51abC3XScJaIYz4=
X-Received: by 2002:a50:b742:: with SMTP id g60mr32617780ede.113.1608115033228;
 Wed, 16 Dec 2020 02:37:13 -0800 (PST)
MIME-Version: 1.0
References: <20201211164801.7838-1-nsaenzjulienne@suse.de> <20201211164801.7838-2-nsaenzjulienne@suse.de>
In-Reply-To: <20201211164801.7838-2-nsaenzjulienne@suse.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 16 Dec 2020 11:37:02 +0100
Message-ID: <CAMpxmJUoTHq+ZMm6UOH3tmhGMuDEG5sPn4hiXiZdwSP3FV-hjg@mail.gmail.com>
Subject: Re: [PATCH v6 01/11] firmware: raspberrypi: Keep count of all consumers
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-pwm@vger.kernel.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-devicetree <devicetree@vger.kernel.org>, wahrenst@gmx.net,
        Linux Input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-rpi-kernel@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 11, 2020 at 5:48 PM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> When unbinding the firmware device we need to make sure it has no
> consumers left. Otherwise we'd leave them with a firmware handle
> pointing at freed memory.
>
> Keep a reference count of all consumers and introduce rpi_firmware_put()
> which will permit automatically decrease the reference count upon
> unbinding consumer drivers.
>
> Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
>
> ---

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F683034B1
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 06:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbhAZFZt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 00:25:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727277AbhAYJzk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 04:55:40 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3831EC061352
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 01:44:03 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id bx12so14390645edb.8
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 01:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EKLMKnkstet3NWkC7zAKLu7Avtb2ZmMVXQ+VJfE7jwI=;
        b=qXRyadwd8FejHhWhL/mHFh0bUcyEUBMMnHkyF3Ab4dETWY3Nw0ywxFJ3WzClhzsaZW
         9Y9mgew1tQ0Ay6EozD+OQlJXtk6VWQzPwluLRBkNaUnpCzKfTdBSMcpzK8Z5O2Ve+FTz
         SHHI3qrFhOvVTeJaXTSA6r5cxXW+C4vKQL8CUvJtupZQbSAxSqaR2Na6IlZuoVcTlffc
         L5WXcVwtE7arYZRLCLcVAACM+FwJQtrFooN/L01UG7nr8OtmwW/A64Yew3Rs65lJMN7J
         hSytpKBIZpapf83jksv5Nk79pDobvGyjq35yuOoNbF742HSbm0GC42wsKSPnqhQJFomb
         DVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EKLMKnkstet3NWkC7zAKLu7Avtb2ZmMVXQ+VJfE7jwI=;
        b=sdsgFBOiIjPE6Ck8uKdhq9/H7Vw0LJwZrCNUxZFAT8X10Csy+EKAOxwGxWpmv6qZF3
         w0+QEIo5u0Dr/RaYU1M9yWj+jx24pwdUOSKv//aj23JW5jlnySHtzrcgEcThGU9k3YIF
         G38VLo6ejDhl0qDfISmD5Lo0fqm3aTrm6z1vIP+Ss07vUYUG1hfBA44f3Ni//WuwndPj
         I6+Crm8Rnz0gfFArcon+RbIYAAbEKd1OWvN+vio+HykVuJ5tB23lwPZ5kN9oSh3dIU8x
         in2V5kbpto2JTA5cBN5U8uLYcxYpjHN1OjOjc3UBmbF9R2YfSwrKLotattOrpTtuGzwD
         u1og==
X-Gm-Message-State: AOAM531K7vAfjHXuSPKtSEYmUGlUxN0Y/2Tk78Gi86C22A8+qzUPwOnA
        ZvaHR4N5tCTkLEW/3Ix6cJOCvMgGZR45Jd2nLCwzSg==
X-Google-Smtp-Source: ABdhPJwaJgoAymqk6k9f9KmhdwfEU8ljgtUOr3PqrtmdVbzbw0NT6bHHmw5XnnMxAXCQ8FJybKBSYCp6RcAFKPCwfOc=
X-Received: by 2002:a50:b742:: with SMTP id g60mr806323ede.113.1611567842009;
 Mon, 25 Jan 2021 01:44:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611128398.git.baruch@tkos.co.il>
In-Reply-To: <cover.1611128398.git.baruch@tkos.co.il>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 25 Jan 2021 10:43:50 +0100
Message-ID: <CAMpxmJWUN238GA+kCYVf8mD9GJBuAW00wOkAdk2Ae_-8mNsFTw@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] gpio: mvebu: pwm fixes and improvements
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Ralph Sennhauser <ralph.sennhauser@gmail.com>,
        linux-pwm@vger.kernel.org, linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 5:16 PM Baruch Siach <baruch@tkos.co.il> wrote:
>
> This series adds a few related fixes to the pwm .apply and .get_state
> callbacks.
>
> The first patch was originally part of the series adding Armada 8K/7K pwm
> support. I split it out to a separate series following review comments fr=
om
> Uwe Kleine-K=C3=B6nig who spotted a few more issues. There is no dependen=
cy between
> this and the Armada 8K/7K series.
>
> v5:
>
>   * Drop a patch applied to the gpio tree
>
>   * Fix patch 4/4 description typo (Uwe)
>
>   * Reduce the number of multiplications (Uwe)
>
>   * Add spaces around '+' (Uwe)
>
>   * Use '1ULL' instead of explicit cast to reduce verbosity
>
>   * Add Linus' Reviewed-by tags to patches that are unchanged since v2
>
> v4:
>
>   * Take advantage of zero value being treated as 2^32 by hardware. Rewri=
te
>     patch 5/5 (Uwe).
>
> v3:
>
>   * Improve patch 3/5 description (Uwe)
>
>   * Add more Reviewed-by tags from Uwe
>
> v2:
>
> Address Uwe Kleine-K=C3=B6nig comments.
>
>   * Improve patch 1/5 summary line
>
>   * Add more information to patch 1/5 description
>
>   * Add more information to patch 2/5 description
>
>   * Don't round period/duty_cycle up in .apply (patch 3/5)
>
>   * Expand the comment in path 5/5 based on RMK's analysis of hardware
>     behaviour
>
>   * Add Uwe's Reviewed-by tags
>
> Baruch Siach (4):
>   gpio: mvebu: improve pwm period calculation accuracy
>   gpio: mvebu: make pwm .get_state closer to idempotent
>   gpio: mvebu: don't limit pwm period/duty_cycle to UINT_MAX
>   gpio: mvebu: improve handling of pwm zero on/off values
>
>  drivers/gpio/gpio-mvebu.c | 47 +++++++++++++++++++++------------------
>  1 file changed, 25 insertions(+), 22 deletions(-)
>
> --
> 2.29.2
>

Series applied, thanks a lot for the improvements! And thanks to Uwe
and Russel for the reviews.

Bartosz

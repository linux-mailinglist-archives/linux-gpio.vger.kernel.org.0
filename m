Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABF4C3018DF
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Jan 2021 00:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbhAWX22 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Jan 2021 18:28:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbhAWX21 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jan 2021 18:28:27 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848C3C0613D6
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jan 2021 15:27:46 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id q8so12673021lfm.10
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jan 2021 15:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5n5dBhC79/3/5yDBzMnE3ecAxlOLAF23iRkBbCBrOAg=;
        b=RSd5g7vAWnReup8LMTH+lZC87rj3q5yRziurUhVb0sTcRtNu+6ZIBQRUp9SVybKT8d
         J0NUivN6iIHbavHR1qyabcQEbSRmzfnW8/laCbI2nZL2ReCMOiW9d4xYSzghs3GuNeV9
         zFFDplGKMrz1aW3k2fwbcHxSbEgAPSKzaUcsSIcuFG8u5K6c1O8U6k/WpMLoTdL4PVoy
         Z6UMgEBdmwRcQtsBGVcvIrtuGPOdZBXpCbYwQ+/xIq1wJYVe80EbGjceMjP2s7FO5m8k
         aK7XHWBshmEfOE8WK44gzX66Sdyki7I8MfiHpEu7OkbdSNFqBOlWSrrgeMM3XFMImPDe
         9WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5n5dBhC79/3/5yDBzMnE3ecAxlOLAF23iRkBbCBrOAg=;
        b=LGmvaqNoGio7/rID4mnDLOWorY+7JoAGALTCRf+gmTfMybD031etmPhqase1GyFQyG
         3xOw/+mbrGJJwSN8iDgOmdjXqbT0tAih5MCpEty050XociRQRNmnHgohI4bW0Ly1EIyQ
         vthP9mRG1kDBWcb7puwDOKVvSTzRZLkpaB28GhzCOhzwez7In4sXwzLmmoinpKykZd4F
         BmxEZaKc+dHkqrY4/Kffq3KoTeLMGS5a5Fmy4Bs3ZlhrWLckdb8C4SMsBtFR3S/X1w2I
         2H3mFv3AC8OaQwHIKuWou7nXPgpjpC506N6a/GB+xUiqrlnVJyCD1sjHDjJAYitLgwsb
         9BTA==
X-Gm-Message-State: AOAM531ZGAF2BGzLn0U6QG+/GsNR1qjZJXCwGivxIUvcGm0x770odUqy
        8N29YbFVv9dbcGbT5QtygoWwi3tIioQW6t8tnQ1Ar2UWSuHfpg==
X-Google-Smtp-Source: ABdhPJyw0cA+i8HakoIsvrEu+W9Ymg+tCbpi5zuiZ20U/Uqj/EXgIigaJ2N34qInRFrzJkYRyDNp3pNGqcQ3SS1ixYo=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr876716lfe.29.1611444464954;
 Sat, 23 Jan 2021 15:27:44 -0800 (PST)
MIME-Version: 1.0
References: <20210123202212.528046-1-drew@beagleboard.org>
In-Reply-To: <20210123202212.528046-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Jan 2021 00:27:34 +0100
Message-ID: <CACRpkdbs_UX06X7odaDMfP_=Y=HYdTXWmivh6grVsHDRKQ=Bcg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinmux: add function selector to pinmux-functions
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 23, 2021 at 9:44 PM Drew Fustini <drew@beagleboard.org> wrote:

> Add the function selector to the pinmux-functions debugfs output. This
> is an integer which is the index into the pinmux function tree.  It will
> make it easier to correlate function name to function selector without
> having to count the lines in the output.
>
> Example output of "pinmux-functions":
>
> function 0: pinmux-uart0-pins, groups = [ pinmux-uart0-pins ]
> function 1: pinmux-uart1-pins, groups = [ pinmux-uart1-pins ]
> function 2: pinmux-uart2-pins, groups = [ pinmux-uart2-pins ]
> function 3: pinmux-mmc0-pins, groups = [ pinmux-mmc0-pins ]
> function 3: pinmux-mmc1-pins, groups = [ pinmux-mmc1-pins ]
> function 5: pinmux-i2c0-pins, groups = [ pinmux-i2c0-pins ]
> function 6: pinmux-i2c1-pins, groups = [ pinmux-i2c1-pins ]
> function 7: pinmux-i2c2-pins, groups = [ pinmux-i2c2-pins ]
> function 8: pinmux-pwm0-pins, groups = [ pinmux-pwm0-pins ]
> function 9: pinmux-pwm1-pins, groups = [ pinmux-pwm1-pins ]
> function 10: pinmux-adc-pins, groups = [ pinmux-adc-pins ]
>
> Cc: Jason Kridner <jkridner@beagleboard.org>
> Cc: Robert Nelson <robertcnelson@beagleboard.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Good idea. Patch applied.

Yours,
Linus Walleij

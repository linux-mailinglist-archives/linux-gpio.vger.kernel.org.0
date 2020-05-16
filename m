Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA4571D600E
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2020 11:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgEPJiL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 May 2020 05:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726202AbgEPJiL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 May 2020 05:38:11 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98105C061A0C
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:38:10 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id e125so3084701lfd.1
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CHmw4w5JEiE5ORUUkfCSurvfpTUlqUQrUJG2AzzYQ1M=;
        b=DppmAWrU75NFH2IFxxnS77sqE8wLtGku2N6i3Y/3yUu5EFHK08UmkR22QRrWU58Ngf
         Xv+MUMZH8B/hB4sYuDMMfMwg1cQJNeZRiKgsvpHUpMcY4VGutwkqpjKGpxojnAY6f+GG
         NnrtQ8jBin5gf1yBf+Xf2dEQArLHY5ldTEUaEMd+mRQph9Ulv6ZDyKtSzBgsVqqq2L/A
         kNPlX+XkUtynhKPRhgXXchXfb08k3t6eeJi3I2OoxzmM5fdwaQD24JtzVQ3SOxpXRs6F
         DNNvF8xlkTejQIGceaFFOCh00vrsNj+9o3aq7eD1sQmiKiwT8Fj2hGX1gVxyMCHkUJtj
         BBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CHmw4w5JEiE5ORUUkfCSurvfpTUlqUQrUJG2AzzYQ1M=;
        b=MTK72oSNXhMdmv+WETKJntnxwAclXMs7Kh+5Eo7tCZ+lfSPd3F4CvprVdlpxY7A+no
         B9i5GZbnFS1xPifp8tuu68G/oL8xlExEsUpukzbmWl2AJTgkKCtmTNIKnMiZ4kw5etdV
         RDQI2Jmsw6rQppqmUbrkRsnedgOPP1p0hztYfM++KffkFvJ+GlhM0SvSrYShxcMSY4hY
         0V37ECPV1gY/axSORTIGEhcLoOt4ucxD8xIRqFR8VgqtClHlucN9d9GbpFL/fCDFAr3n
         +zz2UAIqDv5enfdZ0toqw2BAHSxS+VVux8+DRWWp7d+yAZHDtXUF6rEaY1i1DtGYMZun
         fbdQ==
X-Gm-Message-State: AOAM533cSWzUQlIgGGfDMt/T9jBuedzBlhD8wzuV1ZopzAHDvYqx2LQs
        a+shGvQMupemQOJOhpt5j30ztKzXFHOT6JscNRNTEQ==
X-Google-Smtp-Source: ABdhPJzvOQYUwSPgJVbH714U6jTmUQp30DtEaiw0gOF4osugn9OIRVGIimHqGxRyFV+DWuX2dXBR2pI1BQ9Fhvlzoqo=
X-Received: by 2002:ac2:5473:: with SMTP id e19mr789130lfn.21.1589621888936;
 Sat, 16 May 2020 02:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200511101828.30046-1-geert+renesas@glider.be>
In-Reply-To: <20200511101828.30046-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 16 May 2020 11:37:58 +0200
Message-ID: <CACRpkdbEhcF-bGfM=ur-M3eByZ2vPhZqofMwxJ+QQS1Evhs62Q@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Document that GPIO line names are not globally unique
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 11, 2020 at 12:18 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> gpiochip_set_desc_names() no longer rejects GPIO line name collisions.
> Hence GPIO line names are not guaranteed to be globally unique.
> In case of multiple GPIO lines with the same name, gpio_name_to_desc()
> will return the first match found.
>
> Update the comments for gpio_name_to_desc() and
> gpiochip_set_desc_names() to match reality.
>
> Fixes: f881bab038c9667d ("gpio: keep the GPIO line names internal")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij

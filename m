Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFD5207534
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 16:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404032AbgFXOEV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 10:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403922AbgFXOEV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 10:04:21 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29CA2C061573
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 07:04:21 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id u17so1754975qtq.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 07:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wyf+7sUhkjsKJxaULvE9OAhhFZnODU9DJn8C1+YEqPI=;
        b=cXxIKXwweoNm7jUxo3j6FamJztE0yljarsX8GyAAsL6cx9yc0VoyPcG/hnRxHwbv0y
         DjTHXF8Xwq/OoVtEnZ9kz9yUD/x5NsEA0QQPQeZgu7eJLBoEb+uCLyiNvbCOuotce6di
         zI2f0LlMTY1wfe0aBE4BOLt6yKoSZfk7yVP05KTA351ZCMsyQFQ33KRpCFuGVj8XO8eV
         xMANoZW1miE4JY/qdjwJdI1GNuY5UC8N3kI11TzAiRZUrrc16rFtA2ynu0d6IM0erW4f
         KY1o6hVej2DSDBfXmRtvnz9nxzfaUgdW3+nNJWCiYnffV3xpSlxhEsP1gCVBuoDz0ZlD
         Vt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wyf+7sUhkjsKJxaULvE9OAhhFZnODU9DJn8C1+YEqPI=;
        b=bOMbijk39i4lm7nVH5ptMZtGMmZJaFSBr+VoFPbVhiWLyj9h8O8dLIZwHTgUyegVdq
         fJSyYANI+vXbIZdEy76VaRkzu6dvKFeYnXFXtU5ULsCPP1Mwzx/EClYE5LehqUeFOyB1
         4oKYPbZQBcDUxPzsYCSjA/pdvqP5dHflR76MjWPaV0VIm2brlrJUFP36KzkDfj6ZrsdD
         pT2D6F6pLoTwX8erSKokwldaCqA3+sSzMOVIiFa5Y2MT1Ijogwu6LMVq/WGO1byd/I++
         bTnESZS7b1KC+thVRcfB+U9C1YyY4SF+gkJAqtgKBy52qCt3UM1rEHJLivcJEoSdfwzR
         RBVw==
X-Gm-Message-State: AOAM532d3nBWuf/GABDYt58SSk+kTmlcE4lPWNIwrUDMMuIuDGbcTJhi
        g4f3Hr18IjjRLu5ZEU3r1N6cCuEWR6876ZBvRssunA==
X-Google-Smtp-Source: ABdhPJybmC5BLMGFTdpruNk2xDNIAJPKBYy2FAGJKzSZAkzlkL6PjHrYmHCM2GwTqDZ7l2u2hGEefTp0G6+v4YF00j0=
X-Received: by 2002:aed:2684:: with SMTP id q4mr2768445qtd.208.1593007460464;
 Wed, 24 Jun 2020 07:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-10-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-10-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 16:04:09 +0200
Message-ID: <CAMpxmJUWZGhB3eeSquOJZQegTAwyb7yyKzBSeOjG7FSzq=BAkg@mail.gmail.com>
Subject: Re: [PATCH 09/22] gpiolib: cdev: rename priv to gcdev
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

wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Rename priv to gcdev to improve readability.
>
> The name "priv" indicates that the object is pointed to by
> file->private_data, not what the object is actually is.
> It is always used to point to a struct gpio_chardev_data so renaming
> it to gcdev seemed as good as anything, and certainly clearer than "priv"=
.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>

Ugh now it's gcdev and gdev everywhere and it doesn't really make it
more readable. Maybe chardev_data or cdev_data?

Bart

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0CFF013A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 16:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389749AbfKEPYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 10:24:11 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46939 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389740AbfKEPYL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 10:24:11 -0500
Received: by mail-lj1-f194.google.com with SMTP id e9so9006218ljp.13
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 07:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zfNcf4S6DpXFZYs4x9NDwQ36QzUQXx6HDc+b9FaYu1c=;
        b=ySUqRbbwqp5Yv1jmBGz6tsBBUEedPIvlw99Fk6vU0QkyQrkAZNmDoPeADtuckZagJd
         G95809sEAn6+ITZK5qlcNJqcN3q5ZI5qwqHRxUgjoHLvk+4Qyw7b3wwm+GlIDAxceNyQ
         hBHUNz195VuKzeF9l1YNf5yS9uHplt1vVH/O0srgiJp70gFVEyz11+mDnKSBpPYiBSch
         4S3AeKMFkUQtY2GVwetLGftWSD52rLOsdTfmyB9Eyu5BclFARq7zkSFKaalF1adVG20F
         Wixi+hGRSWvQyL0auGt6JRTZSquv+iQZgqRHRHgmX5FqXuRuaCMqb0PH8fQ0CsHeTEZA
         V1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zfNcf4S6DpXFZYs4x9NDwQ36QzUQXx6HDc+b9FaYu1c=;
        b=L+8c2swgQMaOOrDblPBe6AGu4vB+gQdGtjfzHbF4e31BduUJ2pkB8lr4etLuKis8KI
         UD9imBFs6JIOBL+DjcBucg84LPOIbtwIokjiMfYOkd+Vkzyqilt9GuzEQg4Pf7JXkLCU
         DqOWb7pZJx4xwMK7te63OUYvilYi3MG15x6Qn5wOq31ZDoQ17Jl6cflk1SUR1fDAhfRS
         eRulCBcS7xenALHqb2PRT29DSzhjOZDYrYAoc/S1ZdGV8VCPmXXfFCbgCvU/wxygxKW/
         5lSqmNKSMchNoDuCODQ03QBFYnQiHJo/qXX/NeDcDkMAsnTdOD/nKfb0GgJhFCQREQAC
         Hx9Q==
X-Gm-Message-State: APjAAAVefaUk79wj7wnCC4V4QCm6QZn+q4IWvYfeD4gKWp/sz0ig+4ck
        n6g2G85MOqVHgT0ZNFiu1F7B3tGPqRGR8F6hcJSqyQ==
X-Google-Smtp-Source: APXvYqwsA6UpjgTbiUM/08Cv5/UXnvvBZ+9Vzl45plS0dW+kWsNO4C0lW9LFg2GcNPjN3YCAHhIliUHlKPNTHbw6A0M=
X-Received: by 2002:a05:651c:1202:: with SMTP id i2mr23609324lja.218.1572967448955;
 Tue, 05 Nov 2019 07:24:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1572945605.git.matti.vaittinen@fi.rohmeurope.com> <d25edcc3a5d912be9d7c3a927bad6baf34a1331e.1572945605.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <d25edcc3a5d912be9d7c3a927bad6baf34a1331e.1572945605.git.matti.vaittinen@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 16:23:57 +0100
Message-ID: <CACRpkdav+Sz04WE6N5KkKMQLOtx2BZrjWrEin06yPZQ31a47hg@mail.gmail.com>
Subject: Re: [PATCH 02/62] gpio: gpio-104-dio-48e: Use new GPIO_LINE_DIRECTION
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 5, 2019 at 11:10 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> It's hard for occasional GPIO code reader/writer to know if values 0/1
> equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT to help them out.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Please merge all of these patches 2-n into one to avoid patch bombs
and just make one technical step.

Oh the patch bomb already dropped, hehe. Anyways I want one
big patch to apply. Please make sure it applies on the GPIO tree's
"devel" branch.

Collect any ACKs and drop most from the CC else the driver
maintainers may get annoyed.

Yours,
Linus Walleij

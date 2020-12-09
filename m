Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB752D3DC6
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 09:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbgLIInQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 03:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728184AbgLIInQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 03:43:16 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D3CC0613D6
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 00:42:36 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id 23so1971447lfg.10
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 00:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rFJqflg3adJFeN3Kytku+xyfIdshoH7ILfDIx/FbTe0=;
        b=p/fwR9lHVyHy6dWZd9GfVwh5Yoij+ymPwnY8f20sRhR6JWzC3bQSEZPxE/FnhG8V6+
         JXHBcJoi8O+mV2tBXLCDbKWRMuoTqzqURwhl53ZY7vzgmoyPkdxcOQZzR2uZy2Gwfkb5
         mQ2diz9Kig4I59jEUPhB1nVWTepPhTVfg4jBS5D/thmo/bJoHRt3oPvxJn3oh1LIMS0D
         rk7HvgL+D69hAJlSRjZvVNcuA4rW7OShkg+w3th48spb3wj9RIjYRkD6rfrI+zDL0C4a
         5ut5LOjeX14b1XhbhG3yA/zt7OGBv8qepFMdsCXbFRmT22k7x1lR4iDNp0G1AZ2KTw2j
         UwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rFJqflg3adJFeN3Kytku+xyfIdshoH7ILfDIx/FbTe0=;
        b=tRxbbEZTBRclHtUZqDjMr29t0SfI6/g5Q1qkfvAbUTougyQKqBwviLSmBxZ+LorHtg
         c8MFPmnEsojMiWF5LwGY9AB8cLS+k+AQtFjr+wBLxSGStTATO9u9Dx3jCg66cEqUF3Z8
         p5phLKpIBQXd5Zip/Y2PwYlg27R1DlSDWGQGK/vssSA57Yr2VrquYnuak90vHHxhL+nF
         MCWn0cXvi/Fa9Kf/ZlZVqlvIL2Pp1QSr93W4LEQ/uAlZq2cyPT/NxTxF5DGcb4YJX+Cy
         WHgxtxYHeqO1IbTfv0YVKhL2VQXqAbxibRHEzmSPe1c/NM3kEJT4L3IAG9Z8WAqgRe6s
         Vd/w==
X-Gm-Message-State: AOAM531Gq/SwzlH9f6RxzVda+DuzY9gQk1lJX7dtS35eGl8JN/Jg9Yie
        c61vbXQbSQxt4XvV6xY5qe49W7vLmfGpmmvfv/RXcA==
X-Google-Smtp-Source: ABdhPJwFUsAoeMA8DaIqBEoEmSKEcEAz8QCn4SxhYXfB8gtURU7134qDvZyePL4+HrhnLZyfcmBazAkL6BQAK0vfcWw=
X-Received: by 2002:a19:8384:: with SMTP id f126mr600240lfd.649.1607503354685;
 Wed, 09 Dec 2020 00:42:34 -0800 (PST)
MIME-Version: 1.0
References: <20201209055106.840100-1-zhang.lyra@gmail.com>
In-Reply-To: <20201209055106.840100-1-zhang.lyra@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Dec 2020 09:42:23 +0100
Message-ID: <CACRpkdZptM_n00mirKDkmJn5e+h4HdUrKAG8x6onep00bSegSQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: eic-sprd: break loop when getting NULL device resource
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 9, 2020 at 6:51 AM Chunyan Zhang <zhang.lyra@gmail.com> wrote:

> EIC controller have unfixed numbers of banks on different Spreadtrum SoCs,
> and each bank has its own base address, the loop of getting there base
> address in driver should break if the resource gotten via
> platform_get_resource() is NULL already. The later ones would be all NULL
> even if the loop continues.
>
> Fixes: 25518e024e3a ("gpio: Add Spreadtrum EIC driver support")
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>

Patch applied for fixes!

Yours,
Linus Walleij

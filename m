Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92C3A52787
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 11:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbfFYJIn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 05:08:43 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40298 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbfFYJIm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 05:08:42 -0400
Received: by mail-lf1-f67.google.com with SMTP id a9so12086323lff.7
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 02:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wu474up4GmX+0xskt+Mco2FNXdilbTUBXQo4lyZfB3c=;
        b=j0X5JhX4ritT7Kcg7Jx6/JVATsHzntqd2p+xmtwYV+1snQQ4jCgEApitNF1YL6awVs
         lmeNAl3Gbw2kYeMZ6XvOCvN2u0aeiMBbsxI7Z0YMfFa7+tE7cAXYHlqE2JPpk+grL4vX
         MCk03LLX62m09fDgbShIu3HLnNm1U+eqLG3Pvpbja+M8uTxdKGrWuQg4RCidb49rc4/N
         zewacsawz8S2kLMcGufblhSzbQhuiaCGPCjKj6Hl2zWtmR+0EGLAGFn4GY1rVAJXwpND
         /pF5fMsJLtY2TCIL7S6rVHrTC2/2lzQ1m2C1AK/mo2vQT6YjZAvhypG5cEgHnXEPY9Is
         h6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wu474up4GmX+0xskt+Mco2FNXdilbTUBXQo4lyZfB3c=;
        b=qE/H+2cyImvx8OvTIwJTc7UJ4Gi1yT5XFpXtso8MGSvIc5BboSIYHo89VrLy0Q2ct7
         espYpu1Sf1vCkO+LBWF5P+hkfJjlWRUHlH+EI6+q0cCVcKunexCur4rilQH4O8zDbsW7
         8vBsc/OfHIdIQ0y1UBCPdJWHFRondB8HklUXfnWqB4JPd5JG3WjvLcpuSAoZqvyI2iBJ
         o/GBYxwRmMV1cBWuMuzn9M4xgzjlGPPEKLhqi/87jU/oN3M3yW+LO8SNrBSa6V+aemsg
         aiLzbEEDRl6nrK1KSpK2BK9DMULBdfqQNL+zUjoNX3EAuy4VyYcyxjxWTsU9+ph0mi95
         elAg==
X-Gm-Message-State: APjAAAXdQZB7bhRuqAGzYDU38QaT0X/moJQi07CN3zFlKFM2u9vsIz3S
        +yDLLyPz7DDnq2UO0ti8xcSobk2AxiW/eAuKkDgeLA==
X-Google-Smtp-Source: APXvYqyecatcXnlm6onkaiFcOr0uegoG634tlFs6AaqIXfmTRab5kzN3KC9Pu3xgJbcfEsfZy6LEJ3PlYOTboLNU5wc=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr24533491lfm.61.1561453720741;
 Tue, 25 Jun 2019 02:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <1560790160-3372-1-git-send-email-info@metux.net> <1560790160-3372-6-git-send-email-info@metux.net>
In-Reply-To: <1560790160-3372-6-git-send-email-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 11:08:29 +0200
Message-ID: <CACRpkdYGguB=XvRo28hOQOUjysccpXf1DJwS69xn7o_xmuiK-w@mail.gmail.com>
Subject: Re: [PATCH 6/7] drivers: gpio: janz-ttl: drop unneccessary temp
 variable dev
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 17, 2019 at 6:49 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> don't need the temporary variable "dev", directly use &pdev->dev
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Patch applied.

Yours,
Linus Walleij

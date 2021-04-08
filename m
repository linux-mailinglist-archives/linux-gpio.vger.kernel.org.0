Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CB2357D36
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 09:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbhDHHUT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 03:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbhDHHUQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 03:20:16 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFBE2C061761
        for <linux-gpio@vger.kernel.org>; Thu,  8 Apr 2021 00:20:05 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id d12so2221507lfv.11
        for <linux-gpio@vger.kernel.org>; Thu, 08 Apr 2021 00:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WlfKPAVS7s8q2gU837mzcoVOQnjvsEoF10bHzfLXmJI=;
        b=eOLrgTB7YGCxrq2IJntsH0BiX0my6ojbHNgaKR1WLjXrtRQqRgl7AxFIO7ljS/XJsc
         qDGjixKpbSUb01qme7Vuj6+B0Wt/X/97C0BWeVwkY6keatJtXskQDFpfOF+OC10k7c77
         IV8aII8UvUta4yAhawJCYVgrwDEq0JdFzd/KgmJ62ntqi6kGEc1IGBdzVbJG6EqXhMjL
         yf+t9OEIttseT7VqfjidrgcZgeAnb+P4XWwhXQRHQUpjT78v3q+LH9zKETFp4l5oPT7z
         ct/T+vx8OsmzJuuVl+QAHrSibAMVWeCltBdCnIrPD59vcQSEC7QyD6CnmF5YCOMGu/A1
         boDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WlfKPAVS7s8q2gU837mzcoVOQnjvsEoF10bHzfLXmJI=;
        b=KEwSaT4jOfkUwRfIehX9zCAaCe1XG5gL2R41MTyf6NbSd5a5xbG3hRoLyykM6LwP4t
         mEwM+QiQ4BagoL01bAl9JFDcxJGtE4kKqYVj8l9I+icQOM/7UcXyraN8Bpx3SejhzZhi
         lgHgdkoNgWhfJy05P81DPCMZvyAgW8jLpiP9Sy/PIxoLRKhLwPvE91gGBh6jvsQBGtse
         nkObz9TB6KNeyzMvxynr7tLkFMUbqMaBzoAUW4XM8x1fKg/x5VFbBSeoRd1Mq8GTr2+J
         GoXQaC5gYlQT2eXamyNzxZ4upw2FDp4AE9slFOn8bbETNu7zxQcqkvJNn0NvCBrsJt/E
         nlhw==
X-Gm-Message-State: AOAM532OgwBpMAWoG5FAEDcLvB19ykx+F7Augej2iBtZUBAuear+NFiG
        6msi7sBJ2C9ofcFwpN0aQcoI44JKc1CHRDP6NC3jpA==
X-Google-Smtp-Source: ABdhPJwUEMQdSsTxINxDceo8FqB3wCgw7y0bCNTtLfBWCoOlVcvIuy+iIW9x2E2dlo8fmxCrN/0WCtgHovBessU+sDk=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr5381799lfo.529.1617866404340;
 Thu, 08 Apr 2021 00:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210322033846.39882-1-ran.wang_1@nxp.com> <AM6PR04MB54134144991AB746382FCC0BF1769@AM6PR04MB5413.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB54134144991AB746382FCC0BF1769@AM6PR04MB5413.eurprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Apr 2021 09:19:53 +0200
Message-ID: <CACRpkdbh_kn9SjjSqS32m5VNy5k=j6eLCVJDJxmiWVQnYC0ZJA@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: mpc8xxx: Add ACPI support
To:     Ran Wang <ran.wang_1@nxp.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 6, 2021 at 3:49 AM Ran Wang <ran.wang_1@nxp.com> wrote:

> Could this version be accepted, or any comment/suggestion?

Andy says yes, then it is a yes :)
FWIW
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

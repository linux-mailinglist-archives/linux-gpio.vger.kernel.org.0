Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E99458BF8
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 11:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238898AbhKVKEu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 05:04:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234451AbhKVKEt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Nov 2021 05:04:49 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87194C061714
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 02:01:43 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id y5so35286918ual.7
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 02:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l9cKZ85V/kOofYO4Xn9D9NxUA7pbG6Ev+c+SBRxE64k=;
        b=LLOALxzuISMVAodihUK25Q4JlSFsywz0o35JoodfcsNHuAi/YcxhnuLoSsikDHA2q8
         vuvKJm33Fg53FYgXZ0l3oHxqvC1c07qRN1bN+VVgNNPu27GWwUaKJrdBN0Pvg0YTC/51
         oeAuc4FU+XotgfcEOlt3tWq89P5fA05cQrzPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l9cKZ85V/kOofYO4Xn9D9NxUA7pbG6Ev+c+SBRxE64k=;
        b=2htxYsdcls/NZIr60ScGni3nULT/a8vCv1ZABM0PU65YoTfgirl8OTbSCcwWwgDP+X
         6tW98lYkre2lD5alAi83BhhEAJAU5cjtJkTfL7P1WeMQs2sCW2yGChlmqsdYtEbQf/AG
         2LPjdDAXTxa4LcE85n/BxMz7z1SKL5lDBJaNFCw2zJ5M+xbP6+WgjTPnrWs++8Lv3XDl
         5Fb9LfgLdRIbfOxRRKtr9X1xXRPDhuKcvDnA7UKEEZW962VoRJuUHrgbJJbV0wKsK4nA
         P/Jnp9bBRrze3G7QdylO1OagltO6fiy4fRRnvcsqwlgW8cso0FopKF4T87Ic1WgZgQSJ
         Jr6w==
X-Gm-Message-State: AOAM533b4/25rrshIjqq20aT5gHMo7LBUYhQM36PDJkiIu76lNeCuuUf
        p8Z6OmrgN6NQ9MODfBIQD6tvcfIRYJd1+AfHlAQZlA==
X-Google-Smtp-Source: ABdhPJy5AkNAerk25bDE+1X3yRxbzD4HZeiarqaFa2ZdpKEHGA0y9mw2lAcPsMW/rzogSnFGyjA5KtHtgZ/ypDezrsk=
X-Received: by 2002:a05:6102:38c7:: with SMTP id k7mr122446860vst.45.1637575302665;
 Mon, 22 Nov 2021 02:01:42 -0800 (PST)
MIME-Version: 1.0
References: <20210923065500.2284347-1-daniel@0x0f.com> <CAFr9PXmPE_vRcHgPkJp3o=d5HnAV52TFuBe-2hf=hKY8y2=BhA@mail.gmail.com>
 <CACRpkda9j=dQKp+W0iE0xhbuBWAibXHovgdEVkyXHevRnnRtsg@mail.gmail.com>
In-Reply-To: <CACRpkda9j=dQKp+W0iE0xhbuBWAibXHovgdEVkyXHevRnnRtsg@mail.gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Mon, 22 Nov 2021 19:01:32 +0900
Message-ID: <CAFr9PXm7YotmZFFuvqGwfromRGY3YdRkoH4ZC0kvOxqxujy7AA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] gpio: msc313: Add gpio support for ssd20xd
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        pavel@ucw.cz, DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Romain Perier <romain.perier@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, 22 Nov 2021 at 09:05, Linus Walleij <linus.walleij@linaro.org> wrote:
> I think it is usually easier for the maintainers if you don't include
> the DTS changes in the series.

Ok, I was aiming for a series that added something and then showed how
it would be used hence adding the board DTS bits.
If needed I'll create a new series with just the relevant bits. The
listed commits all got reviewed from what I remember so I was hoping
they'd get picked up.

Thanks,

Daniel

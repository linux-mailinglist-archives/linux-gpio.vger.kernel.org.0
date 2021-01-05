Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA38B2EB167
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 18:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbhAER3I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 12:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbhAER3I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 12:29:08 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B45BAC061793
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 09:28:27 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id 4so75423plk.5
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2021 09:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vY/Y9aMYaN0wsHleTVP3/xP8BLngL2dDCR0I1xMkN3k=;
        b=MmrG5k/ZrQ/7VaOiFPe04Q436FnyRHrTdARPR4KL3386eDPyuThCG+FLqEhzI2I2ZY
         Q/B7KRd7cu8TiAbPVU9qnd/eN+knfmZj7HBruWsnXBg9G8t/kiRiuGMSWa+4eBvw/tNS
         r+w8CQmNNfRHxU6JeBBkYfUaZmVV7gUjVcD59lDMN7gqnpFWfY3KYjLV6k8jAOjddHdd
         tq5QPdP9aoYIbvIcI8Hzjio+pbygNzL1daf+nKv3Qi0p9OhkzLs8Ur4wnYGHe/lUGvKq
         LUAzUihT0QyXtHwK+CkL1T8xmWOapnVw0Gv/9T5fhbwVtwjPUFWa/TaoGODCCfNxF3Vu
         FW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vY/Y9aMYaN0wsHleTVP3/xP8BLngL2dDCR0I1xMkN3k=;
        b=JoUChxsb0Qh/QQs5tQAMODAh8WDlbltvlsl1X0uKtUOP0BmQ3kZv98M5pGNcvYGNT6
         k1ycS+8ReOVeFWjBtzjMflfW6J62JYH9kJ6QNyebyIAcjYDJo5abQYLkaGLBZIIH4JrZ
         PbunC3jKyyYXx3mCj189TLCggf6/sucP+MNSQ5rcho8h4dUUjEng2zDMjS+kmHCNzL6c
         v/cuZoYrRglWhWqoRcRXoxHMuD8Oa1UksKmwbs72FOg3kwHzgnPaSO1astTaW/0GktqU
         hQp5YQO8jxwUXnlDu4TSqEkthZIIgG0eO0ah23MGUvjRPe33nlkecKE8saPYneLZfJf2
         pLtA==
X-Gm-Message-State: AOAM5309QTatazdOaqFWv0+NZu8Ms6rL6ilkindefVhE81SrwaKVWHGV
        dirKC+pvBm+iEqX+++UxCpnrgR7/IcYXDQYmDujakZ/6IBc=
X-Google-Smtp-Source: ABdhPJx66hQzH5nOab/t6kDMJFRM6Pn+r9ZZC6/dwsdpXEYOq2AhNx8mWLI8wry57sfPhn2Yci69zHcH4O4YRol5fZQ=
X-Received: by 2002:a17:902:e98c:b029:da:cb88:f11d with SMTP id
 f12-20020a170902e98cb02900dacb88f11dmr367761plb.17.1609867707277; Tue, 05 Jan
 2021 09:28:27 -0800 (PST)
MIME-Version: 1.0
References: <20210105082758.77762-1-linus.walleij@linaro.org>
In-Reply-To: <20210105082758.77762-1-linus.walleij@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 Jan 2021 19:29:15 +0200
Message-ID: <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Disallow identical line names in the same chip
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 5, 2021 at 10:31 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> We need to make this namespace hierarchical: at least do not
> allow two lines on the same chip to have the same name, this
> is just too much flexibility. If we name a line on a chip,
> name it uniquely on that chip.
>
> This does not affect device tree and other gpiochips that
> get named from device properties: the uniqueness
> per-chip however affect all hotplugged devices such as
> GPIO expanders on USB.

...

> [Dropped warning for globally unique]

> + * - Allow names to not be globally unique but warn about it.

Is the second part of this sentence still ture?
Maybe I missed a warning we are talking about here?

-- 
With Best Regards,
Andy Shevchenko

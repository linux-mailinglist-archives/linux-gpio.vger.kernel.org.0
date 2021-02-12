Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46783319C17
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 10:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbhBLJrO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 04:47:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbhBLJrJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 04:47:09 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39CDAC0613D6
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 01:46:27 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id f1so12235995lfu.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 01:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i4ca59SdGEVnFSofi3ZXoX6JlgB2eaV3/YrXqwVKM8w=;
        b=Yy351HLBZUge4sG9PBG2oLCjXOrReyEUMGZdK7mNji7JwMOZqqljspFEyf0HEKVnDc
         ZkyxPuWz5lXXja33P/NlPIJ1NSZGsATcWJKqtMtded81fkJO3ebDhCrDsWb5Np3hwtGL
         WBzhe6ZboL8lBI0ymtSQTMaQfMpmzV+MRwTEOEQw8uCiUwDC3woGumorSBeK6WiQzcoU
         8YwJhBQQKfJAF8+Np3v/9GniuaaJm68pfN/arA/yqwy2xeQnxLIpWNjngsbpUYPWpiqs
         m4EXb4OfhBGb/HP4e9Iql22pw0jzeap/xgK6NHLr6KTupqokL+Wywa/xLc6IOUUmmRDd
         mBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i4ca59SdGEVnFSofi3ZXoX6JlgB2eaV3/YrXqwVKM8w=;
        b=kzM2WM7j7sbORYZqQBxWSsVpAnVKdsYwJSrxjWcNaoAIN77mgEUb2skgOsDzLYI4+0
         /5xt53qyMJWgxeLzgKFM9CjhVSETZAU30uc+WOJ7thIbcQ31PcBgEx9KyMzRQTRIQIco
         qTDFmnxyy6hXtbB+L1E5Of1f1MGG7Q53+uBRhlKeuow46JXueKUhs5Ex/q6nEhBx9fhh
         wuuj6zBhSfWuPYDZzSi+R2O4LJwsN+ooY1djz5757xZBN5pxDcGRyhmcnFxoKxT+g6/0
         rE4cNKf5GeQVFT3kib/PEeZ7ohmau26j6l4YXA+LTJvwV4yA+efDIb8H3FAKpsS4N8Yi
         OClA==
X-Gm-Message-State: AOAM533H8cst3Qsxz9WBWmPtqMM8LjIHXmkxTEjXeWpszXhquJxO8Mu2
        ziHI6uWMrfuO0/8nBRBcWD3luUeGiz6v1zZS8J/x4Q==
X-Google-Smtp-Source: ABdhPJwIYedS7M45SGCJ9oNwPA/7hLc3LJLJFqoY2yYENbG6825pEXbq5JXjPw2/Djuva+5uHhN7aTJfuFaSNzpMinQ=
X-Received: by 2002:a19:70e:: with SMTP id 14mr1094188lfh.157.1613123185577;
 Fri, 12 Feb 2021 01:46:25 -0800 (PST)
MIME-Version: 1.0
References: <20210204125718.1646082-1-geert+renesas@glider.be>
In-Reply-To: <20210204125718.1646082-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 12 Feb 2021 10:46:14 +0100
Message-ID: <CACRpkdadDRXa=Hv7dkaTL5pU5hYANQicKgTUhE7jEu6m81Hqvw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Group tuples in pin control properties
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sean Wang <sean.wang@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 4, 2021 at 7:02 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> To improve human readability and enable automatic validation, the tuples
> in "pinctrl-*" properties should be grouped using angle brackets.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij

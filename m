Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 696CD5F3CD
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 09:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfGDHem (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 03:34:42 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37603 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfGDHem (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 03:34:42 -0400
Received: by mail-lf1-f66.google.com with SMTP id c9so1791681lfh.4
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2019 00:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Hg/OzgYff2zZVyVZhRe3CSo4vz7vDcSjMj5u9XKRBc=;
        b=fvw4InV7Xrh30ZZSoTB30kuoVn11+FBcGxu8IajJvWwcQPcAFRB8+Wb1fAbfsCP3Dd
         i9ZXFeDK2fhOkMNlG1R9xRC1dYRODxk+c3ifPmqPvXcQ7TgpfpnJA9DJ149w2PGd1opE
         bruSfRy6No3axplr2CN/Bo/cL64vAxZgfORvAUVtvCr0j1qxgXq6carH4QgxHzPcrjuJ
         H+r1Kwelri9T2Q0irWD1ctZ48qB9thzhwhnncgEntj+u3G1IB5+nMueCD1re1HfPtwuM
         gkp9DaJiYjJvxPJoFeP/rQNb/zvLtJ/uRnfdzglEwkw6lK882UI0Q0GC/Oatp2vb1TmC
         8Wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Hg/OzgYff2zZVyVZhRe3CSo4vz7vDcSjMj5u9XKRBc=;
        b=ipg9/Ta8FgW3YFcVp0utwvKQn0LqhmN0Ahgps1E03BpPworNFJSt6Bd8AExy1gzO8+
         GEYxU/ILn7WsknpbmtiWbWNpYt95ijcOc3evCPevgEbknHC4L5EEvsrS3bnsn1PLY4+I
         kybMwn9cCiuIFItz7amak2WLymLf2eBcQGHcP40D3S6tawPLInLJTSxDimqybJj2uaHv
         S88u9ZK5/Vhs/n2dVLL0I6XpK2w1ZlI/ycheMa+iB0Wtlep1W3x/q8yHNtBgZY1XAT+2
         qn5jNv15msQGk344lRzJOq1UiHCcY4tPr6bQZCBPvviVA6fZkF5pTaq7GIQ/zCoLSPyp
         /rrQ==
X-Gm-Message-State: APjAAAWY/sCv2a+bSvP46ajIpHI6wH9M7kozvMCWdYgGRe6lKxNThyb7
        SZnraQp1fDDevALjxm2/KFXiCmViEVSi3xvpuvD6Sg==
X-Google-Smtp-Source: APXvYqz9jKSdQHqdcCLr4daSvcS7ZzdPvZymwRQWhwjjTbjz949nTsYJRG/zvKF2/lIB1eCk1XVePn0LFINzCWM3Tuk=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr4234270lfp.61.1562225680360;
 Thu, 04 Jul 2019 00:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190701142650.25122-1-geert+renesas@glider.be>
In-Reply-To: <20190701142650.25122-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:34:29 +0200
Message-ID: <CACRpkdYRcmp=k=v8eQ9gjhSr13uoXQqCBKf=Fc8LWzKExhs_ZQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Document new gpio_chip.init_valid_mask field
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 1, 2019 at 4:26 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> A new field init_valid_mask was added to struct gpio_chip, but it was
> not documented.
>
> Fixes: f8ec92a9f63b3b11 ("gpiolib: Add init_valid_mask exported function")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij

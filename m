Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FCB2FFF74
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 10:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbhAVJqS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 04:46:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727421AbhAVJpp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 04:45:45 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0C6C061788
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 01:45:03 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id p21so1564744lfu.11
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 01:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1pDRquJVrfnNoeJ4upSmG0vI7kekYkwTVuEqcSdN8tQ=;
        b=sJeUKGVC5/NEjTGf1NfpOths4SV6P9SSv9PbKaxwQ9RCKQygPR0prnK78CrrbSk5pq
         +ybO6K99AjttqTa5IesXQd1VJC7l6o7O3PC8plQeu0P+UoWE2Xk6r4/kJHsElWynoAhl
         gIWT9R2vMN8kPwpXJA16nWK9SmOPZgmon+yZgElcgU0p7qIeBF1SPcs/noDpcdrinkgG
         1vmbt4s/7REBxEp3wOhKoc8BjAWz/KsjvgJqOMWeITxJdxozt9QQG9S7hFJMFcuiqpUP
         /BZcar8RNZXxzAQyTBOraGgNFhVEFmZb8K1lo6Jz6M7NnnUzmjaOlexlizhJW3ECCorA
         vR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1pDRquJVrfnNoeJ4upSmG0vI7kekYkwTVuEqcSdN8tQ=;
        b=VFj0BjmH5VpaswwnDCm1ZdoMQZHlDbeGDUWurjqbYuxnpGFaiA6xhV0Ov6J5yEynZ1
         Rxz2pFRhlhrIMXysIjGssHjmjc0pTE8D8yBOdA7yui45co/dDfrWaurfdJxKMIwzJfpj
         ukw2hmA6t+s5V6kqIY8yLWIqfSxre0ZRTOQhsNGAIFDwWvyrehypXuH6tgbHEEwrr4+E
         zsAs04Er8oDvq7VL0BvIZknl4U+gMtLQEZTwiGZFLEzyAvf8DgGjQqopjziedNzPaHrP
         HJ2zlLk4Tdjdi53gNr4F2BnIt1sn2KQ29FzzgJkPWtWHERuseuth++6WD+QqmtvAgsDR
         5lUQ==
X-Gm-Message-State: AOAM532cBZ17cAMu28Eg1QHvtL4H4nAJxVFO0bqVke/qra2w5mk9YO/B
        MWO7ngflho4meV3EqbVABGACwxZYGm9WsriqZXU38yAKEpHDBI86
X-Google-Smtp-Source: ABdhPJzlNIoTt5bK7+X26R6ooLH4qz3LfMQ9Ge6ctwR4g5lNJ9GZZ0yxT12FiosySOH1lkTmCGzDAg0zKZAWH6BWMeA=
X-Received: by 2002:ac2:5597:: with SMTP id v23mr63199lfg.649.1611308701615;
 Fri, 22 Jan 2021 01:45:01 -0800 (PST)
MIME-Version: 1.0
References: <20201214155440.2950-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201214155440.2950-1-wsa+renesas@sang-engineering.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 10:44:50 +0100
Message-ID: <CACRpkdY71c=Pyv6Gsw9D5U8aRgQ1kx8QJ0RJmUyb8CLtC2s9Cg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: Fix typo
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 14, 2020 at 4:56 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> Does this go via doc or gpio?

We usually apply it to the GPIO tree. Bartosz is handling this
right now.

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74568356CBC
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Apr 2021 14:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352492AbhDGMyv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Apr 2021 08:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243606AbhDGMyu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Apr 2021 08:54:50 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB52C061756
        for <linux-gpio@vger.kernel.org>; Wed,  7 Apr 2021 05:54:41 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id r8so10789452lfp.10
        for <linux-gpio@vger.kernel.org>; Wed, 07 Apr 2021 05:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DyrrqTEJnCX3WBmtjS0+k23mNkQbpYSt2sHU74RBszQ=;
        b=q+0nm+oHqxkrb4isK03UMmiycDLW9MWOdymRUsLDo1y9sBlbGVetuMi9YTGDuiCJAV
         b+TaFDGd0EtQA2Pi168wjePrZBidNBb7WG7qGGb8chdqEMJqc2quWLFhJK7Eng29Dp0H
         r1VZDYApy8MqZaB32zLUxthiNVgm5VkqX9wTMn9/8tNmJSzGEvzG90EcyATLPkUhkII5
         pEwq3juyIFi9wTEBWC00VjmlosJJwndhhGLiAcHJpNX/OnDmiDR7XDMqTKsuyARBVjfy
         CVy4OihbpsewzzErA7J8mUhD+/hLZ+Cogxo1gVUbzG0tCATycfn6Z3bnjRkZbSJ8GQ+X
         6Pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DyrrqTEJnCX3WBmtjS0+k23mNkQbpYSt2sHU74RBszQ=;
        b=fAYvsb2/zPunDtQJSG3i3Fsa++gpe0ojn7awn3fJIX+k41SLKQujgrPlXgmP2qoGog
         5KzgOxYu8yHs/c1N5aMzJkBQhgC0TqPXCmC0oH8XYHcD2Za6mEqCd1A9skYjI+GwZ2XO
         qt2tXSCD1WOAhc+GIZm2nQFvWQ756rURkERnfmRridBsrC3j9RFSWfmEKWgUJ7aO89Ze
         Qrpm6bGoXzcT+gFzuyoQ+yoYFejo7e58QRMTHjg24er9RsDAfReuDq9B2bF6kFrKPqTL
         HuFs9opJXKGJyXKcI9FiWXguLcfEvgnGpg9ZEGhGCtfoSr6q+sgAUvFD8DmVWCO/P8yS
         /JUA==
X-Gm-Message-State: AOAM531T1gQnFJtqG/EWPCNygdq7QsloQYTmqyfgE8OFw29qWcG+iPTZ
        sSuHGzVH2MtbATcKVSDanP4MzVXuAd3Wsbra08bAqg==
X-Google-Smtp-Source: ABdhPJwMRBhHvSSSEJDQMz763gc+8nCyFT9uCOePB01xTME+S9VMW3q2V2TnoSV8wdpj1/u/vgMYbE3xDZd8AEX71UU=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr2493455lfo.529.1617800079596;
 Wed, 07 Apr 2021 05:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <df145e77bd124721f28cbc58fb3c58c138f13d86.1617365710.git.geert+renesas@glider.be>
In-Reply-To: <df145e77bd124721f28cbc58fb3c58c138f13d86.1617365710.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Apr 2021 14:54:28 +0200
Message-ID: <CACRpkdY0zRSXv3A-hKP=GCYsWTJYk23tJiAmKmoECZ0zyUO26Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: fairchild,74hc595: Convert to json-schema
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 2, 2021 at 2:20 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Convert the Generic 8-bit shift register Device Tree binding
> documentation to json-schema.
>
> Rename from gpio-74x164 to fairchild,74hc595, as the former refers to
> the Linux driver, and not to a hardware name.
> Add the missing hog description.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

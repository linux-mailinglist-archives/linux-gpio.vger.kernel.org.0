Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15546397104
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 12:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbhFAKMm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 06:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbhFAKMl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 06:12:41 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569FAC06174A
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 03:11:00 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x38so20886905lfa.10
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 03:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mXZO1IaKj8e+HsJJD6dime89CXjE2mtKCwPbk2wFi1Y=;
        b=PAmnyLWW3xVrnfCXBt8ZAGO4Q6ntqnhqG5dYV7hJSuJcjfz46+Et8k+ZJPCM1BbZ68
         TG30+Lum7qdt+KFfaIPLppcZ+cC7Hjl/4YvZUOC3YvkrnsemTsWbKM3utq4ecrfqzGnp
         wG6rWxR1hkbQxRl4pyjns2ASVGp7qMPah2XtXfT2HgS24+nZPRxxUdxxfozIckySzQQu
         81jHqhEgQE+g2+cEl8S2lVtlysJkwMtH5p3P9U6t9vA+SxFRg/HGzbmH4lsg2Gb1HNDe
         kUapQFMJTmTP3FxH1qolW4NglYaEkjjk/P4s2j4kORb+HN77y/+xh42P06B7dxPuQ5LN
         tmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mXZO1IaKj8e+HsJJD6dime89CXjE2mtKCwPbk2wFi1Y=;
        b=gBLMisUZ7Oix38SAbGMxTqgj6tI7nM6t/k25WtLPws7YD8YMlEB/KiwT53ynbXCq6k
         GogcZeg1asZuz7yFyOhDTr6qC6SQetgGxwJVcslh5BGzSHYgm7XMdWuFReVXxuIbK59I
         a3v+iozB2gXjf93CU/PyzlChiBc6kLyosN5L/UJ39qxvcTOV+XonvlrRBOkP+iyhPpZz
         yS5ShTp4avH/CyGd1xZKvFxj98M5Fql0tenKW6iTymzl0rvS1sgX2232VyyM/zfv++L7
         wajxU9l5akvgfrmiMCJO/7Zm3HtIrLd9vcg5PjO5B2Yyr1gU2RKIVHEh1K8U8664aw1I
         IKNA==
X-Gm-Message-State: AOAM532F6Zi1VoiXsMWUL6KO/n8Cw7uUh7XbcdYgwsQISMyPIpEvrDqi
        W8UfjllJ79wY+tmhTV83KDX1xZypko83Oj/8PDGgRA==
X-Google-Smtp-Source: ABdhPJwadJG1Z+DxbBmxKxvEQqSH6jDHpGXRXGCT9utnR1hgTl/yCZLnOQU86Xt7cd6GKg6JmptLeQ8X5upF3QJ6nq4=
X-Received: by 2002:a05:6512:11ea:: with SMTP id p10mr17616726lfs.157.1622542258735;
 Tue, 01 Jun 2021 03:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210530161333.3996-1-maukka@ext.kapsi.fi> <20210530161333.3996-2-maukka@ext.kapsi.fi>
In-Reply-To: <20210530161333.3996-2-maukka@ext.kapsi.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Jun 2021 12:10:47 +0200
Message-ID: <CACRpkdbD-AZrZrHZ0mQm09TV6mMWunmBF1sMLgaDFUHxTV+R5Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio-mux-input: add documentation
To:     Mauri Sandberg <maukka@ext.kapsi.fi>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 30, 2021 at 6:16 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:

> Add documentation for a general GPIO multiplexer.
>
> Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
> Tested-by: Drew Fustini <drew@beagleboard.org>
> Reviewed-by: Drew Fustini <drew@beagleboard.org>

Overall very interesting!

> +  pin-gpios:
> +    description: |
> +      The GPIO pin used as the output from the multiplexer

This is not a good name. "pin" what pin? Choose a descriptive
name, like:

parent-gpios
multiplexed-gpios
cascaded-gpios
fanout-gpios

(My order of preference.)

Otherwise these bindings look good.

Yours,
Linus Walleij

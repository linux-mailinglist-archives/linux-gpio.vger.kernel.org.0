Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13F8755AD61
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jun 2022 01:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbiFYXN0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jun 2022 19:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233695AbiFYXNZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jun 2022 19:13:25 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D23263A1
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jun 2022 16:13:23 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-3178ea840easo54597157b3.13
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jun 2022 16:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RB/drL2jPkC/BHLwuvW3KgnCGQoiP4Dk2nMg08ERmlU=;
        b=m+5wG8Y80I+Zgyndrw0XNPe1XjoYUgF0DssPT+brywQPH1UmE+pW/+1j5kMQo0JiFM
         T6X2EgO4wJUwq2QL35viB2AJD0k4BqW0tFe5ouNyujWX8M1xX7uqArzsMSRL4IFdzEEj
         qxHxNGnwydiI+iA4mxj/rKSaEPRX6IXnjJcpL/jma2RRnm7ArJfL9Mc+Xq9hF2FRNC8f
         3R4DbfJqnWFY45j8oav0nxNUs0GujsR5ifwpDokQ+agMysL5rBx0wr13edUf8n+YzEMT
         K11O3jNMUP76SdKI1Brt8R4xgrBqEuQiLEmgFzH0Whtl+ZlwyrJW4wv+opVt9QhbNVWb
         4ZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RB/drL2jPkC/BHLwuvW3KgnCGQoiP4Dk2nMg08ERmlU=;
        b=5gZqvFsUGXu0GYcJjnX2KZqD1pLM1erXlgKgw+XeEiHg+G5lmX5MGYFhJR8p/+mW6H
         EatQ1znYTnDcwk2eCFdCKW9IlS5/9lbBE9/tA0k2FBAtkziaEkT7c+Zs3bjSBlppZqG5
         b8ylVZOsR+loMChhuNmsI2PI8q9lzYLEJ9qJhi1zo7ypw7mWiy6+e+Z610lNNMZu4Kwc
         +FeryTP6SvlfAmy0d84KPpykEywcxqt/VRPo0I9XBD3TeN1RoclUmIJLDBhCeTRkpXwJ
         uzj9hEkR2oDyqA2XDUC/z16jD18iHgv+tIxeS1qztXraZcv0M7q2WO+r1M/DtffGi2CN
         HnQA==
X-Gm-Message-State: AJIora8Y1QZXXUFyGwu3YOx8j1bX51ugIkiV20GNQTNbuWJOJwi9UtPN
        IingG8FWL6R/djzrqUQE174vVqtWolQSKziv25r8sg==
X-Google-Smtp-Source: AGRyM1vngj/r/TFNbWVOFD7Q8HDabHFBymIy0vv6Yi6N9SWcfst9mJzokCXanL3lEaH9PZtjXZ5Lynz6jS4nhXm/clg=
X-Received: by 2002:a81:d05:0:b0:317:76a1:9507 with SMTP id
 5-20020a810d05000000b0031776a19507mr6667294ywn.151.1656198802761; Sat, 25 Jun
 2022 16:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <5d0f18b7210c9fd4d9f01d0f8464f7a9701dc366.1655302107.git.geert+renesas@glider.be>
In-Reply-To: <5d0f18b7210c9fd4d9f01d0f8464f7a9701dc366.1655302107.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Jun 2022 01:13:11 +0200
Message-ID: <CACRpkda96-y9cWnoG4yu-rPAnwAnofb3DbDqkSjwuEg3G_m5+Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add pin control bindings defs to Pin Control Subsystem
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 15, 2022 at 4:08 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> While the section for the Pin Control Subsystem covers Device Tree
> binding documents, it currently lacks DT binding definitions.
> Add the latter.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Already got an identical patch from Lukas Bulwahn but thanks anyway!

Yours,
Linus Walleij

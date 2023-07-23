Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2CD75E485
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Jul 2023 21:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjGWT0j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jul 2023 15:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjGWT0i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Jul 2023 15:26:38 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68988E5B
        for <linux-gpio@vger.kernel.org>; Sun, 23 Jul 2023 12:26:37 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-57a6df91b1eso44690027b3.1
        for <linux-gpio@vger.kernel.org>; Sun, 23 Jul 2023 12:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690140396; x=1690745196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rx4Cx9kXF3kLeSuUq0IkgM0eQf8d+Mb1ipAOzpYwQXQ=;
        b=EoiN8KHmJW9n/4AbSJSsCypgYoFAk5VpBw1Yzrrwcuo8BPUwtmrTKXfFIuDmZY1R+1
         bjZwDCh6zoAVnEtZGzaDl7A57xbYE4ut7ZgSuGDIUzx+5RzA+5M9DrxC81DGvgL4Xbrw
         xzcSepcC1IuQ4FbSXsDGLahNQ1mfyy03Yb1Nzn4/V0T5OYQ1o8LtYtrWCu8Enzo5SxDm
         axUDgAGyJF419yLpwyWBGujg+bX+obSJqRa8axs/C0FOKRtSOZCUtzuQEMNvLPrs8lrq
         dHFTULbpmdZz6Nb6V8qrSSUCwhSaTJ7tP999T5tK+RZmNLM+UhTdhsQyoWDCuN+33R4J
         OkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690140396; x=1690745196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rx4Cx9kXF3kLeSuUq0IkgM0eQf8d+Mb1ipAOzpYwQXQ=;
        b=Goos2OYnFEgTXFbCnX5c3u4m733uKB26RI33bW2yX/dFTY5J7ZwpXNjP6Jza6G9nz8
         y1AUjnSJy4WCqR9cxhAKQdS6xmXpg+76oDPQlxywG1MFT8fE+oCIEly8vUNexT8fnAab
         6Cf1nIIbKg0gYdt7zdparAZ0O/jEfBUQJFVWtlL2q2DRCqsWUCzYj6G0df7FigTbLrhA
         BwAGqxpWttrXa7M/s5JS/gRVZkjj5w49NVllkCh5rWYmraJYhW9Jly0oZiWU6ERR9A5t
         IVThGY1TZ1HStDgXH9xH4ds/qjkgcsvdBwFV5U1J8qvOveuLWUs3YGdolSEIdmJFE7Wl
         tbRg==
X-Gm-Message-State: ABy/qLa6rPDatk5e5r2gTw1Bzu/WOGu3SMWUZsAI8CifsFO7jiMSK7X6
        UUiZXsswKlYF/9pXQG8pAyEHQuDiWQrj54vH5zLN0Q==
X-Google-Smtp-Source: APBJJlHZcs6nr5ibsR4qxHafZKtxDvVDDW+tGHfnEwvqgzgxY2faqK29OV4ASTlnKdVR9d8Wj1GpM93jrnwGLU7oPnU=
X-Received: by 2002:a81:6c43:0:b0:57a:8de8:344b with SMTP id
 h64-20020a816c43000000b0057a8de8344bmr6987487ywc.4.1690140396707; Sun, 23 Jul
 2023 12:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230721073214.1876417-1-huqiang.qin@amlogic.com> <20230721073214.1876417-3-huqiang.qin@amlogic.com>
In-Reply-To: <20230721073214.1876417-3-huqiang.qin@amlogic.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 23 Jul 2023 21:26:25 +0200
Message-ID: <CACRpkdY4qQqt9mAo8rBGk8ZC4hH_ext_qZCyenEDs2HLVzXXYw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: Replace the IRQ number in the driver with
 the IRQID macro definition
To:     Huqiang Qin <huqiang.qin@amlogic.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 21, 2023 at 9:34=E2=80=AFAM Huqiang Qin <huqiang.qin@amlogic.co=
m> wrote:

> Replacing IRQ numbers with IRQID macro definitions makes driver code
> easier to understand.
>
> Associated platforms:
> - Amlogic Meson-G12A
> - Amlogic Meson-G12B
> - Amlogic Meson-SM1
>
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Feel free to apply this to the irqchip tree.

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE9235305EB
	for <lists+linux-gpio@lfdr.de>; Sun, 22 May 2022 22:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350485AbiEVUqc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 May 2022 16:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235481AbiEVUqb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 May 2022 16:46:31 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B8D186DC
        for <linux-gpio@vger.kernel.org>; Sun, 22 May 2022 13:46:30 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-2f83983782fso129257997b3.6
        for <linux-gpio@vger.kernel.org>; Sun, 22 May 2022 13:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cyojD6n8i4EzxUISCBdDfpa/iegMOVhEame9/6yeCc4=;
        b=c2yRe1R2iCspNJMu8fSP4l5Jz+ZxiGtVqnFGzGb6idOS9rlHADsVkGWkvrcNIKP7wr
         9RYLPJhGxNw0BsEU+9Wz5eKzTEyMb5uTxPJyonyl9iJqYMHSetvzKT3PtPGCzsOKagUr
         D8e1kIXHGqszuUGa+Rd5ZBVOh5hdO6E0PCXOO38lwFfTwyBV31vCGgYCkMKBUQ3mR0Bp
         V0ASBqLpSL0AHqb1bKhnY9Zb7FJA4IzKCB7JV1chFeAxbXG0m6lLEn2Ps98AHyZBBOBQ
         5JsjhuMptdrFiFA2knd2GsFTdS41sq+dFroJ11UQeoOmHAub+dZvqEO5o0UUGWjCfUTV
         9WTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cyojD6n8i4EzxUISCBdDfpa/iegMOVhEame9/6yeCc4=;
        b=drwOtEhwJjJvzG01SIt3teGSTIhC5SFzj+kx8n+aFu7v7+rV4U+JAGmI/2hnuDJQ4N
         t+iG6y/PFDVt6+cQohE1avc5IfqtwdWEnd0ZcjBqQJm56jagQMUn1exygyiKlhd9kbA0
         Hezj/EY/hU2Q11vmf9owbleYstzVFOT34S7HTR9s4CxI3IetesSZyxpy3RtW2H4K6Jfb
         6UfinFHUMEA7UvhxL8hAphDwbFa9IakoA4JznrrQkazzXsVxWQZijUl9TgrbR0WR7Viz
         NlufiyI92QlEcviUF+d0AvSaPYOHCal3iffyhdXJeJfl8NTzBYe7o7ZzQsfYCEawSatZ
         /+oQ==
X-Gm-Message-State: AOAM531ESpoToGgPTjFLAk4+/lWqcGbTD7rtHw2YZtlpI6kqNKMkBonf
        WODYr0ROZInlSLsBDBQ4W616B1Yz+Op+qJJNkDn//w==
X-Google-Smtp-Source: ABdhPJwyLkMRtzNRYSmeJ4yT/Fvvn7Nuu3SKjR6DAAZVsJ52glL6OQXAXga09V/gacjOX41kQVFMpLLZcQCzycx7zIk=
X-Received: by 2002:a81:99d8:0:b0:2ff:f419:59aa with SMTP id
 q207-20020a8199d8000000b002fff41959aamr2086655ywg.437.1653252389296; Sun, 22
 May 2022 13:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220520052021.25631-1-zhaoxiao@uniontech.com>
In-Reply-To: <20220520052021.25631-1-zhaoxiao@uniontech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 22 May 2022 22:46:18 +0200
Message-ID: <CACRpkdbTq2HD_8c11bngEQOA6ZFyVY0g=JGqbCjG1zYVrF_xtQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: berlin: bg4ct: Use devm_platform_*ioremap_resource()
 APIs
To:     zhaoxiao <zhaoxiao@uniontech.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 20, 2022 at 7:20 AM zhaoxiao <zhaoxiao@uniontech.com> wrote:

> Use devm_platform_get_and_ioremap_resource() and
> devm_platform_ioremap_resource() APIs instead of their
> open coded analogues.
>
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>

Patch applied!

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B340856CBE7
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Jul 2022 01:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbiGIXK5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jul 2022 19:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbiGIXK4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jul 2022 19:10:56 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4180117046
        for <linux-gpio@vger.kernel.org>; Sat,  9 Jul 2022 16:10:55 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-31c89111f23so18657037b3.0
        for <linux-gpio@vger.kernel.org>; Sat, 09 Jul 2022 16:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5ZGD3Nxzak+m+QGnrxzoo2gB9U5G9VM4dOnEf9Bmy7U=;
        b=WzGK59rAd0kGgOWQGU99VbIINl4q/V6sJL3XUNXDeK9/BB/dUnyDq1yPOI9iTA+RiO
         Z2+w1K0jDq9lAG/HMgEuucw2yGq2nEfTg16Gelpbjxo2RFH56foVZa+HTNhTUbnDZ9tL
         A91kxP0e/6tU5r3tEXazJnqXcW2nHDVDXSMnA7LLZy81z1bPqt3M8hAAW9J0PuKfpU4Q
         HUQCmpLn2lAwsN0rq+wWgx5rLQ6ibKD0uZRxVsZefzUFpvJM0fKqr12Jr5PZcMYqjuSK
         G5PIIcuhF343OYi3IwbK3Cbw3GFhhRaQ3WwoPcwAdyVb708fAZX3iZ7HJr5Ie03j5eEY
         ttwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ZGD3Nxzak+m+QGnrxzoo2gB9U5G9VM4dOnEf9Bmy7U=;
        b=ZRC/dB71Dd82/hVeZ+qREZMtyr+jBC00kWqbPv4HtGDEDAv34jMkpoCMe0S9BP5RQ0
         HSPc7y2DdmTMXV0rt/hT1LL7PY4X2JR4Tg1RKMdSDWpp8362weU8RiKAn9PCyLBQA2ri
         ebk4GaCQ1BbPrW8wEG2FnkNQ19RQXIIGQLsZzyiIFf+pdMI1W2ni9G5olOWlHdVIHMUD
         MMQu9p/a7ggOH7ESF/ULAIk8GliVU8zhUdFM82M8WFduXOHmvwNbqEcSpszW5aPan3g4
         ufgbzHSiSuuHXgRHLAXzt8lDFP/kRAVfTaaMYL0yTBY9gF3G556bB4byLKss9gIsKB8V
         h2/g==
X-Gm-Message-State: AJIora8Rxt1hwU2MrVvw2FhOe2ZgahsBwhxbMKje8FeEJ1vXJo96athZ
        xva66YM3notc1QzQC07VQzfVRVNuZh21lpZ1PVRUxH7wF48=
X-Google-Smtp-Source: AGRyM1u2bZTCoaP7e+ruJbFGwjKxwCPNaV/c/pTS8xG4isrq0lKHAPvjOotgkvgXtKXtETaUYjlTg1vAx5GliDkEoio=
X-Received: by 2002:a81:34c:0:b0:31c:8b37:6595 with SMTP id
 73-20020a81034c000000b0031c8b376595mr12357507ywd.126.1657408254533; Sat, 09
 Jul 2022 16:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657279527.git.geert+renesas@glider.be>
In-Reply-To: <cover.1657279527.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 10 Jul 2022 01:10:43 +0200
Message-ID: <CACRpkdY2caHo6J9GwuX9R1JrCLQYLuO7YTWT5MMU6RD+NuaRXA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v5.20 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

On Fri, Jul 8, 2022 at 1:27 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 5223c511eb4f919e6b423b2f66e02674e97e77e3:
>
>   pinctrl: renesas: rzg2l: Return -EINVAL for pins which have input disabled (2022-06-06 11:12:22 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.20-tag2
>
> for you to fetch changes up to 36611d28f5130d8bb9aa36ec64d4ebcd736e8dba:
>
>   pinctrl: renesas: r8a779g0: Add missing MODSELx for AVBx (2022-07-05 09:12:37 +0200)

Pulled in, thanks!

Yours,
Linus Walleij

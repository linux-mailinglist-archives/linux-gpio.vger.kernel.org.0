Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9066AC0E5
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 14:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbjCFN3L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 08:29:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjCFN3K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 08:29:10 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49728A24A
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 05:29:08 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id i6so8062374ybu.8
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 05:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678109347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wdQ6uUXw6eLlqKNPq8Dwry7lvb1Ttr+GrRVdC8+muhc=;
        b=l2ZAfX/DEvwxQ2Y8xyQQKr4rCOExDvn8sOpBNCt5+XjYpH0mB1IwSGmmArkULngJme
         gKXkybkiivT1JpXF6SmaEKUZpD9Zcu4jxcL/oe4mrgpjywjTzaVQFvH7iP1+dXjpnNES
         MsnXD50DsGXnXbq1kBoSIFTZx1xNSd6BWvbG6OHiqwkraELFxDn6HuLb8sc2Vaa0fJ2C
         glFElm0T6lcrhpeRzfzpP/Of3PWT0egmhJQ1w9lZtGiKivcWdwdCBAW9k3erryYOFT2U
         8TRNoZT5mW+P/p1V/B2x8iky/xL5DtD0L6WBiilMuOiJKAY/Me5BM7bRKumyAksmRn4f
         /3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678109347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdQ6uUXw6eLlqKNPq8Dwry7lvb1Ttr+GrRVdC8+muhc=;
        b=pKU0uhEtmz8jnAXFTHIWSYHY1/O/DzZXQJkUH1Ri7WvllA4kYx43AOkg7hrZiTDTQa
         b0pGThq7LiBBXS8WzWHTaUYlP7Zvku6TW93/fftyVmIB7cPMG7071CiKbQv4xW+IgQgh
         w1exmIyd5b6vVzFIKWeSP3Z1hFxg+7wK8grWdEUNkKY52fqBGYtq7nwew8QBoShy/ymB
         G5BrrBL3ZYzIjYw62VB5/eK/GGNiG7Bngt3Wl2BdRcEaxEnqPr1kJTavCYVl2Gj2zcEQ
         UtqFx4kbg2+1Qm/IEv6qVYn1LcXm8LcqCvLwUOaY9BSu2/AvXryFNnwP61/iQG0sCXXf
         NQ3A==
X-Gm-Message-State: AO0yUKU7AGhm/vXbD3cqXz5dVQg6eE7uIfDQrvwNrhjPkqXXHawdqj0y
        nrUVlOeyYtAwNC/56lzSLMY2gRE17TBL10y+C105Xg==
X-Google-Smtp-Source: AK7set+OiQbj6mLBs96xasjZbpT5NcfAb8pHkprzWfrKaEEsFheZ9Lhi42qtELHmboMFGuSw2/wd+NFyZSXiKZJmSfA=
X-Received: by 2002:a5b:38a:0:b0:ac9:cb97:bd0e with SMTP id
 k10-20020a5b038a000000b00ac9cb97bd0emr4934384ybp.5.1678109347288; Mon, 06 Mar
 2023 05:29:07 -0800 (PST)
MIME-Version: 1.0
References: <20230220023320.3499-1-clin@suse.com>
In-Reply-To: <20230220023320.3499-1-clin@suse.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 14:28:56 +0100
Message-ID: <CACRpkdYknZo3Q7_CeSkOL2XwwAmKERskx24o-toaVy=rs0Yf5Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add pinctrl support for S32 SoC family
To:     Chester Lin <clin@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, s32@nxp.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Larisa Grigore <larisa.grigore@nxp.com>,
        Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>,
        Andrei Stefanescu <andrei.stefanescu@nxp.com>,
        Radu Pirea <radu-nicolae.pirea@nxp.com>,
        Matthias Brugger <mbrugger@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 20, 2023 at 3:33 AM Chester Lin <clin@suse.com> wrote:

> Here I want to introduce a new patch series, which aims to support IOMUX
> functions provided by SIUL2 [System Integration Unit Lite2] on S32 SoCs,
> such as S32G2. This series is originally from NXP's implementation on
> nxp-auto-linux repo[1] and it will be required by upstream kernel for
> supporting a variety of devices on S32 SoCs which need to config PINMUXs,
> such as PHYs and MAC controllers.
>
> Thanks,
> Chester
>
> Changes in v5:
> - dt-bindings: No change
> - driver:
>   - Refactor register r/w access based on REGMAP_MMIO and regmap APIs.
>   - Tag PM functions with '__maybe_unused'.
>   - Add mask check while parsing pin ID from a pinmux value.
>   - Simplify s32_pinconf_mscr_* functions.

This looks really good any no more comments arrived, so patches are applied
for v6.4!

Thanks for your work on this so far Chester! (I suppose there will be
maintenance
for this family going forward.)

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2116C7BDA20
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 13:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346227AbjJILj1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 07:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346269AbjJILj0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 07:39:26 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4D4C6
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 04:39:23 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-65b05a45046so25989246d6.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696851562; x=1697456362; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EuwFZHJVuMY/yvjjKPbV97tzmTd5bLJUXzIBt8fiBeU=;
        b=w9VVyKYIDMz8u+i34CQZ5pUoENfVjQ96fqwJ9Jvmcx7YkBmsTQ7IayFnpayZFFSles
         PWtxiyQJnu89HVuIJWsKqR+pNuL3qbQLlfET5yDWtf62K24XBXF3bJq0fKwwCBI1GplL
         GiS3LQV2WZkRDki0mg7rzBgF4FmtmuAjIA8kzA9FPQF0UqTuL7VMPFPphveQU+4bB+yS
         2HMbZoQ3kCUBpBZdMVdmz1W4zX40aAUtiND+TExtSz3C2gU8iGUq4URYP9A605HuQTIh
         yl+Fgp5ckAYNxJh7oXCzXbND69IJFG858E4qCyKCONiVPO9Pl02+pa3eN42ZGx4KX1Jc
         jKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696851562; x=1697456362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EuwFZHJVuMY/yvjjKPbV97tzmTd5bLJUXzIBt8fiBeU=;
        b=rU4E/Xuf8UUG7BY7gez2d4dxLkjM0NU2WA3owikVSe6DgtGYugp6JIDvE8Eh7PCWCP
         o4yywCfTk+H5J4ZyeAs15VryFrBpXTGWzsPOU6kgTJqJRgruFgZRrW+NBYBObp0bn8M0
         M74BAb+Wh4rF/CzFxdSCKw/gOjV2a0US+OJ7TaH2j41Gup8y6U45pX7oGK4o0Tb7Z5fj
         3cfDLN4s0eBn6ruDwRHw2ax6YKMPNXtxWxsev0IYUlkwQYWfOlaCoROQQO+9yhAK5KUQ
         hKFNTPKwr0YHUwsTQ1UC1fqmKg1k/AlvC8Rdzqbm2PRMQhKifKySGVa0ONwjAQoTgdgw
         Z0WA==
X-Gm-Message-State: AOJu0Yx3d3RpHbjFmKsdsAWtzbImuq0zG/9rLOixt50YDZoLA4Mgq2f/
        PsP7HgcxwgmI4R3bvczbh1vAK0nRTsjrG1GKUr8PxQ==
X-Google-Smtp-Source: AGHT+IHhyWHWa0UYEa7KLSkkNZGhyeUdCzA/1rc4dvVTiJ5tMM/yCOey8ADmLWlaoAKBYm19JBp5FhbJvbRLLVFW2Xo=
X-Received: by 2002:a05:6214:3187:b0:647:2f8f:8c29 with SMTP id
 lb7-20020a056214318700b006472f8f8c29mr15562695qvb.48.1696851562503; Mon, 09
 Oct 2023 04:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231005155618.700312-1-peter.griffin@linaro.org> <b1598405-b01f-426a-aaba-89f2d2dc9c2e@linaro.org>
In-Reply-To: <b1598405-b01f-426a-aaba-89f2d2dc9c2e@linaro.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Mon, 9 Oct 2023 12:39:11 +0100
Message-ID: <CADrjBPovLf-L0O26JKMCOgDzDkEVZeo0sZA-M_9f2c9K7z1S2g@mail.gmail.com>
Subject: Re: [PATCH 00/21] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof,

On Thu, 5 Oct 2023 at 17:32, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/10/2023 17:55, Peter Griffin wrote:
> > Hi folks,
> >
> > This series adds initial SoC support for the GS101 SoC and also initial board
> > support for Pixel 6 phone (Oriole).
> >
> > The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro (raven).
> > Currently DT is just added for the gs101 SoC and Oriole.
>
> Thanks for submitting the patches. Nice work!

Thanks, and thankyou for reviewing the series so promptly.

>
> This is basically a custom-made variant of Exynos made by Samsung for
> Google. Something similar what is with Tesla FSD (and Axis Artpec-8
> which was not upstreamed, AFAIR). Many, many drivers and bindings will
> be re-used. I want to be sure that GS101 fits into existing Samsung
> Exynos support, re-uses it as much as possible and extend when necessary
> without breaking anything. Therefore, when the patches are ready, I
> would like to be the one applying entire set and future submissions
> through Samsung SoC tree, just like I am doing it with Tesla FSD, so I
> keep entire Samsung-ecosystem in shape.
>
> This also means that you are lucky to be selected to:
> https://elixir.bootlin.com/linux/v6.6-rc4/source/Documentation/process/maintainer-soc-clean-dts.rst
> joining there Tesla FSD and entire Samsung Exynos family :)
>
> I hope that's ok.

That's all fine, it makes sense and it was what I was expecting. Maybe
we can try and get you some Pixel 6 hardware as well. The only other
Exynos hardware I have for testing unfortunately is the e850 board Sam
has been working on.

Coincidentally https://www.crowdsupply.com/0xda/usb-cereal just started
shipping. Which is quite nice (albeit coincidental) timing, as anyone who
has a Pixel 6 device can order one so they can run upstream kernels on
their phone and have the debug UART available (which currently is the
only way to really interact with the system until we bring up more IO).

regards,

Peter

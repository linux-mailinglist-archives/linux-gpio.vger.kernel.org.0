Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0098C55EDD9
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 21:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbiF1TfL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 15:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiF1Tb6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 15:31:58 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA493A733
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 12:27:17 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id p136so17724744ybg.4
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 12:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=walg9+X25Qf0Q2kOl7EPuRRmD7l8R+TPYwiRkuq/taA=;
        b=r5dhjikOjoOSTxH7twYmSKEfHqErqjhxkSM9McqWoCouOgLOQB7kvkMdEEzxx/BDX6
         TQrjLVB6hMIfuOa9g8Jq2JmzE97r9+o77os7tKeNZgQG+gQR3fBWEr5T9i+X01s9wRKF
         poqPtQCKU93338RDg9n0sUG/ZEqcMMUZPZnDwkORaC63HcYlFTRnittAcohjRCM8pOOF
         g/UPD7ABIbEWrLq01pVgh4ii12ETWhUPrCA8/9LHWHuLKXXESxjWthvXPWzyjMNL6Oot
         Hlc8iuNIiurItn418+oTScTJhM5C5ncPhx/nMRn5oHIDm7HNscLwCkwchgANUMMiViBr
         lmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=walg9+X25Qf0Q2kOl7EPuRRmD7l8R+TPYwiRkuq/taA=;
        b=xC18bqkIyJ6LpQhL9rmnqJ4B8lP3I9IdO0UYe7D4CM4QQkNAs5Bqv42j0N/GPp8c1j
         14fYgiYKzxPCkqj1+yrZKJoiT/CnYfzQ8C0CskylAB+63QzVM6DSMn7JbdWcchxnx/2k
         BOUs10s4dKUkIe0PFidprYnpev2m7HkPFijy1cHmOLS60DqLCkBVApcNyrb8O0suDxpD
         k2IZA9jB1rONY2tPKdRKlR86N20+MHzW0jmOpbEs7I5Q4TdU4Peo6v1wmlg0PuJU6rvF
         WeDwN0/JXWn8Ipq/u319+xJqH46CMp+QIgNMEJnXem6bzRtAKk/+Y+enlHi4jez1ZpwD
         YigQ==
X-Gm-Message-State: AJIora9JrngLVSf5Iv73x+l6uu21+z2YBNvgUvMoVmDHLm9br2edQADY
        yoVVz2mmwIqzmfITXOARKW0g6UB/uMWDW7Jt2bWZayv0jDU=
X-Google-Smtp-Source: AGRyM1tix/MDbYpAocLhXqNa2cuD1sSvJJYVbcVLzqD1nAvkTSC00uKkSWSEB65C4UY4pgJ8yatan7ZYC8uyX2aYtAw=
X-Received: by 2002:a25:e7d4:0:b0:66c:899b:49c6 with SMTP id
 e203-20020a25e7d4000000b0066c899b49c6mr21915704ybh.291.1656444414438; Tue, 28
 Jun 2022 12:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 21:26:43 +0200
Message-ID: <CACRpkdawFWN_3EYV0p2AAgu54Lu1s0YgqiSiV3136wOSfSGhrg@mail.gmail.com>
Subject: Re: [PATCH v3 04/40] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl:
 align key node name
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Jun 16, 2022 at 2:54 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> gpio-keys schema requires keys to have more generic name.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij

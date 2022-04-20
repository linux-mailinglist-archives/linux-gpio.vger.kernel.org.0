Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03358507CA9
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Apr 2022 00:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358259AbiDSWn0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 18:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358254AbiDSWnZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 18:43:25 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E411BEB4
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 15:40:39 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-2f19fdba41fso461077b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 15:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/b2WbchJKMIG7OLkhvKci/yGaZfbKG5zXqIPhc0xmR0=;
        b=Tt68ItjSM/LAp3E41Jog8JtRpHi8d3dz0w7VxFHGbIGW0coAayZVgW+uNFaU40QSYB
         RsyQDZ5WB1RdpbFj9bnLuB3uBYQuekkcV2YsDqMKmmbniLcX7lL0GM2JWqqjFBWk07e/
         oj26cXfa1ekeVewaAhTStvCnPv2Vfj8pO23xJzyJViUwALqTPc1reSR3b4+Q2YG04JpY
         +/FqmFJ/SC/BlughesaZcUBbJFtsgt7X7+cIMgRHjonDxLKn3+QT3Qhcdzhl3JY+/d83
         dv0ATGFYp5vzYhpRBcS5Bh4SieRgna2e0VfbWFcpS4bYYwsQFpMnqDL6pgzutxom/bys
         3DVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/b2WbchJKMIG7OLkhvKci/yGaZfbKG5zXqIPhc0xmR0=;
        b=VUQVbspUNYldUVax44x7rINgcOUN1DKpSGYAqgka7No3osPJibqr3MsQE2ELY9fxLe
         lyQID+oAv2FRlEANUGypmTF2R55sqawOZFl/39GWemZGSSwwhXaQabbfSvUdnoskNL6n
         sSziATPlAZPcM8dCe/TrGkff7S5wYXCY5nSQx5kwmw54JXoFLpWOoz5v8CRyKrrvuBQv
         yLEggvb6alFFamz1ze0tL4wuiKTT/w5WgzvF81KJouVe0yxeLtfC+UISMDLS5FLvsRYP
         1l8jZxKvml4qGNSFN6aLNv4u8JbN4EW3l4ucepyHSbwP/P0vUQyN8NUHwQGCtL1JtSFF
         Xrvg==
X-Gm-Message-State: AOAM53274jLofTFDeOe7FwBPzs6tI+PA+RH6TeCC+8O+fm7Wwwloqp1T
        z20llVtvWDxcX9iDS8byb67SX7Ukl6Scg/pSODQn0Q==
X-Google-Smtp-Source: ABdhPJxBvWoEuALS1rZ+F1VO+n+79HViIlGOhO/TPJsJqyRQp0aw9SbnBM6F0FKiFmwkzlvdYO6WDRlljl0Ty2m1AiU=
X-Received: by 2002:a81:6d14:0:b0:2eb:fbdf:639 with SMTP id
 i20-20020a816d14000000b002ebfbdf0639mr18226715ywc.126.1650408038984; Tue, 19
 Apr 2022 15:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220327160813.2978637-1-fparent@baylibre.com>
In-Reply-To: <20220327160813.2978637-1-fparent@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Apr 2022 00:40:27 +0200
Message-ID: <CACRpkdZUVDOL7LzqhaZbq6JA8MxAAqER++c7eCJGY8c5s7Z-CA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8195: enable driver on mtk platforms
To:     Fabien Parent <fparent@baylibre.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Sun, Mar 27, 2022 at 6:08 PM Fabien Parent <fparent@baylibre.com> wrote:

> Set the pinctrl driver as built-in by default if
> ARM64 and ARCH_MEDIATEK are enabled.
>
> Fixes: 6cf5e9ef362a ("pinctrl: add pinctrl driver on mt8195")
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Patch applied!

Yours,
Linus Walleij

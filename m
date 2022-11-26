Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB7763985D
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Nov 2022 22:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiKZV7m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Nov 2022 16:59:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiKZV7l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Nov 2022 16:59:41 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE709186CE
        for <linux-gpio@vger.kernel.org>; Sat, 26 Nov 2022 13:59:40 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-3c21d6e2f3aso11420557b3.10
        for <linux-gpio@vger.kernel.org>; Sat, 26 Nov 2022 13:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/dQ/AL3GhIvg/IGU1TmUg1kijFekoVJBnMdB4tHzc8=;
        b=mhl2jGiXqfl83oDCA1CRqw9XstvZ97xKDcIOgo9OGhG4fQKKOFjpjMuwWDZc8rK3C5
         MXgbOLTKSe8QxRD393Wa5LCSXlQJsEh7PbT7CMBGglk2Jla88ZS7OmdVvfrg6YQGaC1A
         s+W04vPdDbSZ8j+jSuryPs460b21SaDpe7ShcrnH8NKx1VEvB6VmXCwb1lJEnBr72G3A
         FTuOoypuJDAPCnSg/omVtOG7yeErceBMn9tQ/tS2LoSksbxOdwBQ6rSnKVPk0VAk78Nr
         2R+rP4X7Ru/ciVuysvqG9QaVFIdgxDI9jcvIIzKg29C1GzaY9rj+yKQ9YdAupJE0PAjY
         X5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/dQ/AL3GhIvg/IGU1TmUg1kijFekoVJBnMdB4tHzc8=;
        b=2snY6QH/wAx+2bygWD0x4WMm2uTa9lMVwJLouFNP/FMbk10R0Y6YoDIPCKjROVGdQo
         gEphhoWNZMaXTHM6t7yHWrCY5Rd5VTFiZYT3J4ucFYARPh0s5S4hJsPHVskxFxFQe+Tn
         6NmIQvonjGugMhno85mFtsJpBW8SzsZM+9lWp8oZVUl7wE1joyIiw5m+zx4StfOAv1H6
         adSiQtim2EcNpDo8KboufOF3tngb55xRLch5nrbeAM0AXyH0Qu1H5PnB8a64hx7u10Is
         OJachJDVbwZrT92RYu+qXa0JZIs/RWvEcacD8Li+MnvD0xcxqvgTgMicJoB2eClKSlQP
         F6sQ==
X-Gm-Message-State: ANoB5plV/Eim2a0LQGwMJ9MaW3xTrpVKNoAa633aDxDKRGDprbONuuDj
        P6AE6xvTkTFDiYNkwjYjPI55an0UsOzooTdg+5H4vA==
X-Google-Smtp-Source: AA0mqf5HWHKZ58JKLQNVM9mMIEcgOofezD/C1oF5+FTMAsQmkLOrgsEE1hY2f/X4s9cuBF7m4EpmjOKXYlNfuwZYZQs=
X-Received: by 2002:a81:3855:0:b0:38b:17c4:4297 with SMTP id
 f82-20020a813855000000b0038b17c44297mr24953109ywa.446.1669499980172; Sat, 26
 Nov 2022 13:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20221126191636.6673-1-samuel@sholland.org>
In-Reply-To: <20221126191636.6673-1-samuel@sholland.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 26 Nov 2022 22:59:29 +0100
Message-ID: <CACRpkda4rmNgM9BsTph9_f_2uX6OOEjC5NZPhBL9S9zvQBLrqw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: d1: Add CAN bus pinmuxes
To:     Samuel Holland <samuel@sholland.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Fabien Poussin <fabien.poussin@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Nov 26, 2022 at 8:16 PM Samuel Holland <samuel@sholland.org> wrote:

> From: Fabien Poussin <fabien.poussin@gmail.com>
>
> The D1 pin controller contains muxes for two CAN buses. While the CAN
> bus controllers are only documented for the T113 SoC, the pin controller
> is the same across all SoC variants.
>
> Signed-off-by: Fabien Poussin <fabien.poussin@gmail.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Patch applied so we get some linux-next rotation on this before
the merge window. If someone protests, I can always pull it out.

Yours,
Linus Walleij

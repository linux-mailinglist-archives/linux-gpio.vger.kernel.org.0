Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857ED51B135
	for <lists+linux-gpio@lfdr.de>; Wed,  4 May 2022 23:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378777AbiEDVm1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 May 2022 17:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377445AbiEDVmZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 May 2022 17:42:25 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CED448E6F
        for <linux-gpio@vger.kernel.org>; Wed,  4 May 2022 14:38:48 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2f7b815ac06so30257147b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 May 2022 14:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VX0Y5lK0oKhUNvSgMz9EtXzVemCwMapBfZK+KjIwWaY=;
        b=QFpWrEBIrRnFFsbRzuQnDhJe4BaSIkFjtC3A5cZVG9hy/hcMauWrIqr2be5/KwrfGo
         NCGCurP8cU79+UY+pB9TmqKhq7oXZZ7qPI7uQbAillCKF63H5X/zuGVkc+JsGOKGae5G
         f+iwI+Dj4ePQuDCx/1Fct2nRPtAuc4Hty7oz//xsfve/iIL9k6svN3NMMvhiwINJ4xTM
         9sMncJOw7LjeeB//tUJa4IoTpI6DRjLlfyj3NRTd/sq9i3txOLixbGmLfCTI0VPt6z/K
         HRTwjUNbVnucCOGaOR4QEyXpnInRsolXUV5HOuBia87QkC+0dAuzdKHwcHKfLed2iZ+D
         Bhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VX0Y5lK0oKhUNvSgMz9EtXzVemCwMapBfZK+KjIwWaY=;
        b=5PbnW4NCx+8k4joY0EMz4kJbv+wiSLJysMtT9wcAxHIC4Swo4vav3FvUfoMcFj8JBC
         GbUIvna5PqBI60Qhtx8cad2k2vr9zoAHjmRIvhC/L4rDl+UvfX9lyHNjO3xAByogIoaT
         O4rJNTNLmVdP4hGiIZJSSydPdYYw6TpxvUjhFyuaMp8YoF2vDFSRYoSuaVmeHEexuMhl
         sIbbQH5gBQZ0NCc0pO0W/ZwodWVrVt3l/xI3Uo4yLKt5k982JQMIoBmaAIDluo5dcOav
         cr2j0ihw6/ukW2+Tukei6c7bPZFyWVYJlTObdBBFX3KfvS/nw7rBY+TFub7SKE1WsZZg
         h+Dg==
X-Gm-Message-State: AOAM533vGO6powNEkTET8AA0wbsS2XNR4RcbeRKnELPjfIisKZdEkgpr
        noeflYAfDdRdwmtoxNhcx9365O6CfmmjaOs3ajykHQ==
X-Google-Smtp-Source: ABdhPJyWaynNr+CEKkTESmGLzWOB0NJ+k01UPdgmFyQnRX5drt8jZsToCyQBLbeZMlkNdUUCDjlKhWmRzv0FXiKAhqI=
X-Received: by 2002:a0d:ddc6:0:b0:2f8:a506:a5c0 with SMTP id
 g189-20020a0dddc6000000b002f8a506a5c0mr22520729ywe.140.1651700327788; Wed, 04
 May 2022 14:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com> <20220428214838.1040278-13-Mr.Bossman075@gmail.com>
In-Reply-To: <20220428214838.1040278-13-Mr.Bossman075@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 May 2022 23:38:36 +0200
Message-ID: <CACRpkdY2MNkAKhVOQ_Eyq0AwOtEW-seSrxgsJ2D8E78u636A8A@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] pinctrl: freescale: Add i.MXRT1170 pinctrl
 driver support
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        stefan@agner.ch, daniel.lezcano@linaro.org, tglx@linutronix.de,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de,
        marcel.ziswiler@toradex.com, tharvey@gateworks.com,
        leoyang.li@nxp.com, sebastian.reichel@collabora.com,
        cniedermaier@dh-electronics.com, clin@suse.com,
        giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
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

On Thu, Apr 28, 2022 at 11:49 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Add the pinctrl driver support for i.MXRT1170.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
>  - Nothing done

If I get a review from a Freescale maintainer on this driver and the bindings
I can merge it separately, correct?

Yours,
Linus Walleij

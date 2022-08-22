Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD06359BC0D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Aug 2022 10:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233850AbiHVIvy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 04:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233798AbiHVIvy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 04:51:54 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8D29FCB
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 01:51:52 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id j21so14368429ejs.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 01:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=F9wABGPJepecNKwit4UZt+CWAiTGn1tZ03tvvlqXGJg=;
        b=mKZT6I2wMsaNwXM5/0bJ7rowcsGG9xiomgEsajUzkHsT7HcuOj9E+1YMCAIhBQPj1O
         w4zLYYxnBcsQ0vJoY3mLCU/KInwP8wcxCYKPmLi13WXAb3tvuImFly+DCPTD+cNvw0uT
         zuIRk5myyhfAIvNTx8YkGARd0UF4FfcbBXBKiipX3NdjbbM0TBL+uxyYnBR+xkMlopt7
         II2FC1IAGUnmoGjJz+vC6jmqCNVu5QAdhUIoA6Ia713KHJg114QhtT5CL5IrdlJj/+3D
         PthbNSqQ3WwME1t32WSntsUJD23td/3o+5ycyLAUf2zLKEI4PBhm+xluk8s9Npon+yto
         zS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=F9wABGPJepecNKwit4UZt+CWAiTGn1tZ03tvvlqXGJg=;
        b=Yv8Bu6WtkakkrrayEKnqwDlpWDXzdEMieySNhMSHY5o3u22VSEHm7LECvJmQ2cvKwu
         eZJoM6CiJ0sv6lZS45AsCTC+4lXhnT18IMVdm2R279Y27gi3KpBHd9Lu7yvKNpGuAJw8
         Oi2b02r9Ght2rEzK812TkIoSOlhTJAiirLtNmL0O8Kebnw4qWZbOpXE7bEvue4/aMwmY
         wtu6t/itnGQyYzy7sIcVHj8wjBkcJ9tBM5otJ9hEQ26BdKvEASfTWSBE3tAl9UK90NDn
         JW0CjecHptKEalf03XcU3ZgoUWZf2/QOX42mNzRNmSVcRZugwzqGhDvpgLjmDLLatiV1
         5HIw==
X-Gm-Message-State: ACgBeo2+k4ip9s6jeFYTfmAgyP+rTIJD5L727eSeaw30rk0VT2kjzXLR
        vy0bIqeU4hFwO6wASCSE+6H25ni/FCxvpmsrCrLQ2w==
X-Google-Smtp-Source: AA6agR48fYE55tzDtAC6ibWU/joRibr0uHd0eKN9AvtNXWBFXk4FEax2+UisAqGiMzu7o0I7SacdqzKwZo2px46sLKI=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr4069144ejc.440.1661158311511; Mon, 22
 Aug 2022 01:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220812133012.7283-1-shenwei.wang@nxp.com>
In-Reply-To: <20220812133012.7283-1-shenwei.wang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Aug 2022 10:51:40 +0200
Message-ID: <CACRpkdaPPpsm+0dzD5V_HtZfiHbBCvzEP73PUmJ4cEYT18g+-A@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add IMX8 SCU GPIO support
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev
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

On Fri, Aug 12, 2022 at 3:30 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:

> Changes in V5:
>  - rename the file name from fsl,imx-sc-gpio to fsl,imx8qxp-sc-gpio
>    to match the compatible string

v5 looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

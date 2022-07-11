Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06C7B570A8F
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 21:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiGKTSn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 15:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbiGKTSm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 15:18:42 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D686323
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 12:18:36 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id x91so7486465ede.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 12:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FJHEPfRXOmHsOG/s53KpehCVKapP9RYTNh/9xcBH11g=;
        b=rNf5ftpJ+EgBwYQH2THq03ENTWNNgKDJkzq5LMEoVa/z7jCGhNf/jxaVU14dICs1ZQ
         dYsUDOvf30er1Klm9DYz/0TMDFrZHm4Oj0GDs3Evuy/5SC37ddgafoS1Z5eV9puDNIcj
         7LxrCIXogJSb/b/WSbl7CxcCPARTurRfRDPj7A/jBlybt8c0Sto2Y/RNH3DpoY8SGHBK
         Is6SZ6+l05wcQPO1LtO8vAB+0vZYLTiLNUiJW6XgteyEvTpECbv3tpVDTsJJMvv7ewoc
         N7h1eaGwGDsQYi7VkFW/w5LXS2reYqYMAVMOUntzmy/u7a3efD4EyuAVApYwLcuMooJT
         2rXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FJHEPfRXOmHsOG/s53KpehCVKapP9RYTNh/9xcBH11g=;
        b=8HkW4woR6JoLKxaqtazyq8OezVQpSgP2AzF9ta7dmh1kkLQFeDCNue/vnbwAU4ALAa
         sLGfNIzoxUkTag+FQTSX5c8JkS8j140Nt2Av4REMMMq8WyZoSsqQXtZDyr/ngBmE8bQW
         u3cUKy/+XjYjjGZCRiUjmzbzXoBq7DI7JomZk/5KmDJ+1LVXXtk/c2osYuqzBDZUwdJ+
         71q28PaVAW73kka5hluF8jArLUG1vhxj9FxmWnDxcEwapImRbOusSudYR31n/Csmurpt
         JoPjoTOJumxGiPqRyLqZQXBRMcZQXYpaBdEPwASTLsIjtSOs/b5UTQc+Vcq1X0xok5Tz
         l/iA==
X-Gm-Message-State: AJIora/W6qHOMF/5BZQFNA3pfSjO5AYP7ITU2Sn2qYUxGenHgwpviDPN
        aIOI2usO9WrLNozOk1ibNbP0WLUpzhSQLWlyISdnSw==
X-Google-Smtp-Source: AGRyM1ud10k2lXej/x/aAntPOCTsaUErLCLuXomvc1/DIzGpEbtmTxiwM2L3bBoMZOtKDjMeTIE85PSxD/2gWmYiRhI=
X-Received: by 2002:a05:6402:150:b0:437:b93c:3a9 with SMTP id
 s16-20020a056402015000b00437b93c03a9mr25918043edu.82.1657567115248; Mon, 11
 Jul 2022 12:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220708155819.3096903-1-vigneshr@ti.com>
In-Reply-To: <20220708155819.3096903-1-vigneshr@ti.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Jul 2022 21:18:24 +0200
Message-ID: <CAMRc=MduEE6j6UDTPht1Yq9gJfHykC6peMVWChVvKCWYPTGDCw@mail.gmail.com>
Subject: Re: [RESEND][PATCH v5] dt-bindings: gpio: Convert TI TPIC2810 GPIO
 Controller bindings to YAML
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 8, 2022 at 5:58 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
> From: Aparna M <a-m1@ti.com>
>
> Convert gpio-tpic2810 bindings to yaml format and remove outdated
> bindings in .txt format.
>
> Signed-off-by: Aparna M <a-m1@ti.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---

Applied, thanks!

Bart

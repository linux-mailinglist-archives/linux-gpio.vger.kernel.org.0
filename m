Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E240580E70
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 10:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238192AbiGZIFC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 04:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237836AbiGZIFB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 04:05:01 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78362D1FE
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 01:04:59 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id ss3so24619167ejc.11
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KBehNnJT8GsO8upB51VneNbMYqsRg1ZW62nLqXxRwjs=;
        b=ux3qmfJJzCRpmOIlz05amYZpcKjRQdQpSoXtp0phrhdyP/vH1mgjUHF3Cn6q1rAio9
         sTifpvJhZaL/w1o15nmY3samMbq8yjVXooInCubRXzNUnweXBqGb7HBfR8Gj+zpCCOBp
         oQ7iNJBYQZseKBKeQ5mv5+SZV5gcJDb6ePE8xWQSg9oGJIpFn/LFsmiSHs/FfYPc29x5
         0ZrOfpuhyk+7WLYfptEqkETbazvrhXKGkhwVqtYEVIMrQRMiIeEN4MQ0GgqHsD+BL2ue
         tHXVaL4vP+mJovTLoaaKe2LMP1LY8R2jrMJvrRSVa0fyYpGWxCHVYNgCm4cQAKXxNi/u
         75LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KBehNnJT8GsO8upB51VneNbMYqsRg1ZW62nLqXxRwjs=;
        b=TKXBMYOvgCtdeq93aJM+uxM/rr+XFvNmsSpnjZXAmL+2bXu6hwRdlO5Vg3Sgss9eML
         Wv+2y19y4c7fVDVa5vjOrlQAyOwzQHTkheEKwMqR9piHZPx3JAU2J9r+NwXeHOC7oyaa
         zZTUnTM7UF6PTh2BZ8aPFk6DMMoSWovBVZpYGriYTYJ6exj8njKsLnRxovJpZQBpSkV9
         ILcOrUPBy3qEt7+TlNmyImDYleOjiTaw+1mXaVUm7SvTlfVALPRBhLPHcO5jllAN+ko4
         mWOOJ4UPheJKDICBOtY17jNr92HQg74DKuFlJXS0XqKFNlauQpJ6P5gOi/6ydXGBYk27
         iT3A==
X-Gm-Message-State: AJIora9yvPW0OmrMUGKuJYSmxUJ60oD0BXii6zA5DmH3nz7P5GlOqBBy
        CdL2vUUN6+GFKL4SegionafetQfLUz2dUVsNsK9Ev7FRISy45Q==
X-Google-Smtp-Source: AGRyM1vHhcGel5juigG9IuL9lnmZZvwbKcwgfiDrUj2uiwtNoJw8NVE9bwIMb2MaITVezVvKoTnq3AyC7k1VJmVf5x0=
X-Received: by 2002:a17:906:5a61:b0:72b:1468:7fac with SMTP id
 my33-20020a1709065a6100b0072b14687facmr13030328ejc.440.1658822698053; Tue, 26
 Jul 2022 01:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220723160513.271692-1-Mr.Bossman075@gmail.com> <20220723160513.271692-4-Mr.Bossman075@gmail.com>
In-Reply-To: <20220723160513.271692-4-Mr.Bossman075@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 10:04:46 +0200
Message-ID: <CACRpkdZMFdYDssk9B7R-MH7xG8Ukp+ZQpXCRVtPRCS=SFh34mA@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] dt-bindings: gpio: fsl-imx-gpio: Add i.MXRT compatibles
To:     Jesse Taube <mr.bossman075@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
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
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh@kernel.org>
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

On Sat, Jul 23, 2022 at 6:05 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Both the i.MXRT1170 and 1050 have the same gpio controller as
> "fsl,imx35-gpio". Add i.MXRT to the compatible list.
>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Bartosz needs to apply this to the GPIO tree, I think it can just be applied
directly without regard for the rest of the patches.

Yours,
Linus Waleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 839415643F9
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Jul 2022 06:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232564AbiGCD6y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 Jul 2022 23:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbiGCD6X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Jul 2022 23:58:23 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2ED0BE2C
        for <linux-gpio@vger.kernel.org>; Sat,  2 Jul 2022 20:57:33 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 73-20020a9d084f000000b00616b04c7656so5096542oty.3
        for <linux-gpio@vger.kernel.org>; Sat, 02 Jul 2022 20:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dQGA0bu3AQWCuC1GbwRKa+75S+e6lFO1n+xYI6b2Lfw=;
        b=tZaTCT5agJ/W5MTY4ChPtc1XDLJKp4CctBpnrCUIhKNgpN1H67etzBdwWcVgqTh3p5
         Rpws6+KCerTtj8KDgj208++uOAUUNYbZwIshCcigdKA1eDiRz/QItFe1rMw5+GiscOar
         FrzEPYhzQinS0Z91zyAbjw85CcRTp2ENtnixsfT6WRN+TNRS0m0FM6MNH1rMOOCyJxsC
         5P51RWagk0utaomYGvqdFoITuFnEhDzq2tWG4Glt2KJgrHX/T3lrPdg/lUIzBClJzInl
         r208u28GA8/rpcp88qsLSJJlP4Ui0QQT6y6QxDAa5Nnm0OjV33BJKsy7H06YpCqUhiI8
         y4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dQGA0bu3AQWCuC1GbwRKa+75S+e6lFO1n+xYI6b2Lfw=;
        b=1YBbZuhOAz2kPQHA7sKNl1piT88jksqtFbfOAE3uAEoJpA+jUmleUQeYoX/jl/i0Jf
         wn5Ny57gqt7edhSaCc/nRbX9A/TUOYx1pNaWm+kY7Gnf4oAk+dbGhz23ULZqr/AUrWLR
         zXmkE6NpcPmK+4JsIW82Pe0+ctPQM1MU9iH+eMYtHLLU7Nf6m7FPwD0a4usapnJC/WvF
         fd1lroAXGZDA5RaZZqt+FCylaS7VFS5fuG8K6ODHaif7Aatg+tJ9cIYL/9u6F5R7jbfn
         3JY4u8IbgZcb7ogB+f0SvBwwVWhiXyRg/ziv1ahTrJHg0feBG+oSgu9VxGEh9CtjlD1G
         Yfuw==
X-Gm-Message-State: AJIora8jzzwGSYHRBQTEP2/QnefYBsGdhyZcY9i/XFAr2guZMvnaDNCL
        Tet+3Fiv+OyMe26HFRjCDzZtNw==
X-Google-Smtp-Source: AGRyM1unb+4uUOF604hLcm6sxUx99v9VtXWGjmIJ3dnzzgB49ZjQEqsHZ3kaRUHP0jg6yWxEYqFcqQ==
X-Received: by 2002:a05:6830:1b79:b0:616:af56:2fe7 with SMTP id d25-20020a0568301b7900b00616af562fe7mr9513926ote.262.1656820653608;
        Sat, 02 Jul 2022 20:57:33 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:33 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        arm@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc:     Li Yang <leoyang.li@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Joel Stanley <joel@jms.id.au>,
        Thierry Reding <thierry.reding@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        linux-rockchip@lists.infradead.org,
        Russell King <linux@armlinux.org.uk>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        linux-gpio@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Heiko Stuebner <heiko@sntech.de>, Nishanth Menon <nm@ti.com>,
        Peter Rosin <peda@axentia.se>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Wei Xu <xuwei5@hisilicon.com>, openbmc@lists.ozlabs.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, linux-input@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        linux-mediatek@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: (subset) [PATCH v3 00/40] dt-bindings: input: gpio-keys: rework matching children
Date:   Sat,  2 Jul 2022 22:56:27 -0500
Message-Id: <165682055968.445910.13332143476289618470.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 15 Jun 2022 17:52:24 -0700, Krzysztof Kozlowski wrote:
> Merging
> =======
> 1. dt-bindings: rebased on top of Rob's:
>    https://lore.kernel.org/all/20220608211207.2058487-1-robh@kernel.org/
> 
> 2. DTS patches are independent. They can be picked up directly by sub-arch
>    maintainers, by Arnd or Olof, or eventually by me (if you wish).
> 
> [...]

Applied, thanks!

[25/40] ARM: dts: qcom: align gpio-key node names with dtschema
        commit: 9c17baaa97c89379cbd89e36115b7fb6aba43518

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>

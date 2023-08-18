Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE0278063C
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Aug 2023 09:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244330AbjHRHTH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Aug 2023 03:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358152AbjHRHSx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Aug 2023 03:18:53 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2685930DF
        for <linux-gpio@vger.kernel.org>; Fri, 18 Aug 2023 00:18:52 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d299ed34bacso2423963276.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Aug 2023 00:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692343131; x=1692947931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enTJBS8wTh1nxTe/T9iI4asg7ZNOFqCWqP/AK42Kk20=;
        b=M1Qa6F6MHI++ebLHjL52l6yQFWrxGbaCo37q342++tD3UzsJrIUpG1onarDhT1osWP
         bEVsuUhgkiiKPkgdRgSuteWlsiDHvO05LZJW8QHInVNlPWmCHaPLd2+j+VBuexQQe4NH
         KVxHY5tfX30jQNx1mNffcHVvP5m3bFjkgJpbioMClJ+GcILGMhw9l9A4Gv3r+7Adxxja
         DRxC9qze/biNIbAhKNSiDSc1QgyuWQLQIz+fcYhk4sZLs5t5QXKNnuU8OtK/T6a1m86F
         4t/jIYv5vo1R0a99tvhp/6Y9Z+N/b3OHtHqBCnEkzsT4sYIFHtc0jzh1BMCabpeMuYua
         S70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692343131; x=1692947931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enTJBS8wTh1nxTe/T9iI4asg7ZNOFqCWqP/AK42Kk20=;
        b=LAWmKcfcY55KuJKLSX+vWiSARlNUY9sNizzgc0HfIYOnuJpYl1fHAkL4TFYa17E4mZ
         vSmvlPmwhTZdwMCOzzoMkGLJ7BMxIM14DbBCXmRpyplQ5q5nsmdgxqNEiuaaFmirrC5X
         UrCXr4CQXeiK8kd3Kzr252lf0morS2EhJGmADNydQYEvQiH3yvShacUnJs+NeO3w8vJg
         qQEDEJlGkSiCSkQD/oQoOF2jGTemTaGp0dHfjs6xNQoGUzXLjnkRACQ3mZc5wyLy3A+D
         i2X4t3BjrVu1OjsufFDQ8HZbDJLHPYowuVfeEFpKOkFyj2LNFp/ol6nWIeGyAGRO5tvb
         fHxw==
X-Gm-Message-State: AOJu0YxW62y0xwu736oWM91y27Z6XXafUojg1W4ffPknWdX8uRLbAs3u
        RE0rSBaL3Wz7RxRRrQcRoow+ZB2OHf3rlc/POmUkcQ==
X-Google-Smtp-Source: AGHT+IFqQQDYlaVK/njGJqMp/NfBpTtTF85jqtSqD/Ox915rgUv/UVNZI1uAeDkh95YYIKDoqC9n9CQTQnf912PnPKw=
X-Received: by 2002:a25:a464:0:b0:d71:c79c:86c1 with SMTP id
 f91-20020a25a464000000b00d71c79c86c1mr5249886ybi.32.1692343131394; Fri, 18
 Aug 2023 00:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230817022018.3527570-1-ruanjinjie@huawei.com>
 <AM0PR04MB6289593A2149C9411FA9D5858F1AA@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <6b508343-7b7f-0fd5-d83f-92dc88a9510d@sionneau.net> <20230818053254.GK5650@pengutronix.de>
In-Reply-To: <20230818053254.GK5650@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 18 Aug 2023 09:18:39 +0200
Message-ID: <CACRpkdbikkc+oepJqZsUz27MTOHLMp-QQPdgRZ7XQGTG-=aAKA@mail.gmail.com>
Subject: Re: [PATCH -next v2] I2C: Fix return value check for devm_pinctrl_get()
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Yann Sionneau <yann@sionneau.net>, Leo Li <leoyang.li@nxp.com>,
        Ruan Jinjie <ruanjinjie@huawei.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>, Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux@armlinux.org.uk,
        linux-gpio@vger.kernel.org,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 18, 2023 at 7:33=E2=80=AFAM Sascha Hauer <s.hauer@pengutronix.d=
e> wrote:

> NULL is returned on purpose. When PINCTRL is disabled NULL becomes a
> valid pinctrl cookie which can be passed to the other stub functions.
> With this drivers using pinctrl can get through their probe function
> without an error when PINCTRL is disabled.
>
> The same approach is taken by the clk and regulator API.
>
> It is correct to test the return value of devm_pinctrl_get() with
> IS_ERR(), only the commit message of these patches is a bit inaccurate.

Sascha is spot on, maybe copyedit some of the above
into the commit message and resend?

Yours,
Linus Walleij

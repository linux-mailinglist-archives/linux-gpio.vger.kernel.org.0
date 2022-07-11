Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8084A56D7B9
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 10:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbiGKIUr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 04:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbiGKIUp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 04:20:45 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C841D1EAF5
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 01:20:42 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-2ef5380669cso41175507b3.9
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 01:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tUHCP//hHPZEBYcMZQzy38VehLgt6hh53f5BZYulUH4=;
        b=lOzgvPTMydFnuQCR+NpXvESGmKL7WL8MXowYAsx9zVCPyhCtxL6WpzhqSauZVUYG8p
         FMKKiJOp9znbtWM/uwydVMepkmK8Dno3T0I77BU19F84HHyO0AD+m45c2JmM/3onKA5g
         c3ghJENk3yc8ym749phX5usavkD84Wd+GEbf2pDcE1RlI8FTzKyI6U84wR5Pzx/SHLdS
         JsqziPWmmVzKBH3Px6jqLVS1og1rsg3KMJsBQhUCDkbM2gCoJmRqZB1gg0zaJP0tkM1L
         XJDG+KlRefxheF6t+2SpLBZ5WwN7Zj6yBGwL35YXTqRQQH97iX1s2nc+7sMLI8YrSBAe
         HYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tUHCP//hHPZEBYcMZQzy38VehLgt6hh53f5BZYulUH4=;
        b=OevKatIoZJsmWkIEgL1Mdji46AFGTV+mP7k5xSNqp/qgtoy/in845ov7xNSvcufGJw
         FxCQjcGbXNvUEGT3Zonzj8JvIEg6Mrg07r9oii6nLJuXFTtyNJgcLGPJLzXNDyfwUsNA
         th8n5qFVUiEmX01JWwlGAvzqoJSJs1cFBWPX15qc+Ujt/XwFh7+t3TMG3qZOJuILSBR/
         cptzRPl02EaE4HLWzHtlIbRpPiH/Dl0Le5VqFIDsmIoSWOEghD8b3Q0eri5aYrKQ6V1J
         KGrRXtxNL+r8aI5iIITs4bVZQfItsQGZ6nqKX9j50So8+kxMVQxUxM/8Ly+wFc3oyQ3n
         gpug==
X-Gm-Message-State: AJIora97x6z3HgcbcE99H/jFGpiPSEkYTVPvPXKKlC6ziWNQFcWlU4Xf
        1+CmGcz8eXOOmkOn2vmY5/7eRCSAge66r0pkuPkFuA==
X-Google-Smtp-Source: AGRyM1sy8nBp06emhSDiGJRyMEKbA1d34ls4ctcCIxGcVXS0Hfwvue6frXUJhN2IRgHcXp9xVxTXOhB4Xkt6MxAbQwk=
X-Received: by 2002:a0d:f801:0:b0:31d:851:96b8 with SMTP id
 i1-20020a0df801000000b0031d085196b8mr18284241ywf.448.1657527642014; Mon, 11
 Jul 2022 01:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220705204743.3224692-1-colin.foster@in-advantage.com> <20220705204743.3224692-5-colin.foster@in-advantage.com>
In-Reply-To: <20220705204743.3224692-5-colin.foster@in-advantage.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Jul 2022 10:20:31 +0200
Message-ID: <CACRpkdbfTXNh+Pn7PJtFO1LCo1GpTb32AuV0dQfm5EQxPpv-qA@mail.gmail.com>
Subject: Re: [PATCH v13 net-next 4/9] pinctrl: ocelot: add ability to be used
 in a non-mmio configuration
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>,
        Terry Bowman <terry.bowman@amd.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        katie.morris@in-advantage.com
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

On Tue, Jul 5, 2022 at 10:48 PM Colin Foster
<colin.foster@in-advantage.com> wrote:

> There are a few Ocelot chips that contain pinctrl logic, but can be
> controlled externally. Specifically the VSC7511, 7512, 7513 and 7514. In
> the externally controlled configurations these registers are not
> memory-mapped.
>
> Add support for these non-memory-mapped configurations.
>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

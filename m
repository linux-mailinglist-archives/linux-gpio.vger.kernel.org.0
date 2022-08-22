Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6178059BAA2
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Aug 2022 09:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbiHVHvL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 03:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233442AbiHVHvL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 03:51:11 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4EB2AC63
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 00:51:10 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id j21so14103741ejs.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 00:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=X/e0sUGzNGa4XatfY2HnLYxSIYjraGrcGgPCXIi/SH4=;
        b=p/dfF5WWiVj3NcT+TOqGCRz9kDKav+hCC7ytBLCjOHmYBbY3WzfaiOVHZJJLPiY7ZD
         gm4IoKS2TbFvcOJ7EJtpsLpcBep5CmybCoVvP1bXAGk97MS7aNaBVGOD3zqp/mLZuxjw
         sebOdE7zQ0fR8l/3L3PP3fv+NuX13xr3MtBBCHmp3NCQ9AEJKts+CA7AUuxWsRUovwX3
         N2/sAXxbxZba5IdloZQNoI79sM1dDVtoMEXyLgky929dT0FN1YrY02AZntbtCd6fk9Iv
         NOFLF2jTh924yvjqt5A4da1qmT5BEe1dTXamy1sxelLYfcxaTRF4EBtFkfi65xq2TStq
         ZjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=X/e0sUGzNGa4XatfY2HnLYxSIYjraGrcGgPCXIi/SH4=;
        b=E9PCKDaT106h1yDuq/0smK9ErA8F1manAqwnMhmeAv3DVjjWSRNGCl2hhVThEFJu6k
         pvwA3CqHJcd2PIfmlYLTDdqcH5R/0iDUH2VmPuSCJW29sNntXKLPKQGNcA6PkSyi+Wss
         7QiMraN2xtE6ayVhOjFnBFP8rsMT9RUZ4ollu2NP4lpX4/cotB2Ld7Q61ggm89i7PVG9
         Vz7Gt4/v7peGCG4svHOexQaocvh8pjy3GhtgzEjmJac2fj7OZbwX0pxVoK0s8HjoxRF/
         3DxFR+gONAgUwXmLZfYE0h2Xq0hy7IIkF/pu9j8yV5w3Tu/JLBLmtOrFYBeCsUhzQ92N
         4bvw==
X-Gm-Message-State: ACgBeo1TE6ReL9Cq2A0rEGjROTCuzpN+bRPFRWgvnnWt5qupNe2TNftL
        VpxbQL+Vom1OENO1UnZ/jXfqR5k5i8MU7C4nH/hvZQ==
X-Google-Smtp-Source: AA6agR7uLIVK3T7IxhbVmoLbLjMTG5c912qcrQBKemUAnACqvkhKAjq74FAhRld9ll/zFYHAdHegCnDcGa4LtNFN0zQ=
X-Received: by 2002:a17:907:9628:b0:731:1e3:b168 with SMTP id
 gb40-20020a170907962800b0073101e3b168mr12261197ejc.526.1661154668591; Mon, 22
 Aug 2022 00:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220818124132.125304-1-jagan@edgeble.ai> <20220818124132.125304-7-jagan@edgeble.ai>
In-Reply-To: <20220818124132.125304-7-jagan@edgeble.ai>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Aug 2022 09:50:57 +0200
Message-ID: <CACRpkdbJg-u-Lh-T9MQuaL+OYFOSU=ToCyAx+dvoZ9WsCEBT7Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/19] dt-bindings: pinctrl: rockchip: Document RV1126 pinctrl
To:     Jagan Teki <jagan@edgeble.ai>
Cc:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Thu, Aug 18, 2022 at 2:42 PM Jagan Teki <jagan@edgeble.ai> wrote:

> Document dt-bindings for RV1126 SoC pinctrl support.
>
> Cc: linux-gpio@vger.kernel.org
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> ---
> Changes for v3:
> - none

This patch applied to the pinctrl tree for v6.1.

Yours,
Linus Walleij

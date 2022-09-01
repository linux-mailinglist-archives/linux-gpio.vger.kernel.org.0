Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7845A95FD
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 13:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232895AbiIALt0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 07:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233094AbiIALsv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 07:48:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589F81636EC
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 04:48:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CC56E61DE7
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 11:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FBD5C433B5
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 11:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662032921;
        bh=H40Hcw3YDT3fZZMhWj6pRboTmPnykZhkK4GHgnnzzqY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EAXpEQmd7VaMRjFdn8U/7hzBrXMMwJlKgB2V0cQTQrMoTaVR0ds0I/QEndIwN6MEs
         /kMuku/bajLYJ8UHnTsXGqy2/rY70cur8JKJVxuGpy4vC8iZyUTm5zYmAt99JUx0JY
         JaMc3E01xm28wFpt01uIEOV9LYn/uNooLy7Q1/M3gSWlrqcDM9/eI5XZjgLAqTM773
         EYJdLAGDXEApRB3SMmyviWaHZm3RWWOtwJlbtEi8Fe+NNqNbowBjqPPOUDbaHgRHHD
         euWCJW7Z5MpQTVRq2MDwFRXgf2A8y8p00SO04MoS8yqq8s+hBbAPMlpw5UBmKzoCqo
         iYMRISi8KYA8g==
Received: by mail-ua1-f43.google.com with SMTP id l19so4524993uap.6
        for <linux-gpio@vger.kernel.org>; Thu, 01 Sep 2022 04:48:41 -0700 (PDT)
X-Gm-Message-State: ACgBeo0zaNEXYd0AoUU/e2Xv0ZVLq3CQ99k4m0gSH5JHnTmE8TjPhudi
        kRLlowlwaFzKQnO2onS+JWmXZAQj3Zhh09cDGg==
X-Google-Smtp-Source: AA6agR646OvzP8c+uue3VJKjAFana4OhGGo9Cf75fRYLJ4CDBSm1sB999ps//oRyOqNdcqbWZVi6T6zf6sWKD8SO8Kg=
X-Received: by 2002:ab0:70c8:0:b0:39f:7528:6289 with SMTP id
 r8-20020ab070c8000000b0039f75286289mr8072133ual.36.1662032920121; Thu, 01 Sep
 2022 04:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220901012944.2634398-1-jay.xu@rock-chips.com> <20220901012944.2634398-2-jay.xu@rock-chips.com>
In-Reply-To: <20220901012944.2634398-2-jay.xu@rock-chips.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 1 Sep 2022 06:48:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ+i873aVYwNuiDeXsyOgzE_E7XG1QMCEeuMHKdoZjwTQ@mail.gmail.com>
Message-ID: <CAL_JsqJ+i873aVYwNuiDeXsyOgzE_E7XG1QMCEeuMHKdoZjwTQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: rockchip: add clock-names
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "heiko@sntech.de" <heiko@sntech.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 31, 2022 at 8:36 PM Jianqun Xu <jay.xu@rock-chips.com> wrote:
>
> Add 'clock-names' to the gpio dt node. so the driver could get clocks by
> a const char id, this patch names the clock-names as
>   - 'bus': the apb clock for cpu to access the gpio controller
>   - 'db': the debounce clock for cpu to set debounce clock rate
>
> Since the old dt nodes may have no clock-names, this patch not make them
> as part of 'required properties'.
>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>  .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)

Please resend DT patches to the DT list, so they are tested and reviewed.

Rob

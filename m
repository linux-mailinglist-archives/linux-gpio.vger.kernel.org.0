Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3763F50C16F
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Apr 2022 00:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbiDVWBn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 18:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbiDVWBl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 18:01:41 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FE31DB5C0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 13:44:29 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id c11-20020a9d684b000000b00603307cef05so6298207oto.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 13:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0JRCh/BqOi4YkLGUiJfecYURU86aNbte4r9osUN03Ek=;
        b=CBGTb4d3eS7HJsTVlLbQoizdcgj00FRfmsbMjOINCCIgO/lh/nw8HFb5PtXjHizyAi
         BYZ+XVlLA6yn5KwojjjMps9Uw9kqcWQDjdEkeaNPwRettOULYGjgSkpIY7XNeOVgjp4A
         FIE3gEgnj+PkohreuAOunK9gW7Al2WCCKjSjTUSlVHG/1U5fxBJSxNvMJGAczW6PjXoh
         y4AV9yCqVYPPG6eAHwjn1K7OVRJaWNnRZmQ5k+B+yQJzKfxtyAomy7dOiJ4j6TfHe3jQ
         knLd0SPuH892Kmh/jfFnbYPiifqBIPHRECqY5lA5x4ux6cXe213gkYziWEoSlo2BOORF
         LlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0JRCh/BqOi4YkLGUiJfecYURU86aNbte4r9osUN03Ek=;
        b=Ky5dbBOth2JW87i5+NhwsrPKc2IYFybsOXjzn1eabuG52H5YNrUiw7kmZAuHn+yUcc
         DZurDlamZoG4uAdc18yG4dgwJdJFR/d7dE1WBTWqFVuk8no6vLaCKf2S2HcGlMhYQQE8
         0cAxvPX75GN+hjPIsRy6eOPWrjtXmoCyZoNUfhcNEaHusDLJ2gKninzHPFkoQ9KnUgUd
         PvROpeu+DsmEjsNjddYBUWFfac0ABYxfH0uydcifonzvcXSATp96erm9/edlBM16yLx3
         5tQ5zgUUvlOGc3IV1StF8uMacC8WwJ9TbBTEs7hLFi1oh2lLCCFsjzJxZ0RFmAvVQBxJ
         PJ5g==
X-Gm-Message-State: AOAM532i/BGcvjnSdXTobEDUW6U8UYnTeBPNPmCwlTD1yYHdFsMIpTzB
        9jjg1JQOn5kE21Xc/eRfISJLfBsZTTyes/Zvh0sBPdKeIoc=
X-Google-Smtp-Source: ABdhPJw9gNNFIjL44oXwYR0XZt26gSCXKZ91nXCIwqis42lHTyFg4ODQiziVUiiGspHnYemb6VnQASFqhnYF8zKxMxw=
X-Received: by 2002:a0d:f0c3:0:b0:2f4:d291:9dde with SMTP id
 z186-20020a0df0c3000000b002f4d2919ddemr6790754ywe.437.1650659758236; Fri, 22
 Apr 2022 13:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220422170920.401914-1-sebastian.reichel@collabora.com> <20220422170920.401914-15-sebastian.reichel@collabora.com>
In-Reply-To: <20220422170920.401914-15-sebastian.reichel@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Apr 2022 22:35:47 +0200
Message-ID: <CACRpkda-yLgH7mC6GkMgh5e3+c+4cBrRc9Ryist+zYJh2z9_Sw@mail.gmail.com>
Subject: Re: [PATCHv1 14/19] gpio: rockchip: add support for rk3588
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@lists.collabora.co.uk,
        Jianqun Xu <jay.xu@rock-chips.com>, kernel@collabora.com
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

On Fri, Apr 22, 2022 at 7:09 PM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:

> From: Jianqun Xu <jay.xu@rock-chips.com>
>
> Add V2.1 rockchip gpio controller type, which is part of the
> RK3588 SoC.
>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

This looks like something that can just be merged to Bartosz
tree as there are no dependencies on the other patches.

Yours,
Linus Walleij

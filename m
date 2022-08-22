Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B669959BE48
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Aug 2022 13:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbiHVLNp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 07:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233331AbiHVLNn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 07:13:43 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C7C5AE5A
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 04:13:38 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id j21so15047545ejs.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 04:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Dkr4AIdROVLhVEc8a8eBTTU4GUL6aPXhNeYUI6btP8k=;
        b=a4mx+uPTAWxThPbOx/cCMZrRSh16NAD6vD1VWyo9tAkX4CFftSHGfFqXhWn3EKf+yz
         ugQ5GKRmLBpS/Dmb+C/ZgDvRXhAbybnX4F39JVIx9dNQlI6hTavItP54r6u+NmZgqpIe
         Pt7esidde8LIRS9wlBGVeBAURqHNMHzvCE6FZr3I5MxOa8RFF2OqKPx8ZCB6WN7U0uOq
         1am0XnDm4/m5FjHZeQIK3Hjsi0p9bVZy5bQsJg6c7SnodmCxLHihqzXJ7jlpd773Psoy
         Uu74Ni7Trm66hxyRAJoQG9B3+OBsY67MG98xJaBSoa+Xpm5IAOwpyufoF9T78nxmGOQG
         DX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Dkr4AIdROVLhVEc8a8eBTTU4GUL6aPXhNeYUI6btP8k=;
        b=PS17ETpV1deRlGZHE2n2Qgrr1lJ4xVS96yhCdZOFkkTixUiGb0pu6ABp/bXLjJbbMV
         CTqsmpUKUZqnyk3tPXo5Ovk6M5f8zk3PRUlu00e+yTNyonPNM5fGS3Tz2r7+m+9oGb9H
         TvV2QpxBQRe8VymL3TCb+8sxmcz4V3X+7UdofW4DFda6kKG9QVi5UG02sCr7BTl8FTlx
         lTW5NHAXhISBbIcWRA+r+UROBWkU0JiCx8AVTUaFv9OQNEJZ9GTBvc7OIirsredcLaI3
         iBIsfbgoFKqge7LFWOU0Xunhx6cO6CsBLvqHMiKHM/MZ7Ri4Oi9Ru5mHEBCJYAbsMUB9
         HU/g==
X-Gm-Message-State: ACgBeo1siuZZaryOcZup8CqipKdEVYECO8wPUOJtHLw6wCSHXpTLmr9U
        YPBXOky186o86GESJBuMfqTeKY9YYD0zcJEv4xhebnOW9GI=
X-Google-Smtp-Source: AA6agR7B52ymIWTAoSTjGWlrpKupo1q6W4BPMdfiAdfh17RVskPjHkwynKSg6KMu7i21JPyuYlJkFkRU3PYZihCXEOI=
X-Received: by 2002:a17:907:9628:b0:731:1e3:b168 with SMTP id
 gb40-20020a170907962800b0073101e3b168mr12744420ejc.526.1661166817013; Mon, 22
 Aug 2022 04:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220810161635.73936-1-robh@kernel.org> <20220810161635.73936-2-robh@kernel.org>
In-Reply-To: <20220810161635.73936-2-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Aug 2022 13:13:25 +0200
Message-ID: <CACRpkdagwr91UuwC80thn5t7KpcBek1gitTHPHvUy1ntP7FQrg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: aspeed: Add missing properties
 to examples
To:     Rob Herring <robh@kernel.org>
Cc:     Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Wed, Aug 10, 2022 at 6:16 PM Rob Herring <robh@kernel.org> wrote:

> The aspeed pinctrl parent node (SCU) in the examples is missing various
> properties. Add the properties in preparation for the SCU schema.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

I see Lee applied 2/2 to the MFD tree so I applied this to the pinctrl
tree.

Yours,
Linus Walleij

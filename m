Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0CEF64DC0B
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Dec 2022 14:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiLONOp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Dec 2022 08:14:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiLONOo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Dec 2022 08:14:44 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A135F2ED7F
        for <linux-gpio@vger.kernel.org>; Thu, 15 Dec 2022 05:14:42 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id v126so1651256ybv.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Dec 2022 05:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x6pBWVNsgjAGpd1VZR5eExNtUZDulyyfEXZFcwo/ZY0=;
        b=WF4o50+yPVOO/nnc2PZfXnrSc1OnWJMoIQMCSAHiR3Ve08OeUkWD08m5h8J10eBfBf
         BXWZR3DSYK/6sysM9p7jBdK16k3bbrfEofFpd0MotYLAzCgLIPh8Pg5JZVh42YkNmk2B
         D0n/BOjzV4NKURVcVIngw6qDAQm3zGNyT3cmJmbHmiI7JB8+TS5LA28YZ080rXLTLp9x
         s60ixwHmlOPbxyh807wRM9opkMeDeyMlBFMZVwOEiPMSQSpQTqra2XKx96rNT0xayWoV
         IMzrFlgYVPbsY8FWWeN3XRTwQVxhkTbX50etJdlRahfZ7Y0SdPIKtSm8r/IrPBlp2VZN
         esZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6pBWVNsgjAGpd1VZR5eExNtUZDulyyfEXZFcwo/ZY0=;
        b=8ODnIJSTSejvbluH0UmygJILIfwyU7YbU9ivU9FkaBM4U3IFb6ATbL0Un6FrdLiN65
         wJrHVSVeib73M0+2J+gKWMSvXDxWHVTuaSpqwYyd5hxX390K3mmMT+R9OeyB54/vFl2k
         sKV7Eg2RAHmEbCIFlUNxxHsXEWik90qVL1GzP/UpKuQCA7q3X9nB8yKR7ZfPRh4K+0xV
         +GLuS9/EZXY0/H7m2AM+ffHhRwnxEBtx9PVV6fbvMIriC1GxMOPmu695baodCt4P1f0h
         xFLCmIA08E+PKTcdHPspHuyRJAZsivlcMyMtx1GKEKgsJ6yLDR68GG74j3M61KUebj6a
         P5tw==
X-Gm-Message-State: ANoB5pknWCvga7DkatcacS5kPbuFvoR9v3T9+ity9HGm/pAfhpVHWCcg
        ikCy22WNk87j8D9SA3HWB+HFKg6PssJ7yU7ItfXu9Q==
X-Google-Smtp-Source: AA0mqf4VCeS6cDmE/8cI63PEOCskGBZt2whnoZo0ZMYoL1fTX7u2fERUW9ycXmeeLPdzN6L2IfhejUxuNfP+Ggbfv+w=
X-Received: by 2002:a25:d782:0:b0:6f5:6b11:8110 with SMTP id
 o124-20020a25d782000000b006f56b118110mr47667581ybg.560.1671110081841; Thu, 15
 Dec 2022 05:14:41 -0800 (PST)
MIME-Version: 1.0
References: <20221214095342.937303-1-alexander.stein@ew.tq-group.com> <20221214095342.937303-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20221214095342.937303-2-alexander.stein@ew.tq-group.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Dec 2022 14:14:30 +0100
Message-ID: <CACRpkdYbn3XDeswTeAHatbGUnraDT4-4FkX9FBXMGkzpHpEQUw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] dt-bindings: gpio: Add gpio-delay binding document
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

On Wed, Dec 14, 2022 at 10:53 AM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> This adds bindings for a GPIO enable/disable delay driver.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> +  input-gpios:
> +    description: Array of GPIOs which output signal change is delayed

I would just call this "gpios", it's not like we're ever going to add
any more specified GPIOs to this hardware, ever.

Yours,
Linus Walleij

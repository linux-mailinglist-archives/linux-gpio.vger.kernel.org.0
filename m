Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E87E15A28B6
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Aug 2022 15:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343803AbiHZNhz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Aug 2022 09:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbiHZNhy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2022 09:37:54 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3896FDC5FF
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 06:37:53 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-33dc31f25f9so36230717b3.11
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 06:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=q8PbLhE/XrUOR16T195SOwGCO0An7Rg3CZvVaNouLwo=;
        b=d7ViihS3RT1OfEGoo4oYHrv/V+/uKTZOrj7Ic20JETLODS3iKrurldpGQaH4tfavaA
         FVHyDxD2J51d1DnGPLI9jwdqxisNsz+BWtwTTsPqUzsJ082z21MPnlXhytd9Ry3F406w
         9kO1KJL94YGxSBbM/PbcuWwJDJ5GOs2/IrkhW78w8S4hEbpXYDzvcDLseAuYC+2WXUiV
         fwj5A34xMY/DZeEhqBpL7mcPDtagwr+3Ghs3tkSS1ESZToDUObC+HLiICL5oNQ3lawAY
         id8NwkHayucOVMBtccc2Z7o2G/z6k3Ho874T+Em9iuydZDhZNKnSRm3y1O8ORrpw5Xxp
         /plQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=q8PbLhE/XrUOR16T195SOwGCO0An7Rg3CZvVaNouLwo=;
        b=fmFpEX3rBsTLgcXOannkXSPmaCMu1a8a961wNbOyUsPDJPCNvDBumvziK08g6cmIAJ
         vehKjQpHon4CIwvou+hJm89bKR7V0c0bykwnZ/7S5F0HzEsvS/+2Beqas+vC54mHkrC6
         rtxlJrlEuBUCPJrDR4dOvnFuNSF4WIv69ygUA7cjNl50x+zQ5dpkGLCnGxNWQELTVDg1
         g2HDnwXsy5HjT0OSGHjKxuadrBDH36qyRhQlhtPj9zCH4PdpTwVyghrb8g30QYTIZ2Ko
         /FFBYq1kBVLQuX/LkrIHgCruPRmiYMrSOgQCBw8qHSFBg2Gh4s+ZBPvHIZdeYuTAHnnK
         cuHg==
X-Gm-Message-State: ACgBeo0i6jgWU7hQzd9lqM8ppx+10KsikWSaf41Pl0pCdJ6r9UhTSjaq
        9IrOVoJ1XOC3TLlL73yi6k/D+H0rFchdN6XjmiEFQw==
X-Google-Smtp-Source: AA6agR7UhUd0nkWAMhrNEtB1CEuCm4ENhrbVT9L37v2x3KrKvfk3k4bculRKirggTHNvpy4rDZyudPKhDPNU0VuCpCo=
X-Received: by 2002:a05:6902:3c6:b0:694:1088:5448 with SMTP id
 g6-20020a05690203c600b0069410885448mr7683130ybs.410.1661521072408; Fri, 26
 Aug 2022 06:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220825094132.1268174-1-s.hauer@pengutronix.de> <20220825094132.1268174-3-s.hauer@pengutronix.de>
In-Reply-To: <20220825094132.1268174-3-s.hauer@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Aug 2022 15:37:40 +0200
Message-ID: <CACRpkdYL24cJgo9F1nWYzP=8+XywdUXhSedJRQFJ16MUAx7-dQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: gpio: Add gpio-latch binding document
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@pengutronix.de
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

On Thu, Aug 25, 2022 at 11:41 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:

> This adds a binding for a GPIO multiplexer driver based on latches
> connected to other GPIOs.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Nice overall!

> +++ b/Documentation/devicetree/bindings/gpio/gpio-latch.yaml
> @@ -0,0 +1,83 @@
> +%YAML 1.2

No license?

> +  data-gpios:
> +    description: Array of GPIOs to be used as data GPIOs

Hm I wanted to just call these "gpios" but that is maybe confusing.
What about "latch-gpios"?

Yours,
Linus Walleij

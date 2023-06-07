Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A07072704C
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jun 2023 23:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbjFGVKR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Jun 2023 17:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236299AbjFGVKD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Jun 2023 17:10:03 -0400
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA233D1;
        Wed,  7 Jun 2023 14:10:02 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-33cb82122c7so6768095ab.1;
        Wed, 07 Jun 2023 14:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686172202; x=1688764202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zn/+bDcNIkRP6nVHCBNdZknvrtc0n7NoAg1NQX/hN5w=;
        b=fWuwlE5H0BSir49DhYbVoOx2Fn/ASHozYM62QcI3xoOvrdzx23U+i/woQziB9VybKE
         4lesse7kfqh4gzzkvD9H6XRG7UKOu6Oc7B1feQX1uQRLJj7oyIu4P5fZUmBoMHjW9433
         iDD3lAcSgP/tvVUVMPfUUwyGt8OZerJY34lkE+KZBry5+fCMjb3Qu38ESe2AXZMPLkJ1
         MLb0irZ9GP74HWub1fo5lGYX5LNB6jmSabz4RpsFFQHOA6taE2OPbtcQGL0pPx6xL4DG
         eH4tINznCSlHwyiF72E6hwM6m7jpmJQCxkOAwbFglcZTyg5ehwYKodfgrTLCDTJXt/G8
         4UGg==
X-Gm-Message-State: AC+VfDwuzwU1lK9ixG9lWAW7dVbZDnVIY3kBWsbuSxGr1Gy8FrG61Um0
        xKiZRp4vuc1kVzkVE/MY1w==
X-Google-Smtp-Source: ACHHUZ40PzbRs3022Az+UykuyXRdGSn+LJVlT/mcLXccg3LgLBh7yVNZbeDYslTFfpxxhlLa7ual/A==
X-Received: by 2002:a92:1310:0:b0:33e:5f3f:ffb with SMTP id 16-20020a921310000000b0033e5f3f0ffbmr1224658ilt.5.1686172202008;
        Wed, 07 Jun 2023 14:10:02 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id m19-20020a056638225300b0041a9e657035sm3273252jas.48.2023.06.07.14.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 14:10:01 -0700 (PDT)
Received: (nullmailer pid 4034857 invoked by uid 1000);
        Wed, 07 Jun 2023 21:09:59 -0000
Date:   Wed, 7 Jun 2023 15:09:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: introduce hog properties with
 less ambiguity
Message-ID: <20230607210959.GA4013738-robh@kernel.org>
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
 <20230530151946.2317748-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230530151946.2317748-2-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 30, 2023 at 05:19:45PM +0200, Uwe Kleine-König wrote:
> For active low lines the semantic of output-low and output-high is hard
> to grasp because there is a double negation involved and so output-low
> is actually a request to drive the line high (aka inactive).
> 
> So introduce output-inactive and output-active with the same semantic as
> output-low and output-high respectively have today, but with a more
> sensible name.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Please add this to the schemas in dtschema. Everything in gpio.txt 
should be removed. If that hasn't been done, it's because what's here 
needs to be relicensed. Looks like you need TI's and Geert's permission 
for the hog part. Anything from Grant, Linaro or NVIDIA I've gotten 
permission for as well.

Rob

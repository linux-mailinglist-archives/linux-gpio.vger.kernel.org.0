Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB4251B07B
	for <lists+linux-gpio@lfdr.de>; Wed,  4 May 2022 23:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239206AbiEDV3T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 May 2022 17:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378561AbiEDV2z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 May 2022 17:28:55 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5582712
        for <linux-gpio@vger.kernel.org>; Wed,  4 May 2022 14:25:17 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id s30so4578167ybi.8
        for <linux-gpio@vger.kernel.org>; Wed, 04 May 2022 14:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T3d2fYGVCQPH3oUWunAB6fdSYnujJZ2I8+XkzxVQ4R8=;
        b=ZUiMw8FZnaeQCj4tHgZ+yh927ALKIjlzaflimJl0MTREy3wMDwFDlUqyiKh+Q0oQmI
         SulmOktwG9BAk7EUbjJV74hALMN8j/QFaOpkyOxpr+KkK2hAX0GJ6t0wnfUO2F/ZG58w
         WaxiEaxuEOvx82Ufe2v9mdjNMxQC78ish/ZyII2Ls5x881GTkMySDBdhxdL6oQy/aWoG
         unoZII6R+E4YAj9G19q9N8ia7HohjBVASfVrHPO/W0JJQaPBVUCNuuejVmS4TCTXy2vq
         fILs3pAeMXJYYbJfkUpD5n/b25B5ffXdA8ulNVYS2I+61x0aJNVMoGewhaYqbgLLKfOa
         G2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T3d2fYGVCQPH3oUWunAB6fdSYnujJZ2I8+XkzxVQ4R8=;
        b=fX35Zb85UOzrUh1L9h4hQ6hx+hqbGcMZlUFC+NE06+yCRXhkk+WSwS0i6Tsvlyv1lD
         mO3LYmFU1LWi4XdBMGLfMmMTHi8LI8PUw7QpH9Dpqx9yMNsNcleEe+VFt9nTCUG85skn
         5cGs0wRcy33tj3iB7x94/ExrEPHOwq6kmCAaZLqW8FjXPD5y+MI0UML34oMfGYlUnvJM
         qe27ZxSz4YZNYM4yNPNbsV7GRtvb63je5fajPfUtZzddM5ErmQD2pODOLVWbd9/e1A9m
         hh9LDEaWvC2qzxKXsDaWjIkNYzIk+rBRNFsvDW/sZ00Gy3jv/6FDHquGSKvtfoTK6RoX
         hkhA==
X-Gm-Message-State: AOAM5327TI8UhkSDRJD9hpoHtbugeVKWKV00BqXibarsmPTwETqLegpK
        pK9A3kfrHtcLNURsIkE4ixuC3J4A1e4xuL0SHMon1Q==
X-Google-Smtp-Source: ABdhPJzqvODOYmcQ9TZYyXXRfyQPmMMljGJNRG/LrEqbFLH0+9/ixLSThQOOvYy9Zui0cZ7P+TuQBezYxz3hocfbs3M=
X-Received: by 2002:a25:2905:0:b0:649:7a2b:ca72 with SMTP id
 p5-20020a252905000000b006497a2bca72mr13176917ybp.492.1651699516824; Wed, 04
 May 2022 14:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220422192139.2592632-1-robh@kernel.org>
In-Reply-To: <20220422192139.2592632-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 May 2022 23:25:05 +0200
Message-ID: <CACRpkdZcVwvBHrDy-wxPURhJ4OWRMA9TQ1e2vmcXnhEG2HaMDA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: aspeed: Drop referenced nodes in examples
To:     Rob Herring <robh@kernel.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
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

On Fri, Apr 22, 2022 at 9:21 PM Rob Herring <robh@kernel.org> wrote:

> The additional nodes in the example referenced from the pinctrl node
> 'aspeed,external-nodes' properties are either incorrect (aspeed,ast2500-lpc)
> or not documented with a schema (aspeed,ast2500-gfx). There's no need to
> show these nodes as part of the pinctrl example, so just remove them.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied. Concerns about lost examples can be solved
with incremental patches on top adding more schema.

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC6BA513E9A
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Apr 2022 00:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352934AbiD1Wmq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Apr 2022 18:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352917AbiD1Wmq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Apr 2022 18:42:46 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43724C12ED
        for <linux-gpio@vger.kernel.org>; Thu, 28 Apr 2022 15:39:30 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2f7ca2ce255so68378167b3.7
        for <linux-gpio@vger.kernel.org>; Thu, 28 Apr 2022 15:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E+3J8Tg1YKkO3lpTvYwXtrtSHWXSrNo91D9D4uubgfM=;
        b=V4XCWq+mmBEcJp2rd+FHj5x6PNMIWT8HPTMQAxnaI7951ksolZFoZlQx5xw2qhxxun
         3wrv9A+A1/uDRZxkAklPtdGFsTmIJzUm66fE+az8c8Gax6q/hs23FY+pEZC8O4aZUO3S
         uMmSpr23BPt1V4z9OSeskzAu1ySy4g+zOkCcm8hX+D27zAqd/vyzE4h5gddupLogEuyd
         fOXUvcQ+fFMJq3BV5SnS4BOv6O3Tsmh5FSjAtNXr7gltT+iSAkQTfLrR+hjxX9tQYq04
         aoWOUJlz7SPODt6wkBWOR5Bnac01p/Mbc2IGhBY1iD5s8ZkU7PSPCjH1Qn27aI3Yncv5
         oKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E+3J8Tg1YKkO3lpTvYwXtrtSHWXSrNo91D9D4uubgfM=;
        b=fiqPEa6qHmlYfkkuKhHRReytk5v42ACQ5CZqIOSMc5PATQzI1Y35vA3UMHAnYS65e1
         fQUFMNkGKbOSOOkv8ALJ0fD6CESpDpUdFZAt9kY+nP1ltqSRjhEf7iYlVjqgLG8NoknC
         I1MTQAymBgSx0wkveRQl0v1msbsr1+ohrV5iP9E4my6e86dB/COj0BMJkuhqjTfDbwZO
         kmNLGwKcrlnHJ816dXPbKLMqzdQfxkXZWMLLp1yjD9XJASF73aOuRNsdCmGbf4KKW+13
         nZAOo6XN8rDZQjNzTcfaYp4ruJ7Z78hO7Sde+tDKN5/94e35WoJ2ut8HwaZfVeun8hpF
         TiDg==
X-Gm-Message-State: AOAM533rkP8A+rFfH1GNFNpG5R8QznYYO4mwKyV3RGzUykWVIVMrt5sG
        uYHEcSgdJlBWkx4xbxYT0xN4J6NR3Y63QQv8BPeZDA==
X-Google-Smtp-Source: ABdhPJxvhml9HFXPCwUVI0CwtNK5IaJmoBNDiEfCirpoYCazdVjbv6nJ3rx/3iOjPRgLySfwlGlZlM+lkxFFFgGvH8U=
X-Received: by 2002:a81:1d48:0:b0:2f1:8ebf:25f3 with SMTP id
 d69-20020a811d48000000b002f18ebf25f3mr34374108ywd.118.1651185569522; Thu, 28
 Apr 2022 15:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220420191926.3411830-1-michael@walle.cc>
In-Reply-To: <20220420191926.3411830-1-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Apr 2022 00:39:18 +0200
Message-ID: <CACRpkdb2zuXpTkiXNtC6KKRO55Ks-yep-TBq9YD_x9yegZ-iyA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pinctrl: ocelot: add shared reset
To:     Michael Walle <michael@walle.cc>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Horatiu Vultur <horatiu.vultur@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 20, 2022 at 9:19 PM Michael Walle <michael@walle.cc> wrote:

> On LAN966x SoCs, there is an internal reset which is used to reset the
> switch core. But this will also reset the GPIO and the SGPIO. Thus add
> support for this shared reset line.
>
> changes since v2:
>  - use dev_err_probe(), thanks Horatiu

Picked this v3 version rather than v2.

Thanks!
Yours,
Linus Walleij

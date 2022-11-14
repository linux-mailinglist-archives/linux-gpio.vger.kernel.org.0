Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1477628126
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 14:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238004AbiKNNTi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 08:19:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238011AbiKNNTC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 08:19:02 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250AE2494C
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 05:18:59 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id n20so7621116ejh.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 05:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RqdOwqN7P+pFrJiM6KNGCU46uVgLUu/+Ya5PrHPuEsI=;
        b=IloJmChvHKtNQjVn5VUm8Qs/O2NJuE8g0+N4NQFZ6rcfk4tPQUP7R/wlc9zgQeuhPP
         NWLeDc0tCQUvrphVytT68Y52+r0tSl0SRau6tJomSflOhu7r4JNCeJIirhVRM8N55rk8
         uMgPyE5TkfhGYNGnCs4HWd3i3Yz6raYt1mVNaXM6rnfS7W0+IG+EWwEJOc3Y0x3gBETj
         bxN0OGhSGUWqUeMKbfwwwOWPnz7/fNkhJ6lBYx7cjlIJRvwux99bo4qZQfCJB7ruSNFZ
         +cUuh9nUcHJ9LAKSNWF+8cEHTBAk0HAegALf5+ufwMWM+Rp2Ool+wz2aEVW7xp+XPgt4
         TXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqdOwqN7P+pFrJiM6KNGCU46uVgLUu/+Ya5PrHPuEsI=;
        b=Zt90rISGEpsCTi+20jNXsaeZjCURI5C1hPwGHvT1rsMJKIdJs7k0soMl7gwyyVaX01
         4bzInPRzoLr4Jp4/DVpin4d3tcv/L10fx0hJ62rH7hR6i3Zy1tyltBb9l0y3ySzBJEhO
         lySGk2fSUcj35gBv40d+5gSHYmYZ9u8xgWg+I5RdD+decITAlOh1CE9+OayPS4fyqb3Y
         e2sikmqmbSnZ059b8BUS8hVM0rx9iD4Cf0AI8UXL1uEQVLnwEKzF2iHGkSoMb2XYPjOo
         U69l9qXtP3FoZ9UhnJ1TymgmTXTGLD6AochSPGATGKEnqyRaePjYHFscuYMgx32ir5yK
         FjLg==
X-Gm-Message-State: ANoB5ploozLcJKtPaOxaYLxz6pCcyojh69ezKYms7+UDHZ+INlyevfHo
        jhHz5T32isdeWgeFHGZLYQ1FIiGxWNl1MsONc5mRzYi/lMQHNA==
X-Google-Smtp-Source: AA0mqf7Snqu+4eKTHoWKvKfFt+gSamQ3+92SiphWhGdF5GQAYkWrqscIDItRlf9HE7OEQj9nrOW3F5t6RU6uWQ61zmY=
X-Received: by 2002:a17:907:3101:b0:7ad:cda3:93c7 with SMTP id
 wl1-20020a170907310100b007adcda393c7mr10591079ejb.500.1668431937731; Mon, 14
 Nov 2022 05:18:57 -0800 (PST)
MIME-Version: 1.0
References: <20221104142345.1562750-1-thierry.reding@gmail.com>
 <CACRpkdYT0X09bWYg9za8x+3YkcbVmBm8Prb0Fyk2nfi_eanDyw@mail.gmail.com> <Y25oAmZMcfBOCat3@orome>
In-Reply-To: <Y25oAmZMcfBOCat3@orome>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 14 Nov 2022 14:18:46 +0100
Message-ID: <CACRpkdYWXoTquBgCxYE67QOxV=8mnDaumhgGVWJNWGQbFYc2CA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] pinctrl: tegra: Separate Tegra194 instances
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
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

On Fri, Nov 11, 2022 at 4:19 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> What that also implies is that the pinctrl driver patch is completely
> standalone, so you can apply that whenever you want and I can apply the
> DT patch to the Tegra tree.

OK I applied patch 3/4 "pinctrl: tegra: Separate Tegra194 instances"
to the pinctrl tree for v6.2.

> I can then also pick up the DT bindings
> patches and resolve the conflict there. That is, if you don't mind.

Let's proceed like this.

patches 1, 2, 4 are
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

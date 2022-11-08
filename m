Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF9D621055
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 13:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234279AbiKHMVj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 07:21:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbiKHMVY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 07:21:24 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04ACF51C33
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 04:21:14 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id bj12so38011897ejb.13
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 04:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dmDShQas36dD47uGMxvPlh2813rtPjLDfwhfhXJ2dxc=;
        b=zzZvUa+kn9M4LdUavXU8BveFUJ8sU8c0cLaSZOAQAh5EZdN2tfmviS8k0Zavi8DIel
         /dBmC5zWcS9gq/LQ/SDLrCHtN0vhmDWWfTNTACxTfyLvLtjFq//hA5Ijx/XjFl2tYpUR
         S/tdHgCAWFMjXAZPWORRTvFaufVSwUPEMBRK5GVO4YUhnIrV5pPjYcGMct0W7728uoD3
         IAMz73S10iBaN1IKsfiCVgfbA4jun7k/2163Q21nOT0zSLAWe7gAlVO5WuIwaMDAaluk
         OUmhpA58BaClzFN04y93ABrlYvNRckp7aGznHEJW7VNYz3pUJZ5I79ZnxPc/GRmbk4bw
         BtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmDShQas36dD47uGMxvPlh2813rtPjLDfwhfhXJ2dxc=;
        b=w3y/4T8fuUSy3ZS4GEcI2j4Zl17iaWtsHRYsSlut0OKOeZSaTqACjCpqFs8ObOHKGk
         JE9yrFbTpamNfRwU+/tcpQEnriarDmIEwehGAIc0LRED/nGTWDw6fYX/QoowVbr4iQF1
         hYKxQBkWvXAGd6mtOcZ40L30d3xwwft2hsvlB9ZjwaM7BaVZl/TSCpiLct7/GGQ2KHsn
         Ph7WwsoZMGoKioe70g/m1iziOLfj9XlWRTE5VGDueL58Fn2nsq2TrHmpwB+Zsd/jYX4U
         jUj9qFyus1rNSzaSBIsi6raUGE7Fkf48mcz6wSSWdSx4V9dFHMID/ZzUx8B1JrBblpL/
         99yg==
X-Gm-Message-State: ACrzQf1J4mO235+wO2sVQfgPQS1KA/TtIX6B3rlKA006+A+ps5RI2IrY
        3xNbydzXKIpF+IINXPya/avq0UXegPNcZ7r3E6EAbA==
X-Google-Smtp-Source: AMsMyM7XWqou6nmQNE71q7T1t2yLoNihbYJr+6ZowdOGs74VIQIL9SSg+uc7KcTEC4HyYqrCBRtBbqd7X7SEY2qwhDo=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr53775608ejw.203.1667910073486; Tue, 08
 Nov 2022 04:21:13 -0800 (PST)
MIME-Version: 1.0
References: <20221028153505.23741-1-y.oudjana@protonmail.com> <20221028153505.23741-4-y.oudjana@protonmail.com>
In-Reply-To: <20221028153505.23741-4-y.oudjana@protonmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 13:21:01 +0100
Message-ID: <CACRpkdaHHDQt4_u-Y3KZiRuOuZSGd7HUydWJttW2p6NfXaveVw@mail.gmail.com>
Subject: Re: [PATCH v4 03/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Make gpio-ranges optional
To:     Yassine Oudjana <yassine.oudjana@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
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

On Fri, Oct 28, 2022 at 5:35 PM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:

> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> The pin controller can function without specifying gpio-ranges so remove
> it from required properties. This is also done in preparation for adding
> other pin controllers which currently don't have the gpio-ranges property
> defined where they are used in DTS. This allows dtbs_check to pass on
> those device trees.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Patch applied.

Yours,
Linus Walleij

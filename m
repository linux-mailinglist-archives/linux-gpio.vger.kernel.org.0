Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABA555C956
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 14:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242855AbiF1Iaf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 04:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245193AbiF1Iae (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 04:30:34 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC05826542
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 01:30:31 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-31772f8495fso108977067b3.4
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 01:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e5Z/hG8NSQiNO2xEelBjBj++4NPTXkLY1E3WsIfZuUI=;
        b=cFOT1JeSSqICBH1zsjVCn1t4/wd9526VEQ9A7gSgpYHLbvn2rhoMbjLoeB6tj9iewe
         AdkecZgznE2OlgxJVBf+K5LIK1jfo3uTZjJciW4QBx7tGdAVy7sfhelYyFvIhLEXle4R
         193RO7PBOkJT0a4ggra0cRHnp3jrtgdKbvlZVn0I7gWyBW3YaGmstvc/iD3877IBDudl
         +zN4eg8tCA6O+k1W488D2HRbGUFsjC3CM5hc883woRtiCTjyeZgDj4oddUM02NRy8pyX
         KN9M8thFWr4NWu3KWX05nx8tgySBNRE4e6GipfTrsvuW/F2A/30OvVYyI6IqG2eQ25dJ
         Yjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e5Z/hG8NSQiNO2xEelBjBj++4NPTXkLY1E3WsIfZuUI=;
        b=4IUEnII+btY5CLnyW68qFsNbG6WPeEZ94g2UDlLmfEv8XNPlVLdB0uOKEqIvCczeHY
         5ICBfFOTYB0PMqbgDmTLVZ/fsZWe22GE6OpHadMVp1/aVZSItoaSOawDfouWP3EMMvzh
         bb7dwAc8qDBl/aXnoa+442G6Vj1fMBHkl2VNSQOydNHU0uA70odt9jDO3auu027/9Fq/
         S9nGBxxIdAFy0wlI4ov7hjuBI5J8Xqn092bG6WHYKbFa3Fcgwk4lzfuES5xuYsLXzs4j
         kv2NcL1gw5KQvgoa1pV/E9M9g7sALz4H+M5iSf+nK2L/5/GxBUB2w+QhlR2aORuNXiei
         jubg==
X-Gm-Message-State: AJIora/ijbMW/6KXbtfRaG8jSeNB13IJ04Mg4a2ZNVFeZLRafMI+uTCZ
        i6B+5num/Uwcnzy5PDEO3T0tZGIzZayiWGwjaioiGQ==
X-Google-Smtp-Source: AGRyM1uKl2WU9AxFxQXaBRZSVk2Jbhtzgz+hPFdf2a+y8B4wMh0z4Qb4XsuZBsPg7IrlqHvLAYY5VnUpxXIbYIjzF14=
X-Received: by 2002:a0d:eace:0:b0:317:87ac:b3a8 with SMTP id
 t197-20020a0deace000000b0031787acb3a8mr20429857ywe.126.1656405031018; Tue, 28
 Jun 2022 01:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <1655462819-28801-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
In-Reply-To: <1655462819-28801-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 10:30:19 +0200
Message-ID: <CACRpkdbgFaPxE+ZtSBPLdOeM_vj_qgf__Mk1Yb4KSWrzpup2Ug@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: pinctrl-zynqmp: Add tri-state configuration support
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        git@xilinx.com, saikrishna12468@gmail.com
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

On Fri, Jun 17, 2022 at 12:47 PM Sai Krishna Potthuri
<lakshmi.sai.krishna.potthuri@xilinx.com> wrote:

> This series update the Xilinx firmware, ZynqMP dt-binding and ZynqMP
> pinctrl driver to handle 'output-enable' and 'bias-high-impedance'
> configurations. As part of these configurations, ZynqMP pinctrl driver
> takes care of pin tri-state setting.
> Also fix the kernel doc warning in ZynqMP pinctrl driver.
>
> Note: Resending the series as i see this series didn't went out due
> to some issue with my mail client. Please ignore if this series is
> already received.
>
> Sai Krishna Potthuri (4):
>   firmware: xilinx: Add configuration values for tri-state
>   dt-bindings: pinctrl-zynqmp: Add output-enable configuration
>   pinctrl: pinctrl-zynqmp: Add support for output-enable and
>     bias-high-impedance
>   pinctrl: pinctrl-zynqmp: Fix kernel-doc warning

Excellent work, patches applied!

Yours,
Linus Walleij

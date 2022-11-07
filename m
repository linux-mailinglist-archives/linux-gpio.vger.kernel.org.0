Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7240361FFCB
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Nov 2022 21:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233037AbiKGUuU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Nov 2022 15:50:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233038AbiKGUuS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2022 15:50:18 -0500
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5B526AE9;
        Mon,  7 Nov 2022 12:50:16 -0800 (PST)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-13d9a3bb27aso13303400fac.11;
        Mon, 07 Nov 2022 12:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY4cBgCmlgBqYohRhHhMdIePHZwJ1Xi1Cx+NWhe7FDE=;
        b=HCkgw0WF9aq2XRRBIIVXokIxjSAKEGNFhVNn2qDziuR3Yig0eMZXUDxlUD9LUgWNk8
         Kf+cGMoTWqD9aY07h31I+NxhLYsJUhWOpxwHbyo+3A/nXdNSYRyReCUhAuRtmyXomRjw
         vkr0NiaMYQ03ELjMzwc2e+x90m3fEi0QCIXL/14686YEcqXXMcNk2YDQfM5jYAZQEeV6
         49VcTfuEBGKC/awVe3hnyWqIbAH+ZLh2AtIdF1J63YBVnSEwIVnCIWxwXvjWlo+ZcwDO
         jDKJIVkL+D4YCV18pBb1upZTbrVLtdsdRcAtdb9RV20odgFv6QDS6hX2z/O5biVQcCu8
         x6yw==
X-Gm-Message-State: ACrzQf2WiBoQNqcp510Fg0STkgSc0uhPC/MJnrq3IGVZlTNP9zDYUFon
        1o4euPQL2mm4/hXzX/s80Urvg80Jkw==
X-Google-Smtp-Source: AMsMyM4NCHFN92wEml59BG8xGmdH2SgzI6d5Gu5LvtId4uUc/8ttSU80t7O9gx7LtRJBzVjeIZPEBg==
X-Received: by 2002:a05:6870:d623:b0:13a:f0ad:804a with SMTP id a35-20020a056870d62300b0013af0ad804amr42173962oaq.79.1667854216069;
        Mon, 07 Nov 2022 12:50:16 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d9-20020a4aba89000000b004805c328971sm2550468oop.42.2022.11.07.12.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 12:50:15 -0800 (PST)
Received: (nullmailer pid 1609740 invoked by uid 1000);
        Mon, 07 Nov 2022 20:50:17 -0000
Date:   Mon, 7 Nov 2022 14:50:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: pinctrl: tegra194: Separate instances
Message-ID: <166785421422.1609632.2807084957651673122.robh@kernel.org>
References: <20221104142345.1562750-1-thierry.reding@gmail.com>
 <20221104142345.1562750-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104142345.1562750-3-thierry.reding@gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Fri, 04 Nov 2022 15:23:43 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra194 has two separate instances of the pin controller, one called
> AON (in the always-on domain) and another called "main". Instead of
> treating them as a single pin controller, split them up into two
> separate controllers. Doing so allows the mapping between the pinmux and
> GPIO controllers to be trivial identity mappings and more cleanly
> separates the AON from the main IP blocks.
> 
> Note that while this changes the DT node in an incompatible way, this
> doesn't have any practical implications for backwards-compatibility. The
> reason for this is that device trees have only reconfigured a very
> narrow subset of pins of the main controller, so the new driver will
> remain backwards-compatible with old device trees.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - update for common bindings restructure
> 
> Changes in v2:
> - add missing "type: object" to patternProperties nodes
> - add note about backwards-compatibility
> 
>  .../pinctrl/nvidia,tegra194-pinmux.yaml       | 235 ++++++++++++++++--
>  1 file changed, 215 insertions(+), 20 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

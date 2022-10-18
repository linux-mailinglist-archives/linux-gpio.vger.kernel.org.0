Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAEA860262C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 09:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbiJRHv1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 03:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbiJRHvZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 03:51:25 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55ADC31EFA
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 00:51:23 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id e18so19256428edj.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 00:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nx4cJDlCKZ9fU1HAj805dfsVKCPNxoVsjTzwe56667E=;
        b=xLsyuuLUYCg+D40GpLmV+wGnd9NUl9GyPGOO/imPfZMlKB0iDVh2PM7B7xKKNKLKkc
         3n9llVb0UyT/JKAfl2w1HcghTSnq/VAuQEZJZhm7lZ87/RoHj9e/ecw6xmQnYP6oPjdW
         QfOxY8e/4jM7hFJSk9LCaD0OWgasTXKoBwslX75QqzjvO8/w/GKhmEl01eTK23g9VS/r
         k9LVI8k3eQKQb2OBtLx6HSrmf6v6E60LXifZJtGMB5dd/mkpmIb51gMvFNIypMK0xsJw
         V/D4SICRJFo/ACkbfsyeG2DX5XQCMcatHTpm3BJlZ8AVrQOJC2Lb32MHcpHFg1wwaFT2
         AUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nx4cJDlCKZ9fU1HAj805dfsVKCPNxoVsjTzwe56667E=;
        b=lRuTO9SVJT86nT2hxn8XsZSZzCygNx7HGlwhqcVGxbAZxPE0CgXWj18+KrVxtrHUYt
         mgI8iVCyRNK0QO82JAjOmRpR7ovZDgi/xm1uEdyVZiRirkKoNf/xG4HZy5FdUzp6LGkk
         0bfNXU2btRNAQT5pQ8ZIte8qE90DQwVvD4j5UWWdFdVCgiS6JnJ+F9EJ0dk09Qd9xwQx
         EW9GdGkO1ow+huR2KfRcInTwk8/KEg4qUe/XiN8D6vF+6+OMebn6HOrGNhAdFaHL0OAh
         UnOonwdI+rwwOrx4dRR78daU/lMJ0QYWSAP/qDsF0afVZcIP4oUS1Se63TR8wghlQ1l6
         98fw==
X-Gm-Message-State: ACrzQf0ZPLHdO+ErdXdBPV6R6jw1bNP0BzD/3PxHl6iSU2TF9D40sP5N
        IE0+2KpJGQfmhWQQB3cgyOZarjDGhJwOp87kef8fUg==
X-Google-Smtp-Source: AMsMyM604N7NwfiJE52AGqgGfOvE09PuWjXnLOWzzJRQX1fQtc0uH2fKcV0YGuRX5XKkil/Gf0sbEs+8WxVgO0N5hps=
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr1489708edb.46.1666079481948; Tue, 18
 Oct 2022 00:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221017130303.21746-1-sai.krishna.potthuri@amd.com>
In-Reply-To: <20221017130303.21746-1-sai.krishna.potthuri@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 Oct 2022 09:51:10 +0200
Message-ID: <CACRpkdYYvznEKQ0huj5XwNwghMP-FRw5e54Di9FLVdXdsFP3-A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: pinctrl-zynqmp: Revert output-enable and
 bias-high-impedance support
To:     Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        saikrishna12468@gmail.com, git@amd.com
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

On Mon, Oct 17, 2022 at 3:03 PM Sai Krishna Potthuri
<sai.krishna.potthuri@amd.com> wrote:

> Having support for output-enable and bias-high-impedance properties
> causing system hang with older Xilinx ZynqMP Platform Management Firmware
> because there is missing autodetection feature.
> When this feature is implemented, support for these two properties should
> bring back.
>
> changes in v2:
> -> Added stable tree tag in 1/2 and 2/2 patches.

Patches applied for fixes!

Thanks for dealing with this, I hope you find a proper way to make
it work with all firmwares.

Yours,
Linus Walleij

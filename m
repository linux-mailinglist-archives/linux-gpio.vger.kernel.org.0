Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B08AE592C3E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Aug 2022 12:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbiHOKDT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Aug 2022 06:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbiHOKDS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Aug 2022 06:03:18 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBD411456
        for <linux-gpio@vger.kernel.org>; Mon, 15 Aug 2022 03:03:17 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id gb36so12668730ejc.10
        for <linux-gpio@vger.kernel.org>; Mon, 15 Aug 2022 03:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=NJX8jO1pYzzhVEPoTBTkL7Gt5+R43W0llgP4O+NknEE=;
        b=4CsAeheZqpI88jrVCMl2Ai+HIPg1QRU2T31EcirAw8ECrKiz+vC+xtLbqswoQ0fOB0
         8noIF8f7rSWmO43r3ua8N1XNq9wi67SqgVtQwjW0t1V0KNfR2uKcuew3vUilbZ5RonY4
         kkIBtBqo/juDP+45QnPwpgeQqMXJwW25ciwd3F6kMhtr9p98qdPdtg9+FDegeaEewrPN
         JAG4DOtpz+fl5YZl3xCUwuw0QAxEs4lq7LqeT2co9rwdHpclvIyKbjLw6KpEAFMmX5V7
         vZr4qyplJqFHV+M6vmeUJ03UBhrqXY67cs4BOFqLx3AqJSBAtlEc3nQKKB73fHOJPhWP
         TYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=NJX8jO1pYzzhVEPoTBTkL7Gt5+R43W0llgP4O+NknEE=;
        b=oHXezmYHjSDn9xKnFbZUPEMr838oXXLmOafzABAhqG/Po+nVmus8007mPFbIi2/sZ3
         iip8iV1ElZO00u1dnEMDkyDh7nKn4BNDFSe8jQK1h72StlmX8cdfz8XdRbwCm88VJ+DV
         0D7wE97xkPcv9fAh5V5bx4Vb9PWEDgjrEpTK4goratem8d6D9AQJ3nQYFfa8d6Kr1ZQ3
         mCP/H6uPJJMhV6iNBwGD8PeSHpgAiGw3Ax8VHmz1Xqg0WU0FyoljkhD+OJCyBrOscvDS
         v4apO7tBWfubMHWE+VQgmYVI8+NcJiH4VNZEbUeDtvt8V5s1YbsHoVerFBSuyRK/LKCp
         86mA==
X-Gm-Message-State: ACgBeo1mJ+yitdt7W3VzAsxWtlC3ld9LnKh4ptyNe7VwAb5yk7aK1SL3
        ACZ1DVCr+LLYwFVqXCjl7MfxA4yaBee/f7sIA0bAZw==
X-Google-Smtp-Source: AA6agR5hGQYDC8LGpVf58AajIYUmJAZOmVsl7JaDj51K6a6u15Jz5PUBvnJPwL0XuxQ4THkDa5RL10/XBiP2v+NWaSo=
X-Received: by 2002:a17:907:7254:b0:731:61c6:ecf9 with SMTP id
 ds20-20020a170907725400b0073161c6ecf9mr10022260ejc.101.1660557796390; Mon, 15
 Aug 2022 03:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220810124109.34157-1-srinivas.neeli@xilinx.com>
In-Reply-To: <20220810124109.34157-1-srinivas.neeli@xilinx.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 15 Aug 2022 12:03:05 +0200
Message-ID: <CAMRc=Me_xqOG64yfQHygS=eBbYaqwqGKt6DK1D1DWr+xkM-N3A@mail.gmail.com>
Subject: Re: [PATCH V2] dt-bindings: gpio: gpio-xilinx: Convert Xilinx axi
 gpio binding to YAML
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        srinivas.neeli@amd.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        git@xilinx.com, git@amd.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 10, 2022 at 2:41 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:
>
> Convert Xilinx axi gpio binding documentation to YAML.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---

Applied, thanks!

Bart

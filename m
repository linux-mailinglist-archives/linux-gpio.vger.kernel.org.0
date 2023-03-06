Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9046ACF8E
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 21:52:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjCFUwM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 15:52:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjCFUwL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 15:52:11 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDE823653;
        Mon,  6 Mar 2023 12:52:09 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id p6so11944026plf.0;
        Mon, 06 Mar 2023 12:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678135929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oux/kKp1lM08/7grSN0HZ+znLDUrmAGftfv0brXoKpo=;
        b=dWF4gRYqHh/tEVbtpDIt+W9gf8vs0vpmqkEL7vgV5h8ShMeeeBg4DOA0W0i7Uw27bC
         fEf2Lwmy99mkXcmn73y7yx3d4WfSl9zmySPV0R19eyzphnQkN7He+pu27N7EX1Ty+B6B
         g2hfm0rRk1aUdaZjK8wN/CJLg5PEiANFT1ecUTf3aMAv+mxEvvDKt1npJEmSw1qiLilj
         rdtQ5ihSPW2hH7xDajrfobWXVZMs3iwwLO5+pOExqhIbGSoD1e5Vpg04/8nkj0ltH6nW
         1v2F/Pd87PpqVvsP4WH9PQqOqZ/K1KobwyEnqw1oIcAJnQdw8+WkovpEtLR72XacW0HB
         MAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678135929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oux/kKp1lM08/7grSN0HZ+znLDUrmAGftfv0brXoKpo=;
        b=Y1zcSm3CL0B3FG3WGLrleiR8N2xl0XJ1Vhvbhbf1mMXEuGAppVeUwwR5+fHa+WQRrp
         ZDlfo+kVvtW2L3kSnPJs+cnjACK+U/cxIzLSitlI+4+/hQhMVKOcPkghifkcbKv998ie
         UV8i/jSvTwDGqFZ3ZPbQ+vMIn6urLk3NEEHTitlIonC0Aw8DUM2sqAIoI712oh4OEnNv
         fbeclCbXY2ipHYchAbmScIUlYQ5hyaGWYLzq8CsuZtVIRNIa7JKYhsjgl38BQtS/am/z
         jiVYpfRb5z9SsrFLRRX2HWUV9DtEYLT7WpWG996onzVMnf3yjMuoaF/VwbMaBQnmUE36
         q6vw==
X-Gm-Message-State: AO0yUKX7H/SAkzOOExzBp5h4bHXWt50PNFbJtha0ij7p6DnscpQycvg1
        7yzbcA9JZPEWIPIwL1ak4qLgubv6oQL953JQ0u0=
X-Google-Smtp-Source: AK7set+U7+BjxK9GuSOyIzk3Mz6GfIoDtNlvzdJ3Qf8VW2ImDlI8u9ebqH7AKGbq+b723nC8ffejrhUx8OcOTjAw69s=
X-Received: by 2002:a17:903:31d5:b0:19a:f9d9:28d4 with SMTP id
 v21-20020a17090331d500b0019af9d928d4mr4768103ple.3.1678135929039; Mon, 06 Mar
 2023 12:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20230306191535.1917656-1-sean.anderson@seco.com> <20230306191535.1917656-4-sean.anderson@seco.com>
In-Reply-To: <20230306191535.1917656-4-sean.anderson@seco.com>
From:   Jonas Gorski <jonas.gorski@gmail.com>
Date:   Mon, 6 Mar 2023 21:51:57 +0100
Message-ID: <CAOiHx=mcANqHTk9=b0TGHa2rk9nppnKa2EB1v05uHb5jhzoawA@mail.gmail.com>
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org,
        Madalin Bucur <madalin.bucur@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, 6 Mar 2023 at 20:16, Sean Anderson <sean.anderson@seco.com> wrote:
>
> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, so I have not specified one.
>
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
>
> Changes in v10:
> - New
>
>  .../bindings/gpio/brcm,bcm6345-gpio.yaml      |  16 +--
>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 136 ++++++++++++++++++
>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
>  4 files changed, 137 insertions(+), 91 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
>
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> index 4d69f79df859..e11f4af49c52 100644
> --- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml

You are (re-)moving the compatible this file is named after, you might
want to rename the file as well then. Going by age bcm6358 would be
the next oldest one (bcm6318 would be the newest, despite the lowest
number).

Regards
Jonas

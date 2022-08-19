Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A43D599C0C
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Aug 2022 14:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348741AbiHSMfB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Aug 2022 08:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348671AbiHSMe7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Aug 2022 08:34:59 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398FAE9912
        for <linux-gpio@vger.kernel.org>; Fri, 19 Aug 2022 05:34:57 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id i14so8538109ejg.6
        for <linux-gpio@vger.kernel.org>; Fri, 19 Aug 2022 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=XZFDaDB8tTHmQs+ge0GoXWvB83xSHTtt9LztyWrp1tM=;
        b=DEKkpJjZoN83asNH+cT99OF2dl2c3QRLw3RqCJ6SvhZEsaqEjFPGBoSSxd9E9Xv0Ge
         MXMBp6wNlGdhr8n23P2iSkn1doBUGxR42OWDLvwAJ3hmARiowyPkAXfTXy0nF06ym/+O
         9HBmNPKP0NtqQqjJfpJVAnhrQotKtj+MQQJTBjRq1HyPKUEkoe/bd5BNBHt1vCPCEhIN
         nBxpDOVi4ooRpyvkZynuGa0ubm9pG36Tnt+Y2apE4+v/HfkxFHS6QQUwdK75r2RgsF3Z
         ubEHzmZ8lEdKdBOuFQ7y8ceLMEIzWOxKt3zk7VMliyqi5LXOwhu1Udifz+Tp5eagnll9
         McOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=XZFDaDB8tTHmQs+ge0GoXWvB83xSHTtt9LztyWrp1tM=;
        b=TAgBPv+tjIzmAfKbiHQ+7ega2VWCSB3ZmKY7am2TSZSvjGfdPXkhRcpeNyUClcN8ZI
         9wGtyFQ6WqI8b9WJW0N2FIPLOaNKHik0AZhexOKASXq8R3Di+MjcJty9OEVlYjp9lEg7
         0URkZc7gtAGWE1G0w2wBY6flEkohSMQLYz/EoBbPprIcNkkIZJ36NpWgYZ6sKgKhnOKC
         ARb9ytbsHPCYFF8qXSNbamSsmoLfPcTPXRQAhWFIa+TOsILMImaCBE6E6tzJh+rtXLfs
         GFdoQMxduQ+v7B4zpZneWoHxKOCpEIuIYFeFu53TbXMUJhN2qE9rHqNdFLKiXmwiS2vm
         64BA==
X-Gm-Message-State: ACgBeo1pTbIFHSgD2TtWH5e2qTTFeoOk5UXHaoP56Z1PHT+aZtAMACDi
        8e/mtgSZWNCIo+G//UVTGcr8vzIblZV3RCM7iNhRZMtqWEg=
X-Google-Smtp-Source: AA6agR7Iz0vh/NqBU04llNk+iQe95LhnVouGyVj9cXHSEkzRKQCmdHCz3iLMfYGmqpJOkioJOXN0gEhAzdvYSU9mOSQ=
X-Received: by 2002:a17:907:2722:b0:731:2aeb:7942 with SMTP id
 d2-20020a170907272200b007312aeb7942mr4696285ejl.734.1660912495811; Fri, 19
 Aug 2022 05:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220816073952.31619-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220816073952.31619-1-lukas.bulwahn@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 19 Aug 2022 14:34:45 +0200
Message-ID: <CAMRc=Mehk8gH1yiE7rZF9P7qrjzkAvDg=_hZ_f+R9S-eZabyng@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry for XILINX GPIO DRIVER
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 16, 2022 at 9:40 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit ba96b2e7974b ("dt-bindings: gpio: gpio-xilinx: Convert Xilinx axi
> gpio binding to YAML") converts gpio-xilinx.txt to xlnx,gpio-xilinx.yaml,
> but missed to adjust its reference in MAINTAINERS.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
>
> Repair this file reference in XILINX GPIO DRIVER.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f69a1c5212bd..7c20a1c9eb78 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22344,7 +22344,7 @@ M:      Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>  R:     Srinivas Neeli <srinivas.neeli@xilinx.com>
>  R:     Michal Simek <michal.simek@xilinx.com>
>  S:     Maintained
> -F:     Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
> +F:     Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
>  F:     Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
>  F:     drivers/gpio/gpio-xilinx.c
>  F:     drivers/gpio/gpio-zynq.c
> --
> 2.17.1
>

Queued for fixes.

Thanks!
Bart

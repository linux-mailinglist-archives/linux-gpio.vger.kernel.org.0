Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 405887BC0BF
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 22:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233535AbjJFUwK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 16:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233558AbjJFUwJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 16:52:09 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890A5F4;
        Fri,  6 Oct 2023 13:52:07 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6c67060fdfaso1681029a34.2;
        Fri, 06 Oct 2023 13:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696625527; x=1697230327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxA7X0kfXMYgoBV1O1X+yHhp+zy1lafQd7Biqyk0F6I=;
        b=w7zT9BLoUeSBTR+8fZauwIDkdcKhM7PW8kT9dwPHXsI0mBcGjFpV8iMH6bhI5CDCPw
         ZKLDeUhyYtjwPzyOB0SjhhOKSdDEfX6wJrJ4YFg1N2+aZRZy9Bv3CLfjvW1vLf1AcMoh
         DB0dCfWW5+uRZDTkR0T38x+Ir4rPGu8LVVJh4foasAiBZXupT3UhDsBp38uW12UqukWw
         1cG/+AUULPnh1iFhP1cFJO4Ukjx0vMND5zjbEQ0dWPvuC8lnZrZvxE7CXpUBFGQFi5Ch
         f1FOjmADeRvJ4yWuGsUZj54SHTD8QbqmgxhyBq4pHXjkG9Col6/fpr9rPHPuLKbSdqfP
         3D7A==
X-Gm-Message-State: AOJu0YyG6dfGEPJ5HPRI877Vy+5Pa/C1jaUCiS9XU24/ozHOlzhwLuib
        Bx9d49On9IWpSqxyrBuh2Q==
X-Google-Smtp-Source: AGHT+IHX3H8MRm6KCZ4S+gOcfHJbAyvk4Xms+EtBBj4/O9yoRvZYjP9vx8dfGltszT00mRSHuPIzXA==
X-Received: by 2002:a05:6830:442:b0:6c6:42ca:ed52 with SMTP id d2-20020a056830044200b006c642caed52mr9250691otc.30.1696625526665;
        Fri, 06 Oct 2023 13:52:06 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n24-20020a9d4d18000000b006bee51de9f6sm679314otf.18.2023.10.06.13.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:52:05 -0700 (PDT)
Received: (nullmailer pid 275984 invoked by uid 1000);
        Fri, 06 Oct 2023 20:52:04 -0000
Date:   Fri, 6 Oct 2023 15:52:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 19/21] google/gs101: Add dt overlay for oriole board
Message-ID: <20231006205204.GA269353-robh@kernel.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-20-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005155618.700312-20-peter.griffin@linaro.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 05, 2023 at 04:56:16PM +0100, Peter Griffin wrote:
> The LK bootloader on Pixel6 searches for a dt overlay in the
> dtbo partition with a board_id and board_rev that matches
> what is baked into the device. If this overlay is not present
> then the phone will bootloop in fastboot and you can't boot
> the upstream kernel.
> 
> This commit adds a dtbo for the production oriole variant.
> The other pre-production board overlays are not included
> at this time.
> 
> Adding the dtbo here allows for a better experience when
> building/booting the upstream kernel on Pixel devices
> as all the DT required to boot the device will be created
> as part of the kernel build process. Rather than having to
> fetch the dtbo from some other repo.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm64/boot/dts/google/Makefile          |  1 +
>  arch/arm64/boot/dts/google/gs101-oriole.dtso | 21 ++++++++++++++++++++
>  2 files changed, 22 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dtso
> 
> diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
> index 6d2026a767d4..3f1761f8daa9 100644
> --- a/arch/arm64/boot/dts/google/Makefile
> +++ b/arch/arm64/boot/dts/google/Makefile
> @@ -2,5 +2,6 @@
>  
>  dtb-$(CONFIG_ARCH_GOOGLE_TENSOR) += \
>  	gs101-oriole.dtb \
> +	gs101-oriole.dtbo

Overlays in the kernel must be able to be applied to a base DT in the 
kernel. Add a rule to apply this (hint: a '-dtbs' variable does this 
similar to -objs variables).

> diff --git a/arch/arm64/boot/dts/google/gs101-oriole.dtso b/arch/arm64/boot/dts/google/gs101-oriole.dtso
> new file mode 100644
> index 000000000000..50832fd94204
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/gs101-oriole.dtso
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Oriole DVT Device Tree

Doesn't DVT mean pre-production?

Rob

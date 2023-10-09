Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD337BEB2B
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 22:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377401AbjJIUEH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 16:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376628AbjJIUEH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 16:04:07 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184FEA6
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 13:04:04 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c9ad9473d7so40995ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 13:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696881843; x=1697486643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=792ACGhD6QjX3gm4sl6mN1ZnGztud0zoUVjrdn9K8C0=;
        b=ZHALqsmkzhqOYDFJcfu/axPofTffo1dsrCiTTswHYNc4mVcvVN02tocv8qEfvHkKw8
         qBSg8z9vnU8sfbN+pyeWDtW5XstfK5EvKWOkeZR5M5RRx2uKBA+z21o04gfADMqsyNND
         Y3+Rx2HUg2gksU4kdhsC+dYLMMn3FwnlxQdGhqFqaKHx2t64rqOsy+APdJeuZoxm/f8z
         VoeeRgN9Bp9rq0YYvsU/2ebqteY14M53iq4CTJ0cFN3FQqxyiXqVNdzv5dvkj4Vkld3o
         SivdRaHbtlR7kBrHNO9Gw3TMh6RevjJk14h+o1QGie5SwINSbfwUM2XiR3afwia6iqJf
         gFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696881843; x=1697486643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=792ACGhD6QjX3gm4sl6mN1ZnGztud0zoUVjrdn9K8C0=;
        b=O6fXEWMGkGnWuXmc2QfUrl7ZW4dz4+0YV4cGzuTLmInQTF7NSdPqE9B3WE4TOnWOwu
         RKFMjRiQnaeGd6YUVN55OOXD+h+j9S1XFkw8klqptsr/Kw/wtITtQr2BK303ti1/YAVi
         6RV/nddpuc4ugQBsI3TCexjxRW9Aqk3IAfSBEUV4oIwLh+QuLgzK7PYt0Fzi4+/zuJEV
         7ki/ZqiQF8qMYE+hWaNV2iZO8k1XPeuFJeAKztodS58znmva+PRh+IPKZnDGcrSv5SF5
         Tm/O0Z/cSXhAD7s5PnYRUYXOScF9/U8LbbQ2dt0xA95c2kV+/sFi82E2Rmx0E8tvhcLm
         +qTg==
X-Gm-Message-State: AOJu0YzI2dK4LJNQWyTypLrOIotMDQuFeEwdAc+QiaIDJbxFIYyN2BF/
        Hr9w5qzwD4Tq7Biv1jXyf/DY8Q==
X-Google-Smtp-Source: AGHT+IGoDE0HuNMIvb5i2H0sYSVhJ0lPtrnwVtRl9vcbmzHn2Ebn09gMy1XHI6WbiXHnD9jwHuRR6Q==
X-Received: by 2002:a17:902:ec8b:b0:1c6:c41:679c with SMTP id x11-20020a170902ec8b00b001c60c41679cmr803671plg.4.1696881843213;
        Mon, 09 Oct 2023 13:04:03 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id k3-20020a63ab43000000b0050f85ef50d1sm8838631pgp.26.2023.10.09.13.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 13:04:02 -0700 (PDT)
Date:   Mon, 9 Oct 2023 13:03:59 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH 19/21] google/gs101: Add dt overlay for oriole board
Message-ID: <ZSRcr6JRbj-wZf7R@google.com>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-20-peter.griffin@linaro.org>
 <7f2032c2-812a-46b5-8914-056cd53c37cb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f2032c2-812a-46b5-8914-056cd53c37cb@linaro.org>
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/05/2023, Krzysztof Kozlowski wrote:
> On 05/10/2023 17:56, Peter Griffin wrote:
> > The LK bootloader on Pixel6 searches for a dt overlay in the
> > dtbo partition with a board_id and board_rev that matches
> > what is baked into the device. If this overlay is not present
> > then the phone will bootloop in fastboot and you can't boot
> > the upstream kernel.
> > 
> > This commit adds a dtbo for the production oriole variant.
> > The other pre-production board overlays are not included
> > at this time.
> > 
> > Adding the dtbo here allows for a better experience when
> > building/booting the upstream kernel on Pixel devices
> > as all the DT required to boot the device will be created
> > as part of the kernel build process. Rather than having to
> > fetch the dtbo from some other repo.
> > 
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  arch/arm64/boot/dts/google/Makefile          |  1 +
> >  arch/arm64/boot/dts/google/gs101-oriole.dtso | 21 ++++++++++++++++++++
> >  2 files changed, 22 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
> > index 6d2026a767d4..3f1761f8daa9 100644
> > --- a/arch/arm64/boot/dts/google/Makefile
> > +++ b/arch/arm64/boot/dts/google/Makefile
> > @@ -2,5 +2,6 @@
> >  
> >  dtb-$(CONFIG_ARCH_GOOGLE_TENSOR) += \
> >  	gs101-oriole.dtb \
> > +	gs101-oriole.dtbo
> >  
> >  
> > diff --git a/arch/arm64/boot/dts/google/gs101-oriole.dtso b/arch/arm64/boot/dts/google/gs101-oriole.dtso
> > new file mode 100644
> > index 000000000000..50832fd94204
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/google/gs101-oriole.dtso
> > @@ -0,0 +1,21 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Oriole DVT Device Tree
> > + *
> > + * Copyright 2021-2023 Google,LLC
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +/ {
> > +	board_id = <0x20304>;
> > +	board_rev = <0x10000>;
> 
> Undocumented properties. Please propose bindings... Also, underscores
> are not allowed, so in this form it is a no-go... although I understand
> the pain of not being able to change the bootloader.
> 
> For reference:
> https://lore.kernel.org/all/20220605150747.GA3465286-robh@kernel.org/
> https://lore.kernel.org/all/20220610163343.GA1787330-robh@kernel.org/

These names are actually arbitrary and don't depend on the bootloader. They are
passed into the mkdtimg tool [1] using --id and --rev and used to create the
dt_table_entries. The bootloader traverses the table and picks the overlay
based on these properties. So we can use whatever property names we want
without changing the bootloader.

[1] https://android.googlesource.com/platform/system/libufdt/+/refs/heads/main/utils/

Thanks,
Will

> 
> 
> Best regards,
> Krzysztof
> 

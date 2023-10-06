Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC637BB1F4
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 09:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbjJFHI7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 6 Oct 2023 03:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbjJFHI6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 03:08:58 -0400
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD3D7EB;
        Fri,  6 Oct 2023 00:08:55 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-59f82ad1e09so21831857b3.0;
        Fri, 06 Oct 2023 00:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696576135; x=1697180935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDvOGTbwmYKB4yj3dggVQge2NMSHumJx3EfGcewWqNg=;
        b=P8PqJC3G4xGo2+ilG1ft2/Fvof8Lb9RvotJJWcCR3e3+cfi+17OQFjLia0vWd8OGqP
         veIej9+m/+D1C+r63oFOplgNuVO/zw0sXdBVAdenYsYb6m02Eg/OwGZCLQb+zPvTRk4O
         2ysBmddfNkWTWe1Zfz6PJhkSGVlFKY1b45BF59lLwUy+0NDp7J/5xEOMCzIcO/83sRym
         QZo5wiPKaoZMnWJYYSqXSpYFzrsAzIKfoazD6nSEoJa4+5OBOaH93WUEFQAyOVpQf/HR
         s/OriPE924HzA3N8s33ZtMew23Fidj2N2Z3cR8H/9NlRs2mcmq5f4ujeLenGzX3iY9BY
         Vobw==
X-Gm-Message-State: AOJu0YzmlpjW4rnsDfxKejp16M6y1Vz2gByJMyZbaTZp1lnYw8OFV2cM
        bz7BWBgztb6VviPOGNt8Af7y0hxoWkh4iQ==
X-Google-Smtp-Source: AGHT+IEzHd2u+JyGUA1VxiF3B0cNwRjyZsMoyah2KMOfTfFEXGCZr9IfDNYyZvfkFLKQKb+xtrobBg==
X-Received: by 2002:a81:9289:0:b0:5a2:4409:2124 with SMTP id j131-20020a819289000000b005a244092124mr7760070ywg.35.1696576134761;
        Fri, 06 Oct 2023 00:08:54 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id u195-20020a8184cc000000b0059f4f30a32bsm1086046ywf.24.2023.10.06.00.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 00:08:53 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-59f55c276c3so21557857b3.2;
        Fri, 06 Oct 2023 00:08:53 -0700 (PDT)
X-Received: by 2002:a81:4a55:0:b0:599:8bd:5bdf with SMTP id
 x82-20020a814a55000000b0059908bd5bdfmr7486809ywa.50.1696576133283; Fri, 06
 Oct 2023 00:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231005155618.700312-1-peter.griffin@linaro.org> <20231005155618.700312-20-peter.griffin@linaro.org>
In-Reply-To: <20231005155618.700312-20-peter.griffin@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Oct 2023 09:08:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgW1qx-7ADh89BRE4Hhk7-+R7o5VrswcBMymxh7zWUnQ@mail.gmail.com>
Message-ID: <CAMuHMdUgW1qx-7ADh89BRE4Hhk7-+R7o5VrswcBMymxh7zWUnQ@mail.gmail.com>
Subject: Re: [PATCH 19/21] google/gs101: Add dt overlay for oriole board
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Peter,

On Thu, Oct 5, 2023 at 5:58 PM Peter Griffin <peter.griffin@linaro.org> wrote:
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

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/gs101-oriole.dtso
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Oriole DVT Device Tree
> + *
> + * Copyright 2021-2023 Google,LLC
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +       board_id = <0x20304>;
> +       board_rev = <0x10000>;
> +       fragment@boardbase {
> +               target-path="/";
> +               __overlay__ {
> +                       model = "Oriole DVT";
> +                       compatible = "google,gs101-oriole";
> +               };
> +       };

Please use sugar-syntax instead of manually defining
fragment/target-path/__overlay__ constructs.
You can override these properties in the root node of the base DTS
using the much simpler:

    &{/} {
            model = "Oriole DVT";
            compatible = "google,gs101-oriole";
    };

The generated DTBO should be identical (modulo naming).

> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

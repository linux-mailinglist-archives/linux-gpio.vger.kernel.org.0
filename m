Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1B8259A8AF
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Aug 2022 00:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242674AbiHSWkD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Aug 2022 18:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241767AbiHSWkB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Aug 2022 18:40:01 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBCED10264C;
        Fri, 19 Aug 2022 15:39:59 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id h22so4386605qtu.2;
        Fri, 19 Aug 2022 15:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=o1V2N3/21S/L5rm01CEaU9XAkgV8Gs7e5rmIl1fTcqI=;
        b=fQ3EFEzQsH4I9zdlRRJhsXRCRwmsfdUj5m7YirLt6JvjXTs3NHwrbH71+Opiqjhdbq
         d4nBc9p0McqIlu4AZ2EMmna6B51dKgj0dZ7qWkRkqtko0mC+p+uY2u+PVbojAStIaYNv
         lfRkVdPBu/78gf9ZEOVr4m3fHqc+X0dk7084UVqaJOApxyNUqFpXcjp6CXp94K5NXgdI
         zjmWEVeWjodWmA+nuvIEde8rWqagCMv8+EYoOSgJcebUBhPA1CH/9gV6AyjnaZg0C5JI
         1Fcfx/mo66tTOTx2RNa8cp5OY2EZHhLeN1akmo8bPTvHpdqwS3gqGrpABGxtvBtLOaYP
         2TqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=o1V2N3/21S/L5rm01CEaU9XAkgV8Gs7e5rmIl1fTcqI=;
        b=KtpP0tcc8KACmRbsuQiRTvboTzL3ELm+cbee765oEvH9pwfeh9Xnw37dvNiOaJh+M7
         Qln+z24z/dmQR8pAT119DMYDgTMwkQ/TeysG5nfVp2/V3FfTGoTKer3DsAZik/na1+iT
         VfFP7X4JOJ1SDN1GXVjVkAvuq6uXBc+5RZRomn5d0Vvg3MCKokkjA75wwldX10oEfkZc
         3s6GUYiymb55rnRaUy11ar+HT371o6nfRfnUte+kCPS+/x7YdoCzDD5mKxHAhCkY7uir
         fYrvrr5Syza9v2r0X5th9vAZKWqYsDfJpgtB47rHF3COVaDv9RZaxv4z2TTiQD97tFBY
         gS1A==
X-Gm-Message-State: ACgBeo3dJkACQAATYy31sLbbz8HOY2qGoFd4jMA4XYvZ5Gg/XvUsT0pf
        LFtwVmUyL9MysDjN+hxJRsWhSeT6Rnr8H9+g+6w=
X-Google-Smtp-Source: AA6agR5HXvwN8JuCSUhl8kuort956Px0aqQTd6TMM0QnjpKCcQ/FO6UbhLaaa+pjpxXTKeIa/7+pTSBgzzT9EobU1mo=
X-Received: by 2002:ac8:5786:0:b0:343:3051:170d with SMTP id
 v6-20020ac85786000000b003433051170dmr8149394qta.429.1660948798869; Fri, 19
 Aug 2022 15:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220817085550.18887-1-shubhrajyoti.datta@amd.com> <20220817085550.18887-3-shubhrajyoti.datta@amd.com>
In-Reply-To: <20220817085550.18887-3-shubhrajyoti.datta@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 20 Aug 2022 01:39:22 +0300
Message-ID: <CAHp75VcRWCKucPwXNv90h4dvsxuECStvjMUG_vLn4FwDwfFK+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: pca9570: add slg7xl45106 support
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git-dev@amd.com, Sungbo Eo <mans0n@gorani.run>,
        devicetree <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        shubhrajyoti.datta@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 17, 2022 at 12:10 PM Shubhrajyoti Datta
<shubhrajyoti.datta@amd.com> wrote:
>
> slg7xl45106 is a I2C GPO expander.
> Add a compatible string for the same. Also update the
> driver to write and read from it.

...

> +       struct device_node *np = client->dev.of_node;

> +       if (of_device_is_compatible(np, "dlg,slg7xl45106"))
> +               gpio->command = SLG7XL45106_GPO_REG;

Please, avoid making the driver OF dependent when there is no reason
to do that. Note, we have device property and fwnode APIs that may
cover a lot of cases for different property providers.

-- 
With Best Regards,
Andy Shevchenko

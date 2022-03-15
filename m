Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDDD64D91C9
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 01:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343915AbiCOAyX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 20:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239060AbiCOAyW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 20:54:22 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C94365F0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 17:53:11 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id u10so34225427ybd.9
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 17:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fhmr+vMVRJ+uJzK784G8d+opHR5kwCeLncvHCwhC7V8=;
        b=kQy3v1QA+Hs7vM1GB/kac+JSnrZoyWtPEg1+IV8Y5ZzR4P3NU67VlLNHPZALJKuhXE
         yW3O3AViZsihifLekuBWYILJr8muyHrcuEjrNU8m9KkwyCeyYqUR81deV8FOaWcS8cTZ
         WW6YGyVJ7rfWfPVqczRP5R6tRz+JaAY6IFVg5G9wyV4Oro5sS3lp7yKkJ5oUVoQfpN6H
         QfsECU9tHG9eLO3MCCuGxWHAyQXfNRLJixqZXTbc8W/QGK3vJIh1yZOfGoGbzt9GoxJw
         y9Kn4eh0t3Hmk+/1fQVHMxLJVMmoRqQriR6mwqcs8l/lc/ZbiZQfrWVJEw8S7+clBPmO
         t+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fhmr+vMVRJ+uJzK784G8d+opHR5kwCeLncvHCwhC7V8=;
        b=zsugu5acR8mk2JDcuTV4vINogfeggzZ5KGf2BUPl4PsBRE2Np03AHWvxgcHFCe1ObU
         t0pIx/bByrfXCYaQvqAnYKIENJUVUaz/BJqDSuRuv+zQyAf/znLSpm1VhlKtvt3AM0EL
         qhokQB82TVsJvzeQehO5JLZfmjSwsMjVBS84+zyB66PfaHJd+0lwQaukSVwmdEiSl761
         BM+BJTfU1TeRWfkLphx+aEWzabQ8tCK40Iz29mCR3UtH4/NSNhI/mpQWpMSKytCF9NX0
         7bUcUhkm4C5i655GlaKN5DgHUIZPVOYezKjf+t1GKwmPkOybHgWX8CAsYZdUkgkjrC6A
         x2Gw==
X-Gm-Message-State: AOAM533CGuASh29XpcnDeOawADoiKKUksiMYZxjx/m3cyS4V/ByX/xKq
        uPkiSCSEB0YyUj1+EocOIx6+yWShhiwmfBI1okACfjb/L40=
X-Google-Smtp-Source: ABdhPJwCqTjafvoGJG9Th4BoFhDYkPdVcerSOYweDyROIMSGSLo3gJov/9/msaD1G7Cn68MaoDXEVdXa+pGi9DfXPSU=
X-Received: by 2002:a05:6902:203:b0:628:7b6f:2845 with SMTP id
 j3-20020a056902020300b006287b6f2845mr21201574ybs.533.1647305590607; Mon, 14
 Mar 2022 17:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220304144432.3397621-1-horatiu.vultur@microchip.com> <20220304144432.3397621-3-horatiu.vultur@microchip.com>
In-Reply-To: <20220304144432.3397621-3-horatiu.vultur@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 01:52:59 +0100
Message-ID: <CACRpkdaz0H0TPPF5npPfahSXgVCMEjU92YHOjxQz=bJGxd7A1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: ocelot: Fix interrupt parsing
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        colin.foster@in-advantage.com, andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 4, 2022 at 3:42 PM Horatiu Vultur
<horatiu.vultur@microchip.com> wrote:

> In the blamed commit, it removes the duplicate of_node assignment in the
> driver. But the driver uses this before calling into of_gpio_dev_init to
> determine if it needs to assign an IRQ chip to the GPIO. The fixes
> consists in using the platform_get_irq_optional
>
> Fixes: 8a8d6bbe1d3bc7 ("pinctrl: Get rid of duplicate of_node assignment in the drivers")
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>

Patch applied.

Yours,
Linus Walleij

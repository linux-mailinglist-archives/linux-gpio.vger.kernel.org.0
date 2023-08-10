Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD8777726D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 10:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233585AbjHJIMM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 04:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234153AbjHJIMG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 04:12:06 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79560211C
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:12:05 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d299ed34bacso2542760276.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691655124; x=1692259924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJweoK4ZYh3U0EvsINRayOsJfCNCoK9vxMyHK6WCgXs=;
        b=DDUU3xJitGdRCILKDyVyWC33xjD4PN9jSqkNtho0Qx10zogQf1l3RhP28iY82LqR1d
         pnkqRQiM3gsJ+JFoUYTcN1ulZKxFFr1B3RAsDHFnAzfuAj6O5bIDTzUznzmoVODgJGyO
         o+qRpEr092dxfp4YkalYZ8FdnLIs+C7tyr1vIRqlPLyKGX9d05LZprAj3p6SWDTFMJiI
         geWmQ+ZP27cVgKduZO+pBwoq7zCBjjT311BVT3Dn3QioC3ML+i8Q/NYk0uwgO477Kpps
         Fg5pFIx9fz2V5b/R71tWK7hofehEeLH198teYsfqEfFOEsNwFsYKHm3pE3tYwX4z/R8p
         GuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691655124; x=1692259924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJweoK4ZYh3U0EvsINRayOsJfCNCoK9vxMyHK6WCgXs=;
        b=gZvILdGSxeCb9muzTolPw3uHKUKVoDuebItzyqHh1SejqBFViM9IlZtIt3xql8wP/S
         F6kEuuaUkCyO81fhNj/6zJUvC/C4wYaWJXZoyW5QFzcqU1kQIfeW/Xss9eXDijjZU2Db
         SJ0LvDea3pxMaTcIUxKEHYWtLjJ52mU9H9oh2DtLlV+loKpRgzyxEPKUmg6RpoAfVOiZ
         b0hmSY6hmphIjzSqvZjyN60Y2m+9FlDiY9YggjdP58vLi6GvbRLIc3Ag34YxxQ0u3Xhf
         lm/hDvdz1Jto+y0K0qUKY+EQqFDn8IbKRmOu5oLjSxHH6uYIBJnC6WlOhUZ8Tw382Uzo
         xoKA==
X-Gm-Message-State: AOJu0YxAA0Y24tVl2XCbnUVjZB5MF2ZWn7rPl9OYnO3XPnDgVC1twRz+
        7GI2WmHJQhbPBTiM3CxvABASwNqEM06XN2JzDO3RYg==
X-Google-Smtp-Source: AGHT+IGp/pwFGRTx2GDrN3NxoG2LUHFk0uLZVSTDxjslx62nVq5L8Wm7J8yxmeeRJkzI1rYPb/eLGitnwrG7KissxHk=
X-Received: by 2002:a25:ad9a:0:b0:d62:d067:d489 with SMTP id
 z26-20020a25ad9a000000b00d62d067d489mr1607078ybi.25.1691655124704; Thu, 10
 Aug 2023 01:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230803094304.733371-1-ruanjinjie@huawei.com>
In-Reply-To: <20230803094304.733371-1-ruanjinjie@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Aug 2023 10:11:53 +0200
Message-ID: <CACRpkdZ6p-y0w9kL0Z+vLEPBwTzAWMgk7yhtKGXP7rU2b9v4WQ@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: stmfx: Do not check for 0 return after
 calling platform_get_irq()
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 3, 2023 at 11:44=E2=80=AFAM Ruan Jinjie <ruanjinjie@huawei.com>=
 wrote:

> Since commit ce753ad1549c ("platform: finally disallow IRQ0 in
> platform_get_irq() and its ilk"), there is no possible for
> platform_get_irq() to return 0. Use the return value
> from platform_get_irq().
>
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Patch applied.

Yours,
Linus Walleij

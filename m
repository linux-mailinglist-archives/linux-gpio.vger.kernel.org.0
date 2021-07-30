Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575363DB6E2
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 12:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238450AbhG3KJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 06:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238421AbhG3KJg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 06:09:36 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977ABC0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 03:09:31 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id u20so11673861ljo.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 03:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y94AS1a4tgcxQc2L0kh6j5VjagWiBRlRk4u/cyvCoVU=;
        b=pS2qOeCk80eD/BMpuN5dXb5bTNKtlSpIaCfiWdI+qPNjl1R45VwIGQw54/4Y9rgtA7
         iAYycg5XAiIqXZdwDHnnnE3js5uKU9iHMRDSLdlenW0yUiNU91J+rWvnGbUhfYoinbfF
         rcOtQWMoKlx/VxtRJXwlRivLsk4YcXF6EbkbsEI1dn2DckwGNMGv3g4Ggm+EpA10s9+F
         YHLazzOlFq7r9iiQFB5BYWXou94owue9Q6xgTiklotLJAKisQ45YUS2IaLsjwdT/17GK
         o4ksvBGSTkD1koeb+cXiXv+fk4+yygNMVaPZVhF55s4VjYL21+ZlQt0geFhRnTtfl6jN
         UE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y94AS1a4tgcxQc2L0kh6j5VjagWiBRlRk4u/cyvCoVU=;
        b=bb51q2juyE+WIPNn817pXtPrDyWm6eOX9K3wpkSU+EOjZgUIP05ovegdeaFvhZhFE8
         sm7WJ8a78G6LSTxBpGZHdAsc8Us0tRpiKyoOrTueTQM+SzHZIrbZWuMTvXe9fDbxSQ4o
         IeczimcQsepQWCmu9UnPPCoeDC2pujUzjeJfioX5OBqrKCWuIqM65uK9WdVybj/SoP1f
         5vWGFtKzpkB0agtAH+fgKL5BZvKsJqbJMG9BHG6uzg32eG3WC/6kkRngUSQVU9KlqU6c
         fj873LOuWYR25I/tRPj5KzQOjOQLMvDQESGvGhw623QI/vMlQJy2ApxhM2FILDuSwI68
         YvEw==
X-Gm-Message-State: AOAM5322gEO17u/WrVopFE5EhH/BV7U665EBqdF54P9Olj/EJ5pBFwJI
        doVn3XMxxRVZCVcXkI5u+I7VswvS1GDWAJplMBrgBaYpi9I=
X-Google-Smtp-Source: ABdhPJzVjgWXqTgHyZbv2lVU9vzv7i9WW1NqGB6fiIcC01+HU4UnLS/z4U9BLgmRjBtOAw5Yy6SQ4S4AT93kaAjOplM=
X-Received: by 2002:a2e:908d:: with SMTP id l13mr1108495ljg.467.1627639769426;
 Fri, 30 Jul 2021 03:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210717045627.1739959-1-daniel@0x0f.com> <20210717045627.1739959-2-daniel@0x0f.com>
In-Reply-To: <20210717045627.1739959-2-daniel@0x0f.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 12:09:18 +0200
Message-ID: <CACRpkda2DFC-u3R=bQjb6XhDUg8iCO=mSHEidcGDFcxv_X0ZEw@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: gpio: msc313: Add compatible for ssd20xd
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Romain Perier <romain.perier@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 17, 2021 at 6:56 AM Daniel Palmer <daniel@0x0f.com> wrote:

> Add a compatible string for "ssd20xd" for the SigmaStar SSD201
> and SSD202D chips. These chips are the same die with different
> memory bonded so they don't need their own strings.
>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

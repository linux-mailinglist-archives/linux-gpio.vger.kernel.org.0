Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 007DB777278
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 10:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbjHJINQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 04:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233989AbjHJINL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 04:13:11 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B301704
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:13:11 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d1fb9107036so617300276.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691655190; x=1692259990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUKzUe/YyFhhVGKQt0xdm9btYh3sRyVbNPpkYzJKMoI=;
        b=bRY2YoCod9u62sIwPgfgb8aYWgek9jPHcXp/hxWWgqGtQZUuDjFZtEEVF5lxydclBF
         nJoKdEVwqq7ihD0E61B3Y9TFFo82SHbFLUT4OCD0iNB7PUqR3EX1LzumZmNdnfTz6hNe
         4E6TgvY+LhWUJ0tl8jT6T9Z7R89Pqfc6QI1kvmWnkv1pNmk4YdmkeocN4GDvYqghdGXP
         C+umo72eBzANdsdWP6pDHj7RFbRRiQ7gEzJjIe9Zc+8vxuy9l3lrA4Wc6CBbGZXuE7jI
         BB960HaGQynFykhVXAkdQ7UjNnjgRPgw/I9CojZ+uOPW8khcdbtMvb9OKicDwYxRX88w
         8i1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691655190; x=1692259990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUKzUe/YyFhhVGKQt0xdm9btYh3sRyVbNPpkYzJKMoI=;
        b=fOVbNhMmvmdSg715raQFxfkCEc9/4I2+kprbW+cF/nH6Qk6mhimEE5XYefEQI4jlWi
         3/SEfKoLyjz4Lp1KO2d9XaWtJSkk4UnQR1xptkj/npggm7u4r8TOnnAx0+x1jjR4to/k
         dkFh9Ul2U0o6PkjsFeQCIGyJ8vSnMYuBirAoKHUX7y8nUIRo+evlfZXlljNn1IY1YrdI
         i2OR+ez7ddpinqZC8YCcbVNETeaWOY9Mok75JmrS20k+9kQvY7agc2DFplpwzSam5TZV
         VejiKvFKlVwe8rNLCPkEHUb9kICtV4FxS1PYzAGZGS8H2RWqT+qroCYQvfyAoOQZZanN
         0X3g==
X-Gm-Message-State: AOJu0Yzd19GacF1JXn2OmSlG90Pz0z7Zd7JcKriumUoSzcS5yVKQ6UFi
        Thg5WsVhl92fwV5EL/TSDbg1m6K0i0bd22AHEGpcQw==
X-Google-Smtp-Source: AGHT+IECw31XWKd+U7j9b/LiSbo9opwGRS/q3/tik63UV+snDZRshYv6V4za3/FUyIWHMnbBx5WXpxOt6SS1GhjOoL4=
X-Received: by 2002:a25:ac89:0:b0:c5d:f2af:5a24 with SMTP id
 x9-20020a25ac89000000b00c5df2af5a24mr2106757ybi.14.1691655190358; Thu, 10 Aug
 2023 01:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230620104349.834687-1-valentin.caron@foss.st.com>
In-Reply-To: <20230620104349.834687-1-valentin.caron@foss.st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Aug 2023 10:12:59 +0200
Message-ID: <CACRpkdYfPin4hAdPxUT7v20qeq3TeqQ9k-jtZLZCvRy0eZ7h1A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: set default gpio line names using pin names
To:     Valentin Caron <valentin.caron@foss.st.com>
Cc:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Tue, Jun 20, 2023 at 12:43=E2=80=AFPM Valentin Caron
<valentin.caron@foss.st.com> wrote:

> Add stm32_pctrl_get_desc_pin_from_gpio function to find a stm32 pin
> descriptor which is matching with a gpio.
> Most of the time pin number is equal to pin index in array. So the first
> part of the function is useful to speed up.
>
> And during gpio bank register, we set default gpio names with pin names.
>
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>

Patch applied!

Yours,
Linus Walleij

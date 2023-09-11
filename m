Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 379BD79BAFA
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 02:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239634AbjIKUzP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235562AbjIKI7R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 04:59:17 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A191BE
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 01:59:10 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-58df8cab1f2so42609277b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694422749; x=1695027549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5j7bzaXTGQxBwdqsbxqml+pJHHm9UN8WsX9mKBjvcIw=;
        b=Deao1VjAsVhk7tD7KBbWFq3JhmweOLLjzn4VQJg1m2vy6kMAq5PppNa/UFICjkcygW
         ETiYjKYjW00ykr2HFlDnNV2C7eGVaEbI66bAddlsbiR+Q1/lzaTGwpzbIgPe9LM0s8D9
         id0RO8+ircRAS77X0EwzdMdetMMbYRqgFNHr1zzlWBtrY484OzrzNGN8/VDSU3102yqY
         Dc17l5orVjCdMOl5fbg2nAtfLpIh6GyMdP2Np5hOFL2Fp2SxOpdx7Lx12tYsUHjn9GHk
         UOO3dFBKr1SVx/Zh2In1Sq1xDa8kxZJvF1cO11hbDq8TNurhelf9LFmXgfhIJdXJGVfL
         U++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694422749; x=1695027549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5j7bzaXTGQxBwdqsbxqml+pJHHm9UN8WsX9mKBjvcIw=;
        b=smV1fdyxdxNdxxYkO8utf3xMiAkf3d/FLQbHTCYgYv2knw+bIe2/ng0a+9kqPTP/wE
         gTAykZ30cku9/a1Gz7fsH7u6vWBxwq4zKDGrEfsn1j9Fb0xu2mRO8a01IK2XHkKnrWfA
         TTPiRHMA4lRSEBz5lNCKkSJ7MmK3acoNQsVcSfYKh3fOgEv6z0rg6ul1mYBUoyB2wi1t
         ZsbtZ+jB/JVjVMA2iwOUBi3aowruFKCWjthz97YRxAONUanqqeTKT27LMqJAUlT4KtSD
         be03M1qahog9m6H30pJouqZoGZkdSqCv+gXw/Zg3h5VE52IsR+JcwbBG7FlFGhVVXRq4
         9Enw==
X-Gm-Message-State: AOJu0Yxg8CCUJ4aof/ojCLiInEzBju3/0Bmmtgeb/xfWlJeE+QdZaZEx
        h+9q9a6Sy8VSDGdeUJLuBqbvzq+utj433T+eC7nsTkZ4IhF16//KpgY=
X-Google-Smtp-Source: AGHT+IFrDkhIuonhGPWsSr/0CsH5jkyOknouXdFhWw74YYsKqzq8F0T7V5nmyx3QoBDjukDUHRvrrhaHI0NsT4T/4vs=
X-Received: by 2002:a25:2e07:0:b0:bcb:9b43:5a89 with SMTP id
 u7-20020a252e07000000b00bcb9b435a89mr8407423ybu.61.1694422749580; Mon, 11 Sep
 2023 01:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230824105703.19612-1-tychang@realtek.com> <20230824105703.19612-2-tychang@realtek.com>
In-Reply-To: <20230824105703.19612-2-tychang@realtek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Sep 2023 10:58:58 +0200
Message-ID: <CACRpkda8_nV1UiDO0_qvcc_z8ODQqckwaCGg6A5-Qm0NADi_Ng@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] pinctrl: realtek: Add common pinctrl driver for
 Realtek DHC RTD SoCs
To:     Tzuyi Chang <tychang@realtek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Tzuyi,

thanks for the new version! This is starting to look really good.

On Thu, Aug 24, 2023 at 12:57=E2=80=AFPM Tzuyi Chang <tychang@realtek.com> =
wrote:

> The RTD SoCs share a similar design for pinmux and pinconfig.
> This common pinctrl driver supports different variants within the RTD
> SoCs.
>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
(...)
> +static void rtd_pinctrl_update_bits(struct rtd_pinctrl *data, unsigned i=
nt offset,
> +                                   unsigned int mask, unsigned int val)
> +{
> +       unsigned int reg =3D readl_relaxed(data->base + offset);
> +
> +       reg &=3D ~mask;
> +       reg |=3D (mask & val);
> +       writel_relaxed(reg, data->base + offset);
> +}

This function is essentially a reimplementation of regmap_update_bits()
using regmap_mmio with .user_relaxed_mmio property set in the
config.

Have you considered just using regmap-mmio for this?

Yours,
Linus Walleij

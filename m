Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18BE05326B0
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 11:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbiEXJmM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 05:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbiEXJmM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 05:42:12 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE2C4474A
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 02:42:11 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id s14so2560576ybc.10
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 02:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F8wdY4yMdIx2anOAYdpqzioRBNxLwJk9fAzK7ujJBbs=;
        b=ex9mvLotku7yv6AZzd2KI1Tv6XNKU/Df2XvJ0Lg/ko42MDRDz0m5GwkXAZTtiD6ywQ
         ApOlzzaAiRY+t1ID/t6EQGMs3sflmlAH8sIMDWbEGSIqDEdRR3y2c1k06cvuZaUmlN9z
         pDYjDG3i9RxJXm3fL7bAY4AU3qCvB9DvNztqtqtMSyKwpOAVu0dnAE16jLRg8smCJEUj
         /H1qQzmBlbhq3Vlv06x3OF0h9q6Xutc2lhbltm7mlOVr5ftrLoDjVB9gZhN9iCwhM1Yj
         TI8Itdh5LvEHTGdRH4zfpgDSfRH3Ol7L27K7WBWXacAnWi11dKCce1QTOULyCbZE5vDM
         aJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F8wdY4yMdIx2anOAYdpqzioRBNxLwJk9fAzK7ujJBbs=;
        b=z7cfAfD3TTVKD6PFT1uc4fYuFlU3gvijGHGz2sGmkuWYq/rTbwMs9Qy1Jqil/atnCg
         pQj+adVZDTYfn1TMWL+nRAmUZEQQU0LQhB30ADbbKcLgGRQgSGMJzV5/JCJ7vOsNtAGz
         X02L79LVSQMOA+rcQMlvMTdlYUXtsLJ134anYs1iZgMhDTx1Xj522txH34Ja/jZAETMv
         ZeJCRDMXYgFbuRDdCSYILp+vWRdd7U57uAaB2Agc9Pdp0LaDcDCnragcrxHdOGT1DIg1
         qpxBIaIVJu415dTfwHGL08bvBqRrh2VnCvMNUHVwKjVfjfpAxWSVTPzcAIx1r4ln3iwe
         QMhQ==
X-Gm-Message-State: AOAM530GMEGVIacKXHcyzdpaPGGFKZbiETmfPikgv0N/XCcRNTyreiNy
        /zZVY0N1/2kigMG6GuYHHa/KqP30rHHvzNDK1m0A9ZzamAA0AQ==
X-Google-Smtp-Source: ABdhPJwlLXKqusDYyN08R2+X01ra3yvMp8vcgO9jj6/KJ4R4Hku7BU1edTeWWPJdEe6lqQz/5mIHrSjczU+8pNc6UK4=
X-Received: by 2002:a25:e78a:0:b0:64d:672b:af3c with SMTP id
 e132-20020a25e78a000000b0064d672baf3cmr26310455ybh.369.1653385330788; Tue, 24
 May 2022 02:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com> <20220524074007.2792445-4-Basavaraj.Natikar@amd.com>
In-Reply-To: <20220524074007.2792445-4-Basavaraj.Natikar@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 May 2022 11:41:59 +0200
Message-ID: <CACRpkda9A6t6ycrA8KWOgK-F8FyBoqLMxtcfDdSfR6xswX05QQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: amd: Implement pinmux functionality
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org
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

Hi Basavaraj,

thanks for your patch!

On Tue, May 24, 2022 at 9:40 AM Basavaraj Natikar
<Basavaraj.Natikar@amd.com> wrote:
>
> Provide pinmux functionality by implementing pinmux_ops.
>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

This has the same request as patch 1, prefix macros with AMD_*

(...)
> +#define DEFINE_GPIO(_number) static const unsigned int gpio##_number[] = {_number}

Like this

>  #define PINCTRL_GRP(_name, _pins, _npins) \
>         { .name = _name, .pins = _pins, .npins = _npins}

Hm this one was in patch 1, already commented

> +#define PINCTRL_FUNC_GRP(_number) \
> +       [IMX_F0_GPIO##_number] = PINCTRL_GRP("IMX_F0_GPIO"#_number, gpio##_number, 1),\
> +       [IMX_F1_GPIO##_number] = PINCTRL_GRP("IMX_F1_GPIO"#_number, gpio##_number, 1),\
> +       [IMX_F2_GPIO##_number] = PINCTRL_GRP("IMX_F2_GPIO"#_number, gpio##_number, 1),\
> +       [IMX_F3_GPIO##_number] = PINCTRL_GRP("IMX_F3_GPIO"#_number, gpio##_number, 1)

Prefix this one

> +#define PMUX_FUNC(_number, _gname1, _gname2, _gname3, _gname4) {\
> +               .name = "iomux_gpio_"#_number,\
> +               .groups = {"IMX_F0_GPIO"#_number, "IMX_F1_GPIO"#_number,\
> +                          "IMX_F2_GPIO"#_number, "IMX_F3_GPIO"#_number},\
> +               .index = _number,\
> +               .ngroups = NSELECTS }

And this

Apart from that it all looks reasonable to me.

Yours,
Linus Walleij

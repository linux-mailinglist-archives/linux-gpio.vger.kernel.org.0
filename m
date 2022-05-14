Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1F2552710B
	for <lists+linux-gpio@lfdr.de>; Sat, 14 May 2022 14:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbiENMm0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 14 May 2022 08:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232310AbiENMmY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 14 May 2022 08:42:24 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E44E36B5C
        for <linux-gpio@vger.kernel.org>; Sat, 14 May 2022 05:42:22 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id ks9so20818183ejb.2
        for <linux-gpio@vger.kernel.org>; Sat, 14 May 2022 05:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hRnLpO/vGNyAzalgBhdGnpdFK3PK2031kfdW64SMwFE=;
        b=daKg/FvsO5TGUS/n1nc7t6pZituJwDpn5A6eSXIcXsT++RFV0Vi0LH+19JSB953FyO
         uOlg+fYwueL3neA+PiCRi3tH7d2SAsT/+u6mNsqn74eEuOg/hc2Nb1w9W+W0rnOOBd5j
         K5Qo4/T/Lg4vtuQJLT1Zxet+R/1t0zoOXhaSXYZErzcUJskcNalryxLGP770qOSb3wpo
         XlVXqQtgU3en55Xy4GjL0wVsAQnTFqwC3JQRdfFHD7p/c2FAfp1jNULQB2RXlNsE30YD
         7AGleocv21nbuYzR3aqkCk+R7f5a1zKO8ugJxVSZ5xFNeNm2uLdZt1PGr5rWi9S7Yn8v
         sGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hRnLpO/vGNyAzalgBhdGnpdFK3PK2031kfdW64SMwFE=;
        b=b98MuJbbh98HmwLLYnOL3V4L6acgCFrWoxlhr7/awJTiHegk8IhTB/HD+jzosE8pgq
         HgLyBVl9GErrZ2TIJXg3xoTmAZ0p7UCIv8Dht+90aGm2RfBaw5t1A4u7frTMbw0TeS63
         8I6UBAuAvocIKk5Qeuy3eCUG4WXJtXymhD52g1QC2Dlq4VA+Thh18Hl1dY9p9yFu7AtY
         2wq2WidIAXInPBLNnDrOkyAMtAyr4ysAb0OfL/S6h5EawV4tP0O/EugMHdBUs+2VzUUF
         VvUlKQG7fpHLo8eR3UayGAdZzY6oh0ZhnB8lWSFbm20PaP0nDOkoZQh8gXrGq2lUt4Ts
         EWug==
X-Gm-Message-State: AOAM531bc1SYQXXfS0C/KQNmLH00AwjuwDcxGjhOgCbvUqPRVNRH/rdE
        vl+lnHyJI9ZJFs1PWiHjxy90YEx+2rt9zP3mSPQcNQ==
X-Google-Smtp-Source: ABdhPJz12jMhITzZglIWDyOoX0BkDTF8ljtGTSwm8Nn3Elxho/Zr/VVHe2gBR4lyTST9w7Waa2xLoPx9JA8RhGfAMXE=
X-Received: by 2002:a17:907:c28:b0:6f4:2a80:f355 with SMTP id
 ga40-20020a1709070c2800b006f42a80f355mr7986236ejc.101.1652532140919; Sat, 14
 May 2022 05:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220511205959.10514-1-mosescb.dev@gmail.com> <20220512071415.2786-1-mosescb.dev@gmail.com>
In-Reply-To: <20220512071415.2786-1-mosescb.dev@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 14 May 2022 14:42:10 +0200
Message-ID: <CAMRc=MdMfNox-aaE7iN9MkU-6BxWu+fnhc_sP+QHVO+trQVJ+g@mail.gmail.com>
Subject: Re: [PATCH v3] drivers: gpio: zevio: drop of_gpio.h header
To:     Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 12, 2022 at 9:14 AM Moses Christopher Bollavarapu
<mosescb.dev@gmail.com> wrote:
>
> Remove of_gpio.h header file, replace of_* functions and structs
> with appropriate alternatives.
>
> Signed-off-by: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
> ---
>  V2 -> V3: Add missing return in front of dev_error_probe
>  V1 -> V2: Move gpio_chip member to top of the struct
>            Use dev_error_probe instead of dev_err
>            Minor style fixes
>

Applied and tweaked the commit subject a bit (dropped "drivers: ").

Bart

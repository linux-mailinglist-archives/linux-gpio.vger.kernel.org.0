Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67120734EAA
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 10:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjFSIxd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 04:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjFSIxE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 04:53:04 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C352110EA
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:51:58 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-bc476bf5239so3489828276.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687164718; x=1689756718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBwiRtnNLuDw3VW76KF3adxsJHja6pYQXr29NX53oxw=;
        b=sIyaQSCUAwmh0dDgqwb4R4xc5wAhkIb1kTvhyuEA25zvuId4iaFZe9EIjgsXEz+H8y
         /kSPU3Tw2nVhXa4bZiE2uLa9BV6yyLrAxMf/i/zx/AGjw303GWfvFN6ARfEHnSqDqBYS
         c3wrtiGTv4P497aFwtYFEnWVOj1a78s+dsc5Z4kKR2fhHnrozmZjym6249i6Bhcj7Yoi
         jj+2mbvafAT5hZ/8ffY6scH55Qe6cA43RXwQqKClko86UsXjWWba+W3z2KgjGhKvqnrZ
         0jFMSWEXfqvmsdN8ds2FOoqUNSs/l212ZlPl4XK0MPi00TE4tWOo03yO1WYO6l9KKd6i
         sqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687164718; x=1689756718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBwiRtnNLuDw3VW76KF3adxsJHja6pYQXr29NX53oxw=;
        b=kZ1/ocB/YWWv0w1D9wESXafnDB4LhNXGlosx2pC0Pn7FOSmf1rR4vs6JuODU61vuK6
         2G+1CFaRa9VZMZd7rjfYbKoutaElSeBQzy7maLMjJN546xzVjyowAazEpSOjIq18eHXR
         eoUut3X4PAcC+c7jjmq6VQ8I1zsUr2tb0v2PBKg5ON/6HstIgG8FcvrUvGe7Z859diDk
         Og8oZ3JVYrhzEGT1deYgc9GlsS579XEhBsSeGTax6BpiV3WoY05Tq2O32Pek1hRtH4qm
         GugFU8tm+cg//W43CIDObUoNzIJk54nzcZKO5EejUp8OA7EpiDLL7qosDhUpWjdazUA6
         4pWA==
X-Gm-Message-State: AC+VfDxtvQzalWxljT4HlLaD4/qvPRU3GkYyHcrPDnQicyMrz7X60iLc
        cJblLNuchDk6JJQWcmLr4p8X4J6eNi8m2VLIS2i7uw==
X-Google-Smtp-Source: ACHHUZ5WH1oMGiYWP5bDrggvQiakiCRNxMMXJEFaSbH+xRAAZF/DZelyjUR9nPWup9sabQt9U+GmXs87B5zfYUFDN/0=
X-Received: by 2002:a25:9112:0:b0:bc8:cd2c:2fb with SMTP id
 v18-20020a259112000000b00bc8cd2c02fbmr5860163ybl.9.1687164717947; Mon, 19 Jun
 2023 01:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230619082104.699331-1-arnd@kernel.org>
In-Reply-To: <20230619082104.699331-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Jun 2023 10:51:46 +0200
Message-ID: <CACRpkdY3S3f7CuegyZaS+QZcF6p7OG=PB-89cmdJkPnr4o6BYg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mlxbf3: remove broken Kconfig 'select'
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Colin Foster <colin.foster@in-advantage.com>,
        Lee Jones <lee@kernel.org>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 19, 2023 at 10:21=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The new pinctrl driver selects GPIO_MLXBF3, but that can not be enabled y=
et because
> the MELLANOX_PLATFORM symbol does not exist in the tree:
>
> WARNING: unmet direct dependencies detected for GPIO_MLXBF3
>   Depends on [n]: GPIOLIB [=3Dy] && PCI [=3Dn] && (MELLANOX_PLATFORM [=3D=
n] && ARM64 [=3Dy] || COMPILE_TEST [=3Dy])
>   Selected by [y]:
>   - PINCTRL_MLXBF3 [=3Dy] && PINCTRL [=3Dy] && (MELLANOX_PLATFORM [=3Dn] =
&& ARM64 [=3Dy] || COMPILE_TEST [=3Dy])
>
> As it turns out, the pinctlr driver still builds fine without this, so ju=
st
> remove the select statement.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

Yours,
Linus Walleij

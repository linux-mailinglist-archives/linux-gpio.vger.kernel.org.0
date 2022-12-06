Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27B2464459C
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 15:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbiLFO27 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Dec 2022 09:28:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbiLFO26 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Dec 2022 09:28:58 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4B1DEC8
        for <linux-gpio@vger.kernel.org>; Tue,  6 Dec 2022 06:28:57 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-3bfd998fa53so153547567b3.5
        for <linux-gpio@vger.kernel.org>; Tue, 06 Dec 2022 06:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GHH87XVWERSvE18mOsJw+LbTPKp81xOtlyyzDFdzr3g=;
        b=VDvcMTIuvEiEAMx0cdOAZtcEAvnxuLj06wPPFzU/m38rC0BvU4Qxl+fWpVul6Nd0fx
         xUR182sMyIe1FGONTdDUJgRL3DXaJVkzW3DuRFOMZTG6IxD0TLQ2rN1p1yn1QNq+uVec
         h5wuyOtSjlWn0hQPGU8ccHI70qBoh8IQhMibMD4Efi6HPnhJ0yC2NzbjGInfiFHzJthZ
         C7Shev9xpyNKtQYlRAIHanTWIv+nE07TFrHrPmhyNG/a2R0nPtSbg2esuuX+8sw7Jg/x
         JRvMSdSqfqqjI3SZOf+ggzcvWrmtO8Ow+Sju2NtYmHuLBp7IT56ed8v/TtjihYB35WAj
         iI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHH87XVWERSvE18mOsJw+LbTPKp81xOtlyyzDFdzr3g=;
        b=7d7dqinuEH91QNV5fWO6aUHo//9OdYoNChFsJWwk0dDqnJC/AgE/nIMFliUEqOWy/x
         S+Fj4TzyfCyZCFqRqlLuDXR1/qrku9ASumY1VetKb+C7v3TPjRVaiKSxNd1A8iNLgmWj
         nGH8PFj8+gdm0ObNPVKRuzHfaN7KtobpZWiqam04w850ZDWSlvpJh4/PTUrRGw3ohA7G
         rDmbz4UG/AA4fOXqc93+YTkjsuUNDs56btzM7V9PXUfEUywiR47go3yqlj0p+Bfdbqy2
         DfiZHUs+hZLr5WyUzMK7AlaAXawT8Z7uKp7+sW98jY2sQkCySACyjwgtP6WrlRwGsvWJ
         zn3w==
X-Gm-Message-State: ANoB5plvjzlUG2N9kfwxqrfcsxnA2/xkqLX+kv+mFI+EiQ9dA9W78DZ9
        WAGi1iVrnloMbORn7bGOcYK8maBq0Ia7bN9fxt88Dg==
X-Google-Smtp-Source: AA0mqf6G3qTbY54ljyPZJBOb+vNeaixzys7U8njC+rkhlmiZLNQkkKrTIQXfDLDT4arBIRUqgcBZxtNyDqUiCdqmLcs=
X-Received: by 2002:a0d:e645:0:b0:3bb:6406:3df1 with SMTP id
 p66-20020a0de645000000b003bb64063df1mr47647864ywe.319.1670336937120; Tue, 06
 Dec 2022 06:28:57 -0800 (PST)
MIME-Version: 1.0
References: <20221129120126.1567338-1-cuigaosheng1@huawei.com>
In-Reply-To: <20221129120126.1567338-1-cuigaosheng1@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Dec 2022 15:28:46 +0100
Message-ID: <CACRpkdZeLzBCmde3=756n+k53vJZn_sQgeoAeGrBmAQ+4Kv0rw@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: thunderbay: fix possible memory leak in thunderbay_build_functions()
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     lakshmi.sowjanya.d@intel.com, kiran.kumar1.s@intel.com,
        rafal@milecki.pl, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 29, 2022 at 1:01 PM Gaosheng Cui <cuigaosheng1@huawei.com> wrote:

> The thunderbay_add_functions() will free memory of thunderbay_funcs
> when everything is ok, but thunderbay_funcs will not be freed when
> thunderbay_add_functions() fails, then there will be a memory leak,
> so we need to add kfree() when thunderbay_add_functions() fails to
> fix it.
>
> In addition, doing some cleaner works, moving kfree(funcs) from
> thunderbay_add_functions() to thunderbay_build_functions().
>
> Fixes: 12422af8194d ("pinctrl: Add Intel Thunder Bay pinctrl driver")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
> v3:
> - Doing some cleaner works, moving kfree(funcs) from thunderbay_add_functions()
>   to thunderbay_build_functions(), and update the commit message, thanks!

Patch applied as non-urgent fix.

Yours,
Linus Walleij

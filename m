Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD5EA578DAF
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 00:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234908AbiGRWoY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 18:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234888AbiGRWoX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 18:44:23 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2336D248EE
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 15:44:23 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id r3so23558293ybr.6
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 15:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kwm8lRNyu/PQCems8jzAF0qMpwZBnlHnV+esZ+mc4PI=;
        b=xHMVJiW17kc/mu3yiFaF5CT0LQKg3uVVjY2n9ySAg/TUMC3eOwMbwMHgzFe5+GTsQG
         sYiQaBP5MCju+GpyScCTpNslS54BPcmPx5b7+OK/oBFPCozD8jIPkpkLnSWnIV8pdSn1
         VJJ90G8bHsZD1LWPEWJRuEt4ohfhCNSFwLd+1qRIVKBctz8HswGaF4EQlZHOixGdxegM
         QS6TZeUBA9WVYyLpcVGWm+uyei1h88TZzVc7mlu6qpVYJD/XQjjObNUFNLhLKc2t3RQd
         t6uMyu+e8NTdc7kQf8o2WXzBg7R1wOl9hLX6AWLFBabx3bId+JuS/eU3N5dc9h6r3LiY
         j5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kwm8lRNyu/PQCems8jzAF0qMpwZBnlHnV+esZ+mc4PI=;
        b=oYIv8c+J3+3/Aolt2D3lnCIcCz6GCRhqLp4Wq6i6FuATbvumpdO2zQu+kFO9xNCPXG
         B8QtMZwktWUmFCuS+v3kQQK0VCrXQR/f7ehhKNaFl58ugULqEZfmHrDt/G1peBG73DYi
         14ykakFldQmDQTiz8/S6jQya7j4msGH/qM1bOsDQcCUZppyp2BoSrAny+X8rUXV6ibTZ
         dNj/19FPTfgBLFp1wZ5DQKBquJKd/KktE2I1VgurlD/LMvGvt8O8WyA6b/lFQZSqliFd
         R7TobUCxRPB9pLKeofPBLqe/xEZB3Kph/RblOJRo+tsm9VSmEqyW0I22F1u9NMoPMU4Z
         UiLw==
X-Gm-Message-State: AJIora8TEoaeqLXJ6Zp+k3ImMPKSMPZedOcNAbZZMV94TLGTbEv5o657
        0Trf7Y9Wz9lWiT6nDgM4JYq+V74HyV22i+6Rcb7bXnd15n7/Iw==
X-Google-Smtp-Source: AGRyM1sqX+KncDnwZk5GSHFy14E33nQb7QJbSX02oMaKwgBtQQ6s/ChodXHcuRJ+CX3YJBO1TdaMEIxwvi6DIABMM40=
X-Received: by 2002:a25:f508:0:b0:66f:3c5f:c39f with SMTP id
 a8-20020a25f508000000b0066f3c5fc39fmr28134532ybe.374.1658184262387; Mon, 18
 Jul 2022 15:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220718220252.16923-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220718220252.16923-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Jul 2022 00:44:10 +0200
Message-ID: <CACRpkdZPPEWxkwRjtgEj9P+Mij_BEfE-X6fHpLL_GkpXYfw6CA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: 74xx-mmio: Make use of device properties
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 19, 2022 at 12:02 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Convert the module to be property provider agnostic and allow
> it to be used on non-OF platforms.
>
> Add mod_devicetable.h include.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

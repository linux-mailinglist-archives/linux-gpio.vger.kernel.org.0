Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C039596437
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Aug 2022 23:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233835AbiHPVIY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Aug 2022 17:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233462AbiHPVIW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Aug 2022 17:08:22 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BFD711A1A
        for <linux-gpio@vger.kernel.org>; Tue, 16 Aug 2022 14:08:20 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a7so21226261ejp.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Aug 2022 14:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=gQVd09TKBoK8myxx9+Kk6j7arplddUDBcJdpPSvQ9N0=;
        b=crCJwXLmEvPMSm86Sva0Xcmf7BIt21WtW9u2OR1PDBYvlSd51fDec13ktq12ylm07b
         V0p3KlPOXf0y0uvfPWHzB5Fi5UGStHw84wFGZ0/34v9Jsko1jcibPEgCTQbs0r+dPtqy
         ywy2yuLbLNxvViCfjVJ3CnvYRmZdM9BpyL69w7bpxMZxM16gfr4EoGrv6fkNZkRokDMz
         rucbT153NSZdeUtCGXQEegLHjsMLOsBeGxEKyzcArzDELv+MrxYoIOgsyM4Co3luz2DB
         2WO9yapIUjoqORrmUgWUiqNwehZ55xN6IcmPwOqxUV/sVXFYqrQ0BEA0CnSIdf63s+wD
         HPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=gQVd09TKBoK8myxx9+Kk6j7arplddUDBcJdpPSvQ9N0=;
        b=tefQNe441C8mwfxuHVbN4BgyDVxrEpuoYT5daMvxpLNsH5YR76TbVwqqLegGoXrAhc
         294E/2UOqfyHV/dvVh+pVJGDIWhbpdt1EnAQ9UxGgqG1I22UUYG2IoRN13RVb2Lg4ku9
         jDO9PysxrlIOre+/sN6SMpSt8Ma0LPoF6opwdBjT3y2YM8HwENs8PvuZuZwiXVlo2CDJ
         z0PpwG9PVPm0DAFBdQMjCfDY8OtQwWhq92LpbDbwO91XBBFAADwRrPxrLW5zPRqe4Kea
         dQC+SvVmTQqLPHxnTpf9Wh5sSySKqjxg0VnOwVnjxa0uzg1uCjNxakkmJ+IVLGI7JLoE
         Yv5w==
X-Gm-Message-State: ACgBeo3DNvg7KwZviBFaHg/9NNRAe9//ZwJh/rxdfKa4xHtbfTI4TZPd
        z9+pETZ3X++DIyg9HLyFNqEWgiH2dTcY9xJkyoFh0A==
X-Google-Smtp-Source: AA6agR4o/fiLkA00xTrIced/qX5cVBySwCdN1B+z2JKrH3HJvjuglFXBj3jY/Fz+dAIXobKjAJien9JfTQEDL9KOmc8=
X-Received: by 2002:a17:907:9628:b0:731:1e3:b168 with SMTP id
 gb40-20020a170907962800b0073101e3b168mr15114815ejc.526.1660684098677; Tue, 16
 Aug 2022 14:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220815091929.130547-1-brgl@bgdev.pl>
In-Reply-To: <20220815091929.130547-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 Aug 2022 23:08:07 +0200
Message-ID: <CACRpkdb3pwZMoL=G0QiRLyLdVA8m0=PwFyZ3-EE7r649PTz10Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: pxa: use devres for the clock struct
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Robert Jarzmik <robert.jarzmik@free.fr>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>, Yuan Can <yuancan@huawei.com>
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

On Mon, Aug 15, 2022 at 11:19 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> The clock is never released after probe(). Use devres to not leak
> resources.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Reported-by: Yuan Can <yuancan@huawei.com>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

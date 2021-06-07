Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A3339DBFA
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 14:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbhFGMLI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 08:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhFGMLH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 08:11:07 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A081AC061766;
        Mon,  7 Jun 2021 05:09:16 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id g6so12924997pfq.1;
        Mon, 07 Jun 2021 05:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VfaKSpOPN68fbunxi9Wd1CjX2Xd/IeFmWOOjECL1YQI=;
        b=vH3dDKe027sR8HHni53Akruq6MuPmUvEgsFtR1Agr2oSjVXdccvY3DWahH6hnV9lS1
         8r2N8scuNHRwhKyI3dFyhbZJF3FwqonfrpJtHm8OJiiBQscuNEvl5kMyc70det5hfoma
         fzOwK1DyMDO8YrR3O8uGFftWId2DnPpb8ZCvJs4Cup4ocm0dvMZBheFiRG9+fZrgAmU+
         BNzQ53h8eIyNNMWaIgnOeIvtIQoSWq3T/yIlnCXR5ZVzCGaB5fP13lXkd01S7iMK4cyW
         KwJI1EdcrVXDFEwqBR7ETlWW+eoJ3rrqI0nShm4AlG8TFpt0+qebKQXO2Xhk/qVVJRWI
         ugBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VfaKSpOPN68fbunxi9Wd1CjX2Xd/IeFmWOOjECL1YQI=;
        b=baIhjzmWJKm8zwbfuf3OE2kxvoxs4hn8nb9St0HIEXWyhT458OS8nSu7YDuxgYAgez
         jlJlyB5KEZjWK5wt199hwD7zG38ax5aatYk3mHVTPR7Dt9XJRNixlVmYsxqQ3GnsyiTf
         7wyYMsqDyJ/XF0njOCOcPr35z/5zT92C8krYaDeZhYDgWTzFwihZ8jWEhsnv+d43Fuv2
         CNoLGLVIsD75AtqIzPCrtf7vuJ/ZXt3lb33yNkQrjRPB/NSACBtbby2OLxPtWLiGnNDr
         v5PBE8CnfkZDKjIRM4Kss69CSEEjGwqleBHqoiSj1iTqkqPZo69IC/vc9Qqe46yMoSl5
         nTEg==
X-Gm-Message-State: AOAM531/z5AaUuDa4Okh+bT9A+OTfpW6dqrXKzrhxbY1+mEgt2MRvuP+
        T2P82D5w3o3HZ9Qmd7QTpRF/0oWQaEgUK+Qyjf4=
X-Google-Smtp-Source: ABdhPJy0MxSyT8V/S1IJrEDeletyhYpO1Vhhq/88aagD+5il4xJ0URp8rE7mlJZ7lKCT/s+XSCwAtSSXIeun13lRm2Y=
X-Received: by 2002:a62:e404:0:b029:2ee:f086:726f with SMTP id
 r4-20020a62e4040000b02902eef086726fmr6738641pfh.7.1623067756139; Mon, 07 Jun
 2021 05:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org> <20210607113840.15435-5-bhupesh.sharma@linaro.org>
In-Reply-To: <20210607113840.15435-5-bhupesh.sharma@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Jun 2021 15:09:00 +0300
Message-ID: <CAHp75Vd7z6ivOxHikqP5j+yPtV7C8GBogwVUAziLznSatH+8EA@mail.gmail.com>
Subject: Re: [PATCH 4/8] regulator: qcom-rpmh: Add new regulator types found
 on SA8155p adp board
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 7, 2021 at 2:41 PM Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> SA8155p-adp board has two new regulator types - pmm8155au_1 and
> pmm8155au_2.
>
> The output power management circuits in these regulators include:
> - FTS510 smps,
> - HFS510 smps, and
> - LDO510 linear regulators

...

> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: bhupesh.linux@gmail.com

Use --cc or similar option when run `git send-email`, no need to
pollute the commit message with these.

...

> +static const struct rpmh_vreg_init_data pmm8155au_1_vreg_data[] = {


> +       {},

Comma is not needed in the terminator line.

> +};

-- 
With Best Regards,
Andy Shevchenko

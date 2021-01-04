Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04E302E97F6
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 16:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbhADPBO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 10:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbhADPBO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 10:01:14 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BAACC061574
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 07:00:24 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id m25so64917927lfc.11
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 07:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tR4uUSuiT2yNCjy2l75xxGnO77PWcJQ+DtWty5i0rMc=;
        b=LJ/AsciYj2BKHcnJ73UgKyavCV9Qw6QPv4rj+dpkZQo3YhzjsIYgubutakzgyTilOD
         BP9w87saYt2mwvs7pZCpYcL045gJziDe+nWIOEIroRJOnA/6w6C3nho2eTCijDeSKdjt
         PBqhmEKevTBMFjsa0IcaooKAmbg3t91gOMxVs09uohr1nFJay1Z1SsD25Pw+7ggP08aJ
         5qjrV116BFU7LMFDr/xS64uW5vVHC3/z159BsSxs/JhDkCYSr0Lhd9QeDmh2c6lqrcBl
         BvcUQtSkdSewYsZD9JVB7IA4M8OtwXfkhg1fq/nM+bJu/vwBI0RnGutIae+G/ZtFnR4+
         UEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tR4uUSuiT2yNCjy2l75xxGnO77PWcJQ+DtWty5i0rMc=;
        b=fyC7CTOeoDt9Ba1dWyc4DaxckdN+RgNaxSlR7aMh88ZJXXJk7RxlKzKm6qObLXISSP
         1n8KScr984cuLaIWBZr3WLspoijAWPHJvhdTuOZstOTqWR8dnNpD2d+73oX4Tjr8UHx9
         DL88InysPeywhkW8r2tontPIT0lgU2HCSsXY/D4TKS9ouBDBJ87HnOE4wbDPW5GmXV6+
         Ftt9yTFyLFTqlCKSVAWPmjrVkhMPEksMOOfj813ZnD8AywsQ/cPi9fS/V72Rpy38q3Kg
         V6e9HdYr2wbYL6v4O0110E79fGGp36f2hTheTZ2c/iyHBD5usdFL2j/40kWw8gTQoPEM
         qt9A==
X-Gm-Message-State: AOAM532g0/Tp4PCsKkTIl3KQCA7zVkZxo1OIjrk3FFX8gUjup7YstCQl
        gtB6QzhyAt8UcajDQ2Kf1w2qw9K4wXvVcMNURtTGH3wTHSo=
X-Google-Smtp-Source: ABdhPJw8BDy+1PA7BTXsFDKivU2qz6c7DgAaqRK4RmPbkQPgVpVra4mzO3RTstCIcQRAlI3tqm7JphEKl6JVoakBr3M=
X-Received: by 2002:a05:6512:74e:: with SMTP id c14mr34844158lfs.529.1609772422734;
 Mon, 04 Jan 2021 07:00:22 -0800 (PST)
MIME-Version: 1.0
References: <20201217144338.3129140-1-nobuhiro1.iwamatsu@toshiba.co.jp> <20201217144338.3129140-5-nobuhiro1.iwamatsu@toshiba.co.jp>
In-Reply-To: <20201217144338.3129140-5-nobuhiro1.iwamatsu@toshiba.co.jp>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Jan 2021 16:00:11 +0100
Message-ID: <CACRpkdb--GSy-0vnAFS9Pik4TjrNRTrYeZr2RBZD6SFM8zotyQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm: dts: visconti: Add DT support for Toshiba
 Visconti5 GPIO driver
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        yuji2.ishikawa@toshiba.co.jp,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 17, 2020 at 6:45 AM Nobuhiro Iwamatsu
<nobuhiro1.iwamatsu@toshiba.co.jp> wrote:

> Add the GPIO node in Toshiba Visconti5 SoC-specific DT file.
> And enable the GPIO node in TMPV7708 RM main board's board-specific DT file.
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this patch through the ARM SoC tree.

Yours,
Linus Walleij

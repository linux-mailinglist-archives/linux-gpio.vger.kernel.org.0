Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1917E3E9220
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 15:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbhHKNDs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 09:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbhHKNDr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 09:03:47 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DFAC061765
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 06:03:23 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id m18so4475626ljo.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 06:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zuMFwAVD6fY0KArmeR9wSduaNs/aEjUW6qkJa3ECyv8=;
        b=TCpUp5F1rIsu50ljO5tUd8VYmUjjBPVQQXUGND2l8iThkPszFllIURH2d9QO5Kp3wr
         20hdUcM+6Mq2hwT8/HawHY7iF3d23NShYFzrA0yQTxhpIVWNWG6J4+mwqwZRds7vSWkn
         ryr9QAZapCb+OCy9ATaGG5pWUNjSb0zXfOsY4sGS9wEDMP4gMGMuPjB4EBZbhBJ4ZJau
         qYXAq8dS5PbHEiyDb/SNZ+os+lZI8mkwHbsYaFgwJ+E7cCOvstIh2d3ZmcSjmxSrk5tr
         XZ0kwT+zphh3jDjsZruTgmXrO7y+kZ3ssAa6Yha3uKi5GrbF+U7p13/r2FIWYwnzAxBW
         aX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zuMFwAVD6fY0KArmeR9wSduaNs/aEjUW6qkJa3ECyv8=;
        b=d93Kp41LhnDOEG3g2s9S3isR2jtFGTp6gIe2GtkQp13v76a2cHWSnPCdrhG0IRpI2P
         HuJ879sPrACfVjosbakW5DZv1AZZPz7OWVU27Svp0V4HGaznulAASTHjKV179mWjTOgK
         4/IvHzg0gpFNemrmEIjrcJYcDXGmqJKe47FvPqWoRCSJldy4v5P1/V0o61XzUVaeQZ26
         Fs5GJHDhBzD26i/f7FPiLDgTcAd/mp6muYoQzckXqYBTiS+VGuOQ6vQNLbQWM4V+M3Gc
         ZpyDlLA9dOcPNLKdMy2EVirFJedc8h0BELW2t+KBzaOGgMX7h648c94Vptt1B+oPtoh1
         Nwfg==
X-Gm-Message-State: AOAM530YhYkPqW3pSo4KNr3cNyWQ6yGvRvPWgWcY/OOzd0H+abXvZviR
        VeeGZbz5WLepLM0UXYZLGpygtsu68zYJugpmZ2H3bA==
X-Google-Smtp-Source: ABdhPJzx+NlgiIZnomfYiB8/G4LgCd6WP6GFsrtvbCL30ZLORab4/n85+ZBn2rA47FR1ujRI3K0kFKlULjuaBeSQo5k=
X-Received: by 2002:a05:651c:327:: with SMTP id b7mr23695765ljp.74.1628687001676;
 Wed, 11 Aug 2021 06:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210805222625.40236-1-konrad.dybcio@somainline.org> <20210805222625.40236-2-konrad.dybcio@somainline.org>
In-Reply-To: <20210805222625.40236-2-konrad.dybcio@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 15:03:10 +0200
Message-ID: <CACRpkdYm_Ky+D5=rhX9gekKYZkTXwvS-FGED_Ou+_0=nEGZUUA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom-pmic-gpio: Add support for pm8019
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        Martin Botka <martin.botka@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 6, 2021 at 12:26 AM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:

> PM8019 provides 6 GPIOs. Add a compatible to support that.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

I will merge this as soon as the binding is fixed (please resend both)

Yours,
Linus Walleij

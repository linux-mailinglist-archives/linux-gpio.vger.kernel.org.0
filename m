Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44FFB3C7E01
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jul 2021 07:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237943AbhGNFne (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jul 2021 01:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237802AbhGNFnd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jul 2021 01:43:33 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9863C0613DD
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 22:40:41 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id t143so1024067oie.8
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 22:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QBnwuBKRxZeDSW4QGiqymAuzRo+K3Iyzls75/osdlvc=;
        b=asxkx/1UsDSGw3MeY3llVFdUkBuaw0FyNXL84TfALrLohJ4zBrLh6yRm9A54xlu5SQ
         q5QlJ1hxVW/15s4nMKF5PEv0UyFINaFZE9dq2apkxdS2L8odPuuN3MGJnioIbfjlbAs5
         OzHzjn05QFKxsrevQbCcdpgShJS724oVd57iz6C7d3X3PCLwOPyRliBnYLPIA6AtU52g
         TvG2GzY4WK0VQii9Il68TaJYLCx02IXOvwNmgKP6P/+zBV0R7l8X4R8wk0QXEcltkJ4+
         Bv/Tgb0pfNkNApWhc2CnVxoWHSamSuExPwccYmOJQ30iI0IktYI3vzy8lf36jBLgUmh8
         BwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QBnwuBKRxZeDSW4QGiqymAuzRo+K3Iyzls75/osdlvc=;
        b=aJhA8vCxYHgu1rffc/RacfDp/ye4nvsTnAEFBprQaQPC9eu4uunMMNr0nTbgGR2/6G
         qhHygQb/rQkwrtsFdm4Rmn6VpiEB8+/amAP1Q6DNlqdPjZ0oC+YQuDYRRqsbtCBufCxW
         X6y6YROI4t+5TgDm7x8x/KPMpMIwy30WOnjiRw7s2Lg9EZ1ATVpWg7pY2FiUJ6k6a5T0
         xL8zTN+86xvBJUAb+o3NKXTyTmKDk5whMsU5aw2RR9K73lagSznEK+IncFUqSn/9yXAt
         H8Ekzp5u0KHmJvGDNqwvIXvl3UGb2mRJrya4XFjwi9Zl5M2h+dmY/IRrPeN+n1qXc67x
         75qg==
X-Gm-Message-State: AOAM5321w4T5i+EywgYyCuiRIJcrZTkbspn1ejm6cAibOa7tRGQbl+NM
        S01ydi1Y6H3QS+j7KibSy3aU0TXFiUoYhax1ORJY3A==
X-Google-Smtp-Source: ABdhPJxMyKbaHPYLjI1W+Bc5q6MCpGy1B2M+e5JeRhMGebMYNwGIEAKA1DRB4YKkchRFoIAr0IY5gyoMjxELKQxwRNI=
X-Received: by 2002:aca:5e06:: with SMTP id s6mr4518903oib.40.1626241241058;
 Tue, 13 Jul 2021 22:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210629123407.82561-1-bhupesh.sharma@linaro.org>
In-Reply-To: <20210629123407.82561-1-bhupesh.sharma@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 14 Jul 2021 11:10:30 +0530
Message-ID: <CAH=2Nty-Zi4g0wmNZ7mKNKz8CZu9X9jLqxeFDVJaXKnkOqsASA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] pinctrl: qcom/pinctrl-spmi-gpio: Add support for
 pmic-gpio on SA8155p-adp
To:     MSM <linux-arm-msm@vger.kernel.org>
Cc:     bhupesh.linux@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, 29 Jun 2021 at 18:04, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> Changes since v3:
> -----------------
> - v3 series can be found here: https://lore.kernel.org/linux-arm-msm/20210617053432.350486-1-bhupesh.sharma@linaro.org/T/#m2b1bf2d32dfdde3196dc5342722e356ee1f87456
> - Rebased patchset on pinctrl/devel branch.
> - Added Reviewed-by from Bjorn for patches 1 to 4 and Ack from Rob for
>   patches 1 and 2.
>
> Changes since v2:
> -----------------
> - v2 series can be found here: https://lore.kernel.org/linux-arm-msm/20210615074543.26700-1-bhupesh.sharma@linaro.org/T/#m8303d27d561b30133992da88198abb78ea833e21
> - Addressed review comments from Bjorn and Mark.
> - As per suggestion from Bjorn, separated the patches in different
>   patchsets (specific to each subsystem) to ease review and patch application.
>
> Changes since v1:
> -----------------
> - v1 series can be found here: https://lore.kernel.org/linux-arm-msm/20210607113840.15435-1-bhupesh.sharma@linaro.org/T/#mc524fe82798d4c4fb75dd0333318955e0406ad18
> - Addressed review comments from Bjorn and Vinod received on the v1
>   series.
>
> This series adds the pmic-gpio support code for SA8155p-adp board
> which is based on Qualcomm snapdragon sa8155p SoC which in turn is
> simiar to the sm8150 SoC.
>
> This board supports a new PMIC -> PMM8155AU.
>
> While at it, also make some cosmetic changes to the qcom pinctrl-spmi-gpio
> driver and dt-bindings to make sure the compatibles are
> in alphabetical order.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Bhupesh Sharma (4):
>   dt-bindings: pinctrl: qcom,pmic-gpio: Arrange compatibles
>     alphabetically
>   dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible for SA8155p-adp
>   pinctrl: qcom/pinctrl-spmi-gpio: Arrange compatibles alphabetically
>   pinctrl: qcom/pinctrl-spmi-gpio: Add compatible for pmic-gpio on
>     SA8155p-adp
>
>  .../bindings/pinctrl/qcom,pmic-gpio.txt       | 64 ++++++++++---------
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      | 35 +++++-----
>  2 files changed, 51 insertions(+), 48 deletions(-)
>
> --
> 2.31.1

Ping. Any comments on this version?

Thanks,
Bhupesh

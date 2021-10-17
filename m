Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C00AC430C59
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Oct 2021 23:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238344AbhJQViF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Oct 2021 17:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235636AbhJQViF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Oct 2021 17:38:05 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B352C061765
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 14:35:55 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id w23so5231352lje.7
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8XHO07CjfAiTXPl758twudtVcw2vHwNkceOH/ry/8xw=;
        b=guYeVmWXzDbgRUAHIqydQ1HPqOt9+ayfTiWOPrnO4himbg2lwQVeWQJmvM2V+5IL5O
         Sqsn+CIzEYDk+fFZzCDYhqj0Ie7z6p3Yc64/jMldGYEh7a3D0z5Fzjn0Jmpqlf6eHUSz
         GtEtBhByBNHr7gyaqkVqkqrKDBZIEWcEaV599BInyWQHHEPaYNdH3YVvq2nGsKSnicKz
         9D+q1MnvvGrE1oBMxIrCPnJ1wqqvxQQ3RhDDAMCcZeMT7BNwtW/+1gq+GZSKA62EDZdZ
         vffq02QkUL4oINr1iHkkQYENu8NQGjm/b7WJLz4lpClrqwyRzvfzpReaOJVJjH9QtiPH
         SINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8XHO07CjfAiTXPl758twudtVcw2vHwNkceOH/ry/8xw=;
        b=fTVuLu8qC1d6WDaJQeOKkFKM/L3eoGGnl9K5zBa7nI6xS4DCfxx+HCTP6jzJViI3BF
         2IaQU3bDZPwLcB/Xf5r/IXb+naGE1pFz3+LFdGK9hjMxjbcOjqfnyRZ9ygcLmBdzvO0/
         tCS22EImhR+82k/CzieWqHm7qIBFI9aJg0QflJfTQHJP8Bod/Ff4g5SkBwIRU5h/3qMK
         af7EDaS6y+gPmsm0ayyGK11xroS6Wx8npvZaztSdnMvoliVsFkQgRDxYcht/VPpzENI6
         LTsLlPMmjICWRZ5gpsD5n1cl+AENncBJ8tT0wymJbm3BHmF4Ebj9hHpc9EXah0IoFzYI
         NIdQ==
X-Gm-Message-State: AOAM532e+xrRsXQwfIoHiaOnGiMKb3fWdlTszISUNz80H6Sio6vmtorv
        Xnzobpy/FTBBjo5PSgaW8mi2esntHMWlN7VVa1wGAw==
X-Google-Smtp-Source: ABdhPJxnealbYRqpGVxJqqNmVYfGtFJz7kFs75zSNWhK+f6ZtZcG2rQCYhHLVT/ikteFpTreTMXZpzpCbsps0uX3ltM=
X-Received: by 2002:a2e:7f05:: with SMTP id a5mr27633482ljd.261.1634506553490;
 Sun, 17 Oct 2021 14:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 17 Oct 2021 23:35:42 +0200
Message-ID: <CACRpkdbuJmrnPUtOvchqS+h3upuwnKPUkFqWyW7bh-PFBanW+Q@mail.gmail.com>
Subject: Re:
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I queued thes patches in the pinctrl tree for v5.16:

On Fri, Oct 8, 2021 at 3:25 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

>       dt-bindings: pinctrl: qcom,pmic-mpp: Convert qcom pmic mpp bindings to YAML
>       pinctrl: qcom: ssbi-mpp: hardcode IRQ counts
>       pinctrl: qcom: ssbi-mpp: add support for hierarchical IRQ chip
>       pinctrl: qcom: spmi-mpp: hardcode IRQ counts
>       pinctrl: qcom: spmi-mpp: add support for hierarchical IRQ chip
>       dt-bindings: pinctrl: qcom,pmic-mpp: switch to #interrupt-cells

Any breakages will be fixed when Bjorn applies the DTS changes to his
tree.

I wonder about the MFD patch, maybe Lee can expedite merging that too
or ACK it for Bjorn to merge with the remainders.

Yours,
Linus Walleij

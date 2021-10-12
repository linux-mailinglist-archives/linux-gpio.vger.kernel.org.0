Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C03C942B096
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 01:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236216AbhJLXvN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 19:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233176AbhJLXvN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 19:51:13 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A914CC061570
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 16:49:10 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id z20so2429969edc.13
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 16:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pwok9UEewOa0h227wWR/gsCQAzSJB/ZjopkSrHDbSlI=;
        b=Ptac5Ma/tuyMMIHD8QK0eGDzuYyQISjFYqCy8PzGDsdr0lC6hx82zzi5G8JzQHsLDj
         aSaagg637DysjOoV5rRBqw9QvowOqtwQSv2nqxNRT9JEn9xvU8zWwVv76AT+swP1FqoH
         qu33BnRwnsWOw7IMCoKBstU3RTnwcUZQSB/IBT1Pe3D1etVqg/NYcJdXYR2S0tSfoMmE
         QS7+PYUQ0+kXLkAWVN/Dh1/Le3Zd/M4XGX+Kh4vpxelVcsSrV1A8IPlWRFPlTU0T7cuq
         a8HoVG7qbZm+nZDZFHxhApx2T+sBgu4xcEjZTpihvszlHULAy5QTBZdLSP7nFof6ujr0
         AGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pwok9UEewOa0h227wWR/gsCQAzSJB/ZjopkSrHDbSlI=;
        b=NIZ4sK3Yqt+bA2lSP0sVxAacFgp99mf1oXAVOX23tGkjZHXipv7kP/InrybRaRGh8J
         baunV5UJcM9ByW4T7UJUH9AGu3L65S9aWwUlaqs9L69/BPyH069iapeLMEeEWZmf1aLX
         D/rZtQX/TNdd6VBWsv9a9b54plLperhlG9eTaintL9Ss9T876bBlMRC9PWR4Z7eZtLv4
         3g6CP2o6UcvjxwvpakrCd7UXAIcbAo7dgHx8CqEtH/NVxoFkF+rCeZeWmDwsCHZNG+g3
         CQmspqgEO9LIfX890lVzd38O4wdH3RoD88zWli/YaO+NCQ1/WAPgPLZLuQtPqHqyzV85
         5Dag==
X-Gm-Message-State: AOAM531/mGsIIFkt87axeCot084k6LDAY1YGfukoox+uyy9DDkfYrAPh
        0CXo+61PP+4y5+gdVW+NM/5zghSOA3BEiCi6i306lA==
X-Google-Smtp-Source: ABdhPJzl/MaShaQUXaVqmAcNgB7YMrSPVNaxDUUCYC6gtdZXSLieYe1I8D/zR8tdrjwJD9p7Fy32NRQlwJ4W5B7c/To=
X-Received: by 2002:a05:6402:51d0:: with SMTP id r16mr4317718edd.353.1634082549289;
 Tue, 12 Oct 2021 16:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211007212444.328034-1-luca@z3ntu.xyz> <20211007212444.328034-6-luca@z3ntu.xyz>
In-Reply-To: <20211007212444.328034-6-luca@z3ntu.xyz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Oct 2021 01:48:58 +0200
Message-ID: <CACRpkdYt5xgJzX1W-NACcrfK_wiXdYF85b=s8-d6341E_k5PEQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] pinctrl: qcom: spmi-gpio: Add compatible for PM6350
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 7, 2021 at 11:25 PM Luca Weiss <luca@z3ntu.xyz> wrote:

> Add support for the GPIO controller in the pm6350 PMIC.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Patch applied as obviously uncontroversial.
No need to resend this one.

Yours,
Linus Walleij

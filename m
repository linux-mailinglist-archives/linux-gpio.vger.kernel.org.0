Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0F6C48FA0D
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 01:55:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234004AbiAPAzQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jan 2022 19:55:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234000AbiAPAzP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jan 2022 19:55:15 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96502C06161C
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:55:15 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id z25-20020a0568301db900b005946f536d85so6008295oti.9
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/7DbCdtUYPRvvfrey8dH3J+v5+7pirUqjyG4vhhFOvA=;
        b=BTC/kf0IbDgPTefLMkQyZwz6sWq48UZhUvC7FPyPsl7ZdQEdMMQxabRIvK3OOzUTIA
         PXMS+u8/ErvpElfiZbvYQxc76885kNWGvQSTJB+sVVxUj+bJhRMkAybn/1UCnttfEfb2
         iHj6Uj2fOPXR7hRuLDSaVZqjkjDOHzXk8vdropXWXv+9fwHpetM86IcAZ348Hv90tdLc
         srT/UTkB5YqBI+lCVeB/q1mxXazc3UQVRDZ7feo28dUuxU3Xz3N7SvRzum7v1Y0mdbgF
         U5I8Y9QluAu9OcOk0LvknHTfd2HLhahqJvvikCbdQl031TtSvUmNcbxfgkz76N8FM/TY
         QR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/7DbCdtUYPRvvfrey8dH3J+v5+7pirUqjyG4vhhFOvA=;
        b=6NCG3U+kCO8xI7g5Na8x5B7IXsNc8DhAES8tOgjzE1JYzTojgtfceSvXzmark5zjAA
         kyrFUVdu6Z3FpDqvT+gz71xxoLE+9fhWqk5+m90PYKpOI97ZD3hvrurB75JAg2my5hJE
         NFodSx826h91NivCL9sVFd/96/lNKagcZBGkcENm/5H55dOoLZI8wLCmrnfRrtaSGTHx
         0SD/B7S5iAMJvVm5zjCVvUxj1oKSMu2q1tZtm2q1REr8FxTjK7W65fr1kIkNRsBF+HRI
         i8tqhdmfHl2ZkAd5UiSNnjsM/Ls9AGzVQhlp59/vG/H9Pp+0enuWDdSRrBptbXBUmAhK
         /rTw==
X-Gm-Message-State: AOAM530IoQjxFJZAyfpxEpVc/du7WZaxDwBNNfWMl6AHkxgqrBOu+PC+
        V4AHJgdMGo45rCLLxCe/uhX/5tjvkWrLptaIOilGXw==
X-Google-Smtp-Source: ABdhPJw0GoT+Pxoo5AYMG9PLC6TejN6Ph2asyDgImhLt8p4ZFNfCFuqwr4O9t/7HOepZTUfhDs/wJ7yG1zlT7bxr9ZU=
X-Received: by 2002:a05:6830:4:: with SMTP id c4mr275474otp.237.1642294514823;
 Sat, 15 Jan 2022 16:55:14 -0800 (PST)
MIME-Version: 1.0
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com> <20220111201722.327219-18-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220111201722.327219-18-krzysztof.kozlowski@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 01:55:03 +0100
Message-ID: <CACRpkdYTXSOW+sOX3wVtF4jj6xm0jr-F3HKQPGHOdAVjbasP3A@mail.gmail.com>
Subject: Re: [PATCH v2 24/28] dt-bindings: pinctrl: samsung: convert to dtschema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 11, 2022 at 9:18 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:

> Convert the Samsung SoC (S3C24xx, S3C64xx, S5Pv210, Exynos) pin
> controller bindings to DT schema format.  Parts of description and DTS
> example was copied from existing sources, so keep the license as
> GPL-2.0-only.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I expect that you will merge this into ARM SoC with the rest
of the DTS fixes?

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D410827D6CD
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 21:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbgI2TYS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 15:24:18 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34529 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727700AbgI2TYS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 15:24:18 -0400
Received: by mail-ot1-f68.google.com with SMTP id h17so5622749otr.1;
        Tue, 29 Sep 2020 12:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a0+40Jxvg/Op2A57V+2jGqRGB7XXMO2z6egIsw8beuM=;
        b=CeR4A4TgFY4pPDoYLz8HJgeXY0bhXLMWSy6d26KAjle0dvgy+2sl3q6LYPUZX1zaWz
         IYoM/5U2pOIMOB5sxv5WiNbDRsTT0llKQhHZcE1K1P0ZxcCdP6X8d3KSnPTKcsLqNum9
         z36HPjSVOOJzu5JN+MIPZqD1s7NYgtP8UNgd+p+mf8e28Y1tpJcEAo1wBbehyLwfYhwp
         vkSxMMjuYg+Ws+WXlY+irxwm2w5AHPMX7I6wlo5gpd8zHOleXV3avO2TEy0RJFadSYRr
         tU7CEBb7XYqsAoqn+74SRAne2mzroBdyCEUtpQSufBu4243Bbp5xhZJIqDhTrjIDPLt/
         iB2g==
X-Gm-Message-State: AOAM530qktzWsqLsqLQW2y2yZJGWmZJH8QDu2H6pD0WestfQJjx7cfR4
        GyEH/MzsyXHlsYASdsxNiQ==
X-Google-Smtp-Source: ABdhPJxaOeJE50B4sFS6YIDZqlKoQ1hYpkgfDJx0OsxUxBOz7cE/j4mvVhUi5dl8x1vZLyOVovRFig==
X-Received: by 2002:a05:6830:1d96:: with SMTP id y22mr3783015oti.243.1601407457125;
        Tue, 29 Sep 2020 12:24:17 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q14sm1209970ota.41.2020.09.29.12.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 12:24:16 -0700 (PDT)
Received: (nullmailer pid 1007629 invoked by uid 1000);
        Tue, 29 Sep 2020 19:24:15 -0000
Date:   Tue, 29 Sep 2020 14:24:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Varadarajan Narayanan <varada@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, nsekar@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sricharan@codeaurora.org
Subject: Re: [PATCH 2/7] dt-bindings: arm64: ipq5018: Add binding
 descriptions for clock and reset
Message-ID: <20200929192415.GA1003457@bogus>
References: <1601270140-4306-1-git-send-email-varada@codeaurora.org>
 <1601270140-4306-3-git-send-email-varada@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1601270140-4306-3-git-send-email-varada@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 10:45:35AM +0530, Varadarajan Narayanan wrote:
> This patch adds support for the global clock controller found on
> the IPQ5018 based devices.
> 
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml        |   3 +
>  include/dt-bindings/clock/qcom,gcc-ipq5018.h       | 183 +++++++++++++++++++++
>  include/dt-bindings/reset/qcom,gcc-ipq5018.h       | 119 ++++++++++++++
>  3 files changed, 305 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq5018.h
>  create mode 100644 include/dt-bindings/reset/qcom,gcc-ipq5018.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> index ee0467f..74d67fc 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> @@ -18,6 +18,8 @@ description: |
>    - dt-bindings/clock/qcom,gcc-apq8084.h
>    - dt-bindings/reset/qcom,gcc-apq8084.h
>    - dt-bindings/clock/qcom,gcc-ipq4019.h
> +  - dt-bindings/clock/qcom,gcc-ipq5018.h
> +  - dt-bindings/reset/qcom,gcc-ipq5018.h
>    - dt-bindings/clock/qcom,gcc-ipq6018.h
>    - dt-bindings/reset/qcom,gcc-ipq6018.h
>    - dt-bindings/clock/qcom,gcc-ipq806x.h (qcom,gcc-ipq8064)
> @@ -39,6 +41,7 @@ properties:
>      enum:
>        - qcom,gcc-apq8084
>        - qcom,gcc-ipq4019
> +      - qcom,gcc-ipq5018
>        - qcom,gcc-ipq6018
>        - qcom,gcc-ipq8064
>        - qcom,gcc-msm8660
> diff --git a/include/dt-bindings/clock/qcom,gcc-ipq5018.h b/include/dt-bindings/clock/qcom,gcc-ipq5018.h
> new file mode 100644
> index 00000000..069165f
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,gcc-ipq5018.h
> @@ -0,0 +1,183 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

Only care about Linux and GPL OSs? And your employer is okay with GPL3 
(and GPL4, ...)?

IOW, dual license please.

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B3B3E10B8
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 11:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232535AbhHEJCh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 05:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232517AbhHEJCg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Aug 2021 05:02:36 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD3EC061765;
        Thu,  5 Aug 2021 02:02:21 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id b13so5539145wrs.3;
        Thu, 05 Aug 2021 02:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xBlRW4pHwPqeNhDYb3jb+UKe1vgH2+ct0ssi2hqlwPM=;
        b=T/NNtBWp1hlPqv+7LVAlo4n5mwPuaPeTKAQZUALxBb0FAeCToK7EqgYlUFOl3+nh4o
         YN9SoH0koBcHle96RWaKXYda49qYxkrqzOGQWmH0WxCM0CaPN4twacDWy3JA4m4ZUn6Q
         pOp6KV0Ll6eFYk3Nm31HaVFfpilsBM09wtzGy84q5Mqkm0M+xWxkHyH9dQd6v5iSTyZQ
         Dhly2i7XPGmoeUzcIU9IJ3guaanU+lgHjMEjUtCTtVGS0vKhLhDLaFscjtv081YZXYDd
         49+zaYI+Q4ZPYyMjZXobg+Va33wS3pZM9pBMUMILVjBo+mhnZf9b1GgShs5Z0fzgOgCw
         detA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xBlRW4pHwPqeNhDYb3jb+UKe1vgH2+ct0ssi2hqlwPM=;
        b=SRWrqKJqQe5/8OXOUJR0e3NCBYcFvTFGyJ3r27AOGJnluxwiJEZw0MoQQf6NDJ7FiW
         RRuj/0YFtLqkhXqE2wjgULXCtWwWa2HiHdBzDY7jIOslPdq5uVxkWh2Je6OhXKCQ8rja
         sl67694Qx9d5FCwPkudu9qSzP0p5YShzT6WXsQsR0me/xMcEBFxz86Zl48tEUXG4YEl8
         pHes+fZpFyIf/W6idDfSwypjG9yIcLFU+PgMXn2lmJg4SFolmrr9nyvdeSXVbZ5YO26o
         js4um9KjymUp296eCdm5gO2RtmH09t1LBTuhszXFrQ4sYOO0Bzn075VhNtSrYS3iEJum
         8Y9w==
X-Gm-Message-State: AOAM530Ckb8dAnbD1DuLOimaTCTJJsRRRnFZHfAkoq3XKZB3Ttj5IP0Y
        2YBNLtsnUWHrnLAKZRNosx6xW0vK0tLg4g==
X-Google-Smtp-Source: ABdhPJzKbFRpmxJ0dvD48+AuEhrq0GTbFHBf7r/VfElGFxVhmyP60WIE14hxSG+ITUCWJx5wGhBKeQ==
X-Received: by 2002:a5d:4ac5:: with SMTP id y5mr3995180wrs.125.1628154140435;
        Thu, 05 Aug 2021 02:02:20 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net. [89.6.132.55])
        by smtp.gmail.com with ESMTPSA id t1sm4901451wma.28.2021.08.05.02.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 02:02:19 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] arm: dts: mt8135: Move pinfunc to
 include/dt-bindings/pinctrl
To:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Enric Balletbo Serra <eballetbo@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210804044033.3047296-1-hsinyi@chromium.org>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d48087c2-ddff-0c58-c7e6-a0ba526a393f@gmail.com>
Date:   Thu, 5 Aug 2021 11:02:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210804044033.3047296-1-hsinyi@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 04/08/2021 06:40, Hsin-Yi Wang wrote:
> Move mt8135-pinfunc.h into include/dt-bindings/pinctrl so that we can
> include it in yaml examples.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  arch/arm/boot/dts/mt8135.dtsi                                   | 2 +-
>  .../boot/dts => include/dt-bindings/pinctrl}/mt8135-pinfunc.h   | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename {arch/arm/boot/dts => include/dt-bindings/pinctrl}/mt8135-pinfunc.h (100%)
> 

If that's fine with you, I'll take patch 1+2 through my tree. IMHO the best for
patch 3 would be to go through your tree.

Sounds good?

Regards,
Matthias

> diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
> index 0e4e835026db0..a031b36363187 100644
> --- a/arch/arm/boot/dts/mt8135.dtsi
> +++ b/arch/arm/boot/dts/mt8135.dtsi
> @@ -9,7 +9,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset/mt8135-resets.h>
> -#include "mt8135-pinfunc.h"
> +#include <dt-bindings/pinctrl/mt8135-pinfunc.h>
>  
>  / {
>  	#address-cells = <2>;
> diff --git a/arch/arm/boot/dts/mt8135-pinfunc.h b/include/dt-bindings/pinctrl/mt8135-pinfunc.h
> similarity index 100%
> rename from arch/arm/boot/dts/mt8135-pinfunc.h
> rename to include/dt-bindings/pinctrl/mt8135-pinfunc.h
> 

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51D84375535
	for <lists+linux-gpio@lfdr.de>; Thu,  6 May 2021 15:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234267AbhEFN6G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 May 2021 09:58:06 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:42940 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233918AbhEFN6G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 May 2021 09:58:06 -0400
Received: by mail-oi1-f177.google.com with SMTP id v24so5549219oiv.9;
        Thu, 06 May 2021 06:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HqeKgXTKXZa+6B/eVofQGB4SPGukIqRcTwXruDFPnc0=;
        b=WM4vDGpO0TCSnF9B1dzZqA0aGMBRAYnceCrwdoLD6frqCJTa7GT1DUsedPl9Fb51FO
         p9B2O4LN/fHu9Gq45dLquQyA6n8d23+a8DJu71k2zdP1njfivEWUMMmuTn5yaaFvbddW
         cgPowUsVfiXMDuWKF5jEBn492D1YHiXnjoU6pwCyxyJMU1zZApob+k421+pBLPDEqTQt
         eJrokOMzotEvga8DEyji+UjUIhZmy+z/DEcQBqcZaTVJ/YnaXllx5mMu8yqZkJCCy8Re
         wqALqHLpwMp+7A/MLlj0abCHgcQDCrEpucjBYp/kzyAacZkmIQjNTJzaJaoKA1Ysd3ui
         AmTQ==
X-Gm-Message-State: AOAM531aPsxW+6iESbcXDEyMdp6mZBRvk21gONyOOZiybxmxMXsW9CbP
        0gtA2CpkghYcBFYyT7Do1DfikKXmgw==
X-Google-Smtp-Source: ABdhPJzuyAAscLHlNDjyxPpZgIddNw7Hd0CRGlweA76ymj8ZYxCpPUqd+jN9WAA0Pn5WHOAiLiNcjA==
X-Received: by 2002:aca:eac2:: with SMTP id i185mr10406150oih.171.1620309426564;
        Thu, 06 May 2021 06:57:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j5sm535678oou.9.2021.05.06.06.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 06:57:05 -0700 (PDT)
Received: (nullmailer pid 240433 invoked by uid 1000);
        Thu, 06 May 2021 13:57:04 -0000
Date:   Thu, 6 May 2021 08:57:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     lee.jones@linaro.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jdelvare@suse.com, linux@roeck-us.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
        luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de
Subject: Re: [PATCH 2/6] dt-bindings: gpio: Add Delta TN48M CPLD GPIO bindings
Message-ID: <20210506135704.GA3340759@robh.at.kernel.org>
References: <20210430123511.116057-1-robert.marko@sartura.hr>
 <20210430123511.116057-2-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430123511.116057-2-robert.marko@sartura.hr>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 30, 2021 at 02:35:07PM +0200, Robert Marko wrote:
> CPLD inside of the Delta TN48M does not number GPIOs
> at all, so in order to ensure numbering lets use bindigs.

Looking at the code, I'd make the gpio number something like '(offset << 
8) | bit' rather than just making up an index.

We don't normally have defines for GPIO numbers either.

> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  include/dt-bindings/gpio/tn48m-gpio.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/tn48m-gpio.h
> 
> diff --git a/include/dt-bindings/gpio/tn48m-gpio.h b/include/dt-bindings/gpio/tn48m-gpio.h
> new file mode 100644
> index 000000000000..4ece4826d746
> --- /dev/null
> +++ b/include/dt-bindings/gpio/tn48m-gpio.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * GPIO definitions for Delta TN48M CPLD GPIO driver
> + *
> + * Copyright 2020 Sartura Ltd
> + *
> + * Author: Robert Marko <robert.marko@sartura.hr>
> + */
> +
> +#ifndef _DT_BINDINGS_TN48M_GPIO_H
> +#define _DT_BINDINGS_TN48M_GPIO_H
> +
> +#define SFP_TX_DISABLE_52	0
> +#define SFP_TX_DISABLE_51	1
> +#define SFP_TX_DISABLE_50	2
> +#define SFP_TX_DISABLE_49	3
> +#define SFP_PRESENT_52		4
> +#define SFP_PRESENT_51		5
> +#define SFP_PRESENT_50		6
> +#define SFP_PRESENT_49		7
> +#define SFP_LOS_52		8
> +#define SFP_LOS_51		9
> +#define SFP_LOS_50		10
> +#define SFP_LOS_49		11
> +
> +#endif /* _DT_BINDINGS_TN48M_GPIO_H */
> -- 
> 2.31.1
> 

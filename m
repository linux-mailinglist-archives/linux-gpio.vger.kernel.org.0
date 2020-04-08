Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 407151A28D6
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2020 20:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729372AbgDHSvp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Apr 2020 14:51:45 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33960 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729363AbgDHSvp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2020 14:51:45 -0400
Received: by mail-pl1-f195.google.com with SMTP id a23so2859134plm.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2020 11:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7hOlSBB7ydWvmmauId0lofXvGU8t5v3hHpggIUrKKAQ=;
        b=uZPV5aeI7aV9wAoSHE4QYJzgPmO/8OklH6Kb8dlPD7ePz8fR79lon3jSF2O0xYYEP1
         WIgpOh/rt1+XjQryBUuS1INJAe7fOIu7nw+4PSgnMKcPDE1gt9vSBWqwX3BiICRfjchx
         SS5x37AIkgn7ps8xjBO592p8+CdVCBO+winuMfgV8ESfjtOnkiNssHgJ+tJjmSg8LyNL
         9N4TKXAQ6XdCACc361aw16eGwQvvhM3BLPmjgyzLVqonAdxrDNxyqLUqdhXv+BzgMknj
         Qg60u+JDoKW3VVu0nMhuBaEGQUqDIu6AUzscT7Y694e+/sDsxfSHLlEJnhdT5gVVGz8s
         7Dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7hOlSBB7ydWvmmauId0lofXvGU8t5v3hHpggIUrKKAQ=;
        b=CCS31/0GYcizN0qU/qllEwgCjGbO1hxyX9wv34CVgp3cAvcEbg2zI52ahVQi9WUioB
         HfsKLgpfXpd4+/OlvRnp85fnrw1dAGAje49XFP+r/2Omxbe4KJX6xuJTbfA2JGH8fUtX
         4mwYU/oFvxfworKMekZt2XgpThvjTQBNEGvUTViqL03f1RTWxvDZQf4dYC6QuOKYCAhe
         QdjuhjurZbYcyEX8PWnr7eyunhF4gMTZ6caJBDpuh1L9FfSI8FEfE9pUj8GL9jwuu3CE
         SlCJhd0ie302qBU1oJj5dlijgppQA2AzRI5H5UZnkgTZejvGcJzcjg277B0VAl00ZHSR
         gnZw==
X-Gm-Message-State: AGi0PuZw4DMEVY5rKzXfo8XYaGv7ICGQgU2yivoVtyWpFYf/RprulTXj
        m+sB3nmc19CjhtYiMqoLjxNJfA==
X-Google-Smtp-Source: APiQypJQwRMAJ6mPpNstf7GbgE2jm+FiF4s39Ym7/WT+voxTbvNy4AmPw7dqgax4X3Cu23PVKan7ag==
X-Received: by 2002:a17:902:d691:: with SMTP id v17mr1688723ply.142.1586371903804;
        Wed, 08 Apr 2020 11:51:43 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d85sm1879490pfd.157.2020.04.08.11.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 11:51:43 -0700 (PDT)
Date:   Wed, 8 Apr 2020 11:51:40 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Andy Gross <agross@kernel.org>,
        Ajay Kishore <akisho@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] pinctrl: qcom: Remove duplicated include from
 pinctrl-msm.c
Message-ID: <20200408185140.GN663905@yoga>
References: <20200408070504.134847-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408070504.134847-1-yuehaibing@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 08 Apr 00:05 PDT 2020, YueHaibing wrote:

> Remove duplicated include.
> 

Missed that in my review, thanks.

Fixes: 13bec8d49bdf ("pinctrl: qcom: use scm_call to route GPIO irq to Apps")
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 9a398a211d30..898fc041e197 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -23,7 +23,6 @@
>  #include <linux/pm.h>
>  #include <linux/log2.h>
>  #include <linux/qcom_scm.h>
> -#include <linux/io.h>
>  
>  #include <linux/soc/qcom/irq.h>
> 
> 
> 

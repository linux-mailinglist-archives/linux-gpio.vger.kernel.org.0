Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D616162DB4
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 03:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbfGIBsg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 21:48:36 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42346 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfGIBsg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jul 2019 21:48:36 -0400
Received: by mail-io1-f65.google.com with SMTP id u19so39671009ior.9;
        Mon, 08 Jul 2019 18:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GvfjGGlw3UxBPItY7HGBbTvYAxu5k/MIEMpMCZvF99I=;
        b=UTaJYLljlZRjSzoNqmRsxcW5o04wdkEn61vm2x2yoJQZNWFEPz/TXS6F6f10E2I828
         TWYm8pLJKD3K7eQWrcBFemgo6df+9o8hXMgPQjGxX1QiefPirXKZRO4SKmosuOydeHD9
         gjvbf//mAUMVOZ46MMCgjpLg5EI3znf4dzDcPqcO0b28PNJYv5iHHSVwtjVt0fZPsR3T
         zK22YQVpMUlsMW9CWNkb0JQg21Mkct0kjXJ0Vzdg4TeqP8M95FJ4qct0sHE0a7G/I1jY
         Zt5X2HIs5GNssXAG/WYrtT/pxtRRRDNyS1Lqbto+qwxpp0CXlml3MyYBXki+Tpv7xFDe
         L/HQ==
X-Gm-Message-State: APjAAAXFyqpmeqfTpnmXG+jSqZJWNOa8J7rOMp+GF239vQYqHquz10Lr
        jcmsOsuQQbCC2cfdDEBS7A==
X-Google-Smtp-Source: APXvYqx8/pBZlcjplRHgCgiL8IcLhiig4B4YXatyJvJH9FgiUfObN2umu8Y0q9OyU8ZtGCD+ohGRiQ==
X-Received: by 2002:a5d:8c97:: with SMTP id g23mr22369768ion.250.1562636914903;
        Mon, 08 Jul 2019 18:48:34 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id l5sm25436032ioq.83.2019.07.08.18.48.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 18:48:34 -0700 (PDT)
Date:   Mon, 8 Jul 2019 19:48:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH v2 2/3] scsi: ufs: Allow resetting the UFS device
Message-ID: <20190709014832.GA14402@bogus>
References: <20190606010249.3538-1-bjorn.andersson@linaro.org>
 <20190606010249.3538-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606010249.3538-3-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 05, 2019 at 06:02:48PM -0700, Bjorn Andersson wrote:
> Acquire the device-reset GPIO and toggle this to reset the UFS device
> during initialization and host reset.
> 
> Based on downstream support implemented by Subhash Jadavani
> <subhashj@codeaurora.org>.
> 
> Tested-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Added gpio to DT binding document
> - Fixed spelling of UFS
> 
>  .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  2 +
>  drivers/scsi/ufs/ufshcd.c                     | 44 +++++++++++++++++++
>  drivers/scsi/ufs/ufshcd.h                     |  4 ++
>  3 files changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> index a74720486ee2..d562d8b4919c 100644
> --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> @@ -54,6 +54,8 @@ Optional properties:
>  			  PHY reset from the UFS controller.
>  - resets            : reset node register
>  - reset-names       : describe reset node register, the "rst" corresponds to reset the whole UFS IP.
> +- device-reset-gpios	: A phandle and gpio specifier denoting the GPIO connected
> +			  to the RESET pin of the UFS memory device.

A sign we should have a child node for the device...

Doesn't using 'reset-gpios' work as I doubt one would have a GPIO reset 
for the host controller.

Rob

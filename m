Return-Path: <linux-gpio+bounces-7028-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A368D7172
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2024 20:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C86E281EEF
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2024 18:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A4F153BD9;
	Sat,  1 Jun 2024 18:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lZG/FzW6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB598AD48
	for <linux-gpio@vger.kernel.org>; Sat,  1 Jun 2024 18:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717265041; cv=none; b=ReW+C3q9DWMWrzGBOvlyBs8LZrUEU2ihh/j5HfG/c3GzDxMEzDh4xKjTERwU8I+f2z9E5txQOzMRGlYG/D4K/3tw5VKKSAPpEarsWnBf4Anf7r1s/aFqyx+LbXWEXCAEPrptsx65sAOkaC5k7Vo8ZEjgbh3y9Jd7emczlUT7Qlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717265041; c=relaxed/simple;
	bh=NA111BhLEg5n4W8iT9QTnuKMw/+r+bGgXoAgn3oAnYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuSKTc9yTlyXZ03z9MzchCdyFdJM8XM0SSTp3Y+nOxW6qJx2sZOsnxoEuCdL1ggGAECIR9R/bN0BFod6XQWIv4+0KKB1cbmFXVavhR3/L1IroeqVQ3bqswHEOMnJ6H3AoSvmaYvLn5tQiwS9qCYoTl2tC6RW7GFEWQ/F5RITRCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lZG/FzW6; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a689b034b02so116207566b.2
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jun 2024 11:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717265038; x=1717869838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J27XynmV7A1h5aKbXxYPVmU9LKEnoCGVw4qLSFhb7vc=;
        b=lZG/FzW6rJ9gX63KfXxUm8+j8nGi7VXLSrE1AiIMB0Cg6quYbnsICNyZZNuAJOTIwa
         vfcQytsp1EEnnzgXMrxohZT2Cvm6prkt7bGtWBPv5+7vbPFaKdqQkgAypoVK4VwBQFaB
         ZL5+53osySAs5kQcKBsGBEL2rLKvXy/vttoYZUN8yM+FRKP2n9zBZ95gPR/NHut3M1Fl
         FWnSnIc6qZW9X61gAUGc0mes3mG8NgJGgKxOlhJ9qzsQnCGNntKmjiJgzQAaFioJOneL
         7v+b/jDQdJlD4n0pW9vvHAPJniVaTvBU1cSn/n6OKIc125bnkC+14+Pw7WlUvBi1kkVC
         OgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717265038; x=1717869838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J27XynmV7A1h5aKbXxYPVmU9LKEnoCGVw4qLSFhb7vc=;
        b=Te4peGul7Fa12YMdXT2DntMqtYEko2blJq78Vzemb3/eYtJhRTdXzLGfVLraiUlaW1
         6+eqogZ1ID3bLaLBlSnX+ANNKOSOJ3qmGC52nda9m7RQ3OxVeoXNX9ZoDwEU6gvR0dMb
         kmgbXPty58XQibeDNjYOqjqDWUYLqMooK9Tcl6mh6k/usG3A3jDQws30bu1CH/Xqa0Sh
         Qw+NVBleNhhGPFIdXKx6aO6VNf0PoaascUFF1GTd5C+An8eiueVBdbGiThV+/trAzSJl
         LqTLLtC5+0sMB3dxRhEPc3XMrvtQFwurbyKGcJA7CexLccRJKLhk8eZgw7klMpuZuBZ6
         KJJA==
X-Gm-Message-State: AOJu0YzXYqKQ4Zh59K0d0XCSH+OM/9WYmJOj+YRDNA7n2sslkUsbMA22
	c8ISZplXQZa7YLLa02hWrDFPpBaTEZrXSI3swD7X+4pyKE6a4KGwi3/A8Z+AQDU=
X-Google-Smtp-Source: AGHT+IFI8r9ZeZTeW2j4Bg+UMVIXmESg5WFb8+JxLiwq7IY1Uwvo4bYomJgNtl9UqzyHc6vu3FAHdA==
X-Received: by 2002:a17:906:a10b:b0:a5a:34ae:10ea with SMTP id a640c23a62f3a-a682272f34amr324665466b.76.1717265037973;
        Sat, 01 Jun 2024 11:03:57 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68b4b09cb9sm95687966b.178.2024.06.01.11.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 11:03:57 -0700 (PDT)
Date: Sat, 1 Jun 2024 21:03:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
	liwei391@huawei.com
Subject: Re: [PATCH] pinctrl: core: fix possible memory leak in error path in
 pinctrl_enable()
Message-ID: <bab8eaca-3e96-4ed4-a63c-bccd39816c88@moroto.mountain>
References: <20240601113502.2709597-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601113502.2709597-1-yangyingliang@huawei.com>

On Sat, Jun 01, 2024 at 07:35:02PM +0800, Yang Yingliang wrote:
> In devm_pinctrl_register(), if pinctrl_enable() fails in pinctrl_register(),
> the "pctldev" has not been added to dev resources, so devm_pinctrl_dev_release()
> can not be called, it leads memory leak.
> 
> And some driver calls pinctrl_register_and_init() which is not devm_ managed,
> it also leads memory leak if pinctrl_enable() fails.
> 
> To fix this, add a flag devm_allocated to struct pinctrl_dev, free the memory
> by checking this flag.
> 
> Fixes: 5038a66dad01 ("pinctrl: core: delete incorrect free in pinctrl_enable()")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/pinctrl/core.c | 9 +++++++++
>  drivers/pinctrl/core.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index cffeb869130d..374c36f5c759 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -2125,6 +2125,13 @@ int pinctrl_enable(struct pinctrl_dev *pctldev)
>  	error = pinctrl_claim_hogs(pctldev);
>  	if (error) {
>  		dev_err(pctldev->dev, "could not claim hogs: %i\n", error);
> +		if (!pctldev->devm_allocated) {
> +			pinctrl_free_pindescs(pctldev, pctldev->desc->pins,
> +					      pctldev->desc->npins);
> +			mutex_destroy(&pctldev->mutex);
> +			kfree(pctldev);
> +		}

The other thing is, this should be done in a function.

ti_iodelay_probe() would have to call uninit as well.  The error
handling in ti_iodelay_probe() was already messed up.  They probably
assumed that pinctrl_enable() would do the cleanup so they forgot to
call of_node_put(np).

regards,
dan carpenter

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 9fcb9d913556..704541385397 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2090,6 +2090,13 @@ pinctrl_init_controller(struct pinctrl_desc *pctldesc, struct device *dev,
 	return ERR_PTR(ret);
 }
 
+void pinctrl_uninit_controller(struct pinctrl_dev *pctldev)
+{
+	pinctrl_free_pindescs(pctldev, pctldev->desc->pins, pctldev->desc->npins);
+	mutex_destroy(&pctldev->mutex);
+	kfree(pctldev);
+}
+
 static int pinctrl_claim_hogs(struct pinctrl_dev *pctldev)
 {
 	pctldev->p = create_pinctrl(pctldev->dev, pctldev);




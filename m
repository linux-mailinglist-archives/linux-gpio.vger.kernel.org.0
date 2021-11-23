Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7FC3459F00
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 10:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbhKWJP7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 04:15:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbhKWJP7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Nov 2021 04:15:59 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416D3C061574
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 01:12:51 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id p18so18018663wmq.5
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 01:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bHsRez/7qJG/hZ0hBnW4cvgsbzRL+gC4XG9zJtrqVAI=;
        b=UhWABmVwCv53M22kM5vT+PNQt22eEUsf4v5dMreHxPwxfUjx75u/j4ECrsfuAqD5+T
         Znhv/3ouqmVkip8/4+CR5mm2EpZ1ktX9DuP56sVleSnucQt33+LbGz/Hhxh1OvLHCw8k
         PdELLE4FaRurBDN+OUXNJRgpjOsekshSwlasmGLDoGdpnPWRQZPI2OOF3MYYefdf9kJT
         /cKN+JX1YH/Kf17jBNiKdFJuN44aZ7516y7mKPhBqEAIysjpDnAfxYuyHA0sw6/rHLfg
         dpabDnxAbQPjtejPkL/YsQmX3QesSYG5CeW0H4FYPYF8Yq/3gBc549fD4p8s13mLv5S+
         WfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bHsRez/7qJG/hZ0hBnW4cvgsbzRL+gC4XG9zJtrqVAI=;
        b=yr8yCye5iKK9VsPPM+wyNneiRqFFvMq5afsaOils02t6Qe+6chSVzkA+w1wiyW3qGx
         GYqhHZQywC1riO2y+LV6YYluOJrFJq1mVj1VHX70OsIp1AtTdkE521XtrpILdUAnImP6
         vvInPiI19V2YcjOUD8Wtfs1Q5ZMT2ccytaGKMCdoUHYs5zWvW83kOyfjQ/rRZlWSS9YK
         O91TLxSz5VH9/Ym4Rw8bYPSUJBjUHxqqWL1iPlRvU92bixs8Xa1PZFGQyr4fZOHWQoNc
         UlE10JKJnvTx2SSK3JeZUKOkoMGUP5xorqKEp9QImh0VgImtIiU3tQpzzyqjXPmNkD3j
         CBVw==
X-Gm-Message-State: AOAM531LAC+I4pj8iwq7zx7CWzxRZPtIubWUWVIZBb87MOFEMYB/aEY2
        WFHfzNbZFYXQSohGsuHjZcFUdvitIFuBag==
X-Google-Smtp-Source: ABdhPJwgwbIJdDwrAhqFW+zhm9xEH/yRhyBc1MCTzhzFK7GXyH+sGoQPpzIm7fdQ7o2MSCYEvEmI1g==
X-Received: by 2002:a1c:43c1:: with SMTP id q184mr1093463wma.153.1637658769850;
        Tue, 23 Nov 2021 01:12:49 -0800 (PST)
Received: from google.com ([95.148.6.231])
        by smtp.gmail.com with ESMTPSA id k37sm506176wms.21.2021.11.23.01.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 01:12:49 -0800 (PST)
Date:   Tue, 23 Nov 2021 09:12:42 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Ed Schaller <schallee@darkmist.net>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: Add Intel Lakefield PCH PCI IDs
Message-ID: <YZywikZuMSnbqpI1@google.com>
References: <20211122223606.GA20997@darkmist.net>
 <YZvYhBB23ITS+Pw0@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YZvYhBB23ITS+Pw0@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 22 Nov 2021, Andy Shevchenko wrote:

> On Mon, Nov 22, 2021 at 04:36:06PM -0600, Ed Schaller wrote:
> > Add new IDs of the Intel Lakefield chip to the list of supported
> > devices.
> 
> Thank you for the patch, it LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> > Signed-off-by: Ed Schaller <schallee@darkmist.net>
> > ---
> >  drivers/mfd/intel-lpss-pci.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/mfd/intel-lpss-pci.c b/drivers/mfd/intel-lpss-pci.c
> > index a872b4485eac..9700e5acd0cd 100644
> > --- a/drivers/mfd/intel-lpss-pci.c
> > +++ b/drivers/mfd/intel-lpss-pci.c
> > @@ -359,7 +359,14 @@ static const struct pci_device_id intel_lpss_pci_ids[] = {
> >  	/* LKF */
> >  	{ PCI_VDEVICE(INTEL, 0x98a8), (kernel_ulong_t)&bxt_uart_info },
> >  	{ PCI_VDEVICE(INTEL, 0x98a9), (kernel_ulong_t)&bxt_uart_info },
> > +	{ PCI_VDEVICE(INTEL, 0x98aa), (kernel_ulong_t)&bxt_info },
> > +	{ PCI_VDEVICE(INTEL, 0x98c5), (kernel_ulong_t)&bxt_i2c_info },
> > +	{ PCI_VDEVICE(INTEL, 0x98c6), (kernel_ulong_t)&bxt_i2c_info },
> >  	{ PCI_VDEVICE(INTEL, 0x98c7), (kernel_ulong_t)&bxt_uart_info },
> > +	{ PCI_VDEVICE(INTEL, 0x98e8), (kernel_ulong_t)&bxt_i2c_info },
> > +	{ PCI_VDEVICE(INTEL, 0x98e9), (kernel_ulong_t)&bxt_i2c_info },
> > +	{ PCI_VDEVICE(INTEL, 0x98ea), (kernel_ulong_t)&bxt_i2c_info },
> > +	{ PCI_VDEVICE(INTEL, 0x98eb), (kernel_ulong_t)&bxt_i2c_info },
> >  	/* SPT-LP */
> >  	{ PCI_VDEVICE(INTEL, 0x9d27), (kernel_ulong_t)&spt_uart_info },
> >  	{ PCI_VDEVICE(INTEL, 0x9d28), (kernel_ulong_t)&spt_uart_info },

Odd.  This didn't make it into my inbox.

Would you mind gathering Andy's R-b and re-sending please Ed?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

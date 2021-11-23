Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E282459FD4
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 11:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234612AbhKWKP6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 05:15:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234386AbhKWKP6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Nov 2021 05:15:58 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17125C061574
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 02:12:50 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id az34-20020a05600c602200b0033bf8662572so1469031wmb.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 02:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KiQOVykjudWKLjuDBF+udQ8M/6pDjr64WsL/X24bGlg=;
        b=pOfkGXzaJvyez80n22zRGciCD4tEWRiIAn7EKU7EymLUVqko912BXx4c2pF7EZwTTQ
         nF0ayjMLOH6SnQLwU6OKCm2SZzc/8ZkRvH+8/HZtql38+E6m1hBx3K5OBjgzvjcij3uD
         XejplqtCXvf6vGzD21SPIj0phPUcPBtw4qxwFx8Pz38byPCKyL1J++NCUKHFATbm/NKj
         MIIcKdquVb/yWDP22Og8/hFMnOcWlemx71/XTGYQ4jjhZ+2z1rPFpHkmfVPWf/WOcdCI
         n0pJtzwnDfKqhpB3zs5z90wFWDGFfXOfDZZL8067nn1um8RoTnpoDYTh6oeyBy5Zv1+R
         qrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KiQOVykjudWKLjuDBF+udQ8M/6pDjr64WsL/X24bGlg=;
        b=wEYJSYP4XFi7x+BcA0pQsrS63y/H4NdD/Myl6CI4aBJIJu5xesLcjIaZekoftTA2Ul
         3TZLtfhQMiLPv/GsCkvuGAd449idyFrMJRFIXAglsZYXbcGKjttKtV9DKuIWtscPZo9E
         7QNRedQBWET8mVDS7UFWqH8H2O/qfi7J2b4lU/zf/Q8PbC/hYRA2woL4iz0q90dh+23f
         Spn8qkGAvI4bE8HYfc47MErrAHWq6/ZeAYlSJgXjvPXkiNoBtlnj+a0cGGVhQ5pxsFMW
         Qnp7+VBSf80SyFLvmGgCxe8jEqwGH7u8daW2a68hVGwEoy7zNYEWENZ8t1wTt3EopW3O
         nYuQ==
X-Gm-Message-State: AOAM533uCfAd+hbPavgg+HtElwYtmyHHzR2SJM/+shhrp5AbndZQPrOX
        nH3l+0UBXEYui61AsGGoCPBNUA==
X-Google-Smtp-Source: ABdhPJwTXBOIQ3GIud0HC7wPYsAsVsMvaoOk7BQ9BRxfoc9qMEizGfYmBAkaT/ywzZaQvRXloDZW6A==
X-Received: by 2002:a05:600c:3494:: with SMTP id a20mr1529951wmq.195.1637662368591;
        Tue, 23 Nov 2021 02:12:48 -0800 (PST)
Received: from google.com ([95.148.6.231])
        by smtp.gmail.com with ESMTPSA id v15sm11449521wro.35.2021.11.23.02.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 02:12:48 -0800 (PST)
Date:   Tue, 23 Nov 2021 10:12:41 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Ed Schaller <schallee@darkmist.net>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: Add Intel Lakefield PCH PCI IDs
Message-ID: <YZy+mf9E4YVsv9Ru@google.com>
References: <20211122223606.GA20997@darkmist.net>
 <YZvYhBB23ITS+Pw0@smile.fi.intel.com>
 <YZywikZuMSnbqpI1@google.com>
 <YZy2jh0hexxgiPcw@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YZy2jh0hexxgiPcw@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 23 Nov 2021, Andy Shevchenko wrote:

> On Tue, Nov 23, 2021 at 09:12:42AM +0000, Lee Jones wrote:
> > On Mon, 22 Nov 2021, Andy Shevchenko wrote:
> > > On Mon, Nov 22, 2021 at 04:36:06PM -0600, Ed Schaller wrote:
> > > > Add new IDs of the Intel Lakefield chip to the list of supported
> > > > devices.
> > > 
> > > Thank you for the patch, it LGTM,
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> ...
> 
> > Odd.  This didn't make it into my inbox.
> 
> Hmm... Maybe it's sorted out due to linux-gpio@ vs. linux-kernel@ ML?

No, I mean it doesn't appear anywhere in my mail.

Including LKML et al. sub-folders.

> > Would you mind gathering Andy's R-b and re-sending please Ed?
> 
> Ed, please Cc also to LKML.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

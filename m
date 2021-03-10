Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B15313343BC
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 17:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbhCJQxr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 11:53:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232922AbhCJQxR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 11:53:17 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFB4C061760
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 08:53:17 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id e45so17010754ote.9
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 08:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b5OsFLsp7m56spdf12qcM4cWVfhM/nC3ar1492J4bBk=;
        b=pSY+USRY/5bSpl876jK0iO9ZgJvP3YuC04e8B1CFzOjuqi5+zg4dIcnftxorVCbJFV
         jLb30qzPKlbmV3hVrYPauzB8OCJmooVeqwQHuqb9QxDiYUQC6Cv3hhnIFOcbKUa05RnO
         jtha2uWfmW45eX3N2mXn2rq+DnLOL3QP9c4BFq4qlOdwSXSZrbhcU8evktEtoSSpFaLm
         HN82GR2oTwuu+uS7wiFXxqbozYPM9/LoiWd9Xx4g4nJkEpGS1kzzFlAk6k0Upq1AFob6
         dFU2Vo9evZsQ1qNCFULuPK37t3BjQmTmvyLvDbtABNstuZi/4b3quV/Nvk7dRaAIEgoI
         lsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b5OsFLsp7m56spdf12qcM4cWVfhM/nC3ar1492J4bBk=;
        b=ktOMJaQGZvgUvNKD2p73ke6JK7qF79nNyX6GIbaPjsbdZyPN22p7ZRV/ICyCZp3ZIz
         FTDV93jNplza16Y49bcfau6MnVZkvh3fwWprCXXe17uPuwmnBBFm3V78KPaDT/syMao9
         AurE70gNPBFn3NGei3G+jSQbIYL6lGC0lRlkSMhFP7k3rb02uxZqPw2L1GwVLtO4x+Cj
         6crR/PZGcnxfxfFv2f41jGGSdTOtYEh0kFeI+eF8PUmeP5RCmZwtGSZCMD7F+y7SmW4H
         VKQOtd8Xm46H8P39+r0djWoeUpD2UW2sPKjl0bdTqnaISPY8RcmxECW9l/FjfmzhNp0c
         KyBg==
X-Gm-Message-State: AOAM533WyN7j218r7IGm3dMHjk64syVFkLJ/LvQMRY0PD4bGrVhpqOaE
        VdzFnibDBwZIU2ZHlVDt5bG4yg==
X-Google-Smtp-Source: ABdhPJyybtwilEZ80NzuRpbhuS30jVwwphHuM/KGS4ql9S4ZQIB+z+pvLnynfcBC7ti7yN9UJXBnFg==
X-Received: by 2002:a9d:86c:: with SMTP id 99mr3198096oty.71.1615395195080;
        Wed, 10 Mar 2021 08:53:15 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l71sm3943136oib.30.2021.03.10.08.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 08:53:14 -0800 (PST)
Date:   Wed, 10 Mar 2021 10:53:13 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4] pinctrl: qcom: sc8180x: add ACPI probe support
Message-ID: <YEj5eXKALP43Cf0F@builder.lan>
References: <20210310111210.1232-1-shawn.guo@linaro.org>
 <YEi3D2fCBh/azOnb@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEi3D2fCBh/azOnb@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 10 Mar 06:09 CST 2021, Andy Shevchenko wrote:

> On Wed, Mar 10, 2021 at 07:12:10PM +0800, Shawn Guo wrote:
> > It adds ACPI probe support for pinctrl-sc8180x driver.  We have one
> > problem with ACPI table, i.e. GIO0 (TLMM) block has one single memory
> > resource to cover 3 tiles defined by SC8180X.  To follow the hardware
> > layout of 3 tiles which is already supported DT probe, it adds one
> > function to replace the original single memory resource with 3 named
> > ones for tiles.  With that, We can map memory for ACPI in the same way
> > as DT.
> 
> You are reinventing a wheel, i.e. MFD framework. Can you simple utilize
> devm_mfd_add_devices()?
> 

But wouldn't such driver need to do exactly this, and then set up the
mfd cell and register it? So the new wheel would still be there, just
wrapped in more code?

> Basically you may write an new pure MFD driver (drivers/mfd) that will
> instantiate properly the pin control driver.
> 

In contrast to typical MFDs this would still be a single mfd_cell, just
with different set of resources, derived from the mfd device itself.

Regards,
Bjorn

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6F332ACD8
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383111AbhCBVNj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:13:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1441896AbhCBB5r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Mar 2021 20:57:47 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1A7C061788
        for <linux-gpio@vger.kernel.org>; Mon,  1 Mar 2021 17:57:06 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d11so11078066plo.8
        for <linux-gpio@vger.kernel.org>; Mon, 01 Mar 2021 17:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qEXIr0qRUNXMB7X6NCJI6ro9I6aBfoE+UMkVLrQqzK8=;
        b=cv1PQjh/iLSuY+L85xzs9s79pd6egE66kkEwYGQ1ob4en6+KyI3C2ZNugOBWZhindW
         aM+RWV56kIfGvTNQk9HMMo1xzCBuMS0cs9E7StIg/mwP2II8EC1+wNBcENp9Csakjy0k
         N0yh5EJgFx01tiM8bNI76yiLBHKeEUpRPUmMT6oz1HTblFIlDxNpCNXu9uFFHFBxJ3nw
         PpzDqhjYMgXKO8/8y0HjA7LL+87LJHxczQVHOzv3NTKnoqcBt0nJT7NBWahtWTW3OmfV
         wjoS2ikZ/DiCm/7JhvtfozquJgHo3MTVtKmyNEOLh6kZyZSCuEXxn8digp+FgmEkq5Nm
         2WtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qEXIr0qRUNXMB7X6NCJI6ro9I6aBfoE+UMkVLrQqzK8=;
        b=ZXczlydeMSoEkIPAMH8FuscS5+skBYhYoTmTpz0pVc3td1QVnjytU7nB8bd8yaZqPP
         0ejXXzpFLfZJHi1bJ9ZWBM/tYloHBdhRvnri4H6nLO7uHkCqziQniq1+lhqILZk4zUvA
         1BRFAbw9lRuUjLbzDkPxxla2Xld/IV3RZTvSynaW3HGJXGooBcdzeuNb0aeeYPIGjRH5
         XccGSdo5uWdy7LrbOmn1qPFVQ46+d15vh8JS7Iej/Iv4zLkdhzB1M+7zotUPvxF9njDN
         IozS0cMSUlAzqYR+YIERdnonRnEvb4AgFCB8wNRDS63YQRogFXuL1uwHCZGGVQTT+ZE0
         VqgQ==
X-Gm-Message-State: AOAM531cuKp2KczHMFE6q8nMGIqFo0ZJ6TUjQ9XT2lT3Pc7BakNyD9pm
        SwxmtXWXWsxOfJTx43HjYRQyacStY6Zskw==
X-Google-Smtp-Source: ABdhPJwykM5CxeOJP/rEfuzX6oDRQ3ghckxZwqWkChXVvBvLimATCQHnc15aFlnlLkO/APWfGrerzQ==
X-Received: by 2002:a17:902:7d83:b029:e4:45ca:5407 with SMTP id a3-20020a1709027d83b02900e445ca5407mr17935095plm.57.1614650225508;
        Mon, 01 Mar 2021 17:57:05 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id i23sm12473949pfo.194.2021.03.01.17.57.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 17:57:04 -0800 (PST)
Date:   Tue, 2 Mar 2021 09:57:00 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: handle tiles for ACPI boot
Message-ID: <20210302015656.GH24428@dragon>
References: <20210301014329.30104-1-shawn.guo@linaro.org>
 <20210301014329.30104-2-shawn.guo@linaro.org>
 <YDz7dko8kmg5mOqa@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YDz7dko8kmg5mOqa@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 01, 2021 at 04:34:30PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 01, 2021 at 09:43:28AM +0800, Shawn Guo wrote:
> > It's not always the case that DT and ACPI describe hardware resource in
> > the same schema, even for a single platform.  For example, on SC8180X,
> > DT uses the tiles schema while ACPI describe memory resource as a single
> > region.  It patches msm_pinctrl_probe() function to map tiles regions
> > only for DT.  While for ACPI, it maps the single memory resource and
> > calculate tile bases with offsets passed from SoC data.
> 
> ...
> 
> > +#include <linux/acpi.h>
> 
> No use of this header. See below.
> (Perhaps you meant mod_devicetable.h)

has_acpi_companion() call needs the header.

> 
> ...
> 
> > -	if (soc_data->tiles) {
> > +	if (soc_data->tiles && !has_acpi_companion(&pdev->dev)) {
> 
> Any documentation to understand this change?

Well, !has_acpi_companion() is just to rule out ACPI boot and ensure
this is a DT boot with tiles. 

> 
> ...
> 
> > +		if (soc_data->tiles) {
> > +			for (i = 0; i < soc_data->ntiles; i++)
> > +				pctrl->regs[i] = base +
> > +						 soc_data->tile_offsets[i];
> > +		} else {
> > +			pctrl->regs[0] = base;
> > +		}
> 
> And so this?

For ACPI boot or DT without tiles, there is only one single memory
resource to map.  But for SoC driver like pinctrl-sc8180x that defines
pins with tiles, even with ACPI boot, we need to have multiple regs[]
to hold bases for tiles.

I will add comment to make it easier for understanding.

Shawn

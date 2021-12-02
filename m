Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF86246624D
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 12:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357148AbhLBLa0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Dec 2021 06:30:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357141AbhLBLaZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Dec 2021 06:30:25 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A5EC06174A
        for <linux-gpio@vger.kernel.org>; Thu,  2 Dec 2021 03:27:03 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 200so26750135pga.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Dec 2021 03:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zez1rxEqxUa6den/PlCBhFY8prK0HejZIbGceZPfSXw=;
        b=DPqxH0FMX4rAnAr1pchtyHSlHhAZYliOErJIo0K0K7vLF3KTx/rVN+v7emdLAf9sf9
         auuz3FeZsCPJCHzU0WDgMEIpbZ3dXphb7lTY6irmmiCwpgeEVv2ge7hAAL01VEbTZN8v
         SFjTMg/Sm9I9pR8sUzh6kjBUi2Sm/QLBlhtZy3iFnFfioHuM5DX+n+SE4sIoeoPc7X8i
         ob92gmZskSt6xlj8skPpk3CKl77HSXo/7RSy/yliK7Rpxv3WuF2a0UErbLk8HVrEXGR5
         dJUvdXEug8seUadTO2EuJIiEB3TatynOA4rRsM7sEEOdpKZ8stuWzk/1eh5gLOroW7uh
         qNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zez1rxEqxUa6den/PlCBhFY8prK0HejZIbGceZPfSXw=;
        b=oiDLnWg5qgDi2M1ifn96jdpLNkfCfgTVPg5F35fg+FV0l8cRRLwWXDBjr9U4mXn7dY
         aPXQ8+LxprQAgzc1Md7/Mgjv7kdOh/Uocq8Xk/5TOst4sUsFiq2UDc3FPwnPgNjX/y4v
         yZxiGz18/+f4TmvA3IZ+2TEhb3/ILB2b1tATGCiJ8vcbkTbP1PesfDzv7JZcT97A2T1o
         PurGicxz/AfYsbWulD39Z/9tpK7FBjbY+QzEBi++xXZAk1Xw9OKli7bMh+me2rAjtrb7
         tlF1kl+VGHcBxQoulLLxmWUMTjw2gKmNu32EXipU6fAN2PUmBnOk7zBSUyqkojDEaItQ
         9EVg==
X-Gm-Message-State: AOAM5300gfepReVmDGDlNPnBHjIRVtLHGvdgwVBoHAOXLIVJSAv+q14b
        ZGB/csnffCVTLVba/JD4xhOeHg==
X-Google-Smtp-Source: ABdhPJzH/PVd9bNk2o5EkrDPPp9WP0TgzT0mzFmsPY/nBb6sSAzis/xMBXa0YhWn2cdLzqOn0SWqVA==
X-Received: by 2002:a63:5c05:: with SMTP id q5mr9153548pgb.599.1638444423086;
        Thu, 02 Dec 2021 03:27:03 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id q5sm3528213pfu.66.2021.12.02.03.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:27:02 -0800 (PST)
Date:   Thu, 2 Dec 2021 16:57:00 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/6] spear: Fix SPEAr3XX plgpio support
Message-ID: <20211202112700.mkjmwibabj2cpr6u@vireshk-i7>
References: <20211202095255.165797-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202095255.165797-1-herve.codina@bootlin.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02-12-21, 10:52, Herve Codina wrote:
> Hi,
> 
> This patch series fixes the plgpio support on SPEAr3xx SOCs.
> 
> The first four patches of this series fixes a ressources
> sharing issue between the plgpio driver and the pinmux
> driver.
> Indeed, these two drivers can use the same IO address range
> on some SPEAr3xx SOCs.
> To solve the issue, a regmap (syscon managed) is used in both
> drivers and the plgpio driver can reference the pinmux regmap
> to use it.
> 
> The second part of this series is related to IRQs.
> The plgpio on SPEAr320s SOC uses an IRQ line in the reserve
> range (from SPEAr320 point of view).
> This issue is fixed enabling all the 'reserved' IRQs and
> adding a dtsi file for the SPEAr320s with the correct interrupt
> for the plgpio node.

Are these changes backwards compatible ? I mean new kernel will work
with old DTBs ? It may be quite important to not break that here.

-- 
viresh

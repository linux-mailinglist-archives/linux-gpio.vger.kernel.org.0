Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B86E42A92FA
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 10:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgKFJl3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 04:41:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:58358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgKFJl3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Nov 2020 04:41:29 -0500
Received: from localhost (unknown [122.179.17.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 189F5208FE;
        Fri,  6 Nov 2020 09:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604655688;
        bh=lYainVRyWQ9DxSBC7xJ5hannolQDt3SIyDJK5dP9HDU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vrN3K/U2lp7P/E3v71uOKZYgVochODY25nBdkBjjmDSFMS4ZT7tBiAiIUGNADsytB
         0jllIDwBe4QwbmrNrbNwVXl1GqsNM8QKZ6qBBv3Kdo+a1KYw+d/NSFn0LgmwSCER9Q
         saa8EjjoN5hc5fRi/735hNgvw+R07TG/qjuTlH8Q=
Date:   Fri, 6 Nov 2020 15:11:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeevan Shriram <jshriram@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add SDX55 pincontrol driver
Message-ID: <20201106094119.GG2621@vkoul-mobl>
References: <20201103055801.472736-1-vkoul@kernel.org>
 <20201103055801.472736-2-vkoul@kernel.org>
 <CACRpkdYWC_Sn3k0Mk4Dh_ZkkTr0D5f6RYVj0VjZG_6hmNX6_=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYWC_Sn3k0Mk4Dh_ZkkTr0D5f6RYVj0VjZG_6hmNX6_=Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05-11-20, 15:14, Linus Walleij wrote:
> On Tue, Nov 3, 2020 at 6:58 AM Vinod Koul <vkoul@kernel.org> wrote:
> 
> > From: Jeevan Shriram <jshriram@codeaurora.org>
> >
> > Add initial Qualcomm SDX55 pinctrl driver to support pin configuration
> > with pinctrl framewor for SDX55 SoC.
> >
> > Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
> > [ported from downstream and tidy up]
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> The v2 version looks nice, but Rob's bot is complaining about the YAML
> bindings?
> 
> Please look into it when you have time, apart from this the patch
> set seems complete, include Bjorn's ACKs on reposts please.

Thanks will do, looks like I need to update the tool version I have.
Will post v3 and include changes in each version (somehow missed this
time)

-- 
~Vinod

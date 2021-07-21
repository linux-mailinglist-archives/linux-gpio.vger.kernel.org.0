Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C763D0E65
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 14:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238157AbhGULVL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 07:21:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:54320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238172AbhGULNl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Jul 2021 07:13:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 793C561029;
        Wed, 21 Jul 2021 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626868458;
        bh=/2R8FyLulO5rrqukg2m/b0q3W8lFktNyD1tz1yDdULM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NvnrAsLkF0Yx7FXryc0oSbfvjzA+R6bv6PEZ4+PA/Mk/wZCPz9BpZHas8eeEvNVxZ
         DNZGUWUGAYK86Ef/lQA26aJ9wc73nJvy3/kCl9TVxFnk98AFvQSv8kPrE4HON7+pvR
         WEGCxlS4UISR0xAcEsSBs2jXXi1/BRdakyDREFBE=
Date:   Wed, 21 Jul 2021 13:54:15 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable
 as a permenent module
Message-ID: <YPgK50dmV7Z69WsL@kroah.com>
References: <20210707045320.529186-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707045320.529186-1-john.stultz@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 07, 2021 at 04:53:20AM +0000, John Stultz wrote:
> Allow the qcom_scm driver to be loadable as a permenent module.

This feels like a regression, it should be allowed to be a module.

> This still uses the "depends on QCOM_SCM || !QCOM_SCM" bit to
> ensure that drivers that call into the qcom_scm driver are
> also built as modules. While not ideal in some cases its the
> only safe way I can find to avoid build errors without having
> those drivers select QCOM_SCM and have to force it on (as
> QCOM_SCM=n can be valid for those drivers).
> 
> Reviving this now that Saravana's fw_devlink defaults to on,
> which should avoid loading troubles seen before.

fw_devlink was supposed to resolve these issues and _allow_ code to be
built as modules and not forced to be built into the kernel.

Let's not go backwards please.

thanks,

greg k-h

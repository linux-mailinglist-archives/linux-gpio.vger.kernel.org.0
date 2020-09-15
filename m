Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6C4269EF6
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 08:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgIOG4p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 02:56:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:37264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbgIOG4n (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Sep 2020 02:56:43 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 35F1F214F1;
        Tue, 15 Sep 2020 06:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600153003;
        bh=skqr9nmrj5gOWqcf3jzuhwSkFXzOKRagbuQYkkpOPIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h3N8YfhmWeI0UbfFLZChBznYbsE9YX3GRDm7tBI0StsTNg6mT5J0UuvfTqvrq0Lmz
         E0VoTX5JwvylLVqKbsOePjirUc77QX6xl/KpjbUh7L/RiAiabkebVrPouO04wDN6VM
         YLgQmyZQjKFqHX0PyAw7DP1xrZGz0OcnLcoCobPE=
Date:   Tue, 15 Sep 2020 08:56:30 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] irqchip/qcom-pdc: Allow QCOM_PDC to be loadable as a
 permanent module
Message-ID: <20200915065630.GE3622460@kroah.com>
References: <20200912125148.1271481-7-maz@kernel.org>
 <20200914210423.67579-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914210423.67579-1-john.stultz@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 09:04:23PM +0000, John Stultz wrote:
> Allows qcom-pdc driver to be loaded as a permanent module.
> 
> An earlier version of this patch was merged in a larger patchset
> but was reverted entirely when issues were found with other
> drivers, so now that Marc has provided a better solution in his
> Hybrid probing patch set, I wanted to re-submit this change.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

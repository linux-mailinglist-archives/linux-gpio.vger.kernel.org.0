Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9954D3D3A09
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 14:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234705AbhGWLlC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 07:41:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:53460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234530AbhGWLlC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jul 2021 07:41:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28E5A60ED7;
        Fri, 23 Jul 2021 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627042895;
        bh=9ttASHB3pgtVphs5ThtFEDTZUlMESs+xc3gYhWNXu7s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=w8IhHX/JqYeqrily4pkMsNcEcIDmcxFfFNBZXaGyZTBjf6hUdb/ck+vVeZvSyXSp+
         SmMMlgNE+z41L+q3vq6Sk5Fwc81ryx7vTXKK32xXimXI+vBPYpfZxeJ1mnXRrLK540
         yRVB2mJ+xoqZQgiFMdQEszARPi6wZbMnytYLkBrg=
Date:   Fri, 23 Jul 2021 14:21:33 +0200
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
        Todd Kjos <tkjos@google.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable
 as a permenent module
Message-ID: <YPq0Td5ZDNVwvQ8r@kroah.com>
References: <20210707045320.529186-1-john.stultz@linaro.org>
 <YPgK50dmV7Z69WsL@kroah.com>
 <CALAqxLUVgUT+1DyDGsFbF0138S0OYzpKADk__PsYbR4B4mbMhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLUVgUT+1DyDGsFbF0138S0OYzpKADk__PsYbR4B4mbMhw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 21, 2021 at 10:24:01AM -0700, John Stultz wrote:
> On Wed, Jul 21, 2021 at 4:54 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Jul 07, 2021 at 04:53:20AM +0000, John Stultz wrote:
> > > Allow the qcom_scm driver to be loadable as a permenent module.
> >
> > This feels like a regression, it should be allowed to be a module.
> 
> I'm sorry, I'm not sure I'm following you, Greg.  This patch is trying
> to enable the driver to be able to be loaded as a module.

Ah, sorry, you are right, my mistake.

nevermind...

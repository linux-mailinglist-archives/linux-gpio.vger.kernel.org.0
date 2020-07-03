Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4707213A03
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2020 14:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgGCMXu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jul 2020 08:23:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbgGCMXu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 3 Jul 2020 08:23:50 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3873A20826;
        Fri,  3 Jul 2020 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593779029;
        bh=vd4djFKYd31yL3oupRmWE2lyv4ORZWuNlPzVgna7t2M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WHs4GUDV2uRZU81RtdyMa3DLQpqpW5ngrnYAQ1k44tF5fi8qTpHzmkCTSxkOaQfsU
         ntwU/A6Q0tZmFwA2MHJT/daqj1pZj6k2/Gzr7OZ4f0ZTXz1sxwbv7GuoFKbK7+n9lU
         9INFciuKTMlV0H2WvUhE6AI4h2hCgkVbDcetQZXk=
Date:   Fri, 3 Jul 2020 13:23:44 +0100
From:   Will Deacon <will@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Marc Zyngier <maz@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org
Subject: Re: [RFC][PATCH 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
Message-ID: <20200703122343.GB18652@willie-the-truck>
References: <20200616061338.109499-1-john.stultz@linaro.org>
 <20200616061338.109499-6-john.stultz@linaro.org>
 <0be86735238a0f8b0c25934e2ed39eee@kernel.org>
 <CALAqxLUZBdiLBRcp1GW9rGxt1KhgNVQ86MuPXZcXdx2wFLZk6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLUZBdiLBRcp1GW9rGxt1KhgNVQ86MuPXZcXdx2wFLZk6w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 16, 2020 at 01:52:32PM -0700, John Stultz wrote:
> On Tue, Jun 16, 2020 at 12:55 AM Marc Zyngier <maz@kernel.org> wrote:
> > On 2020-06-16 07:13, John Stultz wrote:
> > > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > > index b510f67dfa49..714893535dd2 100644
> > > --- a/drivers/iommu/Kconfig
> > > +++ b/drivers/iommu/Kconfig
> > > @@ -381,6 +381,7 @@ config SPAPR_TCE_IOMMU
> > >  config ARM_SMMU
> > >       tristate "ARM Ltd. System MMU (SMMU) Support"
> > >       depends on (ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)) &&
> > > MMU
> > > +     depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> >
> > This looks a bit ugly. Could you explain why we need this at the SMMU
> > level? I'd have expected the dependency to flow the other way around...
> 
> Yea, so the arm-smmu-qcom.c file calls directly into the qcom-scm code
> via qcom_scm_qsmmu500_wait_safe_toggle()
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iommu/arm-smmu-qcom.c?h=v5.8-rc1#n44
> 
> So if ARM_SMMU=y and QCOM_SCM=m we get:
> drivers/iommu/arm-smmu-qcom.o: In function `qcom_smmu500_reset':
> arm-smmu-qcom.c:(.text+0xb4): undefined reference to
> `qcom_scm_qsmmu500_wait_safe_toggle'
> 
> Do you have a suggestion for an alternative approach?

Can you use symbol_get() or something like that? How are module dependencies
handled by other drivers?

Will

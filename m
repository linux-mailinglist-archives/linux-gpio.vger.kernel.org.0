Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C06C74A77
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2019 11:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbfGYJzG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jul 2019 05:55:06 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16966 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfGYJzG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jul 2019 05:55:06 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d397c760004>; Thu, 25 Jul 2019 02:55:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 25 Jul 2019 02:55:05 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 25 Jul 2019 02:55:05 -0700
Received: from tbergstrom-lnx.Nvidia.com (172.20.13.39) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Thu, 25 Jul 2019 09:55:04 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 8EF8E4286A; Thu, 25 Jul 2019 12:55:02 +0300 (EEST)
Date:   Thu, 25 Jul 2019 12:55:02 +0300
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <marc.zyngier@arm.com>, <linus.walleij@linaro.org>,
        <stefan@agner.ch>, <mark.rutland@arm.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH V6 01/21] irqchip: tegra: Do not disable COP IRQ during
 suspend
Message-ID: <20190725095502.GM12715@pdeschrijver-desktop.Nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
 <f6582e43-168e-1b7e-9db8-3d263bc3ba0d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f6582e43-168e-1b7e-9db8-3d263bc3ba0d@gmail.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564048503; bh=ssTZBE+UvhxmRscb1bfFWkAue53y1Iqmywo1qz9iIgE=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=G0VLQQDUsh89ujpB7kNRnhX8LTxDvmLjwLern2fdpLIa7ywejvMlg4se10jcnfOLD
         C+ylHNnfkSRtwQ/bOfYoZZpbdnnRbVFP2keOiR81Al2jdH4DwybrOnxreVYmz8xbgP
         YMFrbSI6NNAsWW+d7jMeI8D6nTzJq2LNafeQ4xS8GcCmUeqRt7NNeqQjYVoJl8l4Sc
         iI8F4gmdsKdfHp1+QhEhzptQosW8c71p0JK9HgUP/nSyc1PeK3Mly/3hdzv5aEDO5Q
         Fxuq6XFE+P4jOPeQ6vwLfUHRLlNbIt609ThbLD1lQMqvxga4R6ZQisIcNyVj7w5D/U
         32KNTGavqPdkQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 22, 2019 at 12:54:51PM +0300, Dmitry Osipenko wrote:
> 
> All Tegra SoCs support SC7, hence the 'supports_sc7' and the comment
> doesn't sound correct to me. Something like 'firmware_sc7' should suit
> better here.
> 
> > +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
> 
> Secondly, I'm also not sure why COP interrupts need to be disabled for
> pre-T210 at all, since COP is unused. This looks to me like it was
> cut-n-pasted from downstream kernel without a good reason and could be
> simply removed.

I don't think we can rely on the fact that COP is unused. People can
write their own code to run on COP.

Peter.

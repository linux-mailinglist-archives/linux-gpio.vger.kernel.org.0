Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA5206D4E2
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2019 21:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727767AbfGRTm1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jul 2019 15:42:27 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:1817 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbfGRTm1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jul 2019 15:42:27 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d30cb9f0000>; Thu, 18 Jul 2019 12:42:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 18 Jul 2019 12:42:25 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 18 Jul 2019 12:42:25 -0700
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Jul
 2019 19:42:24 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 9BF8340FB7; Thu, 18 Jul 2019 22:42:22 +0300 (EEST)
Date:   Thu, 18 Jul 2019 22:42:22 +0300
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Sowjanya Komatineni <skomatineni@nvidia.com>, <sboyd@kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Joseph Lo <josephl@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <marc.zyngier@arm.com>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>, <pgaikwad@nvidia.com>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
Message-ID: <20190718194222.GH12715@pdeschrijver-desktop.Nvidia.com>
References: <351a07d4-ba90-4793-129b-b1a733f95531@nvidia.com>
 <e3e9beaf-b195-305e-4010-66e824813472@gmail.com>
 <9271ae75-5663-e26e-df26-57cba94dab75@nvidia.com>
 <7ae3df9a-c0e9-cf71-8e90-4284db8df82f@nvidia.com>
 <b01e37aa-f14e-e628-ceef-b25a845c6359@gmail.com>
 <46b55527-da5d-c0b7-1c14-43b5c6d49dfa@nvidia.com>
 <2de9a608-cf38-f56c-b192-7ffed65092f8@nvidia.com>
 <bff3e9c0-727d-9aef-a0e2-583e53c39afd@gmail.com>
 <5eedd224-77b0-1fc9-4e5e-d884b41a64ed@nvidia.com>
 <89f23878-d4b2-2305-03e5-8a3e781c2b02@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <89f23878-d4b2-2305-03e5-8a3e781c2b02@gmail.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563478943; bh=5FpCNevAZSgLDBucELA9oU+PCl9UYv2Xv3xtjYyC9y8=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=DDLCwzuME5O0A4YUQknIw4sCUkldWctxiCJ9bDnWp6qE+7iIFqC/NJoAaxlXQCeLa
         TzMoNzS+yEM9rQS+1+DySpmZANKGC+MvKIWAsXOUjD8ItK8BCrH3ZAi3vP5Yrcg2gP
         22pqyk+kOIE+d3XeE+gIpnwrym+pcGlqRUUy0kgIIwd/6ZmTNjcoA4HNJQBoaKiGsR
         q03Z3eCoo4g/AWvoRHwvAu8u3rSnhRrJrNmVlqCyZ8HjzVQNGPe7eMyDbgWjs3zh4i
         WKkByiMGTFcr3jJ7ePohOzNg55JNhm21HkqsUocH9Ry3Zs970Ma61FBx/2M5Ub0+R+
         z/KE+9lXH0gWQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 18, 2019 at 02:44:56AM +0300, Dmitry Osipenko wrote:
> > 
> > dependencies I am referring are dfll_ref, dfll_soc, and DVFS peripheral
> > clocks which need to be restored prior to DFLL reinit.
> 
> Okay, but that shouldn't be a problem if clock dependencies are set up
> properly.
> 
> >>> reverse list order during restore might not work as all other clocks are
> >>> in proper order no with any ref clocks for plls getting restored prior
> >>> to their clients
> >> Why? The ref clocks should be registered first and be the roots for PLLs
> >> and the rest. If it's not currently the case, then this need to be
> >> fixed. You need to ensure that each clock is modeled properly. If some
> >> child clock really depends on multiple parents, then the parents need to
> >> in the correct order or CCF need to be taught about such
> >> multi-dependencies.
> >>
> >> If some required feature is missed, then you have to implement it
> >> properly and for all, that's how things are done in upstream. Sometimes
> >> it's quite a lot of extra work that everyone are benefiting from in
> >> the end.
> >>
> >> [snip]
> > 
> > Yes, we should register ref/parents before their clients.
> > 
> > cclk_g clk is registered last after all pll and peripheral clocks are
> > registers during clock init.
> > 
> > dfllCPU_out clk is registered later during dfll-fcpu driver probe and
> > gets added to the clock list.
> > 
> > Probably the issue seems to be not linking dfll_ref and dfll_soc
> > dependencies for dfllCPU_out thru clock list.
> > 
> > clk-dfll driver during dfll_init_clks gets ref_clk and soc_clk reference
> > thru DT.

The dfll does not have any parents. It has some clocks which are needed
for the logic part of the dfll to function, but there's no parent clock
as such unlike for peripheral clocks or PLLs where the parent is at
least used as a reference. The I2C controller of the DFLL shares the
lines with a normal I2C controller using some arbitration logic. That
logic only works if the clock for the normal I2C controller is enabled.
So you need probably 3 clocks enabled to initialize the dfll in that
case. I don't think it makes sense to add complicated logic to the clock
core to deal with this rather strange case. To me it makes more sense to
use pmops and open code the sequence there.

Peter.


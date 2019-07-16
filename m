Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BABB6A38F
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 10:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbfGPIGQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 04:06:16 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:11845 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbfGPIGQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 04:06:16 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d2d85730000>; Tue, 16 Jul 2019 01:06:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 16 Jul 2019 01:06:14 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 16 Jul 2019 01:06:14 -0700
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Jul
 2019 08:06:12 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 856C842897; Tue, 16 Jul 2019 11:06:10 +0300 (EEST)
Date:   Tue, 16 Jul 2019 11:06:10 +0300
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Joseph Lo <josephl@nvidia.com>
CC:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <marc.zyngier@arm.com>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>, <pgaikwad@nvidia.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
Message-ID: <20190716080610.GE12715@pdeschrijver-desktop.Nvidia.com>
References: <a5e1a6df-dff7-9e0c-9551-f78103a5462f@gmail.com>
 <a9b5c364-52b4-bee1-5881-47197f043950@nvidia.com>
 <e9d4bc0e-fd5d-ae02-2d67-86c7f7c9620f@gmail.com>
 <3938092a-bbc7-b304-641d-31677539598d@nvidia.com>
 <932d4d50-120c-9191-6a9a-23bf9c96633b@nvidia.com>
 <0ee055ad-d397-32e5-60ee-d62c14c6f77b@gmail.com>
 <86fc07d5-ab2e-a52a-a570-b1dfff4c20fe@nvidia.com>
 <20190716083701.225f0fd9@dimatab>
 <21266e4f-16b1-4c87-067a-16c07c803b6e@nvidia.com>
 <c5853e1a-d812-2dbd-3bec-0a9b0b0f6f3e@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c5853e1a-d812-2dbd-3bec-0a9b0b0f6f3e@nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563264372; bh=5j1xq37Ermp9huz0gnBXASgM80EPXOCfRVCxRisazx8=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=r1Dux4Hb74DdPXC8TK54LZSuLoI+I8R5cMuBnTbraZDC7YBJYZWpBrJALUNyXEcSI
         MNKQEFfCqn6k3NHuFBZxui4ybcpWl1EQlrqILVDjj2Kg1GitWX3NOx63n4TKn82EOS
         2uv+45pcoFqiS22UthSipP4PHgyxEarC87Nc1bgXuSBeEvgr4l/RDsrrmElXHlcvyy
         P7ZVsQjDEdftPn9GriTJrzwKDlNnI4NwZyuYnYIU56E25hzetbf04+23pYp4oSYCsV
         Nt8wdOCLqcddJ2yKoQoRP3bL4c7WlIwGU7w2Rw2c/DP9yGn8ryxJ8YT90FdMn1zKQE
         QOJavxHgVmtkA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 16, 2019 at 03:24:26PM +0800, Joseph Lo wrote:
> > OK, Will add to CPUFreq driver...
> > > 
> > > The other thing that also need attention is that T124 CPUFreq driver
> > > implicitly relies on DFLL driver to be probed first, which is icky.
> > > 
> > Should I add check for successful dfll clk register explicitly in
> > CPUFreq driver probe and defer till dfll clk registers?
> 
> Sorry, I didn't follow the mail thread. Just regarding the DFLL part.
> 
> As you know it, the DFLL clock is one of the CPU clock sources and
> integrated with DVFS control logic with the regulator. We will not switch
> CPU to other clock sources once we switched to DFLL. Because the CPU has
> been regulated by the DFLL HW with the DVFS table (CVB or OPP table you see
> in the driver.). We shouldn't reparent it to other sources with unknew
> freq/volt pair. That's not guaranteed to work. We allow switching to
> open-loop mode but different sources.
> 
> And I don't exactly understand why we need to switch to PLLP in CPU idle
> driver. Just keep it on CL-DVFS mode all the time.
> 
> In SC7 entry, the dfll suspend function moves it the open-loop mode. That's
> all. The sc7-entryfirmware will handle the rest of the sequence to turn off
> the CPU power.
> 
> In SC7 resume, the warmboot code will handle the sequence to turn on
> regulator and power up the CPU cluster. And leave it on PLL_P. After
> resuming to the kernel, we re-init DFLL, restore the CPU clock policy (CPU
> runs on DFLL open-loop mode) and then moving to close-loop mode.
> 
> The DFLL part looks good to me. BTW, change the patch subject to "Add
> suspend-resume support" seems more appropriate to me.
> 

To clarify this, the sequences for DFLL use are as follows (assuming all
required DFLL hw configuration has been done)

Switch to DFLL:
0) Save current parent and frequency
1) Program DFLL to open loop mode
2) Enable DFLL
3) Change cclk_g parent to DFLL
For OVR regulator:
4) Change PWM output pin from tristate to output
5) Enable DFLL PWM output
For I2C regulator:
4) Enable DFLL I2C output
6) Program DFLL to closed loop mode

Switch away from DFLL:
0) Change cclk_g parent to PLLP so the CPU frequency is ok for any vdd_cpu voltage
1) Program DFLL to open loop mode

For OVR regulator:
2) Change PWM output pin from output to tristate: vdd_cpu will go back
   to hardwired boot voltage.
3) Disable DFLL PWM output

For I2C regulator:
2) Program vdd_cpu regulator voltage to the boot voltage
3) Disable DFLL I2C output

4) Reprogram parent saved in step 0 of 'Switch to DFLL' to the saved
   frequency
5) Change cclk_g parent to saved parent
6) Disable DFLL

Peter.

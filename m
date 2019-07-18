Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C29D6D494
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2019 21:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391011AbfGRTSY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jul 2019 15:18:24 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:4737 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727742AbfGRTSY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jul 2019 15:18:24 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d30c5ff0000>; Thu, 18 Jul 2019 12:18:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 18 Jul 2019 12:18:23 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 18 Jul 2019 12:18:23 -0700
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Jul
 2019 19:18:22 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id D5FEB40FB7; Thu, 18 Jul 2019 22:18:20 +0300 (EEST)
Date:   Thu, 18 Jul 2019 22:18:20 +0300
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>, <thierry.reding@gmail.com>,
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
Message-ID: <20190718191820.GG12715@pdeschrijver-desktop.Nvidia.com>
References: <20190716083701.225f0fd9@dimatab>
 <21266e4f-16b1-4c87-067a-16c07c803b6e@nvidia.com>
 <c5853e1a-d812-2dbd-3bec-0a9b0b0f6f3e@nvidia.com>
 <20190716080610.GE12715@pdeschrijver-desktop.Nvidia.com>
 <d908d3a2-3013-7f92-0852-115f428d1c5f@gmail.com>
 <72b5df8c-8acb-d0d0-ebcf-b406e8404973@nvidia.com>
 <2b701832-5548-7c83-7c17-05cc2f1470c8@nvidia.com>
 <76e341be-6f38-2bc1-048e-1aa6883f9b88@gmail.com>
 <0706576a-ce61-1cf3-bed1-05f54a1e2489@nvidia.com>
 <5b2945c5-fcb2-2ac0-2bf2-df869dc9c713@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5b2945c5-fcb2-2ac0-2bf2-df869dc9c713@gmail.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563477503; bh=ftwX0g5kKU4Fe+glQVQ57kSzC4Dhkae8J2hTRCDjCYI=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=jiDbTl6X2iJyZ2RF71RR5kRDG5pjsOKISScH0EtjrEedvZjoAjSrAomEnXFDV+v+7
         WlrqT5ZGMwUJlpiKhiLH421Sbbqnwtk+9w0aMU6Q0Cg1h1XBTiDCE/59L3cTKcIdyk
         A01BZ8WY8kZgEZ8PGt8HLYN9j0jQwvKQZZwxlJybftNJ93Ar5BT2VjAesDc4q96LeZ
         R2YxijpsSpDSbYwt1GrIVXljL1Jg5QavVX7a3axjaAsb8gDAOfE5U3yQ2P6ibSGxNL
         HhH5OMId9rC0F0YI6J1kQHoDjhoj3T1dElCHu8G23UMsh8hBpqcCvgQpK4J2G61sKi
         Vq12hXvTZp2gQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 16, 2019 at 09:43:16PM +0300, Dmitry Osipenko wrote:
> > CPU parents are PLL_X, PLL_P, and dfll. PLL_X always runs at higher rate
> > so switching to PLL_P during CPUFreq probe prior to dfll clock enable
> > should be safe.
> 
> AFAIK, PLLX could run at ~200MHz. There is also a divided output of PLLP
> which CCLKG supports, the PLLP_OUT4.
> 
> Probably, realistically, CPU is always running off a fast PLLX during
> boot, but I'm wondering what may happen on KEXEC. I guess ideally
> CPUFreq driver should also have a 'shutdown' callback to teardown DFLL
> on a reboot, but likely that there are other clock-related problems as
> well that may break KEXEC and thus it is not very important at the moment.
> 

If you turn off the DFLL, you have to be aware that the voltage margins
for DFLL use are lower than for PLL use. So you either need to be sure
to switch to a frequency below fmax @ Vmin or you program the boot
voltage and then you can use PLLX as setup by the bootloader. For OVR
regulators you can't program a voltage without the DFLL, so you have to
tristate the PWM output which will give you a hardwired boot voltage.

Peter.

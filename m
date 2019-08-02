Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 558D77F7CA
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2019 15:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392919AbfHBNFl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 09:05:41 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:4503 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388240AbfHBNFk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Aug 2019 09:05:40 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d44352d0001>; Fri, 02 Aug 2019 06:05:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 02 Aug 2019 06:05:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 02 Aug 2019 06:05:39 -0700
Received: from tbergstrom-lnx.Nvidia.com (172.20.13.39) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Fri, 2 Aug 2019 13:05:39 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 3241140DF8; Fri,  2 Aug 2019 16:05:37 +0300 (EEST)
Date:   Fri, 2 Aug 2019 16:05:37 +0300
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
Message-ID: <20190802130537.GB3883@pdeschrijver-desktop.Nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
 <f6582e43-168e-1b7e-9db8-3d263bc3ba0d@gmail.com>
 <20190725095502.GM12715@pdeschrijver-desktop.Nvidia.com>
 <dd01be5d-bab9-1329-c7ac-c3c893d49dd1@gmail.com>
 <20190725103348.GN12715@pdeschrijver-desktop.Nvidia.com>
 <20190725103813.GO12715@pdeschrijver-desktop.Nvidia.com>
 <de1723df-8580-32fb-eb9d-e4c02f2b4306@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <de1723df-8580-32fb-eb9d-e4c02f2b4306@gmail.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564751149; bh=iWRDIXuKhFHou0kB3cN1+ZlnEuWKXRrrc3TGXxnLF+o=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:
         Content-Transfer-Encoding:In-Reply-To:X-NVConfidentiality:
         User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=AdtNFlSpz81uTllfhqGBNz872kPPOqcfTn2+V15vEhHh4FkLvnh20CjgOa7iI79Q3
         c9KO/+NdJdsfrL1qlvKJPecqls3hOFaDMW/UhJP3MOyxh86lnQk/DCS1cCEEPVlmKU
         m/U2aPW0Zh3EPMU4aehJQ9iMQya/5+pAbeGoCqY7ak7If7Jhqv0qn2hfpRbOfiJ+7Y
         kVNE7IbZ0e/xBb8cUp+wbR2mCipkGS8mRsAaPYTnyfKOJ7RdxSDYMQ6VmJkMeExDUp
         0h0WKpYxpEVnT7kSHWG2NdkzIU8wFVh351o/3Bp2PfjBMXSmurDidsUldCosbjaHMB
         95SC0HDs2MYGQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 25, 2019 at 01:59:09PM +0300, Dmitry Osipenko wrote:
> 25.07.2019 13:38, Peter De Schrijver =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Jul 25, 2019 at 01:33:48PM +0300, Peter De Schrijver wrote:
> >> On Thu, Jul 25, 2019 at 01:05:13PM +0300, Dmitry Osipenko wrote:
> >>> 25.07.2019 12:55, Peter De Schrijver =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> On Mon, Jul 22, 2019 at 12:54:51PM +0300, Dmitry Osipenko wrote:
> >>>>>
> >>>>> All Tegra SoCs support SC7, hence the 'supports_sc7' and the commen=
t
> >>>>> doesn't sound correct to me. Something like 'firmware_sc7' should s=
uit
> >>>>> better here.
> >>>>>
> >>>>>> +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
> >>>>>
> >>>>> Secondly, I'm also not sure why COP interrupts need to be disabled =
for
> >>>>> pre-T210 at all, since COP is unused. This looks to me like it was
> >>>>> cut-n-pasted from downstream kernel without a good reason and could=
 be
> >>>>> simply removed.
> >>>>
> >>>> I don't think we can rely on the fact that COP is unused. People can
> >>>> write their own code to run on COP.
> >>>
> >>> 1. Not upstream - doesn't matter.
> >>>
> >>
> >> The code is not part of the kernel, so obviously it's not upstream?
> >>
> >>> 2. That's not very good if something unknown is running on COP and th=
en
> >>> kernel suddenly intervenes, don't you think so?
> >>
> >> Unless the code was written with this in mind.
> >>
>=20
> In that case, please see 1. ;)
>=20

In general the kernel should not touch the COP interrupts I think.

> >=20
> > Looking at this again, I don't think we need to enable the IRQ at all.
>=20
> Could you please clarify? The code only saves/restores COP's interrupts
> context across suspend-resume.

The sc7 entry firmware doesn't use interrupts.

Peter.

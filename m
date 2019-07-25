Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6DB74BBC
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2019 12:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbfGYKiS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jul 2019 06:38:18 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:3506 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfGYKiR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jul 2019 06:38:17 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d3986960000>; Thu, 25 Jul 2019 03:38:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 25 Jul 2019 03:38:16 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 25 Jul 2019 03:38:16 -0700
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Jul
 2019 10:38:16 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 0BD124286E; Thu, 25 Jul 2019 13:38:14 +0300 (EEST)
Date:   Thu, 25 Jul 2019 13:38:14 +0300
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
Message-ID: <20190725103813.GO12715@pdeschrijver-desktop.Nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
 <f6582e43-168e-1b7e-9db8-3d263bc3ba0d@gmail.com>
 <20190725095502.GM12715@pdeschrijver-desktop.Nvidia.com>
 <dd01be5d-bab9-1329-c7ac-c3c893d49dd1@gmail.com>
 <20190725103348.GN12715@pdeschrijver-desktop.Nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190725103348.GN12715@pdeschrijver-desktop.Nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564051094; bh=8atxpgUUE7s0o3aVODCbIbQya4DrDoFmnAvE9OLg7S8=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:
         Content-Transfer-Encoding:In-Reply-To:X-NVConfidentiality:
         User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=gmAiEXeMK31lqMuyOlsg8JxkSrXrl5EJ4BuPSBE8I+4FouPnlCzCJRPP1GUUrTgBh
         2jJy0xjm5dLQ66WUgf5MAxStSikZg9qrTRlw9kdrtJTrFXi6e4OEstoFzp/3UGrESz
         +Y8+eem1kXUph3/4sBObFx8oMJSvEp3k7V90VnXkqjl2DzS72ntjVr1NOX3OaI2Ryw
         +iNoX355EvcS03RZ2zPMecVn4+YXrLCOpegifeNCODWwMz4wdK0Y5/xT93ITzGTLke
         F9HSf55EsyTDxVsTsB00OsVH7jIIk/ZEDAePAoYoNUEcHC0Tz/cv9NpBlyLjvLZm9c
         3hilrLCdZznhw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 25, 2019 at 01:33:48PM +0300, Peter De Schrijver wrote:
> On Thu, Jul 25, 2019 at 01:05:13PM +0300, Dmitry Osipenko wrote:
> > 25.07.2019 12:55, Peter De Schrijver =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > On Mon, Jul 22, 2019 at 12:54:51PM +0300, Dmitry Osipenko wrote:
> > >>
> > >> All Tegra SoCs support SC7, hence the 'supports_sc7' and the comment
> > >> doesn't sound correct to me. Something like 'firmware_sc7' should su=
it
> > >> better here.
> > >>
> > >>> +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
> > >>
> > >> Secondly, I'm also not sure why COP interrupts need to be disabled f=
or
> > >> pre-T210 at all, since COP is unused. This looks to me like it was
> > >> cut-n-pasted from downstream kernel without a good reason and could =
be
> > >> simply removed.
> > >=20
> > > I don't think we can rely on the fact that COP is unused. People can
> > > write their own code to run on COP.
> >=20
> > 1. Not upstream - doesn't matter.
> >=20
>=20
> The code is not part of the kernel, so obviously it's not upstream?
>=20
> > 2. That's not very good if something unknown is running on COP and then
> > kernel suddenly intervenes, don't you think so?
>=20
> Unless the code was written with this in mind.
>=20

Looking at this again, I don't think we need to enable the IRQ at all.

Peter.

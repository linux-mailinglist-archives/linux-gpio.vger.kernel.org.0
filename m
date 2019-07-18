Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 187F66D6E9
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2019 00:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbfGRWt1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jul 2019 18:49:27 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41934 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbfGRWt1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jul 2019 18:49:27 -0400
Received: by mail-lf1-f66.google.com with SMTP id 62so15485409lfa.8;
        Thu, 18 Jul 2019 15:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FYSYVvULwOnX4TuGoyoE29guebgctrQhwWO22CQ6v3s=;
        b=JB3U7fFHi+DnnTJ+ZKAvw+joIvhm0bBQk3MGxcT4XqwEHKS2NX0kQCK8gxKa/ppl15
         s9c0zuKUFxTjY8mRt6Lm1NnRKPNhcULd+AyGBD3S72Aoz/lw/7mwJWufernq8vC1Jdl7
         brQ/njqM2XJXOQsJPo2iRPCx+5GIFmVT4FdbApc6rY4WrXTozGQI+cLwQtBasCXwV9v9
         tl+5uJkaS0EKORS4Ze/iyevEkKNpcutpqgJwzATlJ4mf1mZKMPATjZduDCBAg/0EpJ6Q
         fE70vcUH1SaM/eWd5eHrJkxbW0ZwisyIb70SapUoDqhRz/0sebT0TzJDdh/XG+urbRQ5
         DIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FYSYVvULwOnX4TuGoyoE29guebgctrQhwWO22CQ6v3s=;
        b=Y85gc+EwWyywqoJJf8VvmCyyAMUMlafDn8Kre9e0O9VNIMIbwmHjk0LcQpUefe86GR
         sekB3jU49y30GTib/pr6nOGoa3aNB0B7BT/9Oa1IoPfAqa2aNshgRlwjx8UJ5lvuA/kO
         Vfa3rZyiXDh1kQ/oIkLC6nCAPr6jZhjD89BI+hCanhc8xeKpgvVkS2Yq0wCVxJ7nRqT0
         tLB1JutshcV/nQqwvnZ8nAdTK3zXuAYnZmQipx3pfY5UKjw1V7HBjCO+Xd27+DwoE0eN
         /iILl4pA6pdpY17PpzNz0A1j0VD1Du6p3zXzqmMon+uCR29ce6lgCXnjp7osA78FihAQ
         wu8Q==
X-Gm-Message-State: APjAAAUc1OuBuUG7BQNCnbJINhGUJuxoXLZ+2rxwB0fmFSjELtj0PVOq
        UpFIREeWTdYHKCf0YQg5FIY=
X-Google-Smtp-Source: APXvYqx8xvojicSTIez9VtjDCWX2HhNqbh1S3A4FG/YyyPEtKKuv1ZIjngCEOnzqq+QLZTnZ8A9i+w==
X-Received: by 2002:ac2:4349:: with SMTP id o9mr1004296lfl.74.1563490164275;
        Thu, 18 Jul 2019 15:49:24 -0700 (PDT)
Received: from dimatab (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.gmail.com with ESMTPSA id 27sm5292098ljw.97.2019.07.18.15.49.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 18 Jul 2019 15:49:23 -0700 (PDT)
Date:   Fri, 19 Jul 2019 01:52:59 +0300
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>, <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
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
Message-ID: <20190719015259.30941f3c@dimatab>
In-Reply-To: <1c85cb35-ce7c-1dd1-f637-0c91b2b36db3@nvidia.com>
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
        <20190718194222.GH12715@pdeschrijver-desktop.Nvidia.com>
        <056496ed-9abf-6907-c61c-a99ccf23b834@gmail.com>
        <1c85cb35-ce7c-1dd1-f637-0c91b2b36db3@nvidia.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=D0=92 Thu, 18 Jul 2019 13:36:35 -0700
Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> On 7/18/19 1:26 PM, Dmitry Osipenko wrote:
> > 18.07.2019 22:42, Peter De Schrijver =D0=BF=D0=B8=D1=88=D0=B5=D1=82: =20
> >> On Thu, Jul 18, 2019 at 02:44:56AM +0300, Dmitry Osipenko wrote: =20
> >>>> dependencies I am referring are dfll_ref, dfll_soc, and DVFS
> >>>> peripheral clocks which need to be restored prior to DFLL
> >>>> reinit. =20
> >>> Okay, but that shouldn't be a problem if clock dependencies are
> >>> set up properly.
> >>> =20
> >>>>>> reverse list order during restore might not work as all other
> >>>>>> clocks are in proper order no with any ref clocks for plls
> >>>>>> getting restored prior to their clients =20
> >>>>> Why? The ref clocks should be registered first and be the roots
> >>>>> for PLLs and the rest. If it's not currently the case, then
> >>>>> this need to be fixed. You need to ensure that each clock is
> >>>>> modeled properly. If some child clock really depends on
> >>>>> multiple parents, then the parents need to in the correct order
> >>>>> or CCF need to be taught about such multi-dependencies.
> >>>>>
> >>>>> If some required feature is missed, then you have to implement
> >>>>> it properly and for all, that's how things are done in
> >>>>> upstream. Sometimes it's quite a lot of extra work that
> >>>>> everyone are benefiting from in the end.
> >>>>>
> >>>>> [snip] =20
> >>>> Yes, we should register ref/parents before their clients.
> >>>>
> >>>> cclk_g clk is registered last after all pll and peripheral
> >>>> clocks are registers during clock init.
> >>>>
> >>>> dfllCPU_out clk is registered later during dfll-fcpu driver
> >>>> probe and gets added to the clock list.
> >>>>
> >>>> Probably the issue seems to be not linking dfll_ref and dfll_soc
> >>>> dependencies for dfllCPU_out thru clock list.
> >>>>
> >>>> clk-dfll driver during dfll_init_clks gets ref_clk and soc_clk
> >>>> reference thru DT. =20
> >> The dfll does not have any parents. It has some clocks which are
> >> needed for the logic part of the dfll to function, but there's no
> >> parent clock as such unlike for peripheral clocks or PLLs where
> >> the parent is at least used as a reference. The I2C controller of
> >> the DFLL shares the lines with a normal I2C controller using some
> >> arbitration logic. That logic only works if the clock for the
> >> normal I2C controller is enabled. So you need probably 3 clocks
> >> enabled to initialize the dfll in that case. I don't think it
> >> makes sense to add complicated logic to the clock core to deal
> >> with this rather strange case. To me it makes more sense to use
> >> pmops and open code the sequence there. =20
> > It looks to me that dfllCPU is a PLL and dfll_ref is its reference
> > parent, while dfll_soc clocks the logic that dynamically
> > reconfigures dfllCPU in background. I see that PLLP is defined as a
> > parent for dfll_ref and dfll_soc in the code. Hence seems dfll_ref
> > should be set as a parent for dfllCPU, no? =20
>=20
> dfll_soc will not be restored by the time dfllCPU resume happens
> after dfll_ref.
>=20
> without dfll_soc, dfllCPU cannot be resumed either. So if we decide
> to use parent we should use dfll_soc.

Okay, my point is that the parents should be properly specified any
ways.

> > Either way is good to me, given that DFLL will be disabled during
> > suspend. Resetting DFLL on DFLL's driver resume using PM ops should
> > be good. And then it also will be better to error out if DFLL is
> > active during suspend on the DFLL's driver suspend. =20
>=20
> Doing in dfll-fcpu pm_ops is much better as it happens right after
> all clocks are restored and unlike other clock enables, dfll need
> dfll controller programming as well and is actually registered in
> dfll-fcpu driver.
>=20
> With this, below is the sequence:
>=20
> CPUFreq suspend switches CPU to PLLP and disables dfll
>=20
> Will add dfll_suspend/resume in dfll-fcpu driver and in dfll suspend=20
> will check for dfll active and will error out suspend.
>=20
> dfll resume does dfll reinit.
>=20
> CPUFreq resume enables dfll and switches CPU to dfll.
>=20
>=20
> Will go with doing in dfll-fcpu pm_ops rather than parenting
> dfllCPU_OUT...
>=20

Sounds good.

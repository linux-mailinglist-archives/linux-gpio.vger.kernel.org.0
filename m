Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 467042EC75D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 01:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbhAGAga (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 19:36:30 -0500
Received: from mo-csw1114.securemx.jp ([210.130.202.156]:56018 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbhAGAga (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 19:36:30 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 1070Y2wf017046; Thu, 7 Jan 2021 09:34:02 +0900
X-Iguazu-Qid: 2wHHcVEABewtERwmYc
X-Iguazu-QSIG: v=2; s=0; t=1609979642; q=2wHHcVEABewtERwmYc; m=5gtMXf5aLkUuriQQt8s5+yfCz8lBKP4ioKHpSxI6VE0=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1112) id 1070Y0qC028747;
        Thu, 7 Jan 2021 09:34:01 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 1070Y0IO015064;
        Thu, 7 Jan 2021 09:34:00 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 1070Y0tr015175;
        Thu, 7 Jan 2021 09:34:00 +0900
Date:   Thu, 7 Jan 2021 09:33:58 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     devicetree <devicetree@vger.kernel.org>,
        punit1.agrawal@toshiba.co.jp,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, yuji2.ishikawa@toshiba.co.jp,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 0/4] gpio: visconti: Add Toshiba Visconti GPIO support
X-TSB-HOP: ON
Message-ID: <20210107003358.rlwdta7jkkyyzbzu@toshiba.co.jp>
References: <20201201181406.2371881-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <CAMRc=MeV8+rpoLkdbqzsqOmcsTY1g++B+cqDmSAWQP=gGGduWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeV8+rpoLkdbqzsqOmcsTY1g++B+cqDmSAWQP=gGGduWQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Wed, Jan 06, 2021 at 11:33:49AM +0100, Bartosz Golaszewski wrote:
> On Tue, Dec 1, 2020 at 10:16 AM Nobuhiro Iwamatsu
> <nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
> >
> > Hi,
> >
> > This series is the GPIO driver for Toshiba's ARM SoC, Visconti[0].
> > This provides DT binding documentation, device driver, MAINTAINER files, and updates to DT files.
> >
> > Update:
> >
> >   dt-bindings: gpio: Add bindings for Toshiba Visconti GPIO Controller:
> >     v2 -> v3: Fix dtschema/dtc warnings.
> >       dtschema/dtc warnings/errors:
> >         Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.example.dt.yaml: gpio@28020000: interrupts: [[0, 24, 4], [0, 25, 4], [0, 26, 4], [0, 27, 4], [0, 28, 4], [0, 29, 4], [0, 30, 4], [0, 31, 4], [0, 32, 4], [0, 33, 4], [0, 34, 4], [0, 35, 4], [0, 36, 4], [0, 37, 4], [0, 38, 4], [0, 39, 4]] is too short
> >           From schema: Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> >     v1 -> v2: Fix typo.
> >
> >   gpio: visoconti: Add Toshiba Visconti GPIO support:
> >     v2 -> v3: Add select GPIO_GENERIC
> >               Use genric MMIO GPIO library
> >               Use bgpio_init() as initialized the generic helpers.
> >               Use irqchip template instead of gpiochip_irqchip_add().
> >     v1 -> v2: No update
> >
> >   MAINTAINERS: Add entries for Toshiba Visconti GPIO controller:
> >     v2 -> v3: No update
> >     v1 -> v2: No update
> >
> >   arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver:
> >     v2 -> v3: Fix compatible string.
> >     v1 -> v2: No update
> >
> > Best regards,
> >   Nobuhiro
> >
> 
> Nobuhiro,
> 
> In the future please use the get_maintainers.pl script - I have never
> been Cc'ed on this series and I would have ignored it if Linus W
> hadn't brought it to my attention.
> 

Sorry, I'll use it next time.

Best regards,
  Nobuhiro

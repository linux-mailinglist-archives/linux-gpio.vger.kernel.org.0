Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9631258426
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Sep 2020 00:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgHaWmE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 18:42:04 -0400
Received: from mo-csw1514.securemx.jp ([210.130.202.153]:41970 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgHaWmD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 18:42:03 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 07VMfQSQ026490; Tue, 1 Sep 2020 07:41:27 +0900
X-Iguazu-Qid: 34tKqQuZ1lisVLW7Od
X-Iguazu-QSIG: v=2; s=0; t=1598913686; q=34tKqQuZ1lisVLW7Od; m=kz073COEC8/Vz1JSdsSGiLpapgpCT8FOcPrf0uIS8pA=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1510) id 07VMfOGm033713;
        Tue, 1 Sep 2020 07:41:24 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
        by imx2.toshiba.co.jp  with ESMTP id 07VMfO3q001106;
        Tue, 1 Sep 2020 07:41:24 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc03.toshiba.co.jp  with ESMTP id 07VMfNBT004239;
        Tue, 1 Sep 2020 07:41:23 +0900
Date:   Tue, 1 Sep 2020 07:41:22 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Olof Johansson <olof@lixom.net>,
        punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>
Subject: Re: [PATCH v3 0/8] Add Toshiba Visconti ARM64 Platform support
X-TSB-HOP: ON
Message-ID: <20200831224122.i5tau3atlty4ikeu@toshiba.co.jp>
References: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <CAK8P3a2xD-zp3ov=3vobSSAmyfvPCMe0mGgP3F7mZkk8WieUpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2xD-zp3ov=3vobSSAmyfvPCMe0mGgP3F7mZkk8WieUpw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Thanks for your review and comment.

On Mon, Aug 31, 2020 at 11:19:02AM +0200, Arnd Bergmann wrote:
> On Mon, Aug 31, 2020 at 10:10 AM Nobuhiro Iwamatsu
> <nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
> >
> > Visconti is a series of Toshiba's SoCs targeting image processing
> > applications[0]. These set of patches adds support for Visconti5 a Arm
> > v8 based SoC.
> >
> > The series add minimal support for the Visconti5 SoC and the TMPV7708 RM
> > main board. Peripherals such as UART, SPI, I2c and timer use Arm's
> > IP and work with the existing kernel drivers in the tree. The series
> > includes a pinctrl driver to select appropriate functions on the pins.
> 
> The arch/arm64 series looks all reasonable to me, nice work!
> 
> Once the review from the DT and pinctrl maintainers is completed
> and you have received their Acked-by or Reviewed-by tags, please
> send the series with those tags to soc@kernel.org for inclusion, keeping
> everyone else on Cc.
> 
> I'd leave it up to Linus Walleij whether he wants to merge the pinctrl driver
> through his subsystem tree, or whether we should pick it up through
> the soc tree, either way works for the initial merge. For any updates to
> the pinctrl driver and additional subsystem support (clk, media, ...)
> in later releases there is no need to Cc the SoC maintainers as those
> should just get merged through the subsystem while we take care
> of the DT files.

Thank you for the explanation. I will do that.
BTW, I searched the process for this but I couldn't find any detailed
documentation. Could you tell me if you know?

> 
> > NOTE: Because Visconti5 does not have PSCI, it uses spin-table with enable-method.
> 
> This sounds like an odd choice. Is this a permanent defect in the SoC
> or the firmware, or do you expect to change this later once the firmware
> has been fixed?

I will change it later when the firmware is fixed.

> 
> Note that most systems require PSCI anyway for cpuidle support. If there
> is any EL2 or EL3 mode firmware already, this is where support for
> processor bringup should be implemented. If there is none, you can
> usually implement it using a small EL3 trampoline in the bootloader.
> 

Yes, I understand that.
Our firmware team and I are currently considering a fix.

> >       And this patch series does not include a clock framework, so it is a
> >       device-tree file that uses clocks with fixed-clock. This will be replaced by
> >       the clock driver in the future.
> 
> This is ok for bringup, though we usually recommend to merge the clk driver
> at the same time as the SoC, in order to avoid having an incompatible DT
> change when adding the clk driver.

Yes, I do this with caution.

> 
>        Arnd
>

Best regards,
  Nobuhiro

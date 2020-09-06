Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C150C25F105
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 01:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgIFXJA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Sep 2020 19:09:00 -0400
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:56272 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgIFXI7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Sep 2020 19:08:59 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 086N8JEo008509; Mon, 7 Sep 2020 08:08:19 +0900
X-Iguazu-Qid: 34tKSwRU9BYuHzn0in
X-Iguazu-QSIG: v=2; s=0; t=1599433699; q=34tKSwRU9BYuHzn0in; m=bg21Vh1RzUmSRhTK3yMtiq8vAOBYj5w0yNVeDAf2yio=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1513) id 086N8GRS018624;
        Mon, 7 Sep 2020 08:08:17 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 086N8GUn005737;
        Mon, 7 Sep 2020 08:08:16 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 086N8Gcd003321;
        Mon, 7 Sep 2020 08:08:16 +0900
Date:   Mon, 7 Sep 2020 08:08:06 +0900
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
Message-ID: <20200906230806.GA3003239@toshiba.co.jp>
References: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <CAK8P3a2xD-zp3ov=3vobSSAmyfvPCMe0mGgP3F7mZkk8WieUpw@mail.gmail.com>
 <20200831224122.i5tau3atlty4ikeu@toshiba.co.jp>
 <CAK8P3a2O_-jiiRe41Dci3yAsN7s==u5b_fHGsXh6m6y-Ki7WAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2O_-jiiRe41Dci3yAsN7s==u5b_fHGsXh6m6y-Ki7WAQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Thanks for your comment.

On Tue, Sep 01, 2020 at 09:50:56AM +0200, Arnd Bergmann wrote:
> On Tue, Sep 1, 2020 at 12:41 AM Nobuhiro Iwamatsu
> <nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
> > On Mon, Aug 31, 2020 at 11:19:02AM +0200, Arnd Bergmann wrote:
> > > On Mon, Aug 31, 2020 at 10:10 AM Nobuhiro Iwamatsu
> > > <nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
> > > >
> > > > Visconti is a series of Toshiba's SoCs targeting image processing
> > > > applications[0]. These set of patches adds support for Visconti5 a Arm
> > > > v8 based SoC.
> > > >
> > > > The series add minimal support for the Visconti5 SoC and the TMPV7708 RM
> > > > main board. Peripherals such as UART, SPI, I2c and timer use Arm's
> > > > IP and work with the existing kernel drivers in the tree. The series
> > > > includes a pinctrl driver to select appropriate functions on the pins.
> > >
> > > The arch/arm64 series looks all reasonable to me, nice work!
> > >
> > > Once the review from the DT and pinctrl maintainers is completed
> > > and you have received their Acked-by or Reviewed-by tags, please
> > > send the series with those tags to soc@kernel.org for inclusion, keeping
> > > everyone else on Cc.
> > >
> > > I'd leave it up to Linus Walleij whether he wants to merge the pinctrl driver
> > > through his subsystem tree, or whether we should pick it up through
> > > the soc tree, either way works for the initial merge. For any updates to
> > > the pinctrl driver and additional subsystem support (clk, media, ...)
> > > in later releases there is no need to Cc the SoC maintainers as those
> > > should just get merged through the subsystem while we take care
> > > of the DT files.
> >
> > Thank you for the explanation. I will do that.
> > BTW, I searched the process for this but I couldn't find any detailed
> > documentation. Could you tell me if you know?
> 
> We never documented this well, sorry about that.
> 

No problem.

> Generally speaking, if you only have small updates (a few patches
> at a time), feel free to send those patches to soc@kernel.org once
> you consider them ready for inclusion.
> 
> On 32-bit architectures as well as the more widely used 64-bit
> platforms with many .dts files, please send pull requests that group
> the patches into logical topics. Once you are listed in the
> MAINTAINERS file and you want to host a git tree on git.kernel.org
> for that purpose, you can apply for a kernel.org account and
> send pull request from there as well as have the tree integrated
> into linux-next for earlier testing. On the more specialized platforms
> without third-party machine support in the kernel, that is usually not
> necessary.
> 
> In either case, patches and pull requests should be based on
> an early -rc tag from mainline Linux (normally -rc1) and get sent
> between -rc1 and roughly -rc5 for new features. Bug fixes can
> be sent at any time regardless of the current -rc, with a balance
> between sending them quickly and collecting multiple of them
> into a pull request to reduce the number of merges. Please let
> us know whether bug fixes should be applied only at the next
> merge window, on current kernels, or backported to previous
> releases, using the "Fixes:"  and "Cc: stable@vger.kernel.org"
> tags as appropriate. The default is to backport bug fixes as far
> back as they apply, unless there is a reason not to.
> 

Thank you for the detailed explanation.
The above explanation was very useful.

>      Arnd
> 

Best regards,
  Nobuhiro

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B22AC258658
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Sep 2020 05:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgIADkz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 23:40:55 -0400
Received: from mo-csw-fb1515.securemx.jp ([210.130.202.171]:60930 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgIADky (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 23:40:54 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1515) id 0813AjOS022722; Tue, 1 Sep 2020 12:10:45 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 0813A9v3005103; Tue, 1 Sep 2020 12:10:10 +0900
X-Iguazu-Qid: 34tKGq3o2x4XDvaAFg
X-Iguazu-QSIG: v=2; s=0; t=1598929809; q=34tKGq3o2x4XDvaAFg; m=gOyIt5w97KptMW7no7110cJkGdRGRzTxNKtQMOCbjKY=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1511) id 0813A7hF023278;
        Tue, 1 Sep 2020 12:10:07 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0813A6sq028940;
        Tue, 1 Sep 2020 12:10:06 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0813A6tb020018;
        Tue, 1 Sep 2020 12:10:06 +0900
From:   Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Arnd Bergmann <arnd@arndb.de>, DTML <devicetree@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        yuji2.ishikawa@toshiba.co.jp,
        "open list\:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Marc Zyngier <maz@misterjones.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 0/8] Add Toshiba Visconti ARM64 Platform support
References: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
        <CAK8P3a2xD-zp3ov=3vobSSAmyfvPCMe0mGgP3F7mZkk8WieUpw@mail.gmail.com>
        <20200831224122.i5tau3atlty4ikeu@toshiba.co.jp>
Date:   Tue, 01 Sep 2020 12:10:01 +0900
In-Reply-To: <20200831224122.i5tau3atlty4ikeu@toshiba.co.jp> (Nobuhiro
        Iwamatsu's message of "Tue, 1 Sep 2020 07:41:22 +0900")
X-TSB-HOP: ON
Message-ID: <87zh6ary46.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Iwamatsu-san,

Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp> writes:

> Hi,
>
> Thanks for your review and comment.
>
> On Mon, Aug 31, 2020 at 11:19:02AM +0200, Arnd Bergmann wrote:
>> On Mon, Aug 31, 2020 at 10:10 AM Nobuhiro Iwamatsu
>> <nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
>> >
>> > Visconti is a series of Toshiba's SoCs targeting image processing
>> > applications[0]. These set of patches adds support for Visconti5 a Arm
>> > v8 based SoC.
>> >
>> > The series add minimal support for the Visconti5 SoC and the TMPV7708 RM
>> > main board. Peripherals such as UART, SPI, I2c and timer use Arm's
>> > IP and work with the existing kernel drivers in the tree. The series
>> > includes a pinctrl driver to select appropriate functions on the pins.
>> 
>> The arch/arm64 series looks all reasonable to me, nice work!
>> 
>> Once the review from the DT and pinctrl maintainers is completed
>> and you have received their Acked-by or Reviewed-by tags, please
>> send the series with those tags to soc@kernel.org for inclusion, keeping
>> everyone else on Cc.
>> 
>> I'd leave it up to Linus Walleij whether he wants to merge the pinctrl driver
>> through his subsystem tree, or whether we should pick it up through
>> the soc tree, either way works for the initial merge. For any updates to
>> the pinctrl driver and additional subsystem support (clk, media, ...)
>> in later releases there is no need to Cc the SoC maintainers as those
>> should just get merged through the subsystem while we take care
>> of the DT files.
>
> Thank you for the explanation. I will do that.
> BTW, I searched the process for this but I couldn't find any detailed
> documentation. Could you tell me if you know?

I am not sure if this is documented, but SoC support (device tree, some
drivers, and config changes) usually go through the arm-soc tree curated
by Arnd, Olof and Kevin.

The MAINTAINERS entry for ARM64 port tries to call this out but it is
not obvious that architecture and platforms support is maintained
separately though in coordination.

Hope this helps.

Thanks,
Punit


[...]


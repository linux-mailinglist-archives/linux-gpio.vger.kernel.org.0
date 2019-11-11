Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72666F7EF1
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2019 20:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbfKKShs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Nov 2019 13:37:48 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:49524 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728893AbfKKShp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Nov 2019 13:37:45 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E7F7D60F40; Mon, 11 Nov 2019 18:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573497463;
        bh=XUkpMv4++eaCLngkRhw1OHredjSZzbrBaEaI/2OxE7Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kti4XqbdrQfRjqyR/k/Xny8Sb0xtKtDh1D3IZqqkBWb5xWvg+wQqdIJqZHwXihIhc
         PP/E99tj4XKhLGPKvShQANy20h4r2YeA4de5RLgEzbdHe1GbxE6mAjUHe/A+LCs8td
         mU/GHTayXswE5ngA9/blI9wj0zEDC+iSQbDuMgAY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7B643602EE;
        Mon, 11 Nov 2019 18:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573497460;
        bh=XUkpMv4++eaCLngkRhw1OHredjSZzbrBaEaI/2OxE7Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CCIKVj49JlSCWHldgpmCB4IXhwNUaHHiNm5k6jIRWgDZVugsSUC8R1s7h2Mz1ZCsf
         5lnoABiZDh9Qs36KSbNKgzk5Nte+p3XnHPr5lDmSPuekBBSB+t7v0kAfyUTaFl+OjP
         EWvdgpv61XulzSMrBvfQ+X5+gMoYvPKOCMmok6p4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7B643602EE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Mon, 11 Nov 2019 11:37:38 -0700
From:   Lina Iyer <ilina@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 06/14] dt-bindings/interrupt-controller: pdc: add
 SPI config register
Message-ID: <20191111183738.GJ16900@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
 <1568411962-1022-7-git-send-email-ilina@codeaurora.org>
 <5d92829e.1c69fb81.d860a.9096@mx.google.com>
 <5da6b849.1c69fb81.a9b04.1b9f@mx.google.com>
 <20191105205832.GE16900@codeaurora.org>
 <5dc219a0.1c69fb81.f5014.42d2@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5dc219a0.1c69fb81.f5014.42d2@mx.google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 05 2019 at 17:53 -0700, Stephen Boyd wrote:
>Quoting Lina Iyer (2019-11-05 12:58:32)
>> On Tue, Oct 15 2019 at 00:27 -0600, Stephen Boyd wrote:
>> >
>> >I had another idea the other day. Maybe a better approach would be to
>> >make the mailbox or SCM code an interrupt controller with the
>> >appropriate functions to poke the bits necessary to make the interrupts
>> >work. Then we can make it a chip in the hierarchy between the GIC and
>> >PDC and make the interrupts call through from PDC to GIC. The locking
>> >could be handled in each respective driver if necessary, and otherwise
>> >we don't have to use a regmap or remap the same registers (except we may
>> >need to describe if the parent is the mailbox node or the scm fimware
>> >node).
>> >
>> Wouldn't that be a stretch to image the SCM register write  or a random
>> register write as an interrupt controller? But I agree that it solves
>> the issue of determining whether we want to use SCM or regmap.
>
>As far as I can tell it's similar to PDC which is basically a gate on
>the line from a dedicated chip pad or a GPIO pad that lets the interrupt
>flow through to the GIC or not. Isn't this yet another hardware block on
>those paths that control the edge type or something?
>
>>
>> But, we would still need to add syscon to the mailbox and then regmap
>> the registers for the interrupt contoller.
>
>I'm saying that we can make the mailbox driver an interrupt controller
>driver too. Or if that doesn't work, we can map the region twice in each
>driver with ioremap and cross fingers that they don't touch the same
>register at the same time. It sounds like that is the case. We won't be
>able to fancily reserve the register region and map it in one function
>call, but maybe that can be fixed by limiting the size or offset that is
>reserved for each driver manually based on the same register property
>that's described in DT. Basically, one node in DT
>
> mailbox@f00 {
>   reg = <0xf00 0x1000>;
> };
>
>And then each driver will ioremap() the whole register region that's
>parsed from DT but each driver will mark sub-regions as reserved for the
>respective driver. That way we don't have to worry about using a regmap
>here and we'll still know what drivers are using what regions of IO in
>/proc/iomem.

Marc: What do you think of Stephen's idea? Summarizing my understanding
below -

We need to set an addition register for GPIOs that are routed to PDC and
the register may need to be written using a SCM call (SDM845) or written
from Linux (SDM855). The idea proposed here is -
Create multiple irqchips, one for each type of register access and then
put them in hierarchy based on the target.

SDM845:
TLMM  --> PDC  --> PDC-SCM-IF  --> GIC

SDM855:
TLMM  --> PDC  --> PDC-LNX-IF  --> GIC

The hierarchy would be explicit from the DT. So we would not have to
worry about figuring out using a property in DT or resource name. (May
be we can use a compatible instead?). The use of reserved_resource(),
suggested by Stephen, would help avoid other drivers writing to this
register which is part of a generic dump area for one-off registers.

--Lina

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03A76F0770
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 21:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725806AbfKEU6g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 15:58:36 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:40386 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729399AbfKEU6g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 15:58:36 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D8E47611AD; Tue,  5 Nov 2019 20:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572987514;
        bh=DFwG6pf/4V77m0uRPCOyhwzD8vIsAi111b7qu4IFdAc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hGOq8i8f9KkAOWni1cquk2A46wVf3m/irDn5vQsfhj+5QcTbnD6lo8vdJFUOVE8yc
         8UeISFb7wAHtSEcDZrpS1XgDSR2lDvkwtZodC35bPmjLe5MMBR3ALq3beD9pkYmucG
         o8qFz7t6tT5JKMcLuhw/l1EL0ClC2lLezNqpVLew=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AC99961153;
        Tue,  5 Nov 2019 20:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572987513;
        bh=DFwG6pf/4V77m0uRPCOyhwzD8vIsAi111b7qu4IFdAc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V7ZlSpdQdfVTY6VUfOwssIq8RuxzjhscpFXwJuzZbRTAOIpTvPYnr69IQLEm1mTsC
         J7dnLYYRBM9eO5KPlVe49eCyNwETPu7jtPoQQ9irHf6XACHGg48gFeYK9PenV5uz8f
         LgXySD/mAlzVgswi/BK1FrtbJn6lmGjfY+d6gmy4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AC99961153
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Tue, 5 Nov 2019 13:58:32 -0700
From:   Lina Iyer <ilina@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 06/14] dt-bindings/interrupt-controller: pdc: add
 SPI config register
Message-ID: <20191105205832.GE16900@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
 <1568411962-1022-7-git-send-email-ilina@codeaurora.org>
 <5d92829e.1c69fb81.d860a.9096@mx.google.com>
 <5da6b849.1c69fb81.a9b04.1b9f@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5da6b849.1c69fb81.a9b04.1b9f@mx.google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sorry for the late reply.

On Tue, Oct 15 2019 at 00:27 -0600, Stephen Boyd wrote:
>Quoting Stephen Boyd (2019-09-30 15:33:01)
>> Quoting Lina Iyer (2019-09-13 14:59:14)
>> > In addition to configuring the PDC, additional registers that interface
>> > the GIC have to be configured to match the GPIO type. The registers on
>> > some QCOM SoCs are access restricted, while on other SoCs are not. They
>> > SoCs with access restriction to these SPI registers need to be written
>> > from the firmware using the SCM interface. Add a flag to indicate if the
>> > register is to be written using SCM interface.
>> >
>> > Cc: devicetree@vger.kernel.org
>> > Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> > ---
>> >  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt   | 13 ++++++++++++-
>> >  1 file changed, 12 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
>> > index 8e0797c..e329f8d 100644
>> > --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
>> > +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
>> > @@ -24,6 +24,9 @@ Properties:
>> >         Usage: required
>> >         Value type: <prop-encoded-array>
>> >         Definition: Specifies the base physical address for PDC hardware.
>> > +                   Optionally, specify the PDC's GIC interface registers that
>> > +                   need to be configured for wakeup capable GPIOs routed to
>> > +                   the PDC.
>> >
>> >  - interrupt-cells:
>> >         Usage: required
>> > @@ -50,15 +53,23 @@ Properties:
>> >                     The second element is the GIC hwirq number for the PDC port.
>> >                     The third element is the number of interrupts in sequence.
>> >
>> > +- qcom,scm-spi-cfg:
>> > +       Usage: optional
>> > +       Value type: <bool>
>> > +       Definition: Specifies if the SPI configuration registers have to be
>> > +                   written from the firmware. Sometimes the PDC interface
>> > +                   register to the GIC can only be written from the firmware.
>> > +
>> >  Example:
>> >
>> >         pdc: interrupt-controller@b220000 {
>> >                 compatible = "qcom,sdm845-pdc";
>> > -               reg = <0xb220000 0x30000>;
>> > +               reg = <0 0x0b220000 0 0x30000>, <0 0x179900f0 0 0x60>;
>> >                 qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
>> >                 #interrupt-cells = <2>;
>> >                 interrupt-parent = <&intc>;
>> >                 interrupt-controller;
>> > +               qcom,scm-spi-cfg;
>> >         };
>>
>> This overlaps register region with the mailbox node. That node is
>> actually a pile of random "CPU" registers used to ping remote processors
>> and apparently control how the PDC interacts with the GIC. Maybe this
>> can be changed to a phandle and then the driver can interogate the
>> phandle to determine if it's the SCM firmware or if it's the shared
>> mailbox register? If it's a shared mailbox then it can write to it at
>> the offset it knows about (because it's sdm845 compatible specific) and
>> if it's SCM then it can use the hardcoded address as well?
>>
>> Basically I'm saying that it just needs a phandle.
>>
>>         qcom,spi-cfg = <&scm>;
>>
>> or
>>
>>         qcom,spi-cfg = <&mailbox>;
>>
>> and then driver knows how to use that to write into random registers.
>> Maybe we can have an API in regmap that finds the regmap for a given
>> device node? That way we don't have to funnel everything through syscon
>> for this.
>>
>>         of_get_regmap(struct device_node *np, const char *name);
>>
>> Where NULL name means "first available" and then do the devres search
>> otherwise for a device that has the matching node pointer.
>>
>
>I had another idea the other day. Maybe a better approach would be to
>make the mailbox or SCM code an interrupt controller with the
>appropriate functions to poke the bits necessary to make the interrupts
>work. Then we can make it a chip in the hierarchy between the GIC and
>PDC and make the interrupts call through from PDC to GIC. The locking
>could be handled in each respective driver if necessary, and otherwise
>we don't have to use a regmap or remap the same registers (except we may
>need to describe if the parent is the mailbox node or the scm fimware
>node).
>
Wouldn't that be a stretch to image the SCM register write  or a random
register write as an interrupt controller? But I agree that it solves
the issue of determining whether we want to use SCM or regmap.

But, we would still need to add syscon to the mailbox and then regmap
the registers for the interrupt contoller.

Thanks,
Lina



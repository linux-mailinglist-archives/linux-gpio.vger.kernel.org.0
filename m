Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB4B7A7160
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2019 19:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbfICRHZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Sep 2019 13:07:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47344 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729782AbfICRHZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Sep 2019 13:07:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5023E6058E; Tue,  3 Sep 2019 17:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567530444;
        bh=peIxQIYef8qNH4Y0hAECo3n1aQk635rjS9T/N1qw8Qw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lk8GTTVCePAccxj7umHquCQcJqCXlhcFrz7egG+SqS6gbOiozQmbM1zvNGOn/pbgy
         V7CtVbUT/XduG3uUC85ETQJeVwLwlQIDbUK8BpEexUzDaRJw/OoJfqcD0F9sq11SiN
         9VKdVIYIzlI8vAFb3/CoxEw/PQm7t7urD32/aOV8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E91F6058E;
        Tue,  3 Sep 2019 17:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567530443;
        bh=peIxQIYef8qNH4Y0hAECo3n1aQk635rjS9T/N1qw8Qw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AdZp3F3XRKYI9lq5tqZh+gGJNM0LOdWJeYa5ape8yOGw8ip/o5QTU7dH8X4lqc3SV
         pERJVQxC596mhGHWhaik9N1yOlwB1UAFKxb9QtFT8Y7FbfS8gGyk5MyeHJ27UDNNPo
         kYa5ybxYZ2bR81qAi7BEUffp8MUcdSzqIcAFxeIU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1E91F6058E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Tue, 3 Sep 2019 11:07:22 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Marc Zyngier <marc.zyngier@arm.com>
Cc:     Rob Herring <robh@kernel.org>, swboyd@chromium.org,
        evgreen@chromium.org, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 05/14] dt-bindings/interrupt-controller: pdc: add SPI
 config register
Message-ID: <20190903170722.GA31716@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
 <20190829181203.2660-6-ilina@codeaurora.org>
 <5d6d1b72.1c69fb81.ee88.efcf@mx.google.com>
 <102c9268-c4ce-6133-3b0a-67c2fcba1e7a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <102c9268-c4ce-6133-3b0a-67c2fcba1e7a@arm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 02 2019 at 07:58 -0600, Marc Zyngier wrote:
>On 02/09/2019 14:38, Rob Herring wrote:
>> On Thu, Aug 29, 2019 at 12:11:54PM -0600, Lina Iyer wrote:
>>> In addition to configuring the PDC, additional registers that interface
>>> the GIC have to be configured to match the GPIO type. The registers on
>>> some QCOM SoCs are access restricted, while on other SoCs are not. They
>>> SoCs with access restriction to these SPI registers need to be written
>>
>> Took me a minute to figure out this is GIC SPI interrupts, not SPI bus.
>>
>>> from the firmware using the SCM interface. Add a flag to indicate if the
>>> register is to be written using SCM interface.
>>>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>>> ---
>>>  .../bindings/interrupt-controller/qcom,pdc.txt           | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
>>> index 8e0797cb1487..852fcba98ea6 100644
>>> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
>>> @@ -50,15 +50,22 @@ Properties:
>>>  		    The second element is the GIC hwirq number for the PDC port.
>>>  		    The third element is the number of interrupts in sequence.
>>>
>>> +- qcom,scm-spi-cfg:
>>> +	Usage: optional
>>> +	Value type: <bool>
>>> +	Definition: Specifies if the SPI configuration registers have to be
>>> +		    written from the firmware.
>>> +
>>>  Example:
>>>
>>>  	pdc: interrupt-controller@b220000 {
>>>  		compatible = "qcom,sdm845-pdc";
>>> -		reg = <0xb220000 0x30000>;
>>> +		reg = <0xb220000 0x30000>, <0x179900f0 0x60>;
>>
>> There needs to be a description for reg updated. These aren't GIC
>> registers are they? Because those go in the GIC node.
>
They are not GIC registers. I will update this documentation.

>This is completely insane. Why are the GIC registers configured as
>secure the first place, if they are expected to be in control of the
>non-secure?
These are not GIC registers but located on the PDC interface to the GIC.
They may or may not be secure access controlled, depending on the SoC.

Thanks,
Lina

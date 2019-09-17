Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D66EB57C7
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2019 23:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbfIQVuY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Sep 2019 17:50:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35526 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfIQVuX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Sep 2019 17:50:23 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4BFB160767; Tue, 17 Sep 2019 21:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568757022;
        bh=+bL3Z3Y6Hl+C8MixFa02sCzsCPEv0bSGIE8FlarpAD8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LucnLAvs8c/a4VPdqBtIeaYQh0PZTAR2nm7XpcSuPUokuG86a76YQclF3twIDmrSp
         vC79sFw8HFGl4AyO/ceqwgeGYfrnyTu6fRK8t5AxtYLDQrnRjzlxxdtjnxnPbsQv7E
         HLeRVzSMDDs9TZocDCx+Ii9gW13Pn22eaLupuDAk=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F12960767;
        Tue, 17 Sep 2019 21:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568757021;
        bh=+bL3Z3Y6Hl+C8MixFa02sCzsCPEv0bSGIE8FlarpAD8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e9PVkqaCJJO0YMqwe3jsNEicNdxouQtoYWnqdXy3te9d5yDe/6oHUZUQ2C5sAfk6C
         M3mYJ/Kkle2a7MZbfKh3TbRsFO6qSOtTH/108NZ3Kww17HmyM1bJPNmC6LJcbmX/ZU
         RHPYsUM0UGBdYuom3CfytQRGQlYZ2t2W19Tv6jyc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F12960767
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Tue, 17 Sep 2019 15:50:20 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Herring <robh@kernel.org>, evgreen@chromium.org,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        mkshah@codeaurora.org, linux-gpio@vger.kernel.org,
        rnayak@codeaurora.org, devicetree@vger.kernel.org, maz@kernel.org,
        sibis@codeaurora.org
Subject: Re: [PATCH RFC 05/14] dt-bindings/interrupt-controller: pdc: add SPI
 config register
Message-ID: <20190917215020.GA15853@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
 <20190829181203.2660-6-ilina@codeaurora.org>
 <5d6d1b72.1c69fb81.ee88.efcf@mx.google.com>
 <102c9268-c4ce-6133-3b0a-67c2fcba1e7a@arm.com>
 <20190903170722.GA31716@codeaurora.org>
 <5d71a247.1c69fb81.2146f.7ed2@mx.google.com>
 <20190913195326.GA3293@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190913195326.GA3293@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adding Sibi

On Fri, Sep 13 2019 at 13:53 -0600, Lina Iyer wrote:
>Sorry, I couldn't get to this earlier.
>
>On Thu, Sep 05 2019 at 18:03 -0600, Stephen Boyd wrote:
>>Quoting Lina Iyer (2019-09-03 10:07:22)
>>>On Mon, Sep 02 2019 at 07:58 -0600, Marc Zyngier wrote:
>>>>On 02/09/2019 14:38, Rob Herring wrote:
>>>>> On Thu, Aug 29, 2019 at 12:11:54PM -0600, Lina Iyer wrote:
>>>These are not GIC registers but located on the PDC interface to the GIC.
>>>They may or may not be secure access controlled, depending on the SoC.
>>>
>>
>>It looks like it falls under this "mailbox" device which is really the
>>catch all bucket for bits with no home besides they're related to the
>>apps CPUs/subsystem.
>>
>Thanks for pointing to this.
>>	apss_shared: mailbox@17990000 {
>>		compatible = "qcom,sdm845-apss-shared";
>>		reg = <0 0x17990000 0 0x1000>;
>But this doesn't seem correct. The registers in this page are all not
>mailbox door bell registers. We should restrict the space allocated to
>the mbox to 0xC or something, definitely, not the whole page. They all
>cannot be treated as a mailbox registers.
>>		#mbox-cells = <1>;
>>	};
>>
>>Can you point to this node with a phandle and then parse the reg
>>property out of it to use in the scm readl/writel APIs? Maybe it can be
>>a two cell property with <&apps_shared 0xf0> to indicate the offset to
>>the registers to read/write? In non-secure mode presumably we need to
>>also write these registers? Good news is that there's a regmap for this
>>driver already, so maybe that can be acquired from the pdc driver.
>>
>The register space collection seems to be mix of different types of
>application processor registers that should probably not be grouped up
>under one subsystem. A single regmap doesn't seem correct either.
>
>-- Lina

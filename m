Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7303EBADAD
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2019 08:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392277AbfIWGLW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Sep 2019 02:11:22 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53134 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387519AbfIWGLW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2019 02:11:22 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3CD4C6074F; Mon, 23 Sep 2019 06:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569219081;
        bh=8DolRLs0GbfRHEgHoy6D7zlaerPJVBczUABbhVDLUi4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oGrEaNnakGpEe5eeevgLZyjKQYarQ+KmOKEku2A2RRy0wOxjPnHLA0jCRA48gJtfb
         CcoXEeCdUr4oIx8TryxNb4rq5oc936rJnSGL2z+NB2PyzSOz3UKWfDMaVDc3yXdr/S
         aRtpQIoAPECCKeJPgbAWjby/ArVS9h8tRFiBQZSQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 7830E6076C;
        Mon, 23 Sep 2019 06:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569219080;
        bh=8DolRLs0GbfRHEgHoy6D7zlaerPJVBczUABbhVDLUi4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QC8zG9kFbGEwFoxBqr9a42xT6Vl1DJ/YA+GXa+TvHWqdM6AKHxyIlI5No+UCDbaX2
         rMWKS+dgm6Wy2OuHgNrQXO/Rmz5xf0CoCSStpcQ7zq5KlWDBDjWNuo+RLZCkvNbfCh
         V5+4DA5Q1OdwVeyVX5e+efrZrKIJ2FjsJELqrzFE=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Sep 2019 11:41:20 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Lina Iyer <ilina@codeaurora.org>, Rob Herring <robh@kernel.org>,
        evgreen@chromium.org, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        devicetree@vger.kernel.org, maz@kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH RFC 05/14] dt-bindings/interrupt-controller: pdc: add SPI
 config register
In-Reply-To: <5d8550aa.1c69fb81.39edc.83fc@mx.google.com>
References: <20190829181203.2660-1-ilina@codeaurora.org>
 <20190829181203.2660-6-ilina@codeaurora.org>
 <5d6d1b72.1c69fb81.ee88.efcf@mx.google.com>
 <102c9268-c4ce-6133-3b0a-67c2fcba1e7a@arm.com>
 <20190903170722.GA31716@codeaurora.org>
 <5d71a247.1c69fb81.2146f.7ed2@mx.google.com>
 <20190913195326.GA3293@codeaurora.org>
 <20190917215020.GA15853@codeaurora.org>
 <5d8550aa.1c69fb81.39edc.83fc@mx.google.com>
Message-ID: <6b6c357d7cccecd70e88852d7c487114@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2019-09-21 03:50, Stephen Boyd wrote:
> Quoting Lina Iyer (2019-09-17 14:50:20)
>> On Fri, Sep 13 2019 at 13:53 -0600, Lina Iyer wrote:
>> >On Thu, Sep 05 2019 at 18:03 -0600, Stephen Boyd wrote:
>> >>Quoting Lina Iyer (2019-09-03 10:07:22)
>> >>>On Mon, Sep 02 2019 at 07:58 -0600, Marc Zyngier wrote:
>> >>>>On 02/09/2019 14:38, Rob Herring wrote:
>> >>>>> On Thu, Aug 29, 2019 at 12:11:54PM -0600, Lina Iyer wrote:
>> >>>These are not GIC registers but located on the PDC interface to the GIC.
>> >>>They may or may not be secure access controlled, depending on the SoC.
>> >>>
>> >>
>> >>It looks like it falls under this "mailbox" device which is really the
>> >>catch all bucket for bits with no home besides they're related to the
>> >>apps CPUs/subsystem.
>> >>
>> >Thanks for pointing to this.
>> >>      apss_shared: mailbox@17990000 {
>> >>              compatible = "qcom,sdm845-apss-shared";
>> >>              reg = <0 0x17990000 0 0x1000>;
>> >But this doesn't seem correct. The registers in this page are all not
>> >mailbox door bell registers. We should restrict the space allocated to
>> >the mbox to 0xC or something, definitely, not the whole page. They all
>> >cannot be treated as a mailbox registers.
> 
> Well the binding is already done and this is the compatible string for
> this node and register region. Sounds like this node is a mailbox plus
> some more stuff in the same page.
> 

Bjorn already noticed ^^ during the
original review. Hence the compatible
was correctly named "apss-shared"
instead of following the older bindings.

>> >>              #mbox-cells = <1>;
>> >>      };
>> >>
>> >>Can you point to this node with a phandle and then parse the reg
>> >>property out of it to use in the scm readl/writel APIs? Maybe it can be
>> >>a two cell property with <&apps_shared 0xf0> to indicate the offset to
>> >>the registers to read/write? In non-secure mode presumably we need to
>> >>also write these registers? Good news is that there's a regmap for this
>> >>driver already, so maybe that can be acquired from the pdc driver.
>> >>
>> >The register space collection seems to be mix of different types of
>> >application processor registers that should probably not be grouped up
>> >under one subsystem. A single regmap doesn't seem correct either.
> 
> Why isn't a single regmap correct? The PDC driver should be able to use
> it to read/write into this register space. The lock on the regmap will
> need to be changed to a raw lock though for RT. Otherwise it looks OK 
> to
> me.

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3E6B2649
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 21:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388207AbfIMTxa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 15:53:30 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55468 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729670AbfIMTx3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 15:53:29 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4009160770; Fri, 13 Sep 2019 19:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568404408;
        bh=PBhczAxgGjJzcJPYs5T3OHtqWkVJvof+zdxMM1IFvbg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AmU0IYHzJcYptiF+l+/vTuBGnNyRRUPfS+N5FbkaaGQiA5HOpa5Sh1qbNNWlmWInH
         QHEPBfQ9LaWRgMD1VNt4CEvVr5v6UN4ultrJvjswYEPdTerOumbK78jHVziDdWJ475
         yQKjjp7MrvVFZxN7+xbhhlA/6SpK0/+HZf5EOt6k=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4539460770;
        Fri, 13 Sep 2019 19:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568404407;
        bh=PBhczAxgGjJzcJPYs5T3OHtqWkVJvof+zdxMM1IFvbg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SFuM9u936AWPbXLPJKuCFFyLQ7WsQYwG/6SiF23ViGYBu7kM6Iua3Sn2xtRkl9kU0
         yyr0s3Ezs+KQ8zjr/8DACAdCwGfMo4RMvKoMixuyN4RWSV0nDIZ3FV9sOGaFlv0Gy9
         mLJlSeEKrwJ1LFuiOZsOu+mYdYQ1r9/kb/dM7Q6w=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4539460770
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Fri, 13 Sep 2019 13:53:26 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Herring <robh@kernel.org>, evgreen@chromium.org,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        mkshah@codeaurora.org, linux-gpio@vger.kernel.org,
        rnayak@codeaurora.org, devicetree@vger.kernel.org, maz@kernel.org
Subject: Re: [PATCH RFC 05/14] dt-bindings/interrupt-controller: pdc: add SPI
 config register
Message-ID: <20190913195326.GA3293@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
 <20190829181203.2660-6-ilina@codeaurora.org>
 <5d6d1b72.1c69fb81.ee88.efcf@mx.google.com>
 <102c9268-c4ce-6133-3b0a-67c2fcba1e7a@arm.com>
 <20190903170722.GA31716@codeaurora.org>
 <5d71a247.1c69fb81.2146f.7ed2@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5d71a247.1c69fb81.2146f.7ed2@mx.google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sorry, I couldn't get to this earlier.

On Thu, Sep 05 2019 at 18:03 -0600, Stephen Boyd wrote:
>Quoting Lina Iyer (2019-09-03 10:07:22)
>> On Mon, Sep 02 2019 at 07:58 -0600, Marc Zyngier wrote:
>> >On 02/09/2019 14:38, Rob Herring wrote:
>> >> On Thu, Aug 29, 2019 at 12:11:54PM -0600, Lina Iyer wrote:
>> These are not GIC registers but located on the PDC interface to the GIC.
>> They may or may not be secure access controlled, depending on the SoC.
>>
>
>It looks like it falls under this "mailbox" device which is really the
>catch all bucket for bits with no home besides they're related to the
>apps CPUs/subsystem.
>
Thanks for pointing to this.
>	apss_shared: mailbox@17990000 {
>		compatible = "qcom,sdm845-apss-shared";
>		reg = <0 0x17990000 0 0x1000>;
But this doesn't seem correct. The registers in this page are all not
mailbox door bell registers. We should restrict the space allocated to
the mbox to 0xC or something, definitely, not the whole page. They all
cannot be treated as a mailbox registers.
>		#mbox-cells = <1>;
>	};
>
>Can you point to this node with a phandle and then parse the reg
>property out of it to use in the scm readl/writel APIs? Maybe it can be
>a two cell property with <&apps_shared 0xf0> to indicate the offset to
>the registers to read/write? In non-secure mode presumably we need to
>also write these registers? Good news is that there's a regmap for this
>driver already, so maybe that can be acquired from the pdc driver.
>
The register space collection seems to be mix of different types of
application processor registers that should probably not be grouped up
under one subsystem. A single regmap doesn't seem correct either.

-- Lina

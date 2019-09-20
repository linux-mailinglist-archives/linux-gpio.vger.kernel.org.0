Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E96F5B99B1
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Sep 2019 00:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404452AbfITWbp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Sep 2019 18:31:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44106 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393874AbfITWbo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2019 18:31:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E1ABB6118D; Fri, 20 Sep 2019 22:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569018703;
        bh=+crPnGft+zZHXGVhTxLrCRBi5J41OVmy7KmdT97O34E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cIu4Ag7IzhL+frMMcRMaDtGCKgqg6EDR0OLFaZAhBw9mgXCfgJR9qiGixHlTglBSz
         GUqWIieWCgsvIyZpALpcitmjpUKnXhKDiR45iQwEwy0/+F3X7TgWbc8SgyT8SPTUIH
         nQi4BWwil+oLjdZo7MjrDbMGOgBhby6m7bfBRGZA=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ECFEB60A60;
        Fri, 20 Sep 2019 22:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569018703;
        bh=+crPnGft+zZHXGVhTxLrCRBi5J41OVmy7KmdT97O34E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cIu4Ag7IzhL+frMMcRMaDtGCKgqg6EDR0OLFaZAhBw9mgXCfgJR9qiGixHlTglBSz
         GUqWIieWCgsvIyZpALpcitmjpUKnXhKDiR45iQwEwy0/+F3X7TgWbc8SgyT8SPTUIH
         nQi4BWwil+oLjdZo7MjrDbMGOgBhby6m7bfBRGZA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ECFEB60A60
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Fri, 20 Sep 2019 16:31:42 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     evgreen@chromium.org, linus.walleij@linaro.org,
        marc.zyngier@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        mkshah@codeaurora.org, linux-gpio@vger.kernel.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH RFC 02/14] drivers: irqchip: pdc: Do not toggle
 IRQ_ENABLE during mask/unmask
Message-ID: <20190920223142.GI15853@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
 <20190829181203.2660-3-ilina@codeaurora.org>
 <5d71aad9.1c69fb81.f469e.262f@mx.google.com>
 <20190911161557.GB30053@codeaurora.org>
 <5d85511e.1c69fb81.98f62.dae0@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5d85511e.1c69fb81.98f62.dae0@mx.google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 20 2019 at 16:22 -0600, Stephen Boyd wrote:
>Quoting Lina Iyer (2019-09-11 09:15:57)
>> On Thu, Sep 05 2019 at 18:39 -0600, Stephen Boyd wrote:
>> >Quoting Lina Iyer (2019-08-29 11:11:51)
>> >> When an interrupt is to be serviced, the convention is to mask the
>> >> interrupt at the chip and unmask after servicing the interrupt. Enabling
>> >> and disabling the interrupt at the PDC irqchip causes an interrupt storm
>> >> due to the way dual edge interrupts are handled in hardware.
>> >>
>> >> Skip configuring the PDC when the IRQ is masked and unmasked, instead
>> >> use the irq_enable/irq_disable callbacks to toggle the IRQ_ENABLE
>> >> register at the PDC. The PDC's IRQ_ENABLE register is only used during
>> >> the monitoring mode when the system is asleep and is not needed for
>> >> active mode detection.
>> >
>> >I think this is saying that we want to always let the line be sent
>> >through the PDC to the parent irqchip, in this case GIC, so that we
>> >don't get an interrupt storm for dual edge interrupts? Why does dual
>> >edge interrupts cause a problem?
>> >
>> I am not sure about the hardware details, but the PDC designers did not
>> expect enable and disable to be called whenever the interrupt is
>> handled. This specially becomes a problem for dual edge interrupts which
>> seems to generate a interrupt storm when enabled/disabled while handling
>> the interrupt.
>>
>
>Ok. I just wanted to confirm that masking "doesn't matter" to the PDC
>because it assumes the irqchip closer to the CPU will be able to mask it
>anyway. Is that right?
>
That is correct.

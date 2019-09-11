Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07C5AB0112
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 18:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728836AbfIKQQC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 12:16:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37510 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728818AbfIKQQC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 12:16:02 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B92E360850; Wed, 11 Sep 2019 16:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568218561;
        bh=4pqyw3IXTBXHyJWpxTvm1Q2YJt8vEQt6DZIUC1to7nI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I1g18rBM8Zv19w3RUn4yVD5rKQyQWBW2fXlf9Qf3ouqMbbwsKDICuL+z0NuFQq8/o
         MSW9wEbxQR4q5dnRNV4J9UL7emrwVqKV8SUDoJs/JaVhoFHpHfjrNdb2k39ZPdbSaH
         jnH559wTmz/y+xBdyUNK8Fc949Wocn2ecxJFLthA=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 36EAA602BC;
        Wed, 11 Sep 2019 16:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568218559;
        bh=4pqyw3IXTBXHyJWpxTvm1Q2YJt8vEQt6DZIUC1to7nI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UDgWMZCS1la7fmC+L4cGPM1lpn6JYB68/34qRhNl8r0idwkVLNp8ruGkL8iM9R3qJ
         H0JZeO5HN3vLOuTNSeWQQZmz07aUlNBRthwsGQ5JwAQrQ9PhTLoYhqLiR3PLpPPRqR
         PmznQE9QLAIgjyye48f2qz2nnLBcQt5fKOaPc/EA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 36EAA602BC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Wed, 11 Sep 2019 10:15:57 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     evgreen@chromium.org, linus.walleij@linaro.org,
        marc.zyngier@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        mkshah@codeaurora.org, linux-gpio@vger.kernel.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH RFC 02/14] drivers: irqchip: pdc: Do not toggle
 IRQ_ENABLE during mask/unmask
Message-ID: <20190911161557.GB30053@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
 <20190829181203.2660-3-ilina@codeaurora.org>
 <5d71aad9.1c69fb81.f469e.262f@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5d71aad9.1c69fb81.f469e.262f@mx.google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 05 2019 at 18:39 -0600, Stephen Boyd wrote:
>Quoting Lina Iyer (2019-08-29 11:11:51)
>> When an interrupt is to be serviced, the convention is to mask the
>> interrupt at the chip and unmask after servicing the interrupt. Enabling
>> and disabling the interrupt at the PDC irqchip causes an interrupt storm
>> due to the way dual edge interrupts are handled in hardware.
>>
>> Skip configuring the PDC when the IRQ is masked and unmasked, instead
>> use the irq_enable/irq_disable callbacks to toggle the IRQ_ENABLE
>> register at the PDC. The PDC's IRQ_ENABLE register is only used during
>> the monitoring mode when the system is asleep and is not needed for
>> active mode detection.
>
>I think this is saying that we want to always let the line be sent
>through the PDC to the parent irqchip, in this case GIC, so that we
>don't get an interrupt storm for dual edge interrupts? Why does dual
>edge interrupts cause a problem?
>
I am not sure about the hardware details, but the PDC designers did not
expect enable and disable to be called whenever the interrupt is
handled. This specially becomes a problem for dual edge interrupts which
seems to generate a interrupt storm when enabled/disabled while handling
the interrupt.

--Lina


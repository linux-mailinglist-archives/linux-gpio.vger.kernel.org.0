Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6DC9FCE35
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 19:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbfKNS5S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Nov 2019 13:57:18 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:35050 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfKNS5R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Nov 2019 13:57:17 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0B29C60F90; Thu, 14 Nov 2019 18:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573757837;
        bh=kGHHDhxFcB0ua6Q2kIcueqlm1c4XucBEKXaw5BAbH1o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fdjfXYcIIGY0JvsTFSlxLE3edoVnATJC6OW93Xb8sc1V6oJ8Azc/qw9LkU8/GHWKA
         SKmHT90OnQBIEIh0qzM0rf9UjoyzbXbZVjy7wWWFj3q+5y+Hlh0jJ6iioSNHNfWJwC
         ZeeeF0ACyVf+OWWALgdHG/HLrQiewyJV5FR8FIkU=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2584B60EE9;
        Thu, 14 Nov 2019 18:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573757836;
        bh=kGHHDhxFcB0ua6Q2kIcueqlm1c4XucBEKXaw5BAbH1o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n85C23IjABwJpR203kWCymv2uXERPyhSyVy6Q2OJ0iKVLKD5bHz3lvsgm5PaXBdGp
         9VyMrayg7ZML1W8ickZKOjD/db7J4zHN5qZ5wc3aBTc6RtiDcix/dPWqQs1FGKb2YB
         44gr6NjcRzgUmTjWy7WMXWDsRM/UFVecpXbpSdpI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2584B60EE9
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Thu, 14 Nov 2019 11:57:15 -0700
From:   Lina Iyer <ilina@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Marc Zyngier <maz@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 08/12] drivers: pinctrl: msm: setup GPIO chip in hierarchy
Message-ID: <20191114185715.GC18786@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
 <1573756521-27373-9-git-send-email-ilina@codeaurora.org>
 <CACRpkdYZoAnFno630Fxazz_Kvz4fEmKd-wohprdQqeM44f3tAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACRpkdYZoAnFno630Fxazz_Kvz4fEmKd-wohprdQqeM44f3tAg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 14 2019 at 11:47 -0700, Linus Walleij wrote:
>On Thu, Nov 14, 2019 at 7:35 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
>> Some GPIOs are marked as wakeup capable and are routed to another
>> interrupt controller that is an always-domain and can detect interrupts
>> even most of the SoC is powered off. The wakeup interrupt controller
>> wakes up the GIC and replays the interrupt at the GIC.
>>
>> Setup the TLMM irqchip in hierarchy with the wakeup interrupt controller
>> and ensure the wakeup GPIOs are handled correctly.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>
>This looks finished, and elegant.
>Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
Thanks Linus.

-- Lina

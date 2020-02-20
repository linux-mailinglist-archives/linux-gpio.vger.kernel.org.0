Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8A41659F8
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 10:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgBTJRX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 04:17:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:52654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726756AbgBTJRX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 Feb 2020 04:17:23 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 40A6A24654;
        Thu, 20 Feb 2020 09:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582190242;
        bh=bWixAGMKU8jAr6IWwbDseU4VCSvdbKE6KK8Sbxd6ZgQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oJYUJB6wiSoeEmvNcEfS3X7VfOLuHVjdjpsoUFRkT/spgki8coClO8V4oD4Dal1bU
         JiDCIS1NSjQvu9qOYE1c8wHBlgz1p7hfeOA4hnjgAmI3ENkHLFMEH2DjofD322hQ3z
         CCAioEScjF2KXmXZ8Kk9QFf2wlc4rC8O0Tes1TdQ=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1j4hxQ-006gyh-Gj; Thu, 20 Feb 2020 09:17:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 Feb 2020 09:17:20 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3 2/2] pinctrl: stm32: Add level interrupt support to
 gpio irq chip
In-Reply-To: <CACRpkdZ7uq4U6GBQQQh=pTLf4wW3KfH3Zrz9z_3ZQgoaJD9Ynw@mail.gmail.com>
References: <20200219143229.18084-1-alexandre.torgue@st.com>
 <20200219143229.18084-3-alexandre.torgue@st.com>
 <CACRpkdZ7uq4U6GBQQQh=pTLf4wW3KfH3Zrz9z_3ZQgoaJD9Ynw@mail.gmail.com>
Message-ID: <c991edca3e8925cf0489c0a5676f77b2@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: linus.walleij@linaro.org, alexandre.torgue@st.com, tglx@linutronix.de, jason@lakedaemon.net, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, marex@denx.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-02-20 09:04, Linus Walleij wrote:
> On Wed, Feb 19, 2020 at 3:32 PM Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
> 
>> GPIO hardware block is directly linked to EXTI block but EXTI handles
>> external interrupts only on edge. To be able to handle GPIO interrupt 
>> on
>> level a "hack" is done in gpio irq chip: parent interrupt (exti irq 
>> chip)
>> is retriggered following interrupt type and gpio line value.
>> 
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>> Tested-by: Marek Vasut <marex@denx.de>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> If Marc want to merge it with patch 1/2 go ahead!

I'll queue the whole thing for 5.7.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

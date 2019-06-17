Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 063AC48D1F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbfFQS5i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:57:38 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41014 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfFQS5i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:57:38 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5HIvPLJ005706;
        Mon, 17 Jun 2019 13:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560797845;
        bh=eXKVDlqZzqdlgcUJUU+jPPZepnuhi3ZTqQo/hbODeEM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=oIw06plIitBYLiJdchxsmU0MSki7Rlx0JhmUTmr2teR4u91wdDsjNpjwIYjoeLg1n
         Z+J4I5d3HwJ5wVpymWg0Ry7rhcxKNViibyTroUMRqLATNP9Du2Gqmccpq0tlg9E9tP
         M1STJHAzAB8aN53HvWsfWtEqGZIA/bgLzLAMoRT4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5HIvPdS082788
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 17 Jun 2019 13:57:25 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 17
 Jun 2019 13:57:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 17 Jun 2019 13:57:24 -0500
Received: from [10.250.96.121] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5HIvKQp019312;
        Mon, 17 Jun 2019 13:57:21 -0500
Subject: Re: [PATCH-next 20/20] gpio: gpio-omap: clean up register access in
 omap2_set_gpio_debounce()
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Russell King <rmk@arm.linux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
References: <20190610171103.30903-1-grygorii.strashko@ti.com>
 <20190610171103.30903-21-grygorii.strashko@ti.com>
 <CACRpkda2FhYNYA2TkVANOF5GWd3hE9cqM7N_pFDFj9nh-fh=iA@mail.gmail.com>
From:   grygorii <grygorii.strashko@ti.com>
Message-ID: <0ab98094-f8b2-69a3-e73c-1dfdf812d627@ti.com>
Date:   Mon, 17 Jun 2019 21:57:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CACRpkda2FhYNYA2TkVANOF5GWd3hE9cqM7N_pFDFj9nh-fh=iA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 12/06/2019 12:11, Linus Walleij wrote:
> On Mon, Jun 10, 2019 at 7:13 PM Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
> 
>> From: Russell King <rmk+kernel@armlinux.org.uk>
>>
>> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> 
> Patch applied.

Thanks Linus.

> 
> At your convenience please look at the debounce function a bit
> closer because I think there is a bug/unpredictable behavior:
> 
> IIUC the whole bank/block of GPIOs share the same debounce
> timer setting, and it is currently handled in a "last caller wins"
> manner, so if the different GPIOs in the bank has different
> debounce settings, the call order decides what debounce time
> is used across all of them.

Yeah. this is a "known" problem :(

> 
> In drivers/gpio/gpio-ftgpio.c function ftgpio_gpio_set_config()
> I simply reject a dounce time setting
> different from the currently configured if any GPIOs are
> currently using the deounce feature.
> 
> (It's the semantic I came up with but maybe there are other
> ideas here.)


There is one more patch in int. queue for debounce, but I've
decided to send it after this series as OMAP debounce changes are
usually debatable.

I'll look at gpio-ftgpio also.

By the way, there seems no ABI for debounce cfg in gpio_dev interface.
(or i'm missing smth?)

-- 
Best regards,
grygorii

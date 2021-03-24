Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC847347A26
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 15:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235592AbhCXOEV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 10:04:21 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:30210 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbhCXOD5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 10:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1616594637; x=1648130637;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=wBInpsFLZS8A1IIEXgvAg26d+AexU/0HeDXfGLeqcu8=;
  b=rmJigHHB9MFp9TAv+ln7k2ZeZ08Pwn8ZYn7m3TMFWc6bkWqcTNbY3Z77
   UpYRTudsKm9MuNqEEwEoZRAvc6tQc1VXYw+X3V27iLDaCpzgy0/2ssFYw
   x3bO1AXkMFxzEr/T1o/LohNvxfTz/3cKZ0Gjf0Q/UQtTuQp9z0Wv4t3q0
   A=;
X-IronPort-AV: E=Sophos;i="5.81,274,1610409600"; 
   d="scan'208";a="95933423"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 24 Mar 2021 14:03:47 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS id 6F6C0A2626;
        Wed, 24 Mar 2021 14:03:46 +0000 (UTC)
Received: from EX13D21UWB001.ant.amazon.com (10.43.161.108) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 24 Mar 2021 14:03:46 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D21UWB001.ant.amazon.com (10.43.161.108) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 24 Mar 2021 14:03:46 +0000
Received: from [192.168.12.56] (10.1.212.27) by mail-relay.amazon.com
 (10.43.160.118) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 24 Mar 2021 14:03:42 +0000
Subject: Re: [PATCH v4 0/3] Fix pinctrl-single pcs_pin_dbg_show()
To:     Drew Fustini <drew@beagleboard.org>
CC:     <andy.shevchenko@gmail.com>, <tony@atomide.com>,
        <haojian.zhuang@linaro.org>, <linus.walleij@linaro.org>,
        <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <tgershi@amazon.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20210319152133.28705-1-hhhawa@amazon.com>
 <20210322055631.GB392062@x1>
From:   "Hawa, Hanna" <hhhawa@amazon.com>
Message-ID: <ecaae08b-a8b7-ad36-1f71-af08c0cc6a88@amazon.com>
Date:   Wed, 24 Mar 2021 16:03:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322055631.GB392062@x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/22/2021 7:56 AM, Drew Fustini wrote:
> I'm curious what SoC are you using?

I'm working on Amazon Annapurna Labs SoCs (based on ARM cortex 
processors). That include multiple pins controlled with same register.

> 
> It's good to know who has hardware to test bits_per_mux in the future.
> 
> I pay attention to pinctrl-single as that is the driver used for the TI
> AM3358 SoC used in a variety of BeagleBone boards.  It does not use
> bits_per_mux, but I can verify that this does not cause any regression
> for the AM3358 SoC:
> 
>    /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single# cat pins
>    registered pins: 142
>    pin 0 (PIN0) 0:? 44e10800 00000027 pinctrl-single
>    pin 1 (PIN1) 0:? 44e10804 00000027 pinctrl-single
>    pin 2 (PIN2) 0:? 44e10808 00000027 pinctrl-single
>    pin 3 (PIN3) 0:? 44e1080c 00000027 pinctrl-single
>    pin 4 (PIN4) 0:? 44e10810 00000027 pinctrl-single
>    pin 5 (PIN5) 0:? 44e10814 00000027 pinctrl-single
>    pin 6 (PIN6) 0:? 44e10818 00000027 pinctrl-single
>    pin 7 (PIN7) 0:? 44e1081c 00000027 pinctrl-single
>    pin 8 (PIN8) 22:gpio-96-127 44e10820 00000027 pinctrl-single
>    pin 9 (PIN9) 23:gpio-96-127 44e10824 00000037 pinctrl-single
>    pin 10 (PIN10) 26:gpio-96-127 44e10828 00000037 pinctrl-single
>    pin 11 (PIN11) 27:gpio-96-127 44e1082c 00000037 pinctrl-single
>    pin 12 (PIN12) 0:? 44e10830 00000037 pinctrl-single
>    <snip>
>    pin 140 (PIN140) 0:? 44e10a30 00000028 pinctrl-single
>    pin 141 (PIN141) 13:gpio-64-95 44e10a34 00000020 pinctrl-single
> 
> Reviewed-by: Drew Fustini<drew@beagleboard.org>

Thanks for review and verify the change.

Thanks,
Hanna

> 
> Thanks,
> Drew

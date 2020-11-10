Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D16F2AD21F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 10:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729962AbgKJJIu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 04:08:50 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:44648 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgKJJIt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 04:08:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1604999329; x=1636535329;
  h=from:subject:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Vi4oSqcaW147X+OPEnvBxt8RzY3S5hCwov5jmSawii8=;
  b=mUHoIG1P08MPwoeLeHkJKeAYMWowLg05qi6TFoS/NkV3u0MFk9f89cb6
   vn+sLILhd3giK1cYbAeTK1ujbKS322Cl/7SuYCgdLbNToiE/nmed6/Pyk
   d0a4BJIeAZbdN8ZcLV9cix0ijlz0eGcVn5xeGygXOKblufL5ymSopxyXP
   KHiiCjS2mmjHBlN8PCIofEtyh4KNGFVZYfsZNpFowoUzrV+mgQKv7bERn
   +nVL8hNeLa5AgQgzQXl/cpY3eCUHFYeXANigyriuw/6f79FDY7+FIRtwg
   Lh+EcY0pwrPs6VyNeTLZ/PFIpfkLRBDfcwficFpfIUEhoYTRIgXNSZnn+
   Q==;
IronPort-SDR: 4H767wXXUELlw/fV+Fmj0fcuEu+wPa2y5RdL6QrwC+8kRdPH4Hb02T8vOLnBiir3XCCYFQ9oYp
 oAkfZ//2Mjr9Z8kSwDwJ34i1iLhi4yo5wNnAoObobnKenhuQrOvCsvcU29L8OpTnTS3P21dpM+
 wjeL3uggoDZiphSxyEWmnoSJmcTB+G2KoYE6N7ji53t7KgsB66vcvX3q1r+7QZru2xb8z7r/mF
 CJbUhBDanBNd2XQpjWz5Tqi6kmb2xri52+B6VNCbALdmq6fecvZDAwISbXqACkLeJYQBvCv8KB
 vBk=
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="97839074"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2020 02:08:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 10 Nov 2020 02:08:48 -0700
Received: from [10.171.246.109] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Tue, 10 Nov 2020 02:08:45 -0700
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH] pinctrl: pinctrl-at91-pio4: Set irq handler and data in
 one go
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Martin Kaiser <martin@kaiser.cx>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201108180144.28594-1-martin@kaiser.cx>
 <CAHp75VeVPUJ_a4L+Lj-zR6Wm3Woq6F0uHzmtx3NCRO=TVopvrw@mail.gmail.com>
Organization: microchip
Message-ID: <fc6a99af-7cee-b0ae-c4b1-cc7249e22b6c@microchip.com>
Date:   Tue, 10 Nov 2020 10:08:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VeVPUJ_a4L+Lj-zR6Wm3Woq6F0uHzmtx3NCRO=TVopvrw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/11/2020 at 12:26, Andy Shevchenko wrote:
> On Sun, Nov 8, 2020 at 8:05 PM Martin Kaiser <martin@kaiser.cx> wrote:
>>
>> Replace the two separate calls for setting the irq handler and data with a
>> single irq_set_chained_handler_and_data() call.
> 
> Can it be rewritten to use the GPIO core facility of instantiating IRQ chip?

I have the feeling it's out of scope for this (tiny) patch.

Regards,
-- 
Nicolas Ferre

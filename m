Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67FE81D8865
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 21:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbgERTo3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 15:44:29 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:26771 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728230AbgERTo2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 15:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589831067; x=1621367067;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=wxnhkrmgjXbFZjBhp2Jh1xtXIMosSoFaC85IUlH8TjM=;
  b=yWwVLyaeyYIB9B0RS8MFNcW0n9mkocm4Q0P35EwmJlRywMoQ0g0s4ul3
   D6Oses4GBOxD5HVKqGdvb29HV42Tbdo4M28Q1xx52hs1OACcAs4vgDH+N
   /XHdmgWFhf7+RBdE+3IS35VFh54WNjAcanXry3CCjNjGnkYRtmAKN0KyD
   91aoxMpiGNUp287R4R6fjJjlVLebfvISHjhvrzDVFwniZRKxijV/DPIRl
   EPG3jieUQXp6p5KJ5dcxucxx9bUS2MWE6ZiX+CvHpiFVmYtuVldVtz4l6
   mYCiBwFNGXOHrf6qO8+TEoeK6OFTTpVAQCcd6CFJevPw8wHrXBKZf4uu/
   Q==;
IronPort-SDR: r8hrXvhyK3C3fi+2a7q4FTOBFtDKrKx6VGxTQkjSEAeEDUCAJCqQfp4/WRgPgMvbwakgtEdoVa
 qxie3UXw0rJhQxXJZ2gseB8Xgtg6nlvYthbHEuPDAmLcfO9XzcR0wvnN/wiwWB2Dr/qmnAdPat
 XglkI7TMmFT3ahQbvh08sbB5IgmYFj70IHpT6rCwTVrniolui6TA+/b60x8Zmccq/EWjdyJFak
 54Ef/3TxbsCnpmnlRBq0fm4Axttz4PCDx4hod6zo5MOwwaJZoFl4lKQQC0Chx5z/vOPAVO0lTW
 qO8=
X-IronPort-AV: E=Sophos;i="5.73,407,1583218800"; 
   d="scan'208";a="77076220"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 May 2020 12:44:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 18 May 2020 12:44:28 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 18 May 2020 12:44:26 -0700
References: <20200513141134.25819-1-lars.povlsen@microchip.com> <20200513141134.25819-3-lars.povlsen@microchip.com> <fb104436-69c1-3f5a-85d9-af0aee35547f@infradead.org>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Randy Dunlap <rdunlap@infradead.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        SoC Team <soc@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 2/3] pinctrl: mchp-sgpio: Add pinctrl driver for Microsemi Serial GPIO
In-Reply-To: <fb104436-69c1-3f5a-85d9-af0aee35547f@infradead.org>
Date:   Mon, 18 May 2020 21:44:23 +0200
Message-ID: <87r1vhni3s.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Randy Dunlap writes:

> On 5/13/20 7:11 AM, Lars Povlsen wrote:
>> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
>> index 834c59950d1cf..2b0e9021fd7e0 100644
>> --- a/drivers/pinctrl/Kconfig
>> +++ b/drivers/pinctrl/Kconfig
>> @@ -396,6 +396,23 @@ config PINCTRL_OCELOT
>>       select OF_GPIO
>>       select REGMAP_MMIO
>>
>> +config PINCTRL_MSCC_SGPIO
>> +     bool "Pinctrl driver for Microsemi Serial GPIO"
>> +     depends on OF
>> +     depends on HAS_IOMEM
>> +     select GPIOLIB
>> +     select GENERIC_PINCONF
>> +     select GENERIC_PINCTRL_GROUPS
>> +     select GENERIC_PINMUX_FUNCTIONS
>> +     select OF_GPIO
>> +     help
>> +          Support for the VCoreIII SoC serial GPIO device. By using a
>
> Line above should be indented with one tab + 2 spaces...
> like the lines below.
>

Well spotted...

>> +       serial interface, the SIO controller significantly extends
>> +       the number of available GPIOs with a minimum number of
>> +       additional pins on the device. The primary purpose of the
>> +       SIO controller is to connect control signals from SFP
>> +       modules and to act as an LED controller.
>> +
>
> thanks.

Thank you for your comments.

-- 
Lars Povlsen,
Microchip

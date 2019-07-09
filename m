Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6FEC62FE6
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 07:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbfGIFZl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jul 2019 01:25:41 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:43871 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfGIFZl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jul 2019 01:25:41 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hkidE-0007iy-MU from Harish_Kandiga@mentor.com ; Mon, 08 Jul 2019 22:25:36 -0700
Received: from [10.0.3.15] (137.202.0.90) by svr-ies-mbx-01.mgc.mentorg.com
 (139.181.222.1) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Tue, 9 Jul
 2019 06:25:31 +0100
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
To:     Rob Herring <robh+dt@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
 <CAL_Jsq+-xWLkvku-nLmJnFvbuS=dSD=9dG=GS4uBUqL50tdcDg@mail.gmail.com>
From:   Harish Jenny K N <harish_kandiga@mentor.com>
Message-ID: <06c95f15-d577-e43d-e046-ee222f86c406@mentor.com>
Date:   Tue, 9 Jul 2019 10:55:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+-xWLkvku-nLmJnFvbuS=dSD=9dG=GS4uBUqL50tdcDg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,


On 09/07/19 4:06 AM, Rob Herring wrote:
> On Fri, Jun 28, 2019 at 3:31 AM Harish Jenny K N
> <harish_kandiga@mentor.com> wrote:
>> Document the device tree binding for the inverter gpio
>> controller to configure the polarity of the gpio pins
>> used by the consumers.
>>
>> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
>> ---
>>  .../devicetree/bindings/gpio/gpio-inverter.txt     | 29 ++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-inverter.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-inverter.txt b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
>> new file mode 100644
>> index 0000000..8bb6b2e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
>> @@ -0,0 +1,29 @@
>> +GPIO-INVERTER
>> +======
>> +This binding defines the gpio-inverter. The gpio-inverter is a driver that
>> +allows to properly describe the gpio polarities on the hardware.
> I don't understand. Please explain this in terms of the hardware, not a driver.


gpio inverters can be used on different hardware to alter the polarity of gpio chips.
The polarity of pins can change from hardware to hardware with the use of inverters.
This device tree binding models gpio inverters in the device tree to properly describe the hardware.

Please let me know if this is enough and needs to be updated in the documentation patch.


I am sorry I did not include device tree list in the original discussion ( i.e first version of the patch
https://www.spinics.net/lists/linux-gpio/msg39681.html).


Thanks.


Best Regards,

Harish Jenny K N



Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 237E4455B6D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 13:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344624AbhKRMYP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 07:24:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344616AbhKRMXa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 07:23:30 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 326CEC061767
        for <linux-gpio@vger.kernel.org>; Thu, 18 Nov 2021 04:20:30 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id y26so24994269lfa.11
        for <linux-gpio@vger.kernel.org>; Thu, 18 Nov 2021 04:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibbo.com; s=google;
        h=subject:to:references:cc:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=zAWwsFO8j7y6AlgFPfx815dEezRcNwOx2V1LdD0AChI=;
        b=JQc2fNRH0/5gcLQE7HFGll9HLuq9GI4uYb6ozCCqOhDtM1RJ1EjvmGqPb2GGPU+jtc
         vMafNvjhvDo9WzH16BLxHsjc3BuHvbAfE8fosHFal/dh86ZR3JjlT3eVD6atFLM+zr1d
         X+ubNZfL3Og/O+j1PkXhQ2pX5hqz7VGHjcYZ36pIqozb5ZC4gUt3i7Yr87Aed8+TOaIu
         iHWL6OdIck5Mi/jUg3qcVj3fR1/t7DSY3bNuOfBLooGB0/VmvOou9sMnuIjONhThARPN
         cfyri/oD7pX6wzl4iB52A6x/YAR/7DOF4V0C+StXteykDi8QSReRhgpSpwbPfdpehQkR
         tfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=zAWwsFO8j7y6AlgFPfx815dEezRcNwOx2V1LdD0AChI=;
        b=Hw19cfWl2W05Do7s7MBN1S0ziX4o+SvDpjWvZd1pCy3Ji24ZeZGio/0diS9hUq8MFK
         tVotv0NRi0GcD9+lAdetiYJOGW2A4ftMfi1sjrPaeyzr4C1//xzco8U+QpJj86/QQd6B
         3eGVw2ZqEwf0EpKAC0q9nci6EesKMfsLtZJikNrd4N/CLLZWFPJpqM1rMjg6FwjSWPbI
         SJeIAwVRpWtArsGBabo/taujeO64eFzPOWSfiAfHpeI5RMdwskt+QAtyZEMfGORxhsVn
         iwwZ0EvHdYFtj5kazhe/T58epkQxys2J6If7pHPirlQi3uXCN+YBtva/OeQev0+BmYQ6
         OMhA==
X-Gm-Message-State: AOAM531D4VWIozAviShBPk3wo0JmtfwDhNyBViYQzcEJhvT6SKLD1fAw
        lkHSqU9TXNCpxMjMA2hnpvDbZQ==
X-Google-Smtp-Source: ABdhPJyB5nP/Z8/u0d5p3sI90Ix7Td7kz1PgcxjR35x7aJplOKnjjMTABDXPmo8WxKLc8u9Ggx2n7A==
X-Received: by 2002:a05:651c:a0f:: with SMTP id k15mr17198015ljq.298.1637238028473;
        Thu, 18 Nov 2021 04:20:28 -0800 (PST)
Received: from localhost.localdomain ([5.167.98.73])
        by smtp.gmail.com with ESMTPSA id br24sm293670lfb.104.2021.11.18.04.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 04:20:28 -0800 (PST)
Subject: Re: [PATCH 3/3] devicetree: bindings: pinctrl: Add bindings doc for
 Sunplus SP7021.
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wells Lu <wellslutw@gmail.com>
References: <1635324926-22319-1-git-send-email-wells.lu@sunplus.com>
 <1635324926-22319-4-git-send-email-wells.lu@sunplus.com>
 <CACRpkdaqAtP0rykP2Q25wc+t1Uk2xXYFvcrCdBXyWVRnHNGtGA@mail.gmail.com>
 <f315d79da3e742b4a4ec0131d6035046@sphcmbx02.sunplus.com.tw>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org, qinjian@cqplus1.com
From:   Dvorkin Dmitry <dvorkin@tibbo.com>
Organization: Tibbo Technology Inc.
Message-ID: <b88855af-bdbe-2894-f7ac-c1ea9dba87e4@tibbo.com>
Date:   Thu, 18 Nov 2021 15:20:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f315d79da3e742b4a4ec0131d6035046@sphcmbx02.sunplus.com.tw>
Content-Type: multipart/mixed;
 boundary="------------2B6DCA0BF58703AB4283FD5F"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a multi-part message in MIME format.
--------------2B6DCA0BF58703AB4283FD5F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linus!

I am the person who wrote this driver. Let me answer to your questions...

-----Original Message-----
>> From: Linus Walleij <linus.walleij@linaro.org>
>> Sent: Tuesday, November 9, 2021 12:00 PM
>> To: Wells Lu <wellslutw@gmail.com>
>> Cc: linux-gpio@vger.kernel.org; linux-kernel@vger.kernel.org;
>> robh+dt@kernel.org; devicetree@vger.kernel.org; qinjian@cqplus1.com;
>> dvorkin@tibbo.com; Wells Lu 呂芳騰 <wells.lu@sunplus.com>
>> Subject: Re: [PATCH 3/3] devicetree: bindings: pinctrl: Add bindings doc for
>> Sunplus SP7021.
>>
>>
>>> +        zero_func:
>>> +          description: |
>>> +            Disabled pins which are not used by pinctrl node's client
>> device.
>>> +          $ref: /schemas/types.yaml#/definitions/uint32-array
>> I have never seen this before. Can't you just use pin control hogs for this so the
>> pin controller just take care of these pins?

zero_func is required.

The bootloader may have different device tree (I am using general sp7021 
DTS in my u-boot setup, for example), while the kernel DTS may be 
changed between boots and specifies it more precisely - it is configured 
by user. So u-boot DTB and kernel DTB may be different -> result is that 
some pins may be muxed wrongly after u-boot starts kernel. Or even in 
pre-u-boot stage (we have the bootloader that starts u-boot, called 
XBoot). This XBoot also do some muxing. So we need this feature to get 
rid of possible unneded muxes done before kernel has been started.

There is the "group of pins" functions and individual pins that may 
intersect.

You may have "group of pins", say, emmc preconfigured before kernel 
started (in general DTS for u-boot) and you may want to have the pin 
from emmc group to be muxed as, say, SD card detect. You mux it in 
kernel DTS as GPIO, it will be in correct GPIO state, configured 
correctly, but while emmc group is enabled (nobody disabled it in kernel 
DTS!) the pin will belong to emmc function (preset group) and will not 
be functional.

I invented zero_func while has been debugging the problem like "why my 
Eth is not working when all pins are configured correctly and muxed to 
Eth". I spend some time to find that the pin I muxed to Eth has been 
muxed to SPI_FLASH GROUP in very early stage (in ROM boot). And I have 
no way to cleanup this mux group easily.

zero_func is the way to easily guarantee that you will successfully and 
correctly mux some pins / functions on kernel load even if somebody 
muxed other pins to this functions before kernel.

If I'd implement "automatic" mux cleanup before muxing some pin, the 
code would be more complex. I would like to keep code as simple as I can 
and give better control to user.


>>
>>> +      allOf:
>>> +        - if:
>>> +            properties:
>>> +              function:
>>> +                enum:
>>> +                  - SPI_FLASH
>>> +          then:
>>> +            properties:
>>> +              groups:
>>> +                enum:
>>> +                  - SPI_FLASH1
>>> +                  - SPI_FLASH2
>>> +        - if:
>>> +            properties:
>>> +              function:
>>> +                enum:
>>> +                  - SPI_FLASH_4BIT
>>> +          then:
>>> +            properties:
>>> +              groups:
>>> +                enum:
>>> +                  - SPI_FLASH_4BIT1
>>> +                  - SPI_FLASH_4BIT2
>>> +        - if:
>>> +            properties:
>>> +              function:
>>> +                enum:
>>> +                  - HDMI_TX
>>> +          then:
>>> +            properties:
>>> +              groups:
>>> +                enum:
>>> +                  - HDMI_TX1
>>> +                  - HDMI_TX2
>>> +                  - HDMI_TX3
>>> +        - if:
>>> +            properties:
>>> +              function:
>>> +                enum:
>>> +                  - LCDIF
>>> +          then:
>>> +            properties:
>>> +              groups:
>>> +                enum:
>>> +                  - LCDIF
>>>
>>> This looks complex to me, I need feedback from bindings people on this.

sp7021 supports two types of muxes:

1) group muxing (1-N sets of predefined pins for some function)

2) individual pin muxing

Some functions may be muxed only in group, like SPI_FLASH or HDMI.

That's why we have

pins = <...>;

and

function = <funcname>;

group = <funcsubname-group>;

second case could be cuted to

function = <funcsubname-group> only;

But I think, the syntax of a pair {function,group} fits SoC logic 
better. Especially if customer is reading possible muxes table for the chip.


>>>
>>> +        pins_uart0: pins_uart0 {
>>> +            function = "UA0";
>>> +            groups = "UA0";
>>> +        };
>>> +
>>> +        pins_uart1: pins_uart1 {
>>> +            pins = <
>>> +
>> SPPCTL_IOPAD(11,SPPCTL_PCTL_G_PMUX,MUXF_UA1_TX,0)
>>> +
>> SPPCTL_IOPAD(10,SPPCTL_PCTL_G_PMUX,MUXF_UA1_RX,0)
>>> +
>> SPPCTL_IOPAD(7,SPPCTL_PCTL_G_GPIO,0,SPPCTL_PCTL_L_OUT)
>>> +            >;
>>> +        };
>> This first looks like two ways to do the same thing?
>> UART0 uses strings for group + function and uart1 control individual pins.
>>
>> Is it possible to just do it one way?
>>
>> I think the pins = <...> scheme includes also multiplexing settings and then it
>> should be named pinmux = <...>:
No. Sorry. It is two different way of supported two different types of 
muxing, described above.
>>
>> Please read
>> Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
>> closely.
>>
>> Yours,
>> Linus Walleij

--------------2B6DCA0BF58703AB4283FD5F
Content-Type: text/x-vcard; charset=utf-8;
 name="dvorkin.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dvorkin.vcf"

BEGIN:VCARD
VERSION:4.0
EMAIL;PREF=1:dvorkin@tibbo.com
EMAIL:dvorkindmitry@gmail.com
FN:Dmitry Dvorkin
NICKNAME:dv
ORG:Tibbo Technology Inc.;
TITLE:Embedded Linux Architect
N:Dvorkin;Dmitry;;;
ADR:;;9F-3\, No.31, Lane 169, Kang-Ning St., Hsi-Chih;New Taipei City;;2218
 0;Taiwan
TEL;VALUE=TEXT:+79190546388
URL;VALUE=URL:https://tibbo.com/
UID:1c58210f-ac8c-4337-b391-0bde146d2d83
END:VCARD

--------------2B6DCA0BF58703AB4283FD5F--

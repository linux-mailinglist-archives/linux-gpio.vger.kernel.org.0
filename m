Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2DA810AED8
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 12:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfK0LnN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 06:43:13 -0500
Received: from mx07-00252a01.pphosted.com ([62.209.51.214]:34360 "EHLO
        mx07-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726204AbfK0LnN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Nov 2019 06:43:13 -0500
X-Greylist: delayed 1374 seconds by postgrey-1.27 at vger.kernel.org; Wed, 27 Nov 2019 06:43:11 EST
Received: from pps.filterd (m0102628.ppops.net [127.0.0.1])
        by mx07-00252a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xARBDleu016837
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2019 11:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raspberrypi.org; h=to : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp;
 bh=HWa4Ar68jue3ZLWqjhAUXTG8w/wCmDFzSDy5Ki6zBr4=;
 b=XHYFv6CQM0C2vG+BYJit3EtvUxyvL19iwBqIjweBlnK0ht0wQjgotpDcWlwPjwoJ/0G8
 bb4vGIrGfC4ZFA8oL+b2Yb348Lyxp4F0u9DtWH84QlxVcnniaiEefdV5YLqOWRQzcJ6f
 MH2l5FDxwhoNjlR4yiMVmJpmErRvAfw4iWcDOCuoTLJ9A3/Ulol1UxXSD11d8vBuxEmY
 VyMCTxQARb8O27uHVa0mnSdnr1nhupaAyrIFaQ1OVBYZASgDunzsdgmEvusqcnTJZ7zO
 gr1hNeagEbs5PLRC4cGAVEblW5Itnn7eM7riCtqlwpUdzzGPz+V0oTETAGWlk669/13J jA== 
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        by mx07-00252a01.pphosted.com with ESMTP id 2whd1tgbug-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2019 11:20:15 +0000
Received: by mail-wm1-f71.google.com with SMTP id o135so2377085wme.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2019 03:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.org; s=google;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=HWa4Ar68jue3ZLWqjhAUXTG8w/wCmDFzSDy5Ki6zBr4=;
        b=b4SmBPKr071hqep58I6CGdjqFmHr7d+Zb3xnPUMMRxPy8NqCP6sA2HJV6QNIRwlTHo
         hSBFSlkxhEK0AxulPEAdFfrTCql353UsSPf+l1G9P3qRaZMJXe3UrcQEPmD1mSVNP9BX
         UAVt8piw38dSQkkxGW7wMuLfgqTDmwvaNSdjOsJbbrtI5YDbhSVbdeGuKooaKsIo5WD+
         pCD+nnpTITtciBX60qn65N0ngTpxdSv3nmNOc4nZa3PzmeOVQVEq2Ch7E9Ax3uBfTRVM
         T7gvNhbt/egEybRUtEH158f1O8wfxXWC4Ulciib1AHSWmpGLZAm5qA9e46s2qtSXc4Or
         nkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=HWa4Ar68jue3ZLWqjhAUXTG8w/wCmDFzSDy5Ki6zBr4=;
        b=qtQLEwk+Ctv0iaIzGdxafrm50YNIVva96TDaR9lvyqZvd8dF5+hLdbgu65SWDOpg9O
         2t9pL9mwtGwTFanm8eNl6RJCRklUCgONT1+2aR208z2v28V7trmoeGkbT2wFEV/HK55a
         1eZsI5z40XfDil32uhJFlBSIAWpqVIGzQ3luParHkON4ukITY/yrEgTKQPMUYg4ZHeEC
         gb8W5DmVm14RtepxgpSKjnd4z18XGr+knQN0JzvbjgPqLyJQrnL7b0ucCWLr+MxRK2EO
         Xbu4Y/Eu3aVX3OEi8ELFgUWOYNtungZ10NRe2UmYcL/6MCg45rdwY5kxqmX16q4PagKd
         EP2Q==
X-Gm-Message-State: APjAAAXryplOlX+whQ/Q+T8MNYzAHozQ9ahvT3iiDIwtFclhPnPfdiql
        4jA/SiUu3DRyvAVLn6Kn54IAEtC0yU1aM3trYDWr3LWqq10Kl6x5oi803ub0xkfE5v1tD0A0rPS
        7bT9Jv0XQ2WyZwc4/LVXItw==
X-Received: by 2002:adf:c611:: with SMTP id n17mr43255873wrg.317.1574853614137;
        Wed, 27 Nov 2019 03:20:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqxPNN4T4pLqiPWydSAPPFrH4DJqM4Gopa3hk+LasAOswaeAHhXFy+AsGhFJVFJraQtiJdUgZg==
X-Received: by 2002:adf:c611:: with SMTP id n17mr43255833wrg.317.1574853613666;
        Wed, 27 Nov 2019 03:20:13 -0800 (PST)
Received: from ?IPv6:2a00:1098:3142:14:d8e5:c518:f6be:1405? ([2a00:1098:3142:14:d8e5:c518:f6be:1405])
        by smtp.gmail.com with ESMTPSA id u16sm18674157wrr.65.2019.11.27.03.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2019 03:20:13 -0800 (PST)
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
From:   Phil Elwell <phil@raspberrypi.org>
Subject: Multiple SPI MCP23S17s sharing a CS line
Message-ID: <d8f95334-789e-995b-9abf-7bb15abb1daa@raspberrypi.org>
Date:   Wed, 27 Nov 2019 11:20:12 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

We have a user asking for help to construct a Device Tree overlay to use
the GPIOs exported by multiple MCP23S17s sharing an SPI Chip Select 
line. This is a special feature of the MCP devices whereby the SPI bus
is treated rather like an I2C bus with each device assigned a unique
address. His problem is in constructing gpiospecs to refer to all of the
GPIOs.

The mcp23s08 driver claims to support this feature, and there is a DT
property ("microchip,spi-present-mask") to declare which addresses are
used buy the devices. I've spent an hour or so looking at the driver 
code and crawling through the kernel GPIO infrastructure, and I don't 
think it's possible. Here's my logic:

1. Although all devices that are found are presented as a single SPI 
device, they are each registered as independent gpio_chips.

2. A gpio_chip has (amongst other things) a pointer to is Device Tree 
node, a number of GPIOs, and a function that translates from the 
"gpiospec" descriptors found in the device tree to an index into the 
GPIOs exposed by the device. Note that it doesn't include the base of a 
range - all gpio_chips have GPIOs indexed from 0.

3. The mcp23s08 doesn't specify a translation function, so it inherits 
the default of_gpio_simple_xlate that checks that the first parameter is 
less than the number of GPIOs the device supports, and returns it.

4. When another DT node refers to a GPIO, it does so using a gpiospec. 
This is passed to gpiochip_find, which uses 
of_gpiochip_match_node_and_xlate to filter through all the registered 
GPIO controllers to find one which:

i) has a DT node which matches the first cell (e.g. "&gpio"),
ii) has a translation function, and
iii) the translation function succeeds.

5. Continuing point 2, all the MCP devices that share an SPI CS/CE 
inherit the same DT node, which means they will all pass test i). Test 
ii) is trivially passed by all of the devices. Since they all have the 
same translation function (of_gpiochip_match_node_and_xlate), and they 
are all given the same gpiospec to translate, and you aren't meant to 
mix different size variants, the sharing devices will also either all 
pass or all fail the test iii).

Therefore I think it's impossible to construct gpiospecs to refer to all 
of the GPIOs exported by MCP23S17s in this configuration. Please explain
where I've gone wrong.

Thanks,

Phil Elwell

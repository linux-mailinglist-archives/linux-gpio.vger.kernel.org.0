Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D90A2885E5
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 11:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733078AbgJIJYR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 05:24:17 -0400
Received: from first.geanix.com ([116.203.34.67]:56156 "EHLO first.geanix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731262AbgJIJYQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Oct 2020 05:24:16 -0400
X-Greylist: delayed 496 seconds by postgrey-1.27 at vger.kernel.org; Fri, 09 Oct 2020 05:24:15 EDT
Received: from [192.168.8.20] (unknown [85.184.138.169])
        by first.geanix.com (Postfix) with ESMTPSA id 84094F25C16;
        Fri,  9 Oct 2020 09:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
        t=1602234957; bh=P+1tW+LNK0Aleerf9xLn1TMIWjW2HPslR3vBsUjKGgQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=gJopEN5+xGiVZq/h4xMBr9fcSmIbxYaYs9F66npzla8dWtlRo2oDRBDVNariA9Ey4
         Zv8aI7giGvmoXb6l8sPIYIV9eQYXnSNC70koUfl1vTLueItgOMravszwvRvutasweN
         Oo9DV4PdereicisO28eVry0N70B1U1widQ7d1YMpllgtktQCldKxdHE4tnSdnpQVIv
         +YLfpgF4mQIvRijf0MCQCIRSh+55AqK1L893KCLahAc8u6fMmkJpjI/y78JrjgQ0ou
         nwkLpOyr3SKj4Vb0Kv0BcVhPXMsrXORVNt3vg+CRiQP11d5PU/0ECDfMYkKif98ktV
         CGy/E5bdGhevA==
Subject: Re: Re: [PATCH v1 1/9] pinctrl: mcp23s08: Get rid of legacy platform
 data
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdY6_EChELrKGtcvsBvDqEQ9QD1=+PWWZuyBZV_CpLvUyA@mail.gmail.com>
From:   =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <c82ef50e-8f5c-39cd-6032-b4797a49e0e1@geanix.com>
Date:   Fri, 9 Oct 2020 11:15:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdY6_EChELrKGtcvsBvDqEQ9QD1=+PWWZuyBZV_CpLvUyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=4.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        URIBL_BLOCKED autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on ff3d05386fc5
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On 16/04/2020 12.35, Linus Walleij wrote:
> On Tue, Apr 7, 2020 at 7:38 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
>> Platform data is a legacy interface to supply device properties
>> to the driver. In this case we even don't have in-kernel users
>> for it. Just remove it for good.
>>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> All 9 patches applied.

This series caused probing of my PiFace2 to fail:

 > [    1.019604] mcp23s08: probe of spi0.0 failed with error -22

I tried to bisect, but some of the commits failed to compile:

 > drivers/pinctrl/pinctrl-mcp23s08.c:959:39: error: 
'mcp23s08_spi_of_match' undeclared (first use in this function); did you 
mean 'mcp23s08_i2c_of_match'?

 >  959 |  match = of_match_device(of_match_ptr(mcp23s08_spi_of_match), 
&spi->dev);


However, bisecting did narrow it down to a few commits:

 > * 1ac30db20be2 - (refs/bisect/bad) pinctrl: mcp23s08: Make use of 
device properties (6 months ago) <Andy Shevchenko>

 > * 88af89b52a1b - 
(refs/bisect/skip-88af89b52a1b7493f1e5ec165856b4c6767cf654) pinctrl: 
mcp23s08: Propagate error code from device_property_read_u32() (6 months 
ago) <Andy Shevchenko>

 > * 0874758ecb2b - 
(refs/bisect/skip-0874758ecb2b3faa200a86dda45dbc29335f883e) pinctrl: 
mcp23s08: Refactor mcp23s08_spi_regmap_init() (6 months ago) <Andy 
Shevchenko>

 > * 0521701c8d10 - 
(refs/bisect/skip-0521701c8d10f832a401cc7ebfa92bb73782d792) pinctrl: 
mcp23s08: Drop unused parameter in mcp23s08_probe_one() (6 months ago) 
<Andy Shevchenko>

 > * d3da29b628a8 - 
(refs/bisect/skip-d3da29b628a86777d25c741c44b8af35f10020a0) pinctrl: 
mcp23s08: Consolidate SPI and I²C code (6 months ago) <Andy Shevchenko>

 > * 84d02e785d34 - 
(refs/bisect/good-84d02e785d34be9363a825d696cca1f07fac2634) pinctrl: 
mcp23s08: Deduplicate IRQ chip filling (6 months ago) <Andy Shevchenko>


I'm using the rpi3 device tree (broadcom/bcm2837-rpi-3-b.dtb) overlayed 
with a configuration for the mcp23s08:

/dts-v1/;

/plugin/;



/ {

         fragment@0 {

                 target-path = "/soc/spi@7e204000";



                 __overlay__ {

                         pinctrl-names = "default";

                         pinctrl-0 = <&spi0_gpio7>;

                         #address-cells = <1>;

                         #size-cells = <0>;

                         status = "okay";



                         gpio@0 {

                                 compatible = "microchip,mcp23s17";

                                 reg = <0>;

                                 gpio-controller;

                                 #gpio-cells = <2>;

                                 microchip,spi-present-mask = <0x01>;

                                 spi-max-frequency = <1000000>;

                         };

                 };

         };

};

I looked around the code a bit, and tried to compare it with v5.7, but 
didn't see any obvious candidates.

// Martin

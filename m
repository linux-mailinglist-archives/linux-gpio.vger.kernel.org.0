Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 332EE63B234
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Nov 2022 20:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232828AbiK1TZi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 14:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbiK1TZg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 14:25:36 -0500
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730E526AF3;
        Mon, 28 Nov 2022 11:25:35 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2ASJPCBe029215;
        Mon, 28 Nov 2022 13:25:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1669663512;
        bh=MmlPSR7nZwn4QYm46rRfgKRTrwJeh/kdGb4dtj4UxYw=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=voipzgXAURJe11BzmUnNi9lS6mSC9/P1iyivt5AGXHEOhnTj16FLsSmEsRZPQeKAz
         KkA7qiaTfKBRUAeSsvs0R6epAR9/k8bTnNAuFKwdyEuMkegxkn8Jg+vijfY0M2Erht
         AoG2yhccKONRPxg58Xbb/WRx2/LeUn5NVcZTk72M=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2ASJPCeb093111
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 28 Nov 2022 13:25:12 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 28
 Nov 2022 13:25:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 28 Nov 2022 13:25:11 -0600
Received: from [10.250.232.104] (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2ASJP7eC033643;
        Mon, 28 Nov 2022 13:25:08 -0600
Message-ID: <94ac28e5-2920-c6d0-2659-a0626540a91e@ti.com>
Date:   Tue, 29 Nov 2022 00:55:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 0/4] mfd: add tps6594 support for Jacinto platforms
To:     Matt Ranostay <mranostay@ti.com>, <michael@walle.cc>,
        <vigneshr@ti.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <a.zummo@towertech.it>,
        <linus.walleij@linaro.org>, <lee@kernel.org>, <brgl@bgdev.pl>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>
References: <20221123053512.1195309-1-mranostay@ti.com>
Content-Language: en-US
From:   "J, KEERTHY" <j-keerthy@ti.com>
In-Reply-To: <20221123053512.1195309-1-mranostay@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/23/2022 11:05 AM, Matt Ranostay wrote:
> This patchset series adds support for the TPS6594 PMIC along with
> initial support for its RTC + GPIO interface, and poweroff sequence.

For the series:

Reviewed-by: Keerthy <j-keerthy@ti.com>

- Keerthy
> 
> Changes from v1:
> * Corrected devicetree documentation issues found with dt-schema
> * Changed MFD references to PMIC reflecting the more valid use of driver
> * Cleaning up variable naming and ordering within functions
> * Adding gpio + regulator cells for upcoming driver support
> * Switching from .probe to .probe_new API
> * Revising comments within drivers to be more concise
> * Adding device tree nodes for j721s2 and j721e platforms
> 
> Changes from v2:
> * Adding gpio-tps6594x driver support
> * Enabling gpio cell in MFD driver
> 
> Changes from v3:
> * Refactoring gpio driver to use regmap gpio helpers
> * Changing rtc driver to use more of device resource management
> * Minor code changes related to error messages that aren't useful
>    being dropped
> * Dropped wildcard in device-tree compatible, and i2c device id
> * Dropped device tree changes from the series; since these should
>    be in their own series later
> 
> Changes from v4:
> * Corrected commit messages for device tree documentation
> * Added TPS6954 datasheet PDF to devicetree documentation
> * Renamed all references, including filenames + configuration options,
>    from tps6594x to tps6594 dropping the unneeded wildcard
> 
> Keerthy (2):
>    mfd: tps6594: Add support for TPS6594 PMIC devices
>    rtc: rtc-tps6594: Add support for TPS6594 PMIC RTC
> 
> Matt Ranostay (2):
>    dt-bindings: mfd: ti,tps6594: add TPS6594 PMIC support
>    gpio: gpio-tps6594: add GPIO support for TPS6594 PMIC
> 
>   .../devicetree/bindings/mfd/ti,tps6594.yaml   |  69 ++++++++
>   drivers/gpio/Kconfig                          |   9 +
>   drivers/gpio/Makefile                         |   1 +
>   drivers/gpio/gpio-tps6594.c                   |  78 +++++++++
>   drivers/mfd/Kconfig                           |  14 ++
>   drivers/mfd/Makefile                          |   1 +
>   drivers/mfd/tps6594.c                         | 113 +++++++++++++
>   drivers/rtc/Kconfig                           |  10 ++
>   drivers/rtc/Makefile                          |   1 +
>   drivers/rtc/rtc-tps6594.c                     | 155 ++++++++++++++++++
>   include/linux/mfd/tps6594.h                   |  88 ++++++++++
>   11 files changed, 539 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
>   create mode 100644 drivers/gpio/gpio-tps6594.c
>   create mode 100644 drivers/mfd/tps6594.c
>   create mode 100644 drivers/rtc/rtc-tps6594.c
>   create mode 100644 include/linux/mfd/tps6594.h
> 

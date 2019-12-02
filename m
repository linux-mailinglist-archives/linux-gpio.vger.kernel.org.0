Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9C6210EAFC
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 14:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfLBNoO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 2 Dec 2019 08:44:14 -0500
Received: from mail5.windriver.com ([192.103.53.11]:41000 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727362AbfLBNoO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Dec 2019 08:44:14 -0500
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
        by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xB2DiAG1003957
        (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
        Mon, 2 Dec 2019 05:44:10 -0800
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.163]) by
 ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0468.000; Mon, 2
 Dec 2019 05:44:04 -0800
From:   "Stanimir, Vasile-Laurentiu" 
        <Vasile-Laurentiu.Stanimir@windriver.com>
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
Subject: RE: [PATCH] gpiolib-acpi: Set gpiod flags for ACPI GPIO resources
 based on pullup and polarity
Thread-Topic: [PATCH] gpiolib-acpi: Set gpiod flags for ACPI GPIO resources
 based on pullup and polarity
Thread-Index: AQHVqRFN5QLGkUkZfkSHG06QZ3JPWaem2RjM
Date:   Mon, 2 Dec 2019 13:44:04 +0000
Message-ID: <D4218E93E3D74741B4028993B2A8DBE0534BF86E@ALA-MBD.corp.ad.wrs.com>
References: <D4218E93E3D74741B4028993B2A8DBE0534BF84B@ALA-MBD.corp.ad.wrs.com>,<20191202130553.GG32742@smile.fi.intel.com>
In-Reply-To: <20191202130553.GG32742@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.14.212]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

________________________________________
From: andriy.shevchenko@linux.intel.com [andriy.shevchenko@linux.intel.com]
Sent: Monday, December 02, 2019 3:05 PM
To: Stanimir, Vasile-Laurentiu
Cc: linux-gpio@vger.kernel.org; linus.walleij@linaro.org; mika.westerberg@linux.intel.com
Subject: Re: [PATCH] gpiolib-acpi: Set gpiod flags for ACPI GPIO resources based on pullup and polarity

On Mon, Dec 02, 2019 at 12:36:47PM +0000, Stanimir, Vasile-Laurentiu wrote:
> From f8093f2c73c636b75fcf4dee4178af0e24c2f878 Mon Sep 17 00:00:00 2001
> From: Vasile-Laurentiu Stanimir <vasile-laurentiu.stanimir@windriver.com>
> Date: Mon, 2 Dec 2019 14:20:11 +0200
> Subject: [PATCH] gpiolib-acpi: Set gpiod flags for ACPI GPIO resources based
>  on pullup and polarity
>
> ACPI GPIO resources don't contain an initial value for the
> GPIO. Therefore instead of deducting its value based on pullup field
> we should deduce that value from the polarity and the pull field.
> Typical scenario is when ACPI is defined in acpi-table and its polarity
> is defined as ACTIVE-LOW in the following call:
>
> acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
>   acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
>
> it will return GPIOD_OUT_HIGH if pull_up is set no matter if
> polarity is GPIO_ACTIVE_LOW, so it will return the current level instead
> of the logical level.

Thank you for the patch.

I have question in general. If we have Active Low polarity and Pull Down,
isn't it simple a bad ACPI table and rather quirk is needed here?

--
With Best Regards,
Andy Shevchenko


Hi, 

It may be, also it may be a bad hardware design but it is also a possible situation.

In our case here we have an FPGA whose pcie link is held in reset by BIOS during 
boot, the reset pin is active low, and its configuration is specified in the Acpi DSDT 
table. When Linux starts, our userspace driver shall load the FPGA, and the first 
step is to request all GPIO's needed to configure the pcie phy on the FPGA side; 
the pcie link reset should be held active while this configuration (loading of the 
Altera fpp image) is ongoing.
Now all active low pins have their initial value inverted by the kernel. This means 
that the pcie link reset is briefly released, which generates a pcie hot unplug event, 
which in turn delays start of a successful loading sequence, and so SW has to make 
a second reload attempt which will delay too much the normal boot sequence.

Sorry for giving you too much details which probability are not important but I only
wanted to emphasise that it may be a real situation whether or not it is a good
design.

Regards,
 vls

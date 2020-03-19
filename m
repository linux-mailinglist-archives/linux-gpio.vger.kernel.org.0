Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4350318BD6A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 18:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgCSREz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 13:04:55 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8860 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbgCSREz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 13:04:55 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e73a5d40000>; Thu, 19 Mar 2020 10:03:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 19 Mar 2020 10:04:54 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 19 Mar 2020 10:04:54 -0700
Received: from [10.25.77.145] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Mar
 2020 17:04:52 +0000
Subject: Re: [PATCH 0/9] pinctrl: tegra: Support SFIO/GPIO programming
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Jon Hunter <jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <99368d3c-0a98-eb80-06a9-4deef402ce87@nvidia.com>
Date:   Thu, 19 Mar 2020 22:34:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319122737.3063291-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584637396; bh=1+/Vk2wvwX9wNXOyKCwTgEMU0/Rgmu/1lDP4sLw+c64=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=iDjP5VXGK19W+4ZLqUxF3SYDC/0zyH6UaY96FY3b94KlW68AbtRkByPmjs3BwNZx6
         DOQ/UDeDVC9VpLOMoDiSMfoh+i5mA/w0dPmi5Kbta9SzQLiyfJQ+sHpwIRXIFO0WFr
         C9llfhtqowgzdqRQ10KjAW7rbpdFrO5zlJw8BrF5a18ZeAhA8wD5TyG4BAq8o1pcq4
         xvX9spkEwg8wL4mY5nuQs3QDuqrs8eSGDN95h6qfH23PzGzaABdKVXgJPN5LNB0Ln1
         AbY3ML21RYVQQ4TFCNQo3EN2pkZO93kvEp8oKWkIOMcdSCkDMsL/rzw5SJ8hAv1/81
         R9CZ5xAEKfVKw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/19/2020 5:57 PM, Thierry Reding wrote:
> External email: Use caution opening links or attachments
> 
> 
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> NVIDIA Tegra186 and later have a bit in the pin controller that defines
> whether a pin is used in special function (SFIO) mode or in general
> purpose (GPIO) mode. On early Tegra SoC generations, this bit was part
> of the GPIO controller.
> 
> The pin configuration on Tegra186 and later (and partially on Tegra210)
> is typically static, so there is little need to reconfigure these pins.
> However, there's a special case on Tegra194 where the PCIe CLKREQ and
> RST pins for controller 5 may need to be reprogrammed in the kernel,
> depending on whether the controller runs in endpoint mode or in root
> port mode.
> 
> This series of patches establishes the mapping of these two pins to
> their GPIO equivalents and implements the code necessary to switch
> between SFIO and GPIO modes when the kernel requests or releases the
> GPIOs, respectively.
> 
> Thierry
> 
> Thierry Reding (9):
>    gpio: Support GPIO controllers without pin-ranges
>    gpio: tegra186: Add support for pin ranges
>    gpio: tegra186: Add Tegra194 pin ranges for GG.0 and GG.1
>    pinctrl: tegra: Fix whitespace issues for improved readability
>    pinctrl: tegra: Fix "Scmitt" -> "Schmitt" typo
>    pinctrl: tegra: Pass struct tegra_pmx for pin range check
>    pinctrl: tegra: Do not add default pin range on Tegra194
>    pinctrl: tegra: Renumber the GG.0 and GG.1 pins
>    pinctrl: tegra: Add SFIO/GPIO programming on Tegra194
> 
>   drivers/gpio/gpio-tegra186.c             | 64 ++++++++++++++++++++++++
>   drivers/gpio/gpiolib.c                   |  5 +-
>   drivers/pinctrl/tegra/pinctrl-tegra.c    | 52 +++++++++++++++++--
>   drivers/pinctrl/tegra/pinctrl-tegra.h    |  5 +-
>   drivers/pinctrl/tegra/pinctrl-tegra194.c | 47 +++++++++--------
>   5 files changed, 144 insertions(+), 29 deletions(-)
> 
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas@nvidia.com>

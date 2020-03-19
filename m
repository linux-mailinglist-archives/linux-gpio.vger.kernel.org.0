Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D52A18BD83
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 18:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgCSRG2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 13:06:28 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8979 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbgCSRG2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 13:06:28 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e73a6310000>; Thu, 19 Mar 2020 10:04:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 19 Mar 2020 10:06:27 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 19 Mar 2020 10:06:27 -0700
Received: from [10.25.77.145] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Mar
 2020 17:06:25 +0000
Subject: Re: [PATCH 3/9] gpio: tegra186: Add Tegra194 pin ranges for GG.0 and
 GG.1
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Jon Hunter <jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-4-thierry.reding@gmail.com>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <bbc13e00-d7e2-6233-fc6f-3708b7d1980b@nvidia.com>
Date:   Thu, 19 Mar 2020 22:36:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319122737.3063291-4-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584637489; bh=p4NCp9fjwmITb7uxGSRgBS1jL2/AEgWirjvXQsiX0n0=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=lyixsnpj5WWDj6+TOpB9W3jZyLYImCcBXM6fESDYEER4kouGVwSMlvYtiFPUp5MeJ
         ZmcQfodGOmsJoYnIfNp5Vktm0AOTQ+xnMAtFmTVypxjKsMhruzMsshVv1T1rYAURAp
         D8hl0Jmj6uGsEo+doZqrMn7eK77dafhomSERL9W7tqLay9DRowA0JcMSob9bHqHn4W
         3r6dw1c5yDor8ISCZgH784JpoImggKZvvXWKro6dDCl/27evKGy5Na3rJDdqPB7qlo
         /f82TnD/kh58MIL11aquBTdbEHIEhntvd8RZLJs5XQHxyA+SuBJU+sUdMcmqEINxCw
         12v9KF7RPbARQ==
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
> The GG.0 and GG.1 GPIOs serve as CLKREQ and RST pins, respectively, for
> PCIe controller 5 on Tegra194. When this controller is configured in
> endpoint mode, these pins need to be used as GPIOs by the PCIe endpoint
> driver. Typically the mode programming of these pins (GPIO vs. SFIO) is
> performed by early boot firmware to ensure that the configuration is
> consistent.
> 
> However, the GG.0 and GG.1 pins are part of a special power partition
> that is not enabled during early boot, and hence the early boot firmware
> cannot program these pins to be GPIOs (they are SFIO by default). Adding
> them as pin ranges for the pin controller allows the pin controller to
> be involved when these pins are requested as GPIOs and allows the proper
> programming to take place.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/gpio/gpio-tegra186.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 1086c1fcaf49..79b553dc39a3 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -839,11 +839,19 @@ static const struct tegra_gpio_port tegra194_main_ports[] = {
>          TEGRA194_MAIN_GPIO_PORT(GG, 0, 0, 2)
>   };
> 
> +static const struct tegra186_pin_range tegra194_main_pin_ranges[] = {
> +       { TEGRA194_MAIN_GPIO(GG, 0), "pex_l5_clkreq_n_pgg0" },
> +       { TEGRA194_MAIN_GPIO(GG, 1), "pex_l5_rst_n_pgg1" },
> +};
> +
>   static const struct tegra_gpio_soc tegra194_main_soc = {
>          .num_ports = ARRAY_SIZE(tegra194_main_ports),
>          .ports = tegra194_main_ports,
>          .name = "tegra194-gpio",
>          .instance = 0,
> +       .num_pin_ranges = ARRAY_SIZE(tegra194_main_pin_ranges),
> +       .pin_ranges = tegra194_main_pin_ranges,
> +       .pinmux = "nvidia,tegra194-pinmux",
>   };
> 
>   #define TEGRA194_AON_GPIO_PORT(_name, _bank, _port, _pins)     \
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas@nvidia.com>

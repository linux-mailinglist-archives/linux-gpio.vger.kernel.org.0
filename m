Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8611187E5
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 11:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbfEIJls (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 05:41:48 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:19931 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfEIJlr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 05:41:47 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd3f5b50000>; Thu, 09 May 2019 02:41:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 09 May 2019 02:41:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 09 May 2019 02:41:45 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 May
 2019 09:41:42 +0000
Subject: Re: [Patch-V2 1/4] dt-binding: Tegra194 pinctrl support
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <pdeschrijver@nvidia.com>, <josephl@nvidia.com>,
        <smangipudi@nvidia.com>, <ldewangan@nvidia.com>,
        <vidyas@nvidia.com>
References: <1557389296-10257-1-git-send-email-kyarlagadda@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <41dbf606-0a15-a0bc-07fd-2c7101d7f6a1@nvidia.com>
Date:   Thu, 9 May 2019 10:41:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557389296-10257-1-git-send-email-kyarlagadda@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557394869; bh=dk8yatUotHOvFsORd6Mm8U2hBhCLTRqYjHQ4BQhaQZ8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=AcyhZIdUoDefRLOp4M8WtcdhyVHJSncU0DwkN2LqaA31Izrqq1LRHRGZ1rEhyjwvU
         A7zxK5DMRZhicjm4UaN6li0XG8u7Xbk6/78s9K3fNUX5iwGSTZoxMvWRtuKbQzfxTj
         l4MOzEH3cDKxRo1F7936ZvPYGiE8a4CFqjDNXElPS8uSUY/TPfbAxOm98M9JhVPqX2
         Oh7NQWZzyHd3+8JS6i114Psxiw+BlN6BzVTkQwZmq8VUzVu87vv6/l2ow7h8Dv3J9v
         C+pnrbtwPNCymLvy++u8QTqQ6QtQbwReH45ebpL09h+ucM5x79UjuHyCPZd/yUV9S3
         ED1x7O1iDW68A==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 09/05/2019 09:08, Krishna Yarlagadda wrote:
> Add binding doc for Tegra 194 pinctrl driver
> 
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
> Changes in V2:
> created new binding doc to handle Tegra194 pinctrl driver
> 
>  .../bindings/pinctrl/nvidia,tegra194-pinmux.txt    | 116 +++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
> new file mode 100644
> index 0000000..80e36c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
> @@ -0,0 +1,116 @@
> +NVIDIA Tegra194 pinmux controller
> +
> +Required properties:
> +- compatible: "nvidia,tegra194-pinmux"
> +- reg: Should contain a list of base address and size pairs for:
> +  - first entry: The APB_MISC_GP_*_PADCTRL registers (pad control)
> +  - second entry: The PINMUX_AUX_* registers (pinmux)
> +
> +Please refer to pinctrl-bindings.txt in this directory for details of the
> +common pinctrl bindings used by client devices, including the meaning of the
> +phrase "pin configuration node".
> +
> +Tegra's pin configuration nodes act as a container for an arbitrary number of
> +subnodes. Each of these subnodes represents some desired configuration for a
> +pin, a group, or a list of pins or groups. This configuration can include the
> +mux function to select on those pin(s)/group(s), and various pin configuration
> +parameters, such as pull-up, tristate, drive strength, etc.
> +
> +See the TRM to determine which properties and values apply to each pin/group.
> +Macro values for property values are defined in
> +include/dt-binding/pinctrl/pinctrl-tegra.h.
> +
> +Required subnode-properties:
> +- nvidia,pins : An array of strings. Each string contains the name of a pin or
> +    group. Valid values for these names are listed below.
> +
> +Optional subnode-properties:
> +- nvidia,function: A string containing the name of the function to mux to the
> +    pin or group.
> +- nvidia,pull: Integer, representing the pull-down/up to apply to the pin.
> +    0: none, 1: down, 2: up.
> +- nvidia,tristate: Integer.
> +    0: drive, 1: tristate.
> +- nvidia,enable-input: Integer. Enable the pin's input path.
> +    enable :TEGRA_PIN_ENABLE and
> +    disable or output only: TEGRA_PIN_DISABLE.
> +- nvidia,open-drain: Integer.
> +    enable: TEGRA_PIN_ENABLE.
> +    disable: TEGRA_PIN_DISABLE.
> +- nvidia,lock: Integer. Lock the pin configuration against further changes
> +    until reset.
> +    enable: TEGRA_PIN_ENABLE.
> +    disable: TEGRA_PIN_DISABLE.
> +- nvidia,io-hv: Integer. Select high-voltage receivers.
> +    normal: TEGRA_PIN_DISABLE
> +    high: TEGRA_PIN_ENABLE
> +- nvidia,high-speed-mode: Integer. Enable high speed mode the pins.
> +    normal: TEGRA_PIN_DISABLE
> +    high: TEGRA_PIN_ENABLE
> +- nvidia,schmitt: Integer. Enables Schmitt Trigger on the input.
> +    normal: TEGRA_PIN_DISABLE
> +    high: TEGRA_PIN_ENABLE
> +- nvidia,drive-type: Integer. Valid range 0...3.
> +- nvidia,pull-down-strength: Integer. Controls drive strength. 0 is weakest.
> +    The range of valid values depends on the pingroup. See "CAL_DRVDN" in the
> +    Tegra TRM.
> +- nvidia,pull-up-strength: Integer. Controls drive strength. 0 is weakest.
> +    The range of valid values depends on the pingroup. See "CAL_DRVUP" in the
> +    Tegra TRM.
> +- nvidia,slew-rate-rising: Integer. Controls rising signal slew rate. 0 is
> +    fastest. The range of valid values depends on the pingroup. See
> +    "DRVDN_SLWR" in the Tegra TRM.
> +- nvidia,slew-rate-falling: Integer. Controls falling signal slew rate. 0 is
> +    fastest. The range of valid values depends on the pingroup. See
> +    "DRVUP_SLWF" in the Tegra TRM.

Are all these properties applicable to the pex_l5_clkreq and pex_l5_rst
pins? Particularly the slew-rate properties?

Cheers
Jon

-- 
nvpublic

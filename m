Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9C36217C7
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2019 13:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbfEQLeH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 May 2019 07:34:07 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16041 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbfEQLeG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 May 2019 07:34:06 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cde9c280001>; Fri, 17 May 2019 04:34:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 17 May 2019 04:34:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 17 May 2019 04:34:04 -0700
Received: from [10.24.47.197] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 May
 2019 11:34:00 +0000
Subject: Re: [PATCH V3 1/4] dt-binding: Tegra194 pinctrl support
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <pdeschrijver@nvidia.com>, <josephl@nvidia.com>,
        <smangipudi@nvidia.com>, <ldewangan@nvidia.com>
References: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <83198211-5c66-6f41-5ec2-cb16eb96fc5f@nvidia.com>
Date:   Fri, 17 May 2019 17:03:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558092840; bh=LXmp6ZYHn+42tPsNl+FzOB08hT4lqAPUWHkEl1m2m/Y=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=lRznjCQUph2ruDExMk0DG47xR4wb5Mhom7YH0zfQLIwf6MM/r298Echm6FmErmP7T
         amXvv3EalMvt/LGVOG7twozj3dSHKE/MmQ52cQwgH3xo04/Yok7dhjQZGk0M78qwOz
         Kg8qKeMh6UFAlRyOZGDhxm24TiP2SXme7YjYPqaT6MKAelIIllB8vfN5g3L1P/pW1d
         l4tDdHrL49cpnx+7XjE9qoe4rpL5PXVbw+0WUJnwRSdmzlIwT77mj6vpt+716Ea1kc
         H7WuJraBHQPnk9GtHupoSU9ddmBba5sVIP53W8q0CDPM/P8vrXdn3d8S1GfRIEGWxl
         OHh0I8G3h6zkg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 5/16/2019 5:23 PM, Krishna Yarlagadda wrote:
> Add binding doc for Tegra 194 pinctrl driver
> 
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
> Changes in V3:
> remove optional fields not supported by pins published here
> 
>   .../bindings/pinctrl/nvidia,tegra194-pinmux.txt    | 107 +++++++++++++++++++++
>   1 file changed, 107 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
> new file mode 100644
> index 0000000..8763f44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
> @@ -0,0 +1,107 @@
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
> +
> +Valid values for pin and group names (nvidia,pin) are:
> +
> +    These correspond to Tegra PADCTL_* (pinmux) registers.
> +
> +  Mux groups:
> +
> +    These correspond to Tegra PADCTL_* (pinmux) registers. Any property
> +    that exists in those registers may be set for the following pin names.
> +
> +    pex_l5_clkreq_n_pgg0, pex_l5_rst_n_pgg1
> +
> +  Drive groups:
> +
> +    These registers controls a single pin for which a mux group exists.
> +    See the list above for the pin name to use when configuring the pinmux.
> +
> +    pex_l5_clkreq_n_pgg0, pex_l5_rst_n_pgg1
> +
> +Valid values for nvidia,functions are:
> +
> +    pe5
> +
> +Power Domain:
> +    pex_l5_clkreq_n_pgg0 and pex_l5_rst_n_pgg1 are part of PCIE C5 power
> +    partition. Client devices must enable this partition before accessing
> +    these pins here.
> +
> +
> +Example:
> +
> +		tegra_pinctrl: pinmux: pinmux@2430000 {
> +			compatible = "nvidia,tegra194-pinmux";
> +			reg = <0x2430000 0x17000
> +			       0xc300000 0x4000>;
> +
> +			pinctrl-names = "pex_rst";
> +			pinctrl-0 = <&pex_rst_c5_out_state>;
> +
> +			pex_rst_c5_out_state: pex_rst_c5_out {
> +				pex_rst {
> +					nvidia,pins = "pex_l5_rst_n_pgg1";
> +					nvidia,schmitt = <TEGRA_PIN_DISABLE>;
> +					nvidia,lpdr = <TEGRA_PIN_ENABLE>;
> +					nvidia,enable-input = <TEGRA_PIN_DISABLE>;
> +					nvidia,io-high-voltage = <TEGRA_PIN_ENABLE>;
> +					nvidia,tristate = <TEGRA_PIN_DISABLE>;
> +					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +				};
> +			};
> +		};
> 

Tested-by: Vidya Sagar <vidyas@nvidia.com>

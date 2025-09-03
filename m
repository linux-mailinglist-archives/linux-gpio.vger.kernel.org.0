Return-Path: <linux-gpio+bounces-25544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9F2B42C21
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 23:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05F363B6812
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 21:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4829A2ECD06;
	Wed,  3 Sep 2025 21:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aP10IDRS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1843EEC0;
	Wed,  3 Sep 2025 21:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756936134; cv=none; b=kfdmrMNoDKVvWFTLHT5+44xOWZBfkQ5Jm2AD6D2Mv5CHeAKpNW3qQIDGDmpYiAmXUlitY05TqmLBR5dYbQqHZqxLWYhC9EzdNzLzrR1gthUjWok0hVCYaE6xFVAvGg8VBMCVqXSWRlDQl7bkFEYdPq1AUaVS5wj7o+6SB9p1fF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756936134; c=relaxed/simple;
	bh=99FlZ2W4JrgSZaHdYWVvCc0lO4vikrYMc6uJDPeIhNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mnw8ESDc9xysK/dl40xISvS8xeEGgfVEySYVjQ+/dOG19l6VvPywPwiowWaJOPsnEEjBYqu8/WmzV3EOY3SMKvLAxK6J2iJ2iTXivvcmV5XVkXwBLmwJy9h5bz51zWFTL0+lEdZTCq+bv1XOCPRZmmY54zsBzlyDy4sP2oJagDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aP10IDRS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F07C4CEE7;
	Wed,  3 Sep 2025 21:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756936133;
	bh=99FlZ2W4JrgSZaHdYWVvCc0lO4vikrYMc6uJDPeIhNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aP10IDRS1OINVx/CNzUtFmTeJeA51BwvwlV0wfZK9lBBx2uyu7nuaaQbXj9C7pIoP
	 B1P2mFgXAxs6+vfSepEZC8Aby7WZWsyalbwGKBGon8KC0Kd6xZyDDuayY+ORxdDSgr
	 W1t+mZ2+6ooPvHjhCV5Ih+rQtBjYZ9cmh6twM4cihlwdwUIXUR8jIr6Jy0VPVjhWS4
	 TIYwnDAgik2/W+akimwth2cNfT0nhU7l6t30XZfl8uyJ8NhETa1iSNqikNE+JsJBmi
	 WXESYC7wWevAlGQe/kuf60GD/932tHmYX6Vp9Ct4gz5EcLgr2WfqQLZNN+YTtKmCbN
	 KMiV+h0mQr/Cg==
Date: Wed, 3 Sep 2025 16:48:50 -0500
From: Rob Herring <robh@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 1/3] dt-binbings: hwmon: Document the LTC4283 Swap
 Controller
Message-ID: <20250903214850.GA2762411-robh@kernel.org>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
 <20250903-ltc4283-support-v2-1-6bce091510bf@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903-ltc4283-support-v2-1-6bce091510bf@analog.com>

On Wed, Sep 03, 2025 at 11:04:59AM +0100, Nuno Sá wrote:
> The LTC4283 is a negative voltage hot swap controller that drives an
> external N-channel MOSFET to allow a board to be safely inserted and
> removed from a live backplane.
> 
> Special note for the "adi,vpower-drns-enable" property. It allows to choose
> between the attenuated MOSFET drain voltage or the attenuated input
> voltage at the RTNS pin (effectively choosing between input or output
> power). This is a system level decision not really intended to change at
> runtime and hence is being added as a Firmware property.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  .../devicetree/bindings/hwmon/adi,ltc4283.yaml     | 280 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 286 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ec7768467e66f18f06d8a5258b3b115f23ea996d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> @@ -0,0 +1,280 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/adi,ltc4283.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LTC4283 Negative Voltage Hot Swap Controller
> +
> +maintainers:
> +  - Nuno Sá <nuno.sa@analog.com>
> +
> +description: |
> +  The LTC4283 negative voltage hot swap controller drives an external N-channel
> +  MOSFET to allow a board to be safely inserted and removed from a live
> +  backplane.
> +
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4283.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ltc4283
> +
> +  reg:
> +    maxItems: 1
> +
> +  adi,rsense-nano-ohms:
> +    description: Value of the sense resistor.
> +
> +  adi,current-limit-sense-microvolt:
> +    description:
> +      The current limit sense voltage of the chip is adjustable between
> +      15mV and 30mV in 1mV steps. This effectively limits the current
> +      on the load.
> +    minimum: 15000
> +    maximum: 30000
> +    default: 15000
> +
> +  adi,current-limit-foldback-factor:
> +    description:
> +      Specifies the foldback factor for the current limit. The current limit
> +      can be reduced (folded back) to one of four preset levels. The value
> +      represents the percentage of the current limit sense voltage to use
> +      during foldback. A value of 100 means no foldback.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [10, 20, 50, 100]
> +    default: 100
> +
> +  adi,cooling-delay-ms:
> +    description:
> +      Cooling time to apply after an overcurrent fault, FET bad or
> +      external fault.
> +    enum: [512, 1002, 2005, 4100, 8190, 16400, 32800, 65600]
> +    default: 512
> +
> +  adi,fet-bad-timer-delay-ms:
> +    description:
> +      FET bad timer delay. After a FET bad status condition is detected,
> +      this timer is started. If the condition persists for the
> +      specified time, the FET is turned off and a fault is logged.
> +    enum: [256, 512, 1002, 2005]
> +    default: 256
> +
> +  adi,power-good-reset-on-fet:
> +    description:
> +      If set, resets the power good status when the MOSFET is turned off.
> +      Otherwise, it resets when a low output voltage is detected.
> +    type: boolean
> +
> +  adi,fet-turn-off-disable:
> +    description:
> +      If set, the MOSFET is turned off immediately when a FET fault is detected.
> +    type: boolean
> +
> +  adi,tmr-pull-down-disable:
> +    description: Disables 2uA pull-down current on the TMR pin.
> +    type: boolean
> +
> +  adi,dvdt-inrush-control-disable:
> +    description:
> +      Enables dV/dt inrush control during startup. In dV/dt mode, the inrush
> +      current is limited by controlling a constant output voltage ramp rate.
> +      If not set, the inrush control mechanism is active current limiting.
> +    type: boolean
> +
> +  adi,fault-log-enable:
> +    description:
> +      If set, enables logging fault registers and ADC data into EEPROM upon a
> +      fault.
> +    type: boolean
> +
> +  adi,vpower-drns-enable:
> +    description:
> +      If set, enables the attenuated MOSFET drain voltage to be monitored. This
> +      effectively means that the MOSFET power is monitored. If not set, the
> +      attenuated input voltage (and hence input power) is monitored.
> +    type: boolean
> +
> +  adi,external-fault-fet-off-enable:
> +    description: Turns MOSFET off following an external fault.
> +    type: boolean
> +
> +  adi,undervoltage-retry-disable:
> +    description: Do not retry to turn on the MOSFET after an undervoltage fault.
> +    type: boolean
> +
> +  adi,overvoltage-retry-disable:
> +    description: Do not retry to turn on the MOSFET after an overvoltage fault.
> +    type: boolean
> +
> +  adi,external-fault-retry-enable:
> +    description: Retry to turn on the MOSFET retry after an external fault.
> +    type: boolean
> +
> +  adi,overcurrent-retries:
> +    description: Configures auto-retry following an Overcurrent fault.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [latch-off, "1", "7", unlimited]
> +    default: latch-off
> +
> +  adi,fet-bad-retries:
> +    description:
> +      Configures auto-retry following a FET bad fault and a consequent MOSFET
> +      turn off.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [latch-off, "1", "7", unlimited]
> +    default: latch-off
> +
> +  adi,pgio1-func:
> +    description: Configures the function of the PGIO1 pin.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [inverted_power_good, power_good, gpio]
> +    default: inverted_power_good
> +
> +  adi,pgio2-func:
> +    description: Configures the function of the PGIO2 pin.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [inverted_power_good, power_good, gpio, active_current_limiting]
> +    default: inverted_power_good
> +
> +  adi,pgio3-func:
> +    description: Configures the function of the PGIO3 pin.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [inverted_power_good_input, power_good_input, gpio]
> +    default: inverted_power_good_input
> +
> +  adi,pgio4-func:
> +    description: Configures the function of the PGIO4 pin.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [inverted_external_fault, external_fault, gpio]
> +    default: inverted_external_fault
> +
> +  adi,gpio-on-adio1:
> +    description: If set, the ADIO1 pin is used as a GPIO.
> +    type: boolean
> +
> +  adi,gpio-on-adio2:
> +    description: If set, the ADIO2 pin is used as a GPIO.
> +    type: boolean
> +
> +  adi,gpio-on-adio3:
> +    description: If set, the ADIO3 pin is used as a GPIO.
> +    type: boolean
> +
> +  adi,gpio-on-adio4:
> +    description: If set, the ADIO4 pin is used as a GPIO.
> +    type: boolean
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +dependencies:
> +  adi,gpio-on-adio1:
> +    - gpio-controller
> +    - '#gpio-cells'
> +  adi,gpio-on-adio2:
> +    - gpio-controller
> +    - '#gpio-cells'
> +  adi,gpio-on-adio3:
> +    - gpio-controller
> +    - '#gpio-cells'
> +  adi,gpio-on-adio4:
> +    - gpio-controller
> +    - '#gpio-cells'
> +  adi,external-fault-retry-enable:
> +    - adi,pgio4-func
> +  adi,external-fault-fet-off-enable:
> +    - adi,pgio4-func
> +
> +required:
> +  - compatible
> +  - reg
> +  - adi,rsense-nano-ohms
> +
> +allOf:
> +  - if:
> +      required:
> +        - adi,pgio1-func
> +    then:
> +      if:
> +        properties:
> +          adi,pgio1-func:
> +            const: gpio
> +      then:
> +        required:
> +          - gpio-controller
> +          - '#gpio-cells'

if:
  properties:
    adi,pgio1-func:
      const: gpio
  required:
    - adi,pgio1-func
then:
  required:
    - gpio-controller
    - '#gpio-cells'

With that and the following ones fixed,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


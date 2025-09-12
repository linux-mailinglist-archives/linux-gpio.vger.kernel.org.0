Return-Path: <linux-gpio+bounces-26009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C349B544C1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 10:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DD5E1B25FB0
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 08:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8E92D9481;
	Fri, 12 Sep 2025 08:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Kk0pqkka"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0FD2D8398;
	Fri, 12 Sep 2025 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757664702; cv=none; b=m4URWGaIhyd3A+919w2NfVhfJsSZbxy319UZIrx0bU1QL1iPgzFxPXbqFj7TkXv/tCm9U/9wZsP66jktiHrel2ZR/O2+IsqnuJN4cVDs/ezgav9I4ZY7uqBbWJVk25jtiLiEs73N7tNElgCGX2gTOHTxjf6oriCeyvXVwuxF5pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757664702; c=relaxed/simple;
	bh=g1qMzc3e+uE9kDGjJIWr5qdsOCwYUGNZ4YO3Ze9nZNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LyB8CP+Ej2ruhdKzQzxmtlDJWqqTGHtl6SLc6HC/Tl9kV8i0oaIWY3xo4sLhHYJ72RMrizJLg2zliGalLHhyim7xrueyualK4Jscz2y2vnl5JquxeXzTNHoYrKw12/T0qGz4QLBaz8tD795gtsbe9bFOCdj14+Wd6ZK2PwCoUhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Kk0pqkka; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757664698;
	bh=g1qMzc3e+uE9kDGjJIWr5qdsOCwYUGNZ4YO3Ze9nZNg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kk0pqkkai1y6Ye2S/urzT8HnM3XcCxjoIr19MnYl6Pm5tuj5ynyaJuk1qfuUZOWRJ
	 tUVVpztwsLcBxka/xKcbLlWv/FQrQRxh8UF9s+MX4wlNMRdqpFDTnNl430uU/c7YQM
	 QfEX6ntmA0GDv6vCDC4v8gBUIecEh0kOzjK4M7k8/Dy3pHzmJmsdX+UYDWJRrV+y3J
	 7wLGwPHOwP0YvYOVZ8H93WL3LlMST9CzmlWLO95i6roeJ2B4rNQ21gjVM22h3Hc8QJ
	 zxHajdk/dEl5X5BjoCfLVI6h9RTQxKhoL74kJtGCTVCB7oByCw8/X1iKcmqnWjvnNb
	 gH76wZsWpqNrw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F078517E12BB;
	Fri, 12 Sep 2025 10:11:36 +0200 (CEST)
Message-ID: <990cc068-adc9-473a-b4c7-9113583cb83c@collabora.com>
Date: Fri, 12 Sep 2025 10:11:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] dt-bindings: regulator: Convert Dialog DA9211
 Regulators to DT schema
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, airlied@gmail.com,
 amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-10-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250911151001.108744-10-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/09/25 17:09, Ariel D'Alessandro ha scritto:
> Convert the existing text-based DT bindings for Dialog Semiconductor DA9211
> Voltage Regulators family to a DT schema. Examples are simplified, as these
> are all equal.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>   .../devicetree/bindings/regulator/da9211.txt  | 205 ------------------
>   .../bindings/regulator/dlg,da9211.yaml        | 104 +++++++++
>   2 files changed, 104 insertions(+), 205 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/regulator/da9211.txt
>   create mode 100644 Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
> 

..snip..

> diff --git a/Documentation/devicetree/bindings/regulator/dlg,da9211.yaml b/Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
> new file mode 100644
> index 0000000000000..9d5e25bc3872c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/dlg,da9211.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title:
> +  Dialog Semiconductor DA9211/DA9212/DA9213/DA9223/DA9214/DA9224/DA9215/DA9225
> +  Voltage Regulator

Dialog Semiconductor DA9211-9215, DA9223-9225 Voltage Regulators

Better? :-)

> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - dlg,da9211
> +      - dlg,da9212
> +      - dlg,da9213
> +      - dlg,da9214
> +      - dlg,da9215
> +      - dlg,da9223
> +      - dlg,da9224
> +      - dlg,da9225
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      List of regulators provided by the device
> +
> +    patternProperties:
> +      "^BUCK([AB])$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +        description: |

Please drop the vertical bar | from all descriptions

after which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +          Properties for a single BUCK regulator
> +
> +        properties:
> +          regulator-initial-mode:
> +            items:
> +              enum: [ 1, 2, 3 ]
> +            description: |
> +              Defined in include/dt-bindings/regulator/dlg,da9211-regulator.h
> +
> +          regulator-allowed-modes:
> +            items:
> +              enum: [ 1, 2, 3 ]
> +            description: |
> +              Defined in include/dt-bindings/regulator/dlg,da9211-regulator.h
> +
> +          enable-gpios:
> +            maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/regulator/dlg,da9211-regulator.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        regulator@68 {
> +            compatible = "dlg,da9212";
> +            reg = <0x68>;
> +            interrupts = <3 27>;
> +
> +            regulators {
> +                BUCKA {
> +                    regulator-name = "VBUCKA";
> +                    regulator-min-microvolt = < 300000>;
> +                    regulator-max-microvolt = <1570000>;
> +                    regulator-min-microamp = <2000000>;
> +                    regulator-max-microamp = <5000000>;
> +                    enable-gpios = <&gpio 27 0>;
> +                };
> +                BUCKB {
> +                    regulator-name = "VBUCKB";
> +                    regulator-min-microvolt = < 300000>;
> +                    regulator-max-microvolt = <1570000>;
> +                    regulator-min-microamp = <2000000>;
> +                    regulator-max-microamp = <5000000>;
> +                    enable-gpios = <&gpio 17 0>;
> +                };
> +            };
> +        };
> +    };
> +
> +...



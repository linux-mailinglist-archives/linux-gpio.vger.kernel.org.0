Return-Path: <linux-gpio+bounces-35951-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEeuFUp09Gn+BQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35951-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 11:37:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E574AB5A1
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 11:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C805430158B7
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2026 09:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C287B382282;
	Fri,  1 May 2026 09:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SV9TZHbR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECFB36921B;
	Fri,  1 May 2026 09:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777628227; cv=none; b=r7qCv1SF4JIE2sPbrEAuEtU/mkGz1uqGmisojw9GigTv4up04wk6LhCcGr8zRt63pwgT0Nx5r/dKbtokCTOU3Iym6f9AIsse6jdMRKNbt5NlL/MzOgMRHj9ERG3dJkx0usYRsIIbc+BIPx2SvXnJYVuxNADezOJKanrwgA9Sebs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777628227; c=relaxed/simple;
	bh=AGM6FBt/D8fwDvTU3Zazf9pg/4pj+IOLeTF5LYXuwOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hcL+8n4Sc3CJdDj2f5o9fCL902nrb/mJ2NEzlNd153bnkgfgU2gxNJWotZqO3iILz/pE/HZ2TeC1QwkbR0gsW0GTBcQ0Vn/XAHA1zQ18LG9MCFQoSq1dCp9/5wTn17I11lMEia1CIjF+eloKZlLsXR6O+fc5EMP3Vo2O+yIf28Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SV9TZHbR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE089C2BCB4;
	Fri,  1 May 2026 09:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777628227;
	bh=AGM6FBt/D8fwDvTU3Zazf9pg/4pj+IOLeTF5LYXuwOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SV9TZHbRJluhWrVkUX17MWh1clzaULGmfmgcHTL6T9eTBX7+SFkKoD31bs1Frs5i9
	 5CO+NeYtus7D0zMdnddIpxZvkzVeO1wDen/uBjt3JK9/jVsp06qx+EFemykNcYW7rY
	 7hQCnUnLdKWiIcP7QYw4Xaw/1YsQTYuM+2GDsPXTM0k5NHS16qJdZrAlPl6oIaD74Q
	 yvZz9r7ixdv/oQ5TF2KkOOX/XQOkwG22q+02V3Fqks9gZqbaSwh6iV3yDjgWo/8oTg
	 dO1wUJEO3VeUiU4dDPuNqb1YW9P3HZ5hsULIOsQaiJ2fp83O+fIyOjOvaAlR0UFkbR
	 ujXcbWJSbMNXA==
Message-ID: <a75d18d5-1637-45ec-ba78-01867089a2af@kernel.org>
Date: Fri, 1 May 2026 11:37:01 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: i3c: add binding for Realtek RTS490x I3C
 HUB
To: zain_zhou@realsil.com.cn, linux-staging@lists.linux.dev,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, alexandre.belloni@bootlin.com,
 Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 97E574AB5A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-35951-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.717];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 30/04/2026 14:13, zain_zhou@realsil.com.cn wrote:
> From: zain_zhou <zain_zhou@realsil.com.cn>
> 
> Add DT binding schema for Realtek RTS490x series I3C HUB devices.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> The binding describes configuration properties for:
>   - LDO enable/disable and voltage level per port group
>   - Pull-up resistance per port group
>   - IO driver strength per port
>   - Per target-port mode (I3C/SMBus/GPIO/disabled), pull-up,
>     IO mode, SMBus clock frequency and polling interval
>   - Hub network always-I3C mode
>   - Hardware identification via CSEL pin (id) and CP1 pins (id-cp1)
> 
> Signed-off-by: zain_zhou <zain_zhou@realsil.com.cn>

Don't use login name as full name, but rather latin transliteration.
Name in your native language would also be fine.

But login name is not fine.


> ---
>  .../bindings/i3c/realtek,rts490x-i3c-hub.yaml | 410 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 416 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> new file mode 100644
> index 000000000000..30295eefee89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> @@ -0,0 +1,410 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/realtek,rts490x-i3c-hub.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I3C HUB

Proper name here of your device


> +
> +maintainers:
> +  - zain_zhou <zain_zhou@realsil.com.cn>
> +
> +description: |
> +  I3C HUB is smart device which provides multiple functionality:


Are you describing particular device or I3C HUB?

> +  * enabling voltage compatibility across I3C Controller and Target devices,
> +  * bus capacitance isolation
> +  * address conflict isolation
> +  * I3C port expansion
> +  * two controllers in a single I3C bus
> +  * I3C and SMBus device compatibility
> +  * GPIO expansion
> +
> +  Having such big number of features, there is a need to have some DT knobs to tell the I3C HUB
> +  driver which features shall be enabled and how they shall be configured. I3C HUB driver read,

Please wrap code according to the preferred limit expressed in Kernel
coding style (checkpatch is not a coding style description, but only a
tool).  However don't wrap blindly (see Kernel coding style).

> +  validate DT knobs and set corresponding registers with the right way to satisfy user requests from
> +  DT.

Irrelevant. This is binding, so describe hardware. Not your drivers.

DT is irrelevant as well.

> +
> +  All the DT properties for I3C HUB are located under dedicated (for I3C HUB) DT entry. I3C HUB DT
> +  entry structure is aligned with regular I3C device DT entry described in i3c.yaml.
> +

Irrelevant. Describe your hardware.

> +allOf:
> +  - $ref: i3c.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^hub@0,0$"
> +
> +  cp0-ldo-en:
> +    enum:
> +      - disabled
> +      - enabled

Sorry, but what? Your binding does not look like accepted bindings AT
ALL. Please read writing bindings carefully or go via DTS101 slides.



> +    description: |
> +      I3C HUB Controller Port 0 LDO disabling/enabling setting. If enabled, voltage produced by
> +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
> +
> +      This property is optional. If not provided, LDO will be disabled.
> +
> +  cp1-ldo-en:
> +    enum:
> +      - disabled
> +      - enabled
> +    description: |
> +      I3C HUB Controller Port 1 LDO disabling/enabling setting. If enabled, voltage produced by
> +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
> +
> +      This property is optional. If not provided, LDO will be disabled.
> +
> +  tp0145-ldo-en:
> +    enum:
> +      - disabled
> +      - enabled
> +    description: |
> +      I3C HUB Target Ports 0/1/4/5 LDO disabling/enabling setting. If enabled, voltage produced by
> +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
> +
> +      This property is optional. If not provided, LDO will be disabled.
> +
> +  tp2367-ldo-en:
> +    enum:
> +      - disabled
> +      - enabled
> +    description: |
> +      I3C HUB Target Ports 2/3/6/7 LDO disabling/enabling setting. If enabled, voltage produced by
> +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
> +
> +      This property is optional. If not provided, LDO will be disabled.
> +
> +  cp0-ldo-volt:

Nope. There are no such properties. Missing vendor prefix, missing
proper unit suffix. Look at other bindings.

> +    enum:
> +      - 1.0V
> +      - 1.1V
> +      - 1.2V
> +      - 1.8V
> +    description: |
> +      I3C HUB Controller Port 0 LDO setting to control the Controller Port 1 voltage level. This
> +      property is optional.
> +

...


> +
> +additionalProperties: true

No, you cannot have it. Please read writing bindings, writing schema or
open ANY other binding.

> +
> +examples:
> +  - |
> +    i3c-master@d040000 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      hub@0,0 {
> +        cp0-ldo-en = "disabled";
> +        cp1-ldo-en = "enabled";
> +        cp0-ldo-volt = "1.0V";
> +        cp1-ldo-volt = "1.1V";
> +        tp0145-ldo-en = "enabled";
> +        tp2367-ldo-en = "disabled";
> +        tp0145-ldo-volt = "1.2V";
> +        tp2367-ldo-volt = "1.8V";
> +        tp0145-pullup = "2k";
> +        tp2367-pullup = "500R";
> +        tp0145-io-strength = "50Ohms";
> +        tp2367-io-strength = "30Ohms";
> +        cp0-io-strength = "20Ohms";
> +        cp1-io-strength = "40Ohms";
> +
> +        target-port@0 {
> +          mode = "i3c";
> +          pullup = "enabled";
> +          always_enable;
> +        };
> +        target-port@1 {
> +          mode = "smbus";
> +          pullup = "enabled";
> +          clock-frequency = <1000000>;
> +          polling-interval-ms = <10>;
> +          backend@10{
> +              compatible = "i2c-slave-mqueue";
> +              reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +          };
> +        };
> +        target-port@2 {
> +          mode = "gpio";
> +          pullup = "disabled";
> +        };
> +        target-port@3 {
> +          mode = "disabled";
> +          pullup = "disabled";
> +        };
> +      };
> +    };
> +
> +  - |
> +    i3c-master@d040000 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      hub@70,3C000000100 {

No way it passes validation. You just said it CANNOT be anything else
than hub@0,0

> +        reg = <0x70 0x3C0 0x00000100>;

Lower case hex. Anyway, one example is enough.

> +        assigned-address = <0x70>;
> +        dcr = <0xC2>;
> +
> +        cp0-ldo-en = "disabled";
> +        cp1-ldo-en = "enabled";
> +        cp0-ldo-volt = "1.0V";
> +        cp1-ldo-volt = "1.1V";
> +        tp0145-ldo-en = "enabled";
> +        tp2367-ldo-en = "disabled";
> +        tp0145-ldo-volt = "1.2V";
> +        tp2367-ldo-volt = "1.8V";
> +        tp0145-pullup = "2k";
> +        tp2367-pullup = "500R";
> +        tp0145-io-strength = "50Ohms";
> +        tp2367-io-strength = "30Ohms";
> +        cp0-io-strength = "20Ohms";
> +        cp1-io-strength = "40Ohms";
> +
> +        target-port@0 {
> +          mode = "i3c";
> +          pullup = "enabled";
> +          always-enable;
> +        };
> +        target-port@1 {
> +          mode = "smbus";
> +          pullup = "enabled";
> +          backend@12{
> +              compatible = "i2c-slave-mqueue";
> +              reg = <(0x12 | I2C_OWN_SLAVE_ADDRESS)>;
> +          };
> +        };
> +        target-port@2 {
> +          mode = "gpio";
> +          pullup = "disabled";
> +        };
> +        target-port@3 {
> +          mode = "disabled";
> +          pullup = "disabled";
> +        };
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb1c75afd16..71ee5071ac0f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12214,6 +12214,12 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>  F:	drivers/i3c/master/renesas-i3c.c
>  
> +I3C HUB DRIVER FOR REALTEK RTS490X
> +M:	zain_zhou <zain_zhou@realsil.com.cn>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> +F:	drivers/staging/rts490x/

There is no such directory.



Best regards,
Krzysztof


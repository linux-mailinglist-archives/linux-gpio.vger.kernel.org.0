Return-Path: <linux-gpio+bounces-38029-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dj6MAMy3I2qdxQEAu9opvQ
	(envelope-from <linux-gpio+bounces-38029-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 08:01:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A1264CA92
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 08:01:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ultrarisc.com header.s=dkim header.b=dXQxxt1q;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38029-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38029-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ultrarisc.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F835302570B
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jun 2026 06:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A623430B50A;
	Sat,  6 Jun 2026 06:01:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5809E19E819;
	Sat,  6 Jun 2026 06:01:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780725693; cv=none; b=G3pEu3MSM27uOqLjpwSTzpevEAzogBIccZwOrah2iUKQvnqWuYYBpbAENGSPpebjVmQIpVXBZar8QrhL+14gnCvnjlwJtyx8Z0wmLmmTYLex91vaebebyN4LpsZe1ad/0Naf6RxaHX8/iNefXhgDGyhSvw5l5pA+fDg0/HHpduA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780725693; c=relaxed/simple;
	bh=vbjx3jIdoRLsj8r4VFsYQiQ/rIEFTTtZObfXBqGAz90=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=dGh36QJDrEiSZjYefuH302dlFM8MhzKI+jLAu22FhSmetSql4q+A6FQPM9Y8tXt2GqDt5JfpJ/N3uxaFeQStZjDicBXeclmG+BHXhLKJyR3RoYSO9S+bygjo7Q7yvOqV3iTms3T7ngNh9SsKaZwxcaSWOXcEoyr/vM0jFGIKTSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=dXQxxt1q; arc=none smtp.client-ip=218.76.62.146
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=Q0lEbHPoOb0nne3l5BxgXbYMvSEdlQD33
	b/MpIvvu8c=; b=dXQxxt1qfjoAzhBV9jboOWl4t6fjIhjBVCDSm+I/CVZVOKv7Z
	1fKSBx+gR6yT/caNN6voWRv/UVRRTXrmgq+RznKey5diqeO/D5DjTkS0spfVmOPK
	u7Ck0PYkdE5bjw6c+YN7bHxadUirHLsfYD8k/UqC8EeVe0Wkl57Ylukfx4=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEELatyNqQfAIAA--.8785S2;
	Sat, 06 Jun 2026 14:02:02 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: Add UltraRISC DP1000
 pinctrl controller
From: Jia Wang <wangjia@ultrarisc.com>
To: Conor Dooley <conor@kernel.org>
Cc: wangjia@ultrarisc.com, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260602-clause-mortify-a0e474334cfe@spud>
References: <20260601-ultrarisc-pinctrl-v2-0-07ac5130a96d@ultrarisc.com>
 <20260601-ultrarisc-pinctrl-v2-1-07ac5130a96d@ultrarisc.com>
 <20260602-clause-mortify-a0e474334cfe@spud>
Date: Sat, 06 Jun 2026 14:01:24 +0800
Message-Id: <178072568462.310568.17342136080952908475.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780725684; l=5780;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=vbjx3jIdoRLsj8r4VFsYQiQ/rIEFTTtZObfXBqGAz90=;
 b=DX0mie9wW2L4V3jFss+Zk+8Wm5XshO3RpB2TKAY37ynoWJi8CExieJivIj6rvxXP+NUP1FMaZ
 lrm2NgmNxFLCXnU+KNN9p3tV5wmbbTRJ+Cw6SCL+SiXxPkFeyrh9GXm
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwDXEELatyNqQfAIAA--.8785S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw4UJFy8KF43ZFW7Xw4ruFg_yoWrKr1xpF
	W3CFZxJFy2qr17J3yft3WFk3ZxJan7Cry7uw1jq34jya90vF1kXrsxKws8WFn5ur1xJrWI
	ya1jva42van7AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUFg4SDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoWakYABgAosu
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:wangjia@ultrarisc.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38029-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[ultrarisc.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0A1264CA92

On 2026-06-02 17:53 +0100, Conor Dooley wrote:
> On Mon, Jun 01, 2026 at 05:56:34PM +0800, Jia Wang via B4 Relay wrote:
> > From: Jia Wang <wangjia@ultrarisc.com>
> > 
> > Add doc for the pinctrl controllers on the UltraRISC DP1000 RISC-V SoC.
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> >  .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 128 +++++++++++++++++++++
> >  MAINTAINERS                                        |   6 +
> >  2 files changed, 134 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..5100033c18c3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
> > @@ -0,0 +1,128 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/ultrarisc,dp1000-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: UltraRISC DP1000 Pin Controller
> > +
> > +maintainers:
> > +  - Jia Wang <wangjia@ultrarisc.com>
> > +
> > +description: |
> > +  UltraRISC RISC-V SoC DP1000 pin controller.
> > +  The controller manages ports A, B, C, D and LPC. Ports A-D default to
> > +  GPIO and provide additional SPI, UART, I2C, and PWM mux functions.
> > +  LPC pins default to the LPC interface and can be muxed to eSPI.
> > +  All pins also support pin configuration, including drive strength,
> > +  pull-up, and pull-down settings.
> > +
> > +properties:
> > +  compatible:
> > +    const: ultrarisc,dp1000-pinctrl
> > +
> > +  reg:
> > +    items:
> > +      - description: pin controller registers
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +patternProperties:
> > +  '.*-pins$':
> > +    type: object
> > +    unevaluatedProperties: false
> > +    allOf:
> > +      - $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +      - $ref: /schemas/pinctrl/pinmux-node.yaml#
> > +      - if:
> > +          properties:
> > +            pins:
> > +              contains:
> > +                pattern: '^LPC([0-9]|1[0-2])$'
> > +        then:
> > +          properties:
> > +            function:
> > +              enum:
> > +                - lpc
> > +                - espi
> > +
> > +    properties:
> > +      pins:
> > +        description: List of pins affected by this state node.
> > +        minItems: 1
> > +        uniqueItems: true
> > +        items:
> > +          type: string
> > +          oneOf:
> > +            - pattern: '^PA([0-9]|1[0-5])$'
> > +            - pattern: '^PB[0-7]$'
> > +            - pattern: '^PC[0-7]$'
> > +            - pattern: '^PD[0-7]$'
> > +            - pattern: '^LPC([0-9]|1[0-2])$'
> > +
> > +      function:
> > +        description: |
> > +          Mux function to select for the listed pins. Supported functions
> > +          depend on the selected pins and match the DP1000 hardware mux
> > +          table.
> > +        enum:
> > +          - gpio
> > +          - i2c0
> > +          - i2c1
> > +          - i2c2
> > +          - i2c3
> 
> Why do you need to know which i2c, pwm etc is being used here?
> If don't need to differentiate, then drop the numeric.
> Only spi and uart seem to have more than one "UR_FUNC" associated with
> them.
>

Thanks, that's a good point. The hardware only provides generic mux modes
rather than per-instance I2C/PWM functions, so the numeric suffixes are
not really meaningful here. I'll simplify the function names and drop the
unnecessary numbering in v3.

> Cheers,
> Conor.
> 

Best regards,
Jia Wang

> > +          - pwm0
> > +          - pwm1
> > +          - pwm2
> > +          - pwm3
> > +          - spi0
> > +          - spi1
> > +          - uart0
> > +          - uart1
> > +          - uart2
> > +          - uart3
> > +          - lpc
> > +          - espi
> > +
> > +      bias-disable: true
> > +      bias-high-impedance: true
> > +      bias-pull-up: true
> > +      bias-pull-down: true
> > +
> > +      drive-strength:
> > +        description: Output drive strength in mA.
> > +        enum: [20, 27, 33, 40]
> > +
> > +    required:
> > +      - pins
> > +      - function
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      pinctrl@11081000 {
> > +        compatible = "ultrarisc,dp1000-pinctrl";
> > +        reg = <0x0 0x11081000 0x0 0x1000>;
> > +
> > +        i2c0-pins {
> > +          pins = "PA12", "PA13";
> > +          function = "i2c0";
> > +          bias-pull-up;
> > +          drive-strength = <33>;
> > +        };
> > +
> > +        uart0-pins {
> > +          pins = "PA8", "PA9";
> > +          function = "uart0";
> > +          bias-pull-up;
> > +          drive-strength = <33>;
> > +        };
> > +      };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 461a3eed6129..6fd7ce6365fb 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -27356,6 +27356,12 @@ S:	Maintained
> >  F:	drivers/usb/common/ulpi.c
> >  F:	include/linux/ulpi/
> >  
> > +ULTRARISC DP1000 PINCTRL DRIVER
> > +M:	Jia Wang <wangjia@ultrarisc.com>
> > +L:	linux-gpio@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
> > +
> >  ULTRATRONIK BOARD SUPPORT
> >  M:	Goran Rađenović <goran.radni@gmail.com>
> >  M:	Börge Strümpfel <boerge.struempfel@gmail.com>
> > 
> > -- 
> > 2.34.1
> > 
> > 




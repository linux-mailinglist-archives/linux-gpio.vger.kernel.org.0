Return-Path: <linux-gpio+bounces-25025-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F2EB37F66
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 11:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69D8616D2DC
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 09:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7A71E231E;
	Wed, 27 Aug 2025 09:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bKIRxevy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A333B27B337
	for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756288570; cv=none; b=mjxiLskBlviVF+NC5kx+wEa07WNaB7N1EigzsqGmIJ8KbzGA67t2U7WN/neyMe3pIgs/KtsjIafrYUfQrW3iHBhY5zCX8WRfc5p+RyjWqMGIM6P4C/13PwLYt5FpzCHihoVAIfZhN/CjM7FheuR6I/sFWaxArRF6LySYlhB+5mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756288570; c=relaxed/simple;
	bh=9nDh+fqGnYUlCCWYz5C/DpXB/E2ySKrV13GaiWpwiPE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAnr1LdKkQhhl2YAfXzInFrSTTmB7Y8lre3ZhMG5EMwwqeF1BmZCQvZtJhV9HyJF50w7dF0yZGSwOVgnnTbaFTDrj6WRN4iBIG37l+Wh4v8B6YS4a2IMLfUDOeBMcu+6KLaRfHJ6o/VKwfxlpeGVP4pHAyiJmb0P1s0xn3gpRi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bKIRxevy; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-afcb6856dfbso152982966b.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 02:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756288567; x=1756893367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sjkSzRyl1g9cs5mTFMFSZLWz4lR/ELoXhIHKRJbEmxI=;
        b=bKIRxevyu0Kwrh0qwlIBq60IhpVnr33ZQM+0ksA1L193LXukCZco5nu5UPVOkXv1ZB
         G29Ldxmv5fxZbCNnIt0vDE7isocyIbCgRJQU0xM3Fc8mYu60ZBTYJrqZvD+N7NUoYdON
         I3fFPS0jufOHj2O6r+ZYQR9SNsJSnywUDubZx3g4PdyxhiIX8MDgLd4c3FIM9jruZbx9
         tXbKdKWOAz2vaG6jVaSdAsdLdx3q8MG/MrOKwuQ3A3s5zCY9YDTfSCgDtAU7PYEL7MxL
         j7Gy8/kXCxR5ZIAhlcnBxMALyIPCGSRHUR/vgJhsDuCEhRcPZBQIrVgI1H510ZgajtMB
         GFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756288567; x=1756893367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjkSzRyl1g9cs5mTFMFSZLWz4lR/ELoXhIHKRJbEmxI=;
        b=N+JihfK6tSnlMtCEme/D5x4zmfA3ilN0yLa+JrCCePH93MhUlEXrJ5KtsxBpm6zrnE
         KJY2k7i/54jvvJXa0vQSqYKzHg8iLDDYQq6YOSiZ7jE1iQylQhs0wIfOVmp+cDwqg7NH
         2Q39+GRoSamxK/rFA+bl+SLFtoW5xot+SE8fB6acJ12fHzXgUNYJVX7pJdvel3XatICX
         GkEiJfaHyHuCtEArfGQi4F+5qhhDQIXODBPZgcTexK3BE2o6L4/ay0qtFSUhTdY1gbAt
         gN3B9GhYtRusu8z4slPLFB7SlRrWjGATK5RomesV+rK5sXxrzJp0ep8J+XxZ43LmqZu/
         KMPw==
X-Forwarded-Encrypted: i=1; AJvYcCVXLyvraCEnwCLxCnDwGbJbhcjXlrKY+zP3BRxBpIuEpz+yBgcQHI+BmqejQ/jQmDQGFaUpa2JULG7t@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3hFOwepkT/s/m28OSePeYDqVap6naeCzVNaErBkl1+7jfwSF1
	hhZgeml6g1TqUgja6fTN63HNtp6mOjhNXsDYSyCWST8IoWjpcE4msqn3lgaBV54C+hw=
X-Gm-Gg: ASbGnctLBScdf0Je8Gn22+5gyIkf0NbZmyEs+x6EAhlxWENyUZaxa9WjqUsins5FhEw
	mHk2xGunuRgOCjUg9I/GzkJa/NHAJJE7OsycunMWLo1ceQ+u3sfJ5KuEQR5VEXcXAiq8PtiWGgE
	u3NOVh8OfZ0bGW0IuFGwdkVIueMh0keKmjPpHIoOuweLr8rxqvZRYQup6lYcfiIgFUeNWSslLzy
	WH/VvfxJcsFwt9bhfxxp0wASMFPp2y6UdAiV0sNX8DMs2AmN4AvcITNqDfw9hpNb41SXacrjtv7
	6iLpV0e//KyGUyFURBdAwq5UxnqBIRI4ORxhQ0ZSN2S7H655MAVM/afNNzHy84HKQt0CWmumr7i
	xvxdkr8GfE9btI44v0BuuJhpyQNAlx7nIZRf46xjqybVHrPB/TVrz+nzE187PRwobK3F6Cov9fG
	qbe3KzKwWUH8BkJ4p8
X-Google-Smtp-Source: AGHT+IH2BAIHZjtkFkG74TGOjFzT/IYNS5G2LQt+C3kivswZI0B2A0fV9PMQ7gyzkhXRRDI2psHzvg==
X-Received: by 2002:a17:907:3d12:b0:afe:94cd:111a with SMTP id a640c23a62f3a-afeafec9ccemr423517966b.7.1756288566993;
        Wed, 27 Aug 2025 02:56:06 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe89bd7acesm555423866b.73.2025.08.27.02.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 02:56:06 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 27 Aug 2025 11:58:00 +0200
To: Rob Herring <robh@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Broadcom
 STB pin controller
Message-ID: <aK7WqA7OP1h-rpJ6@apocalypse>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <6fdbaf2bd0b72badbb5384e43b97bebcda4cc2f0.1754922935.git.andrea.porta@suse.com>
 <20250818172040.GA1483013-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818172040.GA1483013-robh@kernel.org>

Hi Rob,

On 12:20 Mon 18 Aug     , Rob Herring wrote:
> On Mon, Aug 11, 2025 at 04:46:51PM +0200, Andrea della Porta wrote:
> > From: "Ivan T. Ivanov" <iivanov@suse.de>
> > 
> > The STB pin controller represents a family whose silicon instances
> > are found e.g. on BCM2712 SoC.
> > 
> > In particular, on RaspberryPi 5, there are two separate instantiations
> > of the same IP block which differ in the number of pins that are
> > associated and the pinmux functions for each of those pins. The
> > -aon- variant stands for 'Always On'.
> > 
> > Depending on the revision of the BCM2712 (CO or D0), the pin
> > controller instance has slight differences in the register layout.
> > 
> > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       | 135 ++++++++++++++++++
> >  1 file changed, 135 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..28d66336aa2e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
> > @@ -0,0 +1,135 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/brcm,bcm2712c0-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom STB family pin controller
> > +
> > +maintainers:
> > +  - Ivan T. Ivanov <iivanov@suse.de>
> > +  - A. della Porta <andrea.porta@suse.com>
> 
> Why is your first name abbrievated here?

The heuristic inside get_maintainer.pl does not correctly recognize names like
"Andrea della Porta", reporting something like:

della Porta <andrea.porta@suse.com>

and missing both the first name and the double quotes surrounding the
name/surname pair.
Something like "Andrea d. Porta" would be reported correctly but it's not an
option in my case since 'della' is not a middle name that can abbreviated,
it's just integral part of the surname.
The easy workaround I've found (the hard one being fixing get_maintainer.pl
script, of course, but I'm not a Perl guru) is to just let the name be
abbreviated.

> 
> > +
> > +description:
> > +  Broadcom's STB family of memory-mapped pin controllers.
> > +  This includes the pin controllers inside the BCM2712 SoC which
> > +  are instances of the STB family and has two silicon variants,
> > +  C0 and D0, which differs slightly in terms of registers layout.
> > +  The -aon- (Always On) variant is the same IP block but differs
> > +  in the number of pins that are associated and the pinmux functions
> > +  for each of those pins.
> 
> Wrap lines at 80. If there are paragraphs, then blank line in between 
> and use the '>' modifier.

I'm not seeing any lines exceeding 80 chars here. Ack for the
blank lines between paragraphs plus >.

> 
> > +
> > +allOf:
> > +  - $ref: pinctrl.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - brcm,bcm2712c0-pinctrl
> > +      - brcm,bcm2712c0-aon-pinctrl
> > +      - brcm,bcm2712d0-pinctrl
> > +      - brcm,bcm2712d0-aon-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  '-state$':
> > +    oneOf:
> > +      - $ref: '#/$defs/brcmstb-pinctrl-state'
> > +      - patternProperties:
> > +          '-pins$':
> > +            $ref: '#/$defs/brcmstb-pinctrl-state'
> > +        additionalProperties: false
> > +
> > +$defs:
> > +  brcmstb-pinctrl-state:
> > +    allOf:
> > +      - $ref: pincfg-node.yaml#
> > +      - $ref: pinmux-node.yaml#
> > +
> > +    description:
> > +      Pin controller client devices use pin configuration subnodes (children
> > +      and grandchildren) for desired pin configuration.
> > +      Client device subnodes use below standard properties.
> 
> Paragraphs here?

Ack.

> 
> > +
> > +    properties:
> > +      pins:
> > +        description:
> > +          List of gpio pins affected by the properties specified in this
> > +          subnode (either this or "groups" must be specified).
> > +        items:
> > +          pattern: '^((aon_)?s?gpio[0-6]?[0-9])|(emmc_(clk|cmd|dat[0-7]|ds))$'
> > +
> > +      function:
> > +        enum: [ gpio, alt1, alt2, alt3, alt4, alt5, alt6, alt7, alt8,
> > +                aon_cpu_standbyb, aon_fp_4sec_resetb, aon_gpclk, aon_pwm,
> > +                arm_jtag, aud_fs_clk0, avs_pmu_bsc, bsc_m0, bsc_m1, bsc_m2,
> > +                bsc_m3, clk_observe, ctl_hdmi_5v, enet0, enet0_mii, enet0_rgmii,
> > +                ext_sc_clk, fl0, fl1, gpclk0, gpclk1, gpclk2, hdmi_tx0_auto_i2c,
> > +                hdmi_tx0_bsc, hdmi_tx1_auto_i2c, hdmi_tx1_bsc, i2s_in, i2s_out,
> > +                ir_in, mtsif, mtsif_alt, mtsif_alt1, pdm, pkt, pm_led_out, sc0,
> > +                sd0, sd2, sd_card_a, sd_card_b, sd_card_c, sd_card_d, sd_card_e,
> > +                sd_card_f, sd_card_g, spdif_out, spi_m, spi_s, sr_edm_sense, te0,
> > +                te1, tsio, uart0, uart1, uart2, usb_pwr, usb_vbus, uui, vc_i2c0,
> > +                vc_i2c3, vc_i2c4, vc_i2c5, vc_i2csl, vc_pcm, vc_pwm0, vc_pwm1,
> > +                vc_spi0, vc_spi3, vc_spi4, vc_spi5, vc_uart0, vc_uart2, vc_uart3,
> > +                vc_uart4 ]
> > +
> > +        description:
> > +          Specify the alternative function to be configured for the specified
> > +          pins.
> 
> Be consistent with putting 'description' first or last.

Ack.

Many thanks,
Andrea

> 
> > +
> > +      bias-disable: true
> > +      bias-pull-down: true
> > +      bias-pull-up: true
> > +
> > +    required:
> > +      - pins
> > +
> > +    if:
> > +      properties:
> > +        pins:
> > +          not:
> > +            contains:
> > +              pattern: "^emmc_(clk|cmd|dat[0-7]|ds)$"
> > +    then:
> > +      required:
> > +        - function
> > +    else:
> > +      properties:
> > +        function: false
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    brcm_pinctrl: pinctrl@7d504100 {
> > +        compatible = "brcm,bcm2712c0-pinctrl";
> > +        reg = <0x7d504100 0x30>;
> > +
> > +        bt-shutdown-default-state {
> > +           function = "gpio";
> > +           pins = "gpio29";
> > +        };
> > +
> > +        uarta-default-state {
> > +            rts-tx-pins {
> > +                function = "uart0";
> > +                pins = "gpio24", "gpio26";
> > +                bias-disable;
> > +            };
> > +
> > +            cts-rx-pins {
> > +                function = "uart0";
> > +                pins = "gpio25", "gpio27";
> > +                bias-pull-up;
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.35.3
> > 


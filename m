Return-Path: <linux-gpio+bounces-8512-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B0B9446AE
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 10:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AAEC1C22CEF
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 08:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DFF16DECA;
	Thu,  1 Aug 2024 08:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L3DpTCvN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UwBLlWTc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L3DpTCvN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UwBLlWTc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB5F45BEC;
	Thu,  1 Aug 2024 08:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722501250; cv=none; b=Crt8bHoqgClFnmnqOk6pTI7tm3Vr41xTz78gJAe7XiZ8aCkhywjgAOdRz9nUcFg2E/7kI2zOBkwdUJxJq+Wym/n8NEfGnS6FNA60OVcchKIVESzd6JPJwxWEV5dh8ApgSsjWC3OO1uQscC01WPNmjE1wB7TLHnQDXU1OzRhvMHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722501250; c=relaxed/simple;
	bh=HTmYS1NGUfNF0xkaqtGp9UNfj5GEV/58WBr5tSQ2Qek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifjSzjceUhLO5P6WJt+NvirTVSbadTQERF7sI1LjC99G4D9NV8cwWsYSRVVWzci3sH9QoR1HXtGu0nWtKU90iK1qheWPgWoPwo9y4VdLqh4W76p7T6UgITiI3fi0JgzH01Iizd7WQP7tPfneqitfbgL83dEzVUWARMcJvSrM7iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L3DpTCvN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UwBLlWTc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L3DpTCvN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UwBLlWTc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B813D1F7D2;
	Thu,  1 Aug 2024 08:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722501246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+CctGXYz4xQ6Xq9aj5P4ZmjSOkB34RSbKZhF+ViSvUI=;
	b=L3DpTCvNOaK2EXP7ZVS7GZwhWc9P/FWQyCNuepktbqnJQMKnD+puFJUszItDtS0VIivnb1
	lk4HMlqenPVN/b/+tmnoT7rQi6cbvOo5r58XjG51ssIQhIrKQnrRishLGRp1rA+LRYY/Pf
	uqISw8KI+LAxMlb1+njCo92kI1tlC28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722501246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+CctGXYz4xQ6Xq9aj5P4ZmjSOkB34RSbKZhF+ViSvUI=;
	b=UwBLlWTcO8t5uznwf8EeHZbcc9zRJo+RtslT98jmnSB8a0wlRGHU77m+W9ltGRs720Jz6Y
	vzFOs4sPGVWM5mAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722501246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+CctGXYz4xQ6Xq9aj5P4ZmjSOkB34RSbKZhF+ViSvUI=;
	b=L3DpTCvNOaK2EXP7ZVS7GZwhWc9P/FWQyCNuepktbqnJQMKnD+puFJUszItDtS0VIivnb1
	lk4HMlqenPVN/b/+tmnoT7rQi6cbvOo5r58XjG51ssIQhIrKQnrRishLGRp1rA+LRYY/Pf
	uqISw8KI+LAxMlb1+njCo92kI1tlC28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722501246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+CctGXYz4xQ6Xq9aj5P4ZmjSOkB34RSbKZhF+ViSvUI=;
	b=UwBLlWTcO8t5uznwf8EeHZbcc9zRJo+RtslT98jmnSB8a0wlRGHU77m+W9ltGRs720Jz6Y
	vzFOs4sPGVWM5mAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92D4913946;
	Thu,  1 Aug 2024 08:34:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jYjVIX5Iq2bjFAAAD6G6ig
	(envelope-from <iivanov@suse.de>); Thu, 01 Aug 2024 08:34:06 +0000
Date: Thu, 1 Aug 2024 11:38:20 +0300
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	wahrenst@gmx.net, andrea.porta@suse.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: Add support for Broadcom STB
 pin controller
Message-ID: <20240801083820.5my7yc3zxq64gmt5@localhost.localdomain>
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-2-iivanov@suse.de>
 <dcc13c9a-ea74-4fa4-9c74-57e576e01ae6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcc13c9a-ea74-4fa4-9c74-57e576e01ae6@kernel.org>
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_ENVRCPT(0.00)[gmx.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,broadcom.com,gmx.net,suse.com,vger.kernel.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60

Hi,

On 08-01 10:17, Krzysztof Kozlowski wrote:
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml
> 
> bcm2712 is Rpi, so not really STB. The name is confusing. Please use
> compatible as filename, so:
> brcm,bcm2712-pinctrl.yaml

According Florian it is:

https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/

> 
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/brcm,brcmstb-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom STB family pin controller
> > +
> > +maintainers:
> > +  - Ivan T. Ivanov <iivanov@suse.de>
> > +
> > +description:
> > +  Broadcom's STB family memory-mapped pin controller.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - brcm,bcm2712-pinctrl
> > +      - brcm,bcm2712-aon-pinctrl
> > +      - brcm,bcm2712c0-pinctrl
> > +      - brcm,bcm2712c0-aon-pinctrl
> > +      - brcm,bcm2712d0-pinctrl
> > +      - brcm,bcm2712d0-aon-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +allOf:
> > +  - $ref: pinctrl.yaml#
> 
> "allOf:" block goes after "required:".
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties:
> > +  anyOf:
> > +    - type: object
> > +      allOf:
> > +        - $ref: pincfg-node.yaml#
> > +        - $ref: pinmux-node.yaml#
> > +
> > +      properties:
> > +        function:
> > +          enum:
> > +            [
> 
> Unnecessary new line
> 
> > +              gpio, alt1, alt2, alt3, alt4, alt5, alt6, alt7, alt8,
> > +              aon_cpu_standbyb, aon_fp_4sec_resetb, aon_gpclk, aon_pwm,
> > +              arm_jtag, aud_fs_clk0, avs_pmu_bsc, bsc_m0, bsc_m1, bsc_m2,
> > +              bsc_m3, clk_observe, ctl_hdmi_5v, enet0, enet0_mii, enet0_rgmii,
> > +              ext_sc_clk, fl0, fl1, gpclk0, gpclk1, gpclk2, hdmi_tx0_auto_i2c,
> > +              hdmi_tx0_bsc, hdmi_tx1_auto_i2c, hdmi_tx1_bsc, i2s_in, i2s_out,
> > +              ir_in, mtsif, mtsif_alt, mtsif_alt1, pdm, pkt, pm_led_out, sc0,
> > +              sd0, sd2, sd_card_a, sd_card_b, sd_card_c, sd_card_d, sd_card_e,
> > +              sd_card_f, sd_card_g, spdif_out, spi_m, spi_s, sr_edm_sense, te0,
> > +              te1, tsio, uart0, uart1, uart2, usb_pwr, usb_vbus, uui, vc_i2c0,
> > +              vc_i2c3, vc_i2c4, vc_i2c5, vc_i2csl, vc_pcm, vc_pwm0, vc_pwm1,
> > +              vc_spi0, vc_spi3, vc_spi4, vc_spi5, vc_uart0, vc_uart2, vc_uart3,
> > +              vc_uart4,
> > +            ]
> > +
> > +        pins:
> > +          items:
> > +            pattern: "^((aon_)?s?gpio[0-6]?[0-9])|(emmc_(clk|cmd|dat[0-7]|ds))$"
> > +
> > +        bias-disable: true
> > +        bias-pull-down: true
> > +        bias-pull-up: true
> > +      additionalProperties: false
> > +
> > +    - type: object
> > +      additionalProperties:
> > +        $ref: "#/additionalProperties/anyOf/0"
> 
> I suggest going with patternProperties, fixed suffix for node names and
> $defs. See for example:
> Documentation/devicetree/bindings/pinctrl/qcom,x1e80100-tlmm.yaml
> 
> Missing example. I don't see this being part of other complete device,
> so example is a requirement.
> 

Thanks, I will update and resend.

Regards,
Ivan



Return-Path: <linux-gpio+bounces-34390-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDUJNUk1ymnn6QUAu9opvQ
	(envelope-from <linux-gpio+bounces-34390-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:33:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5BA35736C
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5570A30069B9
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 08:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B543ACEF3;
	Mon, 30 Mar 2026 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lut/MqHL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACCA3AD512
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859566; cv=none; b=WISf5FDR8D0XAtQPe9fb60o7V5qrmO/hU2HI7Hi6dHIIAIl8aXynnrCt+r8Hwj4MGaxhdhguDsHPlHtv7AUoxuQuRxmlC2Ojd75pF/bGd2tXTw49eDJNoDR7vzB0twGZeDf2H9XQnLjkmkZXP6Rd6bFtrXMyOP4JhBrLrxVOAAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859566; c=relaxed/simple;
	bh=75FEs0ybZkc7CPZSVzblsuu4jpTIyJxwvM3fwOTN0rg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pU+bm1q3LV//c/zkF5u8NGGvHvwuBDeu0wFzkAvVdWqmrcDIRL1mgbxU5QarJdRw2aFTgTlm0SrhOlyYCCmt+CPcSvuw4RfI8mlEUSlnk+A8KnwxhEu/bL5pEAYkLXe9wXh9xvN17IHYrxL6gjaQQIeqstV1EFXiYbMOCQNunBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lut/MqHL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA078C4CEF7
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774859565;
	bh=75FEs0ybZkc7CPZSVzblsuu4jpTIyJxwvM3fwOTN0rg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=lut/MqHLT3mIfsnrZa/CWojAdKoXSmnhdU8btIJ63M7YiQ12HDv5GyrBtJLFAdjhs
	 C002qK9ZXDseA4vW4DYAl6/jVxIXTtx2oSeLo6BWYbWW+wejxISjWDg/enHPsnBzjy
	 VJqfeOIKb6MiWUC8bcBeUFADGctUrjxGLbXc9eR19JmOy7qX3XxPUOo1sIHYmcO++3
	 TEJYOQaoidN6JNNszG8Z0Duob6VYEoyW+IgQUP8EhzqklUaoYdAwmCnbzVX7NczsG6
	 4wz/2fnDRfykTwyzN5eTyuuf7APY4iOCe0OZNDzVjYzxsa23yGxJekoZHH/HgGORfd
	 ei/68WiIjMNNQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38bd60d7a2cso39851021fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:32:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWME0owBD6Wyo+Z/23jEe/X+OPxI6Ddb//jeFEfCm4YJyZdeIS//cYrSxxA59eHL7msdtp5hzwVS7VY@vger.kernel.org
X-Gm-Message-State: AOJu0YzS4/4lfY8BJaPn8ITOTh+aEBkzrQfg9sOQxjcGq/GTNJ9vPhu9
	sIobXoZPTIzmP/rf8QJ8aK7PSIXY2Fy00sE3R8fIuYRDPTuAnHXq0D4qXtRqI8Tkl++TD45eKkZ
	qrsu2R7KwbbQHS0KW0wQUZ5u4djZ7w2F/Pq04EntdPw==
X-Received: by 2002:a05:651c:502:b0:38c:4b3a:337e with SMTP id
 38308e7fff4ca-38c731277d5mr34532821fa.11.1774859563585; Mon, 30 Mar 2026
 01:32:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 01:32:42 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 01:32:42 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260326-mfd-arizona-irq-v4-1-50c47ed0a18e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-mfd-arizona-irq-v4-0-50c47ed0a18e@kernel.org> <20260326-mfd-arizona-irq-v4-1-50c47ed0a18e@kernel.org>
Date: Mon, 30 Mar 2026 01:32:42 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf4pW9iF2DvCD6AXj6+p9r5Lt1RFs-Ncfb1_Dnaew6ftQ@mail.gmail.com>
X-Gm-Features: AQROBzDIZUI2nf1NyRuAAq4jwxwnEPPBZL2x8h6eRzw_2rEgUS5PZL-0f_UvDww
Message-ID: <CAMRc=Mf4pW9iF2DvCD6AXj6+p9r5Lt1RFs-Ncfb1_Dnaew6ftQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: mfd: wlf,arizona: Add irq-gpios
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34390-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid,microchip.com:email,cirrus.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE5BA35736C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 11:51:11 +0100, Linus Walleij <linusw@kernel.org> said:
> The Wolfson Microelectronics Arizona sometimes needs to poll the
> GPIO line corresponding to the IRQ to counter bugs in the hardware
> that appear on edge-triggered IRQs.
>
> For this situation, provide the optional irq-gpios property.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/wlf,arizona.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
> index 7902f3c5d289..359e40b3dacb 100644
> --- a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
> +++ b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
> @@ -194,6 +194,16 @@ properties:
>    reset-gpios:
>      maxItems: 1
>
> +  irq-gpios:
> +    maxItems: 1
> +    description:
> +      A functional IRQ should be provided in the interrupts
> +      property. This property enables edge triggered IRQ emulation
> +      for hosts that don't support the codecs level triggered IRQ
> +      output. The GPIO line corresponding to the IRQ will be polled
> +      until all IRQs have been handled, ensuring an edge is generated
> +      for the next IRQ.
> +
>    wlf,reset:
>      description:
>        GPIO specifier for the GPIO controlling RESET
>
> --
> 2.53.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


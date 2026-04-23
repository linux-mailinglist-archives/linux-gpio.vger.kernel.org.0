Return-Path: <linux-gpio+bounces-35402-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCX+KzPg6WlemQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35402-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 11:02:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F19344EEF9
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 11:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4978305C494
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 08:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF713DFC7B;
	Thu, 23 Apr 2026 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRza7jlK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E558D3DF012;
	Thu, 23 Apr 2026 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934759; cv=none; b=jqUUI1RdderBVBmH2sdE60naHW/cci0GvcovK87Pb/+4oPpiOZY5tkaZvgVJYxKG54s1ZduGzAnEqIbbKlAM+984t3uIXZ6T8t7qB4G1dOVvJu0xFTO9XfV5nXMnZf1SM87dBnLqqmSBokUKgQF61P+dzaJvnWEDlQ6OTmIt3hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934759; c=relaxed/simple;
	bh=qM9aOHL1OY5hbOBEUJKbkVJXtpe1AMZhfK+XkzruFik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufbKQXs1puzhzkvUDfZMZ+2jFpBOanOKZhMQ1/ZAaUZfqT/YaJAoVLgB+YYT8Wouqxm5K0xPCEHkKQBxbxLVxHJUAS8PH8foLcFhSCMcjJYFQyH3ahD36hnRPSKha+yFqcrpwDf72/EtBWo9rZ4+wXgbjZLB+ouJxklXtLY+xB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRza7jlK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AC2C2BCB2;
	Thu, 23 Apr 2026 08:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776934758;
	bh=qM9aOHL1OY5hbOBEUJKbkVJXtpe1AMZhfK+XkzruFik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BRza7jlKe1TZIGeBnVKHQ06s15gtfyI2KErdCNkELzkIKtaterxh2FsLMAtkFmnxi
	 QSB0Q2G1W/at3FLXt1ozTrpkPJ2thDUxqc76kW7UyGZZHu7VhgcKkYQDCmh1uJ18Ug
	 HbtzbTte+5MJTHXFFVDTZzLbOSph+/2IQ7jbPXNgU/Sh9CkaoFz3/Mt43ZI4++H83H
	 0tK7Fq2FOGt3ezDLFlfrgoNRdIEw9760Gsl3m9CZWHI+BIl6ZVAY+D4CGUN9uBnZvc
	 bnmDiR1Kia0MDR5hYv09o31x29TwVQY8GkSniPdGePJUEKD5zty6Y2W+x5iFx8X0oy
	 tP7/ocPNnOPyA==
Date: Thu, 23 Apr 2026 10:59:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chanhong Jung <happycpu@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: gpio: fairchild,74hc595: add
 registers-default property
Message-ID: <20260423-quantum-precious-mantis-2481d7@quoll>
References: <cover.1776872453.git.happycpu@gmail.com>
 <33d515f13769c685e6811463a14e111252a7c58d.1776872453.git.happycpu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <33d515f13769c685e6811463a14e111252a7c58d.1776872453.git.happycpu@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35402-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F19344EEF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 01:05:03AM +0900, Chanhong Jung wrote:
> The 74HC595 and 74LVC594 shift registers latch their outputs until the
> first serial write, so boards that depend on a specific power-on pattern
> (for example active-low indicators, reset lines, or other signals that
> must come up non-zero) have no way to express that today: the Linux
> driver always writes zeros from its zero-initialised buffer during
> probe.

You can fix the driver not to do that. Or fix the driver to properly
parse hogs. I don't understand why exactly this one driver needs
default registers stored in DT, but all other drivers in the kernel
don't.

> 
> Describe a new optional 'registers-default' property that carries a u8
> array - one byte per cascaded register, in the same order used by the
> driver's internal buffer (first byte targets the last register in the
> chain). The Linux driver change that consumes this property follows.
> 
> This property is already recognised by the corresponding U-Boot driver
> (drivers/gpio/74x164_gpio.c), so documenting it here brings the two
> bindings back in sync and allows boards to initialise the chain once
> from the bootloader DT and keep the same value after the kernel takes
> over.
> 
> Signed-off-by: Chanhong Jung <happycpu@gmail.com>
> ---
>  .../devicetree/bindings/gpio/fairchild,74hc595.yaml    | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> index 23410aeca..c6221ed75 100644
> --- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> @@ -45,6 +45,15 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: Number of daisy-chained shift registers
>  
> +  registers-default:

Where is this property defined (lack of vendor prefix means it is
generic property)? Otherwise you always need vendor properties. I really
dislike a generic "registers-default" property, because this is can of
worms for all sorts of poor DT.

Best regards,
Krzysztof



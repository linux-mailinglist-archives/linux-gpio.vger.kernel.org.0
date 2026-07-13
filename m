Return-Path: <linux-gpio+bounces-39946-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HLo4JEiZVGpeoAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39946-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 09:52:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B63E74863A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 09:52:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fp3vseqK;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39946-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39946-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4A973024C86
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 07:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461F739448F;
	Mon, 13 Jul 2026 07:48:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107673932F6;
	Mon, 13 Jul 2026 07:48:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928939; cv=none; b=nim/j6pyLUSms4p4BE3NMRObTjuRNRP+LdtGiLAzoOpGdoNllkNkSF2/D13vgKo17Owndub5G91ido2kYOXVzMWTe4EmFJB2eOgpcmauP4yu9CB8r+QHPdTxNec1GaRt811bguwqxOtK3qw8Nm9TiKYQM9E9MJfFsMTGEyDVOwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928939; c=relaxed/simple;
	bh=HLORW+XXiV6OA8LqvvwOgOR6CHvebxHRcMvcbvaEE0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSqamJgoD7izVEZ9KKGn7yjQMPsEAvv7t9wVnHnMRxODk+tNGDzWq79f8oKUMqJvwfN7POiHmmEhlMbqUziZLPQSXVfaAMs/7cyqTBdRs2UJpi2tO5/1hmnOS2RV02XbXEvbayWSfDa7BB15AE02AGlSpi78A1Sq/3kOBuqdews=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fp3vseqK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D47B1F000E9;
	Mon, 13 Jul 2026 07:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928937;
	bh=vtYE5RfYHFnoyGWcHHst1Z2VO14NI1Ws98iIJKm7chk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fp3vseqKOvUvObhmR1LYdYwYu8s8SJsyj7vD7WrmhiIC5uR3oqKbRvvYBRs80Tpn6
	 sUtmTlI9jHbOZub9kQWTDURVvbECD6jORXCc7KkVv+lpuO9g47Aceiq62qisAfZiNa
	 Whcqdo+iQx+D793P7E5MJ5Dl8ss7GWUcN8ZHajb3z/VQnjwYxtVVzB74BgogKyBXKj
	 xH+A5yyeGWxQSI1aYrsSV2IDQmfMI85/jI56MNcjpLk69T8BGVurczBwnSdWUtqxXS
	 MgF1oyFNZp70n1g6vzBv38OS0fMXCeyQlcrPv9ZcFBWOtNJMsCDaPXSTjZoLJQv/7y
	 mVNVdSh/RWePg==
Date: Mon, 13 Jul 2026 09:48:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 01/10] dt-bindings: arm: stm32: Document
 STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC
Message-ID: <20260713-tireless-sly-squirrel-04c7e5@quoll>
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711210131.236025-2-marex@nabladev.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:linux-arm-kernel@lists.infradead.org,m:alexandre.torgue@foss.st.com,m:brgl@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39946-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B63E74863A

On Sat, Jul 11, 2026 at 10:59:30PM +0200, Marek Vasut wrote:
>        - description: ST STM32MP257 based Boards
>          items:
>            - enum:
> @@ -203,6 +215,12 @@ properties:
>                - st,stm32mp257f-ev1
>            - const: st,stm32mp257
>  
> +      - description: DH STM32MP231 DHCOS SoM based Boards
> +        items:
> +          - const: dh,stm32mp231a-dhcos-bb
> +          - const: dh,stm32mp231a-dhcos-som
> +          - const: st,stm32mp231

This should be after st,stm32mp157 group and before st,stm32mp251 to be
sorted by fallback compatible.

Anyway, not a big deal, so:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



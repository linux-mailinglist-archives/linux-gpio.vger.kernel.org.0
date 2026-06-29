Return-Path: <linux-gpio+bounces-39088-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rMUhLGAVQmqAzwkAu9opvQ
	(envelope-from <linux-gpio+bounces-39088-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 08:49:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B266D6827
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 08:49:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IajG+TGL;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39088-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39088-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69FA6304E6E5
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 06:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762C939A7EF;
	Mon, 29 Jun 2026 06:41:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5134330E0D6;
	Mon, 29 Jun 2026 06:41:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715311; cv=none; b=gPz5CDVarTIOHGgQYfEiYEdvKJUNPcYRd+f9Hkhw71xQIr5MoP3uP8YJS7W8u0zEiDdGPYFflYlwuhqi9CVYcEqb/n1RijvNGE/VwOCni15ao2rypjAlpWLkH1WW7Xu2H25RthiNlgQwjdGf3RvctYK3lYsEO5mLbYP1iaT4BwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715311; c=relaxed/simple;
	bh=p9Q3AQ3O08ApY1TuKwMa2+HSSsF27yVmOT45tvQiEH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwhIRlRJkVDmCxZvCLluaP38HCR3uZdwelDLTQwL4ybDLkBBM3JNn8HAJLCDwcXghmBH4TM7IzSq5umy1zhVGIkEPvpKcAfna+Y+3QthPpYKQ6ccdVqJupwQYkIoPI2bdNymIzUNrJ05/8Y9OkV2hCpk2PleJIvWJe8yqeLzXSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IajG+TGL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEFF1F000E9;
	Mon, 29 Jun 2026 06:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782715310;
	bh=LJNxsIbjOvKv5Z4KyI22FNEB/VGm79BTV2nCIXFX1mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IajG+TGLQzVGcp/P34WawshYbFzWNQmxMSxCpOp8Tqf4IH8lr0kc4tiJMb9BItj4k
	 vgGyymO1OWFVZu+kmu0PRFuCrrw5Glq+6vsl0JDMb/tTYUXYzge42eLWHHUmSBkjBo
	 piz3hSbHbaBn13GLzMGyfQCeBk20qJ6/gLsCJAAaNwhB8Hq2TS8GOgBoD59QcQHME0
	 7jyQ9oK6I3Nj9lxj9PtAmyiXQ8rgpt+aaUe3//4GvfHnTOtLG2CVv8BcWukwWAPMmN
	 hQRivhOSxw5I9RvjPDxUHUqvnlWCf05hdwHhVr7hvjjtLZpv5atmcHo/r7Nkhk3tq5
	 nFDDAtbJLYoKw==
Date: Mon, 29 Jun 2026 08:41:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v6 06/17] pinctrl: airoha: an7583: fix muxing of non-gpio
 default pins
Message-ID: <20260629-inchworm-of-authentic-adventure-ac9eef@quoll>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-7-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260628143733.273651-7-mikhail.kshevetskiy@iopsys.eu>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mikhail.kshevetskiy@iopsys.eu,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39088-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iopsys.eu:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29B266D6827

On Sun, Jun 28, 2026 at 05:37:22PM +0300, Mikhail Kshevetskiy wrote:
> Current an7583 pinmux implementation have following issues:
>  * pins 51 and 52 can't be set as pcie_reset, current pcie_reset code
>    will sets pins to gpio mode instead.
>  * there is no proper way to set pins 41--54 to gpio mode.
>  * pins 41--53 can't be actually set as pwm pins. These pins must be
>    muxed to gpio mode as well.
> 
> This patch fixes above issues. Also device tree binding schema
> was updated.

Also was updated? "Also" is a sign you are mixing two commits into one.

Describe WHY you are doing things, not what you did. And describe in
details, becayse "binding was updated" brings no information.

> 
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,an7583-pinctrl.yaml        | 14 ++-
>  drivers/pinctrl/airoha/pinctrl-airoha.c       | 99 ++++++++++++++++---

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof



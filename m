Return-Path: <linux-gpio+bounces-39851-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dSQMBhNHUWoGBwMAu9opvQ
	(envelope-from <linux-gpio+bounces-39851-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 21:25:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7C873DBB6
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 21:25:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b="sc/ByBHb";
	dmarc=pass (policy=none) header.from=lwn.net;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39851-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39851-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C85B030376B4
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 19:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DAF383319;
	Fri, 10 Jul 2026 19:18:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5AB1624C5;
	Fri, 10 Jul 2026 19:18:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711109; cv=none; b=JNBCg99DPLMLb/ioCzOF0SWw04FojSXk8UXV2UDEPqVZnNZsagV8eChtxzdUwhQBSQxCSQHH3UD04hrLuJOTnml0ZhcgIP/PvqQcPazqoOvp5Z4gP1iI+yyrHwEd96JBuwG9Ru06pyM82R+q9/w1V+d6Hcqkgu1cnE8thcd9K88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711109; c=relaxed/simple;
	bh=bbbGVvDT5H7FtvjEiaaZkDtc9lF999Xpt6/mPQKukM8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=reC6Vguk9rH+HX6o89qTBYudEX5K7G8dEDj0emFaDkTaPQBGfsEKWWFXl2z2VP7Ll85zS1u4ySd/9sZcxryWqbRiVRYOufjnmp7vFhcfewxdImuSXZ/PnWwTjhE8wkvPdBwFvRaZjnsbMrRskif8uLnCKZmrLA0rAlxY7UdZn7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sc/ByBHb; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2B92E4108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783711107; bh=u7jBRLz50XOFennMDJPizEDrV3JafaPuG6zv01eh734=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sc/ByBHbzb3vKGPF8MSJSeNVG12AIDqUpYMk6kDnNIP9CE41vTZQT+SLKEiE1b735
	 CM0+RvagsySf1yeI46SmBwrpTLVJro2sFuym46qYTIPWBNujb6Id0ey0YmNLl7QjU9
	 iCGjToMZxHVT78gM9IsxbEdTmkLMlbS6yDs+lWPVUufj2eYx32erQfYGPH0wb5Uo3a
	 0r4uES0Lvaq1T+Dix5LZVS0ALmMADxnnHNdD7iu1+kXCOx1KtW2vMUkBka7EMOYFJH
	 IBY1MygOpndNBlwhnOpj8Dh9m2ACC4KGUUlI4KENeP0dtjr/jqAdCtBHMmT6EyPo98
	 WPISVKfkWCYyA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2B92E4108A;
	Fri, 10 Jul 2026 19:18:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yuhong Cheng <ceohunk@gmail.com>, linusw@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, Yuhong Cheng
 <ceohunk@gmail.com>
Subject: Re: [PATCH] docs: driver-api: pin-control: fix spelling of below
In-Reply-To: <20260705070422.764-1-ceohunk@gmail.com>
References: <20260705070422.764-1-ceohunk@gmail.com>
Date: Fri, 10 Jul 2026 13:18:26 -0600
Message-ID: <87cxwulkl9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39851-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ceohunk@gmail.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:from_mime,lwn.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C7C873DBB6

Yuhong Cheng <ceohunk@gmail.com> writes:

> Fix the spelling of 'bellow' to 'below' in the PM API section.
>
> Signed-off-by: Yuhong Cheng <ceohunk@gmail.com>
> ---
>  Documentation/driver-api/pin-control.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/driver-api/pin-control.rst
> index 1f585ecca..80106e44a 100644
> --- a/Documentation/driver-api/pin-control.rst
> +++ b/Documentation/driver-api/pin-control.rst
> @@ -1175,7 +1175,7 @@ Possible standard state names are: "default", "init", "sleep" and "idle".
>    selected after the driver probe.
>  
>  - the ``sleep`` and ``idle`` states are for power management and can only
> -  be selected with the PM API bellow.
> +  be selected with the PM API below.
>  

Applied, thanks.

jon


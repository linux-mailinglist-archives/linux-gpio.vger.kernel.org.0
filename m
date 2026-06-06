Return-Path: <linux-gpio+bounces-38030-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sri9OYZYJGo05gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38030-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 19:27:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEF764DF6D
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 19:27:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.us header.s=s31663417 header.b=PSt62aWB;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38030-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38030-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=gmx.us;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A43153016EC4
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jun 2026 17:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF15384245;
	Sat,  6 Jun 2026 17:27:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0596C2E736D;
	Sat,  6 Jun 2026 17:27:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780766844; cv=none; b=flnjatt22amxt4AO1C0jqRyed6/wC/XS/dtURL+NVnKc85248rAZHVFKqPZBumIJXGrCCgWcIAStFloObxNm7j7SdUvA6T0PAsoM+tivPGqEYE58OEgihStuScs40t7cP2oKNX7SOEf2zB037n4fD1iAWI7lv73q0zOGmKKcO00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780766844; c=relaxed/simple;
	bh=PR1z5EWPWYH6/nHvDd0K+ercJFI963cahAXlCyN1JgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuHleo0gZAbCdjMvqzRqmypIvZcJRJTyUi2XLsDKZpt4uwgycn2e0EPrD9nRGemx0gWNC3izNN++mr7NMkc5kDs5FoioIy7k5CNdvf2iJ84pjlCj27LJtWngVgA2L6wUJIELJe4dEoSlYC+T5dXnLJdhthbYQkL7gjzqwAlsn10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us; spf=pass smtp.mailfrom=gmx.us; dkim=pass (2048-bit key) header.d=gmx.us header.i=len.bao@gmx.us header.b=PSt62aWB; arc=none smtp.client-ip=212.227.15.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.us;
	s=s31663417; t=1780766837; x=1781371637; i=len.bao@gmx.us;
	bh=kv3fYgTiyLEVYcqeDN0B9J+UnGNXF4+JXRxHazFBI4E=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PSt62aWBy+2//WLkOs+oacB6lfo2TmyPgEHeyqVWKeWjZqw4WoJgH5UJs5Ojsr6H
	 +h9QvaMQODPychKhCUB4p4b85rq1oWtgSo614+sdwxon8/IEoB3YsuO8EEbxjCol7
	 jKW/O/cQnjR23wHVtoGwT+0Lc9QSBe0OZhhojf7bf2GDDHf+yHAMbRyvEY0lEvC8w
	 0nKEPfc6e2r3AkwlnJcMjfx5f9yieIpFraZbdOhlGNhHS6uwl1G/9IhZ82V6WFQ8M
	 ym4625tnXQHQ0lYwZSJCz03cDMZYPGGDZfkpirVJ6MZmlBOL71ESpXM+FqtZnnwtW
	 TP+DIUjhjpBFeCEu8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MAfUo-1wPLDh0ehU-00Esgo; Sat, 06
 Jun 2026 19:27:17 +0200
Date: Sat, 6 Jun 2026 17:27:14 +0000
From: Len Bao <len.bao@gmx.us>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Len Bao <len.bao@gmx.us>, linux-gpio@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: viperboard: mark gpioa_clk variable as
 __ro_after_init
Message-ID: <aiRYclMAqbfxv9nX@ubuntu>
References: <20260516100118.42728-1-len.bao@gmx.us>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516100118.42728-1-len.bao@gmx.us>
X-Provags-ID: V03:K1:/36i6BUwPSwzVJxXq3irbe2Xf/fAK8s6gdJ4ZCmpQuUnQ3Chw7k
 j57h8qBAexvnXnBYnYmYmHwwaIlhgzS2SPV3t6FBan2VMWLAFpmhb/uc2UPLQQefkQ30bL7
 R4/kJzmZfJlDHxrafDrOPY/SwplZAP03vCfZkUAOWkyf4P3sRBdXDJZUr7of3t2wWydQC+X
 3CvkVDWyhQdI/yUJNGCqQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fACsGUSoQTc=;rXJnTvlx1ldNSlVIn/MbtH5hRSj
 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
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.us,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmx.us:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38030-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:len.bao@gmx.us,m:linux-gpio@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[len.bao@gmx.us,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmx.us,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.us];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[len.bao@gmx.us,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.us:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.us:dkim,gmx.us:from_mime,gmx.us:email,ubuntu:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BEF764DF6D

Hi,

On Sat, May 16, 2026 at 10:01:12AM +0000, Len Bao wrote:
> The 'gpioa_clk' variable is initialized only during the init phase in
> the 'vprbrd_gpio_init' function and never changed. So, mark it as
> __ro_after_init.
>=20
> Signed-off-by: Len Bao <len.bao@gmx.us>
> ---

Friendly ping.
Any comments are welcome.

Regards,
Len

>  drivers/gpio/gpio-viperboard.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboa=
rd.c
> index 89087fd48..4e6442390 100644
> --- a/drivers/gpio/gpio-viperboard.c
> +++ b/drivers/gpio/gpio-viperboard.c
> @@ -70,7 +70,7 @@ struct vprbrd_gpio {
>  };
> =20
>  /* gpioa sampling clock module parameter */
> -static unsigned char gpioa_clk;
> +static unsigned char gpioa_clk __ro_after_init;
>  static unsigned int gpioa_freq =3D VPRBRD_GPIOA_FREQ_DEFAULT;
>  module_param(gpioa_freq, uint, 0);
>  MODULE_PARM_DESC(gpioa_freq,
> --=20
> 2.43.0
>=20


Return-Path: <linux-gpio+bounces-39155-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YoxZAXmaQmoI+gkAu9opvQ
	(envelope-from <linux-gpio+bounces-39155-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 18:16:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 885816DD38B
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 18:16:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arndb.de header.s=fm1 header.b=YhBpqC4Y;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="i 7aSpo/";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39155-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39155-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arndb.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 296BF3209A5B
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AC643C043;
	Mon, 29 Jun 2026 15:58:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45C43BFE31;
	Mon, 29 Jun 2026 15:58:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748733; cv=none; b=h35ufDrJ4ls053ZBBhSsE2AS37A8B2W7WkxeXXfes0LM+FznY1C6lV+pkK0yQlgPGpTrF+lGTUTYZmXkjuqSPGaV35zbXHnhDzZaGMpgUjNYQKp9oAhFpoNLO2lRn2bSZ1fomjmuSzZz+kyzEb9oJOyD0k+c+mIa0+x9Vt/X618=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748733; c=relaxed/simple;
	bh=d5BwqC0cMGhB/yHU5TajGc8g/0DMChTci91aN6c+LVc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RwbRjv9qfWPU5JgKgQ8EJLh8MRUN28KkX5MWd1cbObRoJfft6vVb3wiOg3nCyoSsU6RnfhEXz6QV13FHRrrEdbaB5JRZYUQN3eQ+2/V2ACmDLRF7SWGNZVx6VHJhK5kMvwA8Oa5LH1dtavARZG2Igcj381zIRoRJ6dXtCPvBpnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=YhBpqC4Y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i7aSpo/X; arc=none smtp.client-ip=202.12.124.157
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B96D97A014D;
	Mon, 29 Jun 2026 11:58:50 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 29 Jun 2026 11:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782748730;
	 x=1782835130; bh=b4ZTqrFakiv/4uAjstRpcZ9hDrTSibG0rs7DMVqbzHE=; b=
	YhBpqC4Ycwv0BCfPTE6bP2vW2pgp1KwJLZkkj/g1r5whxjlzi7CaFfL1VVCcSjhs
	lkgt4iNN9jFeYbrBD1uORU0eSDk+K3GBnWUK7ZsB8TSwegdpXWQQXD58lrbmb/2C
	0aPJqpsnnhh2qwf8+5KOFKCSgUJ9tJAMTIiNfSxpDTImVaxtM98iVj6v8bUObjk6
	R/A+z5KAwAmc+TXoLNK2c2z0Ii+WT2ML4/q5zGPAX37VTfZY/UF/anG2mdJh9wLG
	dK3zvD5L2q367VO6Fk00k2o6FGFeiIyVxTG+p+F2LjqtMQq89lv6+FWXKpJWKK2n
	5Y9QOYzQI2MC1tXQpZgvlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782748730; x=
	1782835130; bh=b4ZTqrFakiv/4uAjstRpcZ9hDrTSibG0rs7DMVqbzHE=; b=i
	7aSpo/XIOC/s549pcAQ+Mg/0UMuanu87KkF2Rh2KRIugHXtPitJEuVnwnm6S5bkg
	LSagr9tpn3EUbg1sA6TGE9B6tDYGftJ929siGZJsvfi7xeQwg42w8wi2iRY8nF+y
	4B7oFg3ZZCLs3dZz7D16XO2rBlx0R0Z/D9HEMoFu/DEnUbyMdG4r7NfIaY+/VG4i
	o0UmLKM1vbFQMZb/YjklvbgaNbUIRYaM7z+yRYRYmwObXuyC0zQoIWN0Q3/d82xb
	eCXoXSc4k4YoLpeoxCe30x8YU9qiHBeYLDoNlSSQAi7PnBwWFcXg/zANqWKXne9x
	2YrTGENYk9CMILmbteDKw==
X-ME-Sender: <xms:OZZCaslqOwGn7tmNE2fDzKb_HBbM8HceKlzJ6N-Q9QRBUrZ_4OvQ5w>
    <xme:OZZCamrhF4MpsMCsSFt49-0i4PcKKTG6CW2hIvuYfZ_UuXucYqv_Zqlv5kY2mVKnL
    JsqI3q7z1vPp3d1s3pEfTG0ACXSr-ehwZ8SyPONe5z9tDDyBGdR3ds>
X-ME-Proxy-Cause: dmFkZTGsmgE4f0lFyTBd5OI1eu1Tfr2ENDvtcElZuiNEeb0W/WVe3ZP70G3sRT/AKzNSvd
    JfRrpWS2/5PlFR451eBtVoH/c2Ca5vnmEoeDw88tUXCxneyhYlTESivrVyDn0Ivw6NnIA7
    VuMpL5vWOdb67CLJ+dTybHsJTlherkrGoMhnvdMLXMkRRwHKI3UIhkaLoquKTlRjJQrnJ/
    cPKSfuQp2xabPtdvC2VX8V10gXQgIaMfbvkPkD4oErRKWSCZKbrYriA9BVRTURF6OjVKqY
    g8mz9xtkwpXBHglKkbafISDO55WPfRXpwvOpzTL+LZKaC7TFfzPDNwsmv7+EPgLxL0fcgX
    p6pYsTe23/jdndpr654Zu5310s3MwrpWBgkzO3tIZh0lT5VUpXNVDuzC7NxE0PkaKZgXy3
    AElLvJ8plrd4dCJxsFhnyr77uJ9Vg1TVfrmTpqZKEL9Mlc/yjJs2o9rijV0V9GykAHEn2V
    SHCNQJhz7uxirmWH7ihCovpnxOmtoOM5VmJTw76YsW4/fWMfdZ3CJQADYH5Xcf8EJ+wNkS
    l5f8CHYJnuPGN0U4KQwj0f++NV+JESIvPhBPiPsnpMczdeT89tZ53mDcuyOY5Q5IbWGwz/
    sXwtubN3E7VpvpEfj1VpoXCl+64A4DKnpR4ObGaHcJo9IGqduSWiBTXp+8tw
X-ME-Proxy: <xmx:OZZCavVfHNA5Oye-HHsuz-FLKY-V16aJUkKZYuTa-5ZGKKS8mi-jPA>
    <xmx:OZZCaoDAkyEbEddIOAqMjAkaz_vkQHlMuWPRLP9XS-fTALvoXPqxUw>
    <xmx:OZZCag06mlUsKX9zdZpz6zvZNB2ytiy39i3XspwRmWEYHKuZbjTrBw>
    <xmx:OZZCaoS8BuPj9613ru8hpq0TOUc6NfRthVBun9h51n6Jg9GNt_kJ3w>
    <xmx:OpZCaiiBngGffy-sm-4IQ-WglLlTYAMcBJ5CVlJTzb-G7Yo587qn7dgk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BC7D5182007E; Mon, 29 Jun 2026 11:58:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Adgpzz6p-dFk
Date: Mon, 29 Jun 2026 17:58:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Lee Jones" <lee@kernel.org>,
 "Pavel Machek" <pavel@kernel.org>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Message-Id: <8d5e4ad6-9e1e-43d1-b555-729bbede4a77@app.fastmail.com>
In-Reply-To: <akKKxHB6RMymG70Z@ashevche-desk.local>
References: <20260629130329.1291953-1-arnd@kernel.org>
 <20260629130329.1291953-6-arnd@kernel.org>
 <akKKxHB6RMymG70Z@ashevche-desk.local>
Subject: Re: [PATCH 5/6] [v5] leds: gpio: make legacy gpiolib interface optional
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39155-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:glaubitz@physik.fu-berlin.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linusw@kernel.org,m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,physik.fu-berlin.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,oss.qualcomm.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,arndb.de:dkim,arndb.de:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,app.fastmail.com:mid,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 885816DD38B

On Mon, Jun 29, 2026, at 17:09, Andy Shevchenko wrote:
> On Mon, Jun 29, 2026 at 03:03:28PM +0200, Arnd Bergmann wrote:
>
>>  	gpiod = devm_gpiod_get_index_optional(dev, NULL, idx, GPIOD_OUT_LOW);
>> -	if (IS_ERR(gpiod))
>> -		return gpiod;
>
> We can leave these and rather have
>
> 	gpiod_set_consumer_name(gpiod, template->name);
> 	return gpiod;
>
> than introduce irregular pattern.
>

Ok, changed now.

      Arnd


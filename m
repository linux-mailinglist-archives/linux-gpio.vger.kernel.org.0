Return-Path: <linux-gpio+bounces-31254-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hi6kG11Vemlm5QEAu9opvQ
	(envelope-from <linux-gpio+bounces-31254-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 19:28:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A69A7C24
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 19:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61CA93002B54
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 18:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693443101DC;
	Wed, 28 Jan 2026 18:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+YfU063"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8A22C1586
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 18:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624539; cv=none; b=g41iIDu5zdWaHPpfymL2NWTMmUusJ64w7wnfy+5cs7xGD0/4t6Uw0j6gXd10Da+j0f0YI7wG4lX6jKho7j0uKbvQI+tD4P/U8DEWTlWmuHBxNGEVbNKjh4tsgVcJMOaO+McxLpXx9b+EXgQkk/cMGingnSk5KcMgugri5GBL90M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624539; c=relaxed/simple;
	bh=RJR1H+iu/kZxlNPuw++tzsBqS5Zwmg3D1lpiK9TTT90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XC8hkpXivkVz9LxMObL6mKaoMzacaj1JveT5bhpDhB83NGKW5SYCiz+7DXz8s1hKov8jOFMEnhtbi6XISkD/lDMOLcNpC1m3xHeWWamBLdWmLiG+SGKOLGe8TYRw8HK2r4CnO1cdGlnt8nWyi5k+hpQ2on7MCx4xpfOkJIAuxqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+YfU063; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b6b0500e06so233840eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 10:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769624537; x=1770229337; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mcVqp2rUpPp/VVSCM0w6MWN1dKIoJLmI0hVnpk6TA9U=;
        b=V+YfU0638w7bUQ6iueg7defpOlgyBmFFgB8fjzOl7BYashOZ92kuqWX+GinYtb0Ggw
         +/nVqDKPSPSiLP+DAdbm4fHBPSmFI9duQJAIk3K0EMibkUukFpqIPXuPn7832rxlN/9L
         U8hX4miVIAwUbwXmiQGwryjWdX5fMgGPKsT1uJ3VJ4lMKt8gwyEzqP7x2u6eITX5dEQo
         ZDjz0WmeO5Ajk//zlgz0kIn5Z1r+eHLMdZ6nLxIOIKZdIMu06WpsnxP37EkeJx/bT0Pc
         hPGo3FfDRz1RiFWXwLu1Q/oU+jE3j11xu0OEx7fuqWX7g8GrLap7OoQdYIAVN6wlkeFt
         9K9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769624537; x=1770229337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcVqp2rUpPp/VVSCM0w6MWN1dKIoJLmI0hVnpk6TA9U=;
        b=sG/MXr8NnOiZwH1IwQg64IDbHAoFeaCJLWotgoo8/sFjhAL8GmxQGXunyjEtbek5pc
         gNcuDNWCifojK+aIYzKdufeRzTf3lF/ltOUOBihDCIi3DKLtXXhTAqiLFr3c+sXqPHe9
         HQbM0FfH1SkWjKlArhd9Qmg03vesmJ6iOQayERV2O4vv/h0VFzTibt7M6kL8+CT4ObWe
         N+NCvH8GJzT9NfFpAlym+xnwb/NnDK3JKKpD4q0T7daUMVJJqcin0eqzcoLl2VOK8J0y
         EWds1SPn9m6qFgIuIXlLaBYHqkm9JP3y4B7+WOJUBk79lkBAHeZlbbYqW7gRPnZacsoC
         +oNw==
X-Forwarded-Encrypted: i=1; AJvYcCWyeEi3vj4W40654Kj6i+SRu1bZ5qmOTuaOtiMR7dWpOszoHDUOqN9c2zS0/TtJydzZn59krlOn1CEm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5935C/ivmottjFGgNX1mF6AJh0zCHpRKok6MggjqoMEQXJpWa
	hAsEwWuYlWK5cXZlp3Mt2VEOf56dLWasjPHS9xgIDldHD3U3UmIP6GKp
X-Gm-Gg: AZuq6aLz3tXUExMSMqgJZ/LgtfSdBTq45yBmeVVinEpQb+EcJ/GUvUo7STwtWNYKAc9
	eYBH0twPG13IT6eXbGtnp0UvzWobYhUgf9Q2SUx/3JN1C3gekeTb5xTdlPOhw/K2KWJEHSpXOn0
	QtZYXk/jrM0PIb96ktqV2iLZVhcuQVl5N0rlRNcXxn5fD1falojJgAbDTH7jyoOic4IlZILyUsj
	n7iB/bCczVIbZ9SzvuZ9w75zVNg7/ogXXJMYsNjSXA+ka5O17cf88eBgyWrzVgIunps0eNmxSjj
	bJvyhEbBp2fBeEV2N3EGGEsSsNLfLxpfj/AY0uiC9jNU5QDSJlnv92tJEodhwjW+MC/3mxDghDy
	uTQ6WeY0HA2TrxIX9PJWVhwVRyNGqMxKIOxlxLbPNZnhLlUpU/VHJ3KXEwWJuJ7bhsTS4SM0n5h
	CJbeENILWZevF/wceQNiVat8Ek
X-Received: by 2002:a05:7300:2314:b0:2ae:59d3:46d3 with SMTP id 5a478bee46e88-2b78d9d54ccmr4405093eec.25.1769624536911;
        Wed, 28 Jan 2026 10:22:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cfaa8sm3543912eec.4.2026.01.28.10.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 10:22:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 28 Jan 2026 10:22:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Message-ID: <e2208717-0f47-48d6-9cf2-20196e13a3d0@roeck-us.net>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
 <eed64bf1-93af-4b36-adf5-1476cb40edbb@roeck-us.net>
 <382e259ea3835ffbd2be9c36b529875f5a43f38b.camel@gmail.com>
 <8efa188b-8b91-479c-ac10-3fba5b0cbb5f@roeck-us.net>
 <02b7cf63-4f87-4cdd-8d9e-53a7d0e808a6@roeck-us.net>
 <e5b775065b92cada730f42a3d60546700ec46db9.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5b775065b92cada730f42a3d60546700ec46db9.camel@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31254-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,roeck-us.net:mid]
X-Rspamd-Queue-Id: A4A69A7C24
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 06:07:24PM +0000, Nuno Sá wrote:
> > [ ... ]
> > 
> > > +static int ltc4283_read_power_word(const struct ltc4283_hwmon *st,
> > > +				   u32 reg, long *val)
> > > +{
> > > +	u64 temp = (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILLI;
> > > +	unsigned int __raw;
> > > +	int ret;
> > > +
> > > +	ret = regmap_read(st->map_word, reg, &__raw);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * Power is given by:
> > > +	 *     P = CODE(16b) * 32.768mV * 2.048V / (2^16 * Rsense)
> > > +	 */
> > > +	*val = DIV64_U64_ROUND_CLOSEST(temp * __raw, BIT_ULL(16) * st->rsense);
> > 
> > Does this overflow *val on 32-bit systems if the calculated power exceeds
> > 2000 Watts (approx 2^31 microWatts)?  The intermediate calculation is
> > u64, but the result is assigned to a signed long.
> > 
> 
> I'll have to double check this one but IIRC 2000W is not a realistic value for
> these applications. One thing that could overflow is power_max given that the default
> register value is 0xff but we do write the proper max value depending on
> rsense (I actually need to check how will this behave in case we use a default
> rsense value - ie with no DT property).
> 

I have been wondering if I should introduce a hwmon_power64 sensor type, similar to
hwmon_energy64. WDYT ?

Thanks,
Guenter


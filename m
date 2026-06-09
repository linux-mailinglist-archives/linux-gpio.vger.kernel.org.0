Return-Path: <linux-gpio+bounces-38193-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eaKaJ2A0KGp+AAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38193-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 17:42:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 087EA661E82
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 17:42:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Wg0j8zQz;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38193-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38193-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 781F631F36DB
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 15:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD8A48C8A1;
	Tue,  9 Jun 2026 15:30:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0901A48BD3F
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 15:30:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019052; cv=none; b=O/ABJHBLfVhv7o5i+YBTDMzZXgXNieu5DUNVn+bAsb9qXxq2nK3O37PGmA5p6d8Gfkbqkfd0MWVt1ClRT97xt1C5zS6WIu0Ho8QgO3s/z+OxAwzS/8PPWba77yH2OwE3vGaqZKZHCmF1kCawH3MZ+2KLwLi7PMEYcaJyQKis9lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019052; c=relaxed/simple;
	bh=11WhgqEt9zgT+ZWXS7ElY2GogLk4HG1AB68dGIPIaxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uO3akO8kL4+98SKgwEIGPWPbGwhB1LEkLxV1hXg68ImEhOAx5vbjI2CAf3LSlmWuISzunlz1dZkZRtARdx4gHRfduHPcRskm1faQgbczMRTe7G1LNg8Y7yaISEbj5AgiAueLZe4WwVKGkv1G8I+Da6NPML8ve6tKSIJBU5EgBXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wg0j8zQz; arc=none smtp.client-ip=209.85.210.176
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8423f420455so2409121b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781019050; x=1781623850; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfoL8NhaievxojnidDqV0SnsthszxSn+iRp8X4DAOXY=;
        b=Wg0j8zQzHW+KSie6yZ/U++pU00g4DfbwbKgfhdhwDo+L8alXDCAoKCDwdR35iNGHd3
         NR9fXMEv+dCP+Ye8xUVd0lPBk0DvAgflS9t4X4JbxNBlitoSjqihqYgL6It5FfZOFVaT
         OzuVWZvpt+IJzRLTUitlgechxgoDbhqVGrpQk+L6fCH/R3/9WI8ojLk7a1aqW1XpLur7
         LvJerYtEkxvA6LhVp6mEp8ZnDdsq6LN4vYbcUnbbSl41KCpiDgPVDbQn7RQ14sO3ke2S
         TdVx1J+/3Vj2xx+YTWx4flEGhJgQEuipu6YUfq9FmOTQY3wB95M/wirg6gH7DgjXTgnC
         rCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019050; x=1781623850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfoL8NhaievxojnidDqV0SnsthszxSn+iRp8X4DAOXY=;
        b=BD1I4jXItTR2fo0zOMRZheoPUZMJfbiUnPHoMWfvtE388E3KmGllqMM3C89v4CvZbJ
         OwHJgg/eY5E08uV8hsOeh7jelumylk2skIDzeKyfQnyQq5C2GSk+uQeVueOL/zUzkKrL
         WBB/GrCk3MlJE4ra9rmUwIdIKVGHccIcbmPNzL36H7LdLwsgeA1WYC7mSeULTLZZUbcp
         tisVNmUdixiAT4B9qTZ9fQh5p73qboAD3Hh4PxKqVQumrXE/7Lh6acC1BVGINQB8lB6T
         Swfpm+NGseLnRI9L9rbXd5+GBy0yOdxyLy9FItMVNcVc358ikihwoLcdvVOX4Ht9kXjy
         HAnw==
X-Gm-Message-State: AOJu0YwkTThwfnMEGKD+6XzcswSiHvD683D69pQRjhd08PfsuGTcN9Hj
	KHfnLdVWlcXDmPgkJgX+CnHsgdfGetz9S0y9pLIhJpWdZEbcYT0rzPir
X-Gm-Gg: Acq92OFDcPqORSt+hc0rfunmsZyz1ad7YDepNL3J30cFw2QsFLkuMI4MERvOwctvjzJ
	BPp8Yw9WXCc4yxce+uw4Vji5vIv7f5almWfsVUXrYFyhPRsFriMjTC3gWf9uh7hi5v14yIW06Pj
	NXJ3qKNmXJmIuIWqlGECSgZvQyLX3EEdy8j6hdqNb7UgD//D0GjO5YS8mmEdd11UE7ioc04L8A7
	7cm3dFqfE79MhZcDfSU+6u4EvmaMXL0jBmcIH9BA8jQUghtyqViXFJi7lBajpJKUbkOReXGhHnW
	LLy4CzxJrfCzyobIoYMbA/NaddN97i/G/gj1PgULMItBdT6IvsC3xm/KrH5V3HPrE4U1t4n8II8
	eUruOjAGfwLzCbwxpHrQVXrs6qUagv/tHWIKTorEVyMBRS4zERfphzPMOAGXJUA22Ul1umgk0jx
	uZQyv8oKnCpDOXM4qW2MAYvHqwuPXvOgeHTQdC93ikfgMkBx8=
X-Received: by 2002:a05:6a00:928a:b0:842:5a8d:3036 with SMTP id d2e1a72fcca58-842b0fb6e13mr21005108b3a.35.1781019050176;
        Tue, 09 Jun 2026 08:30:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221c3e4sm22494788b3a.5.2026.06.09.08.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:30:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 08:30:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v13 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
Message-ID: <6a33cc01-e6a4-4e3b-a629-66fda71d8ef7@roeck-us.net>
References: <20260502-ltc4283-support-v13-0-1c206542e652@analog.com>
 <20260502-ltc4283-support-v13-3-1c206542e652@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260502-ltc4283-support-v13-3-1c206542e652@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38193-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nuno.sa@analog.com,m:linux-gpio@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:linusw@kernel.org,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,analog.com:email,vger.kernel.org:from_smtp,roeck-us.net:mid,roeck-us.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 087EA661E82

On Sat, May 02, 2026 at 10:56:54AM +0100, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> The LTC4283 device has up to 8 pins that can be configured as GPIOs.
> 
> Note that PGIO pins are not set as GPIOs by default so if they are
> configured to be used as GPIOs we need to make sure to initialize them
> to a sane default. They are set as inputs by default.
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter


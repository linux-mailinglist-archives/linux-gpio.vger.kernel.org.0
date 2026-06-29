Return-Path: <linux-gpio+bounces-39138-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UWIJNQ99Qmqv8QkAu9opvQ
	(envelope-from <linux-gpio+bounces-39138-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 16:11:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F866DBCFB
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 16:11:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=b6N14rdQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39138-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39138-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 549B9300F163
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 14:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B573438B8;
	Mon, 29 Jun 2026 14:04:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1F534041D
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 14:04:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741887; cv=none; b=UkGtS295o/e5ElhIs0km1WX1pYaCg9iK+lS+XwjZaihWmvFEEP8zRPFDBMWf3zP/nBJcv7o7XVu+ZafOBf95wFHUlevQMFNPyqqgr0zyQ8/HeFxZzgCm/Ro9csGyUBT7l9rq1HZjjDyuVWQI5wf4XyNB22a/sbhYEfpTelX2bEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741887; c=relaxed/simple;
	bh=eM94XiORNR7HRfYmg/azbBR47LtEaqbQ1nDgo9u+pKI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nD8qxoWpxTV7x5pFcUFVIISnAV7N/7MCkJGR8H9d1g9GJuR87pFx7mABjEQtTyCnWtFqWyGbSsR+C87izD1E2gGRvXLbpFzwT4yC9+3amPhG/Cugb/hozOA9mZEtB+QHNbecmN6rmQif66yRxDSHRKEBpUFQ3p+b/FjT+ijvyLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6N14rdQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D4E1F00ACA
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 14:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782741886;
	bh=vOQVmTnOqXHn4PuUAcp6rx8idGy2KOJcL7zd1Hwu8No=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=b6N14rdQ6uSJSJmggc2yv8AsMueAEqStiFzGJc0MP2/X8rCR7SNOLvYRY5I56yLNe
	 TMMtZlb1YRNcz7565QIfPBHF8TzVhk4kENrxKRleLbd2cfylkhZyeGkRtcWJBK0wYB
	 nnX8iaZPU4M6Iv7DfTBEN7tBGHul0VSS53EuJaaWMG8+jZcHD+/JLIoCCzhRP73S+0
	 F/SqaJcYTsropEaw9zUeL4/ybnU6Vlcf39P+tFXz3OPXwM8i6uegYvTgxjWxdk9MUs
	 3ysBNe1RACkDQTk4hCAMotWO5axymwnycsG6VvPv/4ZSQy12wJIfynaLS2Z1EbqL9C
	 c9gn0LJl9LtMw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39977ab0562so28703461fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 07:04:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RowlMysXUara6bBwB2q5F6XWMK9G74Q5xZ71FwSKovQCkW4kNGEUJckkEVT6KebfpP47WVZFhn1iicq@vger.kernel.org
X-Gm-Message-State: AOJu0YxXtR8rdtmZyek67qUuq1CAPe/gVnUQdHS2rv5lOzdCFE1Z9qDz
	J9K9niYNrULG/NKNRMt8FxAioWUwLpxKPq1xz50EmoPztv3rpwqYs1+D+TTjX4MbZdJP5lcP7V0
	aTogV2KrUo9yu/nc3NyJuJdPap+GywGcreI8ZHyIEMA==
X-Received: by 2002:a05:6512:4616:b0:5ae:bbe5:2076 with SMTP id
 2adb3069b0e04-5aebbe5217cmr441330e87.52.1782741884978; Mon, 29 Jun 2026
 07:04:44 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 07:04:43 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 07:04:43 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akJu0EFRFUjxaq34@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-gpio-swnode-drop-label-matching-v1-1-db1af36cf883@oss.qualcomm.com>
 <akJu0EFRFUjxaq34@ashevche-desk.local>
Date: Mon, 29 Jun 2026 07:04:43 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdZeUEMh28_NCNo1k02E3X_A2tUsv6YuUUWONPoy2nwBQ@mail.gmail.com>
X-Gm-Features: AVVi8CcryFDIK43ZZ9c8MhZm966Ba32eBuqgRE4QmXL2Y5h9v4WMcby9TJZbZYg
Message-ID: <CAMRc=MdZeUEMh28_NCNo1k02E3X_A2tUsv6YuUUWONPoy2nwBQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: swnode: remove deprecated lookup mechanism
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-39138-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,intel.com:email];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:linusw@kernel.org,m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:andy@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49F866DBCFB

On Mon, 29 Jun 2026 15:10:40 +0200, Andy Shevchenko
<andriy.shevchenko@intel.com> said:
> On Mon, Jun 29, 2026 at 12:54:58PM +0200, Bartosz Golaszewski wrote:
>> GPIO software node lookup should rely exclusively on matching the
>> addresses of the referenced firmware nodes. Commit e5d527be7e69 ("gpio:
>> swnode: don't use the swnode's name as the key for GPIO lookup") tried to
>> enforce this but had to be reverted: it broke existing users who abused
>> the software node mechanism by creating "dummy" software nodes named
>> after the device they want to get GPIOs from, without ever attaching them
>> to the actual GPIO devices. Those users relied on GPIOLIB matching the
>> label of the GPIO controller against the name of the software node rather
>> than on a real firmware node link.
>>
>> All such users have now been coverted to using attached software nodes
>> via the fwnode address lookup path and the kernel documentation has been
>> updated to recommend it as the correct approach. This allows us to remove
>> the old behavior.
>>
>> This will allow us to leverage the upcoming support for fw_devlink for
>> software nodes in GPIO core.
>
> I am in favour of this,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> (but I prefer cleaner diff, see below).
>
> ...
>
>>  fwnode_lookup:
>> -	gdev = gpio_device_find_by_fwnode(fwnode);
>
>> -	return gdev ?: ERR_PTR(-EPROBE_DEFER);
>
>
> Can we simply leave these two instead?
>

Honestly, that's just personal preference. I prefer the oneliner.

Bart


Return-Path: <linux-gpio+bounces-37846-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZYTpAT9UH2p4kgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37846-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 00:07:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 936AC632589
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 00:07:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H33pAmsi;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37846-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37846-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCF42305AD1C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 22:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E213AB47B;
	Tue,  2 Jun 2026 22:06:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEB139A061
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 22:06:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780437982; cv=none; b=X4xZE06JKSupIk7qN7esqY/ezaCSuknk2gcyCWVXjLNorg6adgLZPclE0FgEHzVvy2GcRJw4Zk5JOFynl0mf3cF8lCA4qzi58PgLSqI5UtJl6LtQTODS9piGOP+TR84KMToRRJ7c+T7VZi1h9vJl8zZHlQHAPbDxp6gooq//AH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780437982; c=relaxed/simple;
	bh=6bFM7RnBqOusxScs1N1KTjygnjpRTHNuBBIsjnLMCIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2IdFineSoAl9uMmQTJzc98UE2ZThLmLW8Ted0z3UnZ/SiDVjbVUKGprOzKIXiUrFNbz2gFVnsItjhpGNiOHDlg6XJ6DGCh1CEJzkrBpbfASpk47blamtn1j1dQJ/OThme0Ka/HK06l2mwnWmPMq7uWSfF7JRhErwYLMiN7VCY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H33pAmsi; arc=none smtp.client-ip=74.125.82.180
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304cf518c9dso8690240eec.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 15:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780437979; x=1781042779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=83NdS9WzqEj31Fng8v49SeEyE/axOdCOAa4Coh7yKjE=;
        b=H33pAmsisBQDRPLsbYm0cVUb/O53TYIcxuMSb+61rFH3b0zvPP6/PnioK97SW5iJnV
         4YvyXFmdo9/4eqMSyeQ88KLMwpLE7iVwCRq0qJ0ibhzhJz22slGn4EI+ZGCkQrir8sd5
         AhmkwAuwn4e+z2Yjm2lwkTUDfcowl62HYkiK5MB2uioh8RzWfD9m+iyw/WfhiUHrYBiB
         9OKyGq64X/VZxOmCgupXrtPi3frs16O2ypOwKmi9vxRDf+onlDy1Nm9of8ioiaVA69Z3
         aGFpWyazAIHu5LceGB9vdQXSGlqGwn3Y6WvMTWogCJzmcrcrAktKSQVxCg7Vl+3s4kfz
         Yslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780437979; x=1781042779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83NdS9WzqEj31Fng8v49SeEyE/axOdCOAa4Coh7yKjE=;
        b=FnZMPkorSXNyEoAxD2kAxSn9g1f/p82qMzqF1th+Sawp6mGmxKdCY+YcqFvQjo6d4j
         5eVWdTPiF3OB91peLXtacBPw2dzm85OkB8YHOmbCliwoTZmB4jeBA80BruMEenKjYyxs
         bRrhVxHgt4uCPlxtXK2oQpttPL3cG4VME8ExwIHxK+nncX4eRmhOdqRDgRM5F+jPULQN
         SCVsHf4LOCMT8PKwYecUFjX2kLoXOXJA6nLJZGYs3px6YxiTWoam1EfCDli0Blnr+i+C
         oIVuDgD1fFuL09WzU+IWvNlSeo5k16YbFDzEcZp0upO8r8tFQKI/bkkUmiFtCAQ4c/P3
         DVfw==
X-Forwarded-Encrypted: i=1; AFNElJ+H7VwG8Rx5vq/L74Py4LWWTraupPajoKbgMLLB6iHYsi3rkN1V2RcMrfEM0407JVWZjSumoB+LQ3c/@vger.kernel.org
X-Gm-Message-State: AOJu0YxW6KgPr9rFhZCWPYuHwPBxhyljQMHOKhHKPbjIoUOKY2SJUkmp
	Z1YIlJFSXQKpNm26NPpHyD0829cTFFkq0Ltf9ONCrtd08ASm1lT3D06m
X-Gm-Gg: Acq92OFSwJa2z6OTlSK1g9Bbx44K0UVIzP8KWQJsm5hifd4MCMmnW+t8Q6Bs9R4jEOB
	yqa1DRYkQa79v5PHYMmOSDlBAd31tR8+vEV/4FkwZHMQQahkONdqqAl3ieVTNPyMJMn7PJTQ6DV
	Amk72Fioxe2S2XkLeqMppJpYYvdl5GiwzFIODz+zcuSABShzzDx6Ma0bTADxPDwFET0gMoK+42f
	3FX+ww+G6E1nlofFKuSKpuBENLCvTOG8RxqGtBYYrf31p4xF13kGHOUSIYhD4mmRIPHBxJWvd28
	WXL+a7azdqWguiQh1cKucDpi913lk0opshOdZq+2qkX2QbbMvaOgcLn4JqHtWK+mNIAy2jmbTZQ
	drCYW0SD5Zexo2CxqXF9fxmSoihSjsamY5rn3t0Nx4+6lgp0fFJVnXGeD5ouaN91Y36bZokFhHY
	I4UKf0LSfknV2tPVGAvOlMqvVlrYBbNL6J6bhMkd8PAuS3ndd58usbQr8Eg/UYVdmitIx82HWJE
	ZI=
X-Received: by 2002:a05:7300:7252:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-3074fa79f08mr317280eec.10.1780437978893;
        Tue, 02 Jun 2026 15:06:18 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:c4f4:520b:1304:b259])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dfa3a2asm1102723eec.31.2026.06.02.15.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:06:18 -0700 (PDT)
Date: Tue, 2 Jun 2026 15:06:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/5] sh: mach-rsk: rsk7203: use static device
 properties for LEDs and GPIO buttons
Message-ID: <ah9TXCcBPNh77Ut5@google.com>
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
 <20260520-rsk7203-properties-v2-3-465f3308021b@gmail.com>
 <ah9TEJ_jrfcJwrb9@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah9TEJ_jrfcJwrb9@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-37846-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:ysato@users.sourceforge.jp,m:geert+renesas@glider.be,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 936AC632589

On Wed, Jun 03, 2026 at 01:02:56AM +0300, Andy Shevchenko wrote:
> On Wed, May 20, 2026 at 10:13:19PM -0700, Dmitry Torokhov wrote:
> > Convert the board to use static device properties instead of platform
> > data to describe LEDs and GPIO-connected buttons on the board, so
> > that support for platform data can be removed from gpio-keys and other
> > drivers, unifying their behavior.
> 
> ...
> 
> > +	for (i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {
> 
> 	for (unsigned int i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {
> 
> ...and drop the above definition of i.

Why? I do not see coding style suggesting this. 

-- 
Dmitry


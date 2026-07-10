Return-Path: <linux-gpio+bounces-39797-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ch2yBrSwUGoE3gIAu9opvQ
	(envelope-from <linux-gpio+bounces-39797-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 10:43:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 639F07389B2
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 10:43:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=M8fWec8t;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39797-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39797-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99AAF30075C2
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 08:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C35F3EEAE0;
	Fri, 10 Jul 2026 08:38:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73383AEF56
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 08:38:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672691; cv=pass; b=t9OHmgQ2OxBYsxv7PQbpzBr8dk3FiOulAEy5F2tZ6pJffXsJXiQkN9wYmgmhDlhZP6+0CyHT90xqc0hvuHwkJgCCWLPVHPV5GTOn0nRO8QF7PXMeGi/QQZ1wwXWaVZEARsRT8oxmYnBl8BHgUCFMl7VKs3HURQgGgA9DYmH9QSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672691; c=relaxed/simple;
	bh=sg51iyKLuA9elMxp0JAp7EJsh+MA/vO8Ah/bMdRkH1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dV1HZBgI6NtEoTeU1jbASEsC2df0BpWqvIyokwO888Tw3akxG4scH5c0/SiclO3UakIzy3E+K4plC1F9GEsyx6eix7kkSfgwdxxd1Do2XcPGEC4a5+qLAywqO+VHJXPHtDBD4rmQ5scIp/0qPqfnCGKxwagba4GNri5AQaY4v+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8fWec8t; arc=pass smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso358191f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 01:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783672688; cv=none;
        d=google.com; s=arc-20260327;
        b=nfXvWSZf5qjfslxlTEJADqrqkFLTLbM6qPqOVEVG77x/jWUYVhhWoAimZePwtODdcd
         CFIW+Mv+yhl1BxpayIqNMZppx9IW5xeoE2BQbYpWWh0oR9cjqDGIpAru9VeEJRiNpw6+
         9BcsBTEn8p2oLrGi5fvGo6VYtwn3TLURGteD/LIkNj1DxwdleIgEWaeTIf6CKZOtQR7z
         4A35m+Jj9sqRc0/QM2I4+3QiZv7NBIqrsjWdXgXO0+3Fug9bKMtk2REi3tCqKy7cIt44
         u8IND6fxopZWbRhPC6QJr8Y7jny81u+GT84DizXogchzerUhY/SHW/CmCFaVANloH1iz
         cQDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sg51iyKLuA9elMxp0JAp7EJsh+MA/vO8Ah/bMdRkH1g=;
        fh=vFAzA06KFTBj/O4duEKaVCFH1KzUmb5wxY0ia22WKjE=;
        b=dKbJX9+83OPk9Gqki+MtRRP/ntR+VPjskpQL58psfMO4SAcEHwi8FRfOA0D/SxcP5t
         iq8T6hH4JrO7+so4gSkaoFUIXqyih0KFmH2aalEOctOiYzzkH9D/FUk67A8nyg74HT+I
         TDSFKIpcoRSDer2JvjJtQWIliRVx+uG+RMyyVsPZpb6AvmOW/2niKLfNUPMDSOJxi7Jb
         8Ru7RoHIzZRQbUr0H+DJerjnK1t6uW7vWjEbX/k0LC/2KQgJTNR+5wZkCqa/YquqJxcq
         VAc/oifEf4h9gF+hfypjWqsmx28Mhuh8evUk0v8JQnzD1qABGz+AvYIPKEMuQxjz4X0I
         IeXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783672688; x=1784277488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sg51iyKLuA9elMxp0JAp7EJsh+MA/vO8Ah/bMdRkH1g=;
        b=M8fWec8tarRxP7f2gKOuDsYKK+Q+tzO4Ens0EZdoVOdFk9izbzMtbUV4Fj1J7iWxpA
         4qHzAwmnmC5dT85c/w6FPbieX1fiOo5TBgx+JcNOIZnhy5f7IgYQVCZJniJO+EGj/QQk
         V7BFyP3xpcgaUtu0pJd3vXXCRkw0U2eeLD3/KOkC6MfwkrqFQclNpxan9YPsLxr2XNBA
         ejo33Y8u0YyUh/bhiCcxAevM6nP7qxik2T16lMD/Slzobmv9nU0yuksCS5xOqY00e2uD
         MdVxQiTpbl48A12E6K2rI3o1Y5RE5/oB5vV3tpGQqkfxX9reX/Mtvwwj8x/RYPvv7h1y
         +hfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783672688; x=1784277488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sg51iyKLuA9elMxp0JAp7EJsh+MA/vO8Ah/bMdRkH1g=;
        b=HwYeOm31fdvCJXc3t9LBz/IhYyS0TpUCkm3LERjMEckTx9//RZ8fzxudLhLyxBzBE7
         ieuiVm71PVKYMOwC0zD1vzD6/14PNduypv05rruAIR+Gatlh9Vj2VSnv+LtkHaJWm+KX
         BuJr2Bm4rzrmWWTv+dRe5lhy89JkhuYk+XLBH3pZp0NprTLQd4lO097SBCG7UPkzwqiY
         osPsKQ8hJLGDdiljmjGmVMaktEfMGJ3yT++Jg78NaGCswfThtByuy42BAo2+QFB/oO/9
         LH3aSBE4crHKf8Ul4ULCilKdqMjMrG4+9PZCpsl1U0aVbkHGSnm5nOdSM/RcgROBu7pK
         49tg==
X-Forwarded-Encrypted: i=1; AHgh+RpIqUaZHU8zWFZFFR3/+X2pMJ/kILwVdpFcRRy2Hz/2+HMODIfZHqHwYuQ7xExB45A0OMhP2pUcMtFe@vger.kernel.org
X-Gm-Message-State: AOJu0YyP3M/QFvVfEgZM8H/RNQ9YNW33vvUJlek/DvSp6DCPZxsO4+VQ
	asIwBiA2EA5ctjFSl7eCLTDwVs8T31z+dGlJaIk9tX+IT3DHB2tm6+CXSFXMcdbN19FZxk+WYAR
	sGMH8kJaXzJrTz4Mn5FHnJDoUews2R8A=
X-Gm-Gg: AfdE7cl8ctkOEQ4OKFtRtbrMYGfzZDWnxKBU7udCIKGeim6tqzxfSf10gbuW5Z6ZTWN
	j+PSbV9FH/nUYJR32mqGRUskhBmIqOceLB2IK+lOgfHFwaArAAr5evpKhESG4uJLzcbfjranS6l
	YaeFetTMJD3829o3fLSkqIkwG/tH/jAcMMP9CixHNIvmixTrBuk+7I9XZSILZdgEY8deLEAIAO0
	ZP16QbA/UxJS8++MV26r7kUTu2l8wGT9j8EfZqNGKVSmorIjjMUgDdGfUwWDFptUAe+AqjZ6nk=
X-Received: by 2002:a05:6000:481e:b0:47f:25e5:2f14 with SMTP id
 ffacd0b85a97d-47f25e5300bmr1645044f8f.29.1783672687837; Fri, 10 Jul 2026
 01:38:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alAJJr5ATEZdHBBA@ashevche-desk.local>
In-Reply-To: <alAJJr5ATEZdHBBA@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Fri, 10 Jul 2026 16:37:56 +0800
X-Gm-Features: AUfX_mxjFR83NZqIumwsitpjOBz1jpUe2367CguwXIcxYIUoKA2eoT3gDXHV2Qk
Message-ID: <CANYHO6rgn19uxjmc+1xv-pmadZQ1EaePmwvC3Kfy-E6ckwcYqA@mail.gmail.com>
Subject: Re: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
To: Andy Shevchenko <andriy.shevchenko@intel.com>, JunYingLai <junyinglai@aaeon.com.tw>
Cc: Thomas Richard <thomas.richard@bootlin.com>, linux-gpio@vger.kernel.org, 
	=?UTF-8?B?SmFzb25IdWFuZyDpu4Pku4HmnbA=?= <JasonHuang@aaeon.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:junyinglai@aaeon.com.tw,m:thomas.richard@bootlin.com,m:linux-gpio@vger.kernel.org,m:JasonHuang@aaeon.com.tw,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39797-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 639F07389B2

Add AAEON software JunYing.

Hi Andy,
yeah the ACPI flag should not set for HAT pins, JunYin knows it,
They clear the ACPI flag from the driver now, their BIOS uses the default
from CRB, but they should fix it from the BIOS to match the right usage.

BR,
Gary.

On Fri, Jul 10, 2026 at 4:48=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> Hi!
>
> Since I have been playing with the $Subject board, I wondering if I miss
> something or the BIOS configuration is utterly broken. The problem what
> I see is that most of the pins on the SoC are marked with [ACPI] if you
> look at the debugfs 'pins' file for INTC1057:00 device instance.
>
> This means *none* of them (which are user visible via HAT connector) may
> serve as an interrupt resource to the OS. How the OS should request inter=
rupts
> on those pins?
>
> As far as I understand that the BIOS does initial settings of CPLD and
> basically I can use transparently the pins as per their configuration don=
e
> in BIOS. Right?
>
> Btw, do we have any contacts to engineers in AAEON or whoever who does th=
ese
> UP boards nowadays?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


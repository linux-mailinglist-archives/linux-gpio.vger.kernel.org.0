Return-Path: <linux-gpio+bounces-38315-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NXehFLRxKmq/pQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38315-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:28:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA4566FDAF
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:28:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fbmgWIbh;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38315-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38315-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 621AD30060BE
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 08:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF5A3B2FC6;
	Thu, 11 Jun 2026 08:28:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B254C379990
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 08:28:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166493; cv=pass; b=UcQoyivKaAzvqp+RSznOxXnXb84UhNQaWEl5qhrMJDeo+CC326p6PZGdW1YrsNjmxEYnFz53ZHD+qgSVifhAWsbK2+r/GW0WuhlP63/vB1aAj0i5F7EW/BYvRP75wKd0zX7otd4bXttrVB15paL5fb/QYc/6W2mce0bbq/8TN9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166493; c=relaxed/simple;
	bh=PWMKMZe1NWOyuIhes1FGWwGQQNhwAa2TcR091AOfTzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0zIgb3zNfJWmAuCSsf/FFB/u7TfyBykYUnQ6CTd3nFcoSz3felwf6y064HOMwDdNAwxbdTeLBUMAiiJ4EpJ6+Z9E7CxyU9cmk4v8HEm0REayhM2SAICEwcLY69u91cMIWD9FXGr6c5jX0tf1pnfVVZT1p7gtzuDFrn2KXpUqUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbmgWIbh; arc=pass smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45fe59255beso4101493f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 01:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781166490; cv=none;
        d=google.com; s=arc-20240605;
        b=BRqQEXDQi6XO/h2+qEVbqbZzHBJIVSZxskQMJY2kTL27OCdvRLzE2htGa6XPXxUXkz
         fmeByisxNBTWY+9MU6bDnyTTu4L4oizhVq0FfVHadMSn6eW6yYhH44QOyCb8ffz711I/
         +zyX60sbIJc5blI4Le88glpK0SoCsFm9SPp+Y8aax5BiH7xduGplgUPpDa5pRQslBuo5
         WvdAsiYYpQTS3WZJgqMHKjXvL4GEv/l2d2neWHil0C4dvPM6yuDNTVf1w1ucqJwLoB9A
         q/qNuDS+xXuDe9zabY1vRat5NaPob3DWN/KwRw+s6T2LRi0LA6e/ZABlbYvoCb2UlCM+
         dEng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5tnRzrtqnxNTVjGqOZm5VeFoZi5kNsErLVoNyTcG0C4=;
        fh=34azOQy6T6BRVIooPbbYYAiU0OciMAO2qr3QROpyMZM=;
        b=ddQ5H1LJ6kGt4HmucU2IWM1QE3eoC7eSuSXwoMxM2VTVoVDlwempqUchymzMkHzw1g
         m/nS3yMggF7yAuwhF9eTR3uMttE2GbfNApwoOFHpXXcbwnGeyXELci1c9FmBpv54eXwm
         ZmenKjPrWJeR2uEnof33udPWAIR1Dvvp0755gVhzK+689EF8mNxnYGNDGBxojvo/lQOd
         tLRyS/6LopTmHug8RLfPzGn3WfdXZ3KhUf8Y01UK9xhYyEo/Ern20sqzW5vbHyNEy6dE
         lgKRy+ZzLrQjXafqusD6o0PzOqQkFqsVp7Tx5zPfhIJJfn5p3meEheBIZZSj/97v3Wyk
         F8Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781166490; x=1781771290; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5tnRzrtqnxNTVjGqOZm5VeFoZi5kNsErLVoNyTcG0C4=;
        b=fbmgWIbh/QOLf5O2qUmKTfoLVhJg5WDXe02iYeFo5eSGDlV2ePUXkXthdG0a8zNbxo
         7m3YMNaOpiVicaTVCnprEHdHb5cynGD6KUti53yn3zdA/WspG80uv8FXnvB7jOlaiHgv
         tJ3xaKndwTva9jpHLQnm1PE4iAm8fjo47F74qBII+NsxpgxFfKVahd9Jg9UfGXhbDi6Y
         xnPnjN40NLdUnbaabKR33kxFLpYXVvUyye2qkMsAgQQRVOgazB/GEI8GieyKEj/E5yyq
         eTESEbD5XxEcF4R6I1+zm+TTxCHK4NVi8b3SUZEOKDvciZBXhr3sLJZinR2cLTBDNIkE
         TgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781166490; x=1781771290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tnRzrtqnxNTVjGqOZm5VeFoZi5kNsErLVoNyTcG0C4=;
        b=lE/6O0EZ6LwB6hzZL/nJ1KE1TDAqZAc0mjuMp6RpW5T0U68RShDnK6WmdKxS5Q08fm
         89lJIPG5K8tDhFKQqUApbMgrRLMm0k//BFi1zGeEsOFTV9EMu6I74umMkfDbLrORVnA7
         q6KrY66LMNx+BMPanLEOtE2TlxRlqF35+4TtVK7BHbA2PTkfX9hsmKMt6idHo/0VC2Cw
         7TZuFA2SqE7eunyopCnK1LpGy6beSron+CMOJl8tqKzyTh/1wYpWGyEK/JysXoCj6LIo
         kRg7Yuf5J4wtzyIqgH8oRSd+cunLWVuiiMHaA1pjFJIZmgVEUe9lDnc8Cg8PEcwO6I94
         CxtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9thqEFedwVRVyZfnw66nJ8xuyZeWHojb1IJreIDrSZMoAwj96Xc5zEqaVUNgyJzBqkb4owKSqX1u9n@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf1jhvem81d1JvCanvqQrvv9EBncXpGlbGw0qkYbnF+2kkaG0b
	HarryinJt8U4FGhaVMQs457uatvyw6no6m1rC6fcXGxoFekKqUpw8iMDKuvlMhVane7YtaJlANX
	wtmuP90t/IRk0OnBbT9ajScXP6O+OFilFQR6fs21JSA==
X-Gm-Gg: Acq92OHZNYIGfmTfKXUABmOvv+NjyCQEmIZMAFqLC73JXyRbGVwHyPAGEVjAFNCNaH4
	3RUpREU39v9b2ieMdOCEnWxBW006B9XRnawnXaKl0dpt0WaGEES1vTImAex4fgQmoJAPfuNmETd
	+FBNBDEEqwx+M+a072qnIpyP76/U5mfDGKwhue8clP8RWsU7axqupXJkVapBqiYbNKwBSDFcOVL
	ytfhvJ6stqaADKsZLktpMXJYnLNrcizUgW71Q0HTXtrUbhRTNVsSr5F8ODglux8NdUMAhRgdyyG
	gLhUqfgBRnwnrTnJmir9V1CG5n7tLOE=
X-Received: by 2002:a05:6000:4013:b0:460:138d:c9b0 with SMTP id
 ffacd0b85a97d-4606746a068mr2534434f8f.2.1781166489910; Thu, 11 Jun 2026
 01:28:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
 <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-1-8185d2abbfb1@gmail.com>
 <20260610142409.GT2990@black.igk.intel.com> <ail2tWow7VwWRkL_@ashevche-desk.local>
 <CANYHO6qOWA6bGx=iygf48X2sW_2Q6ThMV-f3rH0zCZ5AYiQyvQ@mail.gmail.com> <aipmcBQmBMA_FyOl@ashevche-desk.local>
In-Reply-To: <aipmcBQmBMA_FyOl@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Thu, 11 Jun 2026 16:27:58 +0800
X-Gm-Features: AVVi8CeAga4nn01qPMPb6ITDQAVLnxHcqGLX4VaklSTVfZrXiW53jJTsD3RMLiA
Message-ID: <CANYHO6qv15+uh9FV5pkJ+bQXoVPVZaeXQ09a-TS37wAd08-ahQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: tigerlake: add some pin groups and functions
 for INTC1055
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38315-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BA4566FDAF

On Thu, 11 Jun 2026 at 15:40, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Jun 11, 2026 at 03:17:04PM +0800, GaryWang wrote:
> > On Wed, 10 Jun 2026 at 22:37, Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Wed, Jun 10, 2026 at 04:24:09PM +0200, Mika Westerberg wrote:
> > > > On Wed, Jun 10, 2026 at 04:34:23PM +0800, GaryWang wrote:
> > > > > Add i2c0, i2c1, pwm0, uart1, ssp2 pin groups & functions in tgllp_soc_data
> > > > >  for device id INTC1055.
> > > >
> > > > Okay we can see that from the code but why? Can you explain it here too?
> > >
> > > Yeah, good point. I know the why? because I reviewed the pinctrl-upboard
> > > driver, but unprepared reader doesn't know all the details.
> > >
> > To answering Mika's question,
> > Upboard hat pins using SOC's native function pins, and pinctrl-upboard can
> > map them to the correct functions through gpio-aggregator.
> > Thomas was involved in the implementation of the SOC pinctrl-upboard
> > in Apollolake,
> > and he is very familiar with the details.
>
> You need to make it to be the part of the commit message explaining this
> clearly ("somebody who knows somebody" way of explanation is not an option).
>
got it, will detail explaining in next version.

> --
> With Best Regards,
> Andy Shevchenko
>
>


Return-Path: <linux-gpio+bounces-38304-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P16fGGZhKmrsoQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38304-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 09:19:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8A966F52B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 09:19:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YwmQMrLc;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38304-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38304-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7093301CA49
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 07:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB4335E1BA;
	Thu, 11 Jun 2026 07:17:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A699A9443
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 07:17:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781162239; cv=pass; b=PAExSe4L0zn92bOAWXDspUHEJIWmbuuDHQw6REe3vuOxLtHDZ75ory9Ci5KYdgw14syFIO94wr4AVAXRJrEu2lalWrotFgtlLsobCDROa9J4VvT9OfvPygxJjxwm1xlRuYzIfTDxAK91NYIPCtp4VbzbYiPOXiZmW1JVgzBzDXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781162239; c=relaxed/simple;
	bh=IB4ZnD7YzyP8uNc7yz8/AD67oppNt4SNIH/wHsyOwJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPJYiOaVxkkhzn1Ehu2ATTtMf/kCqg9ma2Qzpqmi3DUPhqO0UkvDemAN5pDgf7NtCRKqsB80Y2IC1ClZjsPlG6EVl0UHM64FJSMH32uF8sQ2DGFydLRMHlXPz5LbWlCYUT6LQPUjR0krbK72thJwqjRJueEa5F9JAoSIVjGg0GU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwmQMrLc; arc=pass smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso86802635e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 00:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781162236; cv=none;
        d=google.com; s=arc-20240605;
        b=U886FW7dZoyEJ18L22q5dr8RMVvwOf7ogJZLkjf69D0yQSbbZpzfCoyB7vp33gt3Y+
         +cLOuzDE/oTc98umPbwA7Hncup3YDpulBWYmLUyOa44o1tJUBETxPUIPNAWgGF6hRWkX
         ovESm1DpPSa6/liSl6TJD23CXgjIjPuBce2qXRYJSmEn3VdqselDjaiDSVpK0oKXYfnV
         0olXFLlYR2XL01r03qxbyUKQhfysPbNapaFG/y/+yoy2YLRV7p0SlEpJgO5f868fy9qK
         ecPs09JEqsY8G7pm6SgX6fppYwzS5O5VM/nwfBmkyJLzeOxir0QuArJDeyfUyUNvmxpH
         VK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ow4E9aWUILcxqsopd7kgNaey+BeELjuEpoiUucsQ+A4=;
        fh=ay5QeJPR6hF9qverKIKtrXbvk0hoNTRMQn39sCIbxGI=;
        b=WCEw9ReeyyvqpkVdC97Naj43/S9OhoDBdf1gRVew2YzuTrrCD/zSid+3dU9PJ0adwq
         wR2EL05nevpgQMGAE5e/FuwYrZ8E4z0bPuQH+0Rzd3Z+PV5dmpY+hSEP2roc/ZneSr//
         wlNwhWJND0sejObJvhrVZ5yUSw6imAqHjz/sbVEQujLnjh8AARjt532pOSF/sZ5A3sm+
         Nuw7slvz4mavP1OD2LFX5TeS2aHePaXeElJfbBfqN2Rgo4moxuqWZMBjV/PpUAjihzpy
         0C5872IjPmCUrnr8sbASUNuiMYQyLQXyKsAeuuU0yixeSMNRML3Ob+1bdAK9bSVrCYGL
         fS/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781162236; x=1781767036; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ow4E9aWUILcxqsopd7kgNaey+BeELjuEpoiUucsQ+A4=;
        b=YwmQMrLcqiN1UXKzJaDji7IIpPls2F7TyEz1VgmjTdRIK0iLQPVEPs4CqmgwsjhBU2
         LyREIX+78IhIl5nEfetx4GTDoAkPMyFaJnWhWussfCatcTC7nFPnTgfxVxxXdOGzPNA7
         FlPPhvY2LuA9WV4ofA9nskFE3XfVWYDkfiCJ222cOn0vz4WgK//RmHt2p0UH5jnJl7Qo
         S7Atc977rGVv+5U9oVan+GXlZe3fd6pZ2N6Q5ZxHNpKAG4vF0dAHu/y2bkEhGVMzIkzt
         kAtiXQhV9yfiAl5MCgjYL94uWRGheE8Ly6TNiYtEWDvdNqzsbwxtgGjFlcps6geI94nx
         LMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781162236; x=1781767036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ow4E9aWUILcxqsopd7kgNaey+BeELjuEpoiUucsQ+A4=;
        b=YnJoc94dPQQBPRCSqQ1oQ65nxtkcPJ49u9wPeClS5+ki24qSWmMikDi8Trgmg2udSF
         8LN05yL9/9WVDoFCQilAkbf38MSHpKxaY7CcpUPP7AXrC97Dfusuuh83nV5oWIlGQEjg
         WAoo6U9GjuaPu+j5av4/aIcXzunGVTNW1MofjgSpoCvQ8pdBYo0eu3+MRFvVPwXFplRB
         VacZ0C2ZEPwmTGDvpPCTdRh1/dR6o3Z/ONxoDxXLaXl87DHBAg/wp4XS1eFEd0N0QsZX
         KyL9DKSnZZiWYHlWTmxQ5Q6WfxGw7Ibtuu2VW85KCUmqwWtR8AhOFBBPUtztylJj13w7
         O9rw==
X-Forwarded-Encrypted: i=1; AFNElJ+tT0uDjcggHGjDh76sbUFVB0J8BnpIVTAEtpMQehaRNzu9VMc+5Qjv4cZRtr874cK0nCve6OajJxyr@vger.kernel.org
X-Gm-Message-State: AOJu0YxPEA9QCR1AN/uyiv946MnvMLfrG2q+bG8KgM4ugvRJYs9E5UCA
	MqBuzasaSO4EBUD47INRv0o0uAQySPT5p9ij5epdSTJk5EoCDhaXl+js2N0QX0HWneUc9H2K7HH
	3hooWUMJkGMOCXwQfb3LWq+BVj10T6iuGUeNQBg98Yw==
X-Gm-Gg: Acq92OHjdvzAlayw5GZMoWHxPcHGM5yTL3/NvaNHc1+UC9JWqnwdcQvmR4e/jH6gett
	rVRJOjpYdPMcDVYnOHL5VzMfT+fcLpaya1ValCqheEDGxttLH9eLxufVgkunFFjj0ohQcWZVeGJ
	iqMMVp12D5mTXer0T3Z/S98n4u9Q5WVeAgyGVyWL0kJtojEa8TccxZOPHggY7O1pWECSEmo705P
	u53Y0mXdVDyE7Xh+F2uqeIQ/Vo1O3IrhPa+cZRwnEBVY/WrlPsATFZ++Ev31GMKkH9gIe9FXfSZ
	9Yn+Bx2VE/YGNF6n7C1P
X-Received: by 2002:a05:600c:3105:b0:490:d38c:7836 with SMTP id
 5b1f17b1804b1-490e55d0fa5mr17698055e9.3.1781162235954; Thu, 11 Jun 2026
 00:17:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
 <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-1-8185d2abbfb1@gmail.com>
 <20260610142409.GT2990@black.igk.intel.com> <ail2tWow7VwWRkL_@ashevche-desk.local>
In-Reply-To: <ail2tWow7VwWRkL_@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Thu, 11 Jun 2026 15:17:04 +0800
X-Gm-Features: AVVi8CfD6NTlhQ3tsjBj2frUdAyfEBs4e52N-K04mG-HxJfZlA32V1dgmhfIOl0
Message-ID: <CANYHO6qOWA6bGx=iygf48X2sW_2Q6ThMV-f3rH0zCZ5AYiQyvQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38304-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA8A966F52B

On Wed, 10 Jun 2026 at 22:37, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:24:09PM +0200, Mika Westerberg wrote:
> > On Wed, Jun 10, 2026 at 04:34:23PM +0800, GaryWang wrote:
> > > Add i2c0, i2c1, pwm0, uart1, ssp2 pin groups & functions in tgllp_soc_data
> > >  for device id INTC1055.
> >
> > Okay we can see that from the code but why? Can you explain it here too?
>
> Yeah, good point. I know the why? because I reviewed the pinctrl-upboard
> driver, but unprepared reader doesn't know all the details.
>
To answering Mika's question,
Upboard hat pins using SOC's native function pins, and pinctrl-upboard can
map them to the correct functions through gpio-aggregator.
Thomas was involved in the implementation of the SOC pinctrl-upboard
in Apollolake,
and he is very familiar with the details.

> --
> With Best Regards,
> Andy Shevchenko
>
>


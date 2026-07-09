Return-Path: <linux-gpio+bounces-39690-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KPVbCLHsTmpEWwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39690-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 02:34:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 811DB72B58C
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 02:34:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EktL0pUC;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39690-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39690-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92553303450B
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 00:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2F938C437;
	Thu,  9 Jul 2026 00:34:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9878A2D3EC7
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 00:34:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783557292; cv=pass; b=U7Yfe7PvYPLtZu98EyIlDFMcf+/u+nOLA/Pe3zF3hRK7SiD/kIlT/2Iq2YnF5I+nHXBxfGw8Wh/3wd78rC3vzcwc8odL+X439F44GlTrWXxtsTcN3eJ972w04YZSloYInAWhBFtFfwNxNNJDVB/xAUMEM4ZvWD5rH8aWEp0BNNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783557292; c=relaxed/simple;
	bh=KlxGFyHGOaUljv4YoNoDsSYrZt/kT/N8ZTR4oGY/1s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCxfAuMqzipxN1DduDLEmmGVxhgwsbAPivkTfyFo+K+s8wWswYV7PXY6Z2Pe6MQjPbuLrd5eLt7/dxBMiNGg/FBK7vzWLqoNxT03m16t33OagHyF+kcNVsXejiSUzFCip32grM1tw5orYHZMKh6sAJ1+jp22yUwrV+JrIXzSkgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EktL0pUC; arc=pass smtp.client-ip=209.85.208.45
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso541267a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 17:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783557289; cv=none;
        d=google.com; s=arc-20260327;
        b=hMoPxCwGm7WB8MRLpMZ61xMXzCmJEJuDVvgvLxUNT6W+aU5St5ArOTjbCWaefytOJa
         ycV9GEy4sX+h1F2bH64/GDxN5Kt0J3Tr2Xyyir+XwJoT8KklR5kJxnro+3FRMvSlB6zf
         +BhApEWWBzlC1OBWUtJeifBOmtl7q/1lgtfGkuIEZehaS0IQpRCJ9i9V1n0xdTGOr43f
         iJHAAtQKKltWYDHbb1RoQBYAuxqJWWruAKkXnEb1RfPoSt6zYcw1kbwd/xfn8em3APEW
         BwUw55Vm+Z6OXqsGNL0BzZDptGMSG5pfWNIPFq1hpU16j6U4/T/bUlElRt1IXiFSg4yf
         1W9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ltWa1puTpjvTHN3Z/04jTN7dJXPbJum6AAC7wbEBR0=;
        fh=+fvJycVj/nNaVn/7dDgt+0OG/TXYhlznRAo8gI4yNlM=;
        b=jTWCx9R2OfxD03NTW/xB80u1qv6ZV1j78pQOfWzCLQF9cC2YMEhD9S3/cJ4fZu9o7f
         xFT0+DdE8xOYzWoTovBepu5L2KH4JGMfiKei7/m3VX0WvtRfZJCUDl84/Ypmkabc+Sn7
         PBYX2q2w55S1/JXzRR8JOT9EnEcrwIpt5Is6x0wG7LQ1tm4WPRiCiJpxt8O9vRXk01ko
         g21pwYuWM5DKxXQXM106i1wAu+FogKG/dBs/eq+tSLrEOiW/qpFTsC3Uo34GIuyvr+56
         uRdoX7kduNF7IofyIyeIe/nzyXUS1d+2WrvVrZwDtLHVn9vMW1vJ2H+1qrCYPz1yYshq
         HAqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783557289; x=1784162089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ltWa1puTpjvTHN3Z/04jTN7dJXPbJum6AAC7wbEBR0=;
        b=EktL0pUCWABv4l+NJvs2j2/+k8w7OWu340HVjKPRaH4Obh27swHe6NYhvQCf5Xr15Q
         /RNIi6HR4pxUrzgGN4Vm3tzsM6TngSFGUG1AB8dTa/DDST+4P9S3er02sh9nOwQqu9fJ
         2yKPCDJUxdZKZ832GewqmCRof8SeM585bUfGzKSP07/mO56oj2lAuOVuNawBUhGREX0J
         m+OBmG7kMNBZH6ReGxuCaWdNeBu2TkIY+B3/ek/nTs4p2+qT8i8sSYjFIlDrgGBWsYca
         9QBQNl8phAjKmQuVAE0LmaePpxkczHvI9oSsrqtWSGl//OdugDtDO7S752OV/UpcZ4dW
         aKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783557289; x=1784162089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ltWa1puTpjvTHN3Z/04jTN7dJXPbJum6AAC7wbEBR0=;
        b=mLR/sYp/pbnT/b6DwbZS4dlId9u54xyK/JbbEMs2Ru3js9Wa/D0Df/5YfUY9TGspGf
         XvdaDZoJQ8BTAokYN6ajyclV1LXOFRisIGzrbYD818Mjbn3U22JspxQmeLtv0V6OIjTp
         ntNAx4BtqLd/YeWADFUVZRx9N1AnADB24ymfCheHyl233MsJayfxGaavZ4iwCj3aO476
         Da7fJu77BFt3QUoDybuGyrlif9/CRvFA6dNgXeLObGxp8NGvm8YCDcWtT6wVHGTioK5O
         nNrSzyjNEFqG0GMWIyB2acJMW2Wy1mOj/60y8645TTRzfY1fAXzWYVqbGrSsvD/ypBDS
         OgBQ==
X-Gm-Message-State: AOJu0YyXL2ltvyzfKV8S+RAOkYJ6x9QvWZ1reXWNHT8lj3wbEBV3qZop
	cjsOnJTk7kmQZuCzT8iFaCm5mAMCbIsoUG62gzHG9n8xsK5m3pT2Ek7uP1+qdbSxf0Z4ullAcUJ
	opXuAm6hqCB6DMH/6L3QSxRAY7h+0+SyiBg==
X-Gm-Gg: AfdE7cmd/yel1JL8eOFMyrmErn7w9+MKlp+QkSctUYmgGpU7puCGbf//YvNFLa5zw1T
	LG69vh10pxDnxCnPCrj+ioiANhICHvW4GNTEdEnLbLr0FBqIbOydyomv0R/fzBL/CTRpvIJJXmP
	sUcTORK/Eb+rqxydxHg0jk8Alety0SOAy1CJ80uyl+BqHgGtT/LNEv0GnHVotDJPgcldCDvu4pi
	21IstEkbuZZymVxRhCXTCaqbZrxlUxYAOplqBQRf/1vVAC4DBQ7H/hIc2+3elz94Yje5CcDPbe1
	AWBUVfr5clDcJ2PxONe4eNfMxi/twaIQIOkQd2tRFaDMQnyYiNP5UP8L/zApcUKzwMj1NdsYmz5
	FRp3E31sU8Svs7HHtITRPIbxAfHUHyyQWeSj1WPzGX7uq0+JurnOSTS8GHPgsOIjDdY2ctDN4yz
	IioaeYruM=
X-Received: by 2002:a05:6402:320c:b0:698:b9ca:e662 with SMTP id
 4fb4d7f45d1cf-69ab4453bb1mr2029924a12.6.1783557288630; Wed, 08 Jul 2026
 17:34:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708224822.960617-1-rosenp@gmail.com> <6e606bff-cdc3-4c4b-a122-38de39f31f43@lunn.ch>
In-Reply-To: <6e606bff-cdc3-4c4b-a122-38de39f31f43@lunn.ch>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 8 Jul 2026 17:34:35 -0700
X-Gm-Features: AVVi8CdmNvdBJYG8qeERRsAVPdVn2AZxifFVaEsb8TvsoWurGyeIg0LJb8SlsBc
Message-ID: <CAKxU2N9m170NyswE5VKaf1aWJZ+yAx5WeEKiJK2YdsH1a+wZJw@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: use devm_clk_get_optional_enabled()
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Ralph Sennhauser <ralph.sennhauser@gmail.com>, Rob Herring <robh@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:thierry.reding@gmail.com,m:ralph.sennhauser@gmail.com,m:robh@kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,m:ralphsennhauser@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39690-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 811DB72B58C

On Wed, Jul 8, 2026 at 4:38=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Jul 08, 2026 at 03:48:22PM -0700, Rosen Penev wrote:
> > The clock is obtained without doing any sort of cleanup on remove or
> > anywhere else.
>
> Didn't you say you could not unload this driver? Then why is cleanup
> needed?
devm is used here. If probe fails, the driver relies on devm to handle
cleanup in order.
>
> > Use the proper function to handle this. When it fails
> > with -EPROBE_DEFER for example, return so that it can be handled.
>
> Why would it fail with -EPROBE_DEFER? The only resource this driver
> needs is optional clocks. If the SoC clock driver is missing, the SoC
> is going to die very soon anyway, it is such a core part of the SoC.
> If you access any register without the clock enabled, the SoC just
> hard wedges. I've had to debug that situation.
That's the only realistic error it can throw in probe, generally
speaking. It won't throw when the clock is missing.
>
> > When
> > the clock is not found, it's NULL and not a PTR_ERR. Handle that as
> > well.
>
> /**
>  * devm_clk_get - lookup and obtain a managed reference to a clock produc=
er.
>  * @dev: device for clock "consumer"
>  * @id: clock consumer ID
>  *
>  * Context: May sleep.
>  *
>  * Return: a struct clk corresponding to the clock producer, or
>  * valid IS_ERR() condition containing errno.
>
> The documentation disagrees with you.
We're dealing with the _optional variant. The code in
drivers/clk/clk.c ultimately throws -ENOENT when a clock is missing.
mvebu_pwm_probe requires that optional clock, hence why an early
return is done.
>
> Please take a step back. What is really broken here? What reports are
> there from users? What is bothering people?
The plan is to fix sashiko complaints, followed by sending a dual PWM
patch so that sashiko doesn't complain as loud.
>
>         Andrew


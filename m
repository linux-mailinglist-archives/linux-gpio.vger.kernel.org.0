Return-Path: <linux-gpio+bounces-36996-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GekHj32CWrIvgQAu9opvQ
	(envelope-from <linux-gpio+bounces-36996-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 19:09:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A028562679
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 19:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D9D81300291D
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 17:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B9F3C0637;
	Sun, 17 May 2026 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7ZYzflP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2482DCC01
	for <linux-gpio@vger.kernel.org>; Sun, 17 May 2026 17:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779037751; cv=pass; b=FAYS/Zog3DFofYu2Mt//zrApbtx2YSk+xTvMpCzQhc9gWxgL7zwUr+o1gKsEmxy6tVRpXmVK3WbvgFIbmEX7Jln/KcP7dzrW9ZtTcLefMzUTZ19SC1bBuAzO5wqZrq+wDzLw1pev/ryfkkhhXIXkZwmCu4DbuFjniFf3/Tb9YVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779037751; c=relaxed/simple;
	bh=gR7yXaMbFYnlgjumf6OzkaSf/fm5FQpc728TaerBcYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENcGKhVWSaaXtGjO8WIhdT1YBhNH1Oq0R5Sbc13JBwoA1mJZK9qxQkHmYKJxMzf0HizaOfg87ikVgnnI1LzaxDv7qlwgf1fZ4g9hocpl1YWzhGxHBKx5IlnnYG+0pD/EfdYr4g9cTES9RIsWrLTWRDaPmTNMxPfPpW0qOnTbatI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7ZYzflP; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7c58e6eb3edso7984327b3.2
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2026 10:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779037749; cv=none;
        d=google.com; s=arc-20240605;
        b=MCEHmPKIYAHXfCMHMh8f2GuEJTSIw+K69boLwEoYMMj7+3mnVDtO6sr1On5gq4fWAg
         o3lvvcxytbnWu70jrgO35MF4gLs2zTdwwc/R0iUwauTJxv01cGBNc5z/ITIfmwBxLSA7
         BG72WV/IFM/qgkkhakQphBld6vzUaRFjfMC9fliBzfLKF47vods8A8aPsqsDmyWtQmU1
         bncKnixlW3avVk7IGhV9rILKnaKtQC6zB20RezmCP5iEQB5mUvLez+yv331dBKIImdAw
         2Q1o16e9Fy8tXVjcqCA12SE6zxDAZ9rZNhL+koEvaAlqs7rLik6qp8hHnB18s1jrkUCd
         n9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R2WC/h6pAzuRmbcYX3EI1ehtvQRlSkP72sx7+fUup/0=;
        fh=vulsHiCQut1XFP8eapXRP8Qq99SB0OG8sPq4zg55oNE=;
        b=JUOajpvR3VrC21SPfLB/TRUuF0/X9oa5DVOg+hPHkGBTbmnhx5zsEctRFBSnZeeAdG
         /guFOUMKqfY8Aj4pYJFGnSpCZPFLE4zoJBaENqWp6PMtG4790uD1MhivtthyVQVkua8P
         OBMWyqb37WnpL7aatjwTWE3hNsFl49X9x1dOo+PDrwrnXGBEpJm1jCyNnXdJSLB5ze53
         zXQovaOT49m51clf/BLRDTS1+++cIeirJtFcLTP3g2r8oVbPj6mt9fAPSQ87rPAysflh
         0OutkqcqZ7UjXOPj9DtHu/yHjtzH4AZS3vU2QMOM5kmjK1r8xhwxD4/HX56fovIB5kLX
         N/tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779037749; x=1779642549; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R2WC/h6pAzuRmbcYX3EI1ehtvQRlSkP72sx7+fUup/0=;
        b=F7ZYzflPmc5/sMLk5hNRCa6zuxOmGTYYhlVJ6TtAdFMNyDrZWIUYz57zRL/utm9M5P
         d0HGhfa6GH1Smz0D6/QKq8rCxmL4JbfV68t5t4FZO0dhjr/ZxchyGqn9/XFcRZxyIyK0
         O0Js8o99w1N5eR722lGjdDxDvRjUaY/+w2wEdGAZbKGsw0T3P4fLqaILbTuGBVFg7rJ9
         ATDpGrn+Dstm8sD0xi1wRwuyaGuToTKM8sCrGzSQXv+Vz04dZ6lQI0ZY1fEmqb5rjG59
         Xh9W2sPVQFsRJAOnRSEP82Hy7cA1kTlS+/rh8Ef9nhKcgl4AmaNKBoldxC+W7uvHK3yW
         zJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779037749; x=1779642549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2WC/h6pAzuRmbcYX3EI1ehtvQRlSkP72sx7+fUup/0=;
        b=knRB3y0Wx5/J7pHdIiQGPtmG8HAZsBFKQcXpmRJ7yVDZti6XyWy6QaDlTwaB3KjGiW
         9LuDp/iooQWBHJSETq05GwqSQPG7ek7vZmXFLInazSXBQgcdxkUL9MCIxeQknQ1Rpe8s
         DZjHHzK0kPcbyWFfP4znQPrK+utLEs7ngNC6SR6pnKxzA9SGQTXd6akrwZVIlQmAAQFH
         9bk8vm0hu44X65hfpg1YIbQSJS1LkFfoV+j/14ELFiQXyCacxDu36OKH53YhZu9sVUnK
         XbBoMqnyklDeD062ldcxZ/pmyBi60bpIt2I7QVxKmUNHYUL4IB1ml6KMq9DP99oy04pu
         P1DQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oZB0MwCRbtZiWERvoyEOzSMeNJxl1azKUYbymEQ10roBn503zblhNF2EOK6bgPaHs8GgswEQXrXep@vger.kernel.org
X-Gm-Message-State: AOJu0YyILjRSSdmfcpbPdol78VnKqsda/NrumiTBVFkxXAfj2rPr1P1C
	kkuvrZ/h+y/X/kuIVEECVENw7jXuU+h6xZzOJibfbsK37XpsgH6BvyiJ36fArzJedUeQVod6LOb
	74y7hCBBNBSt5BsqsmhGETJKcrv1kc2g=
X-Gm-Gg: Acq92OGnn7jl89tnwbHjg2S5WwLA42S3WKn2g1AUXGQ98KyAPDns4i3Ff/9AbIM+D6x
	w+taQGIE9J3/dDNxJWDC0OWLow641ApB16hoXxxKQv6RMKRPipKY0bsK6JWAsm48JU9QS8keVKY
	tqySouR8t30BUht4NWHqdaP9JN2L5J3hyjYlqmHCqS3ZNaDrTT1JiQNL3OsGaEo2LziTV5B+rn8
	q+SnpeLECVikFwVUHv8+BJ8Gk7oSd5D4Stn7ZGXwCuEpNx/U0QYP8UyknHQWKW4cpnBwmYGYyUd
	ThRaUihjIQHoWsjEXSo7XZDALdiqt88mT9fntzMZlfb6zWhyJ0n3OgElhwBWXCvPkfixG8X+IbO
	PC8Vi1C8Ia9QSl+Uw5rXz40+OLR/JzS2IpLGghGP2Ud/B++0gk75xHY3YVY9VUm3Otu6IYQ==
X-Received: by 2002:a05:690c:60c7:b0:7b8:5f91:65b8 with SMTP id
 00721157ae682-7c9594b35aemr118510287b3.9.1779037749285; Sun, 17 May 2026
 10:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515161516.10474-1-hardikprakash.official@gmail.com> <agmPrF0IClOpDYlR@ashevche-desk.local>
In-Reply-To: <agmPrF0IClOpDYlR@ashevche-desk.local>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Sun, 17 May 2026 22:38:57 +0530
X-Gm-Features: AVHnY4KTSGZpReqSZufyItdUPFDwVE4MyKIswJsHjhtLSg9CO2F4KFhunkJduvo
Message-ID: <CANTFpSWMjz-V_oOsP+7Ww57vhdDVwq0nJ0icQnp3qSq7-=yFRQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 7A028562679
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36996-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sat, May 17, 2026 at 15:21, Andy Shevchenko wrote:
> On Fri, May 15, 2026 at 09:45:15PM +0530, Hardik Prakash wrote:
> > v3:
> >  - Patch 2 only (patch 1 already in Linus Walleij's tree)
>
> The patch numbering is broken. Where did 2/2 come from?

Both patches are committed in my local tree. git format-patch counted
both commits and numbered this 2/2. I excluded the 0001 file from the
git send-email call since patch 1 is already in Linus Walleij's tree,
but the numbering carried over from the two-commit series.

Apologies for the confusion. If preferred I can resend with 1/1
numbering by dropping patch 1 from my local branch before running
format-patch.

Thanks,
Hardik

On Sun, 17 May 2026 at 15:21, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, May 15, 2026 at 09:45:15PM +0530, Hardik Prakash wrote:
> > The Wacom WACF2200 touchscreen on the Lenovo Yoga 7 14AGP11 (83TD) is
> > non-functional on Linux due to two bugs. Patch 1 (pinctrl-amd GPIO IRQ
> > fix) has already been taken into Linus Walleij's tree. This v3 resend
> > covers patch 2 only, addressing Andy Shevchenko's formatting feedback.
> >
> > Root cause: i2c_designware probes AMDI0010:02 before pinctrl-amd's
> > probe completes, so GPIO 157 (WACF2200 GpioInt per ACPI _CRS) has its
> > interrupt bits cleared when the first I2C transaction is attempted,
> > causing lost arbitration errors. The udev rebind workaround (which
> > works because pinctrl-amd has finished by userspace time) confirms
> > probe ordering as the root cause.
> >
> > Note: the dual-master hypothesis raised by Mario Limonciello was
> > investigated. TPNL's _DSM (UUID 3cdff6f7-4267-4555-ad05-b30a3d8938de)
> > is a pure query method returning a constant HID descriptor address with
> > no side effects, making firmware acting as secondary I2C master unlikely
> > on this hardware. Awaiting Mario and Bart's technical verdict before
> > any further approach changes.
> >
> > v3:
> >  - Patch 2 only (patch 1 already in Linus Walleij's tree)
>
> The patch numbering is broken. Where did 2/2 come from?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


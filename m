Return-Path: <linux-gpio+bounces-36186-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kClcHK3Q+WlHEQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36186-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 13:12:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB87B4CC447
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 13:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 878FA3053D37
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 11:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3A93EB811;
	Tue,  5 May 2026 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvE7zLG7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F2A340280
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978645; cv=none; b=GuNAyCQFLSugqQ+ZcGzLKjkulX+DThbJADC9t/rFhEuhDy1yYG7IZK1omQkXKnoykcw8fwXgL4KfiSejqaasRZkG8ujuDYcnWLfI04n7OTS2bCOT4m4+oFf3ASlui00trO0IHu2VDvBOfyn1D9GXdKaCwbLE9ByYf7hJRq+p5l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978645; c=relaxed/simple;
	bh=UwkC3Co1P6glgwpjWYwoIuvnVWXXRqvM5gyZDiz4rAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=glFn0QVr8cg8IraqSc/lOk3mSRHOFNEAzIh4+6q/bmdyuIUtegwqChJ514pzQEtfl5R8VX0ejTl0rwIbY/yhhk+CseFW+FJ7MInh9th5RAEvQUGzdTQW9v48SdvrKtzJIWJpHR0uZMERnaaYbmM+cgH9l9jQ49bK1L7yA+WZKS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvE7zLG7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2FEC2BCF4
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 10:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777978644;
	bh=UwkC3Co1P6glgwpjWYwoIuvnVWXXRqvM5gyZDiz4rAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lvE7zLG7iIGzFb9+Szz3SCk8IK5hFhJ80ipbz5+ahPmtki43Y42XpJO/pk9hH1pch
	 bWUzjsPWdVtRZuIFvgE5tuIuyBJE+6zqhD6UN67W2sQAP7EsZ/MsGnCzTLTmB7XFWo
	 Rm9h4S+OR0/MqE+Tq/e7XeocnMdEnl6y0xhOKcDHfYcLqMOyYKXP3Xv0UVD2U/MDPI
	 fqvYno4kV9u2lTw5cORmwkrJjcmXJxzM6npR+NwVxwPlNK/XIALscmp+akB4DWMo+y
	 /tSR0ryOSCJJmQZFE/9J4hv/TRVuaWCAEQ+E5TmYAEBo6USunyy+6mt+oM9Svpg/ao
	 Cj+j61Z00Msxw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2b636b944so5216203e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 03:57:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+cmmV7H2J0Idl3d1ylSOVluMa3MfHkG8nPSU5mEFtrtU3lBWJtgTru36q5whc2pn51td6uhWVm3XlO@vger.kernel.org
X-Gm-Message-State: AOJu0YyZqjviiQ5QXcaWAhlrLJG4Di+P4NJZFqeheRijnabb6tAsW8N6
	jIpVV0m0xzqfWFJOtppbdeG0yjV296+38mfBNqaf/zQa687URsuBXit/Sh3PPA1URTEjG7KV87A
	d233DARnpG4hLCZkDaGYx6xgJtMAFQKXvZsaSh4KvIA==
X-Received: by 2002:a05:6512:39c8:b0:5a8:6746:3f9f with SMTP id
 2adb3069b0e04-5a867463fc4mr5024657e87.40.1777978643273; Tue, 05 May 2026
 03:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504195251.53771-1-lucasp.linux@gmail.com>
 <DIA656PT46GW.2Q15WVT679RS6@gmail.com> <CAKYXYMRX-oV6iO+Kh+dV7_2BfsY9gjdXMw6cueOgYw2hjLWeaQ@mail.gmail.com>
 <CAKqfh0EPFPxFN8ime2EaO9gP8z2m8mshR9b1dEswgzQe-2Ge2Q@mail.gmail.com>
 <CAKqfh0HA7s=apD4u3DbauME-7NWK7CbUAAm5ArdkRjjHHF=hCA@mail.gmail.com>
 <CAKYXYMQQ2UxLJw=2O2y=fLL6Kpp3eUiaH7Rx4MF5H7wcoYzcLQ@mail.gmail.com> <CAKqfh0E5RnOpkXBgJ5gUzPgk0dYs_NRi3=9Df0DiSp9RebgmSA@mail.gmail.com>
In-Reply-To: <CAKqfh0E5RnOpkXBgJ5gUzPgk0dYs_NRi3=9Df0DiSp9RebgmSA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 5 May 2026 12:57:11 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfD45paQL9f=exHD47XuOnhSRurGHCgyZpWVe4WLxAKDQ@mail.gmail.com>
X-Gm-Features: AVHnY4JPNy90Baw1Y3jEMYCdLIFmqDkj36YNeDGh1OPHCkEgMcUNFz9zwno_Zmg
Message-ID: <CAMRc=MfD45paQL9f=exHD47XuOnhSRurGHCgyZpWVe4WLxAKDQ@mail.gmail.com>
Subject: Re: [PATCH] tools: gpio: replace strncpy with strscpy
To: Maxwell Doose <m32285159@gmail.com>
Cc: Lucas <lucasp.linux@gmail.com>, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: DB87B4CC447
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36186-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, May 4, 2026 at 11:14=E2=80=AFPM Maxwell Doose <m32285159@gmail.com>=
 wrote:
>
> On Mon, May 4, 2026 at 4:05=E2=80=AFPM Lucas <lucasp.linux@gmail.com> wro=
te:
> >
> > That's a great suggestion! I would love to try adding strscpy to tools/=
include/linux/string.h.
> >
> > It might take me a little more time than a simple cleanup as I need to =
make sure I don't break the tools build, but I'll work on it and send a pat=
ch as soon as it's ready.
> >
> > Thanks for the guidance!
> >
> > Best regards, Lucas
> >
>
> Of course, but again, don't send html email or top-post, read the
> mailing list etiquette at https://subspace.kernel.org/etiquette.html.
>
> best regards,
> max

Are you guys two AI bots just talking nonsense to each other? This is
a user-space tool, there's no strscpy() in libc...

Reading this was a waste of two minutes I'm not getting back.

Bart


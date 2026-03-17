Return-Path: <linux-gpio+bounces-33655-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLr3KVpyuWm8EgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33655-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 16:25:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1728D2ACF9C
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 16:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74E0B3055400
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C453EB7E5;
	Tue, 17 Mar 2026 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQfcSc6w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21E22DCC1C
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760776; cv=none; b=C37DCZSDDwORnW7r2BfuD5aV4OAOCCVe8bc42dSs9/ukqHbvtcmb2D73orixvpLA55hzOxhz6fz+EgVGn+EOBT1BxVq5QkDoVYOmRMiflTlwK926GGTinF7gSc/JoElx3JvkyFE30GGsEzs5y+Pxv2KprTvAQjx90Gt7tCrLEuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760776; c=relaxed/simple;
	bh=jV97flPzTXd2iaPag98A6Bjxpul4OnISaUxFXlST+IA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hxGZiNqab4EFpWpo+/vbRWcf/3KUOBcZ5YUnN7gQwlfZ0mqe3Kh1zeDiWlv1s6lxTmVakF7lEmfOHcWkfcvfoEZyLbgOY3g9pBWBLVmuP7nwOX+jtYub67kNrsFm21cHtykJJY9FuSxDemg+iO9pXHkImuJDrSzR8yP4vVbprXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQfcSc6w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94572C2BC86
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 15:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773760776;
	bh=jV97flPzTXd2iaPag98A6Bjxpul4OnISaUxFXlST+IA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TQfcSc6wedpLOJBsUU3LoY5sz52tEflHwRCndtpaAymD+lazTM1y1q8M+3P9cpbCq
	 CeMaxd1uS/Evym8Vx30E3/Bs/xmAKxNsZ8FspCOgCEebo6gv4O80Fq2pgl48MDGSNr
	 nshEP0nBlqdyFiz8N/xe8NcAsPKVw5uzOb7gwX6J50hYemh3yBnA4GtWeTDibx9o9B
	 Ck/WUL7mqEMH0D3zcS4FeBPr9Svf7IQPfsJD7TrKTXlURaY5ytqGjmxd9j+m+/Mfqr
	 BbblvAw+n/2qa2WC28JiMuUy1HwLBjrQH3QNM8ahdi0eokoCVl0ZVPsunSuNg3g79a
	 uFBDorM4mh4Ig==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a10d130b37so795766e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 08:19:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwjtA3/n2RMOOFLefeDI0PMpvhzsy9KXuwMiX+1vwiBvYM4sisxTOG7NefjmeL9uTjc5G8yPrlFCn2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw9EUV86gGGo/HE1Pfb65Dcacw6OnYdZolHVC+eud37c1qBFGb
	9dmyfXgHSAcUud9NRBM9KY5eUcvBE/5h6L8jMBLazFTpSyu85feKKMdazGvl5yJ+MFX35Sfrffx
	oDgbHlGPyJxMV2lrzpByZxefZ5b6TMhLdC9eQEiSlsg==
X-Received: by 2002:a05:6512:3da5:b0:5a1:182e:1fdd with SMTP id
 2adb3069b0e04-5a279391d82mr37380e87.0.1773760775148; Tue, 17 Mar 2026
 08:19:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
 <dff3c797-a619-42c0-9696-3e617e13356e@nvidia.com> <CAMRc=Mfg-2kjfd5RrcD748WPcUUef=aaxyk8fBtzdcbxqmxcCA@mail.gmail.com>
 <e217c9a6-e2a6-4413-8247-19b7ab72a53a@nvidia.com> <CAMRc=MfK_eqbWDdEQHHWgAyz-zMWyW5G=DF8eNh0o+iyt=BtOg@mail.gmail.com>
 <d05d4468-84f7-4692-8381-e0742f1f2749@nvidia.com> <CAMRc=McY9dcDLXPM8-QErxzAJuoe1bxy8BX5H2y0uCHXJSsAwA@mail.gmail.com>
In-Reply-To: <CAMRc=McY9dcDLXPM8-QErxzAJuoe1bxy8BX5H2y0uCHXJSsAwA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 17 Mar 2026 16:19:22 +0100
X-Gmail-Original-Message-ID: <CAMRc=McMCMuyB7ETefXaWJ6K=-nPcDHo964WZKtPRU9XVVky_w@mail.gmail.com>
X-Gm-Features: AaiRm50SgShgXUKj4uvw2ie6e8mbC8SnVmROVpOZQeYw7Y_tgoBiiBxAYd7FHDw
Message-ID: <CAMRc=McMCMuyB7ETefXaWJ6K=-nPcDHo964WZKtPRU9XVVky_w@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33655-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1728D2ACF9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 3:05=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, Mar 17, 2026 at 2:47=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com>=
 wrote:
> >
> >
> > >> I am not sure if this is because these are child nodes of gpio-keys?
> > >> Obviously this is not a proper example, but something quick and dirt=
y
> > >> for local testing :-)
> > >>
> > >
> > > Let me create a setup with GPIO keys then.
> >
> > Thanks!
> > Jon
> >
>
> I can reproduce this with a gpio-keys setup. I think you hit an
> interesting corner-case where the consumer device is the same for two
> shared pins assigned to its child fwnodes. The setup doesn't make
> sense really but I guess this shouldn't just fail like that.
>

So the problem goes like this: we're using lookup tables for shared
GPIOs but they are not capable of dealing with two fwnodes that are
children of the same device that share the same pin but are themselves
not attached to a device bound to a driver. While we could extend
lookup tables to take that into account, I think that the setup here
is so hypothetical, it doesn't really make sense to spend time on it.
Does this patch fix the real problem on the tegra board that you
reported initially? I doubt two separate GPIO keys, share the same pin
in real life.

Bart


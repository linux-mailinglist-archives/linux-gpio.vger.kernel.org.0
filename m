Return-Path: <linux-gpio+bounces-34627-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEhZG86Cz2mwwwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34627-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 11:05:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E88713928CE
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 11:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29FEF30075F4
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 09:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57872371881;
	Fri,  3 Apr 2026 09:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBGz0Jsu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3841E9906
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206974; cv=none; b=uPUkhHDMN7y8uYdcBH2A9mCzlR8AgDa5lnTeUgmWQSv4+ZuzGXq8EagSbMR5izvZRF81idjXqti0AOJbuNVp+jUsQUVDNKvNielI6ljqw5TaR85mn/cb6Pue60pZKykhQhDijLaicr2svnQTc8Vp8SVwJlr2gyAiZmBiAWSYQwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206974; c=relaxed/simple;
	bh=i/TwdGp+BA7bcCbUaS27/zSXNms0zRubvU+qiejq2vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4+XVxnUfu3haEsxUhinoPdCCE9sKESzndYqqSrOE/7001UlqtjxTBasXnNmv8Hd2lNTS6jWm6dvJrOnYOGLeG8l7Xy5h3+Ov+1PlPz9pJY1X4QdMJEs2H83Bpu1+Kjo2raHgJQfeQUO7bUdFnHUnQWlq2aJuJLMJxDjV3wKQUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBGz0Jsu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF96C4CEF7
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 09:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775206973;
	bh=i/TwdGp+BA7bcCbUaS27/zSXNms0zRubvU+qiejq2vc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bBGz0Jsub3Iv5dN5vQNU0tetuTWfJ38t0AAb6+uPPp2jL7eKsLlfHpWi+hZ3OgRoM
	 JxuexP7gIHgtbK6F7hXekQ/tEOqs6l7Vr32kf0oYyeViDGXBKwz5eTZEDaghAKeu2g
	 v9FYdBEgbYtEw9IiukzSV9AhaV/pVHIe03R9Eax78fnRldcK2mL+v2XHei6BWcKkSA
	 11wztYrXWDRxXW2/oTocwUPi6WNw4SrloBTk64s45B5ZKyLjD8E2UF+sKQjUupsPxS
	 gfoKHMh+3Oy/Ws/txMG5KjYtGIL2W/DFeUUw/MqTnuZIs3O/Y3LAKSlXgaH8g2XM5r
	 hAQGVKQ/3vY6A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a3cee3a271so5291e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 02:02:53 -0700 (PDT)
X-Gm-Message-State: AOJu0YzmG6dVz5s2mJPmpT70ecj94+u1qDRg4PO2ArTZeqtBJm1EEkpt
	ngRzShvGTN13fV08Tu/zITCM76cbu4jIRTCdgKPhYdJ1UkuzAWy9WV7PjsJp5zo6q08mAuFcqt8
	dkZwTopt28x9/LS8b09EHeIJwZSbcEgEEZokQuHzPPA==
X-Received: by 2002:a05:6512:10ca:b0:5a2:c453:3658 with SMTP id
 2adb3069b0e04-5a33758f086mr729247e87.43.1775206972358; Fri, 03 Apr 2026
 02:02:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401001459.19159-1-vfazio@gmail.com> <20260401001459.19159-9-vfazio@gmail.com>
 <CAMRc=MdbVb4cXGE56eLOpAe33mgBKC971K-W-z8mUVZh_aVsJQ@mail.gmail.com>
 <CAOrEah6BHFHeCWxqzR57jOrAaJ7h6+_uwBn8bTFMr4x0oRffOg@mail.gmail.com>
 <CAMRc=MeQ+AXkXiCbELywekSEOsd3N_DZf1YNMMMYy=mCGWVLEQ@mail.gmail.com> <CAOrEah4FxteUvZHn-zN2fX7e7cvfov4gVw-AKbzgANg+ur6wZA@mail.gmail.com>
In-Reply-To: <CAOrEah4FxteUvZHn-zN2fX7e7cvfov4gVw-AKbzgANg+ur6wZA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 3 Apr 2026 11:02:39 +0200
X-Gmail-Original-Message-ID: <CAMRc=Me286zYriFV-nFNV7K052RAe8H32CjZXbig2cmny7gNXw@mail.gmail.com>
X-Gm-Features: AQROBzByn-FI7UxGBVD2VccGS_spBbvPSFWhoBj0B2pK4lSu3-ZPSB2qpIaHcLM
Message-ID: <CAMRc=Me286zYriFV-nFNV7K052RAe8H32CjZXbig2cmny7gNXw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 9/9] bindings: python: update linter configuration
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34627-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E88713928CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 7:01=E2=80=AFPM Vincent Fazio <vfazio@gmail.com> wro=
te:
>
> On Thu, Apr 2, 2026 at 11:43=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
> > > Some repositories try to implement these checks as part of pre-commit
> > > hooks but I wasn't sure if we wanted to go so far as requiring these
> > > checks
> >
> > How about making it part of the dist package generation?
>
> If you think it would be valuable, that seems reasonable? I don't know
> what that entails however.
>
> It may be "late" in the development flow, as in, at the time you want
> to make a dist package, the lint checks now say that there are
> suggested modifications or fixes necessary preventing you from
> building the distribution.
>
> Ideally the lint checks are done prior to patch submission to inform
> users that they may have overlooked something.
>
> It wouldn't surprise me if I'm the only one that really cares about
> the strict type checking and formatting. They're obviously not
> performing logic analysis; they just make sure that data types are
> correct/accounted for and all code is consistent in format.

I do run them but don't necessarily want them as a commit hook since
not everyone is working on python side of libgpiod.

I queued the patches, thanks! I have to say: it's crazy how much
faster ruff is compared to mypy.

Bartosz


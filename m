Return-Path: <linux-gpio+bounces-36208-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPPxFZ7t+WlqFQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36208-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 15:16:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0CA4CE453
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 15:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB0C83019E63
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 13:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B08241CB7;
	Tue,  5 May 2026 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtSb7I8C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ABC1D9A5F
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986951; cv=pass; b=GPy/jI39L0DyK3Nfr/X9redWYYdNBaK0YKCLR2vhIZpKVnMpikM8C/uitHPfokt7c+8645upWxGVX23f8j9HTTzawxP6NUumwGLPVuQfHIXVXfXSbhekELWEUoLbv2VY7a4j9J013phVxHMH/2/abwE9MB/MlVlZnSvC7qnTIWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986951; c=relaxed/simple;
	bh=+U9t8oE7wEAPl231oOjWXJB/gwpNB0KaIYCo9tgJGXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uCotCx+JOCIKKh8PlzlPaKArcUtK6ZM4MIFQD2QmoRu4aM4tkV2pzXkq/LtCXDGvSiojVcazmdO7f4DJqg3ZvjXojxwzKeDXBMi2aPy3A1IPgP/N6yR/Sh+uBeK95hBM8Aom0E8DXpVqOgloTheqgZXU/3GvkA1Dd1eR/+04eTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtSb7I8C; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-65c1ba7eeb6so4555499d50.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 06:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777986949; cv=none;
        d=google.com; s=arc-20240605;
        b=R5GYvxOEoc8+6rvqgsFFnimc6UDvsIAhL4OIDJD2eOTbS7CR2rqaxWpcMlFjuAgIyx
         Nk6bMmQysT6jaPr1fAHkgLQ4RkIa2wQ1xaKiaDbHIV2tcB8/UPvGWXBt1oaAgbMbQPxb
         cjXQ8Yn0WvP1FvyERYJCgNs8dgozNQiApYGPHv6nvegYqnrYtBoRR9sVhb+UDnCRo3yh
         Z1IXVaWvqz5wJSNuWY4sP5QDquZKk5uFswAd2uBQVczoJo01kpOXXossPo8G1uu1Fq+L
         c0bAzJ2xd4CQvDGje0gqZHKdOjqz+lX+2KONp/d8On/XMc5oNzr0TFmaQODQYftvCIm+
         1aXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+U9t8oE7wEAPl231oOjWXJB/gwpNB0KaIYCo9tgJGXY=;
        fh=Oswr80MH8ACTA4tvz+fj7MfQUxOMuMBhYKrp3Z07T1Q=;
        b=C86Z3+rujB2mFv+qgm1EpShZ/KVkttrFQn6PoTOzHAnxoVrSCfR0whVgnMkV7DkIUY
         t9bvhBTC1yFctb24lCyeDxELBPv2Ej2Sg4T+0E2AyzQdJwCtLcvtCjHv3gR9MYbYw6U0
         ow5V/c8GmqIebXOo+pMuYxvXy/c94d3iESrAcYV7qZqnrIh5iGSlznCmf4HMRmWPy6VX
         iyJjy3+HRZKneTBNb3mA0TJgggIQNBdgtd/CNzDH2EXDXxCBZ26noo+hyr0g1lJ5ipjT
         0+xp8VlOLaY+oxczqLejPPnNxFKus4D8WRZCqrl6867L2119vtU/cUJkKFNVyOLxUUpM
         gdCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777986949; x=1778591749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+U9t8oE7wEAPl231oOjWXJB/gwpNB0KaIYCo9tgJGXY=;
        b=YtSb7I8CgH/QpvVikm7nhjdsMoUGjOf7XDw4mtREWSlMo6hrnMi6KUD4g0cbI78Qtx
         +vJ6Ux230z4Dj6eFYgAty5d1m6p8uQ/XuaJhutiF287HeL3JTSalWDQUsMy4fXA/S35d
         4RFUOTtk9WK465NrvErwo+PjTnFx8SnV4qw6/oQT4JAYkIiHf2zOPtBTcM6guzKZ5rSI
         +WDc3NYIj934u9mEKI46nCsHHHjP4PohU/V1yGUEf4UxsGx/WQJ2PGJQwZ4UyplUwhVI
         kxLQtPP8MHcVLkA/r53oMwPu9bIcxEr9aC5mMbV3p3epK2V7QJ2O7MOG7DTFkKE4ags/
         98cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986949; x=1778591749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+U9t8oE7wEAPl231oOjWXJB/gwpNB0KaIYCo9tgJGXY=;
        b=krqVb/Hokgx/o2vuqoARkvR9I5wIjgYe2rhrN/bvvqTQ0g7HVb6/vZVDVuhrgOdy0B
         JcQIDaSSoHx6VahuLPgp/oRi6YpH6/2/w3SA3TWruOqbQROXVNpgmCoV5F4sfalZM7xe
         FvqxoyaFJiB5IbtZpgY0UYd65MMf6XC6s/EkJjBTPWf6yIfVIExHG6JLMzyCY5VsnM8A
         c1MEOHJ+CH0cZENNi4whZiJFo4LGhTuBhgahmr3vVprXPewckrgKG2rUZb86Q5Ks2CUP
         Eow9GYm1YMUGc5Ox+s3r5aY+AH2F2M8wGBXVwCx3pQXTVNGbMmeGGhgFt6D0c41ltZe8
         BQrg==
X-Forwarded-Encrypted: i=1; AFNElJ9yKrpORBvigyiwRolzSUeHsAiGohbLIOAFQeqkK6wXUnWftUy4zI8SFJ45QW+rZFX9pVuN6rcBKbFt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu7rZZmYvBQEYOV779TRxyQ/OlZi5uAvhAfcMe0zQiWCk6utB0
	+OK5bN+6vH/PMeh7VvuXoA5qGkJqErnyf9jy1cr5VtYddAQwel4i8JaFUCnlnj1u2+kscdrTIP1
	KcrjFvUQHH3DE9CpdGiXfDgv3PDx0S56rYQzg
X-Gm-Gg: AeBDievckW1Km9wb1XA6Teb9YDPch4o6wY7lcSrhbeB/WZhffrSvM2YKPz1tP8ntKja
	3GbinxOn+noBtZoas3kmUyZO6VvAFasV/ynacMww8zpoSh9mpS22q2LVTLlktGaYRC48Jcsvq2Q
	W2eb7bGV8xrx4UOqu3EHWyHbM77eqTK9C+wpYkSf3rDN4bEafihPFxS+xN67XXkDXdmVN5EyyuJ
	KvNOzg8wYUHcDwMnSQrj8jbRt0tn9DkcMXAhnOpNmAVCyQjpMnl70KCrKNEDVhNfHV1ujRtHgyq
	cGg965oxqLH1Ll2lj+NjlkSReb9XpmAX01Femwf5uuatmFMbIL5xA6FE55t3ADQ=
X-Received: by 2002:a05:690e:e85:b0:656:25e6:e127 with SMTP id
 956f58d0204a3-65c3d971eeemr14386808d50.11.1777986949230; Tue, 05 May 2026
 06:15:49 -0700 (PDT)
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
 <CAKYXYMQQ2UxLJw=2O2y=fLL6Kpp3eUiaH7Rx4MF5H7wcoYzcLQ@mail.gmail.com>
 <CAKqfh0E5RnOpkXBgJ5gUzPgk0dYs_NRi3=9Df0DiSp9RebgmSA@mail.gmail.com> <CAMRc=MfD45paQL9f=exHD47XuOnhSRurGHCgyZpWVe4WLxAKDQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfD45paQL9f=exHD47XuOnhSRurGHCgyZpWVe4WLxAKDQ@mail.gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Tue, 5 May 2026 08:15:38 -0500
X-Gm-Features: AVHnY4LKa65hpS-5lHn6_84qY-2uPThE_1ufQHepNKHaM1hAhBCuoHzRqTwlBos
Message-ID: <CAKqfh0HBEQ_5XGKvvwXcwSyV9d6Sg0i1wbZvyRDreb8Z+MydrQ@mail.gmail.com>
Subject: Re: [PATCH] tools: gpio: replace strncpy with strscpy
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Lucas <lucasp.linux@gmail.com>, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1C0CA4CE453
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36208-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Tue, May 5, 2026 at 5:57=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> Are you guys two AI bots just talking nonsense to each other? This is
> a user-space tool, there's no strscpy() in libc...
>
> Reading this was a waste of two minutes I'm not getting back.
>

??
No, some confusion arised as I'm typically working in iio and gpio.
I'm more used to having strscpy() readily available and thought that
not having strscpy() in the tools-specific libraries was strange. But
the stupid thing is that it was aliased to strcpy in
tools/include/linux/string.h (#define strscpy strcpy). I'm sorry, but
we really need to at least get that macro removed, it's pretty
precarious. Besides, we're not trying to change glibc, we're just
trying to move in the latest and much safer function...


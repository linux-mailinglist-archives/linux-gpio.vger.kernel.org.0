Return-Path: <linux-gpio+bounces-31409-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHWGISeFgmmDVwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31409-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 00:30:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8BDDFC28
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 00:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 270483008447
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 23:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6121F314D08;
	Tue,  3 Feb 2026 23:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAFicOEY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F0D2877FE
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 23:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770161442; cv=none; b=GvxzTyuHtHPjLhteWOejjvFnG0VGPbt10briSNPGBJ2ocKzTJTwnGsp/wM6hPm+zRaEomA4+9dj35xUpHlq8TGYXR7AkXqieTDABWm7XnvUKVz6nqPBtz64hgB3a1JJskOJ8I0jIVDU1KfKWCvoxZo1Q3LRvAaIed6DIFoGe1JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770161442; c=relaxed/simple;
	bh=g5pAdvC97NiUL8Wc2uvSwuYquotlfFaE2JRt/ZYKfvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cd0yQ1u5bqJ05R3nQc4G47JSzIlTOg1FzeCuRoaZ3MvIHbXUfl1TyRFxFgWzsn/K66uyGSgrzOK53LDjKF1BG5tDsnykLaNSASIwIw9aJc5V9xLKQnhPidYd3DpwZkoZHjj107UAvCd6a90cx6/IxeCjyvqN4JcnIBM9KKJiP/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAFicOEY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75A1C4AF09
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 23:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770161441;
	bh=g5pAdvC97NiUL8Wc2uvSwuYquotlfFaE2JRt/ZYKfvg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eAFicOEYQhr9moECLmfpJPCbF1LK4zbnnbA4AOHXxuheZI42aVGZvvg7rySTexcG3
	 GnUOcFbx3I8KZw8i6HaMtN3OkKYNswjbLMFU4RVg+qQosIMlj384H5yiS9+gpM75Fj
	 /9858o5o5qRab+RlHmhFcvB8VQ82eHvGiIzQLzB+OHy/E99t3kOfZpzBarM6xWpCsD
	 loA3bsbQ44nsghr3rCa7shcJEt3hrfVwoTYFM9yStQ/+qHzuwEPfnb+diZaEaxRaKv
	 aSOtLl47ccpB1Zzvf3ocylI8eCEMqSuUjdUhtTsouNOyQMwRAIsIoD/eLh+k3rDAsZ
	 crpCjGoOwJiEw==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-649523de905so543938d50.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 15:30:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+HSmofuObrgfnuyEPxtqpCzqhgwec9SxrIE/bBKXZMpetsTevyEQcRcjbfa7zvdu6PkIRCyi2sjbD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv+BWn0UxVKdj3Qfq4u1mTZvE024hd2TFXMp8ufJKRcRBhdsdB
	F0KfpcluMSIOxu0CVuZs2tOrR8bNtHs7me+zPj0UISF0zDUc5Bkuhbd35MtGqoeqLRE5k5IlHsX
	69zxpXQFx4dxHZU0XrHZlVf7J11Ipi70=
X-Received: by 2002:a05:690e:1381:b0:649:b6cf:2a31 with SMTP id
 956f58d0204a3-649dbdbe1edmr1029570d50.6.1770161441189; Tue, 03 Feb 2026
 15:30:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-device-unwashed-ed24f8592d79@spud>
In-Reply-To: <20260203-device-unwashed-ed24f8592d79@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Feb 2026 00:30:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLnz1r1gnE3B_0MCr0JrfEdT-74nM7wL3ErdrmzHOrnovQ@mail.gmail.com>
X-Gm-Features: AZwV_QgRjIQ9yhpCtYT_vbhdnEDolow2KdYOCvuHHcsDnMlYn6xhqIZ39tA7zUU
Message-ID: <CAD++jLnz1r1gnE3B_0MCr0JrfEdT-74nM7wL3ErdrmzHOrnovQ@mail.gmail.com>
Subject: Re: [rfc 0/2] pinctrl property checks
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31409-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA8BDDFC28
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 6:30=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:

> Finally got around to sending the property stuff that we were talking
> about. It's definitely not the best thing I have ever written, but I
> think it does an okay job of warning about setups that don't make sense
> while adding fairly little complexity wise.

I like what I see and I think we should apply it for the v7.1 kernel cycle
post v7.0-rc1.

Are you ready to send a non-RFC version by then?

Yours,
Linus Walleij


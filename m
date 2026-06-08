Return-Path: <linux-gpio+bounces-38124-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hXpbLJs7J2rmtgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38124-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:00:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B917565AD8A
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:00:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bzSQe99D;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38124-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38124-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53771305E187
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 21:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D839F3AFCFB;
	Mon,  8 Jun 2026 21:55:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFAB3A382F
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 21:55:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955728; cv=none; b=m/9oMAdWM+EyP5dpJN5Uxl/pxQvjQGMom8fYu/Pt3PkwBAVpxd/e9touJMPe56NKddjEKaZdveQkoesdmrxxxOm8G/PjjtsiisJwdR3dZLnCj031ZTqv3OUcYDBTHHVK0gLvlV5o3FQsAG+9I7p3qQUGTfQloeQtcrmC+KWZhnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955728; c=relaxed/simple;
	bh=lC1xNdpfThPoEU7AeOqS+ELgjb12wf5EpBZH0iSZt2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/8a2SKJxTSN9dNMlZeM4RA1iqryQ1vD03uwvbqHir579zBq0i62u++z6qCrDJLQd11eKaxvlJveQ7uiTkVaDeSFJbz7RxHPVrGFSXnPgniHdaU7Qj8aj5FbhMjwnm21JVFRFL/bUQfAskK6Y2o7AL6eTNhS0wvTwPgoOG5KTbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzSQe99D; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA4B1F0089C
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 21:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780955727;
	bh=lC1xNdpfThPoEU7AeOqS+ELgjb12wf5EpBZH0iSZt2U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bzSQe99D36YekRvVKmGLFfu3rNXzukdWlW3oMg3HAfj0UNq9D9y7UFyMrAlFD5fLg
	 e6T7hqbBJBeKoFUyFSrtS1Ml+JGWhhx6qBfvf52NoUYuRZafpMmnuB4qg85hHYdYEu
	 PeM/Yw7Anpo97bVrdrK7y19npfD3qQQPASXcXm3lCMkdLOWstQnkOihqTlNtHp6hh5
	 naA5lvqlc/ep1nU7heLQUsf0cA/8dldiaJ15sdsLeqheEN3c11aVCvqEfMDFXuY4bJ
	 cT+qX4RtWWgVqMFWE+/dkzgcIr3+2l60tE8bc0iAnoMwTuf90q6Arna1hn9JNfqT5G
	 7Jf10B3J2rq8g==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa5ce4904eso5041591e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 14:55:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8cXNw5nbaEPWOypeGpZ4I1iIG+EXgXEQJojPQyhLxjwQgNwtJsw7W5i8JD3k4stG1Uba17QSyeNDxu@vger.kernel.org
X-Gm-Message-State: AOJu0YymZqUaOC6gXWn6M7p5XXI2h/ENfLA6JqnhTg8abir2swzZ/13i
	KCMbcYuhaTq+LkvVzBBuLENQB7IKyzl4ZSimbG68clxyetAufMHXrOdvaUxdmOBbID8G0qKDbwN
	32XiOR022g8hK3xaWam7k0fyHX9ahU6w=
X-Received: by 2002:a05:6512:10c3:b0:5aa:6ede:61 with SMTP id
 2adb3069b0e04-5aa87b535a3mr5504788e87.18.1780955726290; Mon, 08 Jun 2026
 14:55:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531162237.5290-1-l.scorcia@gmail.com>
In-Reply-To: <20260531162237.5290-1-l.scorcia@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 23:55:13 +0200
X-Gmail-Original-Message-ID: <CAD++jL=g+HBHrisHz5xpCQ19PUAgETg5Aup-TPW=z8OYYbbHDw@mail.gmail.com>
X-Gm-Features: AVVi8Cdd7dUgCoIF72SNZ_fl1W0Mlc5iGGOTuSyuNj18UF2jvt6wdQnX3ggGyEM
Message-ID: <CAD++jL=g+HBHrisHz5xpCQ19PUAgETg5Aup-TPW=z8OYYbbHDw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8516: Fix Schmitt trigger register
 offset of pins 34-39
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Fabien Parent <fparent@baylibre.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,collabora.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38124-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:linux-mediatek@lists.infradead.org,m:sean.wang@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:fparent@baylibre.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:lscorcia@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B917565AD8A

On Sun, May 31, 2026 at 6:23=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:

> The correct Schmitt trigger register offset for pins 34-39 is 0xA00.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Fixes: 264667112ef0 ("pinctrl: mediatek: Add MT8516 Pinctrl driver")

Patch applied.

Yours,
Linus Walleij


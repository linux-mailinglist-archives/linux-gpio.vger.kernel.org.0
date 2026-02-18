Return-Path: <linux-gpio+bounces-31825-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIo9MspHlmmCdQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31825-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 00:14:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3277615AD70
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 00:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 046FA304BCE8
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 23:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335AA33A9EC;
	Wed, 18 Feb 2026 23:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fR+LkAX+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E1233A9E1
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 23:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771456245; cv=none; b=r25Q4EX7UB/91rPbgraEcBHyO+FWcmVBCdaXakNVzB1g6NRyEXGW57MUMbqrD7/mjoGhMXeVM/lz9dVQ76MaV9DxEZILVa4qe/lsAZT4Yp14QLKM2YRSBWczX31B31jWdbREnBoth9J+J2WcFxv8/VV5SxKbURwj439UGSVrsxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771456245; c=relaxed/simple;
	bh=xIpqj1kuLqc6C8Cj1tBcVrLxr/YWHZwSJW+5Q5a7RoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtzH/47nuJnizqvPoyHL9GlR1BsSr7OzZI6ngScSKM8RrVM4ym7YcCHbsluUzIl6/yMZHNBA8VSxcn3iFBnzCRJ9HjPAbMKuaXb63BcMDM8vPuwGUorH1ydCePV1MGCb0oZrwuLpK/wZnUrF3ESpdObVki0L+L9ZNw3kuJHzPIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fR+LkAX+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E1FC19422
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 23:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771456244;
	bh=xIpqj1kuLqc6C8Cj1tBcVrLxr/YWHZwSJW+5Q5a7RoI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fR+LkAX+MnnZB+MZzPczigiqfLi4vR2peae10WdFdNjLnr/N0R61OSofz68OhaiXp
	 MQpp8ZQ11oGQ+WCnVEeQ7xKdmEfCtRf6Hvhr72ppdxcTUhJrobtZgzpojQPPi/E0yY
	 c2B1ZSoWyz74A3DglXIigGaE/NZ1/AWhsqlMH1G1hCM7TN3FKN4hC2YAlT7AxKMBlj
	 6mdFiwvnuOf62M9XHc9ufyLgQGUnZHpj4GfMTVE5djZGnHC/mnxJcCTovZHvlJ0gIZ
	 XbeZvvUw+uYjXaB0uWHnPkoBqq6/NhiO5hH1SotkoAgitQwX8au7rMVRYFFofhuOPB
	 GPyHj6zOwjMdw==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-793fdbb8d3aso2887167b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 15:10:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXai5RdWbYjv5mHNQfjXahynBuwipYg0SH39ql5HlNDLy/z6ynTG/zc61VTFGUe047D7of5mAOxAn3N@vger.kernel.org
X-Gm-Message-State: AOJu0YyXezmGpl73AEKNATKX1mECvjoQZbuVrBbVGTfGMYentdBiV3iC
	N0fnGILxD1DkkxCKwNuPwmypuV6zv+jhFnI52KMm/eyIUp92Z4IvMU7j24U/lAbsiwreZYcRm+R
	DybT4WgSOhGRB2k2AgiqycEhEuGnmOm0=
X-Received: by 2002:a05:690c:c223:b0:78e:6176:2c8b with SMTP id
 00721157ae682-7979e8cd2afmr163717277b3.49.1771456243913; Wed, 18 Feb 2026
 15:10:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214213239.2546012-1-james.hilliard1@gmail.com>
 <CAMRc=MfK8k88PfQPvP=p1r3KQ40dwcZq4Z4f5fnRFakpYcknvA@mail.gmail.com>
 <CADvTj4r4mR0_HxcOOZFqJTVfoD=YdrGd2AD+hQNw6ciGUC=C1A@mail.gmail.com>
 <CAMRc=Me6v2E1zKGQzukJmP45cVkRWOGzYoO9=LKh63rPFRqfqA@mail.gmail.com> <CADvTj4ovM1faNGoUa4HoTCN7avAqwkZfY5v9P8okgx87or8gDA@mail.gmail.com>
In-Reply-To: <CADvTj4ovM1faNGoUa4HoTCN7avAqwkZfY5v9P8okgx87or8gDA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 00:10:32 +0100
X-Gmail-Original-Message-ID: <CAD++jLk0Frxd2ixJwHXSq+LYg-5HLbTxEraUYqNPjHxD-EaZBQ@mail.gmail.com>
X-Gm-Features: AaiRm50HcS7Xf4MZmWf2rrmn2goboKgfnz03cNdzQxbeXDy0YJqTbatc-MoiXw8
Message-ID: <CAD++jLk0Frxd2ixJwHXSq+LYg-5HLbTxEraUYqNPjHxD-EaZBQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: of: add gpio-line node support
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31825-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3277615AD70
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 8:07=E2=80=AFPM James Hilliard
<james.hilliard1@gmail.com> wrote:

> What did previous attempts look like? At least this is minimally invasive
> and shares most of the code paths with gpio-hog.

Gemini gives the following (rather accurate) rundown to the prompt
"Can you find the conversations on the linux-gpio@vger.kernel.org
 mailing list where people have in the past suggested to extend the
 gpio hog functionality to define initial line states for GPIO lines?"

This is based on the response but cleaned from obvious hallucinations...

1. The Original "Hogging" Proposal (2013)

The mechanism was first proposed by Boris Brezillon and later attempt upstr=
eamed
by Benoit Parrot.

Version v1 thru v6, enjoy:
https://lore.kernel.org/linux-gpio/1387463671-1164-2-git-send-email-b.brezi=
llon@overkiz.com/
https://lore.kernel.org/linux-gpio/1416527684-19017-1-git-send-email-bparro=
t@ti.com/
https://lore.kernel.org/linux-gpio/1417726922-10376-1-git-send-email-bparro=
t@ti.com/
https://lore.kernel.org/linux-gpio/1418422051-9471-1-git-send-email-bparrot=
@ti.com/
https://lore.kernel.org/linux-gpio/1419019671-25377-1-git-send-email-bparro=
t@ti.com/
https://lore.kernel.org/linux-gpio/1422899085-678-1-git-send-email-bparrot@=
ti.com/

Markus Pargmanns proposal to add gpio-initval (2015):

https://lore.kernel.org/linux-gpio/1439979512-3894-1-git-send-email-mpa@pen=
gutronix.de/
https://lore.kernel.org/linux-gpio/1439979512-3894-4-git-send-email-mpa@pen=
gutronix.de/

The Argument: Users wanted a way to say, "At probe time, set this pin to X,=
"
but allow a later driver to take over.

All initiatives stalled on the following: you have to provide a DT binding =
that
the DT maintainers can accept. From a gpiolib point of view this is easy to
support, and to us it seemed (seems) neat.

> > How early do you need to set these settings?
>
> Well, before userspace applications can interact with the gpio lines I
> suppose. Essentially so that it acts as a failsafe configuration in case
> the userspace app doesn't get started for whatever reason as well as
> giving some initial starting configuration for a userspace app to act
> upon.

This essentially becomes a kernel intialization of a userspace driver.

Nothing wrong with that I guess, but it raises the question why it is not
a kernel driver (there are valid reasons for this) but also why, if it is a
pure userspace driver, it has to be initialized so early and can't wait for
that userspace process to start.

Yours,
Linus Walleij


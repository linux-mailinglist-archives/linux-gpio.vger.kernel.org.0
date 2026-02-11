Return-Path: <linux-gpio+bounces-31603-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDHmCstcjGmWlwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31603-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 11:41:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2214123828
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 11:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70215306EC9D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 10:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488ED369217;
	Wed, 11 Feb 2026 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tB/Ii21W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09423331A5C
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 10:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806202; cv=none; b=Xyr2XPi64Y7jqGsG+J/fmOFXAIbbwsjFpxvf/tdlZRJPONE1EZW8Qupzu/YzaV1HmBj2cDpyNt5snr+8HnRf4NoDPL2oa1cGkKi+sTQnsTHHVtT2kitE8iIx10GjlhC/RAk99oNDreJjmIyaK9vxbe9VfQj1FucwJepSohgN1/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806202; c=relaxed/simple;
	bh=ih1V+A37D+uRjiAnbr4N+Ybx/RFaQHmXQ7DqGMqf/u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nz455tjYgm7wsa1ziuDW/EKF3MHXNdQC8NRJfJXlEjhHevpewjyQPmAR5AIFpdDh74rWq8oHEUVhAtUiyVH1wl2+aKSqd/K97NXLZwJCOoDVsujtEjEh/47l2xGMT6FUG/67c060nLvsDXGTzJHxhmSYRYxMZO8HSzY8Ro7P7rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tB/Ii21W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB421C4AF09
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 10:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770806201;
	bh=ih1V+A37D+uRjiAnbr4N+Ybx/RFaQHmXQ7DqGMqf/u4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tB/Ii21Wbm4vY9pOGVckwMzAvD6QYEZspVxSoeBDes6Ef1MlaNx9oV9BsWeKUsff0
	 /9uRYagr5tFUjUz/7J7PYrriCKuySiHy0KWi5bgGeKeemUrUEKjXSQEAOa5GGWE0jl
	 cd2RRjVba969EXyEcsWkGaZ5seYS30bIGu1Lp5LQHZlMpDFjbUQVpRpCsGPvcv340x
	 hV1l5CQFbTeQ9X/H7nMxt+WBv9z/gupJsB0PmWVlzfAYW7tCDHiT+FlxBgXWx/R2K3
	 +2FbNyUUE18SgcU+ALHv7x74rvHR0e8V2qrRN/kieytDYTkhkD3ua+H6oHKOaWqNZx
	 +mMfhAof9tYjA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59e61e94e1bso177862e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 02:36:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkcwpMbeLIXQ6VtXN+InOXXJmGJtQiJ5Kbvcz2a/YasZUnVACNTIoaGmVotXXqFlNOKqpwfCmtkO4Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxRawF3rTrww3iMq/oQmnNVm9hgi7VBv7OqjhBhafSh3+WUZSRh
	Tusw3f0BBSwx+KG6eyrBIyQxP+GErzK3o6CkAHySQ9H7OWCR9UUzCWyV8AYOYORSDpUiyrFSyAI
	U0P+UQQuino1iJEsFNsqTLXK3uRJ6a1Y2IXobXfo5Cw==
X-Received: by 2002:a2e:be1b:0:b0:385:f3b4:2df7 with SMTP id
 38308e7fff4ca-3870705205cmr4475291fa.16.1770806200421; Wed, 11 Feb 2026
 02:36:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <20260211081355.3028947-2-james.hilliard1@gmail.com> <CAMRc=MfgoKmsNAmn3rO2jDL-ZArMX2Jh-n4SnV6rpzRY3KSwuA@mail.gmail.com>
 <34a9b531-4f53-47ee-861e-1b18ff1a5752@kernel.org>
In-Reply-To: <34a9b531-4f53-47ee-861e-1b18ff1a5752@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Feb 2026 11:36:28 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfwQ8J7eT_geEf7Kj230SOvmO-LDHz9a_YgfRY-QB5V8w@mail.gmail.com>
X-Gm-Features: AZwV_QiomL6baAynjRs36so9UQsF-GX-PQUeQ1j5sLkPJa3mEjvkSsbpVW-xp9w
Message-ID: <CAMRc=MfwQ8J7eT_geEf7Kj230SOvmO-LDHz9a_YgfRY-QB5V8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: aggregator: add gpio-aggregator DT compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, linux-gpio@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,glider.be,kernel.org,ew.tq-group.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31603-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C2214123828
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 11:13=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> >>
> >>  static const struct of_device_id gpio_aggregator_dt_ids[] =3D {
> >> +       {
> >> +               .compatible =3D "gpio-aggregator",
> >> +       },
> >>         {
> >>                 .compatible =3D "gpio-delay",
> >>                 .data =3D (void *)FWD_FEATURE_DELAY,
> >> --
> >> 2.43.0
> >>
> >
> > Regardless of the DT bindings - this change is perfectly fine. We do
>
> You cannot have compatible without DT bindings, so this alone is not
> "perfectly fine". Maybe you wanted platform_device_id entry for
> ACPI/legacy/MFD devices?
>

Sure you can, you just can't put it into upstream devicetree sources.
We have had a compatible for gpio-sim for testing purposes for years.
Why would it be illegal to enable matching of platform drivers over DT
for testing purposes?

Bartosz


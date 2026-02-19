Return-Path: <linux-gpio+bounces-31912-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJWuI5yLl2n/0AIAu9opvQ
	(envelope-from <linux-gpio+bounces-31912-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:15:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A966163153
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB544304C4B2
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6576132B982;
	Thu, 19 Feb 2026 22:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTWvn2SQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2472532ABCC
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 22:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771539274; cv=none; b=G84AQKMHdz6+lVkkmOd6NoQU6ZnLcwUEWbtlObhM8WtMOlhsxvimAMP7SgYmuwWQXOFjydAGNmy2J7hdb51oUu9zywAN+C+6MwPLE2HFNBDDxH+iEPuj8L74PfkOgaO/Ec9FGGp23q4Y+FN//UwC0gZMAr5utfOtMi3qHI06kHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771539274; c=relaxed/simple;
	bh=pZQ583VWIpCm+1qSwcPK9PrgCD/82vpkrV358KAInOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uu08QkOyPhdIGGWx+5uLe3rZK4TEPuaxR5MVkMXKVVPQej6ygv+5nGlqDU08XtIJyQ7GxboHwOJb9Fx4/vmJ+XUrDhTkqZEWxg4wXORgR6ujo8E2KD0Hm/N2/bW4xtnWvU5G2iz9rTFgS4hTI5a1efX7hlhj2XCpGIBA6hEpI/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTWvn2SQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065BFC2BC87
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 22:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771539274;
	bh=pZQ583VWIpCm+1qSwcPK9PrgCD/82vpkrV358KAInOQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DTWvn2SQbvKHCLzfXXJEzwgYKffzHcU73OB7Y6/ajN9mxRm5ILfbfybXfmoVU+1w4
	 R4w8og80/3CceuDrc7N2bUkbmYSc+YbzcwnqiWYF8fVv7xZrK+7cvU/amfQ/1NEpPQ
	 py4ZXHyRHgFqtlQx0qvcoR5MdcaHGKEitLMVYcpZVR6nuESUoM+UBKLUoXjCSd0zPR
	 uqts5v/LDOCikvEOSqm0EBYxUSdVrA0nVKG32eUH+izEpkQ3TpobLcxS4pLNPU9gZ0
	 UGiT1N4Hymu/tonSOarj4yS8sPLZEgiP9a4CNrQBI0oXS/9VFSg8z9q3nwJERK7ocR
	 sV1fxOwEtmhtw==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ad9fabd08so1403471d50.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 14:14:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWs1S0Se9MERds6ypm/kG7KkO7d7qqkZOoGPUv0e5QyzImpTWoFQPUzxzXUQrIV+A/1TlAwoHzkasML@vger.kernel.org
X-Gm-Message-State: AOJu0YwlJaDMk1Tq8ljvmRT23d6Z6a+Al1bjTwgAKIx2VwLwa8KvRqjE
	biMdZLJrluoLgJGelTGVdP6uYGBSSvkn7UEU2lKYc7/T7ruu7zaJivE3xu9mVkY3/gahcNTdoKj
	6mQUAI8FlVvodSke2FoFSiLvoySFvCus=
X-Received: by 2002:a53:e7c7:0:b0:64a:deb5:8807 with SMTP id
 956f58d0204a3-64c14d3ae3amr14639088d50.48.1771539273269; Thu, 19 Feb 2026
 14:14:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <338e6575-ec44-4179-94af-9086a7ca79ac@kernel.org> <92359c6d-06ac-4f8d-baa5-6fa45a536455@kernel.org>
 <CADvTj4q74H__JZftOiXkdsY3+E_Xmcx6Y6i70RQDJ0K09=XOHQ@mail.gmail.com>
 <30026ed7-cd19-4be2-adbb-e8bb155a75b8@kernel.org> <CADvTj4oBtO0Yhib1rE8QQwgtJvy-x_hK46C63mjVAydtxHOV8g@mail.gmail.com>
 <20260212195423.GA787785-robh@kernel.org> <CADvTj4rPq8D5piqEijCdAjkWmZtq3Bi_Kxv-4F0aU4xi_O5WKg@mail.gmail.com>
 <CAMuHMdXmMVgPJv=HhkfttiRnSwFC6c2PnFjYwmL2hu3ikv+t3g@mail.gmail.com>
 <CADvTj4r95E2rLA0ZhOYPeFYpFbj0EXfb=omCN2Mab-Dj4T-cYA@mail.gmail.com>
 <CAMuHMdXTg8w3R1BVq3JO2z=gvTdB=qXY=aXvC7Lb8FtkEqz9ow@mail.gmail.com>
 <CAD++jLmp+47f-Ah4YdFJ+9dU0OFrnQdOcVyrQ61p0-_P61eBrA@mail.gmail.com> <CAL_JsqJK7PwyB=NoM+uXOgQk-RT49h4emogvYAfUAbZUpnd6Vg@mail.gmail.com>
In-Reply-To: <CAL_JsqJK7PwyB=NoM+uXOgQk-RT49h4emogvYAfUAbZUpnd6Vg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 23:14:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLkJE0ruzPeRMuVKJbJTjHoa-fTKn8djN+0es+hpqhELFw@mail.gmail.com>
X-Gm-Features: AaiRm53FOc7ZhYYLZZe0NrqTkngiK-NiwwndU7yzK2q4iqB5Sit87XeqJrtxCYI
Message-ID: <CAD++jLkJE0ruzPeRMuVKJbJTjHoa-fTKn8djN+0es+hpqhELFw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, James Hilliard <james.hilliard1@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31912-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux-m68k.org,gmail.com,kernel.org,vger.kernel.org,ew.tq-group.com,bootlin.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3A966163153
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 7:29=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Thu, Feb 19, 2026 at 12:00=E2=80=AFPM Linus Walleij <linusw@kernel.org=
> wrote:

> > And as such it would be pretty half-baked wouldn't it...
> >
> > Probably Geert's suggestion to use the aggregator is a better
> > idea.
>
> I don't know what that is to comment. (Please don't reply with "you
> reviewed it" unless it was more recent than last week. :) )

I only think it's half-baked if IRQs don't work and you say they
do with the right interrupt-map so that's all fine.

I'd say James have a go at gpio-map + interrupt-map for external
connectors and see how that works.

It will certainly be more lightweight.

Yours,
Linus Walleij


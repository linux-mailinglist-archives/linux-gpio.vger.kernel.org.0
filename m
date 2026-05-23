Return-Path: <linux-gpio+bounces-37400-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCJOMN5vEWo1mAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37400-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 11:14:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9085BE220
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 11:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B1D323004C82
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 09:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA34B37C101;
	Sat, 23 May 2026 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2+BKGp5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0F3312819
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779527639; cv=none; b=AcByvCZNO4eDe8D95aLxVYyaTZ0IDiyFQwN6sOvqMv5oBce4eYKmnDjlSX1I3x8AlKQaBLBedCb4sFO54xZhsTbHgDDuG0+WGTro0pIOKZCjypZIxljroPthdi6WiuIvTtO2FlL/hOGPG/ggJvDNMlti/9MTg3vk86YrE1PA45A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779527639; c=relaxed/simple;
	bh=Oj9WONT2LmJnuM+KabzKdwYNSGGC4sxCi7v5wRCbaKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mD6Y8CqBekkreQuDD7uanu0dfzRu/GXoYN84XP3o9a6EjfU8HOCuPymceJVcP0croC3KbrJrzyw7SmJkIxY1hRz1NUm9rRXnoHHXiExX50VLnI1nerWZ+5BrreVA39966sB8dquUG/9DDS74UVrhRSepfg/n/zgjSHKC1X22R9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2+BKGp5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923731F00A3C
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 09:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779527638;
	bh=Oj9WONT2LmJnuM+KabzKdwYNSGGC4sxCi7v5wRCbaKs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=H2+BKGp56W+IThiQWqZOx5odAcV1/nQu6v2pjNnwPVgID3MBs7aKNZ7toGsu7hLNy
	 oIiv5XV8d2Z5t2v5l3yf2pLdhjJxxsahsxwCDus6jbKbQrcqqfQ4/si0jKNcj4GQRg
	 PdNpNOiSdfSwBCcOWA5UDsrZKOu9Oabw4PBQKpmKLk58U7/voKt5jcdN1YopnWe/4Z
	 X5M14WuXuSQvspAVooJcGbmjYQffcpTus1r9IbR3pePGQJgpxGeQyLiq61cbqM5gz/
	 KeGSzHRLopOlcHxsPGEC8C/EsLIRlVc/HsLaThoeKqY26UGz68xMKZ9iJ2N/VcnASR
	 kqWKAtKTLa1qg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-393c40246afso92481671fa.1
        for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 02:13:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9aAb3qQanQaXD99a+y0rXQ7ua3JXJSL3dWYjhp5vuwKj8H2BYhoIW6OZrL+6FPYjK2OPYJeoh7QfZo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2UXX1uPWqZ02FJn0s41F0V3rBPUU9bQNPKK47cldLBtYVhEzg
	mpzDxSaaSAoOCkrmHUAy/wunV4GCXdLqCh64zMI18BwaixoV8G+de8InP+vKYSV8XEqMdZNSQ/8
	ZkO6iK6SKRXDWw3Jqiw0o7CIIETMHdno=
X-Received: by 2002:a05:6512:1094:b0:5a8:8222:7fc9 with SMTP id
 2adb3069b0e04-5aa323ab2e4mr2502434e87.13.1779527637399; Sat, 23 May 2026
 02:13:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-1-b5c7e4c2e69b@axiado.com>
 <CAD++jL=yc4rmNELLKUpreUqRbQ1Krg95C-o1xSrnD9Aicm4wgw@mail.gmail.com>
 <106b7b64-ed6e-499f-b5ac-60c1277f2f03@axiado.com> <CAD++jLn4R9ubqHsek-56s1sF9YhxYt4-C2TPdYGcYjy2MC6q_Q@mail.gmail.com>
 <fd2ee102-db52-4a37-b96e-c16211e3d8e3@axiado.com> <CAD++jL=51iWK2SyxoWOTxSQHAq-Frd0mm6cPxqYu81qifFfHGg@mail.gmail.com>
 <c20dc0cb-252b-4637-bb22-6078be62b21d@axiado.com>
In-Reply-To: <c20dc0cb-252b-4637-bb22-6078be62b21d@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 11:13:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLkos3kC_ALAaoevaF29_Jf_WY5Z_2mZ1_Ldi+hCDbzt9w@mail.gmail.com>
X-Gm-Features: AVHnY4JJRfkcZxFTflgIKJvV2OpxrOyssZ0mBCArzoYH6Vt9eiME0imygNfv-1c
Message-ID: <CAD++jLkos3kC_ALAaoevaF29_Jf_WY5Z_2mZ1_Ldi+hCDbzt9w@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: add Axiado SGPIO controller
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37400-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axiado.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BE9085BE220
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 10:59=E2=80=AFAM Petar Stepanovic
<pstepanovic@axiado.com> wrote:

> Some SGPIO outputs may control host-critical signals. For example, if the
> BMC reboots while the host/server remains powered on, changing SGPIO outp=
ut
> values during driver initialization could potentially reset or shut down =
the
> running host.
>
> The purpose of `dout-init` is to provide a deterministic safe output stat=
e
> during SGPIO initialization, before any GPIO consumer has requested the l=
ine.
>
> That said, if the preferred approach is to preserve the existing hardware
> DOUT state during probe and only change the value when a GPIO consumer
> requests the line, I can rework the driver in that direction.

That is usually the best. The gpio framework scans the direction
of each line at probe(). While it does not know about the initial *value*
of each line, consumers can take this into account
when requesting a GPIO line like this:

gpio_vbus =3D devm_gpiod_get(dev, "vbus", GPIOD_ASIS);

This means the kernel does not put any initial value on the line.

Yours,
Linus Walleij


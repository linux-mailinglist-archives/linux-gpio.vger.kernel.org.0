Return-Path: <linux-gpio+bounces-36137-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKphEPW8+WnvCwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36137-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:48:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A12A4CA1AA
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 40B57301A93F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF6A2C21FF;
	Tue,  5 May 2026 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQtJCedx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C03029E116
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974375; cv=none; b=AvEBsitLwhE8gEGc2gXZsq+n3ibryQiDtkyiXzNpDQrb/RfGiALWq/mJlAS/4LtbHgzA4FSuynS6N8piI9djcLfaPfSWAEse+hT7YdgmkGcxRd05niAzYDJAfQDqjkR39ppQNxjiqCLb+WYmLncdDrRrjF/BXsiO6f1uF6qLXuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974375; c=relaxed/simple;
	bh=dRupWt7MDVmF6oGdB664BE5eszPjbUpZIphP9q4IEv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/K49dK0ooA7zyYLkTZwHApBjCEIGyrfrSq0HhpGhkzPnMgpQxYvQQO7uQI+dQkIa4QVeQFEn3eKEBLKaxjaOX4avt0z+0VmSxA8ifofzcq1TBN12EpSxP2oq8swrc1gJSfWe+NzRmksmbr/fli2609/RqvZSzvStMskxB1uz7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQtJCedx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99151C2BCB4
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974374;
	bh=dRupWt7MDVmF6oGdB664BE5eszPjbUpZIphP9q4IEv4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YQtJCedxy8u0UFTn/Z6rggc//oHiuQqDswnaVSXEzZXjqjI0w9mX2UdHleq6WKiWt
	 +eGDU6sLgcMk9tQFRzH2uREGjfqoh/rLzJ+kKi3QHYxshfyX3w1Q5U4+QCJXC6wm/T
	 LeL77ZnYXVolVQ+pHg9wrXJnytbV0hcEEGrmiKhY48QUslJRDEQbyBCIaBN3XFiNjn
	 is182kFm89xn2GHfj3WL2zl8h38WJcc4kIU8uGtcA4KhM6kV6NrhK92fm78mTzkI09
	 cMMMgZXWo1LtzJyQdjfL4FVKQvLjiaMzq/H3z0E9r/N0oMkEDXMyxDhnfVxNXoHvp8
	 Cmp1U6scGugJg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so3838013e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 02:46:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+X2PVnzT13MpBrcsW1k66WPj9xN5f/TBaR5gV0XHfZInmGo13z1hUyShCm6tdkzezaCt9bb2k1hzQj@vger.kernel.org
X-Gm-Message-State: AOJu0YwEwxNuyJ6rgzDa/wt5f7LSbUG/biNVki2BXWm0Ck7NX5ZKATMD
	waBcZJhwtt13Lo2OP/P+FnABgUGoIQlglyQDllKsbw6boix7EbB2wCXqzSWyES1oa65i4uSQ9G8
	FM57LXKWDmE6kMrSP5ksgxEpnEwp3AtI=
X-Received: by 2002:ac2:5599:0:b0:5a8:6b4b:bea0 with SMTP id
 2adb3069b0e04-5a86b4bbf45mr2490283e87.41.1777974371358; Tue, 05 May 2026
 02:46:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776872453.git.happycpu@gmail.com> <33d515f13769c685e6811463a14e111252a7c58d.1776872453.git.happycpu@gmail.com>
 <CAD++jLkOZGunkfs2EO_DQDPLnLVp+OPG6o4EKaY5GkAcqYQy5w@mail.gmail.com> <CAMRc=MfQY2Z+q=YGO0jEBip0dGjyq+uCH8EZwi9RaUOJxf74UA@mail.gmail.com>
In-Reply-To: <CAMRc=MfQY2Z+q=YGO0jEBip0dGjyq+uCH8EZwi9RaUOJxf74UA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:45:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLkkhB89iM3iBv+8cwK9fmmGWrEvDez1VcjGiWZp543hdg@mail.gmail.com>
X-Gm-Features: AVHnY4KHXq9rneTkcgED1JGQbSrHQsb9lHUBwDqL8Q1iTokG2fFYTi52Qwlz3QE
Message-ID: <CAD++jLkkhB89iM3iBv+8cwK9fmmGWrEvDez1VcjGiWZp543hdg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: gpio: fairchild,74hc595: add
 registers-default property
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Chanhong Jung <happycpu@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3A12A4CA1AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36137-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 11:04=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:

> >   lines-initial-states:
> >     $ref: /schemas/types.yaml#/definitions/uint32
> >     description:
> >       Bitmask that specifies the initial state of each line.
> >       When a bit is set to zero, the corresponding line will be initial=
ized to
> >       the input (pulled-up) state.
> >       When the  bit is set to one, the line will be initialized to the
> >       low-level output state.
> >       If the property is not specified all lines will be initialized to=
 the
> >       input state.
> >
> > If you want to set up initial states, use this property.
> >
> > This also makes it possible for us to centralize the handling later on.
> >
>
> Ah, the old initial/default GPIO values problem strikes again. :(
>
> IMO this is software configuration, not HW description. I think the
> driver should do it based on the compatible and/or machine. It should
> not be a property but if Krzysztof is fine with it, I'll queue it.

This one is particularly uncomfortably hard to define.

If we depend on the machine we need to sprinkle
of_machine_is_compatible() over all drivers.

A lot of detailed properties that could have been handled by a few
gazillion of_machine_is_compatible():s are already present
in the kernel.

What is good about the property that has the same name
is that we can create nicer looking kernel code that is easier
to maintain. The DT maintainers may not care about that, but
from a GPIO subsystem PoV I think the line-initial-states
are better.

Yours,
Linus Walleij


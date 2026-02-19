Return-Path: <linux-gpio+bounces-31893-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N6XM5FVl2lPxAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31893-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 19:25:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2BE161A56
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 19:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 204133039EE8
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77BD2D3EC7;
	Thu, 19 Feb 2026 18:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lY8saR0P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0212BD031
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 18:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771525438; cv=none; b=R7G6jG4lIK8P19X2Opi7lCmoZ1Gy+GlDT8+3R2EU/Uc2zoGy4lxZZbxxkJELUxPVreWiFrfJlkCn37gDXfNIUllhc7S6/H16MTXZ6mwV6Qcq97AaVigg78ogLqO2Np+XTHxPpRYoFkyKw2FJtKSAYT0J964oY0fAIsmuWxoc34k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771525438; c=relaxed/simple;
	bh=lXy1d6wvQJGKzYTkCdPPNk48AnwNeGwDJ77yxT93Bik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wk+jaLJp+gLSYHW8mrfdsSoElsknSawk2nCbtR/lTtZqF2fRwYM4jzICeulUMKXWgbSMDMbeCSI56IiEB45JTuqSonBlblGrzD13rkTkrj/fVwRpxAT0ZxvIRUgAtQ72fPUwteoH2oWdTDxH7dO2Gc1I1u9VtAeKC0tUsBprEzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lY8saR0P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EAB2C2BCB1
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 18:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771525438;
	bh=lXy1d6wvQJGKzYTkCdPPNk48AnwNeGwDJ77yxT93Bik=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lY8saR0PlYIedo9a3hY3hI4DastIpVhxCwF4rlAsahK0Dt3uH2S2AhSyOvVTSTULw
	 S+j9jShzyv1OjWPAUVpfPZn6oCQYJFxZxdmwo6viTYk9D0oetY5sLdB9Qf9lQoSlUL
	 RN4XlkbBT6BN9bMK+RTLP/HiDIByZJXzi7yyS5MvxdKNMYA28muunjl3iJQyHskIkD
	 ifqwgXEPdARAXtQVaG9Ne2foGHNyLIL04H0UEJkaqOJEN5oZno323ynNKATrzzQC5y
	 FMqx3MCc2VBTGz94EbR2xaCvF5Fl0oTSgG5bVCgtdtD0KTyQCvwaAw3uNvezRgCjE0
	 kEQK1i315dvJQ==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-790b7b3e594so12635317b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 10:23:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXC5rZGAMt6lmG9UA0Rn8ex3pTmmOO86dmxIklnNzDxl+pZSyCnkEPdtEkyszel8Px2zrNva6ioomOb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8CNMUQxskaeVY3uUzdXwFPoVXBcj8c8AumbLo0Isrr+BcDFhi
	baSZfQrGAsya1c4JbUEbclt+n3S4+9kaGoLunNvEofbA21IgUeNGG1bMZHA3rTc2sDwblSFN/KH
	Uwv/o7z+c8jfPaKPZ6UupeyFF0ZFthMw=
X-Received: by 2002:a05:690c:660d:b0:794:722c:3a2f with SMTP id
 00721157ae682-797a0c5f81amr163742547b3.31.1771525437420; Thu, 19 Feb 2026
 10:23:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214213239.2546012-1-james.hilliard1@gmail.com>
 <CAMRc=MfK8k88PfQPvP=p1r3KQ40dwcZq4Z4f5fnRFakpYcknvA@mail.gmail.com>
 <CADvTj4r4mR0_HxcOOZFqJTVfoD=YdrGd2AD+hQNw6ciGUC=C1A@mail.gmail.com>
 <CAMRc=Me6v2E1zKGQzukJmP45cVkRWOGzYoO9=LKh63rPFRqfqA@mail.gmail.com>
 <CADvTj4ovM1faNGoUa4HoTCN7avAqwkZfY5v9P8okgx87or8gDA@mail.gmail.com>
 <CAMRc=McR613nBkUehva0bidxrUz2eQ1Ud9g1m4gKdXyGzHo_PA@mail.gmail.com>
 <CAL_JsqLEKr6G4qZe=vvJzP+KC_WWh0SHOjg14rxQvAvxV7wNUA@mail.gmail.com>
 <CADvTj4pfuV1s7VzS-cw+66N9HxijZ8x4Gr_jgTqPEqDvpz-hqg@mail.gmail.com> <CAMRc=MfBt3ae2tdRKQT-AvjocN9OmC-jAtw0206rT3qGmSJDig@mail.gmail.com>
In-Reply-To: <CAMRc=MfBt3ae2tdRKQT-AvjocN9OmC-jAtw0206rT3qGmSJDig@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 19:23:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLk4Z1S-3Pitafv8Ok5HCB+K9o8PG53wsqLL1RNXM7753w@mail.gmail.com>
X-Gm-Features: AaiRm51FekWc66boFzrNlOHn4fvkJ1EkKglVx6_AXeGQIy2E_IDWreq1TEzE0zU
Message-ID: <CAD++jLk4Z1S-3Pitafv8Ok5HCB+K9o8PG53wsqLL1RNXM7753w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: of: add gpio-line node support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, linux-gpio@vger.kernel.org, 
	Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31893-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB2BE161A56
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 10:15=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:

> The problem here is that the state of a GPIO that's not requested is cons=
idered
> "undefined" and controlled by the GPIO chip driver. The whole "initial st=
ate"
> sounds very hacky. You would have a much better case if you instead worke=
d on
> a "default state". It seems Rob is not entirely against it. Neither am I.=
 It
> would make sense to tell the GPIO driver: "if nobody's using it, do this"=
.

Pin control actually has both initial state and default state...

Maybe it's a bit of a game of definitions here.

And for Linux: if nobody is using it ... is that after all deferred probes?
Someone can load a module using these lines at any time. Etc.

> Please don't use a property called "gpio-line-name" to define a state of
> a GPIO, it makes no sense. The line-name property of a GPIO hog is the
> label we assign to the line when requesting it. There's no requesting her=
e
> so let's just not use any new line names. I'd go with something like:
>
> gpio@1 {
>         compatible =3D "foo,bar";
>         reg =3D <0x1>;
>         gpio-controller;
>         #gpio-cells =3D <2>;
>
>         gpio-line-names =3D "foo", "bar", "", "xyz";
>
>         foo-gpio {
>                 default-state;
>                 gpios =3D <3 GPIO_ACTIVE_LOW>;
>                 output-high;
>         };
> };

And that makes the name of line 3 "foo".

Fair enough, I didn't think of that. This is a good pattern,
whether default-state or initial-state.

(I might not be entirely consistent in my reviews today,
it's mostly because I realize I'm wrong on some details.)

Yours,
Linus Walleij


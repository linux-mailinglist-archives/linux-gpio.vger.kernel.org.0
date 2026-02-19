Return-Path: <linux-gpio+bounces-31891-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BZOFMZPl2mBwwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31891-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 19:00:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E7A161721
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 19:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C77C3011164
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4E334C14C;
	Thu, 19 Feb 2026 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJjvBNXe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6512701C4
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771524035; cv=none; b=Y0Gz9q8AU2qzQXYOFmo21ioslHhr4PHFUhaKe4D9su9T9OtiQDZYuli4f1i3jwCN0q3y79MyeMrib3AQXEtiD1SRgkxPFd1SBAHJk7hyBvpkpzrQy1PLMJY/3cTDKQj4G2dzjiVyf7YMEMWGQnyHHoiNLHdIBN3nTjPFXomLQp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771524035; c=relaxed/simple;
	bh=Vd0TGCKwDjwxrdTTTbeezNwPkOcXDBgYpLmXijP4ozE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wjbs3LixMrfErkapDjBbyZ/51183+JrOh5QBRNIiuIsuQTWtqQ5mg05z6Zj5vMw5GuZb50lDwVm6hk2Y22W9L/Kho2SUZTPWSJ1OXGUaNq/sBW987DFdR4fA3iP+c4GxcLW2CgP79MrMOu3I4WR7GD74cWswLpf4hBQTCDvAFOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJjvBNXe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273A3C2BCB1
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771524035;
	bh=Vd0TGCKwDjwxrdTTTbeezNwPkOcXDBgYpLmXijP4ozE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kJjvBNXe/Ft3yQsMQP3a+xLWbEH90Mdr8VwWv+9tdKozlC6Q87Zi5Vyk6rfbbuK4G
	 5nvQJNQv3W84UjqpG3zOyEiAANCdnQXZT/Sr0oGG60WKhw6xj4XOMerJLw0vasg6m4
	 2CaYDbKg7Mj0XvFAD4A4VwnvSaVHdZfIeYv01ZZQ4WItcNSqZXrIMSkSdcNbm5e7lf
	 Fs+5wE3t28xuVb8lgeGDbDy2P/LIOxpjzaju5lqUfiz07HUlJc7XGi/QVOLcKAYt5m
	 nnsa8CAlxwmHrlN1ocj1J2xb0vQ2C7spf2EpOUG3JVlQvSxwTdhGqkDT8konbd+BJ6
	 RWSSqewsd7QlQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7964f1405a0so12632157b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 10:00:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFmi/7uT1TZPkNywg1QlYYtX4UUAuE7Amm+rydI5ho4lp8Nm50QwouvpUluFFGnWLVhTFZ1XzHiZaZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzVAcn0VLIPdHhjaTquTnRQB2GP17Dk9vT1a+enP9+Ay/nIMqgt
	IZc38cOjeecB1CwwJFIdFiz+h0Nar5NY9RNBwe3MD6sxEiDt1DiyOk6wN8bz7NRWw7zqy1HDAEn
	YwKNTLcfbjexfvxRANaBYS4jq12NpiyM=
X-Received: by 2002:a05:690c:450e:b0:797:e326:1908 with SMTP id
 00721157ae682-797e3261eccmr85214477b3.70.1771524034359; Thu, 19 Feb 2026
 10:00:34 -0800 (PST)
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
 <CADvTj4r95E2rLA0ZhOYPeFYpFbj0EXfb=omCN2Mab-Dj4T-cYA@mail.gmail.com> <CAMuHMdXTg8w3R1BVq3JO2z=gvTdB=qXY=aXvC7Lb8FtkEqz9ow@mail.gmail.com>
In-Reply-To: <CAMuHMdXTg8w3R1BVq3JO2z=gvTdB=qXY=aXvC7Lb8FtkEqz9ow@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 19:00:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLmp+47f-Ah4YdFJ+9dU0OFrnQdOcVyrQ61p0-_P61eBrA@mail.gmail.com>
X-Gm-Features: AaiRm53T_u-Y-r4syjqxT7cpvx2J3OittWnJffdNSLBtYJh-Z4zvW7avbn8Qk9c
Message-ID: <CAD++jLmp+47f-Ah4YdFJ+9dU0OFrnQdOcVyrQ61p0-_P61eBrA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, Rob Herring <robh@kernel.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31891-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,ew.tq-group.com,bootlin.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: E3E7A161721
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 10:06=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, 13 Feb 2026 at 19:34, James Hilliard <james.hilliard1@gmail.com> =
wrote:
> > On Fri, Feb 13, 2026 at 1:25=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Thu, 12 Feb 2026 at 22:22, James Hilliard <james.hilliard1@gmail.c=
om> wrote:
> > > > This gpio-map feature doesn't exist in the mainline kernel does it?
> > >
> > > Yes it is.
> >
> > Oh, where in the mainline kernel is the code for it? I searched and
> > couldn't find any references to it.
>
> git grep -w of_parse_phandle_with_args_map
>
> Note that that does not find interrupt nexi, as that code doesn't use the
> of_parse_phandle_with_args_map() helper (perhaps it should?).

I doubt interrupts on nexi works. Which may be a reason they
are not used very much.

And as such it would be pretty half-baked wouldn't it...

Probably Geert's suggestion to use the aggregator is a better
idea.

Yours,
Linus Walleij


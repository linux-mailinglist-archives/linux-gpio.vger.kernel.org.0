Return-Path: <linux-gpio+bounces-32252-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wB9LEbbNoGkomwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32252-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 23:48:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADBA1B08D3
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 23:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81B36300D313
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 22:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DF0426ED4;
	Thu, 26 Feb 2026 22:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9jj9L4W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5813A0EA1
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772146065; cv=none; b=i+TEhG36Gy+uugJRDQ6SNXURAwZLbBwUSikl/TCnUeHJuvwNiu1M8Uyl6OBNa8BriBDjcXn19NeIwqzKpJyGa3mBankvoCK5POOwUY7l3mM72whyN6/X2rq+k2WAGtphrwsblpafc9TD6hkcfmurfzHqG1d285kKDntOEHN4Ec0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772146065; c=relaxed/simple;
	bh=APviAckhtzsGqbkWRx3zBDJ8cA44GDRByy6wgZmyjLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYnLCiEg4no5xiK9hgGXb3nK1gd2ldEtIzL380Q23qNKIu8mSkbnt8VsJF73UqlT+qjN2wWFiDvzTJ2pdUICN7760grCTBfXV262Dj2RkeTED7IHGNY+rBuASt0Geh55nCwrf0ABdV10rBmRH0Z5rD0DOuXNR5Bix++G4aho31k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9jj9L4W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2202C19423
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 22:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772146064;
	bh=APviAckhtzsGqbkWRx3zBDJ8cA44GDRByy6wgZmyjLw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l9jj9L4WxRTkuqb1p9CA8axtAWgNH+10W7KZi6fsr0qmiCrqItJesci/oDzMMJDOO
	 FbGWLfaQHMYXXU1uEuihA1QebIOSqNlAKUooujoMOrSKg1uLTTuEXR9zZsYT1lW5Ti
	 rtsZ51R/2Xn3/splCeK+tgACllBmMJzPVjgaCVJvxmD+Eztqcc7x2Ml9IKrKaNzwky
	 f8nmRcFf1apO0xhfILO2aTMsVq0bhZ86c9Z1tujPPsBSiLeyrK1nR0SQniqzoagoKJ
	 CqbSvDSW3ZCeeQEybb8FRjAve9++0x0m0RZ/s7D+KQImDS1P5cJtP/G40lPb4Xr2LW
	 lHr2QBk2fplOQ==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79868eae536so14116837b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 14:47:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTcqqJFoF13f9gkK5/EevVg7sgbRzLRrycDRgy/B0C9Q5y47weG5mFRRMVY5cgZGybfetxtQehVfak@vger.kernel.org
X-Gm-Message-State: AOJu0YwjS2zyW9Hxfp/EBhD3+ZshmlDqfKW7zG5L/CWCa1jvY0fF8Pw5
	hrKKQmShwmX9e7DV76sGJlJZn36BdFRynGOvErT62F+qWVQNtssuMxCpIFKuo2Y9KiV8CJyAqse
	vKkwQjNa+xc3S8CuGkstlJUr7CtOr3Ds=
X-Received: by 2002:a05:690c:c4ca:b0:798:6d23:17fb with SMTP id
 00721157ae682-798856036b5mr9743137b3.63.1772146064031; Thu, 26 Feb 2026
 14:47:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-stimulate-fraying-29ac76f6c55e@wendy>
In-Reply-To: <20260224-stimulate-fraying-29ac76f6c55e@wendy>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Feb 2026 23:47:33 +0100
X-Gmail-Original-Message-ID: <CAD++jLnNPudpxYd8-rNTAudqX2-apM6uZLyBRYxagwtT+LqeaA@mail.gmail.com>
X-Gm-Features: AaiRm53hBIqaR9Y0t56WzlpNeyG3WpNnXjDcRAEXl0GxKf3ATmgzHkurDlKjTjw
Message-ID: <CAD++jLnNPudpxYd8-rNTAudqX2-apM6uZLyBRYxagwtT+LqeaA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 0/2] pinctrl property checks
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32252-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9ADBA1B08D3
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 2:39=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:

> Here's a !rfc version of these property checks. Nothing has changed here
> outside of a rebase on v7.0-rc1.
>
> Resending because I managed to lose the CC list on all but the cover.

I applied these for next because why not! People have ample
time to test them now.

(Dropped an extraneous newline in the first patch.)

Yours,
Linus Walleij


Return-Path: <linux-gpio+bounces-34239-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCDfGK9GxmmgIAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34239-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 09:58:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E17B134161B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 09:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4AA5C3056708
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 08:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8AC3D8134;
	Fri, 27 Mar 2026 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkyk/TbO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8E23D9045
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 08:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601900; cv=none; b=DYIQEiYoSxNOYXkZXzOui6tGxaasEudD+nYJRVmehhajCii3yxEeViFYrSonWCexmBjvHFFZS+o0RtubE9yxysqs+yZVvMF8XD7PH3RcubsrqzIVi+I7SEz0CIjHAc2S2ldbYCIt1HamBRLCza/EjXtsU5nxQmts4kP2kG4/JRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601900; c=relaxed/simple;
	bh=qMMIhPtvCWD5r99rAHz0r15qUB+Iljudd10hqTbDLus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/QuRrfJh0RD7zmGuvBzfKM2djXmTlF6Zp0/rVi83DeaQ7yl4QZUZp1LG22NYqOHAJILpfej/v4apSmGF179ltP2Eq+olvh8h5o5IGeAbzeGcJWADBA7wMDDjZ//JOaljBJQAayW8W+hjaDR9TFSlTkKv5Ouv70zC6O/qKG7D4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkyk/TbO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C86C19423
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 08:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774601899;
	bh=qMMIhPtvCWD5r99rAHz0r15qUB+Iljudd10hqTbDLus=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jkyk/TbOVO0I8U7A3nRzmjufKal6BH/7Ol2+51ycWh1PGEcgY73fQ85c24lnsEqQf
	 ONmlPVI0ml6JfUg0bZAlth7elLP+685BhJ3XFhlPgTwRlBnFq2imkZxQoyp/x1hcs8
	 hQWPi5b4IzvB4hWfQZX7SQW18zC7f988Fzlc7vDK9SQ+SCMNQB6tR4BtfiN1LR9vfV
	 +dccGIMxlibDIjWyVtxYgDxhEkS7kcVcD1UHzDoZ8O0n8QFw0WxMuguqvlzu+Hd23r
	 a8/3oE/CusJvOjNPpzibHUt6jNI7ENzCGu3ETaA1R9j0ensQGB7JVXm2GxsRdoL5cr
	 IKGPyz78tOX0w==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64ca4dfdd88so2059916d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 01:58:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWyTD+toQ6GpdbyDHaB1etcCtGEvfQ2GqEW6wk4PzOdK/zL0glcAHfyEh6CDr1N/rQ0nFNb0QZ5RFeo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs7hZtRnyAOTsuYAj4VJpvNfqKhrg+ColNrDQ23ZXFLKD2J7PK
	kicckLOt/R4tSeVSWqWzG9vBuRefM1K7vwPVj+/BifZaxNdzJ5jePqhoDO8P86o33pWxsnxbMnj
	IagWXwrFCcXpktwQ6TTEcXMv6+ZCyImc=
X-Received: by 2002:a05:690e:d4a:b0:64c:ed3f:ea3e with SMTP id
 956f58d0204a3-64ff71861b7mr1426503d50.9.1774601899207; Fri, 27 Mar 2026
 01:58:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-gpio-hogs-multiple-v2-1-7c3813460e4f@oss.qualcomm.com>
In-Reply-To: <20260326-gpio-hogs-multiple-v2-1-7c3813460e4f@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Mar 2026 09:58:08 +0100
X-Gmail-Original-Message-ID: <CAD++jL=VAsfEmG1h65Pi36Lb8t=kLud0p+K582tzxxojF_nXdg@mail.gmail.com>
X-Gm-Features: AQROBzBv5jGgd9F89nt28TVzjt8oMp86SMUmiNPHPIZ_9TVBTNnTHNc9RBojE2c
Message-ID: <CAD++jL=VAsfEmG1h65Pi36Lb8t=kLud0p+K582tzxxojF_nXdg@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: fix hogs with multiple lines
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34239-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: E17B134161B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 3:18=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> After moving GPIO hog handling into GPIOLIB core, we accidentally stopped
> supporting devicetree hog definitions with multiple lines like so:
>
>         hog {
>                 gpio-hog;
>                 gpios =3D <3 0>, <4 GPIO_ACTIVE_LOW>;
>                 output-high;
>                 line-name =3D "foo";
>         };
>
> Restore this functionality to fix reported regressions.
>
> Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdX6RuZXAozrF5m625ZepJTVVr4pcyKc=
zSk12MedWvoejw@mail.gmail.com/
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Oups, nice catch!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


Return-Path: <linux-gpio+bounces-34402-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLcZO3U2ymkx6gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34402-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:38:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFDD3574CF
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DF5F3005141
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 08:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7021C3AB273;
	Mon, 30 Mar 2026 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0v6MaAN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3428735DA60
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859891; cv=none; b=qgnBaS5EdPf9VFVcDD0j0dfOR//l5T1BiD2+k3Md3ETabl5cOJH+1fyiFCWF65/A9F5i8oMlhf3BR6ELZiYIspPCdAEvK2sS90zksLxVCN2wbfwshvn7fJsv5futwSjEdvcShVSddj57aIm24LKLylSww1EQcVUhCGrN3UeoKiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859891; c=relaxed/simple;
	bh=bo5boUpVussCu9LKGUJfl9LMpilojp9jcVgDy6oRNmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBQjnSrTDS22enMq3ADKDD7/OEwxKlIvVStLtZF1WXDLL3D4gvJKEmXbJVTAcQc8rccLEpv3vscMYEEQNDTVmqRBvTAYycF6NRbc13ioUzxgUYOm65scjsXZf26o9HUukxK0WqxYNfQGWmMjWONqA92d3HGGsAL9fPwCPnUKh+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0v6MaAN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0527FC2BCB4
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774859891;
	bh=bo5boUpVussCu9LKGUJfl9LMpilojp9jcVgDy6oRNmA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o0v6MaANjgobpLTrCsyhRXFsE2qi4hHLUFfG7EIXmm/eqlt8geQEy7NaM22OPpQAZ
	 ovMAzTfwUZ+bge4a0TbLhf5hH1eDWjIuOdq8Bggia7nUeYVa9IA0NRorzhdgogJMmN
	 PNHbfZli+JLXbGaIfghJrt/DcEm/QPOjm+J8lMYzIyb3XcOxcseSR8Plka+4BU6AvL
	 Qhc6VlWctFhIRpwdB3P3FhoncsxVF2bnQubMKMN5nAKtjPgI/XiTVZWouKSqA82WQU
	 6teRtD5Aopiq7XVGbKOoBFO1Q7N2fYddzCCn2cpODHYjutRiYosudLvBtAnsiuiYr9
	 cD/QTF5A3Oy4g==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a279ce9475so4650003e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:38:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXLFqdS3PLZ5mAS5SYuRdB4PAE+nNw5ayg5KKaV4EZP2e2mhCk4fantJkS1jh8o9FROEWyOP4z07WmA@vger.kernel.org
X-Gm-Message-State: AOJu0YxixoFC+OEVvIowYPj8itZNhoKpMiFQMPEt3Zb/1JkM9IwvghUz
	YEknogzq+Kp52dXfvHDSqpMcrl5UxD+hIARfcgOTfSjEbY2u1wx3Rusw4lC1UdgX7jyzy4ye7ig
	ts8KR0de61P8DlvBqy0xLb9N//SG9QPIyHcTWKMuZvg==
X-Received: by 2002:a05:6512:1153:b0:5a2:a82a:163 with SMTP id
 2adb3069b0e04-5a2a82a023cmr3400210e87.20.1774859889667; Mon, 30 Mar 2026
 01:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-gpio-hogs-multiple-v3-1-175c3839ad9f@oss.qualcomm.com>
In-Reply-To: <20260330-gpio-hogs-multiple-v3-1-175c3839ad9f@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 30 Mar 2026 10:37:57 +0200
X-Gmail-Original-Message-ID: <CAMRc=Me9TeeAs+rQE3aDPJNLZnG3gv0-CDqE9eZvu11ofguMnA@mail.gmail.com>
X-Gm-Features: AQROBzChCMlhF45M8e0t9IdtJbxQ_0XSd_QjvxFtSudpFtuC30cYtlOSEoJYKNY
Message-ID: <CAMRc=Me9TeeAs+rQE3aDPJNLZnG3gv0-CDqE9eZvu11ofguMnA@mail.gmail.com>
Subject: Re: [PATCH v3] gpiolib: fix hogs with multiple lines
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34402-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5BFDD3574CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:36=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
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
> ---

Reviewed-by: Linus Walleij <linusw@kernel.org>


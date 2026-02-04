Return-Path: <linux-gpio+bounces-31433-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMX2NuNEg2nqkgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31433-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 14:08:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8020BE6313
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 14:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7130E30416DE
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 13:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FA540759F;
	Wed,  4 Feb 2026 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTX+KxCL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE6E3F075C
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210171; cv=none; b=F96U7OAFbidatApprXq1ui8oj4wy2NGDaXJFQ3MJ1LEsSydP5EtvZjAB9UOB5ZJFvsqDVPnADSF3ZJoqtW0b51dZ/ggjME5MPPlfc8WsRKJ67ogS99h+iXjk/USsC46/XBw0yiVkDUyH9470ggrDlsNiYJgynxV267aYDmzWtjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210171; c=relaxed/simple;
	bh=K8i0Khwm0EQfKN/XYyHrc34Q1WtXNlYAyOl8vOEKAhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBb2DBm1UKiTC38cDMkBVrs31EKWog1xprw7QnZAiSm8n7aVli3j2qtw85WMH3LCJiDAaqTqyPxNw4n4dDcQeRU1ed+zzZr1N1kiXP4qGxTEBh6lp4ewlxOap7zi1uVTOqwzrH2BWTPVuGsSEMew62XiLnGdRAGYEhDNUsXTd1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTX+KxCL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C8DC19422
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 13:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770210171;
	bh=K8i0Khwm0EQfKN/XYyHrc34Q1WtXNlYAyOl8vOEKAhQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kTX+KxCLJ/iL4gJlJkupexnUvsfvSEa/TiO3V36oXn/d+Kl3Kh1x/ykiR2U18GciD
	 /AJ8PgyyMAX/c9lbKVQB3X/GRmVE87yrVop9SRun+VXbH2Ef4+aQFCTUYN53+cIw5m
	 AriQi7wH1G0eSiheDexEixdj0mm9YG872E0UVe36UP1Bbh8ito/GdZ998k6PqrWFMF
	 HFLl3df1JyCSfR2Dtbbwpc1UkXzqHETgydyR7HOmcnZhECWk1RZGeT7HSmA0RuVHP+
	 4EDCKUpCx4g7ghYTJEOj+UpRPaM7Tgbg6Aqcr8LKgWkUC3aV7JcTakptkLBZfwA0fQ
	 9j1TTEGH2L/zA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38305f05717so60436681fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2026 05:02:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW3WaRIAs6aBai0m2l41PbexAWxT6vPU/526Kfxonye1KEnKyll+H4cqVqTSyD+TdTQvnFHGqwu8exm@vger.kernel.org
X-Gm-Message-State: AOJu0YzUInaeglyUWKK0HqDbSqfElQe8ZHzYaie0h5znbC8mQap1FY6E
	RZg0JqJwikXu9VONFLCPT0toFpkejQy4YR+dpisp36EgBSPJfBtwD0NL+Cvdy3N12kBRGig+6dy
	gQl+B5Ij1YIBRc2KnzKKB2iKR0I6gr8SLEwt5sSk5dg==
X-Received: by 2002:a05:651c:220f:b0:37b:970f:d33f with SMTP id
 38308e7fff4ca-38691d78ef7mr12606781fa.21.1770210170157; Wed, 04 Feb 2026
 05:02:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203061059.975605-1-tzungbi@kernel.org> <20260203061059.975605-9-tzungbi@kernel.org>
In-Reply-To: <20260203061059.975605-9-tzungbi@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 4 Feb 2026 14:02:37 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf_SvTzYZ23OJy-dTU4XCDTcUfsCAqJw2TxtrOXJvbUvA@mail.gmail.com>
X-Gm-Features: AZwV_Qgxz_gUDuN_t7oGIq3ngoEatPBIOO5KMk-EB-AMA6fD9wAbAQvCpgxHHKE
Message-ID: <CAMRc=Mf_SvTzYZ23OJy-dTU4XCDTcUfsCAqJw2TxtrOXJvbUvA@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] gpio: cdev: Leverage revocable for accessing
 struct gpio_chip
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31433-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8020BE6313
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 7:12=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> Struct gpio_device now provides a revocable provider to the underlying
> struct gpio_chip.  Leverage revocable for accessing the struct
> gpio_chip.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

[snip]

> @@ -1432,10 +1433,10 @@ static long linereq_ioctl(struct file *file, unsi=
gned int cmd,
>  {
>         struct linereq *lr =3D file->private_data;
>         void __user *ip =3D (void __user *)arg;
> +       struct gpio_chip *gc;
>
> -       guard(srcu)(&lr->gdev->srcu);
> -
> -       if (!rcu_access_pointer(lr->gdev->chip))
> +       REVOCABLE_TRY_ACCESS_WITH(lr->gdev->chip_rp, gc);
> +       if (!gc)
>                 return -ENODEV;
>

If we're doing this, then I'd love to see something that actually
makes the code smaller like:

REVOCABLE_TRY_ACCESS_WITH_OR_RETURN(lr->gdev->chip_rp, gc, -ENODEV);

which would allow dropping the repeated checks.

Bart


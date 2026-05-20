Return-Path: <linux-gpio+bounces-37172-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCgTOuVaDWpuwQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37172-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 08:55:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 611EF58884C
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 08:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D816307BD9F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 06:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF79364E98;
	Wed, 20 May 2026 06:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8sP9RFN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90C434A3DB
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 06:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259899; cv=none; b=Fh1MtR6akMtW9NbOpb1n22yyb1pxRsOo+ldRsVyLY9i05/7by+B2TgvYjo+iBszvaWsl1k12gE94IUwHEAnV3A6xtxdsfySqwDJqdbx1XknfQRI4VE6ffswG5UQc02lJku/W7Ua1Ncbuh3nTecfhHY8q/T/3tXD8NoNovSTaHE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259899; c=relaxed/simple;
	bh=t4YK3FjqCg4ZJVzE9RjK1EOUQqIvljC2eilMOhVcPZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwK5DD0KlHmSnjG2Q/MftuOzGGVcPleb80bZmuOOqwi3WIBi6QLkm+fpy7QNp4ENttYHED5hEhRThibe0rcxbiVGd3pk6CEWM86f7dHHOUROHulqRYWBzoghxE5qlyxRMwoZ5XaDYQtdup0rCJDaQ39IkzUOR0LCc+M+BqN40h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8sP9RFN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD701F00894
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 06:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779259898;
	bh=t4YK3FjqCg4ZJVzE9RjK1EOUQqIvljC2eilMOhVcPZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=R8sP9RFNBOKccYdcrLL+1+KAUdcsXizLzmtyhhkTVVq/PSkdt4SpkzolqLmRmbwtb
	 DA3IwOwC0jDk3I9ouClQkf3+Uk0F2C0Rls0cEa2OsYh6qW2mbgDGbRPMbE5SX+ZFY7
	 zFaXVySB8JxjbNq3ANds0t6GKFJT4u3IeJDW/xZRC8AsTj0ANUGGwGZIU7YB63k0Uu
	 l0wMyhmniiQjwzHRdzCro3nsNWg5RYeXFwm1Q/Qel0PIQaYD0osgfgTh/SaeFBbjvZ
	 AT/cI8zGPQudvwq2OoUZfKuB2QIZfSdm0Vt58xw2oSKYt217n1WVjfDq6AHuFMhpoM
	 dttOJsaPmN2qw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38be5e86918so59296381fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 23:51:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/I5bHpRUq6IidjJmv34IXY18NpckZEg8EMcFyCvFSBLQBhQl27a3A6L2Jm480XPYNSQi6wQbuBShuX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6LLL04JqBk3lZ7ckwBBguwjHTkd0ztnzWWA8hSllu1gG5wtTR
	VKPUIJ8EoZfIXcCi8KQV9YtuGatT+Njip6wYFEJKkrEh9BZYOS10uV7yV1o8KRuAbc0cH6YmzPY
	dZ1SM62z7J6+1O6G7f8O8FIWQuzN9gjRRYul4/eitfA==
X-Received: by 2002:a2e:bc20:0:b0:393:e33d:b713 with SMTP id
 38308e7fff4ca-39561a0ad53mr69936081fa.10.1779259897254; Tue, 19 May 2026
 23:51:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512152125.924433-2-u.kleine-koenig@baylibre.com>
 <177909044656.4685.10308837875925010657.b4-ty@oss.qualcomm.com> <agyF1NA5TKv7WD6P@monoceros>
In-Reply-To: <agyF1NA5TKv7WD6P@monoceros>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 20 May 2026 08:51:24 +0200
X-Gmail-Original-Message-ID: <CAMRc=McrnORJbik6QYB-ps7fjxXb24VbB8R9pBgnXzL5xj8aVw@mail.gmail.com>
X-Gm-Features: AVHnY4IcYEFRGM2ItFHPzATqRDzbl10iLDJdiFrQ15YbnG2CF-Cy50CKjkpJtTc
Message-ID: <CAMRc=McrnORJbik6QYB-ps7fjxXb24VbB8R9pBgnXzL5xj8aVw@mail.gmail.com>
Subject: Re: [PATCH] gpio: Initialize i2c_device_id arrays using member names
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37172-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,baylibre.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 611EF58884C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 5:54=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> These changes would fit to be squashed into the patch you merged. Would
> you prefer to do that, or should I put these changes into a separate
> patch?
>

Please send a follow-up patch on top of gpio/for-next.

Thanks,
Bartosz


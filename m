Return-Path: <linux-gpio+bounces-32143-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCm2CRfbnWmuSQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32143-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 18:08:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 839EE18A511
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 18:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1442B308B426
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 17:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E313A8FEE;
	Tue, 24 Feb 2026 17:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eA+Mf8AS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F88366DD2
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 17:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771952578; cv=none; b=b2HCKVTtHCPWvgB1kqHrgh04R4RoB0yKD3rVc42USheJKMw1gHnrtWLgJ1G33b/rwP8sF3cd1ICu8PNgkPwaiMX8cHMAZfN0pC2fYWC/+aIyNcGxIZf9CBQsuH0ylqWV8xnDjbQuvdQuKSt6B6dH7slhwWtKP1CT2NqqxVUzpD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771952578; c=relaxed/simple;
	bh=VPXLMihV4lHvyXS1H95uHKUVB9flGyPxq9aX6RlQuR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecdmI31HipVt/+Dzhv90NJc/TUw1+rcjdjCa4hk/2cYll0rHH3O+tryjGEYun0yo9t/HE8Bk22JL4OnTeOiICRWzCfuz+CBu3tOi+qkjoyuqtDC0o4dKvBnTysqtjd3IxZRmC/zz4QOrIEzSDck8LX5J6OYc70JlmmAFO3TBjIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eA+Mf8AS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16721C116D0
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 17:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771952578;
	bh=VPXLMihV4lHvyXS1H95uHKUVB9flGyPxq9aX6RlQuR0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eA+Mf8AS5ah512zkwo58oTMSwgABOCGlZsjGC0BHkiC850AVi++d4Ul2U9ZassR9M
	 n7myteRcaQh35pZdy9FaGitn4OShfTIStx1IxKqLMaBCYWu/5CQOHHE/bIx3c4UMop
	 6LxODqgSx9MKptwO2Frv+gasq6mQ/fQhNvPyPd9mD4P7/JFq87heKNyo6MbkgbnWmG
	 BJesHINsiRF3syVTm2kghOYWrUV+KIxcxi0evC89JhiI3p1Q8K/Gv0+/ELoWb638/Q
	 4XQD3ZWhGlfT5rKRB7mgIQU/2Onfe1GoowFnIGeIA31s84aiQVhs243o/r7T7vX3S8
	 E/7wA4q5TiTQA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so5445894e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:02:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1cnwmblu34yn2hMPuzsUKJcGRQYYx2pCP3U04SR+I/5j4toD52Zh2YIhb/aElUBjzJwNNS1Ui6e/h@vger.kernel.org
X-Gm-Message-State: AOJu0Yy++0SS6g8yvXXYG1BWjsbKo21LjgRDJ3Ekj6z8oP7nZwPSZCqR
	CyoFGr1IOmTV4mnUhrbD+cInyfRjTGweGz3DpkYfIDXcJCy8LHyXwpn4O4hBEcQt/O7jCC/qLbO
	/a+Y55Hix+cwkjY+chyL6g+BDn3rPwEAUVy91kibZUQ==
X-Received: by 2002:a05:6512:15a6:b0:59d:fac0:3a11 with SMTP id
 2adb3069b0e04-5a0ed9af47dmr4234826e87.45.1771952576564; Tue, 24 Feb 2026
 09:02:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224163234.653438-1-pranavkharche7@gmail.com>
In-Reply-To: <20260224163234.653438-1-pranavkharche7@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 24 Feb 2026 18:02:44 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdhjqZYb8cOSU7dsP1yRJ2vMxuacfLLWOzhyh4HbPeG7A@mail.gmail.com>
X-Gm-Features: AaiRm50i-Cq2swV39bOef1qT9Sugrnn_fyChAhPDBMy-E6Lf2EfOqySJm8ZPMDI
Message-ID: <CAMRc=MdhjqZYb8cOSU7dsP1yRJ2vMxuacfLLWOzhyh4HbPeG7A@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib-swnode: Remove deprecated label fallback
 for GPIO device lookup
To: Pranav Kharche <pranavkharche7@gmail.com>
Cc: linus.walleij@kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32143-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 839EE18A511
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 5:32=E2=80=AFPM Pranav Kharche <pranavkharche7@gmai=
l.com> wrote:
>
> Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>
> ---
>  drivers/gpio/gpiolib-swnode.c | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.=
c
> index 0d7f3f09a0b4..d6ab5bf0d2f1 100644
> --- a/drivers/gpio/gpiolib-swnode.c
> +++ b/drivers/gpio/gpiolib-swnode.c
> @@ -43,23 +43,7 @@ static struct gpio_device *swnode_get_gpio_device(stru=
ct fwnode_handle *fwnode)
>  fwnode_lookup:
>         gdev =3D gpio_device_find_by_fwnode(fwnode);
>         if (!gdev && gdev_node && gdev_node->name)
> -               /*
> -                * FIXME: We shouldn't need to compare the GPIO controlle=
r's
> -                * label against the software node that is supposedly att=
ached
> -                * to it. However there are currently GPIO users that - k=
nowing
> -                * the expected label of the GPIO chip whose pins they wa=
nt to
> -                * control - set up dummy software nodes named after thos=
e GPIO
> -                * controllers, which aren't actually attached to them. I=
n this
> -                * case gpio_device_find_by_fwnode() will fail as no devi=
ce on
> -                * the GPIO bus is actually associated with the fwnode we=
're
> -                * looking for.
> -                *
> -                * As a fallback: continue checking the label if we have =
no
> -                * match. However, the situation described above is an ab=
use
> -                * of the software node API and should be phased out and =
the
> -                * following line - eventually removed.
> -                */
> -               gdev =3D gpio_device_find_by_label(gdev_node->name);
> +
>
>         return gdev ?: ERR_PTR(-EPROBE_DEFER);
>  }
> --
> 2.34.1
>

And why exactly would you do this? Have you read the comment, you're deleti=
ng?

Bart


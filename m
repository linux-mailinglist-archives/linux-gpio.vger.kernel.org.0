Return-Path: <linux-gpio+bounces-31726-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KClcL2tlk2k44QEAu9opvQ
	(envelope-from <linux-gpio+bounces-31726-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 19:43:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3F31470C8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 19:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F7343003736
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 18:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176CA2E54DE;
	Mon, 16 Feb 2026 18:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxFhE6YB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6A31C69D
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 18:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771267430; cv=none; b=AjLJlhNq4X0fHtUlQpsktZQEktRNVD6xLSv2HnStdBTuRj/vNdymLdxlzJMSbfGTkXrG7AExkW4/ra24omyQwXeEMxtnHRwLycnd5kSryeb23kZ7OBNO+3zo854he4Svkn/PmiU/lbkT+i0gF61b+17fgE3tfE+E5nAM4RYpNRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771267430; c=relaxed/simple;
	bh=5U/nbIhPWFBwE7xp+uuldB/s3R7u9EG2QpjZA6/dcP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WasssLEO+swDYzPeOkhLkYz+tILuVUJi5JE0XqdouzQkAn5AvNoMfTHelIoDAcXjJbDhRTLsX8e/YaLYrhLeZv4GosLh9DM5wU2PxY1AxKE42mbudbRUIbbOz9DkWdXdEvKITOe6Kv8EplE2de9PvFekxc9z3+2LoEj3rXxOoek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxFhE6YB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981D4C19424
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 18:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771267430;
	bh=5U/nbIhPWFBwE7xp+uuldB/s3R7u9EG2QpjZA6/dcP4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BxFhE6YBUgwB0ShzV5/MkHkcqhSsYArYifQSWNaNekx82e81JuI2guH0o+EKY9v8i
	 FANhRxspeYOd+TDIyatcjaBaPoPMbaKFxSpKom+JqjYRrQiWKU2dcEkAUljVOarnq0
	 2hLPKWnNdZ607nnAUixasal4FIe6PEfa4B3+yrAF8u9xtm0uXCPvx2w5FqphIgTkFx
	 ifpVsokN1zh7X09m9VGtVojofFgXTaY4lhVUhaKuK/tvXem+9UHdPwMZdjbx8fR12S
	 7sBzfdH3l0z4zgFLWfFgwRnxCKeFPGCMiH7D7nxvmk2IXke9txbxY0ukmRze4HPqb3
	 vCq0ijIlTQ+VQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so3187317e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 10:43:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJx/Bbix+sYR6nBngbNBU7QgHYEbQ9WqS+t01kGWG0OOowbXRC8ySWi4kJSVGfIQBhPBcWXSYaFwAC@vger.kernel.org
X-Gm-Message-State: AOJu0YyZgj+ZpvJQzo57KYQIDiKjTHHdaRdBmnud+7kXlPEm+/69IV81
	izL4Uxyog/shYOu518Y6dQ/7quZFFa9dXw279mRqw15ilYKtIqAMbqVo0hykTy1jU5vd3/1GBn/
	fbvrMdoNyfD9K9kcG+8xo38KbbTiEZS2eu+jX3V7d4g==
X-Received: by 2002:a05:6512:3349:b0:59e:6006:62ca with SMTP id
 2adb3069b0e04-59f69c661ecmr3670507e87.36.1771267429177; Mon, 16 Feb 2026
 10:43:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216045842.1206350-1-pshete@nvidia.com> <CAMRc=MdRL=_nRF5g4MukNjgeYGh=Bz3zN7bXEp7RPsLHHyq8xA@mail.gmail.com>
 <63919a9c-39f3-4cdd-8372-8d63929c49b4@nvidia.com>
In-Reply-To: <63919a9c-39f3-4cdd-8372-8d63929c49b4@nvidia.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 16 Feb 2026 19:43:37 +0100
X-Gmail-Original-Message-ID: <CAMRc=McLD3jkyiyrMfF2DNU=s0cj5U2H2U-1rEXwNzbLR8fqhQ@mail.gmail.com>
X-Gm-Features: AaiRm53y3Wr5maLUCFpuArPepw1xZuaaIK9vr9zGaHnJVdSflS_jPdaqelf9mbk
Message-ID: <CAMRc=McLD3jkyiyrMfF2DNU=s0cj5U2H2U-1rEXwNzbLR8fqhQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra186: Support multi-socket devices
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Prathamesh Shete <pshete@nvidia.com>, linusw@kernel.org, thierry.reding@gmail.com, 
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31726-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ED3F31470C8
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 6:22=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 16/02/2026 11:29, Bartosz Golaszewski wrote:
> > On Mon, 16 Feb 2026 05:58:42 +0100, Prathamesh Shete <pshete@nvidia.com=
> said:
> >> On Tegra platforms, multiple SoC instances may be present with each
> >> defining the same GPIO name. For such devices, this results in
> >> duplicate GPIO names.
> >>
> >> When the device has a valid NUMA node, prepend the NUMA node ID
> >> to the GPIO name prefix. The node ID identifies each socket,
> >> ensuring GPIO line names remain distinct across multiple sockets.
> >>
> >> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> >> ---
> >>   drivers/gpio/gpio-tegra186.c | 26 +++++++++++++++++---------
> >>   1 file changed, 17 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186=
.c
> >> index 9c874f07be75..daf5aaffa28a 100644
> >> --- a/drivers/gpio/gpio-tegra186.c
> >> +++ b/drivers/gpio/gpio-tegra186.c
> >> @@ -857,7 +857,8 @@ static int tegra186_gpio_probe(struct platform_dev=
ice *pdev)
> >>      struct device_node *np;
> >>      struct resource *res;
> >>      char **names;
> >> -    int err;
> >> +    char *instance =3D "";
> >> +    int node, err;
> >>
> >>      gpio =3D devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
> >>      if (!gpio)
> >> @@ -937,17 +938,21 @@ static int tegra186_gpio_probe(struct platform_d=
evice *pdev)
> >>      if (!names)
> >>              return -ENOMEM;
> >>
> >> +    node =3D dev_to_node(&pdev->dev);
> >> +    if (node >=3D 0) {
> >> +            instance =3D devm_kasprintf(gpio->gpio.parent, GFP_KERNEL=
, "%d-", node);
> >
> > I've never noticed it before (and it's not introduced by this patch) bu=
t I
> > really dislike the child device registering devres nodes with its paren=
t...
>
> While it looks a bit odd, the parent is initialised as ...
>
>   gpio->gpio.parent =3D &pdev->dev
>

Right. Nevermind my comment then.

Bart


Return-Path: <linux-gpio+bounces-37213-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DL1NnrUDWrA3wUAu9opvQ
	(envelope-from <linux-gpio+bounces-37213-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 17:34:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D11590F8E
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 17:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 657C930B2B25
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 15:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6501E3F1ACB;
	Wed, 20 May 2026 15:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gnea7Wpc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0648B3F1AC7
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290681; cv=none; b=e4NBkRyp6hwzhDfiDQWrK3jFuh3utaqew7PfnY8cjxMeu/CCtpAzRTNKyYOkklm60iv6qLY1BBYK3IVaBkldArBSfyTh9y7B7kbhbss9qeWN0r1JcZRNYhvCNhxF5CVt6J33eT2Cb3ZKbRqKHgO0RDR5XQ++0nMdWEneyk/ZOGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290681; c=relaxed/simple;
	bh=nANitG+94xK3D3yRGafYYdMzEGBdQLc3UnAbCFrD8aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+f/cI0NTQoR4s45Ws0wt77rZwJV0FMuXKcXIJp6q3X4IjzSUR+6fZoqDfcnP7tSnUNbwB7jxfhk/97u2VymODS150U9jjj23IIk9/l5GFHeFlzhEmtxqcaYPeHiql1hDVWuww+B8S/6djAiaEyn9f2QL4khvUmgXJ2PRxy8aLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gnea7Wpc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65541F000E9
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 15:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779290679;
	bh=gi9yXyBJh6ZsOeGvzqOZwp2GKPCWOVDNkQ8ZHK/Fihk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Gnea7Wpc1KOC2R2t0qavHFAL81ZTEpomLHBdVjIEVzDlOu18nzN+0EnIWQ+EwzPVq
	 3/Mp2roRY0Rwtfst5Zz6vBtwJBo11LmD5PshoKz3sdOhct5K+/RpRqwrjAzdmWajvb
	 oVTGUPmjbUicMW32A40p8zsDTDBBlE0PalKFT9bQln+SupHi4cl1dZY+/3qGbjh9lJ
	 7Ktt7i1Yqxror0EUOdQNJ6UFdW9esGQR3mjz5i1qTG3zAFF0Te7MIVgS5iho71NlRA
	 rSdrBMOyeu8doxd3WUo71WgRuSfp7ase9gBd6omT8jQut+GtzKKaPmlKhF0tgSbb87
	 XMYSL8LuaciGA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a746f9c092so8006231e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 08:24:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/yS64FSyygpf37ZLOoxPVf/l9Wcn7vrDPGvLMSxokbgSwA2FUizWanOPnk5morZw5g/tHSfaEDCfE4@vger.kernel.org
X-Gm-Message-State: AOJu0YyFMYBjiSjMHxzQyqhGHucQaLnEiuV4DmBHqasJs1lvpUFs3agm
	eXtfSNQBqLA34Owr3BDyNPWtf33EBXkzuGIxkOglDvOfPD+oFcR/kGZVPsd1JxUwCVyW033q5d2
	ijG+DFsGRZdkYUbHQQIJKhgNiPydkqBzxaKZRPI9+8g==
X-Received: by 2002:a05:6512:10c6:b0:5a8:e129:af6f with SMTP id
 2adb3069b0e04-5a8ffd8bb3amr8129950e87.23.1779290678445; Wed, 20 May 2026
 08:24:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_89120B31E993041B07255B285D71C3CBA405@qq.com>
In-Reply-To: <tencent_89120B31E993041B07255B285D71C3CBA405@qq.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 20 May 2026 17:24:25 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfJMnnLB+H7e53HT24DFgB-HC1NEOhkq4X-9unPh+Lxfw@mail.gmail.com>
X-Gm-Features: AVHnY4I22IqVhhcQaqt7FLWUEsccvzlMUQE9oV-eg2YXJTvJNwT9J8Vm5WGY8Qg
Message-ID: <CAMRc=MfJMnnLB+H7e53HT24DFgB-HC1NEOhkq4X-9unPh+Lxfw@mail.gmail.com>
Subject: Re: [PATCH] gpio: event-mon: Use O_RDONLY instead of 0 for open()
To: 2564278112@qq.com
Cc: warthog618@gmail.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wang Jiang <jiangwang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kylinos.cn];
	TAGGED_FROM(0.00)[bounces-37213-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qq.com:email]
X-Rspamd-Queue-Id: 84D11590F8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 12:18=E2=80=AFPM <2564278112@qq.com> wrote:
>
> From: Wang Jiang <jiangwang@kylinos.cn>
>
> Using explicit O_RDONLY flag for open() improves code readability
> and aligns with kernel coding standards instead of using raw 0.
>
> Signed-off-by: Wang Jiang <jiangwang@kylinos.cn>
> ---
>  tools/gpio/gpio-event-mon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
> index b70813b0bf8e..590ca8db25cf 100644
> --- a/tools/gpio/gpio-event-mon.c
> +++ b/tools/gpio/gpio-event-mon.c
> @@ -41,7 +41,7 @@ int monitor_device(const char *device_name,
>         if (ret < 0)
>                 return -ENOMEM;
>
> -       cfd =3D open(chrdev_name, 0);
> +       cfd =3D open(chrdev_name, O_RDONLY);
>         if (cfd =3D=3D -1) {
>                 ret =3D -errno;
>                 fprintf(stderr, "Failed to open %s\n", chrdev_name);
> --
> 2.25.1
>
>

Why only here and not elsewhere? Please mention in the commit message
that 0 is effectively O_RDONLY so there's no functional change.

Bart


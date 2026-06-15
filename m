Return-Path: <linux-gpio+bounces-38490-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cZwfKh72L2qoKAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38490-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:54:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E87F6866F2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:54:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=e44RYy2F;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38490-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38490-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C2F6303C289
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 12:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5063EF670;
	Mon, 15 Jun 2026 12:34:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1683F2117
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 12:34:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526866; cv=none; b=E5VuB0dKKrUYfy7jErMqiDaKehaYsPfmkq2gbASmt7ndYsodtYBb3vYWGwWiOJPk7YpQ7Pjbfglz1S2VzOEyG3A7MTUH0i9T4K++SrHotpplvE8vtwaoDdlTYb9Ze7gjvhuMYe6Smhx22Evvl8gF0nEy02ruzrMSH7WlNtnRpy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526866; c=relaxed/simple;
	bh=E+wYYnmm9+ovJEQoA+ux5mujxcyQjCG8ZJBUVfQKZnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lC0ApRJFe82ZmNUgriT6nsQ+DsO8v3FLpxy6uyUoz8KZoioFlbBXOODl+5RiPCMsGaCMFjeCRdkU0met69J2w+zJksc7c069MToDvZsXxEjC1RHBnSeneWojP2goeZPMOVJ6bTFN29jRQ+ZYdy+OR3F32synzBK7hbM+9+ftksM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e44RYy2F; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848FE1F00A3E
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 12:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781526861;
	bh=E+wYYnmm9+ovJEQoA+ux5mujxcyQjCG8ZJBUVfQKZnM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=e44RYy2Fbut20aIcSF6rpSa2ySHCpmwiIt40GoMNdP7zQhNr3iMZ7Zjm8DRjDdWYy
	 zrwO5FvefTMWZGKEfd6PqopVPHg10RJrK1zj/pqhdpUZzKcz44UyCj6nDClxBWSZZF
	 Q59LaBgwhMR55VFllEO7dxJ7PGcG589S549idI7AxRQp7Om0ox6RaBsQJecLSSWepB
	 JHialOfIhxishWlX2EwCr2+0l5VXolrifhcG9bK36R6M6/jPispWx4yb1SMYYorPYh
	 PwRteTGhd0RYFPjYXJcMN3Tv8SAHuzAvYNtWVgWjDwZqtDwvkW+dtdMt1lP22igjNF
	 /8NeDx5Fxh1xQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa2c25c632so3308898e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:34:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8FEo1UoKzk1fIhd0rH9Lbe8JG74cQil1Nq+vLY+Se4lV6pWD5y8GuKAuc3b4iagOhdQhk+9ics3wjs@vger.kernel.org
X-Gm-Message-State: AOJu0YyEJfk1m5HBC840vNEh5Q8yK11qK2Ruq3FbXV68ebOPxJizS6aP
	A9GSnXOYWGty86C5D321URH7fvH8OnPq8D3dGIypCEFvm/165aCv2ACm1Lxh+F1gfAQ4CXCOx4i
	WxHStsCXwfUAJ0f/lInIlrejUtZXxaBc=
X-Received: by 2002:a05:6512:66c5:b0:5aa:6f47:32a2 with SMTP id
 2adb3069b0e04-5ad30d994cbmr2096824e87.6.1781526860269; Mon, 15 Jun 2026
 05:34:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615091918.43333-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260615091918.43333-1-pengpeng@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 15 Jun 2026 14:34:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLnaH=+Y3jt7Ovqjxn=eRVCGSqNMm8CYKFmKFbuy6ULQNQ@mail.gmail.com>
X-Gm-Features: AVVi8CdBCMjQ5hFLiCoiBp5_cF696oE_iHp_de8tf28S2SH4yxZf5JeAUewTOrc
Message-ID: <CAD++jLnaH=+Y3jt7Ovqjxn=eRVCGSqNMm8CYKFmKFbuy6ULQNQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mlxbf3: fail probe if gpiochip registration fails
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38490-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,iscas.ac.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E87F6866F2

On Mon, Jun 15, 2026 at 11:19=E2=80=AFAM Pengpeng Hou <pengpeng@iscas.ac.cn=
> wrote:

> mlxbf3_gpio_probe() logs a devm_gpiochip_add_data() failure but still
> returns success. That leaves the platform device bound even though the
> GPIO chip was not registered.
>
> Return the registration error so probe failure matches the missing
> gpiochip state.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


Return-Path: <linux-gpio+bounces-33815-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KjVDMT5u2mzqwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33815-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 14:27:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6402CBF73
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 14:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4957D301725C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 13:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CC53D5241;
	Thu, 19 Mar 2026 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EndLn3Tj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5933D5232
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 13:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926836; cv=none; b=Th2SohmqPZf1R2wemH5hjyge7UMneKMs0EKZQ33M88pmZs5lFwlS/K3vE1okV3EYZScJDr2p+7/hbLAO57kqqj30DLlNA9fDKlBTpoucepUVDtgwS4wEQgj6B9yXooPfAzaSrGNx5/iQrFjaWiJw3YEXiP13yZeFgibiZtkSDWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926836; c=relaxed/simple;
	bh=YfjvxjLB0GDlAsgJZKyuoB2YbldYRAw8xucc6F4mKNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tp4J5C3dCeA62Y8NYjnyWJEcCz90K6q1PPlv12yQlAnuheCsfdWn3f8eeKCBGTj2xJrFgf8sV9bxTGfEsR6CQto8qvgPOggjB+YqYMEXvvzOtREWrhzVAgLpD22a4bBJd7pWYmPjiap/yFEtbI+0H/A5aMGPk1AZAd6wCtfmmzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EndLn3Tj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDA9C19424
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 13:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773926836;
	bh=YfjvxjLB0GDlAsgJZKyuoB2YbldYRAw8xucc6F4mKNY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EndLn3TjYxItpnM74orXJnojc3o16fSSZrpnTo2FGTS/pb1dTAD44kdIHWSSrQy6q
	 0pRaE/gWw09PIJi+DzeSs7aTECpYAZmNKdOCPFV3B4rly5MWTNPWVvn0gxDZ7h0Scc
	 UzqFfvCzRlbonr1JrCRSKBUoYiS3E9OB0/kbii408MVhK2eBxqBtDEM9H7vMChBw5c
	 MKaLf/IvUe04djd+1Z2B0fI374ZIJDt88+Ss3VDmiFNv7uJndkbpxw3zrcUws2aJdt
	 ffGi3uXgZUZCtsmN49v3p5924be2KL3PVIFvqu7dXvkWz5ct+y1hhp7QbKVAZY8kh4
	 +/ckCYguNrxdQ==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7986fb839f5so10294987b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 06:27:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxCMhBujSwpqcpn/4V6NUwizUhqB/LGk7bnIxThfGaJakYhHL2fhJPF7ZiSpzBf5/ZDSgelCuicchE@vger.kernel.org
X-Gm-Message-State: AOJu0YzCSEcS7hGCu5CIwooZykHZj9KdMBwZtFKBmePIPg2Xvm0DGEJW
	3C29D5ZD01qw5aUHNNE4WbUr1OSeJDHf/3d//vRKokCBjBYFYhGXrn0xnzydhQulj8k4CiqJKq7
	BOHEj4s34FHx8fgMJofNBxtfwKaltla0=
X-Received: by 2002:a05:690c:9a0f:b0:79a:4419:71bb with SMTP id
 00721157ae682-79a718c829emr73772697b3.21.1773926835305; Thu, 19 Mar 2026
 06:27:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260315231000.50543-1-rosenp@gmail.com>
In-Reply-To: <20260315231000.50543-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 14:27:04 +0100
X-Gmail-Original-Message-ID: <CAD++jL=uPnttN80_Vp_EGwnYHoXwfNRXqx2cEsZKXak6aAmM6Q@mail.gmail.com>
X-Gm-Features: AaiRm50SrUjQzHzOxgNl5nRwKxauP4cULXsxT32vKBDjjefg-F-8SL3OKL1Ohx4
Message-ID: <CAD++jL=uPnttN80_Vp_EGwnYHoXwfNRXqx2cEsZKXak6aAmM6Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: use flexible array member for array
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33815-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AC6402CBF73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 12:10=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:

> Simplifies allocation slightly by removing a kcalloc call and using
> struct_size.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Since it's my own subsystem I could just introduce the __counted_by()
and extra variable when applying, so not gonna complain about that
this time.

Patch applied w/mods!

Yours,
Linus Walleij


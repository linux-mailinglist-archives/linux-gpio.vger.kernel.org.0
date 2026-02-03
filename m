Return-Path: <linux-gpio+bounces-31361-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEVgFhI8gWk8FAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31361-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 01:06:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E56D8D2D54
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 01:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59AEB300617A
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 00:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C62C8E6;
	Tue,  3 Feb 2026 00:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ey0QQoH6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F9A1391
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770077199; cv=none; b=ddSYGDiHu+0Iin82yi+LlPc81/Yi4hepqiZ9t6KTfczSZLa7KPwDunrtV+sLCim5TnPwonrtQEsO2GEUZ3p2ub2u/sDXblbNWU0b9btkNkxqyOmRQPtfL6H0Ri+scaC6UkW5GlM6dktR1srLk5UcuoTCtrd3A9jW+Ro/bvud4D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770077199; c=relaxed/simple;
	bh=SYeGoreiX8dI0LCiK/jiS7IA90ZFkVbLZTsO3MdCF1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjuHrc4sWCfWG2PnGOO6586OZDDAMq4n9KuiQ/b+pnEmO8IKPQEDG9tdbWnjWG9L4zt7J/WKgPplPJFdPGPT5HIkeIu2JPISrNd/MggxZP+o/USY6I7MeF3KOcZ0IETc1lhO1Cw+Ol+TGvi4ph+Lk6R8bKTJqVXylmj57CwIAOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ey0QQoH6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E25DC4AF0D
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770077199;
	bh=SYeGoreiX8dI0LCiK/jiS7IA90ZFkVbLZTsO3MdCF1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ey0QQoH6BwuTR8fff+OqmjThDYe7eCajwESX4d2drLFd3bL1lc0hNeSV4U52uY3WP
	 QcUpsSxajR/4h0BPohLq74kEN7nf37cBqFJWcGkGyIozqCNdodAdU+s64a70q5ZP/D
	 2yXwXiH17dKeXfl/TyWRqjoxWYySycZmYLVjBP7tIzkVjUhSTdZ1tbohUOFJrELwUl
	 SojBUyG2lQp7gqXyncwS4gon4SEEwFi+jCgRhKr5iELp9S0ji5LdDwX7EgunBvpAaK
	 uM/3qojAupFuEw6KItnYABCiXYRxurRftIAWX6qbTN1haoU4FNOSOsG2gT3r/hYbou
	 OCo4b+pYqLUWQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7945838691aso4228587b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Feb 2026 16:06:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXkvNNwz06w2i/Hfl7KQgwN8KlLadyv6alFCaxznhOpSW8u5vbj9qMk3pbV0smSOgm8reEHQBSJ/qoX@vger.kernel.org
X-Gm-Message-State: AOJu0YzZTS9vgi55WLJ3WhSSCybL0filLhLe4cgsaxheA0IcG8Wjnk1W
	0s9lUFVBeExtQIrgh5+HqY4Ijy2mRxcB2I1VcFMdFPOh3gLNLXDjHvVXlzUq4MWGDHxrIyYN+1D
	d/n1y5Qq0F5SyQHga4t+eExlSr4DYAl0=
X-Received: by 2002:a53:c78b:0:b0:644:60d9:751f with SMTP id
 956f58d0204a3-649d2f80c52mr930885d50.44.1770077198799; Mon, 02 Feb 2026
 16:06:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128085114.1137725-1-pshete@nvidia.com> <20260128085114.1137725-2-pshete@nvidia.com>
In-Reply-To: <20260128085114.1137725-2-pshete@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:06:28 +0100
X-Gmail-Original-Message-ID: <CAD++jL=DOjp-k1XM6kULURQF5winWWqBm-S3JYFEVsZ8FpsY8Q@mail.gmail.com>
X-Gm-Features: AZwV_Qhka7MsaZkB33uaVL0wGJTuPnFbgweVPaF4CVuqk1UUYD-WghDyZ7pRfdo
Message-ID: <CAD++jL=DOjp-k1XM6kULURQF5winWWqBm-S3JYFEVsZ8FpsY8Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] gpio: tegra186: Add support for Tegra264
To: Prathamesh Shete <pshete@nvidia.com>
Cc: brgl@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, robh@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31361-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E56D8D2D54
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 9:51=E2=80=AFAM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> Extend the existing Tegra186 GPIO controller driver with support for the
> GPIO controller found on Tegra264.
>
> Use the "wakeup-parent" phandle from the GPIO device tree node to
> ensure the GPIO driver associates with the intended PMC device.
> Relying only on compatible-based lookup can select an unexpected
> PMC node, so fall back to compatible-based lookup when the phandle
> is not present.
>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


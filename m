Return-Path: <linux-gpio+bounces-39208-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YQ7zDFK9Q2rSgAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39208-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:57:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5B86E483F
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:57:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GHwVZYmk;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39208-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39208-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DBCA3124FA8
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 12:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1826B40FD99;
	Tue, 30 Jun 2026 12:51:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C341341166F
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 12:51:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823912; cv=none; b=dBYTHF758i/UdjwtFVveG31T0jSEadoqZQpPuqPLWjW7P7TCzrv/L2sl+/ndrOrJT0QGLT93ErfGwurJ9RTTJvs2JtyPOhqDMZKKYDF47NV6FyubObwZDlMxHKX/w9mdrf2jwOuWfku8ONys+UXqYgos3p7Y8zPbtYjHcmCFEI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823912; c=relaxed/simple;
	bh=scVIy56Oo5OB2T4wsic5w+J+7vI2u9MuLNoapXiGCRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8NuXub2VBn00hgMxHJ0di2Tl+Jl+odhd89l+sV5oUt8iNRSrxpnq6bNPXn8JmYLG+Ams0G7003EENtNMwtOg4gmup+Q1nLHu/2Q4YV3caefQ96+i/Ocve9XeJUsZy2ptvvcLXbcspJkMnOVZof/eOAtRDiegTJVtRU8/0wN0SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHwVZYmk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825841F00A3D
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 12:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782823911;
	bh=scVIy56Oo5OB2T4wsic5w+J+7vI2u9MuLNoapXiGCRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GHwVZYmkRD8BJqyeTkVGWuWijpro1gpawWN0dpsDX50IUPFvKGG38JaJCkycnP+H4
	 MKhZeYQtEUm8p33HIHisNUK5wR6tLQiZIOymFMu/70CmIf1i3qiEgn16aatYzwPU/A
	 gPxjgOHWaMxZrChUiHwUsb4DXebuovId6QKtBpFNOrMeIXwHaTe1giYdixYoKmSmY5
	 2KIK3sThCP8PnYBDkEVTdFmqU3qjjm3wxs3AHkqQanOrHjPt+7Y+v7TYWGRxqXBmMb
	 pRML1SS5znHCE1GIswSG6D3J0nz0m1xFpcEIYRyqpeEBc2Bd98e2/jZnCnjXFXIH31
	 oldOBu3A2dMFA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so2400647e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 05:51:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RolLa+kSfIlMBVkSABg9oGpFB8VRw47cipQueKRvxbSrebCU2EOmpyPKyO66wLc6XHz7qP7EqqRAVOj@vger.kernel.org
X-Gm-Message-State: AOJu0YzbwA1U2m3GLQTlxumJ2kFZ2flrnIbedsETMGTjhV/jj2y0qjZO
	mqmdkigACLcM8NVEdv1GaAKOCa0L+vvhL8upCS69GPpuBSatPcndfIybKibA4IvgIIIUAKe1D1V
	KOfiH4KElEVAny4QmkjjFcrTLQ75KJQA=
X-Received: by 2002:a05:6512:12c8:b0:5ae:b728:df2a with SMTP id
 2adb3069b0e04-5aebdbc4d6bmr869344e87.32.1782823910350; Tue, 30 Jun 2026
 05:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618155626.18751-1-igorpetindev@gmail.com>
In-Reply-To: <20260618155626.18751-1-igorpetindev@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 13:51:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLk=PAx3S6d9xa6FtoHrySOgEemQaUCOE_DR4KBQoNFKRg@mail.gmail.com>
X-Gm-Features: AVVi8CeLfGHJ4hPGHyUBeEkTIjdt2LpPlThsqajy7P3JLhlyQsPujJYNdQfYT-k
Message-ID: <CAD++jLk=PAx3S6d9xa6FtoHrySOgEemQaUCOE_DR4KBQoNFKRg@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio: tb10x: W=1 warning fix and style cleanups
To: Igor Putko <igorpetindev@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39208-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:igorpetindev@gmail.com,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D5B86E483F

On Thu, Jun 18, 2026 at 4:56=E2=80=AFPM Igor Putko <igorpetindev@gmail.com>=
 wrote:

> This series fixes a kernel-doc warning in the tb10x GPIO driver
> and addresses two minor checkpatch.pl coding style issues.
>
> Patch 1 fixes the kernel-doc structure formatting.
> Patch 2 replaces bare unsigned with unsigned int.
> Patch 3 removes unnecessary braces from a single-statement block.

Patches 2 & 3 applied, a different version of patch 1 was
already applied.

Yours,
Linus Walleij


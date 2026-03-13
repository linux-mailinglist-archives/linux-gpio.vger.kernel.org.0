Return-Path: <linux-gpio+bounces-33408-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEm0NuSftGlGrQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33408-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 00:38:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3966328AB68
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 00:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6F04305E319
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 23:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969DA3D5655;
	Fri, 13 Mar 2026 23:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJ8Ek8wz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7793E317D
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 23:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773445087; cv=none; b=oK8PxWXWY2CUMMEoOUqWWFs7UdbkSN83MlEOchOb5w4So2nxv8RtVzE9Q1xHtbDXtZDfF04rRt/hMvsF80xOPDaVYT+ShgC5q2t6TZXQGbX9AdKfzZJL9W2WXqcR5mQd8mScHSqtXT2ofNB8SFQQO4Qrc4+dGOFaibu/Gnt8nLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773445087; c=relaxed/simple;
	bh=KKnxkDEoWNIa9pNZxrMGY1sk/rXEff2G80DmQM2Dzps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LwDekeHxdzwXjzvt4O8JG2EPFHK+19XlwfzCXR07C7F1j64bvxn/wzYS8cURvznuyw5wQF+moFPKyvvzHl5KL/ULK0LSLZMX93ZXvcI17DvimTJi9rimOosMI0OlIQQpTCeVgR13rlDqyzlLIdMcTNfoKBoELf+i3YN1lEAXrfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJ8Ek8wz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F25C2BC86
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 23:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773445087;
	bh=KKnxkDEoWNIa9pNZxrMGY1sk/rXEff2G80DmQM2Dzps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kJ8Ek8wzxzBaaxN/ED11y24Z/23/TEY9a3hodUvSb+6Y9jaeooLteE2tbs9Bn+O21
	 k0oaV8YtVHY/szKNLAUrlWv4QysvzUk81GVUMyby8QiQPy5v7QHLy23S+YCb4Kot76
	 L/WctlyOo3swfUgk1If6U1vmDguihYbsazTSFEKBuur7kvGBjuWF3wqjLoPKnxH5JW
	 Wt9Jdik6y37//+Rcdpu+mBuadUxjx9xe+Ao+itcqFkmcLzUYXzXCMn+V0dZRRSa2aH
	 JlO1lbgS7ECFTKlyBfvHneHC+YdM7Us0eOZIEiBM9eBPNfcgbB41xAk5PSxxzDQIa7
	 6XuR0lua5uILg==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78fc4425b6bso28634627b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 16:38:06 -0700 (PDT)
X-Gm-Message-State: AOJu0YzIkqFAGtSMhA99XebMhw5NxcUT82z/2ZHSo2ZqfwwrxXGqkjFL
	EYxVaahnaREgwKFKulL/AVYEFtQypr5iF14kzP6WAaqHpHMFvbtxTvOwDrH0QL12xnjhsePb4dA
	TCZgkBAMpT8qK82vhTwSBUOwqGbkCay0=
X-Received: by 2002:a05:690c:d91:b0:798:56eb:f227 with SMTP id
 00721157ae682-79a1c0cf55emr58534237b3.23.1773445086387; Fri, 13 Mar 2026
 16:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773399246.git.geert+renesas@glider.be>
In-Reply-To: <cover.1773399246.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 14 Mar 2026 00:37:55 +0100
X-Gmail-Original-Message-ID: <CAD++jL=vBnHG_Wc4_nFFgYN9COS-d0Ak1KMXTk3tFphiEQbnWA@mail.gmail.com>
X-Gm-Features: AaiRm51fXy_bp1rfhDcRF-amClZFYUPa_cs0-2DaSvYhRXjN9lRBn9NNXnIYXcU
Message-ID: <CAD++jL=vBnHG_Wc4_nFFgYN9COS-d0Ak1KMXTk3tFphiEQbnWA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Fixes for v7.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-33408-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 3966328AB68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:12=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-fixes-for-v7.0-tag1
>
> for you to fetch changes up to fb22bb9701d48c4b0e81fe204c2f96a37a520568:
>
>   pinctrl: renesas: rza1: Normalize return value of gpio_get() (2026-03-1=
0 10:33:47 +0100)

Pulled in for fixes, thanks Geert!

Yours,
Linus Walleij


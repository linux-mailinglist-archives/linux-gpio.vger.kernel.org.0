Return-Path: <linux-gpio+bounces-37466-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBmqOVJPFGqnMQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37466-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 15:32:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D765CB287
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 15:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 965BF301AA47
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 13:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C7A3859D2;
	Mon, 25 May 2026 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bboOklJP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A911383C74
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715700; cv=none; b=aZ7xddkzn3RKpRh7kdLGkSmRtkWjyn57ixhWP32ssxSsrLfhMJaXWXgvXYws1mqgj0+LDS9PKs1v91uL9TNmFuQ2QXNF+Bs+Fd2S76r4XTlUvcSgNIhY5DHVmKmtHIuHrUe8YGIhEVvZxtLVEE9LZYKYvQdI0mqbmNzxrmVG2Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715700; c=relaxed/simple;
	bh=gHTIVrvA2D1e2fNuUoMmKYb5MxJtFfoC3MootaSdeT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZZR7whOs01I/vs0EkTneIq87VHMTBh01mgEpAOqqg/wIFT9IqtaQe5XTD9CSwgP7BWKC6JDn8Bmkmke7MpLAEYFcR62bzjZ7T7dxIwXmwOI3AzTCVbRc0qBFw9OFLW4thU1y1cZQQ4foC1hOT/gQvn7PxBJ4+l5mBguGmRwcaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bboOklJP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77881F00A3E
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 13:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779715698;
	bh=gHTIVrvA2D1e2fNuUoMmKYb5MxJtFfoC3MootaSdeT4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bboOklJP6taFsJJBx91rGwhAMEPGAOIukIKCPu9ukPwxAbGhaVbwlv6ApywNjxZjo
	 7/o11a6nF1qykt1SwOAvkWKIQkCObuhSn8RUkQ1UGkggpQOJ5gKCA7CrC7UXevrtXW
	 ffuaWyWiLXheX0H8CSv3D5VehatOfciKSQ+OrkzrpfeioGb1gDukJDRaufDfI4y9kW
	 BodeDnQtLq+SxBPKeXb94kXY+FtbRbSwdhU7kaaOhmMaDdWGYkop8+sfflNoXLiLci
	 wrNf5Dw107kFVJWQp/APxUEN2HcpH7lcPoCcqun6nIxz8aKkyDjT14ZstAAqYiT0tg
	 w1+wrRbW9QrVQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3942e9977a5so95791121fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 06:28:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/EBiRp14t+jJ5M+cDsScvVvXsl3XI5/fcqnlI3wY5YP/Jq/GHqsAUKYVBc63f0JygjuvY4tc8ajcaE@vger.kernel.org
X-Gm-Message-State: AOJu0YyR44VVQdCb//zZZOfIX+A2nuJH21lSCoistamL38XIHUkkxDxk
	1mJjvhOcVyqakHveqe9D5bULdNZspHF9XSub28Hq6ovewL94AJ15u9/hJUMNxN0cUWIWjyOwPtx
	HJ9vxQQ6sic4r2P2N+lbWBOO5tY3p5Ro=
X-Received: by 2002:a05:6512:704:b0:5a7:4912:1a50 with SMTP id
 2adb3069b0e04-5aa2ba8c2a7mr3477811e87.20.1779715697590; Mon, 25 May 2026
 06:28:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-gpio-shared-deadlock-v1-0-76bca088f8c0@oss.qualcomm.com> <20260522-gpio-shared-deadlock-v1-1-76bca088f8c0@oss.qualcomm.com>
In-Reply-To: <20260522-gpio-shared-deadlock-v1-1-76bca088f8c0@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 15:28:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLm+wMqvd2BXo_cuiGMBdoUrYGc32SY+Wo1tY-4vmK-cWA@mail.gmail.com>
X-Gm-Features: AVHnY4JihebWq6GLYB_P5a0Bs7pzgE9AlxSZM3GlX3MFhuWRs_dAM59MX7ySYSU
Message-ID: <CAD++jLm+wMqvd2BXo_cuiGMBdoUrYGc32SY+Wo1tY-4vmK-cWA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: shared: fix deadlock on shared proxy's parent removal
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37466-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 47D765CB287
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 11:13=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Commit 710abda58055 ("gpio: shared: call gpio_chip::of_xlate() if set")
> used the mutex embedded in struct gpio_shared_entry to protect the
> offset field which now can be modified after assignment. The critical
> section however is too wide and introduced a potential deadlock on the
> removal of the shared GPIO proxy's parent.
>
> Make the critical section shorter - only protect the offset when it's
> being read.
>
> While at it: mention the fact that the entry lock is now also used to
> protect against concurrent access to the offset field in the structure's
> documentation.
>
> Cc: stable@vger.kernel.org
> Fixes: 710abda58055 ("gpio: shared: call gpio_chip::of_xlate() if set")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


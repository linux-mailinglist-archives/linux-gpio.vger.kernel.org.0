Return-Path: <linux-gpio+bounces-37465-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAaNHwxOFGqnMQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37465-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 15:26:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 238CB5CB13F
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 15:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F3A6730065F8
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 13:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D7C38551A;
	Mon, 25 May 2026 13:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzwczHsa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AF1384CC9
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715593; cv=none; b=PbhEhcEfW0+Dy2/QyCWPBgla+sCTyhykJKfPLN77QkEpnUR5iTScLLIb+SWR5QF0WND8Q7c+JHnyDAlGqOKS/In+BrmDCGB6M2kWLd6F+8gc6na63O1BNiIHuXGo/Ufex4q0g6L3giYmGmou9kfQl68dJynRJanpb234sw5bWMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715593; c=relaxed/simple;
	bh=F/NF48u90Tx5XUcUreX0E+pKC4zLouLi3sdXS+N8lqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFjES+NMeBerIl3FhdWATi+/aayVmz4Fi+67XA1pqpPqEw1R7nexEN21tdR2wXCoOg8sa/dwAUHt4gaNiRuSJ8AYhzVH+CWh3Oo9D2O8S1kih55r+DGWTCoGR2JGDLQKP65+HKnEBDVegShfybHM18fyBQaUDC+UH9tBPPfntZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzwczHsa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5171B1F00A3A
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 13:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779715592;
	bh=F/NF48u90Tx5XUcUreX0E+pKC4zLouLi3sdXS+N8lqc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mzwczHsaNb9dzWKnhQj/Yeqr7eQsbdF2KjBrtGW3tX9KSBvcpfbQNnlrbbB71MS6T
	 6hbMVkmRysDZHepi1OP6pJg/SC1YnTQhWv90bF7laaniSn3AmVLKgtXLiOSdcyQRXk
	 FmOc4UbjwK2R75q6LMqmStTUu3CUZflIiwDWoF5MgBolj/EgxtmypAIGtbFM3fecln
	 80Yt1eH7XY6iC5hPsqUAPSKd2JDr+LguePJLPlquCh4rZqdN8Ec69z/ICVzEadi6U1
	 XmtWkg9hrfJpKPOrzXfviYEQ3OUFUPD0ee8rdlVT8iXxYoNgXsIx8sQMmUAys59FJl
	 U5E9RYqhs/Q9w==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa2c25c632so4252653e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 06:26:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9p0bAKL8tYBtMZUqhq492I2E/l0KqFV844mhesszVlSyrfwEZgzqHLfAFIto81HUwKhhFhkhm7eDzM@vger.kernel.org
X-Gm-Message-State: AOJu0YzmRCiJO1PMXtYfXnKBpNKiDGjwmAmIZI4CacCQ5+nE7efQQNI3
	XlAKFxeK9uADlw6xiwq5+5lAvlWp5PS86cTplRKtL/zLGqlJhRII0aYHXBjXnVVJjSX7B2RNqva
	bau6RCMGnR0MEdl/M5F02J9Qb4x726HQ=
X-Received: by 2002:a05:6512:118f:b0:5a8:6cbc:60f3 with SMTP id
 2adb3069b0e04-5aa323815a9mr4278899e87.34.1779715591117; Mon, 25 May 2026
 06:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-gpio-shared-free-vote-v3-1-8a4fddc6bedb@oss.qualcomm.com>
In-Reply-To: <20260522-gpio-shared-free-vote-v3-1-8a4fddc6bedb@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 15:26:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLmaWhY_Ts0EUje6ZW_3jk77O9peafBpzMorF=ApmMf4tQ@mail.gmail.com>
X-Gm-Features: AVHnY4IayrmY9c3i6v1yRMZMDwtYy4PcKQqYcOpBHswrzmux7GAxsso0aG0ET6Q
Message-ID: <CAD++jLmaWhY_Ts0EUje6ZW_3jk77O9peafBpzMorF=ApmMf4tQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: shared: undo the vote of the proxy on GPIO free
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marek Vasut <marex@nabladev.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37465-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 238CB5CB13F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 9:49=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> When the user of a shared GPIO managed by gpio-shared-proxy calls
> gpiod_put() to release it, we never undo the potential "vote" for
> driving the shared line "high". In the free() callback, check if this
> proxy voted for "high" and - if so - decrease the number of votes and
> potentially revert the value to low if this is the last user.
>
> Cc: stable@vger.kernel.org
> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy=
 driver")
> Closes: https://sashiko.dev/#/patchset/20260513-gpio-shared-dynamic-votin=
g-v1-1-8e1c49961b7d%40oss.qualcomm.com
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


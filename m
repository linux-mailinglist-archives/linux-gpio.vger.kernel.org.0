Return-Path: <linux-gpio+bounces-31321-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLhCB5zhe2lyJAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31321-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 23:39:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ECAB5703
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 23:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA3113038AC7
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 22:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C114F367F2C;
	Thu, 29 Jan 2026 22:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBvK+Tgm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8467E366DA7
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 22:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769726184; cv=none; b=M5rLkx9Wxp0zsTSVvoE3q43nlccymlqU+DsRAcvwdwJt/1VtY7SfrdYIR63iL3D6OhyARK+fo+TY3XP684CQLx3FbJaHGNSsx0+oVS4RuSAJVTzoJsbYyxUjTcxf7UkZteGiNZ5hpxMWtuFdjmZfdRD+dKdp/KTHs3C0GNoO/fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769726184; c=relaxed/simple;
	bh=0cM/2P6xG9csa6AamV/m4uCAiXdUqWpVgaddYo2vYu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPosIaWpNp6KWHUX76q2cJzbOSHibPnxzcpB278ifTz4kcGdKXmN3bfmKAxU5EbgzlzpOEaIrAqTdMOao548RaaW/541B4Ai+9Ep6zp2joH8jn64nCqnLsVgcrHbe90LihIOLtvJm9CXf7iVTMoMAdRSkbJ7TrSpLTtPInqg5i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBvK+Tgm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2789EC4CEF7
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 22:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769726184;
	bh=0cM/2P6xG9csa6AamV/m4uCAiXdUqWpVgaddYo2vYu4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WBvK+Tgm5WJRLlESUnbj3E8ONE0ln2g9jTLm5WYbdmuyZtsv6M6ETResGI0n+tkPq
	 LTC8qRY7CUN5RvDzmk1HRrs62ufBsempye47aIGGGF7pUpM1NF5Acb69U0lDSlS75G
	 n33v8KJgIsfJIn50ZMub/pN3oRF9tSEXvaC1gM4QgrQJ2xyCqgJ0sni+FssDXdFuUg
	 hcZxYtc92QAVI9IGLWgxYrnqcqrdCrgnQEe4J/FYs+zHuIpQkG0wuacteCp+/aw6IY
	 bEqv/qjShalPne+EjPbq+3fCVb1IXhLTbarJ1AY+YwfFt0ulLqv++RGYcuzc0PusV9
	 SCE7x4TRf/huQ==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79456d5dda4so14768917b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 14:36:24 -0800 (PST)
X-Gm-Message-State: AOJu0YypJ1NH//UPgzfUwtN7HAIOqYOyAt5Yfsz1kVRfr0TsNdEM0IDU
	XwJXdL+AFVZaOLhIl0XZ0I5la70ZrPgshTy2g7XRUKwluTnXyu4fWOs4k/qP6bBMOKYlojcvwdW
	frRw6aJ7lltIfB8NyhOSaAQm1eJO0dyw=
X-Received: by 2002:a05:690c:350e:b0:794:95a9:35b with SMTP id
 00721157ae682-7949e0b7078mr21754667b3.69.1769726183470; Thu, 29 Jan 2026
 14:36:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXuCBWOfVRpieHR1@black.igk.intel.com>
In-Reply-To: <aXuCBWOfVRpieHR1@black.igk.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 29 Jan 2026 23:36:12 +0100
X-Gmail-Original-Message-ID: <CAD++jL=W=_abY=NiRXH9K=uBL4w_Wqa-Esd_CPuxCwG7XL9_XA@mail.gmail.com>
X-Gm-Features: AZwV_QhmfQOYAxxzaZvCv8AwT-EvXj7XUU7tovRnTLCGZis6YlB8kcpTiEMZZGI
Message-ID: <CAD++jL=W=_abY=NiRXH9K=uBL4w_Wqa-Esd_CPuxCwG7XL9_XA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.20-2
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-31321-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 73ECAB5703
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 4:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> A few more Intel pin control cleanups. They are simple and still happened=
 to be
> a couple of days in Linux Next without issues. Please, pull for v6.20-rc1=
.

Pulled in, thanks Andy!

Yours,
Linus Walleij


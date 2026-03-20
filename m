Return-Path: <linux-gpio+bounces-33921-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEhjJ6ZLvWlr8gIAu9opvQ
	(envelope-from <linux-gpio+bounces-33921-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:29:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A972DAF83
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 307D9309DC7A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 13:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CEC3B27FB;
	Fri, 20 Mar 2026 13:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qcM9EJl8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5511A6817
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013301; cv=none; b=cVKpNSKfkR00JC1qA6+NiJQ2ozZsVfz4huNqDbmOWv9mUPycOU9h+YGmG7G0N3PjjKza6c89IEFykPg9dcoeYDWt34myPt6yJbjQnOt0GTUpN3DP1mcYfw4qNKTFUWOoaLNkTs5cD8uKoP2Y+r+mqRpqHyRPuU9U2WdyGmMskes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013301; c=relaxed/simple;
	bh=YzKXzVaGS/2OIloKcqNaAOwJYnHhATebfduv4sAgUHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZP1E3wwnycGYsZc6Z+9Gw+8xpVYvPf5j/RmGqpq0JcwmzsgKa6ZGwHx7xWTPLhjzbzAh5Jdz8ijlsEuSQ+AkzZFknaB0DLV3PowlFObgqBqJ/a5WBoAJ8tHiHLczxbQF1q1v3U+HtUA1zqUcD9aKdIT3h3rXdON/m6dcsVhWVvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qcM9EJl8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FC0C4AF0B
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774013301;
	bh=YzKXzVaGS/2OIloKcqNaAOwJYnHhATebfduv4sAgUHI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qcM9EJl8N/8p9eiTm2vrmTrGsCaY5bdF66SqBs5nF+mB2rt+7Zl9vRUVvtFhtjqlW
	 TJv8Ykr9Fm5S2NBHuRtyR6fjt8LyrCawuX7SHTL/Z5RZ4rmKEUL3evrL++Oec3d7S5
	 M27iRP9UGfYhJ/5EAuLtYXHfmezBryL9rbZVXGW09tGXsaFVP0hw7BIeWHKsdqef6h
	 2taqYSZUySHykKLTFTD7LDlSeDlCyHZ6QyJb5fzP67VsT39IF9LLYNijnNitiqM+e8
	 WLCuQDbfK2ajIpFQg9t9mkNWhlgE7Z0eDLzryV6uZlQiCVByAXCCG741Fr84D/CgGk
	 ORrXZhvQ5FmJA==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79a5ad7cc52so21587507b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 06:28:20 -0700 (PDT)
X-Gm-Message-State: AOJu0YyLAtXQwVrrk4jYEfEgbjRIhKUae0kSfrH861paj1WfCfEGhAvw
	G9og8fKs5PgiWv8GIsXUziTJr61m+bneCyhGYTedJ3KcyiqS4GLd/SX7qifTVbkpSLpSzabUA89
	Tt7eErBBTXBQtnbBf1ta39SmZOwY3jk8=
X-Received: by 2002:a05:690c:60c7:b0:798:138c:76de with SMTP id
 00721157ae682-79a90c0a1f1mr28204277b3.41.1774013300401; Fri, 20 Mar 2026
 06:28:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319000558.22108-1-rosenp@gmail.com>
In-Reply-To: <20260319000558.22108-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:28:09 +0100
X-Gmail-Original-Message-ID: <CAD++jL=ELqj0Cvd6WBG_UvAOt7+Y0xUPpc7qPEGS-0Dm2upYgA@mail.gmail.com>
X-Gm-Features: AaiRm50ZafYOElWf5QgG_Wj2xMz2THbMMPVrJQETvNw6UshnM47uBG2-F_YKets
Message-ID: <CAD++jL=ELqj0Cvd6WBG_UvAOt7+Y0xUPpc7qPEGS-0Dm2upYgA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mockup: allocate lines with main struct
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bamvor Jian Zhang <bamv2005@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-33921-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 22A972DAF83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 1:06=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> Remove no longer needed kcalloc to simplify allocation.
>
> Added __counted_by along with a counting variable to get extra runtime
> analysis.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sweet!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


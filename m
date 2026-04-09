Return-Path: <linux-gpio+bounces-34976-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fYxoCsUo2GmTZAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34976-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 00:31:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8223D0455
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 00:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC8F1300E26E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 22:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA8B392C50;
	Thu,  9 Apr 2026 22:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UyPLtV0g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07BC3090C6
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 22:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775773889; cv=none; b=n7jCMXbIbfDpfXkV2c+YWdIRjLk/P1R8BcRkBEZ3g7FRkWANUM8O+80IzhviPTQIXDHidmgrD57G08jxNc/FDAXXSE1NRRPhqeMN+29EiqMBz69gzLxkxLyt1Tx1sKPw85Y1TzvF4RcV+HBWdBr3etTEMw8NcSgApLfF2X81A54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775773889; c=relaxed/simple;
	bh=RfxyOkzOf9qpHTt5L6pMAlm8d9Ta/VHEEC7YXAGgGZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mop88jTyPtVd2KomYIWLVZPKwIDtc5EhjSWrTy5pO1zi8IDkMEM5MtZbRgkvCYtrlGiAFgzpRyJHlJyRuJu4ZOkA2ZtOXIRmvg3GaYenCUnKF5ljZ114VrsntItr5GkrQc9JqTw9nuONLI8UWJoN5NzckLT/sMRZiJ4XSu0AKMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UyPLtV0g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6088DC2BC9E
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 22:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775773889;
	bh=RfxyOkzOf9qpHTt5L6pMAlm8d9Ta/VHEEC7YXAGgGZU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UyPLtV0gslc33vRzoVg3gOBZ0NrMPCqbmz+V5/TNakS5MbtBaf2k5f2mXIgtsZbj/
	 +IqqG/BwT713aGzjaaPbzrpbhWbYJ+7+2D/YolV/58BRE6njqcOzH/nsPigiL8woBv
	 YLxjv+QVgTPjDkOSFVjuqba6cXZy0GR1YZLxZqHbpuW76RV2VMwuqrOFsj9DRj72R3
	 HbksOOWSCFD1L+KL57fDC0jeEKf3R/wHY7iGInUjWIuby8mOgu5JuqzEnyk9XUCHIW
	 fsiSwmQxDMaGsfiKj/mJO5Sfl/mo2q5GVhN1a/F+62c5rDLSZ8wpbELNm/tQaCAPFl
	 WBecJT9k/XtdQ==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-794719afcd4so16703957b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 15:31:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHG5uv75mXDhJBBFr3fzVPvNlbEFzHBC/z9CIwSVAy8KegMQebP+ZPDTtvIwMVPn08OpWJJnS82No9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2zb5OvRngRXddG6BubCFT4wOlVwMNNUUZCatrNAPkfog9qxCk
	HAsX3MFbeGzyyQ3eUqnMhX6IO2GNJRmHaGEZl12WYAmkQDhrp1QTNzA5UC7fDLUq8P5A/DdZBAZ
	7zMa/N7t/g3AstjhDiiYthqVQy8nc1XQ=
X-Received: by 2002:a05:690c:a058:b0:79a:bbe0:8cae with SMTP id
 00721157ae682-7af6ed45d5dmr7556707b3.1.1775773888672; Thu, 09 Apr 2026
 15:31:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-mfd-si476x-v1-1-93298ca35d6d@kernel.org> <20260409145823.GG3290953@google.com>
In-Reply-To: <20260409145823.GG3290953@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Apr 2026 00:31:17 +0200
X-Gmail-Original-Message-ID: <CAD++jL=zPZfkUue9rLb6UAXKztB0s73=hQTuiTT+We4KGM79nw@mail.gmail.com>
X-Gm-Features: AQROBzDOTqjawbJGX0-zObCP3nYo2UhAMMlGFlcB6rGha_LVr0VP5_ksq9Yqwkc
Message-ID: <CAD++jL=zPZfkUue9rLb6UAXKztB0s73=hQTuiTT+We4KGM79nw@mail.gmail.com>
Subject: Re: [PATCH] mfd: si476x: Modernize GPIO handling
To: Lee Jones <lee@kernel.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34976-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F8223D0455
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 9, 2026 at 4:58=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
> On Fri, 27 Mar 2026, Linus Walleij wrote:

> Doesn't seem to want to apply:
>
> diff a/include/linux/mfd/si476x-core.h b/include/linux/mfd/si476x-core.h =
       (rejected hunks)

OK I'll rebase on v7.1-rc1 and resend, definitely no hurry with this
stuff.

Thanks Lee!
Linus


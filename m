Return-Path: <linux-gpio+bounces-37042-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNgKAQvdCmpV8wQAu9opvQ
	(envelope-from <linux-gpio+bounces-37042-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 11:34:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8841D569CF9
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 11:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF17E3031CFB
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C95C3E63AD;
	Mon, 18 May 2026 09:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQ9SqbDZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FADA3E558C
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096636; cv=none; b=k8ZeMl9/kJR5MIJpXMHXBTD7EHUac7LNBGo7UWrsuBn9xC7XL1josUxdsn4LykIpvTd+nHzZfNNw6GbcvztxIujGprcZ+fN/Ldx6UFWH90RUqd1bZLFwt9JK+m3Olw0sRfe2+wdc9LO1Va2o6IqXPBh3fsuGlqWu58QZ5xXqRv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096636; c=relaxed/simple;
	bh=QM17c+bUkULd48PHCB/KHIH3TXWiCxsqNwKCusGE01s=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wy9dheBd31URUqR9eViViOsCyDK6UTd5jSTjEe74IsJ+nriwER79O6Hq3yfDeIaZWGJVLBjFJ493FESBbUzt+YAPAoSQrkmgHFqX7r7v5gTS8+r4OqKhDhzCsyo4VVGZgKVZw+hM5BKFcrFdjxVMswKpmFHMwrdWHkB768W6aVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQ9SqbDZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B557EC2BCF5
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779096635;
	bh=QM17c+bUkULd48PHCB/KHIH3TXWiCxsqNwKCusGE01s=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=UQ9SqbDZEoCmDvix1sToAPHJ1w2TwMlQQqhplo5J7fsKPsMASQ2pYam0u3uym4KSz
	 Px8+ADHedW2p73cgMdGktuzi622fpiqKTFhk1feR3JFvfWK9YWFNX3o41bzp0h8/fy
	 vB2fxY9G/dixGCXdO57l4EpgNqo6eAecjQ27Kiafz6rc0Gs94AJB1VT32UXQXV99vo
	 BhnU5cNWR7BYhU4+py93+hSvZXfMGa6xXycOSqGycP3Nqb78iecn/3NzpwQbjWDpCY
	 GTW+cpl7QLygjamrTCLBz2S5S545k89fA7OWrk1yE/mJ8omk+JzyKFOs3TKktzuF5P
	 ITcbW1usfiyFA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39397d63804so27054961fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 02:30:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9iKCtdaFFxYwptNF5ItStKcasl6r1Oa/Nf4H7RswDif6pP/ttz6nleAOoQ5d+vtr0mCs+dLfE1aeSx@vger.kernel.org
X-Gm-Message-State: AOJu0YxzBVhGhh6O3K9o0ImPyTcFWSKrTlafvGH9n3Gjm0SyWwRpFQls
	BEez1e/Ib44Y1B33UFyPf5vvmt73kxSlSo0xMxv0Ai6wM8OXV/laKNQLbabzOGqWXuxJCg4h2ky
	5VJIuxbRFGlk2BuKXf1atii76cAMDyldAgsZgu6jwIA==
X-Received: by 2002:a2e:a886:0:b0:393:bc85:8d80 with SMTP id
 38308e7fff4ca-39561ed27d4mr45903341fa.12.1779096634415; Mon, 18 May 2026
 02:30:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 05:30:32 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 05:30:32 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260514092042.3265986-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514092042.3265986-1-markus.stockhausen@gmx.de>
Date: Mon, 18 May 2026 05:30:32 -0400
X-Gmail-Original-Message-ID: <CAMRc=MebY=brURj=D7=73LH_EkjwOVAYC4=5h8MX0=SVR23RCA@mail.gmail.com>
X-Gm-Features: AVHnY4IH5lLQIuQG6vJqqr1gpy8qL_XpilxDrUM00W1cR4OImTYuUWBZgWp0TcI
Message-ID: <CAMRc=MebY=brURj=D7=73LH_EkjwOVAYC4=5h8MX0=SVR23RCA@mail.gmail.com>
Subject: Re: [RFC PATCH] i2c: i2c-gpio Enhance driver for buses with shared SCL
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: wsa+renesas@sang-engineering.com, andi.shyti@kernel.org, linusw@kernel.org, 
	brgl@kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 8841D569CF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37042-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,gmx.de:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, 14 May 2026 11:20:42 +0200, Markus Stockhausen
<markus.stockhausen@gmx.de> said:
> Preface: I'm neither an I2C nor a GPIO expert. Instead of writing
> a minimalistic driver for a special use case I was asked to enhance
> an existing one. That might have many use cases I'm not aware of.
> Feedback with clear directions is appreciated.
>
> Some lower end hardware (especially Realtek based switches) are
> designed with multiple I2C busses that share a single clock line.
> E.g. the D-Link DGS-1250-28X realizes 4 I2C SFP busses with 5 gpios.
>
> Enhance the i2c-gpio driver so it can handle such hardware designs.
>
> - Detect GPIOs that are used by multiple I2C busses in the dts
>   by using a unique identifier for each managed SCL.
>
> - The first probing instance allocates and requests the shared SCL
>   GPIO plus an associated mutex. Subsequent instances detect the
>   existing entry via the unique ID and increment a reference count
>   to reuse the descriptor.
>
> - All data transfers are synchronized with the mutex before and
>   after transmission.
>
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
>
> ---

The general approach looks sane to me but could you make sure this does not
interact in some weird ways if you enable HAVE_SHARED_GPIOS enabled on your
platform?

Bartosz


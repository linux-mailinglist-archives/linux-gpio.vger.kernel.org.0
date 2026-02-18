Return-Path: <linux-gpio+bounces-31792-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGJULc2TlWn1SQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31792-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 11:26:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8DA155626
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 11:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 834283019CB4
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 10:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C39285074;
	Wed, 18 Feb 2026 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAvA2JWt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327E5284694
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771410376; cv=none; b=mni0+ZEO1/GSNU1zLKTEOJl2+STL+KpMosBhAo7qRcLyaxv9woOcle/oyOfkJQ2yOy8f32cMLnZvpZvBFke0GmtZpjEBVp+1VYqcNe9NUww2ZUIbOU/8Bfv+iJ0XlNKCFR1l8b7hmBhX0Dt+2i7AHBPV2TwG6PcFyGtVYG9TFN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771410376; c=relaxed/simple;
	bh=kTpNK5Uls22jdkIeIXDKmi8A8vUQjxKmxX+QdiP9Byo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWoRliGGtNnxV9JQoEgZ/Wu8CnEmAW9dwQPWkWQzAXF7g9nsX7mJRKfQMHMFNmulF6hJPfCuKZTEzX71aFeVgyVcBYodzrEgr6Kdwui6ZzK/VueykCvkJ581U2vbbWyJCZfoonCZnhcx1kbhEMwaJLzHJftSFx5zQdydLhq7G/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAvA2JWt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E760AC2BC86
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 10:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771410375;
	bh=kTpNK5Uls22jdkIeIXDKmi8A8vUQjxKmxX+QdiP9Byo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nAvA2JWtj1JiNNf2GKQEQW3BP09SfsLUKZsNMuMl0jGnfswE7UMQ9KsB3q70mGOtJ
	 LvkU4msKqG9AY5lxEBgG5/rSuQVemApI3IqdjtgKeyOfxTxbafpR1oYdq0W4D23hV/
	 1JcuhJGOJILlPmK/3eopI2NQefQlDV0T0kOsspBHUOL0bo9QGxpO6GPEPKFkMQs4iG
	 gz3T9iFs6ktaNeIN6LkLmMzTyT611liurolKG8Gi7QKwBM1V0yjPxuNZekj+4Wt9z6
	 tx6GXhuNEf4DaXCTKTGK49rsI6+k8m0ujYtOmuBboT2VorXTTY/Ei216TOF5FJ9dO1
	 Sao0eIXTkzc4g==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59e62834439so5834513e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 02:26:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV73Zp8gnD4w8M1pW5X/xDQUdWNcbRwWcCAHoFLrKjoLZgPA6JBXzoO+rb5st7BT9Nebli35b+c2ceF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/OX7grcfWK2uEGsF8g+YuUU0n4vakFZLQ6ZNRKuMOZVn9Lp/L
	LdWdbZ/k9E6GCVYbFj/O45eYmmzVyZ1o2xmcWRjkzOduPOtLavVGgtFsZpnYKx6ZiEYpJt0sr0Q
	ony4avfJIM520OnXT9T4TK2LAPonsx2bu4YoHqJzxOQ==
X-Received: by 2002:a05:6512:239c:b0:59e:3934:fe38 with SMTP id
 2adb3069b0e04-59f83bbf105mr525374e87.48.1771410374647; Wed, 18 Feb 2026
 02:26:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213092958.864411-1-tzungbi@kernel.org>
In-Reply-To: <20260213092958.864411-1-tzungbi@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 18 Feb 2026 11:26:00 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfQumD1ULx7yU4W2sx=35wyQf7-v4tSf44OqEu3JDBUAg@mail.gmail.com>
X-Gm-Features: AaiRm50s_5yOYiMTA-IQER-1K05oUgtj1rsfNhuxVP-poaWxOx0gFtAG0Bv4_TA
Message-ID: <CAMRc=MfQumD1ULx7yU4W2sx=35wyQf7-v4tSf44OqEu3JDBUAg@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] gpio: Adopt revocable mechanism for UAF prevention
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, chrome-platform@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31792-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2C8DA155626
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:31=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> This series transitions the UAF prevention logic within the GPIO core
> (gpiolib) to use the 'revocable' mechanism.
>
> The existing code aims to prevent UAF issues when the underlying GPIO
> chip is removed.  This series replaces that custom logic with the
> generic 'revocable' API, which is designed to handle such lifecycle
> dependencies.  There should be no changes in behavior.
>

Patches 1-6 look good to me, I think they should go into linux-next
after v7.0-rc1 is tagged to lessen the burden on the subsequent
revocable work.

Bart


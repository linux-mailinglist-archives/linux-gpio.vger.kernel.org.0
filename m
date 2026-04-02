Return-Path: <linux-gpio+bounces-34584-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIRPMl5mzmmXnQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34584-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 14:51:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E9A389406
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 14:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BDB530715EC
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 12:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CB53DBD52;
	Thu,  2 Apr 2026 12:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQ22pSAe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75AA3AC0FD
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 12:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775133959; cv=none; b=lpdYJI2WdS9hSW7Y5FY5kkRyr7LNrEAEmcRTiWEQ9qLxmf16mtBjqtMCqL0mPXEYbzeSaVhUJZCKCvJvQMnwrWqqZmL83FLCho35TZzCSfkTcsA6iD3F548OxdVAydQpHJdPFw+P2e5e2fc9DCRpdW9BlAhxsKYt9vdWEhEFOKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775133959; c=relaxed/simple;
	bh=+ZzOiGdkoT/pdIJhLJHocKlFwkaRHLP4CgM7mWnuAl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOOFTj0dUbnpL6vPGoCXp/QdnKcACx632k99dOXCs/YPOmL712sSeziSMyR1AB3N0VHBez7uANpgcPa/m8IBGY7FVIMIi/lBNwhXWd3smhYPwFqtlQCgW8rNFxQbk4HeEj6VqqlOfQPY2HwG6ICpM3dAT1DSbFMtRZcSKYLl4Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQ22pSAe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD397C116C6
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 12:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775133958;
	bh=+ZzOiGdkoT/pdIJhLJHocKlFwkaRHLP4CgM7mWnuAl4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oQ22pSAe7UhpiYBL6dmlJzYv+wQKa3nenQC00uR+1xA1PV8idS5Wlol6krwSICE+W
	 C0rEm+146eyHP2hv9yB5q0SnZPwUVwB6Ry4OaXVHMSamXndkqbVbVathObbc13E3TB
	 DvgeYXXpfeh/vXSj1JbiCJl0KYUuxf5aaiT7c/Y/6JHHB+A9oY8EbSm+porgYcr5MT
	 zErSmkEyV4qfWT5qTfLRLqXv9jHVpJPpRQhYJTz4d2u/34gp0JQHIDypMl/4tw0jd9
	 uA0DOaNVTldpQ82qnnMAx2R2rhIQ7yavXxXh9kzzXHmc4xTBB3X33sQdy+n93WV2qa
	 vS8AiH5XhC24g==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so1182139e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 05:45:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDrOcNk+RT2TgozL2bTy1vHqG47YbwxoCKchClGI4vrFaQdJ7nfd6eHwSqVBB8Y8TzdgZguWtjuZEy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmwd8AqM5LeiqPgCaLjDmX6gq5jMAI+aXyE3gsnkLwCys6Oo75
	cSTFCo4s+c1K+eu+UaHiTamLa6ALn+sbPytmqkQc9iVuIqecMRM7H0cTs2H0x4NhgfNPC19HzR9
	B2WyWDhnyKdSmYHlxt0HRUgX7yn1FuGCA45qKL/jKbQ==
X-Received: by 2002:a05:6512:3f12:b0:5a2:be43:c57d with SMTP id
 2adb3069b0e04-5a2c76585dbmr1033481e87.12.1775133957615; Thu, 02 Apr 2026
 05:45:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-gpio-kill-dev-sync-probe-v1-0-efac254f1a1d@oss.qualcomm.com>
 <20260327-gpio-kill-dev-sync-probe-v1-2-efac254f1a1d@oss.qualcomm.com>
In-Reply-To: <20260327-gpio-kill-dev-sync-probe-v1-2-efac254f1a1d@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 2 Apr 2026 14:45:45 +0200
X-Gmail-Original-Message-ID: <CAMRc=MexxvNZt6D0iGbW2p243CABUdYQ+JJgyrgCdO1jfmVQVA@mail.gmail.com>
X-Gm-Features: AQROBzDd-xssSnghtbB7NpyuO9CKPLkMcC8l_k1WH6MOkwHKH7WhiTA-ofQtpB0
Message-ID: <CAMRc=MexxvNZt6D0iGbW2p243CABUdYQ+JJgyrgCdO1jfmVQVA@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpio: aggregator: stop using dev-sync-probe
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linusw@kernel.org>, Koichiro Den <koichiro.den@canonical.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34584-lists,linux-gpio=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 23E9A389406
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 11:31=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> dev-err-probe is an overengineered solution to a simple problem. Use a
> combination of wait_for_probe() and device_is_bound() to synchronously
> wait for the platform device to probe.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Hi Geert!

Any objections to this being queued for v7.1?

Bart


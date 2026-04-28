Return-Path: <linux-gpio+bounces-35655-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Pe1Ootu8GmgTQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35655-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:23:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 470A247FF2B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A33D3089F20
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84A93D34B9;
	Tue, 28 Apr 2026 08:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIBWvKmq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774EA374728
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 08:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777364170; cv=none; b=Aqy0K1AVr+OY5QBSEpmRojSXzXpCCexMel90FuB2gKB6a4AhM9J7PXSkAkfQSIMOFEP0zIv6VCfGcA1IETydPzvyxgy+zSfqd2qzxP6I8OLtgRqzjnyo6G2FONDhDuuiRpE5vNfTxDXSqQdivJ5d454m6B65F8ye/CTUny8IAhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777364170; c=relaxed/simple;
	bh=bq8HV6bZ3WcAcFCsC2OjX+q9RAprj5qn+EQSHi6y6+k=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iC0odRotk3AjN06gewVVmKbsx8VO/nIwjzZW73q00UI1CjlacId5cxS7JHO844pmyRvhMRqybZL1EoKaEOuwpnBWj/SDairbU9z6dPF3/amdRzrDvkg3HSai0DEoC6HAliwl6F3z2gPXH23xOhmrzlh2AJWkG+fVJvBuOJSsNAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qIBWvKmq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1EFC2BCB7
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 08:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777364170;
	bh=bq8HV6bZ3WcAcFCsC2OjX+q9RAprj5qn+EQSHi6y6+k=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=qIBWvKmquz27t+Go2V5gNIPUUhN+84xp0X8Niq5t1XbT4ItMvfvOGJAJ66U6cuOhx
	 48nM5MUbOP/xZ4/VARPnd4M14YZj/fj5PdoKwkfwI+CQnB91OAh4Xgs0NU/zYAQK/O
	 IHsPsU9BXs79FxUrL2xP/vqQTB2+ErlGF04q7Fnk8aHpvSCmy9F4cwEDZQX+X5QNGz
	 hc1TGeVUYVl/L04D9x9LRg8wiiGR3A2zDfn/h6vnjFtYn89vPJK6WiiJaQRwuMV/j7
	 bE2yLJlgXcWthuZ3WMubdJagLxyUcR9JeUGeneDEEyTROyN4DF4JaGAvJIQk84ws1R
	 lKqg0/tcwHkdQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59dcdf60427so10075887e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 01:16:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/GKyP0M8QVManNpn88lHGRulzZ6T3/FeaLaKVSI5MQZRjwUd08lzn50ZIyTlJrdF3gTis9WgoTPx6+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxw0oraerwZ3mSe6eXvtdUhRIg4iIJoFiyNM9qyQwXjwDMH16C
	Nlkcds4uRVWWSzRMXgtl8t8J0yuefvNYUskYJAYR86dg6thwcTVbjxge7exI+64EXaNQYUNXpDM
	4aP3bQR4izXLLlmOuLlmZi+HqzQYWmizJaRaHgVuoig==
X-Received: by 2002:a05:6512:33c9:b0:5a4:19de:eb70 with SMTP id
 2adb3069b0e04-5a74661dc65mr839483e87.28.1777364168951; Tue, 28 Apr 2026
 01:16:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:16:07 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:16:07 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427135841.96266-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427135841.96266-1-tzungbi@kernel.org>
Date: Tue, 28 Apr 2026 01:16:07 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdnrKaEgFZod7DZC2FkigeQW6DogfODwmsZO=LS0Zie+w@mail.gmail.com>
X-Gm-Features: AVHnY4LPpc6CD92dyZC7ll_n7sufI8xvpfzAcz25gEttk1XdSLAYMTRwT5j_PwM
Message-ID: <CAMRc=MdnrKaEgFZod7DZC2FkigeQW6DogfODwmsZO=LS0Zie+w@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] drivers/base: Introduce revocable
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 470A247FF2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35655-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,lpc.events:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, 27 Apr 2026 15:58:32 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> This series introduces the "revocable" mechanism, a synchronization
> primitive designed to prevent Use-After-Free errors.
>
> - Patch 1 introduces the revocable which is an implementation of ideas
>   from the talk [1].
>
> - Patch 2 adds KUnit test cases.
>
> - Patches 3 to 7 transitions the UAF prevention logic within the GPIO
>   core (gpiolib) to use the "revocable" mechanism.
>
>   The existing code aims to prevent UAF issues when the underlying GPIO
>   chip is removed.  They replace that custom logic with the generic
>   "revocable" API, which is designed to handle such lifecycle
>   dependencies.  There should be no changes in behavior.
>
> - Patches 8 to 9 uses "revocable" mechanism to fix an UAF in
>   cros_ec_chardev driver.  Alternatively, [2] is a series for fixing the
>   same issue without using "revocable".
>
> Since v9, there are two ways to manage the resource provider handle.
> - Embedded allocation: patches 3 to 7 might be the potential user.
> - Dynamic allocation: patches 8 to 9 might be the potential user.
>
> [1] https://lpc.events/event/17/contributions/1627/
> [2] https://lore.kernel.org/all/20260427134659.95181-1-tzungbi@kernel.org
>
> ---
> v9:
> - Rebase onto v7.1-rc1.
> - Remove the selftests patch as it makes less sense to test revocable
>   APIs via kselftests.

May I suggest kunit for that purpose?

Bart


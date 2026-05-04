Return-Path: <linux-gpio+bounces-36027-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLFyAmlT+GnSswIAu9opvQ
	(envelope-from <linux-gpio+bounces-36027-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:06:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 579FB4B9DDD
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 459953021E54
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 08:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B61E314A82;
	Mon,  4 May 2026 08:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcG7DEFP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4412D8DB5
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 08:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881676; cv=none; b=Dbqkg79be54CZMl0xnEH9EqnvgE6aMhKpLs3ZpgcCEmBifbjhWS5le4zltE++eZk2UjudZQfI0gfeZ3e4yq0QKAShczmq/aRdXbketxzj11knbZG+yQu4iH3btw1r2b3MEpfdyTvCiamM1+sD0T7Zzj/075OR4Na4HyatEyNKQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881676; c=relaxed/simple;
	bh=BF1keaunMUx8XVqChcMHiJp6muAdWiVzKcRxORbLYGw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhnCy/70BiH/oIlnn1mCLIEBDgc5Gq4wZjDsE3Ml3DrTDaj8ZSLXpKn80+0XDsqXIKGumTU1kR3Vuqru82EWTKo3ozd6HRsfGRHbyTootKYQ+DB3TlBbKTeVLO6H7yWam+hqG6GBbXQ9ZEWVnDgXuMD+EHKj+mPgalB1ZKtDITc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcG7DEFP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E812CC2BCF7
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777881675;
	bh=BF1keaunMUx8XVqChcMHiJp6muAdWiVzKcRxORbLYGw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=QcG7DEFPzYBFYNtEiubJfvUrxvWvxQDHmwJDf24h2trXxIo1NpCBk72Cxq9tu7G1t
	 +4AM/Y2yN3MNASfMXNaEoeKmKYlcoew06pSvyZUNYFl3kZS7P4YvyN4uOXyNrxrDK6
	 B6nEurfX7GpVny/XxMiHZglVb2zCIEzp7JrOwXRVd8a7ZLNCQlEABNHSJt4iS/LeuH
	 AEo080nBQXVWuEOniFIG+hgJd2Yu3CykXM30AwnE2eB/dant1YAvkofW/hatugJCWx
	 7AhMK6i+zduVIzSmuF1su41DqLHpX02SsVSBRu7ATVqDUQZShFLFLXgu2lCm4r4eaJ
	 Gj4F/ipPmdxnQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso4071795e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 01:01:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/APl3G2+rASjwncfAoE6YWcdcdr1VZWRSMKVk0Tp6ZW+KNAHb1I4g1qHLqCJ/5nEBg+5joID6PaaHz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0UkK3xYkEZz9ZAzAg6OGuEkHfpZvUtf77s9N9yTqGq74v3cs9
	LpwdHbnakW5CBKcTJNWSGMouOEbW3Tt8apewjvBCC4GGADtEZAjeABk1ZZiWgzzJ0dnTy5JNRzA
	xAoxGn/F1F9rs0OioJFS22O+3mGTm1xx7olHx8fXrRQ==
X-Received: by 2002:a05:6512:1150:b0:5a4:1798:31ba with SMTP id
 2adb3069b0e04-5a8631bdb0amr2638589e87.21.1777881674431; Mon, 04 May 2026
 01:01:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 08:01:12 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 08:01:12 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260430162855.2029285-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430162855.2029285-1-arnd@kernel.org>
Date: Mon, 4 May 2026 08:01:12 +0000
X-Gmail-Original-Message-ID: <CAMRc=Md9yNKaTS5KZ24MJL_NUXvmnQq7RmrYzwHyLZf3yiz39g@mail.gmail.com>
X-Gm-Features: AVHnY4JOLqLf7u9NDYgd1t1x7o6UQwoytAZq3AYM5jiMnNXvH7UVEpN9zSMLJUY
Message-ID: <CAMRc=Md9yNKaTS5KZ24MJL_NUXvmnQq7RmrYzwHyLZf3yiz39g@mail.gmail.com>
Subject: Re: [PATCH] mfd: ezx-pcap: remove unused driver
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>, Harald Welte <laforge@gnumonks.org>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 579FB4B9DDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36027-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gnumonks.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Thu, 30 Apr 2026 18:28:05 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Support for the Motorola EZX phones based on Intel PXA processors was
> removed in 2022, but this driver remained present in the tree. As far
> as I can tell, the support was never quite functional upstream because
> the board files did not actually instatiate the SPI device for the PCAP.
>
> There are still also drivers for the various mfd cells: keys, touchscreen,
> regulor and rtc, all of which are obviously orphaned as well but can
> be removed separately as the Kconfig dependency now prevents them from
> being enabled.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604301209.f1YXTsIr-lkp@intel.com/
> Cc: Harald Welte <laforge@gnumonks.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


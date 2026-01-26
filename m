Return-Path: <linux-gpio+bounces-31072-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 734QE8Jwd2mqggEAu9opvQ
	(envelope-from <linux-gpio+bounces-31072-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 14:48:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFF689146
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 14:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2FD63018C24
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 13:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222CA33A9F9;
	Mon, 26 Jan 2026 13:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwstrhMi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D943133A714
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 13:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435327; cv=none; b=gYb6V4CdroZEfZyiRoU8rKaSLSo/XtlmhJ0q9m1nOms2D5XHQ18KPIwsg3m8wiehsw+0HUir1iBH7TRnBDgGKHE0RLMdCZ7ojGYflHZ9kAy+2r9MOGz3KD93zQa6unadJgSBlqctt8e3bdVzSXLQbovyome7kPWceuYWo37/bBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435327; c=relaxed/simple;
	bh=YZiBoAKwxUPexmRiPzfvRsMZdbZ7xD4R5JqHHAEqDPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tc8+d4e7RG2lc9AC8KhquYDTcPPXPkZBwXnKn2VdR94EoWPmYDnqd3LxvWaWbqIfRjwcF5205E2Eq6kH+0dM6b9VO2ZsLuzW6FhWZEK6ZqqkxUXdhMJ8Q3nhsFv+CObapE1mWVVYRNskYPb8YUczk+hg21WmmKRBP/WVEJp8bGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwstrhMi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D01C116C6
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 13:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769435327;
	bh=YZiBoAKwxUPexmRiPzfvRsMZdbZ7xD4R5JqHHAEqDPM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KwstrhMiJXG/Z433FNjrW3OybV+DMaz9UuAVHZRhhTnCMeEAr/fFY0oj++gSHkC6g
	 hwKnOVmCfzLqILJqDDUG+pRBg2u1RMPRYwkVjDOPKKj7yOxRcrN1muqEYX7Juv/s2s
	 8IjrW5LtMPcpjtjGo3Cl8ZpWSEx7DyuQPkCgtsayRdDBXviXta3uhCAan/EO5r1kPN
	 20yKvZdpPDiy8SVwRqp/YfozR6DDOTGkIH14/cdj/Xixwxn7qRyIbAhqw0gfbR0PhS
	 bCnmXanDqA0SdlPMGWd7YB9gbbhy75tMlCJ94FYGMvCw8lVHiuNXTtNfndjOfAxAUC
	 zOvuPKZqKUP6Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59dcd9b89ecso5436973e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 05:48:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzZtkm89akRYCErSc6jme5wgqnf8D9xgO2JHJMAReKLWbg6FLydpO7CVB0teM4NHylYOZEth7ai9MJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw9vLklrF9xZD1YSUrtAByomHDGJ2OXAFtGqR/VrKOhDyWzv9m
	kX7Vr8oc4co7HSQKm20U02ExTMZeG/r8yQ6F6axjVcHOtyRf3Nyw/1b7jzJ6QVLpEc2SzM1Z8q2
	7aT+0FbVCpeVmZIsx5uYYrppupnciNkJpfnavIzMZ5A==
X-Received: by 2002:a05:6512:224e:b0:59d:db30:8848 with SMTP id
 2adb3069b0e04-59df3608e97mr1612684e87.16.1769435326203; Mon, 26 Jan 2026
 05:48:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bddc0469f25843ca5ae0cf578ab3671435ae98a7.1769429546.git.robin.murphy@arm.com>
In-Reply-To: <bddc0469f25843ca5ae0cf578ab3671435ae98a7.1769429546.git.robin.murphy@arm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 26 Jan 2026 14:48:33 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfQCrhgv7DcWrr3TWe8DtpZSRrkxb5KDHsGq1jPjUAHww@mail.gmail.com>
X-Gm-Features: AZwV_QjNZHR2bvqedgSwwPYoVFPn0kS27NdFWXw0akxEKyqmIJSBPYeJs72yKbU
Message-ID: <CAMRc=MfQCrhgv7DcWrr3TWe8DtpZSRrkxb5KDHsGq1jPjUAHww@mail.gmail.com>
Subject: Re: [PATCH] gpio/rockchip: Stop calling pinctrl for set_direction
To: Robin Murphy <robin.murphy@arm.com>, linusw@kernel.org
Cc: heiko@sntech.de, sebastian.reichel@collabora.com, m.szyprowski@samsung.com, 
	linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31072-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: ECFF689146
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 1:12=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> Marking the whole controller as sleeping due to the pinctrl calls in the
> .direction_{input,output} callbacks has the unfortunate side effect that
> legitimate invocations of .get and .set, which cannot themselves sleep,
> in atomic context now spew WARN()s from gpiolib.
>
> However, as Heiko points out, the driver doing this is a bit silly to
> begin with, as the pinctrl .gpio_set_direction hook doesn't even care
> about the direction, the hook is only used to claim the mux. And sure
> enough, the .gpio_request_enable hook exists to serve this very purpose,
> so switch to that and remove the problematic business entirely.
>
> Cc: stable@vger.kernel.org
> Fixes: 20cf2aed89ac ("gpio: rockchip: mark the GPIO controller as sleepin=
g")
> Suggested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---

Linus,

With your Ack I can queue this for v6.19-rc8.

Bart


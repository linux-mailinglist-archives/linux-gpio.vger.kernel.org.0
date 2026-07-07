Return-Path: <linux-gpio+bounces-39570-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x38jKjK1TGr+oQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39570-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 10:13:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17183718F5F
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 10:13:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lubf3GRN;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39570-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39570-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDBE5304DCCB
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 08:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0922DF134;
	Tue,  7 Jul 2026 08:08:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C30285CBC
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 08:08:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411686; cv=none; b=TiSeRw5dBXApFSUKRMnd+Tu211LrPp6MpSPOxt2t/sFz7Q1UMU4r8jIYI9dsGLamXTj4E4sObUTHRaMcsPccvqo3pwoBq/St6DP2w2gLmRSenlpS/JmvdB8rewwj4OJuNSBRovJ5hiTdIBzNQKFlW4kpGVwLAb4Vcmq+IwzUHkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411686; c=relaxed/simple;
	bh=ZFqJenKHf79crL8FtIJ8E7FQoJ2ItmaH9orqP1Mmhj8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t8HHm+0ogk7oA+qG2C2Vi0EHXQ0Gp7E2EX8ehoV4cCgoTaD90MWBW3cPFCOz6h5Leg2WzlpeVQLTJ6xcTQ+A1eHrfjVywSWi62UZvMkFR5+WZ0T3oIGgE4VpNugq/4q9NK8bkt0ZsxWQVAUWQr2p3AWPmYR86THLaJLjvkMNmhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lubf3GRN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEBD71F00A3A
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 08:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783411683;
	bh=ZFqJenKHf79crL8FtIJ8E7FQoJ2ItmaH9orqP1Mmhj8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lubf3GRN11yRP6pd3XtD9CF11ay8H0xWcijybnNwc7z/zgJGFwiA9v49GBdDJR4rJ
	 ZaUXrmc8fi+RcbawHc0XdafcLMy7Ne9Oh4Rmf3daWSPmcgDkxcEzVzw58z51lKGTbX
	 LbfdEslLiW9k7O5LmKtKdKGpPIYcRfT0v7OfH5lOJ4dpPxpw7mHkeKNXLglno8Aroy
	 xtQOlbf/E/z8EPgv3iuwElMi22LJ8OaESFnyzk01ih6p9XQdVPsUQ7bjCQV5wp+Vq8
	 D7g/+5b6lEvT7WqtG810HEZhLbyF/OBlOH1RAOLKRxCf5+aC2mjf82HvXH+wQR723n
	 sXZoMrB+zi3pA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c610a7ab9so6828291fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 01:08:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpCd9tBuAL4XOxeD84QTVu4O0mG1NIibHN3yXcC5mnj8VZUfdUttX35zuqO1s60f8NNDT8N5KDhhQTX@vger.kernel.org
X-Gm-Message-State: AOJu0YwdifWclvDBn1srQZR4rGJ1lod6Bd37IV4ogs2LlqjbBIGsTjSd
	1qHDNq9tUWdMTOCWco1FGU6hnfSUokdmRb0FpIb+3KcccRyRXM7ui60Gb+hgYQutrQ31KptwXn5
	szC3QzBwRl7PGCwqRK0TkyKS5vv3Vh3dTZ1tQoCVVVQ==
X-Received: by 2002:a05:651c:551:b0:39c:6927:5c0e with SMTP id
 38308e7fff4ca-39c69275c6emr4674581fa.18.1783411682550; Tue, 07 Jul 2026
 01:08:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:08:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:08:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
Date: Tue, 7 Jul 2026 01:08:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdfRs13TAqRqwff+=v3SrTXynyhCb75udG46hmwTRwuKw@mail.gmail.com>
X-Gm-Features: AVVi8CdXMJVBF0F-w40gf2-4DxP-Pr9ZrnyQOzWnxVH-2OB9v_JiQsUD63iUHTg
Message-ID: <CAMRc=MdfRs13TAqRqwff+=v3SrTXynyhCb75udG46hmwTRwuKw@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: sa1100: convert gpio-keys to software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39570-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:linux@armlinux.org.uk,m:linusw@kernel.org,m:brgl@kernel.org,m:soc@lists.linux.dev,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17183718F5F

On Tue, 7 Jul 2026 05:13:59 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> This patch series converts StrongARM SA-1100 evaluation and handheld
> boards (Assabet, Collie, and HP iPAQ H3xxx) from legacy platform data
> (struct gpio_keys_platform_data) to static software nodes and device
> properties.
>
> The first patch registers a shared software node for the SA-1100 SoC
> GPIO controller in drivers/gpio/gpio-sa1100.c, attaching its firmware
> node directly to the GPIO chip prior to registration. The subsequent
> patches convert the board setup files to define static software nodes
> referencing the SoC GPIO controller directly, allowing pin bindings to
> be resolved via the attached firmware node without relying on name
> matching.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Will this board not die? Anyway:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


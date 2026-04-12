Return-Path: <linux-gpio+bounces-35073-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJHXNczm22laIgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35073-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 20:39:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B85B3E56F6
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 20:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 951AE3003802
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 18:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6739536E489;
	Sun, 12 Apr 2026 18:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTMo0zkI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2997F31715B;
	Sun, 12 Apr 2026 18:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776019146; cv=none; b=iy/kl92vEbDeChnbgOCTv6nRAJpOIXEnB8gqiEkfrCUE/xJQMVX5lRS/c4yjftKENZWzkWX1KDR2qbfuoa8FsgmgWa62yaGRWVQrV8e2vdCnqbxY68VmskhiMPRDwvBfsrHH6+V9HMKXmMjnvCsrj9Qwop2oP+8aVjv6+bSr3gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776019146; c=relaxed/simple;
	bh=dcEmLLApXacngjPzNKE1xU1CKZHtpcpVKqDIJLur2U8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ny79pzn84pDkRQnQ7rwnFrOflc1VAbCFuMYTa9f+Rb1Q8O7GCsf8fvy+wfBHSNkCuZsWK2iZBE1aVMeUs1869eqxL7yG8AYwWzPGI3Oq/omENplO+hSklQPHE03y10gCSRCrrhKk4BHgJJhuxoGhucM/q8sL7/T+/TmP7W7v0qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTMo0zkI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD81C19424;
	Sun, 12 Apr 2026 18:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776019146;
	bh=dcEmLLApXacngjPzNKE1xU1CKZHtpcpVKqDIJLur2U8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eTMo0zkIUUeF6lyasmTl6lFK+3IXyJJ2A47grKKjO73UoBb/vx/bPVj9fgCmZ7DjV
	 KsK2Fdm1V9T0yDnMILSdsg6inXYa33DeGNOYPs9kex+x1eyS86mcgQI0Dgx60V/S6r
	 Is9Vh5DPY0byN1xjcHUoS15PjtWzWwTKzK/29hQDc6Q0F5uCZxB7vxPC8ptp8mnOIe
	 DNO3sgpg9dwt1HbaiD7fV2S7TlW8bjplECwDDJxOgI2Jl/OJ+oaHrOjIpaE9hXo0Ud
	 D4muoqdJp8Uf6bsTyS1b3ZGtX7Ik14xEAVYYp0nzOza1dOLU/zyL+XPB2ofbqQFYp1
	 PpMSZ3pw5htnA==
Date: Sun, 12 Apr 2026 19:38:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/4] ti-ads7950: fix gpio handling and facelift
Message-ID: <20260412193856.1300770b@jic23-huawei>
In-Reply-To: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
References: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35073-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7B85B3E56F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 05 Apr 2026 21:39:22 -0700
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> The original reason for this series is to make sure ti_ads7950_get()
> returns result in range [0, 1] or a negative error code to comply with
> gpiolib requirement.
> 
> During review David noticed the fact that the function also clobbers
> gpio state. Fixing that lead to adding cleanups using guard() and devm.
> 
Applied to the testing branch of iio.git. I'll rebase that on rc1 once available.

Thanks for persisting with this. Indeed a nice facelift ;)

Jonathan

> ---
> Changes in v5:
> - replace mutex_init() with devm_mutex_init() (Bartosz)
> - Link to v4: https://patch.msgid.link/20260329-ti-ads7950-facelift-v4-0-c568c508c49a@gmail.com
> 
> Changes in v4:
> - rebased on top of latest next
> - dropped the 2 already applied patches
> - restored inadvertently removed mutex_init() (Andy)
> - stopped calling devm_regulator_get_enable_read_voltage() on ACPI
>   systems as it is guaranteed to fail (David, Jonathan)
> - removed call to spi_set_drvdata() since it is not needed anymore (David)
> - Link to v3: https://patch.msgid.link/20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com
> 
> Changes in v3:
> 
> - Added "Fixes" tags
> - Picked up reviewed-by tags for #1 and #2
> - Dropped the conversion to "error" variables
> - Avoid using scoped_guard (per David)
> - directly return results of function calls at the end of function (David)
> - Split spi_sync() error handling into a new patxch (Andy)
> - Switch to using devm_regulator_get_enable_read_voltage() (David)
> 
> Changes in v2:
> 
> - style fixes in #1 (per David)
> - fix to not clobber state (#2, new)
> - #3 and #4 (new)
> 
> ---
> Dmitry Torokhov (4):
>       iio: adc: ti-ads7950: switch to using guard() notation
>       iio: adc: ti-ads7950: simplify check for spi_setup() failures
>       iio: adc: ti-ads7950: switch to using devm_regulator_get_enable_read_voltage()
>       iio: adc: ti-ads7950: complete conversion to using managed resources
> 
>  drivers/iio/adc/ti-ads7950.c | 197 ++++++++++++++-----------------------------
>  1 file changed, 64 insertions(+), 133 deletions(-)
> ---
> base-commit: 2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
> change-id: 20260220-ti-ads7950-facelift-ad8b5390a654
> 
> Thanks.
> 



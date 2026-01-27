Return-Path: <linux-gpio+bounces-31122-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGizImuDeGmqqgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31122-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:20:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E66919C2
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:20:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A61A303B7C9
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761842D8398;
	Tue, 27 Jan 2026 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkSuzN0o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A00C2D5A01
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505361; cv=none; b=L7TjpoTAtLXlbBv55zSItgxqVjn+Qf4foCPrUJKMvsoCKsY8ciaSwdEbCFs6W8BuRKcWf43HwnOSE7DtPaLwAknBtw6D2dmOuiDcxP1BWBlN3xK+P82WzY9SQbHCE4G4Qr+VNbnRklFsBx05t54TXqJFCxwZLdIaggFjyRnW14E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505361; c=relaxed/simple;
	bh=5WxxjYR5gOZHi5DAIWODsLg8e1/FEvPM6g3x8vQeXgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dwOLnEZkIJ2KfJUuaPOM12zlNwsIE5dsekGlf5GgrdQr3xZu1R7CqtKWwhRk7IcgyrX1auw1g5W6XZbIrYkk4YYUc5aWEr75poCK3CcLnFD6huRA5BGI8ihP5ZN0RMAx2GTn1W5Jmpgu6zrMGL+aEkNPbeTrohojXrLoZ9NBcy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkSuzN0o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C923C4AF09
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769505361;
	bh=5WxxjYR5gOZHi5DAIWODsLg8e1/FEvPM6g3x8vQeXgw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SkSuzN0ooUv9zBPtPuVboUxaoIebJwBdA9YmeHdpB8a268GyETE4w0HBtJr2kfAYE
	 PubM5rUiTQLlARKg6Ulb905KmMtT8sqqFa2jJx0m0T+jku756efDq0UGZEMSGQsH8U
	 e1owCSxrtRLoNm+rrdFYLW4Kzjd6uJzV+e4vklKEKYnb0Z4iD7DfhFAzE4P1Lpcis+
	 iXhPBeeYapysH2Gc2CjCFzZsOZ0ma2vi/7WBPmi+2evvz5Q5mCMjTW5oJVlUHq2gHs
	 PupWPVyHDgddz3m+uAhbsGgHE0rEAqN8OVY8YO3oiwhZNFYs0j7qC28Qn0P26Odzc+
	 fkXeyy7RhwgyA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-382fea4a160so48569121fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:16:01 -0800 (PST)
X-Gm-Message-State: AOJu0YyO9fYsIbLShIx0q5MWlWCwLSglCWSZW9zATdU3+qWN11s45UQD
	PJIiw5I0MP9U0X3b6SkZl1SjFPtgQQ3+ykkxvhHIjdcgVnqe1XOcUtk0BUSw1ox/aXt9CHaArUr
	xRTsMMPBqA3/BF0eFosj+goJlqdQYVHAqvMyq2lLLwQ==
X-Received: by 2002:a05:6512:a8b:b0:59e:2a7:4055 with SMTP id
 2adb3069b0e04-59e0402a99amr484271e87.32.1769505359785; Tue, 27 Jan 2026
 01:15:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124162111.3945666-1-nekowong743@gmail.com> <20260126040348.11167-1-yuhaohuang@YuhaodeMacBook-Pro.local>
In-Reply-To: <20260126040348.11167-1-yuhaohuang@YuhaodeMacBook-Pro.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 27 Jan 2026 10:15:48 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc3Na--W81n0DTvarDPEsHDjSMksCYSLMkUt9ewf3FVKg@mail.gmail.com>
X-Gm-Features: AZwV_QhgVlSpk-d138q3iBya8lM7qN_YeZyuqrtM7OrMBKMDXbitk-mJbA4Micc
Message-ID: <CAMRc=Mc3Na--W81n0DTvarDPEsHDjSMksCYSLMkUt9ewf3FVKg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: virtuser: fix UAF in configfs release path
To: Yuhao Huang <nekowong743@gmail.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31122-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E1E66919C2
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 5:03=E2=80=AFAM Yuhao Huang <nekowong743@gmail.com>=
 wrote:
>
> From: Yuhao Huang <nekowong743@gmail.com>
>
> The gpio-virtuser configfs release path uses guard(mutex) to protect
> the device structure. However, the device is freed before the guard
> cleanup runs, causing mutex_unlock() to operate on freed memory.
>
> Specifically, gpio_virtuser_device_config_group_release() destroys
> the mutex and frees the device while still inside the guard(mutex)
> scope. When the function returns, the guard cleanup invokes
> mutex_unlock(&dev->lock), resulting in a slab use-after-free.
>
> Limit the mutex lifetime by using a scoped_guard() only around the
> activation check, so that the lock is released before mutex_destroy()
> and kfree() are called.
>
> Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the =
GPIO API")
> Signed-off-by: Yuhao Huang <nekowong743@gmail.com>
> ---

I queued this but please don't send patches with In-reply-to:
referencing previous versions. Also: please use get_maintainer.pl - it
would have given you my kernel.org address.

Bartosz


Return-Path: <linux-gpio+bounces-37467-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II4pKIpPFGrmMQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37467-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 15:32:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4698F5CB2DA
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 15:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF55F30356CF
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 13:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668073859D2;
	Mon, 25 May 2026 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmcZ2XPW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33344383981
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 13:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715738; cv=none; b=DyYTjVKVIwpH29OCTOBHlysWvQKGfdWKsL62yPRlh0FiLu7RfoIiLZutSw8k0Fy1zbdHyDLBMLUxITIblrnjAlc3ExdDd4k59KTJgBEBFlwQQEx8m+tJY6ohfyGxtHqAxXAM68Wbku7zIRvxhaRhkxZG8XL/NpN5pWVxLt+GeAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715738; c=relaxed/simple;
	bh=zhgd1qkMsr1NxbnyasAyFqdrapldyhGny7vZ7lcCCtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tsg5Le8SToghAqa8aXcrrGTkrF803UlGi0Q3sIYhiQEnWMRRXO7rOVPUpI9fCSIWtq9eV7WNJg4ZAQCXleJ5IqlzBzt4286mrOA0f6gVCzNdBvLZt+ueoQRouTRGyWuZZR6fxXf6k7/8KW5dvWs83cGBH0LIAiAMp6Xg26xksD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmcZ2XPW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADCE1F00A3A
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 13:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779715737;
	bh=zhgd1qkMsr1NxbnyasAyFqdrapldyhGny7vZ7lcCCtk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VmcZ2XPWYe33ps5kluUPp709eGcdhPAxed1m7IjTIAMfEpKpcz5XPjjT02nPa3bGM
	 r/F2cG79VSnYIx5g37KCj6coM5ZNqmJkb/P1mJxjezkxKS1Yk2qV9SY4XgVJ5O9QKh
	 Yr+/H5Ec5wxWaDtZPIEHJzz1Wy1KWaLSS7hD1IdiXOjplUQRrWhMtlzPCOG4Kmm5AM
	 p0W8ZMnIo6NK4NNbW56sZ5m2+F7pztv2SDf1NVrNFixAaF8S+PstuYamLCknsJ1hAm
	 +nnub3US70lsbSSAViujpGLXEMw/XaiTE/fpcdcR92WK8mXqZCDxk4Q+EUE1KNqajx
	 ybCzQaMkP68Zg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a8738c178dso8424463e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 06:28:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8YWYVjuX5f333d+Dk2mgYYBEnSV0pyTRddsQA7DlTqiQhLPgUBGwDxNFZ1UoXR5Tt2DIrcsUglPKaA@vger.kernel.org
X-Gm-Message-State: AOJu0YxlMp3tgy3qMkix6tEx3UcOU78ucnpVGaUegG4MaDUWkifG1puK
	IkmjI5dF/wfrTdFGD8be1UY0DcI73hDgCGTgal3l/5qxxH7K1+VZ1RMRNplfPaQlJm36uJdC4BX
	bWAkwnJct/8jNaJ05PG32DmvkhfhvcAE=
X-Received: by 2002:a05:6512:3ba8:b0:5a8:f2ff:f501 with SMTP id
 2adb3069b0e04-5aa323d499fmr3686921e87.28.1779715735774; Mon, 25 May 2026
 06:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-gpio-shared-deadlock-v1-0-76bca088f8c0@oss.qualcomm.com> <20260522-gpio-shared-deadlock-v1-2-76bca088f8c0@oss.qualcomm.com>
In-Reply-To: <20260522-gpio-shared-deadlock-v1-2-76bca088f8c0@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 15:28:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLm7xo1ZTwSGrceDVutrfUW5S3N3k7iiVrW5JD8CW+EQFg@mail.gmail.com>
X-Gm-Features: AVHnY4L2zPUQMBqwQjRbkB_rb5rupuND4-b_bwtXJlPJ8QtwV_yNmX3RxbbWKuc
Message-ID: <CAD++jLm7xo1ZTwSGrceDVutrfUW5S3N3k7iiVrW5JD8CW+EQFg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: shared: fix lockdep false positive by removing
 unneeded lock
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37467-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4698F5CB2DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 11:12=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> By the time gpio_device_teardown_shared() is called, the parent device
> is gone from the global list of GPIO devices and all outstanding SRCU
> read-side critical sections have completed. That means that no
> concurrent gpio_find_and_request() can call
> gpio_shared_add_proxy_lookup() for this device at this time. There's
> also no risk of the parent device being re-bound to the driver before
> the unbinding completes (including the child devices).
>
> Lockdep produces a false-positive report about a possible circular
> dependency as it doesn't know the ordering guarantee. Not taking the
> ref->lock in gpio_device_teardown_shared() silences it and is safe to do.
>
> Cc: stable@vger.kernel.org
> Fixes: ea513dd3c066 ("gpio: shared: make locking more fine-grained")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


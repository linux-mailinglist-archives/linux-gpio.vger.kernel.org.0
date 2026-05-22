Return-Path: <linux-gpio+bounces-37363-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHITEChNEGq5VwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37363-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 14:33:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A9A5B40DF
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 14:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6306230530F1
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9008037C0EB;
	Fri, 22 May 2026 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nd68oOCF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3585C379998
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 12:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452305; cv=none; b=pUQCO/4LtJwPp20v07VDDU1D1FYaEiI4VoYYAcJAmgZorZV/ad2ErrNw7bQLeNHSOQXL2tmfYreLp/7Nzwnv+Ae2YILFALMwZLx+qvuTHAhk08etP43wj2D8ibwnLkUzIhkOjLZL/FnM9tKCvEnOrp0phGZoE/Ip80Fm7s/3Nc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452305; c=relaxed/simple;
	bh=sq4J5IGKA4bqp64BzpIOHpzuHNrtcjtX90R6oU3nEp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6i1Rsy6pWp7KSh/2tkWByxKhV8OoRgOtc5q0l+PKY4XZtQnNKU164+P2ozwUjLZHejfn8tF+fhZpY5ZgyybRGtMT1s9jXJ2uyzj88vetzlIsZYDI0KDkkteM8/PN1+YvDbdWXLkThbP8Illl4gzq1qwiM0FO1RZ5fD5l15gvR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nd68oOCF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE661F00A3E
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 12:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779452303;
	bh=iqUQRkajnlNkU9+5FETYuNBrBBEwPzS8xammCQjMaBo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nd68oOCF3A4P/xNzjn+23YFo9aWahWlAADmF85xFYvsQ/yT1bzlr9Aq826sR53VUV
	 oHpRzeg/1MI+9eBXNcTwDkCiNKqEWQo1jPlg5O6klkjXTPyI64xTK/FmkbLVtkkY4/
	 eEbHS/tPiZNP9JHh6kc4GGi+l7RI0XaAve2uRGdw9WeAqHEskvpkTbo3yQhk2zSLap
	 kuVGQgoCGvtHQAPkEaTG5xRITz67nLuyZnX56sHB8/1rKdh1TpvpYtpgUibU8LhJWt
	 4Mb/dCpdCOjaNO0p5kiVxxKLrI0jQoOfp4hg4YlRt3NVEGdjSjwyIyg+YJWBmulJJg
	 KbxjW8GSkNvow==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39380e79936so77074871fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 05:18:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/a4l48sOY6ejlyHzp82XLr7V0dYJYFAoLTytvpla4BYkf/aMt2Bc8Y7qwjzEh5nCYuPHFbmcqHRNhj@vger.kernel.org
X-Gm-Message-State: AOJu0YxKJ1ZE0Le3Rj75W7gfdfYvW3k8HaL7EdVbKu3i/AgkYJj4AW1N
	B6sTtZZPArbBXuTJoZTk+PjyaJjvbb1o9Jq6tGac9POvSSxbSmTMmptUR3D0gGom1NSVkDmk6Wr
	0fUZMGLGa9Im9RfpKTqBc07Mlw9bU+9DVpElRe9l3aQ==
X-Received: by 2002:a05:651c:1991:b0:395:a23c:9238 with SMTP id
 38308e7fff4ca-395d8e07a6fmr11241901fa.31.1779452301705; Fri, 22 May 2026
 05:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-gpio-shared-deadlock-v1-0-76bca088f8c0@oss.qualcomm.com>
In-Reply-To: <20260522-gpio-shared-deadlock-v1-0-76bca088f8c0@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 22 May 2026 14:18:09 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeESukotQ_3-cd49sLEOafKJktxrB_w5eia8V79T0nhKQ@mail.gmail.com>
X-Gm-Features: AVHnY4LENUwNX7TvJcxIa-C_EulbF0iwGMn63tDxwuET1YjOtOOdcL9KBGVoQPY
Message-ID: <CAMRc=MeESukotQ_3-cd49sLEOafKJktxrB_w5eia8V79T0nhKQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: shared: fix locking issues in remove path
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
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
	TAGGED_FROM(0.00)[bounces-37363-lists,linux-gpio=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: A7A9A5B40DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 11:12=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> This fixes two issues observed with shared GPIO management enabled.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Bartosz Golaszewski (2):
>       gpio: shared: fix deadlock on shared proxy's parent removal
>       gpio: shared: fix lockdep false positive by removing unneeded lock
>
>  drivers/gpio/gpiolib-shared.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> ---
> base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
> change-id: 20260521-gpio-shared-deadlock-c9b7697c0030
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>

For the record: it seems to me that sashiko reports under this series
are incorrect. The model seems to confuse the GPIO shared proxy
devices (managing access to the real shared GPIOs) and the GPIO
controller devices exposing shared pins that are the parents of the
former. We never enter the same code paths for both when setting up or
tearing down shared proxies and lookups for them.

Bart


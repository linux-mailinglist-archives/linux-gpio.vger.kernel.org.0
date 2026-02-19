Return-Path: <linux-gpio+bounces-31881-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D3XLkdIl2m2wQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31881-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:28:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 196A916130B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D02CE304605D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA1634CFD6;
	Thu, 19 Feb 2026 17:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXyVL/7C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54DC33F362
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521997; cv=none; b=FFkCE2Wf4AnF3LEb7W8Y+Kx6z54sAfbLUDaBuhWXAFPAWQNCPmB9EoHE9zB/yhisOlx+iNq9pWb4aM8QSHsoIRVXsatYHWLYSFqGu4Mx/MRx+F2+at5vR6qtUTy/dw5wDok76ouHXXw8xSbxEIIevFBZY/hhnWXfGfQ182Awb9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521997; c=relaxed/simple;
	bh=hkBLgDfcmsxoGoxOy2dG8tcL6xLKMNnuJgPy/I2YmEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qil+qowOJnW/8V1An0JNwiVYQRzwK9UpFcVv7UEk4RkZxU5ueuxHLp0NGq1ejjfWcDkoNTboB6cEW9h4znjsRmXcApkds2MfFY+XR3pFZLHUfDNDEtDfL1lPuAsrUbqEochBoqCFViiHkxiy/ci8EABDzS9RQiZZSNN1I4atAbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXyVL/7C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF78C2BCAF
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771521997;
	bh=hkBLgDfcmsxoGoxOy2dG8tcL6xLKMNnuJgPy/I2YmEs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mXyVL/7CObHRy+39i20serQswYKG+gPaLAbqJ+dG7d6ceVRrJ2E+/Eyg8mGp6A81h
	 9dQPLSlO7O7jRn79eh/aXgwvgpFqQC3vb91utlwKLUzsHHtM+onLzo2mK1FiuDK5cl
	 6wBddZEJ7Ge/UZawTW+fWvB6afxhdIFV4CAR/TL2Z2huS3BR8OGmL1W2eBznQPbeRO
	 aFuurfulHdaUy8rpU7/nV7Q85u4HQQu64jdsw16O9MaRhs3Uo/1cAqn9D1K2+fdmzy
	 T9lnH20ubLNMCniRReUKQNHLomVynq3BbYCR+aIp43BZXKHKV1HHWuQ5kN/Gqm2fRO
	 mZPHDpsWSxM6g==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-790b7b3e594so12014297b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:26:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1caRPN5F9BLRu+Ne4amIoNuGFWzcVSO0XC2bZyiAjQXLpZg5lnEuYvsH17AZwq3/g0hUK5QK5GtQL@vger.kernel.org
X-Gm-Message-State: AOJu0YzM7dhEezUZzQE0U873YEl2EH1MrqOQPE3HQqWiFVoL5Wjk/FNC
	KUttMYmGHboq4KiqJUYZpas3gpoNdvZvt1E4TLxHlCaHmA5rjVYt1PXJosnuXf4KZBBiAe26bj5
	mqm5jEkME3gO787jVSltSTLFDCGXx6tg=
X-Received: by 2002:a05:690c:d8b:b0:796:2dfb:4af1 with SMTP id
 00721157ae682-797a0bf3418mr162407517b3.9.1771521996792; Thu, 19 Feb 2026
 09:26:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZarCgDvMUta4Viq@google.com>
In-Reply-To: <aZarCgDvMUta4Viq@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 18:26:25 +0100
X-Gmail-Original-Message-ID: <CAD++jL=tK7w=vpCN9JBOmnqR99cX=rG5QKqqBKyRdztg9kSy1w@mail.gmail.com>
X-Gm-Features: AaiRm52s8d6MY_c8IiEGCgvYopP_yuDcGSptRGQ78vCI3h317pMvDsRFELGBF0I
Message-ID: <CAD++jL=tK7w=vpCN9JBOmnqR99cX=rG5QKqqBKyRdztg9kSy1w@mail.gmail.com>
Subject: Re: [PATCH] gpio: amd-fch: switch to guard() notation
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Tj <tj.iam.tj@proton.me>, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31881-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 196A916130B
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 7:46=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> guard() is more concise and ensures that lock is released at the end of
> the scope.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

That looks right!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


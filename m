Return-Path: <linux-gpio+bounces-39682-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xlK9DciiTmqqRAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39682-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 21:19:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C0D729D66
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 21:19:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QBm6EIgl;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39682-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39682-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37966303C01F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 19:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A201C35A3B9;
	Wed,  8 Jul 2026 19:19:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7D831282F
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 19:19:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783538371; cv=pass; b=AAtGEsiIHeFFFYQcs0diumopN35s374deuHUYfGpB/JtATAq4yu01UbkV+E6wXSEIGtC1eyLVW6r1gJ6+AYN2XWhwunm5K1z5nU4H4LK+UP6OXvAhtM9u95zIIT3TItCJSDMElSCfW5L5t69/gF2OVukSYGRgBaG2k3O+HhNd0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783538371; c=relaxed/simple;
	bh=2cL6bOG2O4om8rYVPB4gTRNQs4thGASvFB4lZxVrLJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYFj0h97MrAkOp5C8nyKTQEvGJgIPtJC5OVUn6e4afK0Er+wI91B1yHaIAx5PSXN4/6ju8MOJBBwse//sZokpc13iPJ/W3/W8AZRN6An1fv74KRMIJuZHHIJtDnQtaskgh3Yw9BjV8esX2kmoh7Z8lihvqie4PRwjsLq8+6ZJ7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBm6EIgl; arc=pass smtp.client-ip=209.85.208.53
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6974a6e54dbso1700671a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 12:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783538368; cv=none;
        d=google.com; s=arc-20260327;
        b=lpweBVBjpTnpN1lvdMhaxNYEFfD29mq+jLtK4PE4y9tfZWRW9CSJ/AzECpcgAsQH3G
         Gp2kW8qN1s2e2vBOSUxS8s/t8gfBv+/Cfo3nUPYFPoLJH7qOYyAcB+BNS8oHQxh24b9U
         dVzmvqXMEnReo+xjwyP9Z4TzV6j674N8kE9rYEnsziEWqii6y/WBNHjU0zKHlRiwR4Ej
         UsOwr1TpzmWtRAIV/a2LKkuSiFr8GTSKrufX6PxMmtjYXuAF1lhuH2B6PBtPShcbWj0q
         EQsYVBZiBgm+Nb1YuP4FnuoZCu/9DOPyWIltCbmz6M2mcYZfcqi3WXMlTvwG7Qu+89Xj
         bFSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ysNoCQ+zmWRVJ2IKOKpvmZsFxBRd+4QOdpweg1uVk0=;
        fh=sPpb+5VbmBGv4qik/y/j3VsZMo13hIDHyEpZNVZS300=;
        b=EiEdYmzzeuoY7Wa5NZAs7Fb0+J9VDw+nEMzUCwGiXA7bCcmeWoJjnaOR8972la2DHK
         UpXkIvdPnW7IwIw3xZ2N3aQ6iCJ3xYEPy9CsU5xXfBWFeVs8v7tjbUaLCH5Qqeu6ndTF
         qKa7PuI9AVqbydlFHooIngAUQ6Rfh3WNLj2A4XkyCpdEeYV22Odpkpco5ZlZpapo03r6
         HVrZ69jVy3JYpcdR1SW+XpHuNLKgc5j44V+6OWLm23DJU5uocqhg5ZGEn3WL9DyU7E1B
         4qcUfweIwpNAArvBkV0G5XLekJLVBF9vASWAf9M5UueN15ZA4MC2v7HaBiveutM6Rfxt
         2WCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783538368; x=1784143168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ysNoCQ+zmWRVJ2IKOKpvmZsFxBRd+4QOdpweg1uVk0=;
        b=QBm6EIgltiFvVhjin1LKuGRWvX+z5ls2zNgnn/RupKdRHJJuLZABYaqSfEgjZUaxJu
         6kxZjtU7lT4ldoTqHkgUdFdFtRT1xKUI0Cc1RUeEvDQwpB/3GUbobOxylSZtw415U7bc
         ZmfK+HpRE1Q7DfRCHT8mxqC2jXC5YkpOKwqO+dft9ZAjNsjSAym3Z0twg45cvrmx/Qth
         evlK/6RGSwy88gbORBrmL6tcw+D915AnjFQkLHmqNS2mRo5PmSY2VROKomVhurjoMKEr
         DTagIQQSNT9Ld77o9Z25pZmFZANGTONIi61UK3okbZnnE66iR8YuUG7TJn4BlmA04t1i
         bJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783538368; x=1784143168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ysNoCQ+zmWRVJ2IKOKpvmZsFxBRd+4QOdpweg1uVk0=;
        b=Kvr0qYBDz+v+tLouz0Kt41R/ELI95hiWWQEoshB4JJwijB5KLnOL/O7N6roITDp7cB
         fPln73YIOAKQ2NEjwFZEsv9kldpoX23uTUS0sAJ228qiSC6xSNWw3ZnzplNitYviYOGM
         cvNwpPNnAscX7QWiMV4ia5CTBXr1+r4Goe0Qj9k1zOavxVpZL67clALR6np1V7Z04RX1
         GV0Ez0gNYkgAjciEBtR/gU9ZXGEMCIkxyZ7FCeoUJEyv1icdBhnNcjzAHbDRdkln/MU2
         HTaJNq5oogWy7sD2I+YK9GzPmWl2vInzSoIA4q9jSeiSOd81frMLoBc1NTuiX8qAM7v6
         I1wQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEgZG2OXXUqx1pHD2ruXhF0QdEHQQiuCPGkqTwmDbZCFkZPzEXLXizfqWgXmagD3SZR5E+lj9w3PvZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzYgNydFmRTJVQPLx6zvL/OprvKHHYZomJLp9UbNTM3Cf3AwPQL
	S5HMLDRNdM9M//je14pwCp7UzA6LQBT+kLnroGbaLv0PTK0/M2YIgXFEakKhyeWzvBWizxM7tlp
	8Dtf43yyWTSy4xndxTyGGcCM9Nd7W7hdcxfMK
X-Gm-Gg: AfdE7cnGyRjP8xY4h3qs1+76zR9nG0xcob/1gRPVmOkJHWngClmzY6I3jX6h7FVVuAv
	haB/TuGv3v+tR6+ZSJmwctG/O4pWtvRXqsPQvtD66Zo692rsMdKwcG+qp8jlshngGBxVVlOijJq
	LLhtDRU50vVpAiGeKLSY8p6AXogPTwqSSML0DTXOqEuVX4EOkI6boxBRIXKV/Z6WPhvEx5wFORS
	deNL3z3FHADGblNmKWnhHpfCRzfqIHH7EDdhUm5CEzfTK34xnX7kaarxefcoPRp8qCZbbvZbYwH
	u4IO/oT2xcFwmEt0Mro6eAqs0dv2cmiLuosEwrgRSCEtINi1nhQfvDBjhz/0rTMH3MEQ7DhjDX0
	pUUiyGYEVIo9OS/o4/WFTKXgnB/A1GkKwdYUU9XRneKbkYnHVtpm9SqLXXen/aoN1PZ3c6AcYui
	uv96Go1rk=
X-Received: by 2002:a05:6402:428e:b0:698:c1f6:7438 with SMTP id
 4fb4d7f45d1cf-69ab44a84c0mr1713195a12.28.1783538368314; Wed, 08 Jul 2026
 12:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707233511.1272686-1-rosenp@gmail.com> <CAMRc=Me3hfzzZq=ZvobyYTnu-Kv32psnsJUbuJ7Y78tKmqinMw@mail.gmail.com>
In-Reply-To: <CAMRc=Me3hfzzZq=ZvobyYTnu-Kv32psnsJUbuJ7Y78tKmqinMw@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 8 Jul 2026 12:19:17 -0700
X-Gm-Features: AVVi8Cdpys3sGmRiE83B9KYbiyXEsPECp9hqzwXxGDe6SZp0Cgd6AnCUAyTBvAQ
Message-ID: <CAKxU2N-Nbe9YcWKw-ps3DY1-_N+Uw0NUJT8KCK6hm7P4oDqaqg@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: convert to noirq suspend/resume to prevent
 interrupt storm on resume
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39682-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81C0D729D66

On Wed, Jul 8, 2026 at 5:11=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Wed, 8 Jul 2026 01:35:11 +0200, Rosen Penev <rosenp@gmail.com> said:
> > The driver uses the legacy .suspend/.resume callbacks, but sets
> > IRQCHIP_MASK_ON_SUSPEND on the irq_chip. During resume, the PM core
> > runs dpm_resume_noirq() first, which calls irq_pm_resume() to unmask
> > interrupts, and only then runs dpm_resume() which invokes the driver's
> > .resume callback to restore GPIO registers (GPIO_IN_POL, GPIO_IO_CONF,
> > mask registers).
> >
> > This ordering means interrupts are unmasked while the hardware is still
> > in its reset state, potentially with incorrect polarities, causing
> > spurious level-triggered interrupts before local IRQs are re-enabled.
> >
> > Convert the driver from legacy .suspend/.resume callbacks to noirq
> > callbacks via dev_pm_ops. The noirq phase runs before resume_device_irq=
s()
> > on resume and after suspend_device_irqs() on suspend, ensuring GPIO
> > registers are restored before interrupts are unmasked.
> >
> > Assisted-by: opencode:big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/gpio/gpio-mvebu.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> > index a556fdb267a9..1df763e60726 100644
> > --- a/drivers/gpio/gpio-mvebu.c
> > +++ b/drivers/gpio/gpio-mvebu.c
> > @@ -979,9 +979,9 @@ static const struct of_device_id mvebu_gpio_of_matc=
h[] =3D {
> >       },
> >  };
> >
> > -static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message=
_t state)
> > +static int mvebu_gpio_suspend(struct device *dev)
>
> Needs __maybe_unused for SET_NOIRQ_SYSTEM_SLEEP_PM_OPS().
I see __maybe_unused and #ifdef for code like this. Which is prefered?
>
> Bart


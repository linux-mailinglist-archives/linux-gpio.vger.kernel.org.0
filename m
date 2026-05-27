Return-Path: <linux-gpio+bounces-37573-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMD/BR/fFmphugcAu9opvQ
	(envelope-from <linux-gpio+bounces-37573-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 14:10:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9CF5E3E0F
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 14:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93BE83042C6C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 12:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263DF3CE4A5;
	Wed, 27 May 2026 12:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5mCvAEx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F633CFF50
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 12:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779883770; cv=none; b=mxeCh3eW31XIa/a0JK2bOZLUlbHeZ2S2sVxXKWRutX1RHm+9qinsjjILnEisI7cK7vnuniWVKJ18uUPO0spsqdd0Rh37+WaDtGPovCONDoBYlcrwAIOOHYanGxbHKdQF6+lRUvdCmx21pC/e27l9UQVFXoqAGijIPKx3ptXMC38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779883770; c=relaxed/simple;
	bh=48xVH2ydHUSzkmkXtFg8FJeaKVTBONbp/dt4isx7Ht4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxiEwzUCrSTY8gwxZ0pggone4/sqD2WUU8cMNYLA2T8aXLYJGrcla7A5pBAGnvxL3frbmLNl+HZO17xnFQhoJ/mJKHKJAI/BUVN3Jw7ocBoehrxEXmB9MDu9J4qozMEGBpfGnYLvI/WqFoz+wtZXs9iyb0QFm7AGxlzjxepWllo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5mCvAEx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AD51F01558
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 12:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779883768;
	bh=FTXkfOnDfFOTWvqRAuPOSVt2uty57HoIgjltwQPQoFU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W5mCvAExioPbWSMpLlS3cvZsX7FL3JLnM+jz3Gk+fGVT7DTto9l83tyjB0duJy551
	 +Anm+McoL+ATRFuUtLadwR1CsMzLdBxCv05X2cIrCGFvYqHE353aq1RNyRJHgVoMzA
	 RsQ++1+GvgUqx5Vv/78rZmdhAidJ3vJwUcKgbNI7DkQzISaU3irxdiif7O53VdJWPH
	 C/Po1imBk6IA1ue96Ey5plTHIjuyoYd9S4HR1cgC/72rTodU/vaav/F/V7lXRCOwbD
	 ZU3AFJ2bZ64+w9/QhItakKgFy5rJ20BOVGols+ecb88EDQC9lE9LypHft95fwjk6iF
	 7K+L4oahe3BAA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a8cb92f26aso12572957e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 05:09:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8n5LvMh9VNdYZsB+Ch3pACDCTnppZitUltaZrO4TWb5ZmKLrJAAB3b53JitGDEghipAM2bSxal4iBO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn91AX/rixDZYCz5dH8BEdD+w2hrnElQKihjrCj9yVmCUD56ri
	axPhdGOskso6lIMB/2NF1wDkitUQrJGWKnrYWyRWiiI2CUZlxR5v4kcZYI56Iy2TBFbAqubuVVD
	q2nh7O0X+MLOAblVZk79xrZJSEDO0jLQ=
X-Received: by 2002:a05:6512:3ca7:b0:5a8:8825:15fc with SMTP id
 2adb3069b0e04-5aa3238ba06mr8164473e87.3.1779883767164; Wed, 27 May 2026
 05:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427134231.531222-1-pshete@nvidia.com>
In-Reply-To: <20260427134231.531222-1-pshete@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 14:09:13 +0200
X-Gmail-Original-Message-ID: <CAD++jLknF3oSMC3=FJ_RK-xwW5p26BcjiG6BGivrjRoqTRrKAQ@mail.gmail.com>
X-Gm-Features: AVHnY4K8_P6is2XDE_AI6bl-s0O8Bgg55Zzg51voovFh3rgPjMzEXLxRnfzrlGk
Message-ID: <CAD++jLknF3oSMC3=FJ_RK-xwW5p26BcjiG6BGivrjRoqTRrKAQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add Tegra238 and Tegra264 pinctrl support
To: pshete@nvidia.com
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, webgeek1234@gmail.com, 
	rosenp@gmail.com, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37573-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CE9CF5E3E0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 27, 2026 at 3:43=E2=80=AFPM <pshete@nvidia.com> wrote:

> From: Prathamesh Shete <pshete@nvidia.com>
>
> Add pinctrl driver support for Tegra238 and Tegra264 along with the
> corresponding device tree binding documentation. Additionally, export
> tegra_pinctrl_probe() to allow the drivers to be built as loadable module=
s.
(...)
> Prathamesh Shete (6):
>   pinctrl: tegra: Export tegra_pinctrl_probe()
>   dt-bindings: pinctrl: Document Tegra238 pin controllers
>   pinctrl: tegra: Add Tegra238 pinmux driver
>   dt-bindings: pinctrl: Document Tegra264 pin controllers
>   pinctrl: tegra: Add Tegra264 pinmux driver

These 5 patches applied to the pinctrl tree.

>   arm64: tegra: Add pinctrl nodes for Tegra264

Please funnel this through the SoC tree.

Sorry for taking so long, trying to use korgalore
and manage to screw things up for myself...

Yours,
Linus Walleij


Return-Path: <linux-gpio+bounces-31882-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD+vMx9Il2m2wQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31882-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:27:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E29001612D4
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F9343006833
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC7434DB4C;
	Thu, 19 Feb 2026 17:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HP9aGihG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3DD34B194
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771522074; cv=none; b=q8mHSVik45kvHkMJcm51ouMqn2r6cmM6AFllfyAGMOThr+SsL1fVbryR3W83Z9j3VuEO4Jwjy0AhfETWLFzzWA2wnx91kimlDguFcnHDTMaOFLgB0jzAYofDSG7JRREvovjeExs4wd5IFyjPC3m8Hg95g7o3scuRMLGPToOl9AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771522074; c=relaxed/simple;
	bh=pjZdu3iMGYegQatEghEpfjyHO0E7peTei/NrUF1U2qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMQL4YUMjeg1Ma46nV9xDdg5gj6+B4e01H4JC/xocYSh8VWPMtmDgvyuocHq0idokwyaI7cPNK3JneK20SPOjRDXl+WvuesUosjzcvb4U3B7od5qcXoirnsk9OtGSQwna3fnPHoZlAaWisdDUAFrPUEhvwfD9T05uwSuH9ul+t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HP9aGihG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A75C2BC87
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771522074;
	bh=pjZdu3iMGYegQatEghEpfjyHO0E7peTei/NrUF1U2qo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HP9aGihGVW30ypRqz92c6sTyBAg3RzU9RkOFsBHiHUl7blPGd4WlTHe9P7J6oI7hG
	 zQy6E6cYfCXPpo//PRQ8M8tc4YjcK4Y+8TMFnwskAD8FmIbWh7EP93mOZrAnySwbRG
	 NBHNxH2tKie9TNqFqiPhOmaTqm3LHASGs8VXxY8BJTHw/yrEQ5Ge76syjquhi21rf+
	 eIcPVZvIOAoJmNQecu7Y/YtrJ6ZB/nNjUNE/eoGVXyhnWjRpF2j2uQuPmI0yCqQldL
	 huLW2sqX7Tv06S2khuHdOuaJIOzhRjghdeFabc7XO8CeL+a9+KZT2oqW/UaizSJUbj
	 MWt1ATOJ1QAzQ==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-797d6f934e2so12065627b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:27:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTI7ltQOrhct5/o9xSRsSUhm0vQSDtc/cFgeehmhIP4kpdoJ+sB5NuIuUf34DAiExTijKQZsEOV69C@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2TjyCi8Xip1l/KFNsJbbqWdmD+248VK8PKCDDPGd6jdb5sHmd
	KzZ+OGHHJThWqBOeN2hM51B1pa+EPxaogItdzJ+dYq/cvL14uNo3ODvOig091QwAQVnU8jlF3X3
	C/fGTDzQa0m9O3MK7OkdxCv2UAH4eNOM=
X-Received: by 2002:a05:690c:389:b0:796:3079:adb with SMTP id
 00721157ae682-797f71c5461mr51393367b3.19.1771522073732; Thu, 19 Feb 2026
 09:27:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZYn_xDxBXn_Ijem@google.com>
In-Reply-To: <aZYn_xDxBXn_Ijem@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 18:27:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLnasBwVgR6LYeMjGEh1L=vcwsrY8o0ffEq4qNE_854LSA@mail.gmail.com>
X-Gm-Features: AaiRm5376XrQnfqlnPI1YrAR3lvO_M6sy9UPF55mdrF_uGBuroNHsaWYxciYvuE
Message-ID: <CAD++jLnasBwVgR6LYeMjGEh1L=vcwsrY8o0ffEq4qNE_854LSA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: barco-p50-gpio: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31882-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E29001612D4
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 9:59=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by p50_gpio_get() is normalized
> to the [0, 1] range.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


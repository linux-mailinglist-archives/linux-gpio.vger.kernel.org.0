Return-Path: <linux-gpio+bounces-33807-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AASmAM3Fu2nEoAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33807-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 10:45:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 990AD2C8F18
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 10:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CED8E300B9F5
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 09:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36171374754;
	Thu, 19 Mar 2026 09:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pjalSGdK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA18335E955
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913545; cv=none; b=Cj+/cRlP3NITPe3DsvlOyNmYfM9TK7mnjl/Om4hqgYz9dTpVAL0tqJV68djfrUwLvqYeLcUvW7RlyBFAwqtPpUXRe2JypKYGO11P3mlQaeZHEv+DfilSgOYLjbuehEGnDbsnziqH8EDbF4RN0eeXzJmK+ARFuODn/kv+GD4DAn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913545; c=relaxed/simple;
	bh=A5CUeXbzNDsG4bG2bM1BXkw3Lu5D4aF/SW0zMwZqnH8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTVNXxf9IPYRrjqltpW616rVvKUP0zbN8/qol8etBynkVBLnz1gr/AxeN9uiMRbFwId9islUY4HWqjIgrsnIdwtVb1dIf5EqxY8DcbPqTB2+Lh12se9nnnxBTz3CNUI6pEA4wGH2wauQ8WN0VHMWpHNV8LHOq9jmaNe16pwo47s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pjalSGdK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD9FC2BCB5
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773913544;
	bh=A5CUeXbzNDsG4bG2bM1BXkw3Lu5D4aF/SW0zMwZqnH8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=pjalSGdKMr4N7wky3voYzOd3faYnC5Wu8FMqbwrVDxMqlPi0fXFWfzB+VW5hK1KkI
	 LHxO+i6UFxxsFk9a6ScPvPC7N8CmY386zGUeIcCc4i7wbcUgP9jQXvf7Elgcvru7Kk
	 tcf0RUiJIIIMSw6Ykpc+s2daMtvF69O3zWlomA4GIdmd6bB6ni5DLzoUHZLlv61BAq
	 /LNhvUuFYAq70IOhAww9mwu9xsH2wJ2WwSygDZMoMAougahxye4WolM+jH2DJSWLGx
	 GvQPbWD1NJRXfYFytrRB2dZ1pTzgpzM28UNtda2Y0GxU6LWzh221vRJMvoWplLKt9w
	 ox5Enbg9AVhyw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a13e1cfa45so782310e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 02:45:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtJ9aG/YtqOh3qYjLxmnKHVeKMgZ3Nnb/EUIzrgjh9d7qKcMsllggHHiDl2py9veAJT3ANXjJdqPPb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4lT9YWxhMhtZtYke9gldzh9IzNvIa2rRfS6zqd8YBhYRL+dwa
	0MWaeA5RdHo+ZY+VF27wC8jAu7NqMkjlSIvIxUv4bLKaRadeVB1a8dllhajRZxCStVAx/tUJc4K
	I0EIMo2vRo46aohIbDZbQ+g38r2AL0kyH16H8eBNl6A==
X-Received: by 2002:ac2:42d9:0:b0:5a1:3b7f:450e with SMTP id
 2adb3069b0e04-5a2796bc7dfmr1804892e87.42.1773913543389; Thu, 19 Mar 2026
 02:45:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Mar 2026 02:45:41 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Mar 2026 02:45:41 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260318-barco-p50-gpio-set-v2-1-c0a4a6416163@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-barco-p50-gpio-set-v2-0-c0a4a6416163@gmail.com> <20260318-barco-p50-gpio-set-v2-1-c0a4a6416163@gmail.com>
Date: Thu, 19 Mar 2026 02:45:41 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfDpC3XRhGo1fU2CH945Q5TEAUR6kX4h+5VNP=Up_Jzmg@mail.gmail.com>
X-Gm-Features: AaiRm50H9IstP72Dtu-QFmyNJxKiayz2wLE_ryRV-S2c3ofWpysDvRQlV9qIB-I
Message-ID: <CAMRc=MfDpC3XRhGo1fU2CH945Q5TEAUR6kX4h+5VNP=Up_Jzmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: barco-p50-gpio: normalize return
 value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Peter Korsgaard <peter.korsgaard@barco.com>, Hans de Goede <hansg@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33807-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 990AD2C8F18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026 03:56:17 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by p50_gpio_get() is normalized
> to the [0, 1] range.
>
> Fixes: 86ef402d805d606a ("gpiolib: sanitize the return value of gpio_chip::get()")
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


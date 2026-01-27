Return-Path: <linux-gpio+bounces-31111-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFMWIJuBeGkzqgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31111-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:12:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C1C9188D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22FE730AF87E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBFA337BAA;
	Tue, 27 Jan 2026 09:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1gEVgw5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB117337BBC
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504828; cv=none; b=ob8MITZJoaQFGYy3dASox6vLt3NhfnY6W57K3p9R0K7afPao6HaJ4vCMnMA5BOfGlupqXuqnVZn3XfZSmwYWqo73JyofT8GzLdRsePXpQNBfirrgjYEfo4fTesH/bAxBsXABmhazt4CjogRlCf1QlVp11PLHiwTwLh8Fetefj8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504828; c=relaxed/simple;
	bh=fLieuZhr8xAJ2JPBb3XKNYfbleeOHWu6FhAseMbpnLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T8VYA+CQwSvuBqltfPTBy89h9DWdkPwP2a8yI2YX+ZSKncN5G4AHonzS9XzppYjn0eqUlMaCiCRmVuy249FD/FMrdrVSJxj7Ps0n2MJXP5DXQbVFg5ThIV1cu6aAacJ1xTxU69xwI6gxcOpkAUB72RsGQ4YA4tbcOAJkkUWKfHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1gEVgw5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6966DC2BCB9
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769504828;
	bh=fLieuZhr8xAJ2JPBb3XKNYfbleeOHWu6FhAseMbpnLI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B1gEVgw52puAy3oHhByIVgK3c2jurWAvH6rNZ2WPTFvrsXQDrk4RPpOxEE2lwOWag
	 /qYYv1rWrll9ggU+fJCLkVHG/Zyucjp+VQN8VBk03yIqHqgTYMM9ZP5rEmSyBoH42s
	 jLLZMD7BavliIbuRjm2niV14FhmBhp64CmNUEYLF9HK6fRImbCoKNcNXL3jbzJkwf2
	 TSEZ9y3xhwov4MX+QXsIsus2Z2qFD80O1T+huIkV/Er2MErckzdGVfsPzoCUtA0v3H
	 SwEbdncnPLagn9FOEUlPUCpBvtm5SvHJxun91iHDNiRmw05gwyXkJwgWryfRFJulT9
	 c2RgfxBCa/JIw==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6495d592c45so4065124d50.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:07:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEgOosYp6M7UG+PEo6Cs//1UYXJpI/7mIT19YKrtC4S+9CUg2B+d4rV3oCwyPi9KKd79AqZiGRWbx6@vger.kernel.org
X-Gm-Message-State: AOJu0YySY98igBmCS7V112cuOd8zTWrttYs0JKWUcPaQ55GyS+SQodNU
	tJaT9iYRtSuTTqPFZ0kE0p0RfYjWXX9a9jf8xagEL8B7XVgaY9WOT+Fd9Ej81QMT2GFxVEl1ok/
	Qw/9Zyr0z3eSsjmYGbbKXSXQAHewMdRg=
X-Received: by 2002:a05:690e:400b:b0:641:f5bc:6961 with SMTP id
 956f58d0204a3-6498fc8da98mr562957d50.77.1769504827749; Tue, 27 Jan 2026
 01:07:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126135627.34191-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260126135627.34191-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:06:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLm4vOv0HQ+xFX0+A19t4c99JJLs2t4SwjQFG0u3KZoUQA@mail.gmail.com>
X-Gm-Features: AZwV_Qi5J4mOfwp4Da7a_UfVLF7B_iEI1kvQ3hbwsjCcEswx8v0JXuuUDgFMKQY
Message-ID: <CAD++jLm4vOv0HQ+xFX0+A19t4c99JJLs2t4SwjQFG0u3KZoUQA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: lpass-lpi: implement .get_direction() for the
 GPIO driver
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abelvesa@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31111-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 18C1C9188D
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 2:56=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> GPIO controller driver should typically implement the .get_direction()
> callback as GPIOLIB internals may try to use it to determine the state
> of a pin. Add it for the LPASS LPI driver.
>
> Reported-by: Abel Vesa <abelvesa@kernel.org>
> Cc: stable@vger.kernel.org
> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver"=
)
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Patch applied for fixes! Thanks for fixing this.

Yours,
Linus Walleij


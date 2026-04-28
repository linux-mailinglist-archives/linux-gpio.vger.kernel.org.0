Return-Path: <linux-gpio+bounces-35666-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FJPNTyD8GlwUQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35666-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:51:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8428481E48
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 086BE311D63D
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 09:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645D03D6CBB;
	Tue, 28 Apr 2026 09:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRmGXFgS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ACA3CFF44
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367534; cv=none; b=M9TFRMMJi9UJ4xak7gybhI8P5Tp+htAco4KxZDZxy5HndaXzNXEnqovzN+9n7m9+PC3dd1zKBlL4vO3YJtw1Mr55Lk024sEh4CE+c5hi4Jxp6+REZBPnmqA/FG/IJK2Wy+jiybnPcxF3eIUccGAeRWYBF6JAtyzxoW480rTNNj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367534; c=relaxed/simple;
	bh=+vV1cq1FE3OBlSf+VVLa+jyUyRoJrEi+/2DabEYx9HY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJUAHwyzghE2UmcC4o6ozFOydhfyoSJggMazCLSnwUEFueuYnNQKv6DYlp5asDyd1Wy1qakX8jj2zr9g/JlkNqH96QoIqeeuQr5KjVrEP+maIjGTcrlRg32VJGtyv2RB45S0vgB4pwqhowN2gs+3CmeozQ18kM08Hq6DPvwyPUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRmGXFgS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDB7C2BCB9
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777367533;
	bh=+vV1cq1FE3OBlSf+VVLa+jyUyRoJrEi+/2DabEYx9HY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IRmGXFgSvCF3Yu7x4FvWQDcCfcF7Uwqf/IZmGl82fj2/WeDWxn/pgObJKt4DQMzpU
	 QKLOgAxg/wzYxmTWB5XpS5M4H6igwy0ANhBCnNK4qLQ6OY8lkfwQJ8JxHbnrBxeO6U
	 FhdgQs0Xf5cx9Hlwuzw0fMk8buKjpCL16Kkl3D7UIDZiLjMhpiTe1v7+WL4PxIRBaO
	 6RtJ9t1uUjUH0p8HzcPbX2Kr0KZEXjew3tzqcbGHR7UwG1KUzwDdS0hf31uPu53ccm
	 z1pgh2L+o1a/9G3lmV2sDmbXiwtSUkfU8Ofen7fKzYF/3/CSrS9AOGtfVQ9cYAdxKu
	 2KsFSmz+NLn8Q==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38dd9f0fdc6so125233851fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 02:12:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8VdIS/yyK1hDx7VeEIgB8++yotX+LjlzwdtcZcEk03e3FyS+PdVj5YiSVAKRNl40HQvzHUGMe65Rbt@vger.kernel.org
X-Gm-Message-State: AOJu0YwIEjjKKKM4be9nTpaVZ/LrsALAfYTZ6X+Ut04r23fmd9O4SZGR
	j4EKPzmvNxYpt1lwI1tlNVIaZTcQhLVkmLA634uPwG1Jpp1fgE9E/JVny5uH7eCJi+Lr0F045n9
	Tsci/NCtvdtrtLsI9Q3xscqoZfgiXUAE=
X-Received: by 2002:a05:651c:f07:b0:38e:8357:c5ae with SMTP id
 38308e7fff4ca-39243147e32mr5888901fa.9.1777367532541; Tue, 28 Apr 2026
 02:12:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com> <20260410-pinctrl-testing-v1-4-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-4-6f708c855867@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:12:00 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Ee=BdLarnwFxM6A0+G9rYV4NJTm2go4p91ArZy-YLDA@mail.gmail.com>
X-Gm-Features: AVHnY4KEPMN0rWMtFgqCeeIxS-mVWtisiUNAOatuMw1puUfVBGi-Zw3AeUL_BJk
Message-ID: <CAD++jL=Ee=BdLarnwFxM6A0+G9rYV4NJTm2go4p91ArZy-YLDA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: realtek: MAINTAINERS: Include pin controller drivers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	Joel Stanley <joel@jms.id.au>, linux-realtek-soc@lists.infradead.org, 
	James Tai <james.tai@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D8428481E48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35666-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Fri, Apr 10, 2026 at 3:05=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> No dedicated maintainers are shown for Realtek SoC pin controllers,
> except pinctrl subsystem maintainer, which means reduced review and
> impression of abandoned drivers.  Pin controller drivers are essential
> part of an SoC, so in case of lack of dedicated entry at least cover it
> by the SoC platform maintainers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I didn't apply this patch since Yu-Chun says it will be applied to
the SoC tree.

Yours,
Linus Walleij


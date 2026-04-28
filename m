Return-Path: <linux-gpio+bounces-35683-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D7UHTuF8GnhUQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35683-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 12:00:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ED0482128
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 12:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92D6B30181B3
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FFF3E1CF6;
	Tue, 28 Apr 2026 10:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDGF7Fvl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0CC3E0C7E
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777370404; cv=none; b=kymUgKrj6G9zKZ4da5+i/YHgRAL1uU2sMoHqgaJ4W/LmN4KQm3+MDPTFG8ilY8xh+mgDRXWzu+t5TstX7zZPr5p87mEzwovNtoLxr1l2bPe67G13RkwzYk/W1tojNnfdPgia5UYhAmrqUJm9B3Yhh9NGvDweiOPLSaHrMRCVoqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777370404; c=relaxed/simple;
	bh=eV6M6yRhEJFUxwo0929BI7hUnlxhsoVowrgkd2fgIe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mq0gdNaremrU1UWk/3JJYhYkhYNzb6G7yHaptoqcMg8b/jrRcg1UzHnHZLnP5FIx0HVfEeTjCLt82Bsvyup6RtKB9BbEUMQ+8OJGGWuB/i1tqSpx/C/Nka3FHRhGAdp8I1ihWysiJ2ql+MAVIx9PCmwFjPOB495TW73cqHR6pZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDGF7Fvl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6C3C2BCF4
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 10:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777370403;
	bh=eV6M6yRhEJFUxwo0929BI7hUnlxhsoVowrgkd2fgIe8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bDGF7FvlbVKCBCbhUsp+6wm2oCGt00AimQmt8qfz8S6BJ4rT8lPf3jg5Sm2zO50lV
	 zgfmzO9RnealgCF7SvHT5T3HhJONZC64FjB8VTrED0xwzy8fXvLUOYs6VEKXeP0w/2
	 tYVZNfxewsTijZuf2qp4dkJ+bKukHULnYVwF48Cq4PtVe9ugj90D7X1OdHLgarcizr
	 Wdhb61vtJVulFvFsqyK3hIebIAY3hTaShjr23x+aRM2I3azzz8mbTrFQNfoJnaEBu1
	 t8/eGy33jM6FGpZ1Vd2zLgDFU/xqp5DUAKHRJQJILOD1xj7cmSMHL4OMNowfVOipYP
	 EiEkZjcPZs+dg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso100584961fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 03:00:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/tjcqAsTS3NKYBjx6RaDCKJGc1Dh9o2TJPKDj9WwiTmqIddzdeXLxLhOZ3/NynrUqO3lglU4WzvHfk@vger.kernel.org
X-Gm-Message-State: AOJu0YwDy3QO0b7H+nJ1VoOh/1ZTLcJshQg9/4YNliXLrm2a+Gjjghku
	oZN3LwK68IQX1L0NBOlGaVIN2LtKuiiOYl0mKXJRSaOmiSvvasv8gp81jlBccORJxPuIQ9OECTJ
	2oJhfOAcN6ciX0cEWRTuZkKc7R35t2wk=
X-Received: by 2002:a2e:b892:0:b0:37f:c5ca:a6d4 with SMTP id
 38308e7fff4ca-39240cd04edmr8597211fa.6.1777370401719; Tue, 28 Apr 2026
 03:00:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-sm8150_gpio-v1-1-e418613a1f48@oss.qualcomm.com>
In-Reply-To: <20260423-sm8150_gpio-v1-1-e418613a1f48@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:59:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLk+Gk2HEF9r0XkUa-GWJo=WvE2ZbY2f8_2W8fyUcMpSMg@mail.gmail.com>
X-Gm-Features: AVHnY4IIxfi17FKTbzqSgC54vZ5B8x19uIQnFGz6qyDv-GPYNLeOgwYhM4y8ZDY
Message-ID: <CAD++jLk+Gk2HEF9r0XkUa-GWJo=WvE2ZbY2f8_2W8fyUcMpSMg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Fix wakeirq map by removing disconnected
 irqs for sm8150
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 10ED0482128
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35683-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Thu, Apr 23, 2026 at 1:51=E2=80=AFPM Navya Malempati
<navya.malempati@oss.qualcomm.com> wrote:

> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>
> PDC interrupts 122-125 were meant for ibi_i3c wakeup but sm8150 do not
> support i3c. GPIOs 39,51,88 and 144 are also connected to different PDC
> pin and already reflected in the wake irq map.
>
> Remove the unsupported wakeup interrupts from the map.
>
> Fixes: 90337380c809 ("pinctrl: qcom: sm8150: Specify PDC map")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

I see there is an ACK from Konrad but the patch needs to address
Dmitry's comments first I think?

Yours,
Linus Walleij


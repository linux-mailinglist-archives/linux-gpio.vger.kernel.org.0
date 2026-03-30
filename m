Return-Path: <linux-gpio+bounces-34388-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLiXDaA0ymnn6QUAu9opvQ
	(envelope-from <linux-gpio+bounces-34388-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:30:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D122A3572B9
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 416B9300789F
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 08:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA693AE19D;
	Mon, 30 Mar 2026 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wka5z5mA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57E3AD531
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859419; cv=none; b=ry5AuPUiE2VNrTkTiLt84GZKJw+yz4fq5xeVX2fjA/ElJZqMuO8jydyFJAOeKx3NoOF45Hv8x+rjl25PVcQ+ZJbi5FR2ZL90eDboOtjth/WB5guYgQ39LUb9omc5s6ywjHO/CuSSZg0dzwEgx12pftScSOAq85gP+SU5RpYdhPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859419; c=relaxed/simple;
	bh=gsBEGNHcqtbt6TEPS3qjYo/9d8yMbnMoE8MR1yPPkE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9jbEx9nfTa6C7qgH0d0cJEot3DhHdgb8QigV7IxpKvDe8hiC25JOkIwIUHoJ5oX5Nvfmopn0z/dgrhDNA7QhjacyjBSyY5/iDhaLjbHcWd4oQA2sbOw0W4e3i4NPuFXB1MlKHs/3c4PEdSJ/R+vXevjuI7xoePByCNqtrC1sZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wka5z5mA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A1BC2BCB3
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774859418;
	bh=gsBEGNHcqtbt6TEPS3qjYo/9d8yMbnMoE8MR1yPPkE0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wka5z5mAbex5oRpHGMSbyhmo6IL6NEsdBEnASwAEy6ef/25JO4rWyz+L34JywT1eA
	 +sFgpYF32oc22/T+EbCXzTeeiOPxRoXm3QaQFGYI199uxIdC07ehV81sejazvuFE+u
	 v4Jt3hZ011OicuG5sJjqJNVSsXpLOdank3vlK2V/4HYIYXElEizXMuBbRDWfC0HTwE
	 Q0Ut+eBpNq45H91ViqupNx0HOq2WsLYYheli3DMCoUecugBW1UR/XgoC/NSgGW9Us+
	 Gz70fxXISvQF6Khm4yHIN8xFQ8p/Ku15PRj02m9WL3nBDAkfhqgAcFPyhXIwUpqRqX
	 hplcn+coRg+Og==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6501d32b04bso923852d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:30:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW85CWIiu8yXKbvbYU1AjdJ8ZY88B7waSVQ2nHTkmNhuAU/SUCD9cWZfPewsZy0WuEkIBMjY7nRGTSP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa28PFduLKcFYIZK/DOYSRCOW14gMIrD4MMUMIFu61tjm6Qhyp
	zERYk8DOz6Io44n4X8vLjMv6UQjuHd6b77TGofoJE8jSryc6fzCA+5UFB3wAE3qmf8/jkQI8uNp
	ylTdgXMt6GciuHX8Tx8BXo/mqDasIkcY=
X-Received: by 2002:a05:690c:93:b0:796:6df5:485a with SMTP id
 00721157ae682-79bde01777bmr118018997b3.39.1774859418160; Mon, 30 Mar 2026
 01:30:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327171240.3222755-1-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260327171240.3222755-1-mukesh.ojha@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 30 Mar 2026 10:30:07 +0200
X-Gmail-Original-Message-ID: <CAD++jLmSiPBhuBxzneP=6VZW4waQgAOTq=W-x-8UEWCaRv34ng@mail.gmail.com>
X-Gm-Features: AQROBzBO1UqMnVAEdNWQczMORO8MkElarvQfd0yRFfv3ScughE9FdwH_S1g0tSY
Message-ID: <CAD++jLmSiPBhuBxzneP=6VZW4waQgAOTq=W-x-8UEWCaRv34ng@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: eliza: Fix interrupt target bit
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34388-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: D122A3572B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 6:13=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:

> The intr_target_bit for Eliza was incorrectly set to 5, which is the
> value used by older Qualcomm SoCs (e.g. SM8250, MSM8996, X1E80100).
> Newer SoCs such as SM8650, SM8750, Milos, and Kaanapali all use
> bit 8 for the interrupt target field in the TLMM interrupt configuration
> register.
>
> Eliza belongs to the newer generation and should use bit 8 to correctly
> route interrupts to the KPSS (Applications Processor). Using the wrong
> bit position means the interrupt target routing is silently misconfigured=
,
> which can result in GPIO interrupts not being delivered to the expected
> processor.
>
> Fix this by aligning Eliza with the correct value used by its peer SoCs.
>
> Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Patch applied.

I dropped the stable tag because that is for backporting to older kernels
and the Eliza support is in current dev... (what will become v7.1).

Yours,
Linus Walleij


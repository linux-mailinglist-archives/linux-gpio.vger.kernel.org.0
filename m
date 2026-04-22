Return-Path: <linux-gpio+bounces-35364-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO8/AFz66GnLSQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35364-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 18:42:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76726448CC6
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 18:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0100E301C91C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 16:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEB737C90B;
	Wed, 22 Apr 2026 16:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMDqvY9E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EAD273D77
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876098; cv=none; b=oJMehpjwSnVgoBv9J+aELijmSjJQBetLzy/B31mp76w7NLR4u3+v5cdCukAdoPAHGmwFji6XXSSjL1pkF5nyYiC7cT/3Q6QB+lDGghMBGbGNa8qGhEOHg3Szz4gj1m9aG09yOoSckYLqBMg57ItI+aB4+WxIAYkPRhT+gboAjsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876098; c=relaxed/simple;
	bh=gnO2AjgEkgtYHycqXrLaVDtlnfMWGrNMSGmGqdHVGRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srJMTTGmkbqnFQ98734marCxumVy8O3d0ajCDwc/CEGz5UB8EyOjarmA50hWCBUzaWGfjmChX2bnKvmBMAsoWQNiqYn47vHkA0BXNjcAwucm4ApWv3biRLq3XLswpwWZX9NKku2Dx0GnjHrNqomYETQPa0P7Xun1Lgwc2jBdkw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMDqvY9E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FB0C2BCAF
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 16:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776876097;
	bh=gnO2AjgEkgtYHycqXrLaVDtlnfMWGrNMSGmGqdHVGRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rMDqvY9EF6TVZiSPeJZlmHFLidzPzTsltmZY+4v8wS9Bghpvlb0epTnjkQ+5aAAcu
	 QHB+A1AoWOFzMAfQ33J97+wtyof1ChlXrNZb97d/mMBewg5F1kAlYF9zXOWcKOyKV2
	 au9BoNQrP+Z7E3KbfUm4OBFJjI2j6qSZNxPlT3lyBErRoFO+X+Ch/+m827yhV+s+UC
	 6h6K7UtcsTkQEQ5gp1F261EQB39RfGPojbSEvzrbfdA3KgGqSgMP+UAAznGt2cQepw
	 slbAeITUwK/3e8D0P5eraZQqWGfabUtkhz7Tga7+dl+okEPFuJkRVxB9rKj+h3FHHg
	 +oeV76cxPmClA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so5603753e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 09:41:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8sUSm5pZJzafCF5qcNtESzNOaCVfwi81O9YWWlmNLhou3oNep5Vkl6AhP14UwavM4ROxIfCyyff67V@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Kt2lLas4VZo/Zy/siJQh+Nncmph1IIiunPzxZJrYJ1WVsjQe
	tzBM1y8AlEBkjE//IbI5hkpSjkvl/lBze0b7QeK87D+swNKg3/xCockP2PsoeAVZPYd1Rp7gn7G
	mFMVuLFxhSMwjng8nI4E5x5YH9uXMYTE=
X-Received: by 2002:a05:6512:10cd:b0:5a3:d032:6554 with SMTP id
 2adb3069b0e04-5a4172cc130mr9899642e87.12.1776876096542; Wed, 22 Apr 2026
 09:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com> <20260413102326.59343-2-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20260413102326.59343-2-dev-josejavier.rodriguez@duagon.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 22 Apr 2026 18:41:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLnj3fsWfr=J=5++OGvVU8n3On76Tzy57i0WxduEvdNisg@mail.gmail.com>
X-Gm-Features: AQROBzCITpLbJ-QV2veJAx_FwyGhq6YwBQITGSgqnJPXr45slYOtz-oiDLimz6M
Message-ID: <CAD++jLnj3fsWfr=J=5++OGvVU8n3On76Tzy57i0WxduEvdNisg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] gpio: mmio: convert accessors to generic
 register descriptors
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: brgl@kernel.org, wbg@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35364-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 76726448CC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 12:24=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:

> Convert the gpio-mmio accessors to use union gpio_chip_reg instead of
> the previous MMIO-only register type.
>
> This allows the same accessors to operate on both MMIO and PMIO
> registers and aligns gpio-mmio with the updated gpio_generic_chip API.
>
> Move the initialization code shared by MMIO and PMIO devices to a new
> function gpio_generic_chip_init_common(), leaving gpio_generic_chip_init(=
)
> with the MMIO-specific initialization.
>
> Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@d=
uagon.com>

This solution looks elegant to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


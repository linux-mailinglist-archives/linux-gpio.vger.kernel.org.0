Return-Path: <linux-gpio+bounces-34240-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNVcJbdIxmmgIAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34240-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 10:07:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0716C341798
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 10:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF3D1301AA48
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 09:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B373D9044;
	Fri, 27 Mar 2026 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e75DEMdy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0059D3DA5B8
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 09:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602142; cv=none; b=pxjkxcL4SCXjjU3Q1zCL0CCWLrZ8x2fAJZsd+BSZMrI1HsMzumOmA2HfhBfnyqsRhbct55Di2w/m8jeZy9RXVBg+N+y3nkEsMnKrvLUUbglWjYaPgNdZBji1BUw+0sgm8fsa/C+KrZle9nwds4lEGkcfEGMIbrJuRB49d2fBFBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602142; c=relaxed/simple;
	bh=zwCE+rTVCf+XNM+cHhnsJlLC2dP5kGLDjeUmqx/mKg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WgEcYYk9FO2gupyT/jf18h1jmgRm4b52E31EngSPITsyIOPrbcrbYId4PtaJM8k+m4t5cMPKu3o+JIO5F9GkidoDxsBgKWJhnoCrrnLBg2Z9FEut620Zffv6wdL4MaVRwiJiqtkJJ2QVHn4oEFSfKgCU9hoWGgQY93+5/9alPgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e75DEMdy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF97CC19424
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 09:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774602141;
	bh=zwCE+rTVCf+XNM+cHhnsJlLC2dP5kGLDjeUmqx/mKg4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e75DEMdyz6EhCr3R7zSnrolvpayzlTmWqAB6qvUnTgNYzdDKSEHSdJKORi9TP8DTF
	 upQraai/6QV/m0/LrhYlItkkpNYR2Mun8vqaCOA5+LlGQ9neTU7pXf2TgxMRAH1kMZ
	 bTBF3tkYUUBnAKwgoBNIxtG0UwMrBbx/hSY7ret0KHSARyUyXHXCAi3jlySjAzM4eJ
	 ZdVE0utHiNmKMqIDP0LziOOd7Ii6DmJQIyS70aeUunOpRIZOc25xzNM/e+0uEyLwJn
	 KEEsinVb/xotOYDV8tuZE57s4UqwFNlzfODg1na993l5k4edyznLHzGOmpZIxhjoFt
	 xV+wpo0WvN2Pg==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79a74765703so17517737b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 02:02:21 -0700 (PDT)
X-Gm-Message-State: AOJu0YzBsgqFQ+tcNKmJvs6gIKBgD1yzsjNyf+KkmdSHRc1eY/k2RVCs
	H7iV2dREaHMpP072ZTHlX4rtvdawSfLw30tXOq33M0KMCE0TbCeNFm6Q6lbynajeMm0n5s7DVoD
	vL9XIiEZZs7BDRZ1GpZNcfMDyboLjwx0=
X-Received: by 2002:a05:690c:38b:b0:79b:dafd:d23 with SMTP id
 00721157ae682-79bddcb8e60mr13490527b3.13.1774602140982; Fri, 27 Mar 2026
 02:02:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323134150.3493980-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260323134150.3493980-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Mar 2026 10:02:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLmOTN_4+bShiUtMGrMaN-aV_6sG0ro-h9Y9DDi7p5c4Mw@mail.gmail.com>
X-Gm-Features: AQROBzDNRTQTsgsVNvgIIeuZ6AVAA_5JSby50ZkJW2Cl8Tf4_Dwi3zBo2r3SK0o
Message-ID: <CAD++jLmOTN_4+bShiUtMGrMaN-aV_6sG0ro-h9Y9DDi7p5c4Mw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: core: Don't use "proxy" headers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-34240-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 0716C341798
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 2:42=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Update header inclusions to follow IWYU (Include What You Use)
> principle.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I think <linux/gpio.h> was included for some historical reason, like
the gpio_to_desc()/desc_to_gpio() being in that file.

But who cares, it isn't anymore, so patch applied!

Yours,
Linus Walleij


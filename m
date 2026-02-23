Return-Path: <linux-gpio+bounces-32021-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDq7N+cinGn4/wMAu9opvQ
	(envelope-from <linux-gpio+bounces-32021-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:50:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 15455174375
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E99630116B1
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 09:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8460A34FF45;
	Mon, 23 Feb 2026 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mR2+jgoh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F1023E33D
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840212; cv=none; b=g39GxRK1m7kTXt/BJ9g2kA4yZb0MTECd2AEKE1uOZjkx6PtoqGfq74c75184DkpcOk7T3jULWuVdi7rY74jG+M0bMsGlXkRuULgbavilP1Ie/Qogl4L+H0C2qxrCCHhlnaIvh0YMJ117iEdGMQZtl2P4PaaFi3aDxXnZ44tVmE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840212; c=relaxed/simple;
	bh=8cXRF5W/hYWCqOM95Uno9v6KwTSXV7YLu4w0QwfroEQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbHuIt1gjkwKuc2Pq/+HUXTI9XhwZG5ApZ0RbWDNrxzZzSuGW1pjki1dTjo9x1WxkYNBY7/xm1o+t/7Jtj5gyFGr3t0kVN1hM7ca1HbX9hQt7mZ/jGoO0gU9jwFbCcLnZZc7UMBF9pvejnOzsz7maD2QTWOhR8nmFmOsMjstQak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mR2+jgoh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E682DC19424
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771840211;
	bh=8cXRF5W/hYWCqOM95Uno9v6KwTSXV7YLu4w0QwfroEQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=mR2+jgohdZ5hcCMWDICDCq7/vylhLStujaCiMD31y/BdCaszaq2mHJnillnV10rz3
	 qLlB963SEpps1kA+8H9rtCuMC+5IY5KVN/4VVT7BMrwEB18r5EybRDxNZBAOjk3Cl7
	 uSzmiBgS2QjOk7mmDP93hjGzb2SjmiF/o3BAhoffGNt8JJr8cLuhqryMf3Jm9qian7
	 S6R//CivhdILeos9wccotF3tQaH16hjsAh97MqUl4Y9daCY/bX2QMT+/mOAPLmacTN
	 b2FzxojrPBQWZk7jmET5rQdRRA/yheE24CSr6shxMxwkT3F2RRPQAHpafuD1ZBB0Yk
	 vWXMejT0Pjejg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-386b4c28ad6so35899971fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 01:50:11 -0800 (PST)
X-Gm-Message-State: AOJu0YxBXUIrJaJyNV7vgoKsf/n+0GDXOabQfQRBi/UbIcAgGWJk6HT+
	nZkx/yIAoJx1d2rltZ20eO2vMZ+jKY1SEDxV9jBiaTcThSu4TYHMuGijKVjfvDiHuU+VdI0ahyz
	4HuUg3O5LH3BDpmUb82AR3nL06bBdmjVRbSR/tSADkg==
X-Received: by 2002:a05:651c:31cb:b0:386:8ea2:ef9 with SMTP id
 38308e7fff4ca-389a5e79498mr23097391fa.38.1771840210603; Mon, 23 Feb 2026
 01:50:10 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Feb 2026 01:50:09 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Feb 2026 01:50:09 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260222-pinctrl-pic32-v1-0-db86248da18d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260222-pinctrl-pic32-v1-0-db86248da18d@redhat.com>
Date: Mon, 23 Feb 2026 01:50:09 -0800
X-Gmail-Original-Message-ID: <CAMRc=MdVmAxPA34dO0mxiOr9DYL0vhbMbCzLc2+sngbO4e9F=Q@mail.gmail.com>
X-Gm-Features: AaiRm53sIyDtPqVxbxtHuv5IxpQU95rV-bWi0x_6Qdapf7jpXgPFhue_U-wH5nA
Message-ID: <CAMRc=MdVmAxPA34dO0mxiOr9DYL0vhbMbCzLc2+sngbO4e9F=Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: pic32: allow driver to be compiled with COMPILE_TEST
To: Brian Masney <bmasney@redhat.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Joshua Henderson <joshua.henderson@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32021-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,checkpatch.pl:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 15455174375
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 00:33:28 +0100, Brian Masney <bmasney@redhat.com> said:
> While migrating a pic32 clk driver off of a legacy API, I mistakenly
> broke one of the drivers, and the issue could have been caught with a
> simple compile test. Now that the dependent patches have been merged
> into Linus's tree via the MIPS tree, we can now enable COMPILE_TEST
> for all of pic32 drivers in this subsystem.
>
> While changes are being made to this driver, let's also fix any
> outstanding checkpatch.pl errors with this driver.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> Brian Masney (3):
>       pinctrl: pic32: change all cases of bare 'unsigned' to 'unsigned int'
>       pinctrl: pic32: use consistent spacing around '+'
>       pinctrl: pic32: allow driver to be compiled with COMPILE_TEST
>
>  drivers/pinctrl/Kconfig         |  2 +-
>  drivers/pinctrl/pinctrl-pic32.c | 42 ++++++++++++++++++++---------------------
>  2 files changed, 22 insertions(+), 22 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260222-pinctrl-pic32-dcb7051a882b
>
> Best regards,
> --
> Brian Masney <bmasney@redhat.com>
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


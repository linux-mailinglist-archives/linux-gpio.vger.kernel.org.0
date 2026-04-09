Return-Path: <linux-gpio+bounces-34923-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL3yGwxg12noNAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34923-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:15:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A823C7994
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D936E301A29A
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 08:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5704A3A16BE;
	Thu,  9 Apr 2026 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GR5jf201"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F0039BFFF
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722469; cv=none; b=qcK6xnjEostDfFQp38FsSTtoYaLZOtbl/cs6Q3Kl2784b6nOLl2TpvMaHeIvAXQU5zl/5F9jhKxFE4nxY3ijhtUmRgkZLKazggrSCsP/J5o2l5kbu7x3ofRxdmgZIj3WjV89ZHCld92nfUe/QaZohFIMgk0Q1IFEpN1PfgHtfRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722469; c=relaxed/simple;
	bh=l4L451JLjnO+mSklWsx37vuoh6tF1gRSkLuuuK82CpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYMi7y8/Ap87TnWzR9q7WD5p3iy6OZv/8Xa/bKn0Vs69h+rfBKQJxsHktbf6eaYR/HQB2/JPWPY0KoRGOe3gvsr+2D2cj//5tGGLHzjFDiFMmw/4pSEe0CoWvFaZ9ezPIGr8yjViaWvpNl9rhJQK0MqrCmWyaGdktF7Q03TIoiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GR5jf201; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA12FC2BCB0
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775722468;
	bh=l4L451JLjnO+mSklWsx37vuoh6tF1gRSkLuuuK82CpY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GR5jf201LLx5xtqUloRnwlhpFjqzaEyt5Fq7qVyVMhnfzNI7BUiaA5kB6iZ8AoXZ8
	 /oqBRHidGcHnUMB0x7gyU/TvhRk6EIgMt19PXso9OZp6iHx7bILhMcTnp4WpeR4xTn
	 RZfENg2wsfVTga5Kj/zA42iGpjjCJ3yKmMUDt7l8Y9dVq1ddq/Ai/pePuDHI/THyn6
	 slNrs7nKNfEnpvfzA+BOIxA+HGJJQWV8OlLPnBa3qwMUwlEQhsivrmK/xkEFHhP0ic
	 FW6VOR9Kcvs4jbivW/hH0fJCQv/ZXFlqag6x8638+M8kz3l6RWZQxIphPtkwrnlJD5
	 qkPGZ1OeMP30g==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6507a7d2eccso615734d50.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:14:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXO1JAIvwLVbBvlxUXkGmxTN3DHBXyAQz+oLD0QarPorVUZRBRMo5xr9moZ60YiM5vGMiXN8v96xcb9@vger.kernel.org
X-Gm-Message-State: AOJu0YwvKii1wn1hCua4+5pV6oNCUdPGMRFKKE4/B+IHPClZnR8b1jyg
	egSTCYr4AS9L6u4uhzkENLliqZ+reFogNhwGZmaj02ItzjeMRLNNxBVsZZKRoapro9P/NpdI6VF
	VupiORJ524zO2djnMyPtAv78TRJU0Q/o=
X-Received: by 2002:a05:690e:1917:b0:650:4936:5975 with SMTP id
 956f58d0204a3-6504936664emr23707563d50.64.1775722468093; Thu, 09 Apr 2026
 01:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:14:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLnCKuAzcTjy-iXpLK6MWA0t8L_gw-KokryKbjhnzAwKrQ@mail.gmail.com>
X-Gm-Features: AQROBzCc5KXo2Xr_pHwF1zlDMYcT8Rpo9yywIK8exDb6sosUOxqjO9mxjrZtVQ8
Message-ID: <CAD++jLnCKuAzcTjy-iXpLK6MWA0t8L_gw-KokryKbjhnzAwKrQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] gpio: add PMIO support to gpio-mmio
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>, 
	William Breathitt Gray <wbg@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34923-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,duagon.com:email]
X-Rspamd-Queue-Id: F3A823C7994
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jose,

thanks for your proposal!!

I'm very happy to see some traction on this. I add WBG to CC because he
wrote so many port-mapped drivers that I think he'll be thrilled to make
use of this as well.

On Tue, Apr 7, 2026 at 8:49=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:

> This series is an RFC for adding port-mapped I/O (PMIO) support to
> gpio-mmio.
(...)
> In particular, feedback would be appreciated on:
> - whether extending gpio_generic_chip_config is the right direction;

Pointed out on the patch that you can just create a
gpio_generic_port_chip_config
or something like that, it's only used at config time (usually locally
in probe()) resulting in a transient stack allocation anyway.

Also that makes it easier to see what's going on.

> - whether introducing a common MMIO/PMIO register descriptor is
>   acceptable;
> - whether PMIO support should instead be implemented differently in
>   gpio-mmio.

The main feedback I have is to use a union between port and
MMIO address instead of a struct with both.

It makes it clear that we only ever use one of them and saves
some memory, especially since we use several instances of
it per generic chip later in the code.

Yours,
Linus Walleij


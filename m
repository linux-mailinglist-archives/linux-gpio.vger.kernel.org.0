Return-Path: <linux-gpio+bounces-36514-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOssBfqSAWpNewEAu9opvQ
	(envelope-from <linux-gpio+bounces-36514-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 10:27:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1600E50A162
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 10:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 27A183063269
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 08:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303613BB9FA;
	Mon, 11 May 2026 08:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hELR4iWm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414863B19C6
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 08:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487585; cv=none; b=f8/brodPqUG5qXbl7j/Q/kLIUSAwdCVIdfPw77F/8Wfov1zpkNMi+QdFh5kr2wUY73GQZ7D46xdDEo7CX8VIghR8dwOPG/XUoSuMN2xo98Bl20Xaa7ilhJVd+j0SALICKtkmOr8NIKquWg4R0bkMVnoBpV50lvsIUH5DtsmVHtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487585; c=relaxed/simple;
	bh=p3Iv7u1mS74X4eXVrV65U6sEl389S3zK8D5FDFBtxP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNmlylploVb0ISBiEjBOw5Wzus5UWt58XmCvMSN7QwycBr8jkxCcBuElLYb8h+QZp7+y8RDoKsj42WyBPpxV1Fc6DaJJbqjBrLFFCXD45GP/8IqxVmocSWuHi+eWmwVu6JE1NJ7frAMYrnnDimxNNI3nUDsLGeqGENCoRc5MLds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hELR4iWm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0B7C2BCF6
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 08:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778487581;
	bh=p3Iv7u1mS74X4eXVrV65U6sEl389S3zK8D5FDFBtxP0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hELR4iWmyI35+bhd3hCM8a3XfaVy6u6f+88jUwXWokSw5hxoSGsRHtOGi4fK1Tg+8
	 m6SahutOdnWe+GAjoIKN1mA4C7/kLRvWz9ZN25H53BRl/SmIZSaRASMKvYwYGVXbgk
	 eWQWJCDIKFoac0cT6KMIgVghLlx3irxU8VL92YgsMnU7XbbAYUi11ZbJ9x5FRkANQs
	 uodEreOWK7MfQAd9LHM8UJIYjyBSZbB79P1qprc//VNfqZ8KdL8K8TgP+XRdqt82eD
	 Y7X9vKQGH2+CO2r4IzFLWmJTqIvrAiJcsq52prGDyynd/DMHLzLD3FULMyu+3KfcbL
	 BE7D4kbgxajJg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a88db610ccso4616229e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 01:19:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9CXwg9IOO6jU+h02SyRzuN2M7NchQ+swZAt/iSLXMliS7Wk/A/U6WPBV5kTeq4bd6aWUqx0A0y7JVb@vger.kernel.org
X-Gm-Message-State: AOJu0YzcmRPFD4NoSQgMau2Ir6pd7Y7RJc3Kut+DyqxBJZtcsVIolMUb
	fLyhgT6O0boOIwT8Dx7SA/alsNigxhwE8pCsasH3ZcuWZWEEjMS2D5sGuvsxlVt9hw+UMsT2d8g
	wy/CbXqWRvHwHoM07yDXreg09ls/bakU=
X-Received: by 2002:a05:6512:3d8a:b0:5a8:a558:63b3 with SMTP id
 2adb3069b0e04-5a8b709b088mr2415707e87.30.1778487580125; Mon, 11 May 2026
 01:19:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <afiNrr4Llm0LWw-5@ninjato> <20260509091208.18346-1-jie.i.li@nokia.com>
 <20260509091208.18346-3-jie.i.li@nokia.com> <af8IB46ST70lXVsk@shikoro> <CAO3NRJg3wPVLgnyd=eD=TkkS5J24ww9WP3nNuiCnCL8=aLEmwQ@mail.gmail.com>
In-Reply-To: <CAO3NRJg3wPVLgnyd=eD=TkkS5J24ww9WP3nNuiCnCL8=aLEmwQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 10:19:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLmcFEcHoCWq_4=7so5gV5Usj45n6qOYj8xrfsgAYufkEw@mail.gmail.com>
X-Gm-Features: AVHnY4Jll4ylz1xxLUtzDo5L7Ll81qPbsTD14KZMmDv1MMUYx5S4--SvKQdsTA8
Message-ID: <CAD++jLmcFEcHoCWq_4=7so5gV5Usj45n6qOYj8xrfsgAYufkEw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] i2c: core: support recovery for single-ended GPIOs
To: =?UTF-8?B?5p2O5p2w?= <lj29312931@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, wsa@kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jie Li <jie.i.li@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1600E50A162
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36514-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 9:25=E2=80=AFAM =E6=9D=8E=E6=9D=B0 <lj29312931@gmai=
l.com> wrote:

> Thanks for the heads-up, Wolfram.
>
> No problem from my side. I can send a v5 rebased on top of
> b47bc7c022dd if Linus prefers, or leave it to be resolved when
> applying since the conflict should be trivial.

Send a v3 based on v7.1-rc1 I'd say.

Bartosz can merge patch 1/2 and offer as an immutable
branch to Wolfram to merge and then Wolfram can queue
2/2 on top of that. This is usually the most bullet proof
merging strategy.

Make sure to put Bartosz on To: with clear intent per
above and he'll probably deal with it.

Yours,
Linus Walleij


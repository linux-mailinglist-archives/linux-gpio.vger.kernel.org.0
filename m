Return-Path: <linux-gpio+bounces-37763-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDwdKoKJHWrAbQkAu9opvQ
	(envelope-from <linux-gpio+bounces-37763-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 15:30:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D32466200D9
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 15:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CF883067711
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 13:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785053A6B8A;
	Mon,  1 Jun 2026 13:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqpaA6so"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B73379C23
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2026 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320283; cv=none; b=LfMrNvIX6M9lJiTPh+fe2LiCTY974xlFtP9Uaeoy5EdtvhWhSec/4bqYf54eFkS0Ur7jhH/qnfy5r+5JOzmAWUgc5CnIrk66bCca5hj+7VDLtiui5bV1JBa7CnSbRcAxy8Rb79YFqOik4JfMiU3VZEVMQ2ykObwqEwLjHesvEaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320283; c=relaxed/simple;
	bh=NZOIyTEW4Hnj+aVgz+HypfZb1dYcBH7MVd+a8GnBEds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZ1VwvLsF85tLQOJvFjsVlhdf5c2jiXDIOlLKWn+2rXpsZDUGuchPRK7AzhlNWzLUzY1uG4DbwB/o5OE+KWcn0g1uBKQjRtVqtXVnkBmoUXPV6xYhypPih/VdDlDwpIL9Y700CiZ+jeuB2xIft5x6nESwfTf4nbJHWJeMOG+KqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqpaA6so; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B22D1F00899
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2026 13:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780320282;
	bh=NZOIyTEW4Hnj+aVgz+HypfZb1dYcBH7MVd+a8GnBEds=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AqpaA6soFqAc8Tof1+7o72Fc6f0j57i4obrLu4DEtban4C4HeDyskrM6iovzsYg0I
	 UU8qfvs/hU8icUsRDSARzYxQOfxlUtvROSHIFZnl21LoVcPqjHx75iFblxsDHwhyLh
	 vRWq9alfVw62q/Wtj03eyUFXcplk6U+V3nnXcGHY6CkLzOwyKz5oUuR6tmFn10XTpj
	 QgAX/He7r7Febs+iu6iBZv7DA3YSRZ/KmboefGz6VCSmeYd7FvRx3zcWO6GVNPYCfC
	 hdqwVKpZi3dKq7aYmbL6n4oh9aVyf8P7wX+Db4Qby43Z6EyFBWt9ncc5wBdNyFHV8Q
	 eklKtj5RSyiyA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa66893e9fso1568495e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 06:24:42 -0700 (PDT)
X-Gm-Message-State: AOJu0YylEmuEUAtMniYo9KZsQ34x1J9qeahlARAKSGozvByNn3BSb2+m
	StrLxPNLh/TXnXkQneQ3cj2s30VEJCXCQJmIXCI02goeqICSfyuEvdCZ+mpHeYbV2tEJ/JZrLET
	Myu0ffQqXqmI8eI2H8+oeyVe+anKBNHM=
X-Received: by 2002:a05:6512:3f27:b0:5aa:6aba:76f8 with SMTP id
 2adb3069b0e04-5aa73ec9772mr2040e87.30.1780320281010; Mon, 01 Jun 2026
 06:24:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ah1lqC1yscn5x5dN@black.igk.intel.com>
In-Reply-To: <ah1lqC1yscn5x5dN@black.igk.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 1 Jun 2026 15:24:28 +0200
X-Gmail-Original-Message-ID: <CAD++jL=U+aYp4GzGhmj78BLrntMKY=qQA7E8nwX2sGvu41dnNA@mail.gmail.com>
X-Gm-Features: AVHnY4JuYXDz5neFHmmplcBdRztQe6mQoYAcG_sCSqmQZVNRafBhFwa4ambirbI
Message-ID: <CAD++jL=U+aYp4GzGhmj78BLrntMKY=qQA7E8nwX2sGvu41dnNA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 7.2-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37763-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Queue-Id: D32466200D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 12:57=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> A tiny development in Intel pin control area. A single patch that has bee=
n in
> Linux Next for a couple of weeks without reported issues. Please, pull.

Pulled in, thanks Andy!

Yours,
Linus Walleij


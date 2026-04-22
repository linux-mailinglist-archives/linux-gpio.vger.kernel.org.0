Return-Path: <linux-gpio+bounces-35365-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP0CHIL66GnLSQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35365-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 18:42:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0DB448CF2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 18:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 063A63027348
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 16:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5116137CD5F;
	Wed, 22 Apr 2026 16:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAYXoP0G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A59273D77
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 16:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876137; cv=none; b=GRKl3RIhbIYreJ7prYvahLv5Epg2MzXQ7RnqXl2XtcFoD+eV01/cIGBJmKo82DI2qSS0J8RmiyokN/bTICYNszMxfPjyYl/hLbyDNwJNPG08Wv4mdgdpwssewk+sEOVlO5rGKGqvnXrjaykrpMMbxxxd6G2lE5QTHb7CO0jQdrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876137; c=relaxed/simple;
	bh=KWWTbxbD7gGhW4WGrsDXjA6KGCffr1WJneerohdhQl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fA9tB3KMv42y9q4imiHEk4yPCtNU0RGAOSRam3wm5SxS6w/btk9XW3Kz9MCiiDBXc44zm9dPMQ58QE1bBMlnTnf54SYe58xRXKJD9iXq2F6JxdhRzyamGBItUjHYwwLUFvUyTJtR4kIKXQtr7NWMMpgasFMXl2tMDwqbrzSTuog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAYXoP0G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67A3C4AF09
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776876136;
	bh=KWWTbxbD7gGhW4WGrsDXjA6KGCffr1WJneerohdhQl0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PAYXoP0GMWW5tu1k8lyvfqwnwjSymNHkTMdou6lECGAWEp8l19/O0QrmDBlG0aB22
	 ByDDxVj9MU4WKLBTzLor9QnOiV2C+8LSGliMILgyac3Gar5m94FAA6XwHelTsBVsJB
	 S/XQyjUGYnjcFHg1P3VzSnZxM8Nj/eBoQgZ3zXRIPU2UyHju50AnAFvUzjQx3hi8B6
	 rl0gTQBE0CFCsjPUWAoL4rSXv+M0DzjvC7pEk8TELl9GZvNcQXPutrz4Vi0ypdnyhR
	 h1v8/TqbeC9iLrSqXiB0Z6rE275dqfydaPkK/zaYPMrshmMEuYn0gXmZorF7sfg9RA
	 ttvhzjYctEukg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so6462707e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 09:42:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9j/xyA+JNnMBeU8OeQ6Yf5A+jpXRe0x4wgdEoP8niVE0QEeUxU/kqjSqX+HQFOaF02e/2Gu5070Hs4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8MYJ3pLhYd70rpcDwDMC40mGaYWEqVQI4r88Trsm7EfjI3zeO
	2ZAGR5op6SkhkgLbRbvsyVDmqd49ziDeG7aLEXetjdjeq5dtzchsC/kpiOZvGqvIii2WsEin91B
	/aU5ORh4ErdAXNrGtiB9diexPaTTW1pE=
X-Received: by 2002:a05:6512:118b:b0:5a2:8568:826a with SMTP id
 2adb3069b0e04-5a4172eece0mr6712692e87.34.1776876135651; Wed, 22 Apr 2026
 09:42:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com> <20260413102326.59343-3-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20260413102326.59343-3-dev-josejavier.rodriguez@duagon.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 22 Apr 2026 18:42:02 +0200
X-Gmail-Original-Message-ID: <CAD++jLk4JOkZkhGJLQ3n602PmAR7r7wJVnZ03k3p19TKTvoiog@mail.gmail.com>
X-Gm-Features: AQROBzBoLEqSrtGzMH4H3wgOgCQrLyQ--9vMAPx9MZHO7PGXMfiQ8sMrv7cxgAw
Message-ID: <CAD++jLk4JOkZkhGJLQ3n602PmAR7r7wJVnZ03k3p19TKTvoiog@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/3] gpio: mmio: add port-mapped read/write callbacks
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: brgl@kernel.org, wbg@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-35365-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: DF0DB448CF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 12:24=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:

> Implement PMIO read and write callbacks for 8-, 16- and 32-bit
> register accesses using the corresponding port I/O helpers.
>
> Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@d=
uagon.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


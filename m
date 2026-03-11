Return-Path: <linux-gpio+bounces-33129-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICdoD6dmsWnsugIAu9opvQ
	(envelope-from <linux-gpio+bounces-33129-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:57:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9723E263F90
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DF2E304226A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 12:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3445B22A1D4;
	Wed, 11 Mar 2026 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7rl74z1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA616280338
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773233824; cv=none; b=OYhZBWLDMpbAUuHhXLDMwvGmThe71n7kctd6i/hzQsPppVveRCj7dwjZX4ulSHHPy9d/6Q4yG+e5yhnE8XJ+GrJdPFB48W/zRLjPfPvP+uL0/PtXzYVjsVsfbo1LgzJga4MlCbOlbiEOigFYpQdt+1NocNy8uIkEq6Gl4Bdt49w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773233824; c=relaxed/simple;
	bh=gTnf+8uCYqVV2sxyuJawFOVZpo55IObZKErFcPla61A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzoYE+CaaF7SSzc4T4DO+56cTiacD+OtZkVUV70d9uBKIjTxQ/Ameq2dpNLzBQDtaJLTJ62c8Imnm2w3TsYah3UgPdrPKaZqb/v9hsGf1LnDNDRAemQbOl5VPimqMLX7WNEiPk4jjGaSXY7n08nzoB3oEj5aDTHv38poAn8z+pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7rl74z1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B17C4CEF7
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773233823;
	bh=gTnf+8uCYqVV2sxyuJawFOVZpo55IObZKErFcPla61A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F7rl74z1HIIvmWnJDjTX0cAXPw2wBeYbTLOYNlwftLHPNzMKwAH6U4elDEJ6kdwR1
	 26ShWSc25+fcBCt5iUTtGyqT3hdAjMaUlybEZiciZyXPaQSpcMJxk0nXPHwjq+pLar
	 zt0a4jIB9Gy1qnkAlre3VLyXAz2dtku68thz5OrsfUr+hpqXr7UfOqr5Aarw2kguWb
	 oRHJKZp2romgIacH1icqw1aZ9Aj4KTkcekw5kU/PQnOynayMzRK9tBHyZyQxIpg1mu
	 4C64jTbr4FMTRHO3z+TlnLP3Y/MO3UnUGuAkGj0rtF7R/FGTiVYwBe2hSH03vWIv5x
	 uSbA821h8EnxA==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79885f4a8ffso115476547b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 05:57:03 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx+IrhP59ye7Cnk8mlPT0OTRfjsYtS82EOfUMJpjMYEss3JtGxi
	8MuhAkzBzHFoSSMZP3gP9S5ekxl02gZNKSkOdy5igK7iN4w9XEtiMXe7NrC/WUzkPKC7sUf8yNE
	5b9BWh0kEzof59j1mFCOwknhW1p8NhnQ=
X-Received: by 2002:a05:690c:e694:20b0:798:980f:66f0 with SMTP id
 00721157ae682-79917f69fd8mr15993927b3.33.1773233823073; Wed, 11 Mar 2026
 05:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310222040.10324-1-rosenp@gmail.com>
In-Reply-To: <20260310222040.10324-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 13:56:51 +0100
X-Gmail-Original-Message-ID: <CAD++jLmR8TZHMbiSBaUmUvPYvP9bPOmr0a=yq4M7FNRFF4EzcQ@mail.gmail.com>
X-Gm-Features: AaiRm52zv2GLSL3fuEtbvEF3rCO8gpgv-QzUHQQI-EAm6dz5UlysklzPKtQCLbw
Message-ID: <CAD++jLmR8TZHMbiSBaUmUvPYvP9bPOmr0a=yq4M7FNRFF4EzcQ@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: ljca: reduce struct allocation
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9723E263F90
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33129-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 11:21=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:

> +       size_t num;

What about naming it num_connect_modes?
(and unsigned in as Sakari says.)

Yours,
Linus Walleij


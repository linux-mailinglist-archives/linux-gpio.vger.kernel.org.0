Return-Path: <linux-gpio+bounces-33477-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH4jEoLMt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33477-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:25:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B09296ED6
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F325A301C125
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF8A386569;
	Mon, 16 Mar 2026 09:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5Vydq0P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F53D378812
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653067; cv=none; b=RlDy3ujUaf/U/zhY3gUQoLmRTMJnuA8j7VJzuwe7jlQAKWr+isr+cvgklqHwiI62XgTVeP9++3wwaSMU9ki5RQWf3ov+9BJXq8cvA0zZBBSzUQ9UQywek/9AyJffhOW4CK8aTCE31/L1O/AGxhHELwWwqizQJbJonwIF4LWvBlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653067; c=relaxed/simple;
	bh=ZnLNDjXRmrLc93v5XVKHHUWhoTftzAtj9fQW7vodS8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2bMwiYWFRU0/JvbCb8c70yKT8W6DZIu+E+kC19Niae/Kc5pmZck1XEl7f+c5PnvMrm2SH+lJkvDDWnL+AfepmmG8Sp8yXtR2mFcofwK1S1PZmHfMn7H1pL9N3M/zTBP5Scr2gk5/aPmwkOjPfSMJVKEIjGud6LQAHOM7+fnrdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5Vydq0P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEE8C4AF0C
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773653066;
	bh=ZnLNDjXRmrLc93v5XVKHHUWhoTftzAtj9fQW7vodS8A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t5Vydq0Pm3Hy5I+94LdlrgUQE2eoX83qsyuW/AMjmRg+8K8bDT88z+3EkXdvgCD8n
	 yglFounJ/THRwBi97Ut6kNnRNIISeVpJs/3cbtg9ezsmalTGlE8vSvZ+nteofYyRAs
	 2Bq+AMV+4ztpA/SO2YTlqedn4ZhndR1v+Te0zJHdchxWEBdGsXttIjTpT6d981pMBR
	 M1o//gJycYkHxwf4WsygMt6EH/XBd7MW7SfeHS31WtxkfpG4zfMyS5snAfEFdpwMDj
	 pVGmgv0YFx2L4za0GrKIof5DFoxUg0fYezYLH2BhKRyIXe32CELBTHXT+73sGWjp3w
	 Ij4CzTzwy8krw==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79a46260385so7706277b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:24:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfECTnICwNIwHFzHIL8It4gYMAJEut54o4zFMR9ZjC6Pfs2F4FnypAHEmn0DGQb3bb2aLJBVJX0pw5@vger.kernel.org
X-Gm-Message-State: AOJu0YwFJtEhPSBxUCpWBpGOhX4eigrN+VD6T9cpwWsPbgA8VIrreE92
	winznjb8o7unuerAp9REvZtLCw5q5l1UGiE1NuuhptGUeWGBFW6b059BwDoEUwTNMBezefEw3R7
	JZyv2Afr5hJHAmuCCCVaxWdVZe02gGGY=
X-Received: by 2002:a05:690c:6604:b0:798:6042:12f8 with SMTP id
 00721157ae682-79a1c1f1ac6mr113568307b3.55.1773653066158; Mon, 16 Mar 2026
 02:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312081805.3020612-1-arnd@kernel.org> <20260312081805.3020612-2-arnd@kernel.org>
In-Reply-To: <20260312081805.3020612-2-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:24:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLkdAAD2SNhxWvSCg0X5h94mP+Fqsb3SpJ7+eTV+o_kERA@mail.gmail.com>
X-Gm-Features: AaiRm52v3ufpixHupvPLX0Q4ClMALFB9XzDqktmpG1RxOvzrgbGN0bx9Ial3b_o
Message-ID: <CAD++jLkdAAD2SNhxWvSCg0X5h94mP+Fqsb3SpJ7+eTV+o_kERA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: defconfig: enable CONFIG_MFD_STMFX instead of PINCTRL_STMFX
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33477-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arndb.de:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D0B09296ED6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 9:18=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> PINCTRL_STMFX now depends on MFD_STMFX instead of selecting it, so
> adapt the defconfig to pick the right one again.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


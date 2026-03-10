Return-Path: <linux-gpio+bounces-32902-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPXzG63jr2nkdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32902-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:26:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 090882485A4
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 495513036AB1
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5AC43D516;
	Tue, 10 Mar 2026 09:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDFAvvpJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A013ECBD5
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134549; cv=none; b=j7CbQhvx0CkQWiveogyXYvyHdNH3t67okvKeXyqHBwS3SEHxSnGonFsmB6AXZ+T/KiIFlFoRrjIbzkhEJ2Lb+F1aRvrCiSjZVKNqnqtN1VdD4LpmOhs+139xq0LnXlyATajsvbsg9xusHh3WX1/jf6kJIVuwXXTIOIFHai7yGE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134549; c=relaxed/simple;
	bh=biE8oWfu0fs6KVWBTvua8scss3toCvxCGRphCbtCVo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxlcf5Ouc6nzQTcEyfWQZffY2UHoOPM7dFnbRm+FSvv1fupYzNOEZdWAWPdAUgiTK6B9AcPRAVyvB9oMTu3XWWnUHuySjYDgEof+3fMfgSsGcBE5SkUosMGumVJPbEHGMJfg6TKTRuM+0bcs+BL9q+YrUqkarE7oxTM3otE15dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDFAvvpJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984BFC2BCB2
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773134548;
	bh=biE8oWfu0fs6KVWBTvua8scss3toCvxCGRphCbtCVo0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lDFAvvpJeusBcJObvL9etBD5GiQAGa4oubMqXifq9iiQ/xZrCGcU22+K7R+oIFls2
	 ILCDvhRLJ/q3Tk3GsCTYKBgBnHz1lw8nLGa5hc08h0QwWusHgzXZ8oF5YwBFuUbBGN
	 3FGr7KGttE8wmgtnndwSsAPVHtgkgcBYvzF1FzmDHF54KGiwAv8oRpEebA7/HB5ioJ
	 GD+1RQW0qDtEb64Z3wjBO+DA0EbQzpRJ40aqz194zaaeJmH7sOqK5v9wpQWG39SlBy
	 Sh06LeA6w6pU2tf9JlBhdSgofXHEcu1xk9RrNK2UAe0VhyKS7RgVa23S1A4k9hehgy
	 wLTo1Z3z4TEuw==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7986d231b3cso157579277b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 02:22:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/syCkwMX7gc/86bVA5fcVRanjAbc1okOakodxU2EoimCe/YBE9xreTaF3ZfEqTVmaA/wxj64kij+h@vger.kernel.org
X-Gm-Message-State: AOJu0YwyLZLmqJ6NE+nnH88QgGVH4GsU2+FtAfEiiJTcNcLqTjvAx/5N
	/ENirIlduIeb+TIB4eQSOmegpT37Jo/cd+RyFhEqLG+DQiulsSlHBZEpA5o0lS148AEixXjHOid
	VHDi0dye06byLlRQt3taTE7XufxF1YMw=
X-Received: by 2002:a05:690c:19:b0:797:bc42:9e35 with SMTP id
 00721157ae682-7990a8726b6mr27082737b3.23.1773134547882; Tue, 10 Mar 2026
 02:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304-topic-sm8x50-spmi-gpio-get-direction-v1-1-a25612161fba@linaro.org>
In-Reply-To: <20260304-topic-sm8x50-spmi-gpio-get-direction-v1-1-a25612161fba@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:22:16 +0100
X-Gmail-Original-Message-ID: <CAD++jLmoiq5prrmeDojbh4kvUW3NMMUvqmqHgEcK8U87zYCYRg@mail.gmail.com>
X-Gm-Features: AaiRm52GRyNcten0FsoXmg_gOCZfXr5I9nWzYXzwWa5V4YOiW98ibmcOLiSyho4
Message-ID: <CAD++jLmoiq5prrmeDojbh4kvUW3NMMUvqmqHgEcK8U87zYCYRg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: implement .get_direction()
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"Ivan T. Ivanov" <iivanov@mm-sol.com>, Rob Herring <robh@kernel.org>, 
	Fenglin Wu <quic_fenglinw@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 090882485A4
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32902-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 6:41=E2=80=AFPM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:

> GPIO controller driver should typically implement the .get_direction()
> callback as GPIOLIB internals may try to use it to determine the state
> of a pin. Since introduction of shared proxy, it prints a warning splat
> when using a shared spmi gpio.
>
> The implementation is not easy because the controller supports enabling
> the input and output logic at the same time, so we aligns on the
> behaviour of the .get() operation and return -EINVAL in other
> situations.
>
> Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller dri=
ver")
> Fixes: d7b5f5cc5eb4 ("pinctrl: qcom: spmi-gpio: Add support for GPIO LV/M=
V subtype")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Patch applied for fixes.

Yours,
Linus Walleij


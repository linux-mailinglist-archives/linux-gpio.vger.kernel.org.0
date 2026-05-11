Return-Path: <linux-gpio+bounces-36616-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DddBEo3AmrmpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36616-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:08:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F244515829
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87CE83054B86
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A7237EFF4;
	Mon, 11 May 2026 20:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gv+grIwc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A19837EFFF
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530094; cv=none; b=gOah6KU4c3O+F16ILGtgxz7yWeJohcRq2vs2lemr4MNSHOvHSYxA76oH4W1PFc+zRU9PYqtt3z1Nbj6qx6n14jrdsD0QxrK3A0r0/rtUIkFAvquoovwi8QoyTCoMSDN/6Q1OGOA2bKIi65uDJGze9yFdBJPXJSfxvlReND/8lK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530094; c=relaxed/simple;
	bh=z3StXrf/Y8Fjgai3Xz4q4aY0xI4soTMVazgB2FR/ohE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLRkcP4Iei/VV8WtgjpjeZPtmudGIn8BdA8gUVvO4kpJkvA1JCGHD9kpKZHMuoX3jL8Q72PVPkH39LHIa7pHZ8kE2VCz98nH+ybVBQaQMOT+UQCxreEPJvwa9hCvQHfuBNcqmbB0hN7fpmaxo++vhxf8K1fNdD264MFymvFaW0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gv+grIwc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D654C2BCB0
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778530094;
	bh=z3StXrf/Y8Fjgai3Xz4q4aY0xI4soTMVazgB2FR/ohE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gv+grIwcYAWb7IA5etvv+BG29OTc7JhMIeRjKF5I7xSfLd28AzyzfamxZhboBvOhY
	 /rCDLabgw/3K7q5b/6tR/tNbNsEp16szdoq/LxM1WLXDRSdmROj0xMLpWGn23Z4IcH
	 9BMYJlcMygCKJE3Drj3nr8ozceSV9ptLd9mlAAqFJ0DvHJ39U0OeaS4Y7EvCo1W+sy
	 mLgnBs74DtyZrPwx5oRJzc9y3cNhsCHGy6+Ip16teQtZqKt0yAZQPRKIO5z+jhLUMn
	 4/79tm41+J/21nPvmoDIpTcGxWTrNDEI4MU9Q6Ea7ocOgZPdI27fys51SvmyVEybWX
	 ivTXd3aeNfS3w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a8c94cefcdso1291087e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:08:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8FCuuQOeNAuKQnJxXc+GZxqMFR0nSdc38L/97z8uOuuRXQW60Az0mb+oheCmpj4fvGlcJCbrZib/Ut@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7x0OXbBFMZxgh8c2lCPDN1/u5Vr19nv4Pg0Q6h4vDmM5rlzkl
	GrZJoOk4VWs4kR1X9gkkzB0h/dFuLs6KE3YkdzfBZujCVjiCyUA3CoEsglkgNWRwNmUUj0dX7U/
	IdQZVr4hliyx0AHVygg8zx2BEPucjAw0=
X-Received: by 2002:a05:6512:2315:b0:5a8:6cab:4871 with SMTP id
 2adb3069b0e04-5a8b719719fmr3007685e87.36.1778530093083; Mon, 11 May 2026
 13:08:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505122444.59265-1-thomas.weber@corscience.com>
In-Reply-To: <20260505122444.59265-1-thomas.weber@corscience.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:08:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLnDS7wKUCe5E4_CboV9Cx_2YVvNjTdv_DWcUZwtyXzb-Q@mail.gmail.com>
X-Gm-Features: AVHnY4K9DQGhTH8-K9veA7Z5ekq3mv0eaQO4ZsuzNNghc1Fad_kcNHQcti5gOhQ
Message-ID: <CAD++jLnDS7wKUCe5E4_CboV9Cx_2YVvNjTdv_DWcUZwtyXzb-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: realtek: Fix typo
To: Thomas Weber <thomas.x.weber@gmail.com>
Cc: Thomas Weber <thomas.weber@corscience.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7F244515829
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36616-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, May 5, 2026 at 2:24=E2=80=AFPM Thomas Weber <thomas.x.weber@gmail.c=
om> wrote:

> STRENGH -> STRENGTH
>
> Signed-off-by: Thomas Weber <thomas.weber@corscience.com>

Patch applied.

Yours,
Linus Walleij


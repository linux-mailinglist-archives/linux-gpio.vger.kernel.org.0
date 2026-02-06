Return-Path: <linux-gpio+bounces-31490-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAInGX3MhWlWGgQAu9opvQ
	(envelope-from <linux-gpio+bounces-31490-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 12:11:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C76FD0DD
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 12:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5595A304C958
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 11:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B47395D8D;
	Fri,  6 Feb 2026 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VnHj3k04"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6489D35F8A3
	for <linux-gpio@vger.kernel.org>; Fri,  6 Feb 2026 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376093; cv=none; b=JBt1cUWe+BG3RKfgc0+3EaPrOvfSa5DOHsgAKttwshiYeVqrJE22A8uPklzWepXEQknPzD9enKj4SciLcIX2Z47/7JiAVzL9tgJ6mDtcPG654q5HD3VYVexFnm7Tzsk8iIL7irKQcWk7LuxINBl6i3ckxFj23qp68lC9alaLSfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376093; c=relaxed/simple;
	bh=2IcXy9Yr1bmgOCBMtWQxIGASEP2Lg6UARZMUEBUBfTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5wSmNm3/GzW6Rlw/Yjl3cpHi1T8ShOlsG5jHTPsyoizKfDFw+XEs6feDra9/IINnib8B0qLgRKA7yq0YOGFWqOH1NvfoKS7emyr9QNfR3k6bTo+esIRkm2N39Vh3gYy3vX/CqaaC2OIStvVBdl0Ydqo9H0oSakhnHzRJ7jiH1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VnHj3k04; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A51DC19425
	for <linux-gpio@vger.kernel.org>; Fri,  6 Feb 2026 11:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770376093;
	bh=2IcXy9Yr1bmgOCBMtWQxIGASEP2Lg6UARZMUEBUBfTQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VnHj3k04plpmByPMUFVHrZ+eswARscLBM8JXPWDQPbCvXKxR7ymvPCla73CtYD0T7
	 CkCJak+5j/KgjdelQqxhPCg4qQI9mpsjAC8lw/UtFvHwJugB9jI7ulYdBlIXzGQ7dW
	 9BZQgepOF5xctOnSwTekCwQRmLw+QQZV+7X+wOlup3QIU/xFgu7HouYMwBRQw1ays6
	 dHpgvgVRYvr/UuV7dhhwhu38KBwt2pREH24tXomxtY+x50sYJt0phdolYE11N14P6G
	 2dWha7JWEu1bSsgS1u8kNkuPFsDF+Ld5gC0X99ccOXngRD0mabLEjZ0Du+wBRHaTc5
	 9BfqJinrqVGfA==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7945838691aso40192747b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Feb 2026 03:08:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUicSjgWxHxKNv8TRQ8zNDWFOHvxO1BRdMoEwdx0cvOTZ55IO0epz7mOAhAkKtGqdlOYsg1uxEVp5K4@vger.kernel.org
X-Gm-Message-State: AOJu0YynVw/+WF5SS2O6EC9hE3lc/okOpSZlvoVMO6Umf+vI5DI7oCIM
	GD1e2Df4sPm5GM0C1d64Tyj06AM2vJNYrL3n+mxHQbNFDaZaUThbJWp0WY3u/54v1Ex2ZRPXLqR
	qEZhDrg+J4HWtDflo6HFuoTemALlW/pc=
X-Received: by 2002:a05:690c:6ac3:b0:794:cde8:f486 with SMTP id
 00721157ae682-7952a78c618mr20998827b3.32.1770376092620; Fri, 06 Feb 2026
 03:08:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-craftsman-battered-3491ff68f462@spud>
In-Reply-To: <20260203-craftsman-battered-3491ff68f462@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Feb 2026 12:08:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLm-ceCdKEjWHqVKzFvbq1J950wZ1Wohk5TnCeCAzY_xQw@mail.gmail.com>
X-Gm-Features: AZwV_QjSGZo1UEVq_Fy4EfL7sUjArnL1OyzgdN-ABSqIc2Y_2O35gXyocgJHDUo
Message-ID: <CAD++jLm-ceCdKEjWHqVKzFvbq1J950wZ1Wohk5TnCeCAzY_xQw@mail.gmail.com>
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux() to
 amlogic-am4 driver
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,amlogic.com,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31490-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: C4C76FD0DD
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 5:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:


> From: Conor Dooley <conor.dooley@microchip.com>
>
> pinconf_generic_dt_node_to_map_pinmux() is not actually a generic
> function, and really belongs in the amlogic-am4 driver. There are three
> reasons why.

Patch subject tweaked and applied!

Yours,
Linus Walleij


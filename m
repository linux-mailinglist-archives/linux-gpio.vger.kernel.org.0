Return-Path: <linux-gpio+bounces-32017-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAFEHfUenGkZ/wMAu9opvQ
	(envelope-from <linux-gpio+bounces-32017-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:33:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC65B173F19
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B408330056C9
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 09:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DDD34E75C;
	Mon, 23 Feb 2026 09:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghPNo3/w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A7C7081A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839155; cv=none; b=aikSZWfMc56cihAXxvy457Pt7B5i1D2VHXBJlJrnGF1oAZwakRCZ9YEQPmc9NCVYWAz7bnT+okEQonVYsSFsHknESOgvGdC08YrjyQyA/JIl3Uw22I9Ce0Lf13NpkypjvtfSrRvLHouK0RfYCFfMitmOS02EqGvJJsoVHrii4ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839155; c=relaxed/simple;
	bh=cngIQbZO92VV5oupWtvE2wurBsxtAghBhTKaVB7S7Ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PnGCuO0X6BJikaxVn9zFtxojRepZSDcZMvhqy1TsmCxkukU7PucY67kRhz0ydNf6kMk0t1+nTZsdsWTYeqQ8mntKeOjIzpt2Q+33JbcrBIYakTlrxkTqPi+s9rOoEJUSAstNPsNXdafcB7phkpXiO7t25ebCb/BTEoeq7ldzYH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghPNo3/w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEF6C116C6
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771839155;
	bh=cngIQbZO92VV5oupWtvE2wurBsxtAghBhTKaVB7S7Ng=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ghPNo3/wLIdV/qYlTYawL22yje1RYPYa+29IxX1xRaZV7tMTU1110ymMWIiiUuJd2
	 HPrdm0T4AnZWJYxqblUQ6EZP82hTuhbMIdxRCTLuUokqipNJPo3pMPv/jrABkOqY+/
	 4jjgBz+T6CLVK08/AqFI7eu6tMLatlzfZLLlsLxsyX/PuL/UPyrT0z0HW8YddUDGSI
	 o1/B7zglNAeZoqnadocBgBCIJ9vKbFUaTSbzmq0j8B1UKDxzRYCcDkKzi60NipHm7L
	 ewhnq2dpoiPdxge7ptX8dTrNJ3eNFNG3sHQkelSsuxYKhhHs9wEBt/bOwVXxaZNw7E
	 UXDtQ9WRgqAhQ==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64937edbc9eso4023709d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 01:32:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtoSFiL3txEJNoVdgLT7nTsOK+ujt6UCMvMuMBZb/Oenxnt3P8y/FzKfUXjfsGC7ZNFA08pE1hzoQr@vger.kernel.org
X-Gm-Message-State: AOJu0YyFXr+a5EaEKuj5zlsSNtAce6zJu6iSDEIntfw8SqC0WavdoD1P
	jHUMbl2fNVdxvdI4QBENXVsDnOvZaEIcKsPhStlHF7xlWtZS5FfJI17shgWDYFKOXn3SEJTJf1a
	7MO+USC2QkkHWexWyBGBsToRxc8tFT2I=
X-Received: by 2002:a53:ac94:0:b0:64a:d479:bfbd with SMTP id
 956f58d0204a3-64c786d48c1mr6733873d50.7.1771839154347; Mon, 23 Feb 2026
 01:32:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207130642.2833312-1-festevam@gmail.com>
In-Reply-To: <20260207130642.2833312-1-festevam@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Feb 2026 10:32:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLmbh1EPp0uS0OmTm9mV5EBFXvc824ZVeOi5G05xfVuerQ@mail.gmail.com>
X-Gm-Features: AaiRm5123L_WFuOuxJnAzHGVVCf8Egt4yfi355MBArKk0mXsl3VBUvpMEMxcSIg
Message-ID: <CAD++jLmbh1EPp0uS0OmTm9mV5EBFXvc824ZVeOi5G05xfVuerQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: rockchip: Add RV1103B compatible
To: Fabio Estevam <festevam@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, jonas@kwiboo.se, 
	Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32017-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nabladev.com:email]
X-Rspamd-Queue-Id: CC65B173F19
X-Rspamd-Action: no action

On Sat, Feb 7, 2026 at 2:06=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:

> From: Fabio Estevam <festevam@nabladev.com>
>
> Document the compatible string for the RV1103B SoC.
>
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>

Patch applied along with 2/2!

Yours,
Linus Walleij


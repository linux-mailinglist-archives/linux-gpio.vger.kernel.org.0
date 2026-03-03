Return-Path: <linux-gpio+bounces-32411-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLOULXOPpmnxRAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32411-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 08:36:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1E01EA3A9
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 08:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB925301327B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2026 07:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826EC342C92;
	Tue,  3 Mar 2026 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0TkiP4M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463961946DA
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772523377; cv=none; b=g/cy05SaGiYBIscSrJDf3HchyJQtSUBFxbmtlFMCidjYCVRx4MxBbEn1SJATsHdcP8pDACX4yBGjxlHeDIaicKwjfongkB97F3XC5z0bQwsmWoT3euqjfKy5ynXFeW4iNcnjWq6zIatm1e8JWsuLVHjRQoXCd1vEWp3euGm8ykI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772523377; c=relaxed/simple;
	bh=ysUU86+hk8VMdhuf7L5Kyqho/5jCGSODvWrJZzPYzqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PnrTz2NjlO1KtFZLaQHf/sCnx0MPvgKNUEfq32pOEY9j0oTvTcM+O3pOdbEixpY7ptDaYXj693BkBOWo2TwnW02XDVe/hFinAx2lrxaww00AC02IlU+/88uGBNhD1jeI1J+GMFbh8RgO1o7bMKh6gbv/9sOA6SZ11QPaisz88os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0TkiP4M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076CCC2BCAF
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772523377;
	bh=ysUU86+hk8VMdhuf7L5Kyqho/5jCGSODvWrJZzPYzqY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y0TkiP4MvyRgjxz9+uwHQ/XKgASMG4o7JhqcTcgE8iACu+ncUs3CD9400ClPKUta7
	 xa/E4bWWVBa8FMQE5/1RF2vVbOUoN6dEeJ3fAl/KTNSVtdqU14pyRBsynx+Ts30e41
	 m8e7Rb0RjHcryOtcNK6bVwVTly5sV09olQ4o6mwZsxxNbNPFRkVKirf19RqKAMZ7lf
	 1dD3MaELzZAdWBCIO8sYm4QaN3WI5yadVO/tQ8rRmyWlBFzyz3S466OlFEKi6x6qCT
	 qaxF3CvODdtRgktG6yssbsEVi9e48gOJSsR/HqldenlpQYWKTzHABaNpMJbL2PG5TO
	 a223GySvp3GdQ==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64c9a398bc7so5077618d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 23:36:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV12ys4mMsJ0VfT+tOXMXtsyfsHHET0FgfAvrwitburw5RUWWfG9fw+W3melGm8Rn0SgXuhjpywsQ34@vger.kernel.org
X-Gm-Message-State: AOJu0YxntnV99z1AieEshKIJWERiJfC8wzvu0vfd2NMIKqQZ+QfXI9YI
	M9GN86U7dq5aNCWPC5Qia9k8ZpEkqEcmjpIpv4Dd8T/dHLPePd7/1lrH3VcU7cUGXYyRaU3dY3D
	n63iWTB1Dwoe9KPn304r0yM28Lo3s/4w=
X-Received: by 2002:a53:ee65:0:b0:649:b4cd:b539 with SMTP id
 956f58d0204a3-64cc20e44c6mr9939462d50.35.1772523376334; Mon, 02 Mar 2026
 23:36:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302202121.197288-1-matthijs@stdin.nl> <20260302202121.197288-6-matthijs@stdin.nl>
In-Reply-To: <20260302202121.197288-6-matthijs@stdin.nl>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Mar 2026 08:36:05 +0100
X-Gmail-Original-Message-ID: <CAD++jLnc_QQTJEXg+Ni4TMUOs1WqyQbxCZEaMS1OM4Gc5L8K6Q@mail.gmail.com>
X-Gm-Features: AaiRm5143h4ct3A_F4_UOrUD05wVxmCxLMdDce85bBMpXerr7LbAQDDVfsP6ozA
Message-ID: <CAD++jLnc_QQTJEXg+Ni4TMUOs1WqyQbxCZEaMS1OM4Gc5L8K6Q@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] gpio: rockchip: Call pinctrl for gpio config
To: Matthijs Kooijman <matthijs@stdin.nl>
Cc: Heiko Stuebner <heiko@sntech.de>, Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5D1E01EA3A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32411-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 9:22=E2=80=AFPM Matthijs Kooijman <matthijs@stdin.nl=
> wrote:

> Pinctrl is responsible for bias settings and possibly other pin config,
> so call gpiochip_generic_config to apply such config values. This might
> also include settings that pinctrl does not support, but then it can
> return ENOTSUPP as appropriate.
>
> Signed-off-by: Matthijs Kooijman <matthijs@stdin.nl>

This patch 2/2 applied to the pinctrl tree.

Yours,
Linus Walleij


Return-Path: <linux-gpio+bounces-33525-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHuwKkkLuGkWYQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33525-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:53:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E27329ACED
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2460D303E3A8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 13:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C6C397E9F;
	Mon, 16 Mar 2026 13:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBU3WEMA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3FA2874FF
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668948; cv=none; b=bPkaOqrHijC5rPwuwjxFLQWNYij/QY1o+TCVx75QrUllMRTWxf6B929J6sSQ8HHWKfo0Ow2bWFaQf0v6uIVPdrbfoMyYG0FrdJOZHiaxFaYnnfL00wOzectfVA8AfM0mrLiMDyAu/qs+C2hr9hJGRVqjHZ592p3ieMwN9z9OugU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668948; c=relaxed/simple;
	bh=4cvdXFvlQulifAsDCud34sW/nfnMYNnh593LHQBbdnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNilyIwQMtck9RB8wRSzTo7ntRf6yww1SB+phaiszGHfkoL1pl8Y3uwnA17y7rXi4bKJEyuUUPlqVe6eHEd/7rnTMDpqHrXMFfjD5toeYEM3+S75Ec+FCt6Im6LJwY0CodLnNStCi2MsuX5yrCVY2lu6kdPkpB6sz2jfWi/vpCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBU3WEMA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3A4C2BCB5
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773668948;
	bh=4cvdXFvlQulifAsDCud34sW/nfnMYNnh593LHQBbdnc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sBU3WEMARYeFtfEE+AlhwSnUkJ5EJRMbtuSCokihQMPFtL4fOF1DQjLFBV7tLaFeb
	 T+g8TOMDoyDOnotauBZotffVGvqew2uOC+8j0NVmfJBG3aonXu8u7ekMQVmMVW6JMf
	 Q7TQZ9EomgF9UjZy4MeCmn66upcwMUAFgbNtvwsJRC/ixvV7dPy6bT/rykRI0npXbP
	 DUyqzqj1/YZy+iGiYKlY96c+zFx8dKyxU+sXUSpSbzKgEaUIu6Ef+Dye8qbYw9eLVV
	 ZId0lXrNkj/ideXPMXdj0oeU5bswNtuIIqXFRJYE37njzQsMp4WLNW/i76DlVt94ZD
	 AUec0a/UFF5sQ==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79853c0f5b9so33967097b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 06:49:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhCo911UEY47ZkQvCvxaWvIDQr6u3UJZGIygdHlTL5bUVENuyuUCEolH/gi9dHR/hQC4h+3VH41iHM@vger.kernel.org
X-Gm-Message-State: AOJu0YzkV27+PmsYgkjA53ntoP1CZ92mBvZjFPiYz6F8pWMM1H457naU
	xW04a4W9KxOnWQX14DG+ti5v1pY441rzInvDb10Gv8m9Y3PEz7USfH+Z15mx82ZRnyfjw+U7cvc
	CsA/wWfgVi5dCGzjPauuApiI4+rhjRWY=
X-Received: by 2002:a05:690c:7084:b0:795:294c:fd31 with SMTP id
 00721157ae682-79a1c1a7751mr128404507b3.38.1773668947880; Mon, 16 Mar 2026
 06:49:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312113040.68189-1-eleanor.lin@realtek.com> <20260312113040.68189-5-eleanor.lin@realtek.com>
In-Reply-To: <20260312113040.68189-5-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 14:48:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLkGGSh=9GJ--=6VqMmKxDD+VRepHh2+yYD0hx7o4WJu5g@mail.gmail.com>
X-Gm-Features: AaiRm53uWyqF9u3u5P6iIbQiRhn7ExWcjXBra8ph9HHpONePx6dshNEP9l450Ks
Message-ID: <CAD++jLkGGSh=9GJ--=6VqMmKxDD+VRepHh2+yYD0hx7o4WJu5g@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: pinctrl: realtek: Add RTD1625 pinctrl binding
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, bartosz.golaszewski@oss.qualcomm.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33525-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,realtek.com:email]
X-Rspamd-Queue-Id: 4E27329ACED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 12:30=E2=80=AFPM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:

> From: Tzuyi Chang <tychang@realtek.com>
>
> Add device tree bindings for RTD1625.
>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v3:
> - Changed slew-rate to use valid numbers.
> - Revert realtek,pulse-width-adjust to realtek,duty-cycle.
> - Fixed example values from hexadecimal to decimal format.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


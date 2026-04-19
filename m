Return-Path: <linux-gpio+bounces-35235-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJrjJKs45WmcfgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35235-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 22:18:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6C54256EF
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 22:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE7FF302529F
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 20:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E664430B53A;
	Sun, 19 Apr 2026 20:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0yWmB1R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B983081BE
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 20:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776629848; cv=none; b=FNssI/wwIQCZQiS7nW3ARhjRKx2pQGwIPIwr0uCsjqbNHPnO2o7RdZv4gyQjwWj4pqB0HVoF47YuGyqd+oUBS0FOx3ZZfXSs1t4Zb/vBNR3wGU6Ab37pGytc1g3H254totHkL7PN1BtR5Aq5mD+ObknIc2llRp9yXwrnGESWWuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776629848; c=relaxed/simple;
	bh=vGJo+SaxSWs6hFGmVYpOqq0e1ET6Hp1Iu418S3/2SA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pb0urwNfoRPBDdmr0i2APiRR/pHVd8X17L3eZxUtUKfyhaXmutERwNl2mKYibbxvBeh3EhBWlvmzVzKwIgYiNdHHO2OgqG86n+dpm++Kss16kGAlBYMnU9cY0MyVXg3YUYF9o0B/d0jsXrBaGt7k3LwqYEb7NOhTIjA+1CkjDnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0yWmB1R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2CEC2BCB9
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 20:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776629848;
	bh=vGJo+SaxSWs6hFGmVYpOqq0e1ET6Hp1Iu418S3/2SA8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k0yWmB1RLhR1+Q7pN5Cygcj8z09ZnEo9Y7O87M/ZnpbQ4VnDemT1kjjdmP0Yrj8we
	 TxWPDHxxy4Sb55p18W2w86OtRQX0KpqVLiBxZGTli3nDqZ6m1Vp6B2pXxiuY6mRliU
	 5NQ80g2PFrbpJ8wrpkHHj60q9h/Tk8kbYQTq5TbYuAHVa+pznhWNlibv7zhmh1VKgV
	 6uvaZf3FsTR6w27GkvNE8RhoeWbdwOW9vWM31nuOMWo5q0oU4sCOlpVxiyewykhXfc
	 N4d7L0H023hQ2BsSaFx5GdR9M5ZVU3DB81uVRPJzkPI6LSw5+WFroCG8WVolUbGPaJ
	 +S+pQiE3u0dPw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3870778358aso16442931fa.1
        for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 13:17:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/oEHDllSuTpuyXh9f7qOFf9razXS6nuqmWBl8rG42z6U0JXtCtSg1m6NFrVjFSrt6tPnofeoz7kq2c@vger.kernel.org
X-Gm-Message-State: AOJu0YyvMHe4ON7lJ6d/pGyvUAqJzyQZOgXDj2o8ylbNLNgoNvQzbBKu
	wEwDxderOele97uHTQ21s5grcvE18cx/isXKyvE/fUUaEJHcpReeFG/JYEAKE31YIL2MEFEitPf
	jzp1GOSbezkIPzfBhapr0BX7H2NM6UII=
X-Received: by 2002:a05:6512:158c:b0:5a4:4ea:9982 with SMTP id
 2adb3069b0e04-5a4172bcc5cmr2945049e87.8.1776629847092; Sun, 19 Apr 2026
 13:17:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com> <20260411-waveshare-dsi-touch-v2-17-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-17-75cdbeac5156@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 22:17:15 +0200
X-Gmail-Original-Message-ID: <CAD++jLkNa2zQCuwtfTE1yoe_UC2KWmOE_PinnGuwib6uW-osdQ@mail.gmail.com>
X-Gm-Features: AQROBzCQnwRSISZoWKgQ3HtyJ1lLaRQ_hELeZOJi2QkBaCgUhauUnht9TK33V2c
Message-ID: <CAD++jLkNa2zQCuwtfTE1yoe_UC2KWmOE_PinnGuwib6uW-osdQ@mail.gmail.com>
Subject: Re: [PATCH v2 17/21] drm/panel: ilitek-ili9881c: support Waveshare
 7.0" DSI panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Jagan Teki <jagan@edgeble.ai>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35235-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: ED6C54256EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 2:11=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Enable support for Waveshare 7.0" DSI TOUCH-A panel. It requires
> additional voltage regulator, iovcc.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


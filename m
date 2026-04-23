Return-Path: <linux-gpio+bounces-35427-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFmoCniP6mn10gIAu9opvQ
	(envelope-from <linux-gpio+bounces-35427-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 23:30:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDF0457E2A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 23:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35E6030E40AA
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 21:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3263C13F5;
	Thu, 23 Apr 2026 21:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pr5rX5+i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FA93B2FD0
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 21:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776979486; cv=none; b=p2tlqI7EF5qqavRkpDwfl47SoF4TxC1Xfh+jz+SB90M2NO4POS+TQw5yN8+XGis05Er8BnqGM+IIG6jYzIXnE7nA3zzlDWJRBeGZxOXieMSk7O8fBXC2H+1tfFAC5BkM4PfiVkR8O+m6h109U8vzTONrujsFn3SwoSDD0RI/bvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776979486; c=relaxed/simple;
	bh=bwLbQ5NviOj/bY0u6od11N2GNC6P5OodS0ixTy9vUk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FwxoQpJPE91adWKheOXismCmd9H8wjczrRdEO23ErOl9TZPbUV0ucP8kVUPXJN+qb/YVK6CAM7Gqr8tTWXMtKZT5JQbDUkv5bOfOsKLO63jW1IkOEqDyDN3ExGCLhLfdfb2APPC7N6anBxh+hnDg1S3uxkQ1sjQBzQDYZ+I4cBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pr5rX5+i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D042DC2BCC9
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 21:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776979485;
	bh=bwLbQ5NviOj/bY0u6od11N2GNC6P5OodS0ixTy9vUk8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pr5rX5+iSOtoDmywesPolyZqj/RoYZzXZzqAKOCPXaAPVbQy181gcY4KqmWelL3xe
	 iI8OxPQrJC/OTrH/ZLz0rOUiOTVtcX+tgL8fQldFAyifEXq4Ro7X9rCkCPHaEon8lf
	 78I3H6UHjrVSc0vZ/rmfbV584lCxPbmjMUsEw20EYHIC1m11yOmA53E7zZ9iwFFwMY
	 h1y3TQiPQ/Mn6Lkn2GPmkG1BtNNIAudFgaxnIc/Wmh/3c8UYfH/tzhp03vDl1Esv5z
	 JNQTUBvUtjQZhZCzy7NjdstndEvcCFBbiVJ8BrVj/ubjrTdizCo6szD4gaROtGlr3Q
	 7rfjwEOk7fYLQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38ce0ab821cso61588311fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 14:24:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/wI37dWkX1pvxL9mUO5py05kDrleajmsd1r+EOKQkDXKz8uu9zlF9YekPRGCZ0Dfs+Oclo02xR+8pv@vger.kernel.org
X-Gm-Message-State: AOJu0YwBGSymem4XgycGOLNjKj2arKyUKQckAx/38Gnv/LHuKyRUPAV2
	Qjzh5TfE4TuA2vvzZTKI3x/foN2vz9VXp9wzf8IMYYl4lXncCjYM+Bs0cdNnQlIaMziYC0s7lIt
	AavnRauQKOzPPCAROHVLUOuX+L8gj0zY=
X-Received: by 2002:a05:6512:118b:b0:5a2:8568:826a with SMTP id
 2adb3069b0e04-5a4172eece0mr8397088e87.34.1776979484421; Thu, 23 Apr 2026
 14:24:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com> <20260413-waveshare-dsi-touch-v3-17-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-17-3aeb53022c32@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 23 Apr 2026 23:24:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLnsVc3xqKfhuZo08wQFkGrgDiw+OAhTOfUi7vD5ZFY2_g@mail.gmail.com>
X-Gm-Features: AQROBzCz31PGPdHjUDpQGU0MKBOAMjnGwCLXEjwbbDFHz8TqNnaOCqTWhFhlvZ4
Message-ID: <CAD++jLnsVc3xqKfhuZo08wQFkGrgDiw+OAhTOfUi7vD5ZFY2_g@mail.gmail.com>
Subject: Re: [PATCH v3 17/21] drm/panel: ilitek-ili9881c: support Waveshare
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
	Bartosz Golaszewski <brgl@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35427-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9BDF0457E2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 4:06=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Enable support for Waveshare 7.0" DSI TOUCH-A panel. It requires
> additional voltage regulator, iovcc.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


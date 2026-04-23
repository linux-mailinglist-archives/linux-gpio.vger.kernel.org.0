Return-Path: <linux-gpio+bounces-35431-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MzmHaGP6mnK0gIAu9opvQ
	(envelope-from <linux-gpio+bounces-35431-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 23:31:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE4A457E64
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 23:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D68833043AC2
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 21:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1D437C901;
	Thu, 23 Apr 2026 21:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJMpeSbQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEEC32C937
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 21:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776979652; cv=none; b=M5Rk4KQG14wTct3hZO43QS4QcrAtLyG4uL7hm8AdeOPJKCZ7hXPo1pCNwk1+AnescDrKu+3kZXf1BINOEmpjDVSUOmAtl1TsC1h6dNYGBTIkG3MG8NDE6/TTcOk2lw6WBqWcUg86ZFDDI33XOKIiJEHCC8TPgOuIUbAZJVoWmIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776979652; c=relaxed/simple;
	bh=LHGK+gI0n/9OErq8+42i/9GhBphDgJzvi2yvX7jJL5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nakqOJ3aGqJStXXNfh1EVJDLHc0rQww3ZzKzi8eax2Dq93d9s0eAcOnppg0bdVdGhHwY0PUK97Q4OhRmgzjAe8jV0VU/a9HWtZeFlX1FhlEaaBEAaNWlUcuATAjbGce4tkvjN9W54i4/IJF0rN6P3oRVWbjvazVXQwEf8ejc/zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJMpeSbQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F5AC2BCB9
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 21:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776979651;
	bh=LHGK+gI0n/9OErq8+42i/9GhBphDgJzvi2yvX7jJL5g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HJMpeSbQIM60Q3d53I9Zwep4hwpP5Ebj0iU2PC74N58EP5/6NIVNKKG7GctKJQpnQ
	 orw8/2S/YvWvrXs0+mPtAvvgSiRs4hbftCaKNIom/RpDnEsCDD04XIpjBTCErtKrUz
	 6EoZ0o2E6hSCzfrDQ5rg9YSYidB8h4aUT6tvnKtOq2LGHno9pHOgsKuVpGPUwiw82q
	 ofkhkA3IvfZrwq63MJPIEg3AmiblkTzxP7qUwJjet679saisdrDu9xWiUWvrV8FaQy
	 5VUndRjUC2Al6Om+tKLKavGyq63B8mbboH99/v6ajPWepNQJ4NYYsWhGcsAlou4yY8
	 lfC3EcDPAbJoQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e68e4389cso75809691fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 14:27:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+nPgAgHEyQhIc7EJ42dLqObcV7VVCeh33ZCGRTI/ev/rEtaHrgyLmH+3SAaaudOt/zYlav28B8r6Vf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl8SXdpbCPuTKKNGK9xwlpN/HUQdUblqMHpsm9nXYY+sBVqPtw
	JUM4kX1pDIqfX5+FKTdUNoiNWD6Ofo5ZJ0/OPhxT6CZiig57JWsIFABXCJhdBBxG1qCECPis8cv
	TVW2jDWa5CLvrDoG9ywrLdCF/J9DS6og=
X-Received: by 2002:a05:6512:6d2:b0:5a2:9b44:1cb with SMTP id
 2adb3069b0e04-5a4172c0fabmr8827159e87.2.1776979650648; Thu, 23 Apr 2026
 14:27:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com> <20260413-waveshare-dsi-touch-v3-16-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-16-3aeb53022c32@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 23 Apr 2026 23:27:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLk6Bt1ocd9nbrDPg3tRnKkZdG=otB=CPv6iuY_Que5HcQ@mail.gmail.com>
X-Gm-Features: AQROBzBgvARcF3IK5AHeLBYYiVQtCKareEdSCXulR4gFnM4VD2cDpl4FLI87TaU
Message-ID: <CAD++jLk6Bt1ocd9nbrDPg3tRnKkZdG=otB=CPv6iuY_Que5HcQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/21] drm/panel: jadard-jd9365da-h3: support Waveshare
 720p DSI panels
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
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35431-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org,arduino.cc];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,arduino.cc:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EAE4A457E64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 4:06=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Add configuration for Waveshare 9.0" and 10.1" 720p DSI panels using
> JD9365 controller.
>
> Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


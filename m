Return-Path: <linux-gpio+bounces-34881-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEBzMtoR1mmxAwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34881-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 10:29:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 741673B908B
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 10:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 397943032CEA
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 08:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1633A3812;
	Wed,  8 Apr 2026 08:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcwDZkpm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA503A1E7F
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636845; cv=none; b=AYCWrYJ9eW7MsgQ0vuBn6fzps/72cadFeahqfHl7yaP0n9nH45h6mNadnO8vZGCXg1uFQZEIBVOWz/d7VqD+ejrkiy+k3zj02/Y0soNnLiBnvxhL4w7EFAuFh977B690TUN1/rZIyGjz4FfL65uFYxpOc0uR1arr1VRqeg+3nA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636845; c=relaxed/simple;
	bh=Nh/HgkDdzSl2nd13YnkWx/Pm3GBsXpIS/jjsAxO2JZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPhXVvyVEsakU0fxGmiwpyAVQdqRhts8MC3gaUEDJ83rzhcKbViGS7NpNu6C76eBJhsKCfqCujVPmuBbheah8HVjXmvQh1A1YwOY6cww8N7SCl33/UoGDijgIgIEkXmses+bDX1MffYYiGNOUXlphFXRvXJaM3lit6LvPMMH3Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcwDZkpm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD51BC19424
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775636844;
	bh=Nh/HgkDdzSl2nd13YnkWx/Pm3GBsXpIS/jjsAxO2JZA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LcwDZkpm2MXkNjBMqFo5DXJzgm94Tuojzj5XvJd9cwY2DXDMgCdxOFdN8idqT+oje
	 6ty6QjsFAlpDlJzKrcJph6KNTZFm2pQlBn5dG0gqLFRzI6cnF7BOWCFfvIKSj0l/eo
	 ih16Q5TWM8uQKmbJ8Kpy94Av6+Xrd72Z5MUBuKyxca70LvZQ1IYX8OicKYxlsLjiEC
	 XdpVINSbV+rsEcfb8Cj0wDdGOytZ0hdR70ulTSXNyKd3CPhORwk+7oHwv4wSvdeuAX
	 iZYpdm2BO3F+2cUtupGaK+rq7CMQgQF3qotT/c/KDryj9+hqBJC4qOQeqEiKhz8JNm
	 kHa0FP8Wm8wAA==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79827d28fc4so51579497b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 01:27:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMdPjTMBKIe1/618mj+vviuP4TnV6WxbTbXw5OWlaJTSEtd9P/DXC5uGEaKLd8raKxQ/DJYgK8PLez@vger.kernel.org
X-Gm-Message-State: AOJu0YwD2iXTnntRWio/coyhGLoxeNh9SnU+K/6OZGLjheaRenpBFCes
	VHNl3r2lLrKHGA5NKOtfTYMGP5y+tQAjIXYosJ5BGjxRW3gKiZ0rkR6k+ENAzw5ZfjvyCcRpaJY
	XBpre/DzLubKQ1POF6NXDX9FFpmLJlZY=
X-Received: by 2002:a05:690c:385:b0:79a:2ef2:7f7 with SMTP id
 00721157ae682-7a4d6e21e14mr210763987b3.23.1775636844272; Wed, 08 Apr 2026
 01:27:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com> <20260401-waveshare-dsi-touch-v1-17-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-17-5e9119b5a014@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 10:27:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLnQb02FhQDngY_ZnOeQq-2Naxg4MT38BtQK+2TGFymeDw@mail.gmail.com>
X-Gm-Features: AQROBzDZLZBjPdZdwCQGMrQ2dNUUfDDmI-jmdfj9Sal7q_dMbU4JwTx-3FFyxlc
Message-ID: <CAD++jLnQb02FhQDngY_ZnOeQq-2Naxg4MT38BtQK+2TGFymeDw@mail.gmail.com>
Subject: Re: [PATCH 17/19] drm/panel: add driver for Waveshare 8.8" DSI
 TOUCH-A panel
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34881-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 741673B908B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 9:27=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Add driver for the panel found on Waveshare 8.8" DSI TOUCH-A kit. It
> uses ota7290b IC as a controller.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


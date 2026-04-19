Return-Path: <linux-gpio+bounces-35234-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOEZKXQ45WmqfgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35234-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 22:17:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1088C4256D0
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 22:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04DCA302BBA9
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 20:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB5E309EF2;
	Sun, 19 Apr 2026 20:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEWHcbDm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2612F12AF
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 20:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776629829; cv=none; b=X2Zs0KJC0vUl6nI7uPPXCIK6id2MhBQzXcuWFr/s5L1pkVrRc32LM91VBgPgmFiHQe3nwln152tU2WB8NInUsaqu4r0wn8/IpYWoO4v4fv9wDSY4MCpjecimCk6PMLMnEwHwM99DVuPzu1LAlARkkTttRIMIyG0aVECk7b9bOjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776629829; c=relaxed/simple;
	bh=CP8bkuBKJOFmVGmEVu1l1muELYYVmpgOJntoDr4vk9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+aXPE2DKPEED7B808uptaS9bRmdGjveWi4Vlr0Yv3WB+xClRtJkvG7Of7wzODYBTR9qJxAzOz6KDhYMsiqciQceiea2JGt5VAUVCao8cHXq6Y4rDgsR1M0AEuEL1y9xzd62pROifR5g69oiqI6pFNTyX/u7JtcxLWX8hM6NPfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEWHcbDm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8D3C4AF09
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 20:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776629828;
	bh=CP8bkuBKJOFmVGmEVu1l1muELYYVmpgOJntoDr4vk9Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cEWHcbDm6vKPyyB+UnYS+7FTWWZc4QZGNpZStMMYR1r0QoeMMS9diRSyhiJKVKZHe
	 cU/sCS0cE4N8qlvoibxk3BkEYImb6j132yLJQzIiqQtT20fdNcpg7GovnPtPpq2LIe
	 q+YvVMAZAqAVJNuDSNCGujDttyvAEAhEXrikJm9leb9ZHyQ6qWR3xoVYJsitMZl7qh
	 uvG6YzHmH3+xWwsMQ/dulyaP2chRh11u3vNJtJKzBSBL9ux2H956JHpm3NMmUPcjjk
	 i/XoJ7cXrklZ0B0NjF2eQCZk1VCyLaO3MBI0DLnYkmAkiji5rmJDsh8jmvoLFvFqQH
	 zOmXlgUU4q2Yw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so2630761e87.2
        for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 13:17:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ94tB9psOcVMPWJ/RswqODMiINSPz0ga9RfQZ+IT/eqz6qPxl2cPlz6ZApRfWz5Wa3HsSvFFhAEs/VE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr8q3fACKaTtljqM90uI6j0ME/lepPL1iD0Mm8rjcyHApQpHC4
	a0uj9SL1bgILXm0mj9A1BSPlnwh0tpvvZKMgbVBrNrKBWeuuGpbhbQs/0aL2daMk7hVozgzt+Zu
	GefPbMg/bCAmUJ22rNTrn72xJpFfgTsg=
X-Received: by 2002:a05:6512:32c8:b0:5a2:7b6e:fbb0 with SMTP id
 2adb3069b0e04-5a4172f4fc5mr3763987e87.36.1776629827515; Sun, 19 Apr 2026
 13:17:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com> <20260411-waveshare-dsi-touch-v2-16-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-16-75cdbeac5156@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 22:16:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLk4WdBjSKOxidrmNFaHnKRoCEJ0BZs75tzGaBs_GgcpVQ@mail.gmail.com>
X-Gm-Features: AQROBzD4gh7x6mle0p09cPVW0iDsM4bdaCE_PLixWm3RoYCv64TOfpPLn5u7mzs
Message-ID: <CAD++jLk4WdBjSKOxidrmNFaHnKRoCEJ0BZs75tzGaBs_GgcpVQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/21] drm/panel: jadard-jd9365da-h3: support Waveshare
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
	Bartosz Golaszewski <brgl@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Riccardo Mereu <r.mereu@arduino.cc>
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
	TAGGED_FROM(0.00)[bounces-35234-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,lists.freedesktop.org,vger.kernel.org,arduino.cc];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arduino.cc:email,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 1088C4256D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 2:11=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Add configuration for Waveshare 9.0" and 10.1" 720p DSI panels using
> JD9365 controller.
>
> Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


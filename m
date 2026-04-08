Return-Path: <linux-gpio+bounces-34879-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P8rNTIR1mmxAwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34879-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 10:26:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC6C3B8FD3
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 10:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF61430166DB
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 08:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8D63A2569;
	Wed,  8 Apr 2026 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdISwvAj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF013A1E7F
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636770; cv=none; b=IPFIWvDEnArCT7CVrPDN/RCJrEvbzEDB5+aJrxVuuVvmXemaKnbuhUOHfiQV0Nrz0FLHgJXxxkdOgnjFNCNQWH8a8zbr1Fm31LJ3ybF8zvk/5ye5YWmoiMvVlGrXhZ3eXvv8qljC0tQeYDdWzby4HB7fkEcuZ0ES0vE51baPPps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636770; c=relaxed/simple;
	bh=iHDkuL91kujjlOmKryVg0YeA+Yh7JR24uFyI819LhUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTBxrFdw0wdWkezMLFvHi0MILBH1dNrC94RAhYP+ppTINyhgG3Nm5CDO6BCabgAGqRymdcgSwRVaV5gulpzM2s0sy0M1ozf7JexWRTNR9zL6k8IwMskYyZgJCaIM2QviNxOLaPQ5gBKvndSAqhNU+CKkHXL1OmhMmwWPzghHmAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdISwvAj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381EDC2BCB6
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775636770;
	bh=iHDkuL91kujjlOmKryVg0YeA+Yh7JR24uFyI819LhUE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pdISwvAjl5H9g95BsbfAQadafpuWy1u3Iqzn5Bu0c3f0pbjjXTc6lLQRICPWyyvYZ
	 cKM7Z1SEKsiaX3U48y6sABZ30ZvsIP4WfNmmh6u94vFb7/vi3h/SCf48cmp2TRReZV
	 FW7RkmCyvnOOgLk8ZfeQDesUUnMJ1FiDSs/sieRi9IXKkFCm88MfBbSFIOqd7NAdrf
	 4+3n9MwmbqwfLMKwIHlavaqCOdahysfBw4UN7JhHuM9Eqm3xuCJw+7Rr9fW8meiYZx
	 LlcuO6uZp0EPRPDnQ4c6G2wqgCZMun4Q/vdQTJA65ErTI78ODaBsGPbHNa53DC4hcv
	 ++s9yihfH4aeQ==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79853c0f5b9so94933187b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 01:26:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWD209trpFo26xZMRZakG6EvcHuPIicJK3x7CVG88qO/JV08FVoB0vdwmJT4VoEoylma7UWGCganGVu@vger.kernel.org
X-Gm-Message-State: AOJu0YwNDb1c1a/D5Qvrs7+GM8gpYbZDsECA9AvwBZxqrS4CwzD9UT6u
	/JQWs2mjiiJMhhe0876P+T/PvSPYrswwm8zwTK2EH1oaFNwiRCtWy8GLql6c86topUVuZ+k6QcI
	7uMyRNSqTa4e2Y2Cl8MQrsbLSKlSOVR4=
X-Received: by 2002:a05:690c:c4fa:b0:79a:5fb9:62ad with SMTP id
 00721157ae682-7a4d5d538f6mr186627127b3.43.1775636769579; Wed, 08 Apr 2026
 01:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com> <20260401-waveshare-dsi-touch-v1-16-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-16-5e9119b5a014@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 10:25:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLmO3fW=UkH9Qf=WzdKrUP=Yg+ZmTAuqXXXOWMWAEKS2Kw@mail.gmail.com>
X-Gm-Features: AQROBzBFUPiNlph5L0rEdl7mVBl48sE-GCLaRgA80ltifGgVhotOohWIUiAlQJM
Message-ID: <CAD++jLmO3fW=UkH9Qf=WzdKrUP=Yg+ZmTAuqXXXOWMWAEKS2Kw@mail.gmail.com>
Subject: Re: [PATCH 16/19] drm/panel: add devm_drm_panel_add() helper
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34879-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 8FC6C3B8FD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 9:27=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Add devm_drm_panel_add(), devres-managed version of drm_panel_add().
> It's not uncommon for the panel drivers to use devres functions for most
> of the resources. Provide corresponding replacement for drm_panel_add().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


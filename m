Return-Path: <linux-gpio+bounces-34880-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGZoF7YR1mmxAwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34880-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 10:28:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA813B9055
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 10:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7220830214F7
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 08:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F39C3A3E83;
	Wed,  8 Apr 2026 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntQiLtGr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6193A3A3837
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636823; cv=none; b=BBNlvohi1t4KzDSPD//7tyGOzgbNi+Q2xGefU0n4pDLN8DeFyLk1WLS7DN0HQ/u5CLa9FWsAk3yl/OnJPRC7DeR0qniaTNbCAvgY3yG2XBxF+koeTOnGZyd8RwCTHAX7cOkJ0u87CHISaoYVIF+/m5G7czaMrW1UEt+OfYTe4fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636823; c=relaxed/simple;
	bh=dAv+La3U8Nx7XhasEfBGS7ePrE8r3GYXA+jCkywSwRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zx5kA3VqDgh7dGXV1QZe17DsZrTfLYMSLXOk8JOhJVQ7Py7DtHW/ox+9RC8xRzrHwEMPbq2+4xcoEmJdDTFBZ60Y36vhZQOWGNcKCDyf1LxvRRlsWXW5uwy3cgGNee4qlkEk1aJMLYHhBDTaYtYKI4IJqW7AYfev6DN75NjY8Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ntQiLtGr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36841C2BCAF
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775636823;
	bh=dAv+La3U8Nx7XhasEfBGS7ePrE8r3GYXA+jCkywSwRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ntQiLtGrqe75QaxaTjlLuIXUQ5w/YPlxE50wIJaVITYqYOK/uu8leefTE6fv3S0k/
	 a9CfrcK3ThgRtVQ77ZEyzI2deZDSr9ZboU70AVDO6vbk8bpPvRBblhOT9yUs7kuT81
	 j2R0y8nDYTF4Pn1mqEwGJu7lHejyJbM1lVDre5TYqz4QZrtJa99dwwjS5qMmyyULlq
	 vZ24nWKGm4VU6U1wzsYMB/GZq8XpSS95P25Re6QTg0g+C62cbiCimpPiYtH5LBMJRj
	 MEH5StlIOA6TsGhtHDa7cnbYejkmdDOVWYIylPyCCtuOWs9NmIJ1jPe5kr9DpFTBCf
	 5HgwMdA7b83XA==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7a469383e0bso41796487b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 01:27:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTJT3jciaetirHZTPVaSA+b2siEpftlMs3tg6xWWtPKNDHQKoK4duf9Hh6tLJSu1RbX4V1cOzDi/3f@vger.kernel.org
X-Gm-Message-State: AOJu0YzceJo6zIVvTJWkbdJQt+WkijUhBO2hByFN+k55GRNA3LKtG5Jq
	uIPIG7jcQhQ4Rh4GOY+y0lMiJBkzHz3plaMo2jGKGAYFyh7qtcKWyxtNMAKhWNixyYBq5IPYbEn
	GQWSc0SEb4oEYkOoPQoMmN+pvsuG5gx4=
X-Received: by 2002:a05:690c:6610:b0:79d:4f01:5bc1 with SMTP id
 00721157ae682-7a4d84c32a6mr196936127b3.31.1775636822459; Wed, 08 Apr 2026
 01:27:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com> <20260401-waveshare-dsi-touch-v1-15-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-15-5e9119b5a014@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 10:26:51 +0200
X-Gmail-Original-Message-ID: <CAD++jL=DmZc-+n4z57QzirGj-S=UBqHKVUkV2dUkQp8HjXA33A@mail.gmail.com>
X-Gm-Features: AQROBzAl5SihlBoUxkuLl6r0BxYNCbci2S_noIkx70TcWl8cgQaobuFx_PSi9DY
Message-ID: <CAD++jL=DmZc-+n4z57QzirGj-S=UBqHKVUkV2dUkQp8HjXA33A@mail.gmail.com>
Subject: Re: [PATCH 15/19] drm/panel: ilitek-ili9881c: support Waveshare 7.0"
 DSI panel
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
	TAGGED_FROM(0.00)[bounces-34880-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EBA813B9055
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

thanks for your patch!

On Wed, Apr 1, 2026 at 9:27=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Enable support for Waveshare 7.0" DSI TOUCH-A panel. It requires
> additional voltage regulator, iovcc.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
(...)
> +       ILI9881C_COMMAND_INSTR(0x01, 0x00),
> +       ILI9881C_COMMAND_INSTR(0x02, 0x00),

Same comment about using a jam table here.

Yours,
Linus Walleij


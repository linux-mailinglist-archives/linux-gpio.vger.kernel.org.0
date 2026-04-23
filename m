Return-Path: <linux-gpio+bounces-35429-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCzuKrGO6mnK0gIAu9opvQ
	(envelope-from <linux-gpio+bounces-35429-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 23:27:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2E5457D84
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 23:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13A833013D43
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 21:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C0D3B27E8;
	Thu, 23 Apr 2026 21:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oW+PNH6A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FFD38F651
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 21:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776979604; cv=none; b=fiy2HWW/VzvUFiGEN9SQRMoGFWQ+qHwSMO+RzRQ3yTPZuO9lbELzDVYAcKnr3tVB38Sjp2c1OVu6deSsiRr8gTyHEaRjV68bPCEw4ysuAVWkTnQ51AAOXJnFalcDAT9MId/Qzuf93g5pi06ofHwOk4sgVcLxwGLYuSw40T5Fxz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776979604; c=relaxed/simple;
	bh=0DDQs8T54McOd7hJnTqwws1DRjXMfYuwNn80v+kQdL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O1Z7tqRwiVVZ99voYnliWInbtx6Ln96HLKhyvXLZnzv+9E2PZCCp7mEQd19qFSxxkyb1NFmFxXjsGesuLQjp3e1g/g+OAydI0Xi8XQQQS9k9h6yhnjL7+EyaA78BLTnKqvWRileLueki/HJ1uuhuwDt/F5LvmtFiGpwC76UEBRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oW+PNH6A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97178C2BCC4
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 21:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776979604;
	bh=0DDQs8T54McOd7hJnTqwws1DRjXMfYuwNn80v+kQdL8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oW+PNH6A6jOzDCoA2J2zMffkHl18TOlJgyakCnNt8Gtcgl7skCoN8ilGdVfJ6tLMZ
	 IAhj9lqfxZdOY8fOkdOisssAvuWwzxY7R9dNJxDVY+VbQVEE4k9rmsR0kmP1kk3piy
	 4qoYNWLpF4HmNCtr7wjB0g8UIfR89ShJKHKO4Gc/vvzjG7P1P6YLatXd5caADlfDvr
	 PxTxce3IPk5Z6gjd+EO2f8HF+lPrVEmldNGDY8g5pCVT5IMuv60OjzJLM4jNKgZ3zF
	 JHlxzX3zCwycCQAs5oNslX4T9Vm2Z4oY4hhiKjbG/AeGAllCFiPH0V94NEEzX+WkYa
	 f2oeohy4FFk9w==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a413f83226so7359811e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 14:26:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/eCBFkfim8t3tRRIB025T6cW9WPt7nNRIjRIEyxwbKxQnWRTXm9UHPhwgJC2gxh0ykmQahbp9NAaHF@vger.kernel.org
X-Gm-Message-State: AOJu0YwywEphWNgn7w75kVvEeVCrwf3iND4FAOpGrkMkbaAziP+AYjhu
	9UYjAgiVP5edo/vnREwKpVceG+90PvyXZbIFXFfWZo/D3g29N7UZDXM2K2HGx1NLMOrJ9yCJpMf
	Uz6IDuOAclzGUNRDjlyQiXUEZPUl0eC4=
X-Received: by 2002:ac2:41cb:0:b0:5a5:25ae:da17 with SMTP id
 2adb3069b0e04-5a525aedd3bmr3763550e87.2.1776979603322; Thu, 23 Apr 2026
 14:26:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com> <20260413-waveshare-dsi-touch-v3-14-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-14-3aeb53022c32@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 23 Apr 2026 23:26:30 +0200
X-Gmail-Original-Message-ID: <CAD++jL=g_t9RC-8rmZvdMuu_b+QpB8GjmbAVx6B1F96zToXVpw@mail.gmail.com>
X-Gm-Features: AQROBzDL1cfJthhfBWrjmA-f89fl7mK8hXIZNmLuA8w3ky1MkgwguYS8Mfizo84
Message-ID: <CAD++jL=g_t9RC-8rmZvdMuu_b+QpB8GjmbAVx6B1F96zToXVpw@mail.gmail.com>
Subject: Re: [PATCH v3 14/21] drm/panel: jadard-jd9365da-h3: support Waveshare
 round DSI panels
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35429-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arduino.cc:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: EA2E5457D84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 4:06=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Add configuration for Waveshare 3.4" and 4.0" round DSI panels using
> JD9365 controller.
>
> Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


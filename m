Return-Path: <linux-gpio+bounces-35358-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGSBOPrL6GklQQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35358-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 15:24:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF0446AC0
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 15:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DC2A300F941
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 13:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DC03EC2C4;
	Wed, 22 Apr 2026 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z67Osh7N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943BE3EBF2D
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776864039; cv=none; b=lIQMMLBz5aDv6g0l9xKD+fX8lRD0aGyz+5ksxfpWMbZKY4wKyGyLw1EueToGX53GLacHdxvbOu3e7UIHNFIfikvmfIKrrNH1zpJwAiPBInsiX110cd3ccrHgW3f1LhbVVUMS58N9biTP50SjALWkPZFv3zhfoY0mZ5WaLs8LiV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776864039; c=relaxed/simple;
	bh=5KP0HfyPYW0J2NmQ5DIgfn3Yf4onw2cQ4Oqkk1x/qtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBoIEVxuLpT1/00nfJzhCM0gd6+/fVD5WpfXRf7UBw27G3axdcuSykYqcDoeZN8l5eFUulhmiGk2g7kY81QaGhEHsrrUtqCaEN5Hwpia1Zemz8A6GRsIZ2Uy11AyRugFcsy+bIgl6Ml3oLElX1YCvkuFanizgm9Lga9uSOKRtuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z67Osh7N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C4CC2BCB4
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776864039;
	bh=5KP0HfyPYW0J2NmQ5DIgfn3Yf4onw2cQ4Oqkk1x/qtk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z67Osh7NnCzrAfvRVwJh3SfS8cXvfXaJR2137ozKBFsPKaNnEP20KUcxNsrDqAZ76
	 wOWoEhRJrVOIV8HyUZYJGphpDHZHy6/KDtT40o0HsaWvT4pEvkcVbGy2cPy28V77lx
	 jM/agiy9BcxxYe0fQj8ejwHk+tc79Pi+SDmJ9g34YsdwVt9UWYtde81/fr8/4Od0Mr
	 JIGMZn4mfYYTxzs/iedSnFdHkLDvcsqjMqjOZm3HSW74FcHZWh5HTksHNmesnit0/Y
	 2SLI13/cPgk/mfNUB6f+KbKFisoapNuFm1ccDMeLaoafstg94Np3k7mMqLCU21ikEZ
	 lgWZnqY7uBC5Q==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2c500750dso6109959e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 06:20:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/gEKUveTrG7zrAC7fwxUOTbdVbB8alBZ3k4/w1Yr33DbObLRjyaPjo94a86jHtVdo+JUVqRdF+S4HC@vger.kernel.org
X-Gm-Message-State: AOJu0YyYodRCXSs0FIAeN5XozxC6L5+5rUfRcDNmqlgMu6hWUeeFDill
	Wxlq9loocy0ANMsQZ/ZFiSqd1N/Pw34MjlkuJonNCbStXGWtkV4tPWZOOSWWAECeYLcRmV+QuQq
	LJBlHB9rncAcZAgA2xvqfJVvlilFx/Ns=
X-Received: by 2002:a05:6512:8005:20b0:5a4:1904:b1fb with SMTP id
 2adb3069b0e04-5a41904b214mr4908355e87.40.1776864037735; Wed, 22 Apr 2026
 06:20:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com> <20260411-waveshare-dsi-touch-v2-21-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-21-75cdbeac5156@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 22 Apr 2026 15:20:26 +0200
X-Gmail-Original-Message-ID: <CAD++jL=zmd8yto9HuyjC8cmBj1oMgOa7C899yo_toP9Q+QJcDw@mail.gmail.com>
X-Gm-Features: AQROBzBIUxYxh6Fy1Y8k9jeq0K6g4QE275A5ZjWo0tNfC3Tdj4tYrWP4PCpCQTw
Message-ID: <CAD++jL=zmd8yto9HuyjC8cmBj1oMgOa7C899yo_toP9Q+QJcDw@mail.gmail.com>
Subject: Re: [PATCH v2 21/21] gpio: add GPIO controller found on Waveshare DSI
 TOUCH panels
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35358-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arduino.cc:email,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AFCF0446AC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

On Sat, Apr 11, 2026 at 2:11=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> The Waveshare DSI TOUCH family of panels has separate on-board GPIO
> controller, which controls power supplies to the panel and the touch
> screen and provides reset pins for both the panel and the touchscreen.
> Also it provides a simple PWM controller for panel backlight. Add
> support for this GPIO controller.
>
> Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
(...)

> +static int waveshare_gpio_get(struct waveshare_gpio *state, unsigned int=
 offset)
> +{
> +       u16 pwr_state;
> +
> +       guard(mutex)(&state->pwr_lock);
> +       pwr_state =3D state->poweron_state & BIT(offset);

Why is this not just flagging the same register as write-only
in the regmap and just re-reading that same register from the
regmap cache?

> +
> +       return !!pwr_state;
> +}

OK so it's write-only.

> +static int waveshare_gpio_set(struct waveshare_gpio *state, unsigned int=
 offset, int value)

This looks like it can be replaced with a few lines of
select GPIO_REGMAP
#include <linux/gpio/regmap.h>
helpers.

Has this not been discussed earlier?

Yours,
Linus Walleij


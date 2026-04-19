Return-Path: <linux-gpio+bounces-35233-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PXwJyo45WmcfgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35233-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 22:16:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DED6425692
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 22:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9335730054C1
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 20:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7445D3064AE;
	Sun, 19 Apr 2026 20:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsKUyjy/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F5F26E706
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 20:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776629799; cv=none; b=aEqyISPLAENR47zzIU/AnLOwJIj1NoYE8hHg3+YDM8FIHf1RYjcKwsf1svyGIIx6D2JXPkE0b3Z3YQGtZTe6YTgLl3kO25bpvoZrXyx1yzhdmkR7zEs53nq/PBmkI8R1th0fth5odOESbsAcTm9BY8OzK7AqcVbmYxdbCSFAKSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776629799; c=relaxed/simple;
	bh=hlN82U3u5JGIfEK3aCxmpqJVvZHn8H0jsQ+771+7n0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQVeAJ/33/BHC+gfNf1CwHbVYC+D8cf5LUiifZsN9SP8eFOc1Bw8DLBFD172qQRADej7nzlGTeeC+qDH+oEEtUNUjZtKiYoiJi0jnyMnEqiZOhH2gtxshTL9wnVLzRUBHeNI/NgvJTLovXWJ9UoYCcuxTVZK2kN+HqlI+erZZ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsKUyjy/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BDFC4AF10
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 20:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776629799;
	bh=hlN82U3u5JGIfEK3aCxmpqJVvZHn8H0jsQ+771+7n0s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IsKUyjy/vvwOFYoWiOM6lZZoizOKwCFEO4N+EyDgTKdb7zqwGo4asI5K+rQ10Vuwj
	 jMl5Zm9uYs9lq9UO4MYdB4/5JZfXbuRdY/lxVC/p2T/EyiUrllwSkx9U8WfGDh0u3g
	 CWw2je+DxwFgkMDoPwTDBVZdFc5TJqKhBjYc+qd2j0YICJ3l0c8No1NZvVQuBBpXLZ
	 c0xA9P5GnrDpb11BzLJKViQcuSMGAfXMAm9rcbcb3CbYQGNEp0GjkaX0K5oW/b9bAa
	 QT+A2klQhexiRQ4AXZ7G7ff62QniZWuVd69nVeZbjVVzFXbQFqqBBliGEKp9z3jvNh
	 4QezrBYaP9/tg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso2271756e87.0
        for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 13:16:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ95KcZ84jTJLqBimP9m2aI7m3rLQBp1utmItKvaNEqHIT0XZTJ0VdmryqttDfFDUaP3FXvtHcx86cFE@vger.kernel.org
X-Gm-Message-State: AOJu0YzksZ2up+Yr8/zLZlS4jIGgwo7eAsicRILQ3L/OMHh+AX199Lx4
	UsSuggldOXBTSYGIicICnGSFo4w6t8CXxHdF2t5d8ytR/fCN/r2evx4clT84SdWl5ZH1L28uagH
	lR/LXP06Huo3MtBGn5nAZ+WTHwAlbuI4=
X-Received: by 2002:a05:6512:ba1:b0:5a2:c05c:118e with SMTP id
 2adb3069b0e04-5a4172c36e1mr3505118e87.11.1776629797744; Sun, 19 Apr 2026
 13:16:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com> <20260411-waveshare-dsi-touch-v2-15-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-15-75cdbeac5156@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 22:16:26 +0200
X-Gmail-Original-Message-ID: <CAD++jL=0i4Z_xt7E4e_1JYJ7J7bGDGpEunS30DxZw3=ioh35jw@mail.gmail.com>
X-Gm-Features: AQROBzDnFYGHHrw3HiuqBxQobwvrUSVyXOaQI0N4JGjLUJJBSKx7_rBzcGkbSOI
Message-ID: <CAD++jL=0i4Z_xt7E4e_1JYJ7J7bGDGpEunS30DxZw3=ioh35jw@mail.gmail.com>
Subject: Re: [PATCH v2 15/21] drm/panel: jadard-jd9365da-h3: support Waveshare
 WXGA DSI panels
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35233-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arduino.cc:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 2DED6425692
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 2:11=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Add configuration for several Waveshare 8.0" and 10.1" WXGA DSI panels
> using JD9365 controller
>
> Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


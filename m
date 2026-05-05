Return-Path: <linux-gpio+bounces-36200-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Dx/Irzn+WmdFAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36200-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:51:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EC04CDF02
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 612C0304F42D
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 12:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD0034752E;
	Tue,  5 May 2026 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBRcqY3h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF9B282F32
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985207; cv=none; b=Aw1yFDgUAB+aV/h01PfI7u60iGwu0Ep7q9GBmhN5lZX2Zy0ruqa/4nL/z2dWnys4eSkh/dVJ5/8zhKZ4XdJOO3a6/ihzKPRvikLQEpt5jLVc4Rh38kbHrM1SyLSbAKaquHmyxmQcnYLlQpuc5FMn+HhwAAs5dZ+nMZeNh07imQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985207; c=relaxed/simple;
	bh=rVnkmHVd+pu9S0anEsS4r4bfU6M1ddOgx2neCXzbhZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ON9dZMY71nyRzgUMMraXRjUBQK4KcsVBP3dFFC7TCmGdH24fwENO2cJ2dIowhMKg9B/S4J5xkexNhOHaw/PDRqbAOOLPtynzLWTR9WsMYvVseKwt4pKeHAZlglVzUfcY5a3zm1FTZq1W9rQ4GyLYERJtz6bT2frRpnM6IiTIMPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBRcqY3h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2ADBC2BCB9
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985207;
	bh=rVnkmHVd+pu9S0anEsS4r4bfU6M1ddOgx2neCXzbhZs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YBRcqY3hYCIDLQrm7nX0v8wNjpLJT9mWyPfftnVUVahrAKRuy/Ppb/682PfnGLMXN
	 LWR8HvU82oUGMD2RAQydcMnvyF5jdNG0Pk8L9QzDJE05fSod012Pj05rcD8He4x4S6
	 bmk7vnkiIfjTCDvHSoYS7BPUoO8y6sYC6F2cjrJQ2McPeNl6OTP0zNxdt1WccEi/27
	 7U/IJA7hLMUQonfiZ7+s9XswJOQXI6dGF28tBMtnhIZWS2I+j1UzEVrJv2L3ams5v2
	 TDT65zuHreErrTavdaUprSMIUXzx++2d3z9WvnJeq1yjLfetA3O3PPYNGQ/WxiMYyP
	 HceKakEZchv5Q==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a87782588cso2484853e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 05:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+seBnk53jSmFHDheu8h/AuY2AP4qmx0YIH+q5oRJI4hSrND6QQ9+QNwPwn2TyI1HDdVdHfzVZnsReh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5jpnSYlVxJBQ6K68Mv3mXPF4LpNeRihjAGlZ0lPAgS7YfF4aZ
	iVXWxF4/rnQ3Bry7jtE1E1LpJPFGgzzNdNdwq9D1jPe8qRddOyLQOeHmd9wBDFpauAi4RBM9dKE
	pMMJJD3/fhj9GE39E3+tQ23l7UcLYt84=
X-Received: by 2002:a05:6512:3b10:b0:5a3:feed:31cc with SMTP id
 2adb3069b0e04-5a8631b9e85mr4464601e87.24.1777985205388; Tue, 05 May 2026
 05:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com> <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:46:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLnk4q7L_cFzz+1gKkAqwhv=TW1_XSepuii7b_PHF7EPqQ@mail.gmail.com>
X-Gm-Features: AVHnY4JlHoGXQmSjsgZFXuRe_ND9OHcbw2Ietb05k05PsECGSoH_v05qU7tRmbI
Message-ID: <CAD++jLnk4q7L_cFzz+1gKkAqwhv=TW1_XSepuii7b_PHF7EPqQ@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] pinctrl: s32cc: implement GPIO functionality
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 35EC04CDF02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36200-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,mail.gmail.com:mid]

Hi Khristine,

thanks for your patch!

On Mon, May 4, 2026 at 3:12=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> Add basic GPIO functionality (request, free, get, set) for
> the existing pinctrl SIUL2 driver since the hardware for
> pinctrl&GPIO is tightly coupled.
>
> The updated SIUL2 block groups pinctrl, GPIO data access
> and interrupt control within the same hardware unit.
> The SIUL2 driver is therefore structured as a monolithic
> pinctrl/GPIO driver.
>
> This change came as a result of upstream review in the
> following series:
> https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristineandr=
eea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043
>
> Support both SIUL2 DT layouts:
> - legacy pinctrl-only binding
> - extended pinctrl/GPIO/irqchip binding
>
> Also, remove pinmux_ops which are no longer needed.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

Same comment about GPIO_REGMAP here.

Maybe this has been brought up before so it's just sigh rolleyes,
but my memory is short.

Of course gpio regmap conversions can be done later, after this,
but the problem with such things is that they tend to end up on
the back burner and never actually get done then.

Yours,
Linus Walleij


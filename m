Return-Path: <linux-gpio+bounces-31896-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMEMDhFWl2lPxAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31896-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 19:27:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC669161AAF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 19:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31596300B044
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD2E2DB799;
	Thu, 19 Feb 2026 18:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coMVIVFa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427F32BEFFB
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 18:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771525592; cv=none; b=QarVpIO5Ga1bxO2FJR0LwRdpU2rIpQv5qHUMBGFJ4e5VClDnJA9KAvL/qbopO0jSxQQdVM4ItVvmH9OEA2FoQ/09zwWKg3T7TPov/yG50FTnvP0IaFG1e4wylD4yGKR0fDwnvhkPH0S/BUve/wN0IvdWzlTYyHGpM3R3sGHYrv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771525592; c=relaxed/simple;
	bh=m5iTeZQJaWOmDHdhLUpG8T60sF/xGvfsqVSif6l6vXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ra0n0iCRz+cYGRP69SLOhdL6D4CN89tU1cvIyOQZu7y1rMs9w7xpXW0/dt/4ki0HV0bhuSyoX9kDUUG+9YoqFbmd7ap6CoTiCA+iYifqzvbLHRxR4Ohd3sIk2LQg2sdYFpHQFr31phWMF92im8Dt8ZeoiCm9CVsjZu3LP7N4SnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coMVIVFa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148D9C4AF0C
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 18:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771525592;
	bh=m5iTeZQJaWOmDHdhLUpG8T60sF/xGvfsqVSif6l6vXo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=coMVIVFaSc5Yl0fG5/W2KKhvSWMI4xNABk+8P8rLZWPVKBhU9BeRfChpGmkccNeG3
	 uADaV6ePoVKcMRevQece17RRaVNriDC/t9Jugx5ZiXqYUnaBhbmH07Mmw7Xl108E2d
	 n5gn23bOuzonv8qfQUx+snqzyBkUdg/oM2gHHWVF/w/2zGY5VzfLMpsn9fP1sdOKAb
	 +P7Ymi7xBhgRuERIIBgyDTNyX80BhLVNn4Fxvb0y70MSyQe/hJXC8RjYG/9xNjtcQ1
	 KOWTO1GBXefmFYn11eaH5cgfD+FNiGSPfjbpQEHyLtIm9Mqvo9xAMWFOnrsKxzikDA
	 HDxr2f32Gzl9w==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79639c2d2b5so9846507b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 10:26:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbTDsXB6SejU4fhA/TOyZZjYzKjcQ5spq4gmHAOUEATvD09esToUZpfdOrmjH2ImFjpNq8jhgtFLFz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+n4XpCJDFgh0NKcxkJspcwlRcs9qig/Pn5OSEe3yaZdpbf710
	VJOvhP13s6bh+ApxVu5eXwOhwy+iXko5S+RzpJnv5DeE64t1bbJX1yd+Gk4N6v6dhi4ES7L9yS0
	bZ8/7rAXuQ6etH1th3NjjODrRgeo0Adw=
X-Received: by 2002:a05:690c:4c01:b0:798:f20:b84 with SMTP id
 00721157ae682-7980f200e27mr16409347b3.42.1771525591316; Thu, 19 Feb 2026
 10:26:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZYnWZqfzKwzzF4f@google.com>
In-Reply-To: <aZYnWZqfzKwzzF4f@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 19:26:19 +0100
X-Gmail-Original-Message-ID: <CAD++jLkfLFejuhJgYRiMaR3XBfi5nK4LX7f1z1q_hGgLC5sZ-w@mail.gmail.com>
X-Gm-Features: AaiRm52t-jBfjZKc_oPYwPAJHDGGYMDv_wl1K1lfnyP0Jfup4fc2F5SXbo3j5X0
Message-ID: <CAD++jLkfLFejuhJgYRiMaR3XBfi5nK4LX7f1z1q_hGgLC5sZ-w@mail.gmail.com>
Subject: Re: [PATCH] net: phy: qcom: qca807x: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31896-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CC669161AAF
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 9:57=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by qca807x_gpio_get() is
> normalized to the [0, 1] range.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


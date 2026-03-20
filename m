Return-Path: <linux-gpio+bounces-33930-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMU9BOZXvWm69AIAu9opvQ
	(envelope-from <linux-gpio+bounces-33930-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 15:21:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EF22DBBAE
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 15:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 766E8300E5D7
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FE23C13EF;
	Fri, 20 Mar 2026 14:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rOSOvJUu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272643AA503
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 14:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774016480; cv=none; b=gRmrCpCX1X2/HgrZoEi3VaGoB9+3hQL1GtAN5sU8ml6eQhaOLgzGZZ9jBSvT1Jwtjsh2C52XDcSQXxX1kZ5ODOZgSS7/xIEz6ZcMnXTdn0TPihd4xXS8U8lvi5oVASe4YjDwdbLWeItj965CvHBmgf0Xa4NiW7EFBwhnbRfrHZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774016480; c=relaxed/simple;
	bh=SqM2AKs946P+FYY/eyn1mHQZcwnT+QeDlAmSMReOErk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGFDeUn5vxdYEJs25kZcPHGujA+RkHGh4xmGC2BPGJ/7NMZ3rq6AAWob6Z1tvC4WfParbJd9rcLuKceVytf8WNfPSQOZZSwvp5SCW+V0Y5iRvAE58didI0DrMcLG4q1Nw73pxdJfosqsvSZgETW1XIClZmfTUzM8jpnE3941AME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rOSOvJUu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA7BC2BCB0
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774016479;
	bh=SqM2AKs946P+FYY/eyn1mHQZcwnT+QeDlAmSMReOErk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rOSOvJUuGN+56iErGAdMaNJh2uWQYuprlm2Z1i/to588bU4zXVHLcEbqZtFlcZDVV
	 MnPSKtoaymN1GA9hQafgMT3hg2zMLEtJ5YZAV5Eu0gsCuYwB9ogCMs0yk+x5mnCBVe
	 4H5MMDLr8U31+rI2CKXYbI1KT+/LZP2lviVR/iH68mykPafSrkJfATJlJTW30pAdhw
	 G9B+1RpmRxnWi1kDDa3QeK9dw2Ah0or8ogKYkl1H9vdCcZ41F8E+79x+Z/b8aVregE
	 V7cclLOetUiVeg2jYkvkYh9+28miwpKNOESS5x4u+Fe0gRd+Ffmx2ZFcwL7FmuHy38
	 d9mzlM8feH0iQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-798374d0f44so45436257b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 07:21:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0TgAJT9/fukng2YAJGgRgRuFM58zeywU2lyEwyGBm96DHi21RVgdQOpFu7A83j3Fx+9b3nEgVtep7@vger.kernel.org
X-Gm-Message-State: AOJu0YzzeHzoXVMJpe9NX5iK19PrOuAfv3iuWdZ7cfwBmqAS4my3kOBs
	yumK2mx2d5N9xP3q2gjunGLmoxkMNARMKuoy5Lv81f79iAP/mC+6CE30XLT16fOzxc84GjgnzW5
	gVZ0tuQde9RhC65m3y07TUHGVjzA5hCM=
X-Received: by 2002:a05:690c:60c2:b0:797:d46b:e86e with SMTP id
 00721157ae682-79a81a90a25mr75990057b3.14.1774016479055; Fri, 20 Mar 2026
 07:21:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
 <20260320-apple-m3-initial-devicetrees-v1-5-5842e1e393a8@jannau.net>
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-5-5842e1e393a8@jannau.net>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 15:21:07 +0100
X-Gmail-Original-Message-ID: <CAD++jLm42TDQCMrrz+8jkBZnKc7-Kbo26Kp8RR+XZhhGyow0OQ@mail.gmail.com>
X-Gm-Features: AaiRm51jFHpXl3P8yRKHiCPd9s1KCUcQyaH7BZV4EXHpuIPKoEs4F89iW4OvG24
Message-ID: <CAD++jLm42TDQCMrrz+8jkBZnKc7-Kbo26Kp8RR+XZhhGyow0OQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: pinctrl: apple,pinctrl: Add t8122 compatible
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33930-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gompa.dev,linux-watchdog.org,roeck-us.net,openbsd.org,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.947];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,jannau.net:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 70EF22DBBAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 1:23=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:

> The pin controller on the Apple silicon t8122 (M3) SoC is compatible
> with the existing driver. Add "apple,t8122-pinctrl" as SoC specific
> compatible under "apple,t8103-pinctrl" used by the driver.
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Looks good to me.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


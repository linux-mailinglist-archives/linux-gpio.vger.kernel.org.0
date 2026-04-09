Return-Path: <linux-gpio+bounces-34915-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PGFJFRY12kFMggAu9opvQ
	(envelope-from <linux-gpio+bounces-34915-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:42:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 371B73C728C
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7EBC30103B6
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 07:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E1537B407;
	Thu,  9 Apr 2026 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeiDIhYb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6F3372685
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720498; cv=none; b=BmV81WOAi8tglPMJUZxypTMZYJaicV3g3Zr/dwwOfYPJZp6X/4/vOu1geErA3stXoURN9+jDsqlQRgWk8EXejRcaInUE08mD6evzzmVy7fvU4i0vSvZ10P1b4OvcbE/oPfDr7vHLIXWBUtTRSUbNK6FuzpSTJzp7GW6JDjccOP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720498; c=relaxed/simple;
	bh=lc8JQ/vWkeejRsiU76ULhKIucAIfpuHv9grmFJL3auY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SK2ahxfck5WMYwodaexUjS74UqLJ8ljgFuwpmCKiuR3wnNsn8aUc9/uB0r74mCa/w3fNvNUDrouMo+TF0o/IU07EPM84xEoDaDgtxCTRMZBWxnQb99+50fCbJ9wR+WBoRr69JH8yQRt3hxdo/U6INqjbY7tXhxMXLUPGURURHpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeiDIhYb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF63C2BCB6
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 07:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775720498;
	bh=lc8JQ/vWkeejRsiU76ULhKIucAIfpuHv9grmFJL3auY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aeiDIhYbjGLVo5et9i0z06029dElhtQsqqpGSxDa1v9OZyjsB1oTGh8K6bcFc7kcn
	 JLI7awnKYXneMHhvfm2BjANOEthYuG0g1McbanPHizN0r/Ms/LSpTaQRKn0xIBgK6t
	 BTxEwOB4pcbylMNXanxPcYLL20CwkViS+pqgEGbqI+rLLh265g55YwC0kCOxG1ByxJ
	 IjOiQPHKfXFyv18uw4OPusWcwwj+u7tKtygv4ZtsHsIwrEkyh6/rwDsgQT6YzrcvrO
	 NBXAwCoiGpgo0x4/xjxPcSQwI1tcKMz4/lsirKZLQAQrcGN2MnmsMzK2cTruvw6Pct
	 c6wbE2piH1biQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38df1889fb9so5989171fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 00:41:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmoP80t6/Kg0HIlSkr1jKJsp70IN7zAYFo4KdGX90KmI0+mFrd6k/Q89WuDIiskFJxQ023CDASZAYs@vger.kernel.org
X-Gm-Message-State: AOJu0YwuwIgynZmItNZA54omi/jUrEQTgxpxs4DHC3nF5TcKLSm0LjDz
	oIGFj/+88ykxxAaX4C1nwcAegMiecO6qGZw6cFMNdZeqE9twT3xJoD/b88UGL7ul/w9wjd9bBXL
	ADTldCPi+s5luywP8OZb4n04Oh+3oImZkxYPepEdSyA==
X-Received: by 2002:a05:651c:4192:b0:38d:eb82:d80f with SMTP id
 38308e7fff4ca-38deb82dc50mr48627071fa.0.1775720497068; Thu, 09 Apr 2026
 00:41:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-19-5e9119b5a014@oss.qualcomm.com>
 <CAMRc=Mcusnm-k76e6jTiwrw5xJL7f-nWBsg4=QpD08cv8pPgMw@mail.gmail.com> <l6pezliurpgv2mopw2xl4gfgpki6r3v6ufpsaavj774qnxgept@h3jxxpco23oa>
In-Reply-To: <l6pezliurpgv2mopw2xl4gfgpki6r3v6ufpsaavj774qnxgept@h3jxxpco23oa>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 9 Apr 2026 09:41:23 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdRs3oSYUCc8t1Fz+9f4f3FS8gpzh4OqGLwpzhR09nsPQ@mail.gmail.com>
X-Gm-Features: AQROBzDMHxHCpdplwZHc_f_Epk3_RdAPtZIzTXn5xXroKG8KWM4nBKA4II4kNgA
Message-ID: <CAMRc=MdRs3oSYUCc8t1Fz+9f4f3FS8gpzh4OqGLwpzhR09nsPQ@mail.gmail.com>
Subject: Re: [PATCH 19/19] gpio: add GPIO controller found on Waveshare DSI
 TOUCH panels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Jagan Teki <jagan@edgeble.ai>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-34915-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
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
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 371B73C728C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 9, 2026 at 3:26=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> >
> > This driver looks like it could be easily converted to use gpio-regmap =
and
> > become much shorter in the process. Could you please take a look at
> > linux/gpio/regmap.h?
>
> I took a glance. It is a nice wrapper, but I think being able to call
> waveshare_gpio_set() internally without extra troubles overweights the
> bonuses of the wrapper. Also, I'd agree if there were extra complexity
> here (e.g. the stride or the in/out handling), but having just the out
> GPIOs doesn't seem to warrant it.
>
> An alternative would be to split away the backlight into a separate
> pwm-backlight device. Then having waveshare_gpio_set() isn't that
> important and thus I could switch to GPIO_REGMAP. But then... We don't
> have real control over the PWM. We are really programming some values,
> with the actual PWM duty cycle calculations being handled internally.
>
> With all that in mind, unless you really insist, I'd prefer to leave
> this part the driver as is.
>

Ok, with the other issues fixed it's good to go then.

Bart


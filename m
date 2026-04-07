Return-Path: <linux-gpio+bounces-34844-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OluCo9l1Wm05gcAu9opvQ
	(envelope-from <linux-gpio+bounces-34844-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 22:14:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7043B4694
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 22:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3109F300D177
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 20:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA7835F178;
	Tue,  7 Apr 2026 20:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n00tRSJf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0093375AE
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 20:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775592751; cv=none; b=q663t5HXe4T5lvv/lFRpmxUqVDzCViolmHKFaW9g+MgWe+YS91/eiX01xJ4dXLkmbB7sxXEBlLIh37IQtAfKyMcT+LCQJj/Ds4bYpBP1Feo21ruBU9QuNSuPoDFTNgvgipxj2tyGUGfVbs6g1dfkTD0tAFmy0JHMkiZDs9+tw6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775592751; c=relaxed/simple;
	bh=ySK4k1FrZPDVfo+XDtXDMU3skif1KEORFAYqFl6sxr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EowBDaZQA6jYxvjK1TjYYzbmv9G1a7mtPQ85iJrLmonzqcGN9Y81F0wXhuSSpwCQwOLJlvk4lsK7sQ0A3cByeHJaFJkbS6a78fE9dJuyueW0AiKSCaBl+UR+BhmnKI8/37vaCql2etevbi985/7rXsA7rAih1fuk8nlMBiwRxS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n00tRSJf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17908C2BCB2
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 20:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775592751;
	bh=ySK4k1FrZPDVfo+XDtXDMU3skif1KEORFAYqFl6sxr8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n00tRSJfVa0/ODJXwo34Hmpq2CDvR4LnbfBuP4cPh0/l6j6qvxkz2rLr4A+FUhDiJ
	 hZzUEXRB3hgGBOhllfkjbQG7jsTqLIriD4ut68iz0UsW7KxWxN5zWK5tgFoxvjBYTx
	 juO/PwXpyyH4SSlS2N+IN13CQBOezRFovzQr7TA8wxLF3eRmkUez+rmx//xYFIAUiH
	 ALVjmnoM8ugOTw6qTSkKPTR7XiW31wYuTJR5/F9aOIjXifRXpXVIb6zzHhqGM8H75y
	 i73jfC9xb2Xw3QoamHpzvor7wy+qTor7zW+ByxVUvhK8Yc3gS5DRwVyUw/S23oVe0E
	 V7MprNguupM1g==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7a469383e0bso38082207b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 13:12:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+reGUtUd8r5qufHnrqUNQUTvYH3vmtnJCV98FbwoGjEEZLbNr/VZ+wZ3qNNHE4K6tpIFVlrxt1aDj@vger.kernel.org
X-Gm-Message-State: AOJu0YyrEyzFQAbgHwSyjbEiESBnEEFNrdWHJ4HOZ33uWbRE1ZRU1oFs
	lmC8P4fH4X2iPy8/hcRON7gA4sJfuQ+ffoBgOI2ahuEOA6xtVeebHKxWGwyKyY3oqbyKKDAITCf
	fp7bDRugpqNWBYqTwaCdyZSYyJs/RQAw=
X-Received: by 2002:a05:690c:6b06:b0:79a:73d4:d4c1 with SMTP id
 00721157ae682-7a4d84c47c0mr169531307b3.26.1775592750468; Tue, 07 Apr 2026
 13:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com> <20260401-waveshare-dsi-touch-v1-7-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-7-5e9119b5a014@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 22:12:19 +0200
X-Gmail-Original-Message-ID: <CAD++jL=J1uFSF_Wr8sSfiDdeHoBNv59NY780i=BaO9sOyUxgiw@mail.gmail.com>
X-Gm-Features: AQROBzBn1eTDs62ijFO0yHAkDDZOCOXW3kcZWyuz7nAljA_pmIMBgTaEyfuIqMo
Message-ID: <CAD++jL=J1uFSF_Wr8sSfiDdeHoBNv59NY780i=BaO9sOyUxgiw@mail.gmail.com>
Subject: Re: [PATCH 07/19] drm/panel: himax-hx83102: support Waveshare 12.3"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34844-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 8E7043B4694
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

thanks for your patch!

On Wed, Apr 1, 2026 at 9:26=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Add support for the Waveshare 12.3" DSI TOUCH-A panel. According to the
> vendor driver, it uses different mode_flags, so let the panel
> descriptions override driver-wide defaults.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
(...)
> +#define HX83102_UNKNOWN_BB     0xbb
(...)
> +#define HX83102_UNKNOWN_C2     0xc2
> +#define HX83102_UNKNOWN_C6     0xc6

What I am unable to fathom is why Qualcomm, a fortune 500 company, would be
unable to muscle out the datasheet for this display controller from
the panel vendor
and provide some proper names for these defines.

Could you try to ask Waveshare to just share the datasheet so you can say
what is going on here.

If we have too many *UNKNOWN_NN" it will get hard to see of the same code
can be introduced and refactored into other inits without risk of breaking
something is my thinking here.

If it's like ... really hard for you to achieve this I guess I will
grumpily accept it
but it'd be nice if you try sending the message that we want to know what t=
hese
things are.

Yours,
Linus Walleij


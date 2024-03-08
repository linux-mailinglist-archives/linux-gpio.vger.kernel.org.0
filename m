Return-Path: <linux-gpio+bounces-4209-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EF0875E0E
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Mar 2024 07:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93DB41F21A36
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Mar 2024 06:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7972E4E1D0;
	Fri,  8 Mar 2024 06:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tK8tR2kb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C722C6BA
	for <linux-gpio@vger.kernel.org>; Fri,  8 Mar 2024 06:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709880751; cv=none; b=RuyMOSIXR+CVbakqhkMgk7eZjdqol/D+uAFaz61mowVJXYx/aRR/93ijYghN7FBh/lR05lfreNmlJn9sSsEROs0tyzvPRiubaEZjcmp1oUi7TPnm8MTdNNAPDIow/13hPoWyXWhuKuzG79OpKNxSxzWwRAaQm3zHubjGTUQL1rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709880751; c=relaxed/simple;
	bh=1mqxOpKOeXn2vTKPaCruvR8m5Fe2LDTfW1yj7fFhtnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JrBb60iLomr9k1RZ7a09XHbdkF66D9ARd32J2GtMjS8krlXToB7e2GprTKnVqjf08Bo5Drxaw2bkO1O9BcwTEzWvovHR8CSzp8YvPFBVt+1SFyHQITqx6V6oB2DNdVRj5r2u2q6pcMmC8ByhUoDTrx3/xcAzYRg4wcWZXKmw3kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tK8tR2kb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A22C43390
	for <linux-gpio@vger.kernel.org>; Fri,  8 Mar 2024 06:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709880750;
	bh=1mqxOpKOeXn2vTKPaCruvR8m5Fe2LDTfW1yj7fFhtnc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=tK8tR2kbZJos9W9Y2rNHm7fhCa2irXJHx/5xVuH2dYK/Ujv6t9yueFDhgvG0nI9DG
	 XNg48ABkbj6oak/SIWHyf/1shR+VAtgNgTmJeu65vvD2zLJ70nSIBq/jURhK0NI022
	 pttmr6J+CxDsRpoQmeWqZALPzz77ntzXl/BaQtK1qZUV+0+rWqsKM/zBTN50ZVe2XY
	 yC+bC+nrsbz1Mu1vnGoYSADSOm9mSusuYnrEtJ6j0Px/HbAs37iCExSn7F2OYocKlj
	 Z5zrgleop0UNsn/lMoqK5iSp8ewvfPgnb6n3ZSCZ5diF7/hPUGKFU7wPvVSvgI0bBt
	 1xuYc/NprtoCw==
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2997cb49711so1162012a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 Mar 2024 22:52:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUK3rujCp5G04YamLPIGGHFT1N2CuPkulGQxgdAEHSnzkwdk68ReKj8hf6b9XqsDWITEgaS2eME+XscR82oD9Wp7Z6Og8og2y+8+A==
X-Gm-Message-State: AOJu0YxBXuJfxvluziiPndOrp+CRT80T+PoY5yFbyLoKoDH12nuLceIz
	UpYtFC2zDQ17qulR7A/zjcqOdUhj0TPvBaeS/lcihpvxiPMwACM8rcBFKTgz62WPzg6Yz069zc1
	Q4IyXdswYnbFZpZtbggar4WWY1ww=
X-Google-Smtp-Source: AGHT+IHqlI6F7y3hWye/qfIUw2wZCOujKJH0NjYJ+CHY4lt5GMiz96ruf6Yk6TYIs8dLKMcaVG6igzz7DcxZCgrbgFA=
X-Received: by 2002:a17:90b:1809:b0:29b:8f6c:6b8c with SMTP id
 lw9-20020a17090b180900b0029b8f6c6b8cmr3575881pjb.42.1709880750252; Thu, 07
 Mar 2024 22:52:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307070113.4888-1-wahrenst@gmx.net> <20240307070113.4888-2-wahrenst@gmx.net>
In-Reply-To: <20240307070113.4888-2-wahrenst@gmx.net>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 8 Mar 2024 14:52:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v646i0xk1xPGR5_8mAw6o_3039B_XXhPxX11xhF=yCD=hA@mail.gmail.com>
Message-ID: <CAGb2v646i0xk1xPGR5_8mAw6o_3039B_XXhPxX11xhF=yCD=hA@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 3:02=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wro=
te:
>
> Even the driver already has implemented pin_dbg_show, it could
> be helpful to implement pin_conf_get for a more generic behavior.
> Contrary to the BCM2711, the BCM2835 SOC doesn't allow to read
> the bias config, so the implementation is limited to the basics.
>
> Keep ENOTSUPP here, because it's only used internally.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>


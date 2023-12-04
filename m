Return-Path: <linux-gpio+bounces-951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAEA802F5B
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 10:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6C54B20945
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA5D1DDDC;
	Mon,  4 Dec 2023 09:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mEFGIH+K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5E3102
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 01:53:53 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5d852ac9bb2so8784107b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 01:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701683633; x=1702288433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzMOxxlEg/QFrxypJgdxPuDbMTB8FVdAxHNtSJTBldI=;
        b=mEFGIH+KDTI6iObuF+GOXSisfw/zDOYMXVyhB9vU5TLA6qaJGeswbnIzzzFBvRDlLz
         fwjJzwYNo+yJTb6fCr99Bd1BbHEH0IbOw1zuScpBkaIdy2CxgdtUhEbB01BXz+JnjwC6
         kyl+X+MWyI5DWvwRIxTsPJQna7iN+fmqvpI1NXI0oF5ybAlVUS6vZXM/7UtaceLJkhau
         N15XaLB5y3pH25BVKUjNZ3bAAxdqUU0D8sH81VyC4VYm6Jpcukg/htxCd6BoQjFLVEa+
         kuXhn5kwp33EWg9lEMX2VRfAf8UuOxYkCp754UQr4bRSnnfCqOk6xoVLHsllFnHm5297
         BMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683633; x=1702288433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzMOxxlEg/QFrxypJgdxPuDbMTB8FVdAxHNtSJTBldI=;
        b=VEjK84ZJuxk3omL0/g2IVN6QRe13FqVJlp2BNMfMo5Dt1xORYddqpb7VpG2Lmz0dqE
         ZQSCQHtnzGNp+GAdkA8PZ2EX3vXRGdgLqaQM9o2oPEPuexwcz2atzIewQ13RcAWYQmkF
         iWsznOIJWamgqfH0NP2PK6PNN98G3CKZ0knBoUNLUak6BC9vwCvkzoJioWQYLXwHpE8Q
         6taNCnP6Ui82WmpKp12M2D7YsB0W7xm4woBjY6+b7s+LmL57cMfCe9c7VwpxeIoiMobH
         c6TkN07m6cnq7yupBKtBfXgsWQhX9vMcbjFHrHT6TuoccQM7wU2KmCxrWt00Fi+ce/RG
         SPHA==
X-Gm-Message-State: AOJu0Yx2wEBbw2FzqYb0HgRKWxkEmrMtBIc20bgTawIU0Yl93/JX+UBl
	Zb7WGzQJx2/Da0cbp8E8mNpWD95CFEiNeXIYZLs4nw==
X-Google-Smtp-Source: AGHT+IEf2tKDzcON3NlEWW9zl7T+Ip9DEjCMzaO4XQ9afDuuBb8LKUN0p5LBxWpJxwqrynnEIc94uFQW0MlXOdgNJv4=
X-Received: by 2002:a81:b702:0:b0:5d4:7f5:cdaa with SMTP id
 v2-20020a81b702000000b005d407f5cdaamr6258004ywh.33.1701683632891; Mon, 04 Dec
 2023 01:53:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com> <20231128-j7200-pinctrl-s2r-v1-3-704e7dc24460@bootlin.com>
In-Reply-To: <20231128-j7200-pinctrl-s2r-v1-3-704e7dc24460@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 10:53:41 +0100
Message-ID: <CACRpkdYndEUkC7j133LVsrFXgpujwimvxGPYfDeVTRZAWsQprQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-j7200: use ti,j7200-padconf compatible
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, gregory.clement@bootlin.com, 
	theo.lebrun@bootlin.com, u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 4:35=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> For suspend to ram on j7200, use ti,j7200-padconf compatible to save and
> restore pinctrl contexts.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


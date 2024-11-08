Return-Path: <linux-gpio+bounces-12693-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8829C1765
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 09:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25D6C1F231B0
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 08:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBF71D1727;
	Fri,  8 Nov 2024 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l+DfAR+v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503E619DF64
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 08:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731052979; cv=none; b=hSt4Iqp4+h8lvVxBJeRLytlIE8nRFk7PXWYEB0ICVoTrWuYTB+yTldgC9j0D0CdOWvDz5unm18pLl9zfKoFtAKj2XWuRprAFMLCmZ9u1VKnP3GGOk8tTxwsy80NDpf0nkTw3jTM0CVP+nSGcvAQrIOEqQuogc4ehFte9OfPfj6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731052979; c=relaxed/simple;
	bh=dUTRSMTXrdg5Zyft5yF6+XKivEJnOQQBelPLhQbyq08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jYUhF6dMa7HVzyL9UicTVzbdQ3D7YBQNKfjabGBHCHx4kDx+uLeCZPl2XvdWIiWuzWSoKa/fgGU9X3/kixmCNl6JLC/FokeNomZHgqIFufDX7135C5zbsVbYCbm/XHnibqRSyj2ZYFbvw0udbo7YoAo7zzG131yv+bq+UhlHlFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l+DfAR+v; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2feeb1e8edfso27088371fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 00:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731052975; x=1731657775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUTRSMTXrdg5Zyft5yF6+XKivEJnOQQBelPLhQbyq08=;
        b=l+DfAR+vndpMxpYhRy8VqptIQ54GEpn0doEYqzMrkNzWPZp7yvYjMkl+You36tfCS5
         2/I4eX/bFpIwim37svG/08ymFcZyn2Zc87TS264R4lSW6VK35TqkVOUmd52d0a3aTdRW
         LKjOji39FRwBPTY6FVup3upq79VSYMTS3KA1T5fMk33soccfK6L2jPh2eXwZ44BJauyy
         P1E7IWOgZAZmrNk2tQWSxpvJDTzlGW0e8/CxrhrNW+W/S3KSauB0pd96uYz12xarJ8Ui
         ZlL2DHjOM4FXUMR2VIUFMaYoyZtUb+ugQAcUG7sTGUyMOUxXSSNreySONUUAY/NmNvTs
         k68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731052975; x=1731657775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUTRSMTXrdg5Zyft5yF6+XKivEJnOQQBelPLhQbyq08=;
        b=JOt6RYnLtMsL6L0uUVADUUoYqTQzbLGNmyYVkc2n351iQ6TGzShaxosgUkNZR7azcF
         bMR7XWJST92aZR+udX5ixb6Koat1Xx2j9LC/4SrXAlkeYj7ncE181lbM1rwxL382GhIS
         vpYqb+9bn5/7S/YAuqmTrFrF7JNJp+6cXY+a5gRubRu5c9eQL4myCgKyoSNXkpX8n1xv
         7Sef4Ug6wtOZRA8vxD/7OlK645X+jzpC4NscXfgaheYfMs1iTDWdOpO8Hpv3zwuFYYOA
         Pmu18S+VSdBPIrqswLsVhISQIwzKg3m4MvX5Tq/u3g568S7xd1xplFVfkOJG1ijY3uqw
         r1vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDqTwFLyEB3NFVCDNMl8LL/XbfmRGArmhoRZZNXVGYtMvmzT/VAgm+nNryrlFPFK8xvTfWnLk+dMuP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxeo8dU1jWMV1cIxYY1pD1YDPoVAJzHBecS3MpMoZNcUCnmg/zH
	jtZJT1sHpdWDUkJX3oMzGqZK24/P3/tq+/ak8WKm+SOYJBjhlD2CXVzBMV/rk5ngOV61yysUqKt
	5xgnvwh0Eb8TSUGg0Wfud4fpAACuu0QKel+I0+g==
X-Google-Smtp-Source: AGHT+IHU/p5ucmbmja2ZUVCS8fngsFc6zkmCp3xSAKppUYK59btpa33qjaOf6+2FVOvM6vBZDak2yrRRRPxlKbfHz7A=
X-Received: by 2002:a2e:9b96:0:b0:2fb:3881:35d5 with SMTP id
 38308e7fff4ca-2ff202ac3ebmr11214621fa.35.1731052975268; Fri, 08 Nov 2024
 00:02:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104194437.327430-1-robh@kernel.org>
In-Reply-To: <20241104194437.327430-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:02:44 +0100
Message-ID: <CACRpkdbiAKX-o3GYqVP5bz_o-GhbvgHLkSDM4ZMXgMMteaoKTg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use of_property_present() for non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 8:44=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:

> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Makes perfect sense.
Patch applied!

Yours,
Linus Walleij


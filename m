Return-Path: <linux-gpio+bounces-6652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D08D0049
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 14:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E3852852E9
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 12:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05A415E5C6;
	Mon, 27 May 2024 12:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mROal7UP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0256615E5AF
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716813744; cv=none; b=BYiW4l/UGZl0URtJlybj2RdR3OVpAvEyLtG3LlepYJpJyOOK7CXmqPOhFQd0MMgGdHl+NWVDrLc8yDV12Gws/CAjONyWv3x7SKffCvGJWmjK4sVDvFTx2jRmHXYXwPh7PUlvgA+U2+z03cnfYmZP68LYp0pT/prp0XZaci8hv3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716813744; c=relaxed/simple;
	bh=gvmIvei/evck27eAyXPfMfAUpIW//VOl8Dual8yqM7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b3tj+wLJ1pldLxyBKf2U8RlHUQmCfslIQQZlRJJJuh3QLUpeJZL5QDszv54s7aETEWf4lRYbRFeuYr1wV3mNyVnJBULKWb42QfiKuVLH7mN8vaw9+XQUDI2e4VVAIAMlyPTnoDYOiaQtSZo8LUrxO3mjyeXF3k0jalmrQjONpPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mROal7UP; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dee72970df8so4113948276.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 05:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716813742; x=1717418542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RreWtAd7Wi7xpCgHNvoy0257vlpp2GBbsNvbWW0dsCg=;
        b=mROal7UPeV2+tDOeg7vELm3fdnAOS2UtsxNIQR93+IGkKg2PeHQ4YyjhmoAj1aa3/r
         A2yFsVPYqHOfW9WEXIA4MbOetgHi+ea1yB20ZLG1PmNmtQIDaQwDPsvbcPYe99ayKRIX
         VJZmoV4mFCM4bOFV/bWoNX8qfELEM2p2r7jBu4tiITj0KXXrxcPSaiA1MV/G4vjTM0lB
         mVlC9FSYngw4/VlTY5UqiDFXSESXuteL3bfKTpkB5dekpP7+G3DSPHGc6F0MBO3Jvn8d
         JterMso9fM9vfabEGXWrp+WvMOLCpmhal/pNqcJ/vHju21Z3joHdTpUD/tmLzcUO+skT
         sbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716813742; x=1717418542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RreWtAd7Wi7xpCgHNvoy0257vlpp2GBbsNvbWW0dsCg=;
        b=L7lRskwqRRrUaBCOr2+aCdEQHx/av00OCHutomvXL/pNGHFHsEEay/EoAbyt27YLQn
         xk15D2AmwT09z/WSVfCQ8nDIPu8v0Z82Zwj2L6I3eyl7s8aOcEbYA4YgfG4W/8t/+WAD
         uPryrS6RlSA/IR6s/PvTIASetLh9hX13RvOy/BwLBG09kj6RMk7KnLNH330qB7W2S/+S
         Lstvxbb6A7a8CUtaK1tluqz3nUqTGznZ6F+zYmvRw2EUtP8A+6CFqIo4/Y5N3p80szc3
         q1ND6pm1cSBA5+i7A77V7BpB1kS3RVrmp/cKsXAWK4xiDsXLg+n1JvHM+KP9I3/gL/rV
         s2hw==
X-Forwarded-Encrypted: i=1; AJvYcCXsUSGqLK2Vn8Af5U+x5vo54GmlRjRgaHOzZUAJwB6NB8z7DT+QKGcKqX5XaojLaUXqviHHeYyH8E4tqISjbh0xztdez/o2zgrIhg==
X-Gm-Message-State: AOJu0Yw64xxEzsSSNMH6OP5SJORJ9+R7H4IXxMvfQVOvj4FXjoBekWvK
	FXGf4QLDUNDthBrxAvbrSIkxX31aX3T49C4hjCKByAmcrLQ//XydIUDBs5x9yN4K+wIScFQpjk8
	9CgqESy1Rk6K+hMjpyz2jXA9QbxwY9fbmXLW5EA==
X-Google-Smtp-Source: AGHT+IGnKKyNaK0erydWgd+7egLyO1LEZVbwIGZL84HNMIAWKZun14kUnLhTrRDtqLO6jO06aGMtpPufyBXFe4UUfcs=
X-Received: by 2002:a25:c302:0:b0:df4:d98d:3e4f with SMTP id
 3f1490d57ef6-df5422399dfmr8673203276.12.1716813741865; Mon, 27 May 2024
 05:42:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240513-imx91-pinctrl-v1-0-c99a23c6843a@nxp.com>
In-Reply-To: <20240513-imx91-pinctrl-v1-0-c99a23c6843a@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 14:42:10 +0200
Message-ID: <CACRpkdYP1Tp6Cxn7xMNusZi=DP6LPUUTaKOPzW4FChu3oEbkFQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: freescale: support i.MX91 pinctrl
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 11:12=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:

> Add i.MX91 IOMUXC binding doc and driver.
> i.MX91 IOMUXC has similar design as i.MX93 IOMUXC, so reuse the
> i.MX93 binding.

Patches applied for v6.11.

I haven't heard much from the i.MX maintainers for a while I guess they
are busy.

Should Peng Fan be added to this list?

PIN CONTROLLER - FREESCALE
M:      Dong Aisheng <aisheng.dong@nxp.com>
M:      Fabio Estevam <festevam@gmail.com>
M:      Shawn Guo <shawnguo@kernel.org>
M:      Jacky Bai <ping.bai@nxp.com>

Maybe someone should be subtracted?

Yours,
Linus Walleij


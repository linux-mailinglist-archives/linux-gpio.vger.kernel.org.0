Return-Path: <linux-gpio+bounces-27041-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6B4BD333F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 15:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 29C3C34443A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 13:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D19E30649B;
	Mon, 13 Oct 2025 13:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gv9plx17"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8912FF642
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760362092; cv=none; b=qN7z+LQtceIoj2IQEBx+BqeKpPY1QjavjVNwMy4++EGf3aH9lptQjKLxU/O+Sw2pE7RnZCGbWeNBeyeqT9k/+cr88fn+dlrGBkyTmmBeGSoS5LJrauAtHftyzSAxED4/3pI+iYff2DIcL8GkuZFBIL9FTievlzHno1WqQWPNqjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760362092; c=relaxed/simple;
	bh=TCpcJBzt3HXWbE0TqPgkXkphc3fKiTL00tff0CRSHVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQlAosBseaF6EPZIj+iQHaac6evV40t/xTCVADMOj5N9qCRLxE1bdqn0tjmGBWkzGxILHZ+xJ/NNgeTLvGEFcfoPBWexeG9lMNe194xbQg8BzIeMhJgaZmLxhJPGqE5Vb/ql/iPjKkOZbaF3mbjT4EmnULLh0Xt0lAJpbF7qPR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gv9plx17; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-36295d53a10so33497461fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 06:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760362089; x=1760966889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCpcJBzt3HXWbE0TqPgkXkphc3fKiTL00tff0CRSHVQ=;
        b=gv9plx17pEiS+EkBGJpZ/SyeAHmUfIlBigKhPUbxCyqRcCoeXIjPdp+hY2aXZQ3Eex
         G46nxphidg3ABVP7Uv+V6wlrtMdi45WHRewTnMkQ8kdwvQrkKN9CdAEO7BIWMraV8OMn
         TqxBLz9tkl9kakYhOGU4+j2FlT8Wk4f9Bb8S2ExlnTKEHhia4zFDJttMyuus4xT3NQI4
         +RXh7W1tpPFpC3r2zNwOtxBuQ0LPPrsy8Rc56YigshKDETudRTyF3L3nuG0wJK4mYc9I
         c6qLbVaF0T/samWllup0AvOSa4XgPwuWMOG/J2dxJbQJb/rOmvFrZkfzQv0jUx9c6GXU
         NLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362089; x=1760966889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCpcJBzt3HXWbE0TqPgkXkphc3fKiTL00tff0CRSHVQ=;
        b=wamUZvaFxu/wyUVAxJ99I8pgyusJGe5rf6eeURVtZioDzsgqRrrgMq8lvAuBRrdlih
         IVKls2c//VnDsW9lmGMVa17NWD9dtWn1XgUFq6uP4oprhL/zKE5ans4rqTRTqd5Qd5Ix
         34JFk6kNTn6zj05XYf2aqH3Btyk4XyGP0u8dKsr8CHFvlSv0XYPKJ/+xTKvsOeJubSXz
         CeP2lu3MKYzQsWwjdAeOTHEw/rnMcvib/ONgXpd55vJ5JlSzyDZoIcIEEknipSMomlVH
         YbBL266Ccs0ywlsg2PVOykHoobrU1OTCi9PsbA80/D5dNmTEiIyUaseoTp/0+MAFKF9b
         Q0rg==
X-Forwarded-Encrypted: i=1; AJvYcCWb0vNA0OfKg/sGKxt0HYT+Rimbh7G+e3Voe5JtrgzGuvtRy3K+LnG7Z5+E9QRRfdcrGaJ01doWSbfV@vger.kernel.org
X-Gm-Message-State: AOJu0YwWTuy3pWUFc+tz0rt7g8kKLxK0cg2KA5JJJXLv/8pUVwgnjRdL
	mEUqPPDZ4Ay+0+32FdoVCU9AnoK66ZBbKr6lxjUa2FdH8SPcTewy3rwH7nUhyefPnrLxYlrCl1X
	mVofGZpRqJ4yPREBhyApTvQ3gxSmOwcXTtxtO+yLfiw==
X-Gm-Gg: ASbGnctQKazKPnDWd7g1q5YdHCQa8rITO11lU/NOdqshuSJzIX55o9n4ILdi3hawk2Q
	Tks/XOaS5oSo/F9uFaMinm5fXfL5AhkNFfzBZlZ0sq1g3Isi6CKlOgFnJrysG9yvMXWWkjRkS1M
	BaVBz7FwfPQKQwrP5cOPktt9+/qf3ffb29SQkXggN998CBsjApJquwl/dJZHwI5booz4hvO3DXm
	sKkdxQve4lL61u1q2zgXvlsIlXOlQ==
X-Google-Smtp-Source: AGHT+IEuC3uWreohj3S+OBKmbdTWmAhPpTphQzDPpWDlJpvqlnw78r/6/iGnmmf8C9Fpr4YtuqStpXMM8FvmbRHGKAY=
X-Received: by 2002:a05:651c:1992:b0:336:72be:3339 with SMTP id
 38308e7fff4ca-37609e64b9dmr56919791fa.28.1760362088862; Mon, 13 Oct 2025
 06:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-manpower-glacial-e9756c82b427@spud> <CACRpkdYXh2MCs=vAif7BpxfYVRuDTkYYNwpV2t=J_ZRW+N4Vyg@mail.gmail.com>
 <20251001-unfreeze-ludicrous-9d744548bf65@spud> <20251009-amendable-trimming-da31551d730b@spud>
In-Reply-To: <20251009-amendable-trimming-da31551d730b@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 15:27:57 +0200
X-Gm-Features: AS18NWCthi_sQuhnDEU35_vHT-Z7ycwcOA1ZjAB9Zqs6xKIeB40fACBw2G4Dpcw
Message-ID: <CACRpkdYssH8zObJTUH2VVB7FrVFmJUd+Ea7etTGbicQgkuU=CA@mail.gmail.com>
Subject: Re: [RFC 0/5] microchip mpfs/pic64gx pinctrl questions
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 5:55=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:

> So, what I ended up doing is moving the "gpio2" stuff to use
> functions/groups as your gemini stuff does, so each function contains
> one group containing all the pins it needs - except for the gpio
> function which contains analogues for each of the function's groups.

I don't know exactly what you mean by this, but if it entails any
entanglement of the GPIO function with another function, then
there is the recent patch from Bartosz in commit
11aa02d6a9c222260490f952d041dec6d7f16a92
which makes it possible to give the pin control framework
an awareness of what a GPIO function is by reading hardware
properties, and that it is sometimes separate from other functions.

Yours,
Linus Walleij


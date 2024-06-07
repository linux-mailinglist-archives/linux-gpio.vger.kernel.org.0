Return-Path: <linux-gpio+bounces-7267-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B63D900D21
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 22:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A509D286B8A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 20:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C561552F0;
	Fri,  7 Jun 2024 20:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bh0nnY1s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930C1143864
	for <linux-gpio@vger.kernel.org>; Fri,  7 Jun 2024 20:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717793142; cv=none; b=uxAGSQUpFnwiXz5waYpeUS4bJBkzkH3HHQAkXyMRmC9IlavX6SxxNzvjx735FooYh7YWZVi/rfKrCh7n3JvJfmPRXRKX7UdXjcpGvRFOLIbtE1QwlfKq7XZ0U5k/dXQlJVF8KTtFzB3/7VBH1NlmzF5vOe1qBdOPxNsE1uXn1BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717793142; c=relaxed/simple;
	bh=tF+lqoc7ry+mrtN2VK1nYhL8pQKe3mXizJvWJ3MmaUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpDjdX8PDNdzb8pQCbfw3a3QT34LyfpKdBMYSqGBGqPjj0MCmBwDsqe7uMKIW19+N3NO9Vxtf36uwMwalylTSnAYucK276Vxr9gzq/7ZcSwOW4LsXwjSXCUAXt/Gn+3c45h7wZiMnqovIeGOHJjYP3x49+GfpzfGMD07LgQVTsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bh0nnY1s; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52bbdb15dd5so1271517e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2024 13:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717793139; x=1718397939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/8+vnKbwdVGwXWCUHLo+YQ0seiC+NwOuFIt2xs/BGc=;
        b=bh0nnY1skuGN1nG46aMxT+8Jnct0f/S+DlYGDMdoIgyjiCpJACTFeQElq/ntLyzpSx
         KvURzE8tmom+rzH2WOyH2svElrpZEFruOdt9iKSpAdIZJ0FolOp3W4R9vLzBPSLB2JEE
         ztNqnJgjJqP0niaFxe4ni9/uhQd3N+9XJgcpX/UtB/NCJisZ0fcb0qPS5Z6kxgJYu79k
         hl+4mH0NDJJplPw39551hzAfbvmQYm+2xeBarF4bF8Zn6hjBO+3GuvdAF/hsHZP1WllI
         NAB8uzM5KE2746625wSZ7UyzFHtkPhExFWKp51AH3eMOsIlWxyBBLuurA8G+Kdj7TiY9
         F8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717793139; x=1718397939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/8+vnKbwdVGwXWCUHLo+YQ0seiC+NwOuFIt2xs/BGc=;
        b=w1zjMrEN9I+zGbv3oq8VVowtwMGPtYrHHhZx8h2DudECVIpZLuZsmSdfTvqjzg3Jop
         METQGKZRUqUd3jZJt6bFa64tFdOrCC3YvL93A8UVBkCNilo+fpvcADvUVXEOouUPxuU0
         XR3do3WeEUMaDus9pvWZEm1b+jfGs1EsANzsTWqhIa+4mFXIl+9AaBSsUaoFr2hgCe5q
         5tRtCUlovZINRnJ/+9JUxTJ9dtGk0pxyrrhrz+IWYpflrN6Ng9qg3qOuskFmOt/7w+H0
         WetmEMGMOdDDHGbo7Lo7CN4aA+0/BN4PXFEIO8SnGJYDCjPpSaEo+hLp5ruTMQpe/36Q
         4Nhg==
X-Forwarded-Encrypted: i=1; AJvYcCV3nHo1SODZ5zvxoLS+JKEoNRpNwJn/393364tg/gy8kf+s5zt86O5x6YYc7OLWzxG9c78q1jUl/YhOFzOD2WWFjnr9y05D2MwMyw==
X-Gm-Message-State: AOJu0YwKjPqvySalwBGSiql5QB2pe+PNNm2IRQvviuGAnQ9r+SN35OtU
	5Bx3Mc+HxBngUpK4igSFNjDq2k/M31BvPbH5wuEIAKhWfkdab8fvAuXNhVw5h4CfcSZO/0t8oKR
	YNcfiW475FjoxwS5yk22aVGpJTJSmthnV6Zij5Q==
X-Google-Smtp-Source: AGHT+IHd129BNp9Srlbj4xlaokQuMVuM4ydYbqkksSF96LY5Xo8WmbmTC99Ge/pqhA4iwFxOEqgvchTfrPRAyuItoMw=
X-Received: by 2002:a05:6512:689:b0:52c:7f25:dbac with SMTP id
 2adb3069b0e04-52c7f25e446mr10179e87.20.1717793138663; Fri, 07 Jun 2024
 13:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1716974502.git.geert+renesas@glider.be> <a30fa2c5e0d07752692c5a69f5a5fc57ae719c1b.1716974502.git.geert+renesas@glider.be>
In-Reply-To: <a30fa2c5e0d07752692c5a69f5a5fc57ae719c1b.1716974502.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Jun 2024 22:45:27 +0200
Message-ID: <CACRpkdZETWojdSDTT+ownbPtsr4LipT+eDxRA8YjQdGSEmEGdQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] pinctrl: renesas: Add R-Car Gen3 fuse support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 11:29=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> On R-Car Gen3 SoCs, the fuse registers are tightly integrated into the
> Pin Function Controller.  Add support for them by providing the
> rcar-fuse driver with all needed info through a platform device and
> platform data.
>
> Note that the number of fuse registers on R-Car V3H and V3H2 differs,
> while their PFC blocks use the same compatible value, hence this is
> handled by checking the top-level compatible value.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

In case this needs to go through some other tree than mine.

Yours,
Linus Walleij


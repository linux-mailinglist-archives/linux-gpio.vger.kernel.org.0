Return-Path: <linux-gpio+bounces-5410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ECF8A2CC1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 967211C215ED
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 10:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62043FE3D;
	Fri, 12 Apr 2024 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wyYWXuPo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23B941744
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 10:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712918689; cv=none; b=d88zhDIyhnrWgg/IjdOQh4dYEmDgQFzUi1Cbifk2lEqLsgK1aU/3hgKtNUjJLjh9LFjEqZy4Sb4lDQCNEwWz5ChetnWwlFKFDHpDINa6xDevnYD9JcCnRZESRFgmnEfgZ2YV1eaT34TfUitBNaxUrrM6EiKpz7nYniGCl7dNMAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712918689; c=relaxed/simple;
	bh=v7mlEGcz7mNkeBpLcHL3FGgewkD7pRBBLfHoly2Kz5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=DXdo3gIOB7DOKZ8wlMAFzlixAiY/4WT4k4C3X1Wmvr7F1M4DXxrzcrF4ipDBiTdNoKTeA+q0YbW0G4pimW4E/EWq5JCfVH4jA2RgaxKa27inySS7henJtCUsZFN+mGPiYViejKW5+b+i2VUUTokdcpXG0OVEqSemuC8wfK2rtKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wyYWXuPo; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso751024276.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 03:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712918685; x=1713523485; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqlenMfbXI7u4QjaxfgU8oCjAPQSIsIN53pM+qheFN8=;
        b=wyYWXuPo0dfDLuWrrgtKfwn0Fay1fwGgWeFjRyy4PXTqq653H7hxFiwZWFlcz2DXGj
         1XdM53Gf2fZMDSWWvigysSpsCNcWgBuQ+0UMu8y0UUA3DLVbq8qK+h14YnZQR5UfgB/A
         aVTBMz7U6c+E0wpQY2CZlOeSZNMLfYhTpVgElP2NT+i+H+s9kBMq7HWFa62i05JWMG3K
         r/Lbp7qLBgJfo3TayokWWZM6V6USvBpDzHigpoB8uhT9JWdhX1V07PjOHr0ORK1ww8Mj
         Fw/cw/2X8J+3namHbLEz6ppXVietKBxAhFdunwsmrA4kC/8QcCQJFF2tRAPUtK5XRGzE
         QdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712918685; x=1713523485;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqlenMfbXI7u4QjaxfgU8oCjAPQSIsIN53pM+qheFN8=;
        b=tFWxDO66Vhiq2Z5Suz+7IT1UKTGpev63P+scoGCELjuji/IlK3gzP5Lr8xVoZTUslZ
         rzWppTOZWCKQjNuVHWgfoEg6EA7yBz/GX/dMOhUTpWui7Pe3FBnZ3TNn7foQWXAq6NL7
         SEcR10CTBO7Tabe9um1Il3X0CzC/VZf9PIWyZA0OYC9pgSBp7O0NdDuG/PrdDUfXjr9p
         54a6WQyIF5+Iz2Gi2ILd6hQXYklSBLa8/Q5IDahWJBlAzMzTxklGW9+LK3Ya9VLMjqjx
         NYQxUjmwUtS5vU4iUdwF2AguQQhTwWFa+vtOJkiKDCI32+tpwovGZylvcMeFoOY3RymD
         5fiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZmMNzAyrDLtAMhX2xmoP8D3DKdrW7AspdfJIR91jNtAWS2rGjKo5PkFJ4m69dZHwIXXOYZgZQiVX0YseLGSaPctWsRbAS5SkInQ==
X-Gm-Message-State: AOJu0YwTDN2Mq7+raBXEyplrHMdmBRyEwW7gVMleEGuW5PMRjzPv947w
	NoeAsc7W6J/veUH7Xt0FZkbOG+b+KHAaFN6PeTnVlX3i0cQoGT9nyGHcVKRwjrmdHdlRXZaaYB8
	xMoUwYAg9PP0auXNzG9xU6njMtb14uvbzlvhoNg==
X-Google-Smtp-Source: AGHT+IED3ayl6UkAQC2P0B49UvTOP1CgyGKxhqTmGgKhH3s9wFkmjW9bev85ClbkNc6qjO3C+ZIZtAit7NY75/+rT74=
X-Received: by 2002:a05:6902:252:b0:dc7:4b0a:589 with SMTP id
 k18-20020a056902025200b00dc74b0a0589mr2026248ybs.55.1712918685648; Fri, 12
 Apr 2024 03:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZhgDCKhcHdwGoJ4Y@Z926fQmE5jqhFMgp6>
In-Reply-To: <ZhgDCKhcHdwGoJ4Y@Z926fQmE5jqhFMgp6>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Apr 2024 12:44:34 +0200
Message-ID: <CACRpkdbTdGajQLSGDkD0cWRG+79tpojYkdyF3t0jD7_WEDtQLw@mail.gmail.com>
Subject: Re: [PATCH][RFC][resend after bogus] gpio-syscon: do not report bogus error
To: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Etienne,

thanks for your patch!

On Thu, Apr 11, 2024 at 5:35=E2=80=AFPM Etienne Buira <etienne.buira@free.f=
r> wrote:

> Do not call dev_err when gpio,syscon-dev is not set albeit unneeded.
> gpio-syscon is used with rk3328 chip, but this iomem region is
> documented in
> Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml and
> does not look like to require gpio,syscon-dev setting.
>
> Signed-off-by: Etienne Buira <etienne.buira@free.fr>
> X-Prefers: kind explanations over rotten tomatoes

If you look in drivers/gpio/gpio-syscon.c you see this:

        priv->syscon =3D syscon_regmap_lookup_by_phandle(np, "gpio,syscon-d=
ev");
        if (IS_ERR(priv->syscon) && np->parent)
                priv->syscon =3D syscon_node_to_regmap(np->parent);

So the driver will attempt to grab the syscon from the parent if
it can't be located from a gpio,syscon-dev node.

But it's not optional, look in arch/arm64/boot/dts/rockchip/rk3328.dtsi:

        grf: syscon@ff100000 {
                compatible =3D "rockchip,rk3328-grf", "syscon", "simple-mfd=
";
                reg =3D <0x0 0xff100000 0x0 0x1000>;
(...)
                grf_gpio: gpio {
                        compatible =3D "rockchip,rk3328-grf-gpio";
                        gpio-controller;
                        #gpio-cells =3D <2>;
                };

So indeed the parent is a sycon, and syscon_node_to_regmap(np->parent) will
be used to populate priv->syscon on RK3328.

So what you could do insteaf of the kludge is something like:

bool has_parent_syscon =3D false;

priv->syscon =3D syscon_regmap_lookup_by_phandle(np, "gpio,syscon-dev");
if (IS_ERR(priv->syscon) && np->parent) {
        priv->syscon =3D syscon_regmap_lookup_by_phandle(np, "gpio,syscon-d=
ev");
        has_parent_syscon =3D true;
}
if (IS_ERR(priv->syscon))
        return PTR_ERR(priv->syscon);

Then when you get to the code you disable for the flag instead of:

if (!(priv->data->flags & GPIO_SYSCON_FEAT_NODEV)) {
(...)

instead do:

if (!has_parent_syscon) {
(...)

What do you think about this?

Yours,
Linus Walleij


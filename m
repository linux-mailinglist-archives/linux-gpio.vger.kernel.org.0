Return-Path: <linux-gpio+bounces-23774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1946FB1072E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 11:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F530AA03EC
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 09:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A50E25B2FF;
	Thu, 24 Jul 2025 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MJDwGuzd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779A825A630
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 09:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753351141; cv=none; b=Dc0PBorL0GcOYIE0hyiixxhdfW3cCYa3pd3VyP+IDWM1a6gZYN8Vin+F3N5hgub8ycHMwtW7cCg8VeRS4alR3yLCkoXJMmD7IWW+XhnYe8Dtp0xwhZg7yW86Bs3MgA2jlYyjSdYwmfjdz1jQKLXz5pcdRXY9i8YJ2dr4JfAz6z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753351141; c=relaxed/simple;
	bh=3lDH5ARB26e8DbHF4MxQq93Rk0WGstJeVZQEGstfRkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eNab8yJfpYICvXVNMJfeChn7dE1Tn+G+k7fHHKH61e6mqN5R+QgXlAXhUFVwmSkImg0DKXCsFE8OP6lxuij8qzC2PGQpBfrQdx7T+QP2ONjQxaM/DM0fNnQOUgNgVem94oN5/2Kp24f1tdpUAky0ahoUjUiCxh672VmKmZQvcIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MJDwGuzd; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso850573e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 02:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753351137; x=1753955937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lDH5ARB26e8DbHF4MxQq93Rk0WGstJeVZQEGstfRkg=;
        b=MJDwGuzdBt8lJEfC5oMMVj5dgKxNuAi/xNdia9i31OCMslYNVG2vNAeRuO0iAUKzgL
         b3J0gGVCbd+ivE/0w+/xSCJxTUi4kkSbE8IACHtpmhVNDZha5m/d5G9FgrsP2qlowuyk
         yYWXslIJQsZ71G6vkM06Te+OZ+/L6ZQjzl508=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753351137; x=1753955937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lDH5ARB26e8DbHF4MxQq93Rk0WGstJeVZQEGstfRkg=;
        b=wY8EkbiVWY8oCDMEFI2DPZ95PfdvKSn/Hw5F3hZxMiPFLSrqHDfi7ssGdPraIy5AlU
         ET1She3PKDv2ExsOc9zJZtqQrLO+wZWnpBj6YyGB0n1Du8IsAw0THBFkGPWHS6BhFa2V
         50IACZIolr0Pc1JfCg7R3UV3mF+ID/GGpbKxWdG2FbPUVvwRG6My8N5sGUIe3GDGuLA0
         5Lx+BVfqkdmr/rns5wOD2qho9RjbRPiACilznCwGVHR56Jk8lXm6CvroGXrcAHL11Ewn
         Wx2bEpCG9NQOKq/QDhshuoeLnXqdascQ3eBuQlCYJgyXBpdKz/nNY/lakICNEALJUt2d
         Hq/A==
X-Forwarded-Encrypted: i=1; AJvYcCVautfPIstkkRQq7CcDyGQwOtD6lEfP3l2ThkQXX06PC0kOs7flGvNqwBo2m6ubTaYss0Fticwswuub@vger.kernel.org
X-Gm-Message-State: AOJu0YxGBCdWDYeq+cNI7WrQ3m0XbFVFS56IqLhf1Ol/Pb7DUkcyiU48
	JPr8pMkePRLN4bZJXuGMmVXG0P9ZkqBO0ay/P017XJ78YvY6GOUjD333wmS2nldObDy+Nn+1Ww+
	BMYeKOoG7RV2hZg367TkWCr99PIu7gpDVjFJDKM//
X-Gm-Gg: ASbGncvc+YXQDXhbqFVI2VIlPeHIioOHiByW0SvknVZV5o4lMVz3Cu2IIWJkeO/4Z+P
	5WurZcQwC1TGFx5Zj1BTUoXJRABBARmjADUIUpoudBTtnMgAwHPp3vZct+IKO3GX2cUmOgNbf49
	IealgJLDpZ0Og78/FH9/fttuY8UmH0uqUYufJ4gnrhXmK8hGSuLrKGPtWph6Ek+z+r5VL3N9G1Q
	UA1EYRpwKKfesCDKYp8Ud98ZgVE0Bzddnw=
X-Google-Smtp-Source: AGHT+IFbWpnNaQRMkmMGCWJwKWLSFPCgKrpUVJhkWhmCg8wuzEAglTGmiTQG4cugbeqoeX5uFAZWT86WnfNSaUywLGk=
X-Received: by 2002:a05:6512:60d:20b0:554:f7ec:3b23 with SMTP id
 2adb3069b0e04-55a51359f3dmr1559012e87.15.1753351136563; Thu, 24 Jul 2025
 02:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-37-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-37-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:58:45 +0800
X-Gm-Features: Ac12FXwhroXh9igzrCvp17h0_fa0JxIrUDzrCtprSHzHickYMU-wGcIvqxYBtBo
Message-ID: <CAGXv+5G3kbSzs99mogy57mh+LUdi_87zBmFH8GQFWvROhLFbDg@mail.gmail.com>
Subject: Re: [PATCH 36/38] arm64: dts: mediatek: mt8195-cherry: Add missing
 regulators to rt5682
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
	vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
	linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
	ck.hu@mediatek.com, houlong.wei@mediatek.com, 
	kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
	tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
	olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
	arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
	frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 4:41=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add the missing DBVDD and LDO1-IN power supplies to the codec
> node as both RT5682i and RT5682s require those.
>
> This commit only fixes a dtbs_check warning but doesn't produce
> any functional changes because the VIO18 LDO is already powered
> on because it's assigned as AVDD supply anyway.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Confirmed this matches the schematic.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


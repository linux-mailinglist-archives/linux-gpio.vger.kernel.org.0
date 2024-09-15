Return-Path: <linux-gpio+bounces-10157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54562979861
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 21:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86E9F1C21373
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 19:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4411C9ECC;
	Sun, 15 Sep 2024 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Pc2zBNcm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA531C7B86;
	Sun, 15 Sep 2024 19:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726427802; cv=none; b=sry1N3ZoI456ESCk27JWVABliWa/XjwunUZDxtoSmNGPxyhtF3Hc5SjosMPFJx8/AF3h0XqHnL29xNJMc9woWzF643LtuG4XkajpTHAUiwoYBFWDEcmfhK32yDLu8t9YRWsGUjOBiTWK8k8F8kSMW9+rFLpxdPY4Onqng18Td3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726427802; c=relaxed/simple;
	bh=1bISzRPoZuznX6FBm87E7EImUCqRsCXU+FTidvkRew4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMBWRxOGEPCukF1jGhzBlw7xtq7stbBEhe9Kl0Bw8PWUmOuvmCzTY7md138b84BA8AZn0fjXFGDHjEPqG5u5KwN3DnQmaVp8PW6d+lumVuJOcvKM3zwiDnil+r7brmEp1lsrtsA985/A1pYrXHrnnrsaCFwoARHu7MA4geZAxjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Pc2zBNcm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2057835395aso43784825ad.3;
        Sun, 15 Sep 2024 12:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1726427800; x=1727032600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bISzRPoZuznX6FBm87E7EImUCqRsCXU+FTidvkRew4=;
        b=Pc2zBNcmGUdTM9ROe5cQREGIZarIpaDgj5RyBxbuXBDuHR7YNvv/lZ0IfbC5agYgns
         LGEJN0gM2MsQuamHvUIDF+XLsWw2C3igZ9Rmq3d4/zK5pUjg7dB4aUbAj0UOOZTCgKBY
         csxtIodaVGV70x3O1DngpjxI/oE3U8JiIpj9h/snHfyUPVu5dHkJ1w+jTBnDWemhYUtZ
         7Is6xrSZg5n+gkU1Xrxcd+Ty/I0AV3f8xUujKpvV4ZCKc68A52KpmkUxl7ZDXtkllQKF
         Dw5eMZITQR/NcgGV0KPOZPkLq/XL1YuX7649BVWSfQ7kBAA47d5cCSyfeJDszZxziwW6
         4BjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726427800; x=1727032600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bISzRPoZuznX6FBm87E7EImUCqRsCXU+FTidvkRew4=;
        b=u7lzEKNKXOn3UCgP4998unnzJ5BDDnd85PneKx4t/lVilJgPE7yzeWzOrCZ0OyzXSv
         xnGeHGKV4e1pwUQPbSaC/CBVZak8GdTbrpabxWWIjbwXT/lFPjC7RTTeaWZ4oVKUJ0bL
         w81bMgSBo2vvrYVVWlbqyp7KeyIenIsbd1sEaht2O1nhhAkhyEMu/pH/1oXE6Zf1ivza
         l7ufHBOxKto0QMNKNW4OJBFWMQvKdPSLnxzi8JwIXawCcCs0LElIedOJZoNkEjEwK+Du
         8xKcIVISRjldTKX4dFCrAVoKD5xsvs38PvEBDW4oTDByDmE/VYB6OeFZxSJEdL2WUlvm
         fO3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfWhLcAo4DdBE93YvoKfIB6MvriR8nbc57D2b1B2lp9g+Dsx0KkuNl3uOM3VhZ6IIYAq+YpuwLUFi73XDE@vger.kernel.org, AJvYcCWkzVeQ40k9BSryX9qh5ZjunPar54j4UaS8GMQvb/q0ieljV6XGFk631BeiXNpu4iCsjc+hJuu03zt6ng==@vger.kernel.org, AJvYcCXkExDbeZSWEfiol5kJ/e/vSTcNVk+KBhVQQVpTZ+3lT4V3h/gJnD61yHw4330//lO7kN+mJp7qqyQ6@vger.kernel.org
X-Gm-Message-State: AOJu0YwdNk1hyj57QT/kth7/ulOfthPHkIgUZ6heMKSVp1rSKK+ra/jy
	L3BSLgyDHIhyoiMVesbhJ86ci7lqGinngX5qHiwA3F2WVz89RWudH+MFZ8PrIDZ8brrOPqqqEMu
	Og9+4xzNTVfn1VKqvJQ7SVhPweYM=
X-Google-Smtp-Source: AGHT+IGKsOtUpIMhmuXU2ajV4HfqdCOucfhKlteJOKWh9G0QI2ecr3Wg/AUo4NExUndPm6QvKcwhbJFZp8UVHmKZG9A=
X-Received: by 2002:a17:903:249:b0:205:3e68:7367 with SMTP id
 d9443c01a7336-2076e34760dmr190006195ad.21.1726427799915; Sun, 15 Sep 2024
 12:16:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-meson-pinctrl-gpio-line-names-v1-1-4345ba336ea4@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-meson-pinctrl-gpio-line-names-v1-1-4345ba336ea4@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:16:29 +0200
Message-ID: <CAFBinCABU5mM_==zfMxETAAxM8j1qXGYJhDj87-Qwvjc+NJPvg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic,meson-pinctrl: lower
 gpio-line-names minItems for meson8b
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 5:24=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> The Amlogic Meson8b SoC has 83 CBUS GPIOs, thus lower the minItems
> for gpio-line-names to account for it, fixing DTBs check on Meson8b
> based boards.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Return-Path: <linux-gpio+bounces-6667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0FA8D01AE
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AD3C1C22AFA
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C1315FCE6;
	Mon, 27 May 2024 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UKKJ1hJp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E916A15EFDB
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 13:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816773; cv=none; b=T8BfIITgKVtuI4A8WZ3ZEYh/XTDCfcLYgSqzl49505W6pB4TNy0cmGroKdNuS8WUaA5Bp8vCFyCGWvlIdOl0wHNPJOsZHEsUfMWt3GTI4HZSpVH0Gov6ptTvV1dknV2IhrmmaNGEnjFBEWyPopWqFPJqj+eH2VtgwFtQlArVOWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816773; c=relaxed/simple;
	bh=re0qxFe2nuEnVA2exGP9LuAkNJPYPSelsBcOw7WJz7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uiAsCtL3d03galDi/i6X2DmYRIKZUzmABAGjV7PJa39sPZM10IdQjirq7lBIs9D5x/0L2SYqtEUuVdlQ7n6WIky05dgpqXbCuE9ebDsC1IodQL6gTXUfnohJq5lL/S/LvGga6JqLCQuy8dWn4wvN4sZl6FpEFw1gjMO6OZqu//k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UKKJ1hJp; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-62a2424ec50so13567747b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 06:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716816770; x=1717421570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re0qxFe2nuEnVA2exGP9LuAkNJPYPSelsBcOw7WJz7U=;
        b=UKKJ1hJpUbF14OX+9SWEvRMj5KV9+vR2K4IDLPVOCfEnulek/COiWjciORlKJVdGeZ
         Tt5uPIgxCJiOGa6saMCjOM4NlBuNWD979/eG3dceM2/ntzFjZHsfBz68SmzobLykdIOr
         2UDT5SV7TQ2Fbh5TaVDCbHHLLNNeNx58rRp6M6+nFyM3mlGSugOsRnUIImt8pWK0OQjy
         aFes90JMSP+DNN6l46x7hL8vI819LN71nCFFKdDTeiROLHCdIBAaiOfbC3J+VE35UJgE
         o9GT8hsoQ7BZex6w1x0NqiddkGe02wSI2yukkA5cXj16KP85lkkjZeEaLr3VMKuh9gKT
         OqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716816770; x=1717421570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=re0qxFe2nuEnVA2exGP9LuAkNJPYPSelsBcOw7WJz7U=;
        b=vuRZ/3ENiq5QVh6OwVvReCqMDwLnTxxDMgbCM0p7Mka6vgOlZ8LLfbeX63QfUeTG/1
         ab/58ucP+wnzV9yiNN7O/U9I0VtGm+U9LGmB+gdWM6QsI2vMGGlLlOlcRs+VeuQcC8kJ
         nj4pjuRcRo4l+w71I7Bd83TzWmUGWZcFEHV2cJOrA5axbZKu+Lg3+SdDcX5YuDdQH/2z
         LPn4jgqX1v9loEaYMNSFqDHuzJTjB9ZN1xpEX+iCPa2X2PRAo1f+zHWkP/BLHwyE1JN4
         q+nqmsJaFIQV7PERnqtckQaFYV3AEwpxQdxpUVX35CMny0l2SP/CiOHkCEQ6KzGv/EmB
         dCyg==
X-Forwarded-Encrypted: i=1; AJvYcCXoUVfm42D5/Cnav5pLN5hFZAMCZ7l7CttQTNdYVfKCaLh2Nnzze6onz8CHneoFgOKu3c1tQFHWqxTrmrSU9cKalHdr23WnnEA8rA==
X-Gm-Message-State: AOJu0Yyj2FTvBmqwykZs5C0sTvbJz9ve7SgsLgy9CYNUcWyo63uSn+ZC
	nTvfplHQH3MSGNYhVsbKzvGJqroC4qGlVbQwW6rG8aJZHJ2zVzimOMIFCCDHuO94ZAYec3TThZI
	bo4ShHAyCSK5oSvQKzTIbdfD50U3R1odtX8xzTQ==
X-Google-Smtp-Source: AGHT+IGz+uC/fA/a54O+l/V2P4epiaXRsMHq+gj8E8PqFpxrunoU60HcVV8bog04E9h4Gp0Ydl2e4lolznVLBOsTqNM=
X-Received: by 2002:a25:b42:0:b0:df7:9380:fbe7 with SMTP id
 3f1490d57ef6-df7938100fbmr4779513276.3.1716816769156; Mon, 27 May 2024
 06:32:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506150830.23709-1-johan+linaro@kernel.org> <20240506150830.23709-2-johan+linaro@kernel.org>
In-Reply-To: <20240506150830.23709-2-johan+linaro@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 15:32:37 +0200
Message-ID: <CACRpkdZbe31=7uL1XA=Spj4pOmLYpx+Bouwdo1t446hq_wGJ9A@mail.gmail.com>
Subject: Re: [PATCH 01/13] dt-bindings: mfd: pm8008: add reset gpio
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 5:10=E2=80=AFPM Johan Hovold <johan+linaro@kernel.or=
g> wrote:

> Describe the optional reset gpio (which may not be wired up).
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


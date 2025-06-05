Return-Path: <linux-gpio+bounces-21040-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE6EACEFB9
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 14:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EFF57A424B
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 12:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8513E225401;
	Thu,  5 Jun 2025 12:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vn7mUxlR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C11224AE8
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128247; cv=none; b=srehZQcbGOOB0d7h8Qs7a/pWPDpL+Ac5BSZJlXT2qSGjYANcsw3gquStL048WO3pD+epFOoTpEBZ8RAawkNCEOi0PnaCWq4GQ9alvfdJ5XkdTDn39j5cWZ4bAngpo63ot8FC93eAZDRbE3GolkPtjTJy7mKSde7bRBmXfIancgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128247; c=relaxed/simple;
	bh=dp0oUZbHoiqC69CUU3moHGnpZ4l39TaovVOwY49CM+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABcuJRH6Q4LMjPpC3X6+eZhGjLiOaaxA5JwgHSNQcXgjlA/0Du7v0KMogDdSTQ9sPFXZQtRo551YxMVqvK8isxifh278Huo4ir/OS72zBHeCchz3jEcO1SheNclG6AWwwFxtlySbZXqZ5vEfpNMH27cfV3VtRBoms9CRqmesLbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vn7mUxlR; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5532e0ad84aso1039412e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128244; x=1749733044; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dp0oUZbHoiqC69CUU3moHGnpZ4l39TaovVOwY49CM+Y=;
        b=vn7mUxlRdflpTOj+Pf9h6Fm0Dl5dGEFlK9pjKAPnan8AFHnwLq+6TKGggDeqbtGyrO
         5cbtnk4Kpdd9dvchLv5QGnmwL7LSGaR3OmvsrWT13zWRSaLcgWPQ8ZPXZGSy+CRsk0hZ
         NaCFxmu71OseErHcESTxxNzfnv1iGf3xfCUU2U+IrE5qcy9W++J4OHwn245j38RElxla
         mH6ba4yabjVinzeAUjP1PvzZTgmKold+bzopLe25z3XFM9SaXwf1tqP53wih1RfixaNi
         WGkT3Y4fgIKpIZ31dRXY2crpLx5a99+1S4ERkiG4dq2ickkWxoMnnZ0ma8h7iFOycTEr
         RHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128244; x=1749733044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dp0oUZbHoiqC69CUU3moHGnpZ4l39TaovVOwY49CM+Y=;
        b=CabkulslN5IKRGakAPLcfrd5xJns3365wgO/OozeUnAuNS9Mcjdpij/UgKOU2XN5Tm
         9dpBB6kaTNsioxgy6GXh9RvzKY5EUFrtD9nHbEKYt6a46epCic55QU+qCx3VsrKf/jC3
         tjrsNguGjbmOWa1EO4BSvN2FGD3+kY01i0emIBE/uDe0CiMYmeK2zCxcPCJkafegFFgH
         o6fvugg6hxaHnGhZ1cFj8FYI1HeI+cRHs+ijzsjDaN0GpkM/bCUxECFEit0ylqRTGosU
         JsTw/14gYXllX6+ZpWPxkZlcac+nQb9A6w90XDO/Qnx9DmmZViytLwMHvufZX8it3D4p
         iw1w==
X-Forwarded-Encrypted: i=1; AJvYcCXCnOojwQ1BOeaRX38nQ0MsBfdf8UJa2efMKipoTmgYwXAQvRde7ITIWhSA2v25Wq1Id0Fd7vWlkhqO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlel82E99diEfRua46LjraPx9BNAqiRf/rUBY29Psnc8C2t7Dl
	h1aHNvHx+UkiwvlHZg73AfIcYGO0iLaWX8lAdRvv7GdWdZgr0G2G2Ja80WAudTL9hW9Tdp1VVyI
	gXbam1PDnpCdGOdpevm61Z0ShKJ80kf6bmwacquhZLQ==
X-Gm-Gg: ASbGncto/zzz4Y/wGEpABsP3zNU3BZKbEvdvesWBbGCxaQ8od6j+nFyTmH6qg6gyYde
	gK+TpbwXAhyB4uFAFZAFfyf0sSQkjkZk3ClBNeauGvmoQTNFA1oU0hkf87zBlopEK14JV/V0eXp
	aXqxyfrbraleTHsqp7XiAV4gR8mwWacXC/
X-Google-Smtp-Source: AGHT+IH9Fc11r+z9z+t3mefrHIVAfP3iFGxFMGaJxOiqNg6l3VU72qxYnBUmiH/fduZ1DDpbUCP8vP1nlENlTDvVodQ=
X-Received: by 2002:a05:6512:131b:b0:553:2cef:2d2e with SMTP id
 2adb3069b0e04-55356bf062emr1989659e87.22.1749128243632; Thu, 05 Jun 2025
 05:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com> <20250523-hdp-upstream-v3-8-bd6ca199466a@foss.st.com>
In-Reply-To: <20250523-hdp-upstream-v3-8-bd6ca199466a@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 14:57:11 +0200
X-Gm-Features: AX0GCFtoxtlGiRHxvWStpchY7_DopJKwnpQcArCi5YFUYLwYh-hGYulMuAzYZ6s
Message-ID: <CACRpkdaXY1=v_HY9-PDZ=HYwJrP7P8ncZoCDm1da=vxoEazD4Q@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] ARM: dts: stm32: add alternate pinmux for HDP pin
 and add HDP pinctrl node
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 2:40=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> Introduce hdp node to output a user defined value on port hdp2.
> Add pinctrl nodes to be able to output this signal on one SoC pin.
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>

That's nice, this is exactly how pin control is supposed to be
used!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


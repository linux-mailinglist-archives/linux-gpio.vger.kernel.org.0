Return-Path: <linux-gpio+bounces-19188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 799EEA983EF
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 10:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE6E0188B3B4
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 08:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDDC25D8E1;
	Wed, 23 Apr 2025 08:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q8dkRrXC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACCE1DE4E6
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397769; cv=none; b=XarXlRRn4R66zlgrnpVcO5BZJVqPwdranfVTksshU5iZGWmYsBlWiA9sr86xCVa6hz0aUG/12Co+X7NgqEZ0IzlxPyDDwHCfgXKrkU8E8VkKJ8oAbucmFXN49VJ5VHpz8YFrYB4a3oDkA/NHLvJ3BnI03cMWssMgfUThXUzqzFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397769; c=relaxed/simple;
	bh=ECOXHvPy1m6u83HyWp0b6PRWuYparDalOzZlX1hnZOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/ptZxU4+VhJIFxfKNWyf4r41XGCkKCCmcbIcW+uIvV5nA+2Ns7IM3jXcZJK+D608hZQqT3U8nxw6cgJhG8YTxVRh6gX6o5dUdWhlkMfWBTUaHolijZQFEmK/E2q0dMQUJV2BdtcVQBC0XLq55aRNxxrtiLlG2zmVqJFgetig9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q8dkRrXC; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-549963b5551so6618303e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397765; x=1746002565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECOXHvPy1m6u83HyWp0b6PRWuYparDalOzZlX1hnZOQ=;
        b=Q8dkRrXCR30NI7Z2l38foBGD/QbQlPEGtzh8rKRux7Z1GglbLI8A0RbLoxnX9C66xn
         ORu2tzOpbOzDVtsP/ZD+Xa0CCCsoRSpzgyeweBJFYpiC3JxaytSPOXT7iMt6ERtLZJVf
         +u3G6f3c4qku35Fb6I/LuMX0j+rGImQ8p0so161mcdafn9oWTt7cYttPQEO47vrK6R79
         NKzzB1DLHZg/0auJGupS2l5kRQl/SIJYo6Xtq1Ew3LAsZNeHCUk1lWxpg0WNS/+XvWwL
         LpoReHQGhvobcG/tADcpbqFzASFkYRzndWk8lgpzz7vFk+HF7M2ZPodzf3dW6fduB0dn
         hU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397765; x=1746002565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECOXHvPy1m6u83HyWp0b6PRWuYparDalOzZlX1hnZOQ=;
        b=e62kFbXYKsH5mAM+xY9UnbpwzwXALIn0GrSHrXpcKVRQP+PQvZGPdrAzp59ZxmJrQV
         DXUer2xcFbEXTAKqdHgKHWDIY+OxYx4gQIxRb9Dp9qHynzy3aVMd8ejKDp6woRb3fAzd
         LyiCeQ2Ul2ikRurA7DFUhchAZw7+AHX1xr4TrWigCoXtSwk/RsWkupQl00Be4+N9z2E+
         8d11xng0cVd89DvLjYzlVGpZLJtnqrLHFOHT495rOYnrx9YNkWdAkO/o5+Rr8/26OYOn
         UJkieq0WmCov8LbdaiG6SyUS6F0R17r6mPjSB4PXzoRWtDY1ebFD5+4didcY1BVSyUGd
         fvuw==
X-Forwarded-Encrypted: i=1; AJvYcCUwbgoMkGnBV9HSNNPSIHgRXdA5VBOCu5Ok+4bC+BOhDbfs3c/4p0REoB5QX/sqE8Yj4WD13z2EhD5j@vger.kernel.org
X-Gm-Message-State: AOJu0YwzHznb2JQOxVA7D/FXLR2i+H4bADy7gDzk7vURYCKcBYi6FiPR
	4a3eVX+jgY1hDxDCyopKSlVd3bnj0xTnBMmcH5HUaKnM2Xe0LW1KcMhA9nd9ypQZytYb+o1vFr2
	7QA3cbgHdJ4hycdPp06w00p3UXtf/2ad1kSNEFA==
X-Gm-Gg: ASbGnctacbKXYDFChTw10Hc6KPshAs28IjkSA8bHbQ1L6+T7DyAocZInsGqY84MYvQg
	bMzMECTJmLn2bl1Oxp9EtTIZJoL/7JfSSLZwbBOGaUmqf4H2Sf+7U3B0vhX4U+/0kR0SrfDRi+8
	QRidmg4j7MDmlH+YejF6FvLg==
X-Google-Smtp-Source: AGHT+IF/9nczjT+/oWrcGPQu6RRK0VMd+RPdPyXG/CCLKRQHhZRImrCsqO3mNIzSHj966SqZ9meSOpaq1WCgkHTJSBc=
X-Received: by 2002:a05:6512:3987:b0:545:a1a:5576 with SMTP id
 2adb3069b0e04-54d6e62bf8amr5062499e87.22.1745397765600; Wed, 23 Apr 2025
 01:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:42:34 +0200
X-Gm-Features: ATxdqUECxAVIQqbFYM6Ibi6XkYyTlVovD9mEdGmf4ii6T1onYXMYyalIoDjWE5Y
Message-ID: <CACRpkdb-+xhugxuAif_X0KyxOCgRr5LihzF0pUkviUzwZQTYCw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: pinctrl: mediatek: add mt8196 eint pin
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 10:42=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek=
.com> wrote:

> Add eint pin support for MediaTek mt8196 SoC.

Patch fixed up and applied.

I recorded Cathys affirmative reply as Acked-by.

Yours,
Linus Walleij


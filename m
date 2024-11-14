Return-Path: <linux-gpio+bounces-12994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 537E59C8426
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 08:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC6B4281BD4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 07:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9A91F26FA;
	Thu, 14 Nov 2024 07:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C24ciOZ7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC05733CA
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 07:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731570459; cv=none; b=A2eO48MxzWDf2yaGC5q4XV2D6E5+z71dBjV1R2TliGrziNQGrOsVs/gSNc+qi41EG8tUQGMmQXZuCfXDNpI/deuwyLVrinfXsapX6ITFXCVWiXqnnlqP5Zu9cW9Efjz2NVU74013Iu4OAIVsqKUpFw0/XX219X0wsCGBXmaGwkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731570459; c=relaxed/simple;
	bh=jFdfNde6Cu4HZZRJGhBmYw0C1vVGtrL5T/K+xwwZ07s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHPt13f/rvGNevt8UoLIAU4DLBqQ+uZUSXAXYmrRElNC331+yARcXC6Jsnt08aghCQUspboPryKsI4z1r/rNFEeO++/Mg3Azv4dueQj2HzlGRsx7u0NWoIIWeP6j3I+Pygx8sFESAF+KQ1o3xx1nhdGbO92/tl+s9W9maznIFyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C24ciOZ7; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso2582481fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 23:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731570456; x=1732175256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/pPbpSXvWpzWX5QbdY/3SgKf0FohjhUAcy4H2ySqAA=;
        b=C24ciOZ7CVizE8EvCWBFIQADSeqXocSjG47xaSEtuYS2USEG9922j8gt/pWfYvHG+l
         vvrD81av9XgPYiSpMgdiyJQiwtvl+pyee4iM0DbDRB5RyfFOzIzpIvFS+57L/PL8N4Zr
         ktc3pq0YfANwQfH0B8CgtTgd+g/pLuMmdlEyAokuIvBFZWuIXrNYiGdvVfW3gvpoTqOj
         jrAY2lu+X2HHRYBnoASuuiGk9lGnT08rUlFzphnohUkr/wODGw+Wx5fjDHqSWLiG1XFg
         hg/WHLuPaxcvPdXM5xGheR8Wrj2sY2DSIPgH4l5k8YONIFbF/ExCzekVatcTrq1PLgll
         gmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731570456; x=1732175256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/pPbpSXvWpzWX5QbdY/3SgKf0FohjhUAcy4H2ySqAA=;
        b=rSS+e9qAeSAwZVmfJrJmOJgdpS5XYGfRETsCnkrEAdDttwfmhcwYFCM3IYwUh9R939
         JScCYDNs+eiE1frMrr3sjj4fmhsvkndaFo7daRhv6xserWQK/IQHSP83QVmN+dhyNMd9
         d4kAfPYNvSZpqfitpTkd9ktjElMmANFyCNdiEjTw6Rovpax/qslRG5bMkZczCNn4L5IY
         UgkOa89DyRHmHSTb85YkcXmynVh2/NOluK0tUsrIUMDRc//11ZC642f1ikthpZo/pinN
         26s+ao9g0KxfJ2rWI8UTHeMI9mZgP/P5yycKqbtf2FlbB7Td/2uRM90AlmZkhnkhIuzb
         Azgg==
X-Forwarded-Encrypted: i=1; AJvYcCW2PzCT5VpgOVePw7Vqk3TobRXIYbKPDEDD/9H0M951wuDCMmidgJqx4HNMI9hNAyxmZNclqNmJ8q1s@vger.kernel.org
X-Gm-Message-State: AOJu0YxiYFUoQXDwtqy16X83TQnJg8tYFbv1HSVaWISX/4zEEnPnLG7Q
	VCklScKUgx1VlLMYbUVaOgJn17re6P0Khkq23KjeiRhe0cw3L4lKON9oJT2TjZeYeBwxMrBQDQw
	VdGa2qG2BXsAV+jVPmaodjuJlLj3+1bJS2XxH1g==
X-Google-Smtp-Source: AGHT+IErHWmbQJv3kvLImbtdMuY4ZYbaGmwTC9XVeS7KTlKYd0znUE8GAC45BulO9USEVMUBJJUBjCdUo127qToiX3o=
X-Received: by 2002:a2e:a548:0:b0:2fe:f8e1:5127 with SMTP id
 38308e7fff4ca-2ff4c5bf818mr28281151fa.9.1731570456279; Wed, 13 Nov 2024
 23:47:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <20241023-en7581-pinctrl-v9-4-afb0cbcab0ec@kernel.org> <173088099542.3237297.18018729158887853624.b4-ty@kernel.org>
 <ZyssJpR7xwbMzUsm@lore-desk> <20241106110046.GR1807686@google.com>
 <CACRpkdbf4Pb+n-F-K-JaUvytwCGUHHh8d2rYP4A9KgVTzqSnGw@mail.gmail.com>
 <20241111165120.GD8552@google.com> <20241112144427.GI8552@google.com>
In-Reply-To: <20241112144427.GI8552@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Nov 2024 08:47:25 +0100
Message-ID: <CACRpkdbnon4J=uSnVTnhsrkA1z2P9tSCDt4mhMShGtFomUxNvQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v9 4/6] dt-bindings: mfd: Add support for Airoha
 EN7581 GPIO System Controller
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 3:44=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> > It's okay.  Life will be easier for everyone if I remove it.
>
> Okay, I dropped it from my tree.

Thanks!

> Next time I would like a say/opportunity to Ack please.

Yeah I was a bit trigger happy, sorry man.

Yours,
Linus Walleij


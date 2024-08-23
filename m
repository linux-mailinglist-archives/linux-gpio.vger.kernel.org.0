Return-Path: <linux-gpio+bounces-9080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE9D95D24F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 18:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74B29B264CD
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 16:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4306A189538;
	Fri, 23 Aug 2024 16:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xSoFFUWZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC3F1DA4C
	for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 16:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724428949; cv=none; b=DiR9WN5N/wStjnyIihewtVVfdbIcNSQHSF5CGDybBRtX3ZR4VqGuSgZVbT4TdsiTk3A8qBSnzcovj+PYvAuircdP6p5zav3yPWlWE9ljyLAq6KE234GpXo2GMef7Ae0yzPAWS6yZcYY70bS6SRHh9OzK/grP50+1b3NduTHqqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724428949; c=relaxed/simple;
	bh=d/qAONad33R0jZNDEjz+rr+CKv6vN/+BTiZ2PyG+I5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7q9W43lNFAwK3cfqF3y5gqAHHojIti8tmPaCZaRimDZ3xw8LgT5AeZB+A7exdDcQfHxtm1aVRYfCKle3ni78P+IzCJXzFumQL07prAu/zVi9Ey3PtjXc89rmtOSmbb6B4735v/tfUqdWZz9E066fJ9fIm2g2Ln55paWy+Bus24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xSoFFUWZ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-534366c1aa2so1332883e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 09:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724428945; x=1725033745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+byIGe4g18ARlIGzsWCBhessTlbszeK6bqUvyBPezWg=;
        b=xSoFFUWZuRg5/1cu/BXWg8hPzasdO3dO3eM3+DS/oBzVLp9/uzG1twKLqt6c8Nu+eY
         2+i/8YR8QmBl32L5k/B3YYXTnJ2pWfVs5wuRUNy/509E2OCKrYAW1kd4OowNkpQlVFF9
         oRWaYbPHsBp09hOMelV0Gd/JPk7uPc/dxDyePpAs/ClmIeY7QljU2hxkURGD0ge6bfBw
         qgohEcREqxomjreW+tCvYELEcnb1SLD7FwoxCi+sSt+fpxLuGX3Frco9bQ75rSmn5tSx
         EL/XaNmjoEptSK27S6sxdMZOZ03IqE0UmRZs3yCZ/2T7rYAG/uZSNufhmb+g27s03r43
         INcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724428945; x=1725033745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+byIGe4g18ARlIGzsWCBhessTlbszeK6bqUvyBPezWg=;
        b=AD2JNwgILIsL4zaITXLUoTGD7J/FBsooq5UU23H24sm4PoQFHPM85iuMLfBgR+zEbh
         0Om88ALIToGyAERykry3wjz+u71mXePmWbtCqkGnzT8ysKNByF7dzVI58F2ZhFRn0apc
         Y5uvEnzbngybc+UaiZVFRnHxppJRpAzvIci7awgsxgOmbxWLdKWZPGkfz8k4+6aAxApx
         cJt7hKG2W0wkUR+WDYPOO7ZwHhJUx0rShaxOdGK5BBackGTcMVpctYqQrfC4LQ6kf7V1
         q4fAhH2/HxyarDu+vbM4AvYZkWyRRArl+9v5aJX4ycQWjs68ZVT44vFTA7D7O3XHey3R
         PN/g==
X-Forwarded-Encrypted: i=1; AJvYcCUe9AuWsjZWWC8oOuRkUir5jkLUo2D3udr3ammjeWFbbMJJXgMd9J9E+Q8f9K0MSEhjAm0U6+m+IPzH@vger.kernel.org
X-Gm-Message-State: AOJu0YwV+vwYFz4uTOJChCWwads2YJCVKeKKoUSGF+nYDhMQUiXybstS
	AQlegg4le9TDXTu620J7NKpABRGY5A4eQl2WcTqHOo1juoD8O8K8i5fDxOpWfvdX4YlIZsjlIl+
	OLCeKOt7xG5RPwSd2EAa/mo7amod+EOyA8Pd6eQ==
X-Google-Smtp-Source: AGHT+IEbEoxnoSIsIcOXGYvvsido0gU280o9EgFhYynNtmAq+4AgzMA3KAh37jKek70/MtZreE52cxmgz9LwgewK5p8=
X-Received: by 2002:a05:6512:e9d:b0:533:47ca:974f with SMTP id
 2adb3069b0e04-5343883a0e6mr1568421e87.27.1724428944837; Fri, 23 Aug 2024
 09:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f74e326bd7d48003c06219545bad7c2ef1a84bf8.1723053850.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <f74e326bd7d48003c06219545bad7c2ef1a84bf8.1723053850.git.christophe.jaillet@wanadoo.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:02:14 +0200
Message-ID: <CACRpkdYUaqtqQ7mggRu6BFTs9cP-jsvqFhHv939jGSjZ4F6MCA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: meson: Constify some structures
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 8:05=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> The following structures are not modified in these drivers.
>   - struct meson_bank
>   - struct meson_pmx_bank
>   - struct meson_pmx_func
>   - struct meson_pmx_group
>   - struct meson_pinctrl_data
>   - struct meson_axg_pmx_data
>
> Constifying these structures moves some data to a read-only section, so
> increase overall security.

Patch applied.

Yours,
Linus Walleij


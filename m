Return-Path: <linux-gpio+bounces-14258-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AEA9FD1EF
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 09:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD3CD3A06CF
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 08:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01032154435;
	Fri, 27 Dec 2024 08:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xZt0ZrpH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ECB1531DB
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735287810; cv=none; b=oO/7nHW+uGFvbeffz4mv/uFNQlvAQ4ZgkMfNuM26YG+aWMHac4IfsV8M7UtyUHB6NUGrPYzjFbkijixU8raioYJx13fDJu2l01jmWolAZ64DO1A5N1GbG0dcls3+BEq6DdJPvhE0f9h/Zrk9NHQhgO4/xYC1Uo88t9qWlNHVZ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735287810; c=relaxed/simple;
	bh=oXzi3CC+CiXNTQ5UNVpJvFDoaeyxklmAi50O6y7h7oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8iY7mNwegJEzPWDyK+bVYEbzHylCqzh0EIqZ1l2Gx6Z1ZTYLclHBtIU9pq4kvmZuMpSExcF7+WTy38gyiQECRLGLPaauAHW/KTHUolzTkYgtwUvMpcbY6YwokV6iTQNYnJi5j+Iytd+59PfJJ7E03HikW+PuFa4DbQqxyGI90A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xZt0ZrpH; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53f757134cdso7783333e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 00:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735287805; x=1735892605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVcsrmKwkxIKz+eCCIw3WHKCv/X66XMcWh6vJ2SRqGw=;
        b=xZt0ZrpHUZ6pUtSXDvpRwUu2J6ndKosPTDFYXeN+XszKw3d34ftrk9z8sC412Fu3RA
         +iuFzda/orjO2NnVZY+q/kRUGIkbKUK75U3iArtNXciEzpCwfpkg4pGg98MaZui2LqZa
         y729LCC1wQS+A1ONmw1A09b3nI2b64EmSfACLRiTR979PngOmmqsSLh6N6xv2GG8CQvT
         4v5fs/H6J4MpXOGmQvG6fIMmtX9Ga4XO8a+OzMbgfrL2JDJ68HBxwKNHUlXRllLpKi0d
         06n6mgJBFI0tBnFrPkmDYCIf9ROsb3/ADoZ2pVWqZwstIHT9kqF72SSVeA/UpBpjULP5
         +rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735287805; x=1735892605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVcsrmKwkxIKz+eCCIw3WHKCv/X66XMcWh6vJ2SRqGw=;
        b=waSVYQgc+kmwQVtnjyPsWpGLBXwWcYO7XB6cWvK27Ezid/Ad9codvsFe0dhpvMDDdz
         rDx46JMVTJtbFi73ug/wJOdB3Vv4/GpZyriXRWWqd3ne8Ba28N0GpSDqOBz/brXUbeoZ
         5uHAvgIaMul1drWKZdfsJvh1fO/LbHe2ZKxmYiTROMl//Y9RNJtJiZIfBJ2oLSAyQv7D
         nqagswEaMWRGMmgDTnMYjthRHE9kbnk2t/iV0JGSZcT+l/d3qCH58MiDFJAKjGnHmxC5
         D71iiApbIWiU5HYLOfuTdJPy7ak0WMXTkF66u6rObmCBh8ljSByh1qeGdDOLers2ibjv
         WWXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcx2d3cHvGe0dQ3E60igCZquZuAgoRLV11jbH/9lQ4/CUFeynOSzn1Ek4/1bauWtymSoMlfOa+8teL@vger.kernel.org
X-Gm-Message-State: AOJu0YxKDP0+3o7t0UkSgQN856Pjh0+soyMQl5wx5ERJkoW7I5AUnwFM
	VYHLn6FwB1NhCjO+BV03Rh1lFQC04AQt8OQ0lbugdrGDTWQE+eJGCzvt/yZi9LWSBsXCTwjyaDi
	G0/s0hZDrkPPgAJfarAGJ1bP/wMNeJpAVVPPdoA==
X-Gm-Gg: ASbGncvqz7N7K+kzhSvRrklBTEBTC4DjXvsjh5GYvMLXS1i+jRgfcmmU7GI8mqUjZdb
	kQipadlL5qryl663N/fixjoVF3nDVpYlF4EtP
X-Google-Smtp-Source: AGHT+IFYIOklSZ9sJMM5TQ3zMjDwQ23DBG0sFeGBh5tQkGSxcVbvZSf9AiFrryAVoUGw4Nv3w5+5ALeURj3MiEoam9I=
X-Received: by 2002:a05:6512:1283:b0:53e:2f9d:6a7a with SMTP id
 2adb3069b0e04-54229562a50mr6753089e87.46.1735287805076; Fri, 27 Dec 2024
 00:23:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217085435.9586-1-linux@fw-web.de>
In-Reply-To: <20241217085435.9586-1-linux@fw-web.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 09:23:13 +0100
Message-ID: <CACRpkdakCrw3v=iEq_chxxhcEaUipqhyPA2GDZ9gp3tMTbuWBg@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Add pinctrl support for mt7988
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 9:54=E2=80=AFAM Frank Wunderlich <linux@fw-web.de> =
wrote:

> This series adds pinctrl driver, dt-bindings and dts node for pinctrl
> on mediatek mt7988 SoC.
(...)
> Daniel Golle (2):
>   pinctrl: mediatek: add support for MTK_PULL_PD_TYPE
>   pinctrl: mediatek: add MT7988 pinctrl driver
>
> Frank Wunderlich (3):
>   dt-bindings: pinctrl: add binding for MT7988 SoC

These three patches applied to the pin control tree,
please funnel the last two patches through the SoC tree.

Yours,
Linus Walleij


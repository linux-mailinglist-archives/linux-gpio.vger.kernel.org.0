Return-Path: <linux-gpio+bounces-18922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFFCA8B3FD
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 10:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E4BE3AD463
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 08:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0143822DFB6;
	Wed, 16 Apr 2025 08:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="baFOoMUz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD81A225A3C
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 08:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792618; cv=none; b=DPKfKjRMb4xxeaFGmpVQrP+oZzoAdGZo0UYoumAWSuScE2isQgMS9nVWZX6hiF3vbs3NFNm4+wIzohQdVWhXugsVaLY6Kj+yddoJ2cY21MXit026Wc7HNJl2lkZvXAcSQOs9Pd8oFLCAsfigDLGszscIXZFk7cTRq2b/X1LORGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792618; c=relaxed/simple;
	bh=DXCImHbhgaHYD5NXAki2E5LHyVFHbeqj7RL6q2PIT+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/DlIvzbbmrMXnbnRknxS3mwCIzIcdzw8990xhlE02nieOAlsaQvkFs35W56EvPYbdkFGrWLT0gPcqhAwK+YYZnCFEZYPqaEprTS2OYhQBEvOPBlQ8E5qjIKYH0TQoLjd+UqqAWcGb8oNZrx0wan1BJhK02rpVrg9Gy5LTSaDBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=baFOoMUz; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54acc04516fso6230187e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744792615; x=1745397415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXCImHbhgaHYD5NXAki2E5LHyVFHbeqj7RL6q2PIT+U=;
        b=baFOoMUz3UUr2fIPjRVkp0kpSh2jnrjfyFWgmhHWHF+V+sheqtna0Xa843SdB7hKt5
         zH93FiQ69Awgke61GfQ80jR0QUkU3v9WexrHd3qjLYcELh8nlroIh5QQG8+H9QJH76tp
         Z3Xf4NAUlxJcoHdH3S14GWVxFSQMhyq8UkBhMuvgue4pq/RcCi/L46KTaPyXVVgHHIZE
         DXmf9fb3NgeDq16uOJ0bxEikAY92w38O7EQBEW5mr7WLw97VZnajZFq4D7x0FRSQAcjt
         MEcKg3A4gJ+IRZeyIZPZ1OLzVxTW85eXoKn/sFeZly+nJNr9l3CT9Fo+eLay5xTEyaJ6
         849A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792615; x=1745397415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXCImHbhgaHYD5NXAki2E5LHyVFHbeqj7RL6q2PIT+U=;
        b=sgylzYGI8eLwYDC5A0uPtGb9W2mEW9CIcTyK9lItYQLB8nanW99oaKgqA9VhVj5pLp
         w86zZkDFCBL5fzBF6xeB7uZhXT07XvTe5D4B3ZWWU3OcHUloLPBxcW3VLOLtA6uTj+33
         Ir9meFNSOdFfIDHJs5YPTh1jxGYi8Xhzt7hi0z4noek3InSS2H+/miSr5KFUuUkXb9sR
         HbZn3BblTKhKbB86ztqq8w3gFeeIh9n1v8OX5Bh6rrEoFcB/v0gNBXBouKVWwdZ73GqI
         k5nTXEjY+VUFO1C29oB/1Z+xNJzqqMLtAiPoNYC3u5KkjcFq080QPWWW0eGt/Nf8sAim
         4Oxg==
X-Forwarded-Encrypted: i=1; AJvYcCUDJYb7SBhNXkz1xiyVcvPv2zSj84yEhWTYWmmHTQpiUpOY5ykSAFXDAWjF6ae7v65i/WlraJRvs2V2@vger.kernel.org
X-Gm-Message-State: AOJu0YyxB/tT38aitHNd9AFXii2/2VYTlVcxjyagHRRiTzLjk2IDGfcm
	6Dycke086XMqKHtXzvVpUz3GFysA6XJW0ZwGtiZn9hyPHGxRxEcVkAJpzZNbASR3dXhMsIqvCUN
	I8k9FuT5c4nQ2iNZd4pROp1mtF06HH2FwuuTONQ==
X-Gm-Gg: ASbGnctRLFEDy381VmCFMs738UDZoirmiZ9mb6GpBd7B/ZKuIN2/1C3qx/4QpQgVwOr
	yfGNHm8yuDzLuZq2Pv9tqhAdmQl956ZHHOOpW6Shst7Km7UbreAQLlc+84QiOohQG4+hsJy44rs
	3bT00DQ3QbUc36QYLeIKNThF3uk4TK/4SJ
X-Google-Smtp-Source: AGHT+IFnTyulj/0oGbeIikzilFJSE7sEuMb0JSQLD2qCkdI3QvGlZH639PCmqr2wKnbHsJXFbiOa8zKp3Mk8GGtQ/fo=
X-Received: by 2002:a05:6512:3d02:b0:549:5802:b32d with SMTP id
 2adb3069b0e04-54d64a7ae44mr362901e87.3.1744792614952; Wed, 16 Apr 2025
 01:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250322035307.4811-1-ot_chhao.chang@mediatek.com>
 <20250322035307.4811-2-ot_chhao.chang@mediatek.com> <43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn>
In-Reply-To: <43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:36:42 +0200
X-Gm-Features: ATxdqUG40hdym0n5Q2fxGBsUSS0OPVO8ybbpsBi47RVMjHapZZipAk2JRY_FG-A
Message-ID: <CACRpkdbhGJhmNhoS-rqWEtqvH=D_2Q2+djaXWmyEu3o8UEcaZQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] pinctrl: mediatek: Add EINT support for multiple addresses
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Hao Chang <ot_chhao.chang@mediatek.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 4:57=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:

> this patch became commit 3ef9f710efcb in v6.15-rc1. It breaks booting a
> mt8365-evk.
>
> With earlycon it's possible to see a null pointer exception:

Argh, does this patch fix it:
https://lore.kernel.org/all/20250415112339.2385454-1-wenst@chromium.org/

I have applied that one for fixes.

Yours,
Linus Walleij


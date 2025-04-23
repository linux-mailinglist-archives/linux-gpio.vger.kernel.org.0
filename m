Return-Path: <linux-gpio+bounces-19189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EB0A98401
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 10:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45F3D17C3B6
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 08:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F101E9B34;
	Wed, 23 Apr 2025 08:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWQj9eP7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706391C863B
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 08:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397964; cv=none; b=p8ShJT0k48/kcHj4JmGFe7zEUY0tqMN66LGBKMecDXfn6upJVA2DG6MoJ95LgzUWwpNx4usfkRwrGYvqiKg8lse0P8zajxJWDDTZpu1NavdaiDR2Qkkef/Bw3estbuRfs5xHoX/oaT2sdviqnwYUh6rHV8eW+3zNyKvZyCKCb5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397964; c=relaxed/simple;
	bh=1AT3w9qrvqNQ7asAkLzicRanFyPBT5NT85+7uOTViCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3e767I9YnFwVJ8jyAJ7fxZ0gqva0MF2Aseq8FbI8fZFvmHMP07VLgaVBzfxHHkCjwNFIV/mz4klKxB3O9aPEX/wFTS5Ns9lSE1BvpnLRvZMs48bvuAxGcyPk0Ng1VTxL/vJDu6LTbv8cIkP/lJ/8uE5jF77IitGRVl+eiFNp1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mWQj9eP7; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54d98aa5981so5165335e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 01:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397960; x=1746002760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AT3w9qrvqNQ7asAkLzicRanFyPBT5NT85+7uOTViCI=;
        b=mWQj9eP7AZBmWCcZqLc+zzoUNQwUSn9guGlNJjnOz12miCvGw14qyBYV/HOpR1FRee
         x1uJuPbXdQC6jIKyNO/SPnNw+mmSxusr0/iTXrc+DItt3xofWouOscWXKbcVlA8sovUh
         EfBbA65y7vuJwXbsdGYrOxj2imf87/w7Bhk+nU24XwRFm3ITtmtL9Dq/Nz2o0X4mgQyg
         5MqN3XMH46x6+KDdpCZAngNNZm2m6v0y18Br+PvMkLRe1pbOXuUG0CdcyIB3PsWgPyhv
         DAgSHv/YHbgGIsoXGYlr9uD7OluHpGnZ1psARMqIGQUiWRWn68C42dUiaAnvTn+f1RaY
         JQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397960; x=1746002760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AT3w9qrvqNQ7asAkLzicRanFyPBT5NT85+7uOTViCI=;
        b=Bf8xFrqFCpNx7l3lQpR7PV+tqZh+2LYi7Q4BaUA8jdiceDuq1YqC5jt0lhjabyPYSq
         1wL2YjU9d0gCCcEjmfqZCXJOVHk5D1b/3VLV9a/8hD0ntHN0bFl02Z1xerHfKkYYPHZj
         9NJ84ltfTci2Bt6/Fb6gT9T7epXeBN8eiduouDRcZblNWXPazUmI7E4JrhxWtxaUNcmW
         SDM0DvcmFi73dKJaBd9qLV7hCvuuqA1LTejX7k5aFfnZ7Okj260CaQGhZdtlutEm0oSS
         vqViNgLWesQkTaW7Op8B8QwOqs9xrEBD4dd6C4/d5VoeOFW5BHQyaK/5rPbUQ4/+3+tt
         xbDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlN5ENWx30p463DTR3OBD2BgtQF0Qap52drWV5WSUsuNhZFOHwLC7oq8vL1v5qmL6zaDp6m965k0pd@vger.kernel.org
X-Gm-Message-State: AOJu0YwZEDEZ2Tljmb8yVgfSHumbMvvizWzG2z/EGx8AkQ+4OkXNdz5G
	uf+ymuTy1WDvlevrd4FR31vIHEDdg6/EqAs+ztkvDQiF8VKntpypKQ1/c/IsxChFOSqQPLNCF2/
	rYokCvBPpTkg9FIL0pIbuS4cl1MGaSZsgB5YB4w==
X-Gm-Gg: ASbGnctZoZ/FawSmjNhddddjuHpbLDmwA6iFLJB50S9pkzN616mNkFCXjMiNSnx/wRq
	Qtub1a67KT/3dk30vkX5NcxoNIYe4vq/BPCdI6Rw1SSelNUoZ69fkV2DYqW61XLyX3CnqaPQFsc
	AxjYAY+JLEfiIMANg7x1LAPQ==
X-Google-Smtp-Source: AGHT+IEM2sVrDJg1K3kkQKCG4hk7fklAp9PkKiypjTL5amBPKHe2ZUe0WuA6o3v/r3NttNzUZAhfuvsRPZ08Q44dSBc=
X-Received: by 2002:a05:6512:3b93:b0:545:154:52b0 with SMTP id
 2adb3069b0e04-54d6e62bd7cmr4837714e87.22.1745397960493; Wed, 23 Apr 2025
 01:46:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422075216.14073-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250422075216.14073-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:45:49 +0200
X-Gm-Features: ATxdqUE2HM1GEgTnOYS1QVQsQ7fnZaFaPHwIcG2bQqgtWcyPZI7J9UPs7LEWcpg
Message-ID: <CACRpkdb2shemvCLHuvKvSo0s62-=Qjmpxb-aTKjc_CEoFecywg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix new design debounce issue
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

On Tue, Apr 22, 2025 at 9:52=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek.=
com> wrote:

> Calculate the true offset of eint according to index.
>
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

Looks like a serious issue, patch applied to fixes.

Yours,
Linus Walleij


Return-Path: <linux-gpio+bounces-18913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F9AA8B212
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F31A13ABAFE
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 07:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8560B227B94;
	Wed, 16 Apr 2025 07:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yTB6YFcA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696AF1A8F9E
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 07:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788417; cv=none; b=jEPhMU6oa+3BKbB7jLO9Xnr+OaU7H6B8fKsIRzxCOq5jpSLQtx5j9GVPkphSworF6U5gaCwX3jwYasOZzRWI7Xncxkc1/5ffSrJgO4w6oNv9WJ8t8x+KdMa2RjS3qp39sFp3D4aDYqXlVc3vGnyU+SBqxsyviFkAQIg5Hxwmq9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788417; c=relaxed/simple;
	bh=1vaofwfGevdxm4fxBlcFaPcuDKOl1lL/bjN1PokEW5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5WBBUzdEOjKxIEONLKMn7KWKLCeFL/1NpWuMrwLWCN+n0yfLmZ2gcMXFpXHGY+nJNzoSdE7IlhyRILtHPZ3jT/XMc8rOOd+/PUZVcVoVL2WlymC5o3cK6yhM9rRaGzdu8HKcRtQy++cdwpV5LN2aQ5BIk3IJAtpKN75BWDrZS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yTB6YFcA; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bfed67e08so63906091fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 00:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788413; x=1745393213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vaofwfGevdxm4fxBlcFaPcuDKOl1lL/bjN1PokEW5s=;
        b=yTB6YFcApHyvgS2IzwZM+D1G5zoy8hA+7xM7DZOEQHZPyqOJwH8Qzhz863tVBITzzE
         xjrxfEh0CkNsfD/F3nhZb+Vs1Nw9Kr9NVksQQgkidYMzJGzzHkyH0HPvIcoXwNm3hqod
         ZzekxACWvlnaoDN0hLVz6OWe4jsSof19WWsqKIKwkKP0laRP76yGcnah9F/cU4mlW5Hy
         8i5W6/J0ZXMh1DcvkPtxZhmMiC70J0n3W99hdzjgpFZvYoJWFqqHyfA1Fp6wZF/JJUxw
         mmfcsmRuBvsqQo7jV3TDDWdJhy/pHe7D1cqy7RNqmInCvm8oTf0+neUBT8S+clcP129u
         mtjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788413; x=1745393213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vaofwfGevdxm4fxBlcFaPcuDKOl1lL/bjN1PokEW5s=;
        b=MXtmcBa7d1QTPBSphcB8LfGJOATKDZP7IllxuCnYIQRD8lW2FPP2Bpl1PdypMnNtk6
         udCdRFVIEW+D61hWMzh4hGzj9HcfHyNX6d3R5jaUK/kmeGAkXwOKt+2ng6DDIVeaRFqg
         0yB/VFAxdawmQZQlQfyYaX6fHMK4KoROhYW7zSrYceJMWbYlvabOby7IJSC/3oYDsUDJ
         sihsSsqAzWFd/sW5REleaU2eEkF0Hp9Tja16XonydlCWNrfptndRKWJCnSVFqGMxR1oP
         Iljb+06PfW6JbBb5mjwu7jAP8gpz3mio61mTJ20RIJUquans7vL44Q0TXEcfu4YVzmBu
         uDxg==
X-Forwarded-Encrypted: i=1; AJvYcCX5lHnPZF/i7i6SFKWdIz4AOnuTlGm9gQMOZha1CP2HZY6xw0L657iaDwSjy3h0MOAY68Ogc6/JVsnl@vger.kernel.org
X-Gm-Message-State: AOJu0YyzwLgvm4A2JnkLlrtSVQWzVFn6Qnv48eMsTdM4ymwsyjJSjjbA
	3MaonVKABQcAWqtId8u4xSQctRbGsevLmLuSaDL94fCo20QD5rI2uMTKWKVn87zUGP5mYozossu
	UMpCenKsYIwnDLZqnOjZ6cJC7pOp0PtJLabeuOg==
X-Gm-Gg: ASbGncu+CCL9zzxSNTquve5ucPIlCg1q6DvZCVGn43rN42QlK1ee2BobEOF+K8Mdf8t
	nis3wjJ+e0ET9Tzjxot7G0EYc+33nEpb/YFmTq17HTOjX+pxA3M0B5ZLXEwtHq3mZZSRIZsAyeB
	fpTYe35xvG4Y9TyxyuJ4OGmA==
X-Google-Smtp-Source: AGHT+IGFJYXFDDo/c9HFNj0hqEBV+yqtCpFXburGgG3GtJzyM/i0Julc0Ne5mNBFD3uMq2MVFDEsN5XeZET5w+5UV6E=
X-Received: by 2002:a05:651c:220d:b0:30b:b184:a8ef with SMTP id
 38308e7fff4ca-3107f6bdddamr2202021fa.14.1744788413502; Wed, 16 Apr 2025
 00:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:26:42 +0200
X-Gm-Features: ATxdqUEqi0bEqmx8YQckOZ12kcmNHaSqcTf6fCpAz3VpdY46Sk3RpC-b3QUf-pw
Message-ID: <CACRpkdZ63dWzMg0t96zPFL4+4Ewg1nA=utPJ2QUg2DvmFe0_FQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: pinctrl: mediatek: add mt8196 eint pin
To: Hao Chang <ot_chhao.chang@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>
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
>
> ---
> This patch depends on
> [v3,2/2] pinctrl: mediatek: add mt8196 driver
> [v3,1/2] dt-bindings: pinctrl: mediatek: add support for mt8196

I just merged Cathys patches, can I have a review from Cathy on this
patch so we are all aligned?

> Please also accept this patch together with [1]
> to avoid build and dt binding check error.
> [1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D&su=
bmitter=3D215008&state=3D&q=3Dv3&archive=3D&delegate=3D

I don't see how this patch (which is just code) could cause DT binding
check errors?

> ---
>
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

This use of --- comments will make stuff disappear when applying the patch
but I can fix it up I guess.

Yours,
Linus Walleij


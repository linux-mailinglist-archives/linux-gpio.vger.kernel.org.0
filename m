Return-Path: <linux-gpio+bounces-23751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DE2B10585
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 11:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 168191CC787C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 09:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDED259CBA;
	Thu, 24 Jul 2025 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CfDQOpDG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABA82586E0
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753348626; cv=none; b=NQ9UgnCmQdVpolNCod8nc+ZSjjJ8fD4G6ZK1DIG3ihBnHJ1YMxJa3a9fYsm0CkC6s1L0bia3YTdJeJw4+MsjYG8pVxSrtFNBRQ+K4dp9STMQfcoGXuAdpk2JvqFL/rfsyT+Ermmyt25k6rLfO1s0qlJrY2X8+/yaMmkaxbIqVXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753348626; c=relaxed/simple;
	bh=PzAImXvw7ltOkAeF9aE1vYSBycD64FXcVdqDkDZASUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VjZ0Cs9FKFD3eBulNlMV9zO3XgxYny5Vql9kCCNjrToZQasj8vYjBOfjhHt6iel03c8JKDgR0GiOfLS6L9kIUpXU2yaYkva8TqW5k5mMFDjkaoQyh831654g4xLO7HaS5WWdTe3ivmEUI0hArxWMcYl5WVEGx6iSax9m6F+zE6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CfDQOpDG; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553b584ac96so777060e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 02:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753348623; x=1753953423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzAImXvw7ltOkAeF9aE1vYSBycD64FXcVdqDkDZASUk=;
        b=CfDQOpDG7+H+rT4gcjxVG7nzL72tk82jIG1UHBBO6Be6KGFhDBbZJ8nSvH5RpDu+4W
         PhPhs0uFjfTJfcg3Dd/GGYRXi+YHgjZedHEcOGMbkyqaB14T4bCyZ+c26Ve1RhBXkzNJ
         Shk5METhMqgYWQyIaU1Eg7XI8HUByzQshRM18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753348623; x=1753953423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzAImXvw7ltOkAeF9aE1vYSBycD64FXcVdqDkDZASUk=;
        b=G4Jqd3wkx7AHboZMatknQOw6OaAbRrd5heVDuwrTpKaI3fpSOD4sl0uaKYqlubDUlx
         IvEIKGE5v3LlAtvjq6lBZK11+O+zPCG2sLdUoNjD/hHS3CRgTWuLr0VMxbLmvQzpNtBZ
         IGXHNGgKYByjaZbGC4xkXOz9MIC03ZU0sNekCRQfRyj4irck1azw+T31+ZxxEd82Ubig
         YAN92gHmonDjkHvjDyA8C5pFLf8+dpxJp84tI70iIT4+7p8rWRp1MTsfKfe6DO/E3n1N
         qs7BUocH9HgKMFG+sov9B3aQI6OlFsTe7EaiZYZQJBGiCSFRFznLVRN5cIIAj2P3+DdO
         mZKg==
X-Forwarded-Encrypted: i=1; AJvYcCU7Qy9na8377gXOuwwp/KYfZaG5PhRC0KaVvVQZ4CXOXCkyN7rPn5dv2oChFUXevc/+QBoGG9auntSi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw60uKBB8KxIj16n0Er1he1rVj7Zhi8yADOS9HSxvP0WojoAlGa
	mrHRvo8nDv8zXW7JenyLSKm8eQuiMDAXl1XYvNwk98mg6P6RO3PQA/524JmZBOxOewCkIfKsjnc
	GD6mmFYBfCyarkvFnj1h8Kz4CJGqF0sESn6HsGYd7
X-Gm-Gg: ASbGncvhOk+h8bYmckfPH3KmkMJfAcXOh5Z860w08NStxhfBBOkacRyp9OhebNdS8yk
	9geQG9wQhTntyLbwxdhug+ZkM6t9EYovCtb82XCOM6+WVRKkZwKjVzCvNV9eNpwY3quCcQ/KQOC
	ZgDn0FJNaSAy5HuoqhPq0oazYeJ7nvIYjxFiJm74+xWgRMBQY40IQxrMr5LQEM1Sl0NoyVnrf+j
	PKNFVqRWnam5FPgb3A2Y2AyDl8ch8p9CV4sL1vLwjlDZw==
X-Google-Smtp-Source: AGHT+IGEMdfa/7pI/vtQhZpE9t+GCiAKzWTtoHMGXUrvfqlTr4xGM3G4p6O55TyjazqugJ0Dpoksr/xy8ncvPcXnu9I=
X-Received: by 2002:a05:6512:3a84:b0:55b:57e8:16a5 with SMTP id
 2adb3069b0e04-55b57e81981mr94240e87.32.1753348622453; Thu, 24 Jul 2025
 02:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:16:51 +0800
X-Gm-Features: Ac12FXxEOfXERpbm54RTrpt_sFAe6oyRhPRCsENRyO12HQ_K_abqIUXAGxmi264
Message-ID: <CAGXv+5Exb0X-6V=bdJefaz+m=eXSrrw6_SgWY6vDF3rF1RmVBg@mail.gmail.com>
Subject: Re: [PATCH 02/38] dt-bindings: display: mediatek, dp: Allow
 DisplayPort AUX bus
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
	vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
	linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
	ck.hu@mediatek.com, houlong.wei@mediatek.com, 
	kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
	tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
	olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
	arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
	frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 4:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Like others, the MediaTek DisplayPort controller provides an
> auxiliary bus: import the common dp-aux-bus.yaml in this binding
> to allow specifying an aux-bus subnode.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


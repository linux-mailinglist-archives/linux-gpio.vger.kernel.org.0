Return-Path: <linux-gpio+bounces-23814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7EB11DE3
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 13:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 980551CE3CEE
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 11:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D770289E07;
	Fri, 25 Jul 2025 11:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jK7bD43j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5474F238C3A
	for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444137; cv=none; b=kVna8BdVKFUTBm8pWeh7hwMmMFtDH82xfsCDXN1ftUIL4Ho89mCGzWcYqTq8/asUsqzdL+l5s+8lPhUlqhLhLyMSWwDsO7lZT+YcHT9+hZWpbSvkBoq+L3lEIGu/ZHrjV97tDXPcEMFGlF/i8EnxLTu9b4C8CyUnKB6cEQQLaqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444137; c=relaxed/simple;
	bh=KqH01V/ZQOGZhBJpHb3zgphhQB1Sh25Ttt4gkVmURXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DL3PQQDmWuv4oTDLUEnaIQYKg8fr9bwC30Sp1Xs5J/kJYwoSSD1fZkKGihW/3KbjjZdTLnvwRd7stDp+nyfjRVjT6nGabmWY5lDwPPCaFKS7yVa4EzMyHVMMHItbLvZpya6r8k+MBJ2pYO31RMEeol98O4OpKFPHWbkxn6xW0lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jK7bD43j; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-73e88bc3891so1149072a34.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 04:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444134; x=1754048934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfE909p8Iq119G3J/2SxiBSXlMMdz4SFa3hpgANK2k8=;
        b=jK7bD43jB6rubSQbR8RKOUubR2MPzWfnrYFAhMxzB97nzrcEeI+xi746Ww/iD/ybHg
         u10vbVW3722YUGRwD2Sb+WFdCKo6gpvhydsF8tcdlq0HBFZecq6eDb6L4upPQa7iqI55
         zpUwUehuqejrj7IYwM8xf/t4ogjDcPJDfDjU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444134; x=1754048934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfE909p8Iq119G3J/2SxiBSXlMMdz4SFa3hpgANK2k8=;
        b=LGxUtGXKrvpZAGVJkJsWf0k6sEaPgn2vk1VB4VTToFn04i9Ac5rD8GKx5rH3WCw6K2
         /5J/4nvUM8Lt+l9n20HCmvPCGlgJFSj/de25FoSiUQipoolEblghT5PbUOv1c4Xa5CwL
         g9n6MX3t3QIKEfo/ItypZ+nFsUzhdD/JIlx5LeeM6QqloHJ43PQZVJvCbwsLXRY8tNX2
         WP3MYfNSSjYFYy6WyKptC7T++0nsT03vxmoXbMr4v8aM55IxzT9R+I4NM2WB+dHZpTfT
         +PJ/8DQdgWcD+G2ZhonXMFVuCl9dAhIvGkTmTMT/3AJX3RuT23R4huOf1Eoa4WYc9Jyq
         Vf4A==
X-Forwarded-Encrypted: i=1; AJvYcCWB/PwZNlwgZG8LS3ooubvlIR+cDvrpmGzUzKlglM00unrvXdy5gRWKRAtAWL3FQpYfL6FzEyCgkst5@vger.kernel.org
X-Gm-Message-State: AOJu0YxpC7FDQK+C+STfg8k+cP7O86hUU/KEfJitjbvoqmGtOAqfnasX
	HX7+M6x+frRkFHPyu0WyQUcDJh6KCwksD5bAyjZ6gS+DRLAYBzRTzss0Wlj1qNmGKIQM/2kZJk8
	fNNQimw==
X-Gm-Gg: ASbGncuVSaYCBLYmS9ElCtse3gE5NzrOEnv3KbFwHNq/9yN3cHV8t4BrhXOvzZ7RpLh
	0mOOLRGTIGA7IXlcmR08+QF7NIM4nYzjXKDu0UseYfjR37i1Y/VU0C7m8EYQl4RnsVrLv9gzbmd
	IlU9j+iGWbZiqQQkC4zqIL8kGHMZdup53T/IRQHfpLSmtJzZZ1rCxJ0lCQdtdwO+wWu8f0KJhLp
	pGr010hmsviSpWA220sM1pcFQAf67/HgEoju3bTE0B1gYCp0aOQk8ldQ8PcTe5CHOjCOkWEyJ1T
	sT0pt2nA8CCnnOyzGO3BkIVi60U6qOXwBYe3ak67+yIlPVR3d3ywDJxgah8jHffaCKJPBPuF0Rz
	LrOSt7dCMcVCAn+nPiHgsPzDk2noxbyTyh0Grr/wSeLq668LqfI2jmapcCJ1pKQ==
X-Google-Smtp-Source: AGHT+IFF7XYalwcrqcMjwyM+IxnkYTiuG7r4fpPZjno5ctTfMZHNk3euRqhdU7RbsxSl2TKs8gvsTw==
X-Received: by 2002:a05:6830:43a8:b0:72b:94d8:9466 with SMTP id 46e09a7af769-7413ddb987amr810988a34.28.1753444133939;
        Fri, 25 Jul 2025 04:48:53 -0700 (PDT)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com. [209.85.167.174])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7412cf44fa9sm638683a34.0.2025.07.25.04.48.53
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:48:53 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-42a56f2e953so823846b6e.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 04:48:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwrHx0bFiAsbtyL9RlQSH0VRmdft1caQGzHmTr+8qvYYEIKWqUzzP0ZIdsZxXXW/yi3nZzXtbzXwRQ@vger.kernel.org
X-Received: by 2002:a05:6102:3713:b0:4e9:b7e3:bdcd with SMTP id
 ada2fe7eead31-4fa3fad468amr285963137.12.1753440273293; Fri, 25 Jul 2025
 03:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:43:57 +0800
X-Gmail-Original-Message-ID: <CAC=S1njhu11nHpyMULbK6PE-BLrBMq+d397pDU6gBzgo7xivXg@mail.gmail.com>
X-Gm-Features: Ac12FXyc7RkTIKa4HnSlf_SM-GYdwIREUn6AcAkOBKhNuekdCdvFzy29o7Ufs68
Message-ID: <CAC=S1njhu11nHpyMULbK6PE-BLrBMq+d397pDU6gBzgo7xivXg@mail.gmail.com>
Subject: Re: [PATCH 23/38] arm64: dts: mediatek: mt7986a: Fix PCI-Express
 T-PHY node address
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
	herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
	andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
	p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
	tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
	broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
	matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
	linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
	sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
	andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
	lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
	tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
	linux-media@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 5:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The PCIe TPHY is under the soc bus, which provides MMIO, and all
> nodes under that must use the bus, otherwise those would clearly
> be out of place.
>
> Add ranges to the PCIe tphy and assign the address to the main
> node to silence a dtbs_check warning, and fix the children to
> use the MMIO range of t-phy.
>
> Fixes: 963c3b0c47ec ("arm64: dts: mediatek: fix t-phy unit name")
> Fixes: 918aed7abd2d ("arm64: dts: mt7986: add pcie related device nodes")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/=
dts/mediatek/mt7986a.dtsi
> index 559990dcd1d1..3211905b6f86 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -428,16 +428,16 @@ pcie_intc: interrupt-controller {
>                         };
>                 };
>
> -               pcie_phy: t-phy {
> +               pcie_phy: t-phy@11c00000 {
>                         compatible =3D "mediatek,mt7986-tphy",
>                                      "mediatek,generic-tphy-v2";
> -                       ranges;
> -                       #address-cells =3D <2>;
> -                       #size-cells =3D <2>;
> +                       ranges =3D <0 0 0x11c00000 0x20000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
>                         status =3D "disabled";
>
> -                       pcie_port: pcie-phy@11c00000 {
> -                               reg =3D <0 0x11c00000 0 0x20000>;
> +                       pcie_port: pcie-phy@0 {
> +                               reg =3D <0 0x20000>;
>                                 clocks =3D <&clk40m>;
>                                 clock-names =3D "ref";
>                                 #phy-cells =3D <1>;
> --
> 2.50.1
>
>


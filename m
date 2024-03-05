Return-Path: <linux-gpio+bounces-4148-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D74887259F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 18:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 248711C204FB
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 17:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5169B16427;
	Tue,  5 Mar 2024 17:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTGcBiFr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5E414016;
	Tue,  5 Mar 2024 17:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709659691; cv=none; b=sdH/BtioeXr31QkNim6sErzUOC5iwqPiqi8PztOXMwsvKeubU7r0WEnmLkBvD/DK78PAEh9X7NDaE5Zc2Oq4U96uO6eIHxtjPSOhfFWBHW7fvoVQ7/8aR8OV79Woe8IluAy1bjyIIFQA/PYh5aorfJRrTTPtS+iwZC3RCRCG7C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709659691; c=relaxed/simple;
	bh=Sky6bNiLSP9/iYU+IFxY49mp2AqoBKKRZ8hV1Xatc+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fX1kTThuR31y2Oy1GICAar26sutzByuZ0eF5vgSU3oF7XtgtJiCwSo2AJ84Q8jSrmR78ZMVLdw06VDxXGsXRKcjHRqEAxcgm2cEpf8yvY78mbD/apcui2AczjOxvDY3rXkw9ItueR8yOVgXmb3HefL78BTWhYXCHcvLT5tW2KVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTGcBiFr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3EBC43399;
	Tue,  5 Mar 2024 17:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709659690;
	bh=Sky6bNiLSP9/iYU+IFxY49mp2AqoBKKRZ8hV1Xatc+E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hTGcBiFrXeHIyD/QwAlOLz4iWp+BlDvUPdtro7YewgIqn8BERAaFggsdNLhfjxAWK
	 HMEekGLmKskoK4DldQVqX82QfTot8w0F3ZK5j4fcQPZRMz+L2sKmfeSryaXmBOqg7+
	 jLoMu+8SGkZwSqGlnb0mz4qbsetPaOPB09ncqs0MtPHZ0A0fDC4TKboPUoBdZuqAir
	 5cPqCvAiX9eH7I0t15aJoE/bEyNviV4WMlz9h+MVQ+xqStrEhldgfqfB2XLsT+U57O
	 D25jrxRqBCrvQVzY/JXHoi34AIGxn3Fk16E9gOhProgMp3rt0p8IDwhWdq4dPVWAnS
	 7SIiZuK4YQhDA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d2505352e6so77734071fa.3;
        Tue, 05 Mar 2024 09:28:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKKwlGUGbgogpiRp9EON+mJEVwyTm/WJwcLoH79QWBZr+7XI/akD8/SdwhSxuN/iG3Ff5nTuINiRFYb/xrvCgWN23KY6hj6bT4fOElcQi8Ab2hS09+5K0NPOMD8HIELWtXhOZoa8s=
X-Gm-Message-State: AOJu0YzMbDwLJg/dl/ogsWMEnkmu56FB49SGZ2O3Whdjcf6HQspxkqn4
	5kWOmy6weuP1rkWCRi4a8ULl/1SlNiKMQbddG2GM73et1KHtrefUUvlLWc5CfS4yinGkstmpyND
	2LfSANHDjNt5AeLd+bkBjex7JGA==
X-Google-Smtp-Source: AGHT+IG43KKMQuBSE52Nr2fcrfpfn/5XLbUr56wvJZmXjFp4a+mtm6fia4Vogz1ah3NmCixufDgWOIuVS6+rPV83fds=
X-Received: by 2002:a2e:bc14:0:b0:2d3:e0ec:36c7 with SMTP id
 b20-20020a2ebc14000000b002d3e0ec36c7mr2134793ljf.43.1709659688891; Tue, 05
 Mar 2024 09:28:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20210624214458.68716-1-mail@david-bauer.net>
In-Reply-To: <20210624214458.68716-1-mail@david-bauer.net>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 5 Mar 2024 11:27:56 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+sHy=mr0paWvxOL8yT9TwuaJdfapX0sFkOJFtjCqoT1w@mail.gmail.com>
Message-ID: <CAL_Jsq+sHy=mr0paWvxOL8yT9TwuaJdfapX0sFkOJFtjCqoT1w@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: pinctrl: Add bindings for Awinic AW9523/AW9523B
To: David Bauer <mail@david-bauer.net>, linus.walleij@linaro.org
Cc: lgirdwood@gmail.com, broonie@kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 24, 2021 at 4:51=E2=80=AFPM David Bauer <mail@david-bauer.net> =
wrote:
>
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.or=
g>
>
> Add bindings for the Awinic AW9523/AW9523B I2C GPIO Expander driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../pinctrl/awinic,aw9523-pinctrl.yaml        | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/awinic,aw95=
23-pinctrl.yaml

Linus, did you just apply this 3 year old bit-rotted patch? Linux-next
now warns:

./Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml:49:2=
:
[error] missing starting space in comment (comments)
./Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml:56:1=
1:
[error] string value is redundantly quoted with any quotes
(quoted-strings)

Also, David's S-o-b is missing if you picked up this one.

Rob


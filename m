Return-Path: <linux-gpio+bounces-16450-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47393A41197
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 21:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18FA43B4700
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 20:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6816823E235;
	Sun, 23 Feb 2025 20:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aiBxymmF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1588B23CF06;
	Sun, 23 Feb 2025 20:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740342545; cv=none; b=H+uO+9e08jY2y9S+Tttj/+cjKnWM1PCQQP8BfuOKPYhpV6NIjWLhEEmf0DyRMLpq8CW2FYy3bHtzdcLOldDsiPCGDvXuY10Lsi/JdzGmut2QalOOUKxL+oxqi5kQkUkDyCMZlILKDmt0drbG6+qlnjTTv8JfqYe7CRnLvFnOCCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740342545; c=relaxed/simple;
	bh=25wcv9/ByfyIXsbtB9mOxT+rcPesJBpvAGF7OtGW36I=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=QTonfi26+7CgRdWA3kSOYi4si18ihdfYDGSXYKSfMPipKmOackrQqv8weEFo4lAsP7/UyZkh4yDlhxi8I1PmpEqL21yZRVEQJ9zo40nJa+d9pj0U0mTmR3nvbT53GLxRYy0RoPVURsDLkUBibcl/DCPdN9P8Cwr68BzCdty5ZHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aiBxymmF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515F6C4CEE4;
	Sun, 23 Feb 2025 20:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740342544;
	bh=25wcv9/ByfyIXsbtB9mOxT+rcPesJBpvAGF7OtGW36I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aiBxymmFac4ydGQwnzY6lVVO/Xg3v8emyWIXixXZ0atfmnRtswFfuOCX4IpiBEbti
	 XKRgFf5IkZb3qqSW1KEzvzpgthwboxZvKliFoUBGrIWZHn8a3lCyZfgzD4VW8Q20Wt
	 AYCFAnuqqiggtTm2XRoNDRO2zWZSORs1dGovHFEaE5ecIRrZFXvrj1kYvWt90ZGNa7
	 Zo1IEF4ErR5dw+oZ7/TzAairfuv7aJlf9zMk17nKSgpFa8rL8rTff2Rrai2+xNo8/B
	 B6QR1CxWibSFGH29Q4WDNK1YLOa/xTXw8g7vmpvXgOdPXtCeT7IfYfNHjRBgpyV1AA
	 XkE+uvViPn16Q==
Date: Sun, 23 Feb 2025 14:29:03 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>, 
 freedreno@lists.freedesktop.org, iommu@lists.linux.dev, 
 Stephan Gerhold <stephan@gerhold.net>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Adam Skladowski <a39.skl@gmail.com>, Will Deacon <will@kernel.org>, 
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Maxime Ripard <mripard@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, linux-gpio@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Robin Murphy <robin.murphy@arm.com>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250223-msm8937-v2-5-b99722363ed3@mainlining.org>
References: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
 <20250223-msm8937-v2-5-b99722363ed3@mainlining.org>
Message-Id: <174034253866.156279.3992338487990231067.robh@kernel.org>
Subject: Re: [PATCH v2 5/8] dt-bindings: drm/msm/gpu: Document AON clock
 for A505/A506/A510


On Sun, 23 Feb 2025 19:57:50 +0100, Barnabás Czémán wrote:
> From: Adam Skladowski <a39.skl@gmail.com>
> 
> Adreno 505 (MSM8937), Adreno 506(MSM8953) and Adreno 510(MSM8976)
> require Always-on branch clock to be enabled, describe it.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> [reword commit, move alwayson on the first place]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250223-msm8937-v2-5-b99722363ed3@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



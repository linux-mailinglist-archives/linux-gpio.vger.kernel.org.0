Return-Path: <linux-gpio+bounces-13360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7459DE81F
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 14:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4DCAB21B86
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 13:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E08519F495;
	Fri, 29 Nov 2024 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nzgesgoF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C20D19E804
	for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2024 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732888454; cv=none; b=B0vtW5nnRTIh38YHi2P9X94dNZSniYE03PYTtP030Oo5Ql72j1LNJZWuVj6eIhQ1rn9zVm3mHQgt0qUDoaV7JQtv2UuhAWv7GKzs4UXT//0wDHvP/SkumOzeDVCDBLSeviVkjza7D+7Qn5lr/LIpvwDLwcPbxmpN5pjq4MRS/Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732888454; c=relaxed/simple;
	bh=qP7lwKEdHMld7lFkjHFyab/jSeBsx5t8xely6eOKcGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNegKoAe9E3zAp4n+elX9WBeeEzSp8V6xECbzeTVv89lAuxVIISzuXZSQIkATqoAPY7mI3D6pm16aBooQdQInMYBA/T5xDr7g6gsEcf9ebtlILnAS1HohHnq7c2TxHfIeLya/ciwGj5/Lvbsq3Cd/rCqgNiAILHyBQRQ66va95U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nzgesgoF; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d0bfa52bd9so202599a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2024 05:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732888451; x=1733493251; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jzfj59habuKMWPss+IaBeegA7WifSrplhAuuUyjLmTI=;
        b=nzgesgoFc0wr0GqpK1HR64GD5xTT5QjGbVr0772vJzQ14cd7vWVW0HTLhp1QeBqIYq
         I9DEJ6Z7NezqdXCHizwoCOdCTU0LdTr9YEqil3Q/0MIOF8Q7ImG6VUPcRglJ2t3OZuvG
         ZrYP3izda+dwL1qID3Qsg6s7utogeiztocTfn5R8sDqdozSk5oimkEFEwNBcvANmZ2Wo
         iPZ0jsl94KRJZ8F6gED3D2XmPGlRNpN3QH7nlW5iG45dGHab2NKsmSgZpP6Tz+NpP0Q5
         zFURxtAx96J6oh7G06+OUfouIzTKyVq74K86uKcDwZlzf9KOqfMaxsUEKNgWvU17/qXa
         j2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732888451; x=1733493251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzfj59habuKMWPss+IaBeegA7WifSrplhAuuUyjLmTI=;
        b=tc8xGuIsslAfL3FVMaodbw60MIKsjWqdkELs9/2Rmhymn/aBotovr3PaXwgIY+PL+f
         6miK8bC1o0+VrBL9i2YA7EQzMJbWeSMkg1arejxHRDrB4q3BMC2fZRQotldxDghb2Srb
         ZTPnPrM1N1uHgV1CNXrhN+Spud3LxqXT5yezWLoHUIdzms8MpcqcBQOLAh9ZOVgNneiS
         5rSJPIizMj2joQyIklTSqXtFedbrzIJpYeWXZfR5YcTPnav7jcHANPDrkFKOZk9hCdad
         aeLQkdoP1BGX7CNldL+XlmTyF4uhj9Odb5G763f8TdRpuE5s6U6kj8LRSVG2/Q5CTgmu
         1Lwg==
X-Forwarded-Encrypted: i=1; AJvYcCXnC/pHftNMRRJ2pHTXGsJSsx6G1ZlbqidsuZkW18dAigjjk0yzLRwfFHgEEIhLDamS9Gh4hkzHk1Ee@vger.kernel.org
X-Gm-Message-State: AOJu0YwEc+8WGXgwsG6r/pu4L71oZrC2Z/6yw8JcSTFFl97p7Slo3aJ+
	6VOCreu8q9UoVs4o0qprXywOA1117nn49QyyRcNPgOavzbIi0ZdgseIHytv5IFLtfR2z9FrYq8J
	7BOJ9En4wfPRvmg3u6ymNePOSgS/jl/AlR5rxFg==
X-Gm-Gg: ASbGncuzOR/aPYP9qj/JsCyFTzcZyp4Ub/+4VlFt695z2tk7/l0C8C5CQPJzi9Nmri1
	B0hppsqcjiLi22hUx4kdeIitDnaBFlPw=
X-Google-Smtp-Source: AGHT+IGaA6t4/2a/mNA1h9b1zR06PmCO6tMyJ5TuOWa0jZCc/O10Qzu+rMnQb6Tj6pv0TWbP4VGQEBjG3I0WDrceI+I=
X-Received: by 2002:aa7:d68d:0:b0:5d0:8676:3ed9 with SMTP id
 4fb4d7f45d1cf-5d08676410cmr7819763a12.8.1732888451493; Fri, 29 Nov 2024
 05:54:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-4-09a4338d93ef@quicinc.com>
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-4-09a4338d93ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 15:54:04 +0200
Message-ID: <CAA8EJpqDJm6xh2oCkED4FF+1j8qt=u7B=7XADtR9JOkZZxsDkg@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/msm/dp: Add DisplayPort support for QCS615
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com, quic_fangez@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>
> The Qualcomm QCS615 platform comes with a DisplayPort controller use the
> same base offset as sc7180. add support for this in DP driver.
>
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


Return-Path: <linux-gpio+bounces-13359-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC0A9DE819
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 14:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27277B20EBA
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 13:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13151A00E7;
	Fri, 29 Nov 2024 13:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sB6OaG1q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C504119D89E
	for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2024 13:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732888429; cv=none; b=kL/NxTkK8GZesYcy976iIAVSysiJFsiMibo0p9YcYClMzDmrK8S/3r3ocDHBScxqNHU1QSwBrBISRySoEZzbmkWHQPqEMq//VV1/FB37qdnw5bkh+NpyVN/gr2hwur+9UFV+qDzSRLkQ4XrSqXJarsNjfP+YT2wmzjwoIJOU11s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732888429; c=relaxed/simple;
	bh=+dRJ7NHpUJ00cNs7INzOtHylGUJyGub0iEwQeE6ZSZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SR7GYRyboCno17EJwfaxO96uWF+vXi1++fF4NahEYEA5VLKg2yM/Hs1o4Ob0JcBHa90gNMklm7I8johvSoD5vwaZg93mmgktHe/XJtoaEtd8aRmHeZPw/8myR316cdQesPBzggLLHkIrHuPwBrBdHc/i1hTRbtJinSdPCFnAEaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sB6OaG1q; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so2118877a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2024 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732888425; x=1733493225; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n/Ur8aJlkZb2O0WBY+Ja+CLRvhD2wQCX6NK6ury26eQ=;
        b=sB6OaG1qp3BfWCImDLDbED5L9XHS3l9crclnjuRQGho++U9PYISrS9y355mlt5auEG
         MlvJX3Xs07Po564y+EAdBltgBl1fLcsBtT0hRmu7Jn15s29AdQtpKJBskkiliNuU4siJ
         itCGcUUyWLciFXKclpgZq7GBgTSFNlz/eprscdCKb5YbY18aLtlZ+NtbKAqY472cZZYT
         DZXu5fG20L6dI+Tvw34axbuJ6wdtaJElORbIqvFWgTfOj6ZEgd3x/plDwGp70F/RI06P
         hn5Ejk6mO6h2N6mwbS2W5LWtjrOn3nIuY47MSES9RvnAba66feozK12LBcBZz09XMMvD
         ljqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732888425; x=1733493225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/Ur8aJlkZb2O0WBY+Ja+CLRvhD2wQCX6NK6ury26eQ=;
        b=qWc8sc3+xJXsIO8rlhR+D7AIjy7H1yjQ39vAL36eWqW6gbfSxN7yaDIGucnp/iVG/q
         DqtDDkgc4LkD+TaDGAUoHo6QIJMpd5X5QwkqVc38bokSo+GYx3/8Nv10IEWmELHg/SFn
         UeohpT0qPTLCuXl9v2p2x2aBDm/RkwRNKs/cT0lpgH4BpXYgcrquIiax39wodzvE/3le
         s+/KRv7OD8XQA7vDansc7XPdQpCH/w2RjuPzO8WPsLbNknv2n31/DdfIMl9tNo7nynbF
         ufgKq1kijKIRu9qTtvG8EYCwqXyEaArQXlFt2dugGXSDeT+EuzHFruPHuV2lnPOjzqgy
         reHg==
X-Forwarded-Encrypted: i=1; AJvYcCW/g89hYIlEObPQz/fDxolmleoPaLpLm/BCPSa8hpf9d0zbOUVHomK1FWcX3X/J2hPxtnwEp79O+b4c@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5tOCGBX6St1saEGkn2oK3hHJxe9aj07vbUlqc6BZvnqxJCBWZ
	26ttEMx7vSLRnfdMJUJ1eYbxY8NqCTVYt36+QhYCpIwZnWqACwbksr2bHgssCHCoghA1MN2E0EV
	P1x3sFKcIoha8qYanhJzmbqNBSR5yt6e7xrYL3A==
X-Gm-Gg: ASbGnctn+ADOmZD/6Q420Kj0ynPd88MsN2Md4Af5/iEH4VYI+keiV58XCPUmbbYRK7e
	lipIR+esQZSRIrqFbL8Sgmsf2BvGoZjk=
X-Google-Smtp-Source: AGHT+IGCwqeDEnJNo83WNtmzKMJUwft+OKQaPAZ33baZKMDUQiMMr0XiZGEiUd02VQ36AikNgL9bZwlAshMXxuPC8CM=
X-Received: by 2002:a05:6402:5194:b0:5cf:f319:4525 with SMTP id
 4fb4d7f45d1cf-5d080c4d37fmr10845661a12.22.1732888425147; Fri, 29 Nov 2024
 05:53:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 15:53:37 +0200
Message-ID: <CAA8EJpoN1qBHyZrQJT_=e_26+tcaKRnSrhtxrK6zBP4BwpL=Hg@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/msm/dp: Retry Link Training 2 with lower pattern
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
> Add a mechanism to retry Link Training 2 by lowering the pattern level
> when the link training #2 first attempt fails. This approach enhances
> compatibility, particularly addressing issues caused by certain hub
> configurations.

Please reference corresponding part of the standard, describing this lowering.

>
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 49c8ce9b2d0e57a613e50865be3fe98e814d425a..b1862294cb98c9f756b0108b7670cb42de37bae4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1220,7 +1220,7 @@ static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl)
>  }
>
>  static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
> -                       int *training_step)
> +                       int *training_step, bool downgrade)
>  {
>         int tries = 0, ret = 0;
>         u8 pattern;
> @@ -1243,6 +1243,28 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
>                 state_ctrl_bit = 2;
>         }
>
> +       /*
> +        * DP link training uses the highest allowed pattern by default.
> +        * If it fails, the pattern is downgraded to improve cable and monitor compatibility.
> +        */
> +       if (downgrade) {
> +               switch (pattern) {
> +               case DP_TRAINING_PATTERN_4:
> +                       pattern = DP_TRAINING_PATTERN_3;
> +                       state_ctrl_bit = 3;
> +                       break;
> +               case DP_TRAINING_PATTERN_3:
> +                       pattern = DP_TRAINING_PATTERN_2;
> +                       state_ctrl_bit = 2;
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +
> +       drm_dbg_dp(ctrl->drm_dev, "pattern(%d) state_ctrl_bit(%d) downgrade(%d)\n",
> +               pattern, state_ctrl_bit, downgrade);
> +
>         ret = msm_dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, state_ctrl_bit);
>         if (ret)
>                 return ret;
> @@ -1311,10 +1333,14 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>         /* print success info as this is a result of user initiated action */
>         drm_dbg_dp(ctrl->drm_dev, "link training #1 successful\n");
>
> -       ret = msm_dp_ctrl_link_train_2(ctrl, training_step);
> +       ret = msm_dp_ctrl_link_train_2(ctrl, training_step, false);
>         if (ret) {
> -               DRM_ERROR("link training #2 failed. ret=%d\n", ret);
> -               goto end;
> +               drm_dbg_dp(ctrl->drm_dev, "link training #2 failed, retry downgrade.\n");
> +               ret = msm_dp_ctrl_link_train_2(ctrl, training_step, true);
> +               if (ret) {
> +                       DRM_ERROR("link training #2 failed. ret=%d\n", ret);
> +                       goto end;
> +               }
>         }
>
>         /* print success info as this is a result of user initiated action */
>
> --
> 2.25.1
>


-- 
With best wishes
Dmitry


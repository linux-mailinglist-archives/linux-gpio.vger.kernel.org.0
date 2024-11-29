Return-Path: <linux-gpio+bounces-13358-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A39A9DE811
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 14:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A67C161BE2
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 13:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A72619F429;
	Fri, 29 Nov 2024 13:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sp00FZ6Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A20198E61
	for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2024 13:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732888389; cv=none; b=fxc+CVclGda5krlE9pT5kQiUUJ5hiYwJ53LvnRUjNyGrEQukOwWrYaa9vFV399+IRJkbHxjYtsDQJ9PkWHnrYdIqjmxtpe6sDpVAC3Sv6noiaz17etRaeX7qNh+czC4Ui11sGBF2d41lVyp6dF6JEsYpfx0lTTcrfZMsAFySFu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732888389; c=relaxed/simple;
	bh=QhLznoClrSnhWc/HsF4XPo1nyWZVKk8TSK/skm0VPUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPKbopD2OaFqt4LT775G1+dOWsvtYN4e65TUqVhABcTOsHGRjufc/hXQ7XNHCLI7R/1XcmZLc7nknwAtz/fpJXuw166pQUdyhNBldTvQrGGZ3Vuo9g34EiQ+h3IrUI0CfEQN01cigpeWYA9Q/GuE5hITidmInDJB4N1VD/T7uDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sp00FZ6Z; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d0bdeb0419so364200a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2024 05:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732888386; x=1733493186; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y/6PyCBkY1vrkX+kqfrrIcFxpzFnIRWJUtmo58vJb+0=;
        b=Sp00FZ6ZKIJl44viLl+wdtqpnHGxRDf+BtiwFFelbyp4QqYtTk+dSwX8Bt7GVR2L23
         39Jg7xiiLNA7UTyTa8myl3uRcxuxgFJpl3RPcuXOWFUtXSLdsmx+mPDU4S/ftCTYHrPC
         Z6pMWYwRWY+SfvOlL1MIdcdLVqDOk/YYOZzwvBkSb/UEGGZvYHoX1tcLwbx9IIltgys9
         Wf9IBWw629/xbjuCg72Cx2W5GDjUU9FPz8KUIus2XlDqXKEFD9n8VICIfUkiUQToVLxy
         Nv+6pI0UHyCBgRSvsQm6QC42xJ288rgHXv2/JjwfYibPuQGkAj2UWDCJh4oSbhEM102v
         2ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732888386; x=1733493186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/6PyCBkY1vrkX+kqfrrIcFxpzFnIRWJUtmo58vJb+0=;
        b=TyfRD498i1e+VxQ1h0I2B8OAKsq24JekMYrS+WEZ6psE6zWt+nX1KDKu5OA/Kv13dR
         VqdKdGgebI4t2yewa1Kp/JEphMlX/Rjj63sQynhOT5vRzS6EcY83eVqt1rMLtfxdYCVW
         PUv4l/bMrGL/dq6l7kOduxgJillGdeKWziOl9vhxdrMktvMa8kzOw4086y5o10Py4EHU
         SqLu88r2b1rFlO7bG0ihCjj6sWNWNDgCII9JxwmU2yi1Tl1qhxwys3zI0vEkuWvV8G4Z
         CCi4FlsYU/SCYIRbpOX7qKnL0xI5Qh/2FtJh7n1UFUzodI3dAZozAEa3IfvUDmhkxquS
         quig==
X-Forwarded-Encrypted: i=1; AJvYcCWdA28PauYRIoLHHQMDZf+OOCRy4Foj4uzo8mIA0KxJvgAsnnopymVmoJtpvNDRJUkie4l9H0YiV1hD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz25XawywRQv09PFSznVH45Y33BvyCojaAw1mIS7yIDfUlMcLZM
	sJM5T7JXyKS3lWtYLU9yB+6mOE1BvtP6I/MzSs1ma4ZC5Rfqy7V6yCKYhOJm+GxhVGaM6N+Is9Q
	QBR4GwpxE8sImpn3I8R8wLW1rC3qUjH1rvBRsAg==
X-Gm-Gg: ASbGnctttNpixwVTCjIWbcF4qC0HoqWTep5qgTyPQFz/ABEYbUWNIL/A9AhYgI/xxbV
	K2QIgrZ8tuawaFO1B7FmAV+ZWNOHTIDA=
X-Google-Smtp-Source: AGHT+IEXbo3g37x6S9nud/YDl8MMhJ+axeHFVYybn/OHHchZEd90wPzaHJLOrky8M8F0K8J+KDpTyQqUYKWH/+5/E5M=
X-Received: by 2002:a05:6402:4409:b0:5cf:ead2:2a8f with SMTP id
 4fb4d7f45d1cf-5d080c6c4admr11268097a12.33.1732888385859; Fri, 29 Nov 2024
 05:53:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-6-09a4338d93ef@quicinc.com>
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-6-09a4338d93ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 15:52:59 +0200
Message-ID: <CAA8EJpprTGRTxO+9BC6GRwxE4A3CuvmySsxS2Nh4Tqj0nDRT_Q@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/msm/dp: Add maximum width limitation for modes
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
> Introduce a maximum width constraint for modes during validation. This
> ensures that the modes are filtered based on hardware capabilities,
> specifically addressing the line buffer limitations of individual pipes.

This doesn't describe, why this is necessary. What does "buffer
limitations of individual pipes" mean?
If the platforms have hw capabilities like being unable to support 8k
or 10k, it should go to platform data

>
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 +++
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 +++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>  4 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4c83402fc7e0d41cb7621fa2efda043269d0a608..eb6fb76c68e505fafbec563440e9784f51e1894b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -944,6 +944,9 @@ enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
>         msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>         link_info = &msm_dp_display->panel->link_info;
>
> +       if (mode->hdisplay > msm_dp_display->panel->max_dp_width)
> +               return MODE_BAD;
> +
>         if (drm_mode_is_420_only(&dp->connector->display_info, mode) &&
>             msm_dp_display->panel->vsc_sdp_supported)
>                 mode_pclk_khz /= 2;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index ecbc2d92f546a346ee53adcf1b060933e4f54317..7a11f7eeb691976f06afc7aff67650397d7deb90 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -11,6 +11,7 @@
>  #include "disp/msm_disp_snapshot.h"
>
>  #define DP_MAX_PIXEL_CLK_KHZ   675000
> +#define DP_MAX_WIDTH   7680
>
>  struct msm_dp {
>         struct drm_device *drm_dev;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 8654180aa259234bbd41f4f88c13c485f9791b1d..10501e301c5e073d8d34093b86a15d72e646a01f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -4,6 +4,7 @@
>   */
>
>  #include "dp_panel.h"
> +#include "dp_display.h"
>  #include "dp_utils.h"
>
>  #include <drm/drm_connector.h>
> @@ -455,6 +456,16 @@ static u32 msm_dp_panel_link_frequencies(struct device_node *of_node)
>         return frequency;
>  }
>
> +static u32 msm_dp_panel_max_width(struct device_node *of_node)
> +{
> +       u32 max_width = 0;
> +
> +       if (of_property_read_u32(of_node, "max-width", &max_width))
> +               max_width = DP_MAX_WIDTH;
> +
> +       return max_width;

msm_dp_panel->max_dp_width = DP_MAX_WIDTH;
of_property_read_u32(of_node, "max-width", &msm_dp_panel->max_dp_width);

> +}
> +
>  static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
>  {
>         struct msm_dp_panel_private *panel;
> @@ -490,6 +501,8 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
>         if (!msm_dp_panel->max_dp_link_rate)
>                 msm_dp_panel->max_dp_link_rate = DP_LINK_RATE_HBR2;
>
> +       msm_dp_panel->max_dp_width = msm_dp_panel_max_width(of_node);
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 7603b92c32902bd3d4485539bd6308537ff75a2c..61513644161209c243bbb623ee4ded951b2a0597 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -51,6 +51,7 @@ struct msm_dp_panel {
>         u32 lane_map[DP_MAX_NUM_DP_LANES];
>         u32 max_dp_lanes;
>         u32 max_dp_link_rate;
> +       u32 max_dp_width;
>
>         u32 max_bw_code;
>  };
>
> --
> 2.25.1
>


-- 
With best wishes
Dmitry


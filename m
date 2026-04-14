Return-Path: <linux-gpio+bounces-35146-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIAGEi063mkxpgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35146-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 14:59:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 667D53FA3D6
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 14:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 477373026319
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 12:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114053E122C;
	Tue, 14 Apr 2026 12:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MfjePii8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A223D34AC
	for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 12:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776171499; cv=none; b=U2OYcukP2rHsTzm3rCk88Cj7LcCVKQ7Z4lhRItP88rvQEmYwIPsSkmJFtXuSVc4IoG2/70wtxajMvvjKufnqzGmavk0WFMZCh1bwvJiUXmRHWWnscOmRK6JUx4o/T7zYNXRsW/3bLM0+ZWCgVVJMhEgyjgf67t6w7m3YAhPv1uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776171499; c=relaxed/simple;
	bh=i4uebc5Xl9rnrQVt2Cr/rxu/8VbW1w3APXN9f1U1rK4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KeVIUcYG7KrO88O7DB3pqARZk9R8ryt7QoDV0zw73MSvzRn83ET7NjV2KnXqj5Bx9D0mb1N7mPfi4DMDJXsxZyasJmdIbLDaJnr5mq1eL9IAtapOPnQzZuyTbxC5lsK2WpAZloiFJD1cCunEybvVnX8iUpAsK7yCgZOOh9J+qgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MfjePii8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso54116625e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 05:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776171495; x=1776776295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p21MIER5uy4Fua/gjgmr0WO7mkoCiyl364lxNom68rw=;
        b=MfjePii8tD/Kg6APr7eYFrxKsGaXDHpZy6FGBWb4Ervm+yCdzka6RDcXT+VrcDH5pk
         InIx9itXbspZFq9y1GFll6/kT8idniCzoYoh9fkFLGUHqWZVs7WRuXVMElZLmJmlzxiJ
         WrVmtnHfCx2LMGyIVylnaNsIH3wHJTHNYcF4ILbLybKGBW89Pl0N/S7zvck8ntkHZgw8
         PIpGbLY5EYCfosyFYz2dAGbwHu7FV/CT6NwJcuftnSyhpt7XPuS8hEbC2ibgc7dUGONz
         zoXGziuw6Ew/7Zum9BJN3Rt8NcGsWrkTvSRp44RkuwomKnllkUiOBBUb22avoS5fuQ/b
         fs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776171495; x=1776776295;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p21MIER5uy4Fua/gjgmr0WO7mkoCiyl364lxNom68rw=;
        b=h3YIWrIaMKy4u9iW1TgpSJoeF/1HUTTAoCRiCKcsvnos7EPebkJ3Eg2FhijZhhwPLC
         wliubT+s9ALcX9LKZqOBSX4M4kRl9eGme2f1STIGZ1YHL3t3Xv/q6KsxrWSQv0LhTDHb
         NmFZlHRWjKysh8OpTpef5YRmT5nZ9SxT+GLZhdbEZpQP3BxpSlSOZbLGpEzuiaFLm3gl
         Wh5UGrJHDST06OfcV1gQH+HkECYUc3DgQsCbhjIHrTBz55NfsQK8v5Dy/8LUeVZuZLso
         uiArmSxHdvYi1FzUux/W3PyMhWqdbEujpKbUJV0zgZUbdQ6wwROYYbtOEKmDMbuqmm2n
         IYwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IPb7A9SdzZiQhG81JNkDl15jZ/tKR6DRawvm9wFjmkAC0eyXenbaIQz49huVsGeWdTMgejBysSfgH@vger.kernel.org
X-Gm-Message-State: AOJu0YzEuL1K/YzDPdLWlKRH06alKI+WBcW1IPlsUsmxn+ZOr8yPyyAF
	WRZiDdD0IZQCzrFWe/BBNkMMlfYCyvdwsj7arZMIfGCY/eKMqly056kxHt0aAq7yDDU=
X-Gm-Gg: AeBDiev3we8mALg1Np7uAp8YWBplYbW7Sq47zhhnBojn2bkw9/A3ecqaCnNvaELh5R9
	3uMneQLEP+ZtXzQq9HNfQ+UKMxJs+sOEKsrZUhE8qFNmIx+2KowPYRk7ad9y1OkQ24dhRFuXMHS
	6WDJPVsRcbj72Ub5nL7rQi3zCxyYelpn9xsQ4XwM+igdZMOnhPMxEBRByrXdq5kLA6mMaXx8XJT
	gYHepp9YZAtoDwWPUTzfd3EPQDdbeOlEI9XFSk1UyLsE//5AkGoWUTOdqAT+gSHF/kmcxaDYunW
	aRZXoG8xGdeUhQex6HR/uP6RCUZD04LOpW4JiBWONHUWajrmc7RlUfQRrIGt40VmfMLJ623njw8
	/Zhg7mbcgGXi9N/tK7SRyX/JnLwNZNjTO+CAWeth/CuPI0rQ8tQ8pW+tTAxce3ob0l/xfBbOP8H
	LR/oIg8UiW2fP9m4MbAox5EGidwNjRzMTR8L6VDQC1GoBq7AOyYByWHBnBQPEeIgqA+AHYPhUx2
	6FPND+hvmV59v5It3LaLVBAzQ==
X-Received: by 2002:a05:600c:19cf:b0:485:2a4b:7bc3 with SMTP id 5b1f17b1804b1-488d67ebc6emr216740025e9.4.1776171495129;
        Tue, 14 Apr 2026 05:58:15 -0700 (PDT)
Received: from ?IPV6:2001:861:c12:13d0:5627:3bd0:f3ee:8a22? ([2001:861:c12:13d0:5627:3bd0:f3ee:8a22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede2ba5asm46036435e9.12.2026.04.14.05.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 05:58:14 -0700 (PDT)
Message-ID: <3e711e29-c587-4b32-af47-0343f75004d8@linaro.org>
Date: Tue, 14 Apr 2026 14:58:13 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 14/21] drm/panel: jadard-jd9365da-h3: support Waveshare
 round DSI panels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>,
 Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Riccardo Mereu <r.mereu@arduino.cc>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
 <20260413-waveshare-dsi-touch-v3-14-3aeb53022c32@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260413-waveshare-dsi-touch-v3-14-3aeb53022c32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35146-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arduino.cc:email,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 667D53FA3D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 16:05, Dmitry Baryshkov wrote:
> Add configuration for Waveshare 3.4" and 4.0" round DSI panels using
> JD9365 controller.
> 
> Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 476 +++++++++++++++++++++++
>   1 file changed, 476 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index bc079b97cfb3..61d67efed379 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -1599,6 +1599,474 @@ static const struct jadard_panel_desc taiguan_xti05101_01a_desc = {
>   	.enter_sleep_to_reset_down_delay_ms = 100,
>   };
>   
> +static int waveshare_3_4_c_init(struct jadard *jadard)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x00);
> +	jadard_enable_standard_cmds(&dsi_ctx);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x41);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xd0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xd0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x26);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x78);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x64);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0xc7);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x18);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x14);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x1b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x19);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x56);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x2a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x16);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x2f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x32);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x53);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x4c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x3d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x31);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x56);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x2a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x16);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x2f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x32);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x53);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x4c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x3d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x31);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x0f);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x5e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x5e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x4a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x4a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x46);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x46);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x42);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x5e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x5e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x4b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x4b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x41);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0xa6);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xd9);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x43);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x00);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	msleep(120);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	msleep(5);
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static const struct jadard_panel_desc waveshare_3_4_inch_c_desc = {
> +	.mode_2ln = &(const struct drm_display_mode) {
> +		.clock		= (800 + 40 + 20 + 20) * (800 + 24 + 4 + 12) * 60 / 1000,
> +
> +		.hdisplay	= 800,
> +		.hsync_start	= 800 + 40,
> +		.hsync_end	= 800 + 40 + 20,
> +		.htotal		= 800 + 40 + 20 + 20,
> +
> +		.vdisplay	= 800,
> +		.vsync_start	= 800 + 24,
> +		.vsync_end	= 800 + 24 + 4,
> +		.vtotal		= 800 + 24 + 4 + 12,
> +
> +		.width_mm	= 88,
> +		.height_mm	= 88,
> +		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +	},
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.init = waveshare_3_4_c_init,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +};
> +
> +static int waveshare_4_0_c_init(struct jadard *jadard)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x00);
> +	jadard_enable_standard_cmds(&dsi_ctx);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x41);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xd0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xd0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x26);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x78);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x64);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0xc7);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x18);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x14);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x1b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x19);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x56);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x2a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x16);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x2f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x32);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x53);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x4c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x3d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x31);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x56);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x2a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x16);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x2f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x32);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x53);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x4c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x3d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x31);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x0f);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x5e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x5e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x4a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x4a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x46);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x46);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x42);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x5e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x5e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x4b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x4b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x41);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0xa6);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xd9);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x43);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x00);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	msleep(120);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	msleep(5);
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static const struct jadard_panel_desc waveshare_4_0_inch_c_desc = {
> +	.mode_2ln = &(const struct drm_display_mode) {
> +		.clock		= (720 + 40 + 20 + 20) * (720 + 24 + 4 + 12) * 60 / 1000,
> +
> +		.hdisplay	= 720,
> +		.hsync_start	= 720 + 40,
> +		.hsync_end	= 720 + 40 + 20,
> +		.htotal		= 720 + 40 + 20 + 20,
> +
> +		.vdisplay	= 720,
> +		.vsync_start	= 720 + 24,
> +		.vsync_end	= 720 + 24 + 4,
> +		.vtotal		= 720 + 24 + 4 + 12,
> +
> +		.width_mm	= 88,
> +		.height_mm	= 88,
> +		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +	},
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.init = waveshare_4_0_c_init,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +};
> +
>   static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>   {
>   	struct device *dev = &dsi->dev;
> @@ -1722,6 +2190,14 @@ static const struct of_device_id jadard_of_match[] = {
>   		.compatible = "taiguanck,xti05101-01a",
>   		.data = &taiguan_xti05101_01a_desc
>   	},
> +	{
> +		.compatible = "waveshare,3.4-dsi-touch-c",
> +		.data = &waveshare_3_4_inch_c_desc
> +	},
> +	{
> +		.compatible = "waveshare,4.0-dsi-touch-c",
> +		.data = &waveshare_4_0_inch_c_desc
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, jadard_of_match);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


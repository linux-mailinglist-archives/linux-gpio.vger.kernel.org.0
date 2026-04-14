Return-Path: <linux-gpio+bounces-35147-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM+6NBw63mkxpgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35147-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 14:59:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D602F3FA3C1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 14:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9380F30172E8
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 12:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B010A3E63BE;
	Tue, 14 Apr 2026 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g5fqMHyb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA5E3E6389
	for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776171543; cv=none; b=nN1GATTjolSoy1Ne3i7+ZU0EL33mzaSLE+5xddTQj8Rd11s8dD3KPaPYlFXc2+Wm9jqQLWO5hzRXjuoTHxgjfqEPSpeU/1EQ8qoKoMYThFPGJTadsuNbWV/rGMLy6PH4XVKPY1KO1fNzfGy7QvJ0NrgrdsSybjsAfEuv4eiuXAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776171543; c=relaxed/simple;
	bh=NZI6D2XK9ZVRPkej5OhoY2twNPd7L0F4B1C8j+xbM/Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=O3Y20z0umcith9PX5uyRZhW1sO3Qo2aRBspLS3E82+1DKB/zqUpYT61wIVC2TUx4I1CNLmMQi27Mb2l1SD3pNjIjHBef/R1tA3IuVnJrQZcnyitb9E3ddxUk/KaQnG3GMYpngzuwtzjErD1u+pF6s7oS2fkmMrJId3e+BaR65vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g5fqMHyb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0046078so55283955e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 05:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776171539; x=1776776339; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tcc5/KRd6tdNgGgUfi11zlIghGQ8xzQPBYAELyGHWs=;
        b=g5fqMHybA+vaq6wBRQtBvwaLC1ohZOJP572SymglcrjUkaf9W2AOFnRmaBdRs0k+Q+
         NP5DywzQCbLNSBH1ahB94Hh9UMyF0W+wKYdPvL3zBj39jUaQk20RPRBAv9399yRm7YDY
         aMdYaVFmvb/R7iNZyO+dCsnv9Zo7ZngunRtFnBkkK69lGfv6uSjOnbeTMR4GZRVll30q
         rTOTkilikEdp6zafpPstISExVbxzd7NHD/ohNU58Uwx9Zy5hpq3D0YjXsWWD/3B8Pbfq
         VOvrw5p1AZRXms31TvZ4DOhKDSftzR6F423A5Kdf04C4TVeHLmfqzHFB/+Q5GEXlvynA
         Syqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776171539; x=1776776339;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tcc5/KRd6tdNgGgUfi11zlIghGQ8xzQPBYAELyGHWs=;
        b=eeXrHoxIAQ2DXY3rKnyib7hq5lwCZEl8c3Yf+zuKd3eGdL+lQpYHhYRGa/uMe9ZgJc
         16zhLPbg0uitdhA9NH3AU9+Acdor6BGgB/sOWBu6r5kh+9uHGNlI0WSr/Yrpg+z9ZVng
         ZcE3FSlWnGZ7rwMAaw3JXG4/2Dwg8mYJyW7bc5plWKH2/aWC8N0O6GcHBwolyCw0T0pA
         qAmgETWC5T66pwcOkLRZfR3kdn4RlXQgSNInsp7a87IAE9wZg7HjlIE0JLOhU0ep8rI+
         jEfqbIPMlVGwND2PUNynYFosBnSbEsvdT6QyV8uJetbl8ATaYoaLvv8gSZ1uf0NWICJf
         boAg==
X-Forwarded-Encrypted: i=1; AFNElJ9EDtqo306DxE717jiKjbKo/TVdm5tIN8k327KDKkt15RNDyYPzeSbJYuHal+IcmA1HCxbnDC+xBGlw@vger.kernel.org
X-Gm-Message-State: AOJu0YztfVngaqpTY5CsUZVG9fAVNHjTwfK9Ryn1SfPQw3QVsk3WoKRm
	yvjciZabPfx6NKxYZWVGwcA/E1a1KoKdCodm1D+OlxAa7rxHaSn12SnoTj2k1SFQFdU=
X-Gm-Gg: AeBDietbYHwfRBFDa4AvwySpr0YuyRQJYNwFSLyqRIc73lX24sHo4PuGRfqs0WXiYTr
	oWxrAoZ8GH43UGaPIMotpvBpIWV32GfHCY9doYBghuB32Zh1hcKYAh6CvzNdQ7kbwvLupY5qHu2
	ru4+v2QQdlLJTODzzDxyqqHIQvYqRsjsTRm4Ky19gDaK6nvKNSaDb5IULnwFJqQS4kXpgH74bE5
	FRNxDcZ0JRD8tNn8oZVbslQtb4lz1LkNCN6Mn6WvL4lpfoP7dEX7HMEfFmwopZwXyXF4u/O8HLA
	zmHO/MS7ihH7BLwEvRqo+3VZ93BzYSN/8WT2muMgAw8w31B2pf7G3HuEJq3SToEJB2QZNRsoEso
	ckwodCNH7P2fZoFWhlsPeIbOxcp/UaI/shE10frwn9a2RcSbAdBDrHjt3j1iid2/4FvxdnN+ZhL
	s3aw8MRSCQdKj00bD3xo3ZquBSLnsZd+r1EjSeQr5HOcNLKYaL5fCGr+ucFBmp3o0SinYEZ98Li
	REYf09pCO526TE=
X-Received: by 2002:a05:600c:8907:b0:488:c744:49b with SMTP id 5b1f17b1804b1-488d67d2cfcmr168168345e9.7.1776171538721;
        Tue, 14 Apr 2026 05:58:58 -0700 (PDT)
Received: from ?IPV6:2001:861:c12:13d0:5627:3bd0:f3ee:8a22? ([2001:861:c12:13d0:5627:3bd0:f3ee:8a22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488e10d69b2sm88855305e9.8.2026.04.14.05.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 05:58:58 -0700 (PDT)
Message-ID: <908b1360-e53d-4f33-82ce-4e2b67ddcfb7@linaro.org>
Date: Tue, 14 Apr 2026 14:58:57 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 15/21] drm/panel: jadard-jd9365da-h3: support Waveshare
 WXGA DSI panels
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
 <20260413-waveshare-dsi-touch-v3-15-3aeb53022c32@oss.qualcomm.com>
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
In-Reply-To: <20260413-waveshare-dsi-touch-v3-15-3aeb53022c32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35147-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arduino.cc:email,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: D602F3FA3C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 16:05, Dmitry Baryshkov wrote:
> Add configuration for several Waveshare 8.0" and 10.1" WXGA DSI panels
> using JD9365 controller
> 
> Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 568 +++++++++++++++++++++++
>   1 file changed, 568 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 61d67efed379..7744c66514c9 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -2067,6 +2067,566 @@ static const struct jadard_panel_desc waveshare_4_0_inch_c_desc = {
>   		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
>   };
>   
> +static int waveshare_8_0_a_init(struct jadard *jadard)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x00);
> +	jadard_enable_standard_cmds(&dsi_ctx);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
> +	if (jadard->dsi->lanes == 4)
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x7e);
> +	else
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x4e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x65);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xb7);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xb7);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x19);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x70);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0xa0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0xa9);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x19);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x78);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x63);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x54);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x38);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x3d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x41);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x62);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x23);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x78);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x63);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x54);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x38);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x3d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x41);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x62);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x23);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x10);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x4b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x4b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x41);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x35);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x46);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x46);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x4a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x4a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x35);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x6b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x56);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x7b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xf8);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0xd5);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x2e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x12);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x7b);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xb3);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x60);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x2a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x59);
> +	if (jadard->dsi->lanes != 4) {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x58);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x0f);
> +	}
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x00);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	msleep(120);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	msleep(60);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode waveshare_8_0_a_mode = {
> +	.clock		= (800 + 40 + 20 + 20) * (1280 + 30 + 12 + 4) * 60 / 1000,
> +
> +	.hdisplay	= 800,
> +	.hsync_start	= 800 + 40,
> +	.hsync_end	= 800 + 40 + 20,
> +	.htotal		= 800 + 40 + 20 + 20,
> +
> +	.vdisplay	= 1280,
> +	.vsync_start	= 1280 + 30,
> +	.vsync_end	= 1280 + 30 + 12,
> +	.vtotal		= 1280 + 30 + 12 + 4,
> +
> +	.width_mm	= 107,
> +	.height_mm	= 172,
> +	.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct jadard_panel_desc waveshare_8_0_inch_a_desc = {
> +	.mode_4ln = &waveshare_8_0_a_mode,
> +	.mode_2ln = &waveshare_8_0_a_mode,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.init = waveshare_8_0_a_init,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +};
> +
> +static const struct drm_display_mode waveshare_10_1_a_mode = {
> +	.clock		= (800 + 40 + 20 + 20) * (1280 + 20 + 20 + 4) * 60 / 1000,
> +
> +	.hdisplay	= 800,
> +	.hsync_start	= 800 + 40,
> +	.hsync_end	= 800 + 40 + 20,
> +	.htotal		= 800 + 40 + 20 + 20,
> +
> +	.vdisplay	= 1280,
> +	.vsync_start	= 1280 + 20,
> +	.vsync_end	= 1280 + 20 + 20,
> +	.vtotal		= 1280 + 20 + 20 + 4,
> +
> +	.width_mm	= 135,
> +	.height_mm	= 216,
> +	.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static int waveshare_10_1_a_init(struct jadard *jadard)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x00);
> +	jadard_enable_standard_cmds(&dsi_ctx);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
> +	if (jadard->dsi->lanes == 4)
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x3b);
> +	else {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x38);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x10);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x38);
> +	}
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xaf);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xaf);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x26);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x78);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0xa0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x81);
> +	if (jadard->dsi->lanes == 4) {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x14);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x23);
> +	} else {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0d);
> +	}
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x69);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x2a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
> +	if (jadard->dsi->lanes == 4) {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x6b);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x5c);
> +	} else  {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x6a);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x5b);
> +	}
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x4f);
> +	if (jadard->dsi->lanes == 4) {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x4d);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x3f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x42);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x2b);
> +	} else {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x4a);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x3d);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x41);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x2a);
> +	}
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x43);
> +	if (jadard->dsi->lanes == 4) {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x43);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x63);
> +	} else {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x44);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x62);
> +	}
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x52);
> +	if (jadard->dsi->lanes == 4) {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x5a);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x4f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x4e);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x20);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x0f);
> +	} else {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x59);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x4c);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x48);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x3a);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x26);
> +	}
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
> +	if (jadard->dsi->lanes == 4) {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x6b);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x5c);
> +	} else {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x6a);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x5b);
> +	}
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x4f);
> +	if (jadard->dsi->lanes == 4) {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x4d);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x3f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x42);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x2b);
> +	} else {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x4a);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x3d);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x41);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x2a);
> +	}
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x43);
> +	if (jadard->dsi->lanes == 4) {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x43);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x63);
> +	} else {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x44);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x62);
> +	}
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x52);
> +	if (jadard->dsi->lanes == 4) {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x5a);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x4f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x4e);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x20);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x0f);
> +	} else {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x59);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x4c);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x48);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x3a);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x26);
> +	}
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x00);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x02);
> +	if (jadard->dsi->lanes == 4) {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x02);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x02);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x00);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x00);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x1e);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x1e);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x1f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x1f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x1f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x17);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x17);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x37);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x37);
> +	} else {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x42);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x42);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x40);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x40);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x5e);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x5e);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x5f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x5f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x5f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x57);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x57);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x77);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x77);
> +	}
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x4b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x4b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x49);
> +	if (jadard->dsi->lanes == 4) {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x1f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x01);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x01);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x00);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x1e);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x1e);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x1f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x1f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x1f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x17);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x17);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x37);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x37);
> +	} else {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x41);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x41);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x40);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x40);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x5e);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x5e);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x5f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x5f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x5f);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x57);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x57);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x77);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x77);
> +	}
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x46);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x46);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x4a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x4a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x48);
> +	if (jadard->dsi->lanes == 4)
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x1f);
> +	else
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x30);
> +	if (jadard->dsi->lanes == 4)
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x16);
> +	else
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x34);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x6a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
> +	if (jadard->dsi->lanes == 4)
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x1d);
> +	else
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x6a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0xdd);
> +	if (jadard->dsi->lanes == 4)
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x3f);
> +	else
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x2c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x15);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x14);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x82);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xb3);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x61);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x48);
> +	if (jadard->dsi->lanes != 4) {
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x58);
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x0f);
> +	}
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe7, 0x0c);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	msleep(120);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	msleep(60);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static const struct jadard_panel_desc waveshare_10_1_inch_a_desc = {
> +	.mode_4ln = &waveshare_10_1_a_mode,
> +	.mode_2ln = &waveshare_10_1_a_mode,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.init = waveshare_10_1_a_init,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +};
> +
>   static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>   {
>   	struct device *dev = &dsi->dev;
> @@ -2198,6 +2758,14 @@ static const struct of_device_id jadard_of_match[] = {
>   		.compatible = "waveshare,4.0-dsi-touch-c",
>   		.data = &waveshare_4_0_inch_c_desc
>   	},
> +	{
> +		.compatible = "waveshare,8.0-dsi-touch-a",
> +		.data = &waveshare_8_0_inch_a_desc
> +	},
> +	{
> +		.compatible = "waveshare,10.1-dsi-touch-a",
> +		.data = &waveshare_10_1_inch_a_desc
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, jadard_of_match);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


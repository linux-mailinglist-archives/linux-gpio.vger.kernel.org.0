Return-Path: <linux-gpio+bounces-35145-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN7lGcI53mkxpgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35145-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 14:57:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1E43FA383
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 14:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58B25304EB95
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 12:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4024B3E63B9;
	Tue, 14 Apr 2026 12:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqhHOkfC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4700B3E5596
	for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776171448; cv=none; b=qxkcxOI37AhSjE8Q+YIM+YUjOYu1sVf4J+Qih5ALVCkCyViTM8VbGZ3BGa9D1nAXf1Bs8/qNx/QTLeWAmRhp94UeTHgEC+pBuooCFLBSNxsSjyj9uTHcLxEXEgl4VtSH+c59tpGy4burlfWzTgoIxVpqTCdKNMcsfP+9BL7OgRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776171448; c=relaxed/simple;
	bh=e/s4sHiPD188qy99lreTnt+v6QiRnMlL22G3zDTSYJs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=s4bNx0Xysb1ewcyscpEUPfOs2a1uLXJhXrBhVJKH+V5aowEmdrdXJcQboaIWFoV1AT7UFORtSeDKpk2rqVmw3kUJVK/jrx4SnABKz8tzCaTNG4PNHADrVRyhtlsRsoBRO4HZHIwDXfSivzJuPOuSy3kzM/WgDdL/+tq9sFNAZ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oqhHOkfC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso45804695e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776171444; x=1776776244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNKljDlGgBzgahYp2+OYLG0r/HqoCgAeLqufCE/G6VA=;
        b=oqhHOkfC6WEX90BmNcFWXQ8g5zjiM2C7ZAzwPrhcJCEoQmxWu8RNyn0Uw37teNyFua
         Zd7dUqsoit+WGeDc6bAXj3HuyU3C23SgTFFs9LmpU4H+UB22YMtm31ynOy2PXSOgTpxy
         D5tsBtRqLY0Qvids3My7O++ExW+0zCSrImDIJzMs0unomWbSkssWxA743V+tfuEUlGVp
         jN3nnW5F5W3WEdsVyN3gebMFL74+g8domFR7R7hbxLzdQYPez29Zud56Jnr0pc53ZthX
         VSHxk/SfBTjGwC4ySIbo7k7534Ci6zI9NTQA5/nvje+9nhtAx2H2pSIcLMlzr9qm2V3J
         lgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776171444; x=1776776244;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNKljDlGgBzgahYp2+OYLG0r/HqoCgAeLqufCE/G6VA=;
        b=RDipLvxTRSJvS4ej4ht5SJh4eht8sRzQRc72+TeFaElInDpgrUqJYycahzEp+nXFuR
         u5FgYvlSmyuk00KR2aLH4rmy+f8hfvtPslPT2G9Jco2PwW6LgIlPftJJcPraeK1AdLXv
         X92srJMhRTelcEJp0ZvVIQTEsn2yCQHoSICD8YGzgXasR64WyWccJbFGSeJLd0Cqz5Bh
         EuOGEgJrXlyOXvyJPHwOAx/A6TVhi4NcW88Urd2b0jOe6RTq0fYtZMUZgyAK8DDwl8FD
         1Fj4OFTipSdUIv6YET1CSGPOIQJEx2ZQa2b3+DLl52/mpU6CFYXxLEQ5KU/E5KXTsZOT
         LniA==
X-Forwarded-Encrypted: i=1; AFNElJ+DpwE5gM5OWh997X+u0jjz9WVcrU/Jw7opm8m+gwDUb02V0NOiMcI3PK3gcNmmDqZiyNYaVYQUJVvx@vger.kernel.org
X-Gm-Message-State: AOJu0YyzqrTo/uaexARG3t/MrVQ7pNbYQO5tExXWl6fg3hzsjCADNkFf
	wxiP+vjtkUBujpewN1SfalP+IerZG4R9rZm27qOAO81hXWsOWSsafw9Slnfb8UG3xj0=
X-Gm-Gg: AeBDiesbXbSetDun0aXEMxY7A5wOGRY/UBhi5uIiHUpKa2kRXxS2QO7J0+Xd9usaVBq
	JMPHeXB0fLFXdJY2EsIMFK2U+iuqsFGj1LUZCquUzaB4XR9qidYtZQ4K4WSNtM+MuHfzpPzQ4mE
	I0jFJcaSGUQKWvFiCOZ3bJ+2EeY+ANasSUR9qKbNWnue2wrthpHOxsnVnse3yhM9Uah0RsXG4Sm
	mbkCGQdDy7zMRA1zrx2AhAX3zNquWABXCSDqs/NNI7rMTcDPBPgGGw+lqIh3FCHTdLzbDvn+E0k
	TSKHIU7QyG+S9tPVLxfJFsCGN1cfWPjpuueDfqIhcj5ruxxR+VG2P2VCW/U/d2TqJ0rHkt9qcvt
	onvK2nNM/V/dza9ls9/M5ujyopyWEsj8jlt/t9kVwG9YbvQENRLBOk3/l5NUYpwbFFG5PnIkT62
	6+yPwiEzuH+qBNvluWUUzM90u+2RqLMYKYGt37kBABc6NFoB2z6egAEln4h3IDHRVNFi9/Wj1kU
	aa96nlyooYX44Y=
X-Received: by 2002:a05:600c:8709:b0:488:945a:ed63 with SMTP id 5b1f17b1804b1-488d6655adfmr241167395e9.0.1776171443536;
        Tue, 14 Apr 2026 05:57:23 -0700 (PDT)
Received: from ?IPV6:2001:861:c12:13d0:5627:3bd0:f3ee:8a22? ([2001:861:c12:13d0:5627:3bd0:f3ee:8a22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67ced32sm168139455e9.7.2026.04.14.05.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 05:57:23 -0700 (PDT)
Message-ID: <b4f4d47f-b995-4554-81ed-9b47727582e7@linaro.org>
Date: Tue, 14 Apr 2026 14:57:22 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 07/21] drm/panel: himax-hx83102: support Waveshare
 12.3" DSI panel
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
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
 <20260413-waveshare-dsi-touch-v3-7-3aeb53022c32@oss.qualcomm.com>
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
In-Reply-To: <20260413-waveshare-dsi-touch-v3-7-3aeb53022c32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35145-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 1C1E43FA383
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 16:05, Dmitry Baryshkov wrote:
> Add support for the Waveshare 12.3" DSI TOUCH-A panel. According to the
> vendor driver, it uses different mode_flags, so let the panel
> descriptions override driver-wide defaults.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx83102.c | 144 +++++++++++++++++++++++++++-
>   1 file changed, 142 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> index 8b2a68ee851e..eab67893da86 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> @@ -29,11 +29,14 @@
>   #define HX83102_UNKNOWN_B8	0xb8
>   #define HX83102_SETEXTC		0xb9
>   #define HX83102_SETMIPI		0xba
> +#define HX83102_UNKNOWN_BB	0xbb
>   #define HX83102_SETVDC		0xbc
>   #define HX83102_SETBANK		0xbd
>   #define HX83102_UNKNOWN_BE	0xbe
>   #define HX83102_SETPTBA		0xbf
>   #define HX83102_SETSTBA		0xc0
> +#define HX83102_UNKNOWN_C2	0xc2
> +#define HX83102_UNKNOWN_C6	0xc6
>   #define HX83102_SETTCON		0xc7
>   #define HX83102_SETRAMDMY	0xc8
>   #define HX83102_SETPWM		0xc9
> @@ -78,6 +81,7 @@ struct hx83102_panel_desc {
>   	} size;
>   
>   	bool has_backlight;
> +	unsigned long mode_flags;
>   
>   	int (*init)(struct hx83102 *ctx);
>   };
> @@ -765,6 +769,111 @@ static int holitech_htf065h045_init(struct hx83102 *ctx)
>   	return dsi_ctx.accum_err;
>   }
>   
> +/* This is HX83102-E, assuming commands are the same as the normal HX83102 */
> +static int waveshare_12_3_a_init(struct hx83102 *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETEXTC, 0x83, 0x10, 0x2e);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcd);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BB, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x67, 0x2c, 0xff, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BE, 0x11, 0x96, 0x89);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D9, 0x04, 0x03, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER,
> +				     0x10, 0xfa, 0xaf, 0xaf, 0x33, 0x33, 0xb1, 0x4d, 0x2f, 0x36,
> +				     0x36, 0x36, 0x36, 0x22, 0x21, 0x15, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP,
> +				     0x00, 0xd0, 0x27, 0x80, 0x00, 0x14, 0x40, 0x2c, 0x32, 0x02,
> +				     0x00, 0x00, 0x15, 0x20, 0xd7, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC,
> +				     0x98, 0xa0, 0x01, 0x01, 0x98, 0xa0, 0x68, 0x50, 0x01, 0xc7,
> +				     0x01, 0x58, 0x00, 0xff, 0x00, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_B6, 0x4d, 0x4d, 0xe3);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0x85, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x33, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0,
> +				     0x00, 0x00, 0x00, 0x00, 0x64, 0x04, 0x00, 0x08, 0x08, 0x27,
> +				     0x27, 0x22, 0x2f, 0x15, 0x15, 0x04, 0x04, 0x32, 0x10, 0x13,
> +				     0x00, 0x13, 0x32, 0x10, 0x1f, 0x00,
> +				     0x02, 0x32, 0x17, 0xfd, 0x00, 0x10, 0x00, 0x00, 0x20,
> +				     0x30, 0x01, 0x55, 0x21, 0x38, 0x01, 0x55, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGMA,
> +				     0x00, 0x0c, 0x1a, 0x23, 0x2b, 0x4f, 0x64, 0x69, 0x6c, 0x64,
> +				     0x77, 0x77, 0x76, 0x80, 0x79, 0x7e, 0x85, 0x9a, 0x97, 0x4d,
> +				     0x56, 0x64, 0x70, 0x00, 0x0c, 0x1a, 0x23, 0x2b, 0x4f, 0x64,
> +				     0x69, 0x6c, 0x64, 0x77, 0x77, 0x76, 0x80, 0x79, 0x7e, 0x85,
> +				     0x9a, 0x97, 0x4d, 0x56, 0x64, 0x76);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x01, 0x9b, 0x01, 0x31);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK,
> +				     0x80, 0x36, 0x12, 0x16, 0xc0, 0x28, 0x40, 0x84, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0,
> +				     0x01, 0x00, 0xfc, 0x00, 0x00, 0x11, 0x10, 0x00, 0x0e, 0x00,
> +				     0x01);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x4e, 0x00, 0x33, 0x11, 0x33, 0x88);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xf2, 0x00, 0x02);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSTBA,
> +				     0x23, 0x23, 0x22, 0x11, 0xa2, 0x17, 0x00, 0x80, 0x00, 0x00,
> +				     0x08, 0x00, 0x63, 0x63);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_C6, 0xf9);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRAMDMY,
> +				     0x00, 0x04, 0x04, 0x00, 0x00, 0x82, 0x13, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCASCADE, 0x07, 0x04, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1,
> +				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x21, 0x20, 0x21, 0x20,
> +				     0x01, 0x00, 0x03, 0x02, 0x05, 0x04, 0x07, 0x06, 0x1a, 0x1a,
> +				     0x1a, 0x1a, 0x9a, 0x9a, 0x9a, 0x9a, 0x18, 0x18, 0x18, 0x18,
> +				     0x21, 0x20, 0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +				     0x18, 0x18, 0x18, 0x18);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP2,
> +				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x20, 0x21, 0x20, 0x21,
> +				     0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x1a, 0x1a,
> +				     0x1a, 0x1a, 0x1a, 0x1a, 0x1a, 0x1a, 0x18, 0x18, 0x18, 0x18,
> +				     0x20, 0x21, 0x20, 0x21, 0x98, 0x98, 0x98, 0x98, 0x98, 0x98,
> +				     0x98, 0x98, 0x98, 0x98);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1,
> +				     0x00, 0x34, 0x01, 0x88, 0x0e, 0xbe, 0x0f);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_C2, 0x43, 0xff, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x80);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3,
> +				     0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
> +				     0xaa, 0xaa, 0xaa, 0x80, 0x2a, 0xaa, 0xaa, 0xaa, 0xaa, 0x80,
> +				     0x2a, 0xaa, 0xaa, 0xaa);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3,
> +				     0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
> +				     0xaa, 0xaa);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3,
> +				     0xff, 0xff, 0xff, 0xff,
> +				     0xff, 0xf0, 0xff, 0xff,
> +				     0xff, 0xff, 0xff, 0xf0);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +
> +	return dsi_ctx.accum_err;
> +};
> +
>   static const struct drm_display_mode starry_mode = {
>   	.clock = 162680,
>   	.hdisplay = 1200,
> @@ -920,6 +1029,30 @@ static const struct hx83102_panel_desc holitech_htf065h045_desc = {
>   	.init = holitech_htf065h045_init,
>   };
>   
> +static const struct drm_display_mode waveshare_12_3_a_mode = {
> +	.clock = 95000,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 10,
> +	.hsync_end = 720 + 10 + 10,
> +	.htotal = 720 + 10 + 10 + 12,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 64,
> +	.vsync_end = 1920 + 64 + 18,
> +	.vtotal = 1920 + 64 + 18 + 4,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct hx83102_panel_desc waveshare_12_3_inch_a_desc = {
> +	.modes = &waveshare_12_3_a_mode,
> +	.size = {
> +		.width_mm = 109,
> +		.height_mm = 292,
> +	},
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.init = waveshare_12_3_a_init,
> +};
> +
>   static int hx83102_enable(struct drm_panel *panel)
>   {
>   	msleep(130);
> @@ -1168,8 +1301,12 @@ static int hx83102_probe(struct mipi_dsi_device *dsi)
>   	desc = of_device_get_match_data(&dsi->dev);
>   	dsi->lanes = 4;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> -					  MIPI_DSI_MODE_LPM;
> +	if (desc->mode_flags)
> +		dsi->mode_flags = desc->mode_flags;
> +	else
> +		dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> +			MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +			MIPI_DSI_MODE_LPM;
>   	ctx->desc = desc;
>   	ctx->dsi = dsi;
>   	ret = hx83102_panel_add(ctx);
> @@ -1220,6 +1357,9 @@ static const struct of_device_id hx83102_of_match[] = {
>   	{ .compatible = "holitech,htf065h045",
>   	  .data = &holitech_htf065h045_desc
>   	},
> +	{ .compatible = "waveshare,12.3-dsi-touch-a",
> +	  .data = &waveshare_12_3_inch_a_desc
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, hx83102_of_match);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


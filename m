Return-Path: <linux-gpio+bounces-35059-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id e7jUAjzw2ml27QgAu9opvQ
	(envelope-from <linux-gpio+bounces-35059-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 03:07:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 539D13E2478
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 03:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F3D530191A2
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 01:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29341261B71;
	Sun, 12 Apr 2026 01:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDK5SyAt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eAAjnHbK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8080B22425B
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 01:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775956023; cv=none; b=Lsm6P08qrZFSdoJc2uKsu4whM+5goP+PCaPSZ0UoggIM9W35YhLReIZ+zgbuA2Foq/qHd9QtrBuwQbJQhIlNdl+k2RMxwxIIW1cNwpaaIQJw8UCqSWCfyY24EBFdD+jQEUGjnOzQwxIpOoOCmtXErPcuY8eHrni4LW9ZPmNae14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775956023; c=relaxed/simple;
	bh=QDUhZKKvtr2X4IM8glTRV7TMMVZIqOuU1zNVoqUWBM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWB167xzgbOmiOITUFjM9zrirPUF+KO4jDcZi0SM+Bk0ujs43oQzn0jZX4ArqPbJiYMkqbwfzAAxkS/7azFXxfc9b1y8NiygHgnODhlYtOMZsk88HYj+XzSGuXQgi0LxppSvq5TSgkb73XA0bXHHsO2KQf4t5EubA1Hl2oTvnj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDK5SyAt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eAAjnHbK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BMtIw5710111
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 01:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cj8Mv/ie2mU8MZuhnfvt5j6+NsZ00dsXgrPHeC4p2KE=; b=bDK5SyAtxhPNqro1
	6lhbERpWBuOxd727/SN+AagqeMkwhsq11T80PHXYmWmgYQIDidfkzGbKUlSuOgLh
	81a5IIkZlY5ym4OmJE7vaSgSrr2ydiB/SllrKh5wmxACnts2QAkaTJqr6RSzATL3
	W5fZzRyXSeL3+SvF3r8Sh0fU5beg+tSouU9erl/8TwRgdTePokqXb25DQJzB/Y8s
	dV+0fTP1rn8OorLmkcB3CyhAk9uB5GeSLYiKYvlOG2egFzhvaq2FHhgVqaphNKgS
	0+N5u6OPx4utNo2Lj+XlTSsHDykiu6OuglzlhYnpasQRvxZBdXB/XxvxCUpd4CXp
	KyrFVQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfeyysm1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 01:07:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2ec17dc21so2278055ad.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 18:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775956021; x=1776560821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cj8Mv/ie2mU8MZuhnfvt5j6+NsZ00dsXgrPHeC4p2KE=;
        b=eAAjnHbK0E2dnl4110m8G7lf4RyD4KCHQgzKLz6CC9tA75G7IJRQB52CEGcD2NEm07
         VhC46xwyE9QHLX1f/zjz6/FuH4H39h9rvCGaVSlC1k6vyra2DJpsPJ4Md7C3PJeUub6X
         ydGNiqXBO8nrPckmQ+JIIvvWZQyzdlhGgWJdBeprtawFxz3mCdRa6L+FN6YhrD+vA8wC
         NoKSuOOPUl5tQCe1Q+rcWfvK6BoYZFmFAz00g0dCnrVYUZgzJ7sK+d51Xswu4npwgJ6Y
         1blv70GiY5TaSV+nDLiH/WiPsSaphNCGYe670vydlfd9XQxuQtEEfWuhUc+hrZOXkd3n
         W66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775956021; x=1776560821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cj8Mv/ie2mU8MZuhnfvt5j6+NsZ00dsXgrPHeC4p2KE=;
        b=jn4T9FoF6phGAzrW6e8xnSHaxvll7IIk6TtxiOF0NVrWLv6eZa12uWf8TMjdtU8xEx
         38wEvSrtqVaMC//eqk2yBxDfdbuzLhFukM/tKPUXqPaPw88f6FqXfW/EuXt4/hBpCgWr
         unsB4+dItYZexjPYvTOzkH1hbEDrK1sSjENM+2yz2WLn6DzWr1dekLZLumGhK2AQlsLo
         xdUu66ez33vjOqLYTrDi25SDCvQPrF0/11UMdhvipbrJLMdHaDrzc30KX+RCK6XhoxVM
         iXZT6nXV3aWBWqptBNONOacpd/5fLop8xSA8tg8vjnqDX0iPyzIgRhLfVxFIGfB94ZKE
         I09Q==
X-Forwarded-Encrypted: i=1; AFNElJ9/L9Kl2emGmMgUEAK3PccAqrrjgEskuX5Sq3R3JJvfoWYXwMMjjUBl7gqqW/nIXWe0zhJSWl22hrWN@vger.kernel.org
X-Gm-Message-State: AOJu0YxzNIxIueNHKvXs1iBZr+hb7TXJGzZ9MdBcjW8u9d1IsGyzWSho
	80/vUPlrrGpSHfeeAtiDiUgaZVFEXNCoPmURVgfHH5Qagf68cdpBwlIvkZw2jXUan0XOpE0mPAi
	XNuJDj17jAC4VCPLgA6XHwlqEA0Po7Fwtn/N+HbD/ZC7UflFFzwI6fjDjvZLi3B7X
X-Gm-Gg: AeBDieuRCJ+7T8OghjngKgPRzL4Vjla0O6AnXpfAWYljjkgoZBJqaoFS8sXLwVclInl
	ypOXmLmpc4FvYtkEtD7S06I1wETeRn0uxAD4rChgr6ZAXdr+dwwvOI5sTnWq8nX+Wr9f6jMxHr9
	t/qDnaQi7Ccjj0XaGTb/yE47At6ewiSS27biDCCZ6cmM2ZFC4C6Aj5fltJB9Rhs66ohITvaHgBg
	rUCPdGwQL9s24TWbLZbbk9mko5xoAcS3bSWOLQ1ygEJ78JeI4mBCSPQRnJwKmWpf3a+ggxnMDyN
	3OENO4JfrFzcW6Etao4a089ANCWAdpV69Wg4CVBfWY4HEImeA01f4Ef0/h6w+nn2mvG67aHCWP6
	fcLTnyOYl0jbiFdgTQ2oaFdUob0oOuq3ChvsytCWfTTNAnyGzoYBkvteqCtlfl8zofjUq5v9Qqq
	6OmpD9N1BOhA==
X-Received: by 2002:a17:902:a982:b0:2b0:445a:8c7b with SMTP id d9443c01a7336-2b2d59a0c3cmr64582125ad.15.1775956020871;
        Sat, 11 Apr 2026 18:07:00 -0700 (PDT)
X-Received: by 2002:a17:902:a982:b0:2b0:445a:8c7b with SMTP id d9443c01a7336-2b2d59a0c3cmr64581845ad.15.1775956020278;
        Sat, 11 Apr 2026 18:07:00 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f27048sm67859815ad.62.2026.04.11.18.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 18:06:59 -0700 (PDT)
Message-ID: <5d1dd70e-0300-4ca0-adb9-73f03cf4bf4d@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 09:06:51 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/21] gpio: add GPIO controller found on Waveshare DSI
 TOUCH panels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Riccardo Mereu <r.mereu@arduino.cc>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
 <20260411-waveshare-dsi-touch-v2-21-75cdbeac5156@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-21-75cdbeac5156@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: j3FcY8TlpOm_61YupUNfMUJJoElSxl-9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDAwOCBTYWx0ZWRfXwy3ernMJYgR/
 kA9qn8CmX1ySzn89r4wpNBEq/NcP/SjEEN12GSyBE2FmFrCDj4OncRyzoevD3kgqF2Rh6+SkIOU
 f8/by8R3M8av3kLf0XGHp150f5SRrSu3o95Dhu3g+lUFtIeuU/g8ATiATrG/BPsmIZZx+69Co76
 FRRuYgl9P3tU6xFqMWgvS3Z8M/i+8bBvEx1jEGSZKBjN+t2hId5A2HlnR8Ut1vRdUHcyCsjXZvf
 BlAIaTGFOY5Z0kPk7aGXs72thINiPdF9JNQ5NyGdZGHJdXDFu7Wa5OTHlOzackptu457CNpXOI8
 wKj+shKYuUhnF1Y4SYMbwis8t1vo9+zYo18zJUneX3KP2byIVVcj1xQwmQRzKkqQ8TFbf19Jxhp
 2iw/XwB6a63LWlGN4AyEdmskhM1fsbs+boJnoW5aauxRcTUF4lNPjPXWZnqrOKfuEYhce0/4nz8
 IxbgxX1BQ5OZHcK5HoA==
X-Authority-Analysis: v=2.4 cv=FPQrAeos c=1 sm=1 tr=0 ts=69daf035 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=f_8IO1HHPxn9Zh0c9RAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: j3FcY8TlpOm_61YupUNfMUJJoElSxl-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120008
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35059-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,arduino.cc:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 539D13E2478
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/11/2026 8:10 PM, Dmitry Baryshkov wrote:
> The Waveshare DSI TOUCH family of panels has separate on-board GPIO
> controller, which controls power supplies to the panel and the touch
> screen and provides reset pins for both the panel and the touchscreen.
> Also it provides a simple PWM controller for panel backlight. Add
> support for this GPIO controller.
> 
> Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpio/Kconfig              |  10 ++
>   drivers/gpio/Makefile             |   1 +
>   drivers/gpio/gpio-waveshare-dsi.c | 208 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 219 insertions(+)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index dbe7c6e63eab..1b210c451151 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -805,6 +805,16 @@ config GPIO_VISCONTI
>   	help
>   	  Say yes here to support GPIO on Tohisba Visconti.
>   
> +config GPIO_WAVESHARE_DSI_TOUCH
> +	tristate "Waveshare GPIO controller for DSI panels"
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  Enable support for the GPIO and PWM controller found on Waveshare DSI
> +	  TOUCH panel kits. It provides GPIOs (used for regulator control and
> +          resets) and backlight support.
> +
>   config GPIO_WCD934X
>   	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 GPIO controller driver"
>   	depends on MFD_WCD934X
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 20d4a57afdaa..75ce89fc3b93 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -207,6 +207,7 @@ obj-$(CONFIG_GPIO_VIRTUSER)		+= gpio-virtuser.o
>   obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
>   obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
>   obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
> +obj-$(CONFIG_GPIO_WAVESHARE_DSI_TOUCH)	+= gpio-waveshare-dsi.o
>   obj-$(CONFIG_GPIO_WCD934X)		+= gpio-wcd934x.o
>   obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
>   obj-$(CONFIG_GPIO_WINBOND)		+= gpio-winbond.o
> diff --git a/drivers/gpio/gpio-waveshare-dsi.c b/drivers/gpio/gpio-waveshare-dsi.c
> new file mode 100644
> index 000000000000..f4a1d4d3b872
> --- /dev/null
> +++ b/drivers/gpio/gpio-waveshare-dsi.c
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Waveshare International Limited
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/err.h>
> +#include <linux/fb.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +/* I2C registers of the microcontroller. */
> +#define REG_TP		0x94
> +#define REG_LCD		0x95
> +#define REG_PWM		0x96
> +#define REG_SIZE	0x97
> +#define REG_ID		0x98
> +#define REG_VERSION	0x99
> +
> +enum {
> +	GPIO_AVDD = 0,
> +	GPIO_PANEL_RESET = 1,
> +	GPIO_BL_ENABLE = 2,
> +	GPIO_IOVCC = 4,
> +	GPIO_VCC = 8,
> +	GPIO_TS_RESET = 9,
> +};
> +
> +#define NUM_GPIO 16
> +
> +struct waveshare_gpio {
> +	struct mutex dir_lock;
> +	struct mutex pwr_lock;
> +	struct regmap *regmap;
> +	u16 poweron_state;
> +
> +	struct gpio_chip gc;
> +};
> +
> +static const struct regmap_config waveshare_gpio_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = REG_PWM,

.max_register = REG_VERSION,

check comments in probe

> +};
> +
> +static int waveshare_gpio_get(struct waveshare_gpio *state, unsigned int offset)
> +{
> +	u16 pwr_state;
> +
> +	guard(mutex)(&state->pwr_lock);
> +	pwr_state = state->poweron_state & BIT(offset);
> +
> +	return !!pwr_state;
> +}
> +
> +static int waveshare_gpio_set(struct waveshare_gpio *state, unsigned int offset, int value)
> +{
> +	u16 last_val;
> +	int err;
> +
> +	guard(mutex)(&state->pwr_lock);
> +
> +	last_val = state->poweron_state;
> +	if (value)
> +		last_val |= BIT(offset);
> +	else
> +		last_val &= ~BIT(offset);
> +
> +	state->poweron_state = last_val;
> +
> +	err = regmap_write(state->regmap, REG_TP, last_val >> 8);
> +	if (!err)
> +		err = regmap_write(state->regmap, REG_LCD, last_val & 0xff);
> +
> +	return err;
> +}
> +
> +static int waveshare_gpio_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +	return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int waveshare_gpio_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct waveshare_gpio *state = gpiochip_get_data(gc);
> +
> +	return waveshare_gpio_get(state, offset);
> +}
> +
> +static int waveshare_gpio_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
> +{
> +	struct waveshare_gpio *state = gpiochip_get_data(gc);
> +
> +	return waveshare_gpio_set(state, offset, value);
> +}
> +
> +static int waveshare_gpio_update_status(struct backlight_device *bl)
> +{
> +	struct waveshare_gpio *state = bl_get_data(bl);
> +	int brightness = backlight_get_brightness(bl);
> +
> +	waveshare_gpio_set(state, GPIO_BL_ENABLE, brightness);
> +
> +	return regmap_write(state->regmap, REG_PWM, brightness);
> +}
> +
> +static const struct backlight_ops waveshare_gpio_bl = {
> +	.update_status = waveshare_gpio_update_status,
> +};
> +
> +static int waveshare_gpio_probe(struct i2c_client *i2c)
> +{
> +	struct backlight_properties props = {};
> +	struct waveshare_gpio *state;
> +	struct device *dev = &i2c->dev;
> +	struct backlight_device *bl;
> +	struct regmap *regmap;
> +	unsigned int data;
> +	int ret;
> +
> +	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	ret = devm_mutex_init(dev, &state->dir_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_mutex_init(dev, &state->pwr_lock);
> +	if (ret)
> +		return ret;
> +
> +	regmap = devm_regmap_init_i2c(i2c, &waveshare_gpio_regmap_config);

for waveshare_gpio_regmap_config: .max_register = REG_PWM,

> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to allocate register map\n");
> +
> +	state->regmap = regmap;
> +	i2c_set_clientdata(i2c, state);
> +
> +	ret = regmap_read(regmap, REG_ID, &data);

REG_ID here is 0x98,

in _regmap_read -> regmap_readable will check the max_register, then 
return -EIO.

> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read register\n");
> +
> +	dev_dbg(dev, "waveshare panel hw id = 0x%x\n", data);
> +
> +	ret = regmap_read(regmap, REG_SIZE, &data);

ditto.

Thanks,
Jie

> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read register\n");
> +
> +	dev_dbg(dev, "waveshare panel size = %d\n", data);
> +
> +	ret = regmap_read(regmap, REG_VERSION, &data);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read register\n");
> +
> +	dev_dbg(dev, "waveshare panel mcu version = 0x%x\n", data);
> +
> +	ret = waveshare_gpio_set(state, GPIO_TS_RESET, 1);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to program GPIOs\n");
> +
> +	msleep(20);
> +
> +	state->gc.parent = dev;
> +	state->gc.label = i2c->name;
> +	state->gc.owner = THIS_MODULE;
> +	state->gc.base = -1;
> +	state->gc.ngpio = NUM_GPIO;
> +
> +	/* it is output only */
> +	state->gc.get = waveshare_gpio_gpio_get;
> +	state->gc.set = waveshare_gpio_gpio_set;
> +	state->gc.get_direction = waveshare_gpio_gpio_get_direction;
> +	state->gc.can_sleep = true;
> +
> +	ret = devm_gpiochip_add_data(dev, &state->gc, state);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to create gpiochip\n");
> +
> +	props.type = BACKLIGHT_RAW;
> +	props.max_brightness = 255;
> +	props.brightness = 255;
> +	bl = devm_backlight_device_register(dev, dev_name(dev), dev, state,
> +					    &waveshare_gpio_bl, &props);
> +	return PTR_ERR_OR_ZERO(bl);
> +}
> +
> +static const struct of_device_id waveshare_gpio_dt_ids[] = {
> +	{ .compatible = "waveshare,dsi-touch-gpio" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, waveshare_gpio_dt_ids);
> +
> +static struct i2c_driver waveshare_gpio_regulator_driver = {
> +	.driver = {
> +		.name = "waveshare-regulator",
> +		.of_match_table = of_match_ptr(waveshare_gpio_dt_ids),
> +	},
> +	.probe = waveshare_gpio_probe,
> +};
> +
> +module_i2c_driver(waveshare_gpio_regulator_driver);
> +
> +MODULE_DESCRIPTION("GPIO controller driver for Waveshare DSI touch panels");
> +MODULE_LICENSE("GPL");
> 



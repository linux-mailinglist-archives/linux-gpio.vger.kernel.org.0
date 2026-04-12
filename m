Return-Path: <linux-gpio+bounces-35060-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFjVNEzx2mmq7QgAu9opvQ
	(envelope-from <linux-gpio+bounces-35060-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 03:11:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 378503E24BF
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 03:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA3B73030B3A
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 01:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCCA26A1B9;
	Sun, 12 Apr 2026 01:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcCMSJ5X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="erXtwDJT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE4325A2A4
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 01:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775956208; cv=none; b=KX6LDTg9ssz2WsPtNcEk7WCBh80mmK+GgA/wTH0RclKRZ2cNwGBEUz3X59maPc9YWVP5nwVB+uYDOO5Rum3KzWrquSfsxktIUFHc3Ml9tz8rtEF2oap4Avl4l05/F0KqdDwQr+ENxX2f0jVewFAIDUl2RP8VWcut6F4YB+uYhGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775956208; c=relaxed/simple;
	bh=mMkjI5DP9W+8fFYTiWVkM39irAtOjOYH6m2EcX9fWto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=giT45UfnOopcQ7fgQLgCqBIkmHk9sY0p0ujLjR51/SUYq9G0sqLYteWNoAST5TfD7Qiq+8Ky9JccL/qbUVN1wjFSmWCjkNEZCaHbEZQZERGWSXneFcE6UINbE0Ylyxo115CYbBsbU+0RIeaXnoS5tFDwIy5IRL0no6EEKJRzUKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcCMSJ5X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erXtwDJT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B47j1G1200645
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 01:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yyw915w7CN2Ucujh2TM/cNADCTu08+fT8ReCAQdEMoY=; b=LcCMSJ5X2Kf8An3D
	hsp9V6uqb94B70aXCltnlTIXtDWAaGYot8JjtDogmmP0wJvvT7A3Nt1UmdCS3jQV
	cn4P1gbx9TWZnE3EmxRodkz/WL0sJVYCJROIxCowjex34V6nwV7DOMbaxHjHACrY
	nSSZhyigGzrb1bI1TeFa5B3We1lvxowBxVJjHOq2n+ZpiB/qkgWIjFHUewZ8fI6b
	Rv8eVApkCt8BzN6u2ioQn8w3X9S16SpqZ0jnq+cHVQmqYxb0TkJ9dAhs3GwBOY8c
	Fz73EaXfZPzVMWhE6+ySWo0zcaGyFLP8ErS21p07p1Rd830kzXL8O2LYT5EGBzfB
	sqqKIg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jsk95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 01:10:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2ec17dc21so2294675ad.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 18:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775956205; x=1776561005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyw915w7CN2Ucujh2TM/cNADCTu08+fT8ReCAQdEMoY=;
        b=erXtwDJT+YyETQq4/MD8IM05RLqcfI/NoCBTUW+2WivdGiENfeeqMJqGqiNA3YoAUj
         +sYgHoRQjkxggBlIxKIbQFQYS0RLRZ+BPdSJoC/pPbztBv5778AJeOEOv3Os8TP5vhKb
         r9vrnM4OHaE+x0MwX11jlodLM8XGIlKdDTpLsH06cVRruVbs/NztCkVcAwGpjR9qswPy
         be5yvGhPwKK9WgnpqpfwrP/1bBe+PqgVEqGMAWDyZWc1knpTxWTLogFmweDji3MXQAtb
         VX2VYMYaayMUVT8WvR2KWlFxZku5W/FciPuXT9178PE7+XC6EiaZs7gxnai60fwJNilo
         kIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775956205; x=1776561005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyw915w7CN2Ucujh2TM/cNADCTu08+fT8ReCAQdEMoY=;
        b=ptUb3eziCTuC4jfxL5oPY+nabgeUVR5XvmibCyruEiLnAi0JCKO/QgK36L4HkT7o83
         2FpZPuzHnbN+pGT7Cp/w1/qTPF9a6SJxUkOcBTwhwrw4hE+kZyLaMR37JPSPBtTSVy7b
         pnazGkV1QyZTdt2jXBQr0hkzLER7eZdPMFQoHmJZjlGUYquKH23yjS3qywWGAOYppdm/
         /TjKjz03LiWo63+WCtPfdbLdc5LrG1unVliLuYAN2ymZQt2v+ZoaGku0+tu+CXa/GBrG
         6PsmZJ9/Pasix5Zm83eBN5wSO7U7Ma6mwEnoCsURJQOFS+Wwjw51i5397rzV5m3KqBma
         UXLw==
X-Forwarded-Encrypted: i=1; AFNElJ/JyD4GE7C0V7X7CV88pMDuYUQjlOYtuosBJPn6bvlbrlvjKtf4Xid8wRhXGwX7m4TG7NhalYMeOrui@vger.kernel.org
X-Gm-Message-State: AOJu0YzVFuxudO3cYYWXsKirEeb5ZiNDVcY4qvbbTjcrUohrT6bR4HSZ
	QnVWeJu4OMsyZWy3w/bU81ds8tcxcxl0PyMuWgUcK8EJCX4zDs2b62noBzdfv0RIKi4KQmTNMm+
	k9F+wKl4Hw9rEg7tzEI9DQfdAjy3uuYttVM9bGkF2kupt8+lR86xt4e4LWRwWsxrk
X-Gm-Gg: AeBDievS6ZaTcTdvRorlzL+yXO8PGu3L6HB62CORggNkvAMAh/1yX5o31/Q4fCHdhUr
	/AWRcmwr8xfo9nfOqhx2YDeGF/xbyR6RHivS9YSVkAjVTXH3qwMsQ11GeoiI5uH91wJLoGMQMfw
	jw7hE3Xx3TDz7dDSpXc1ZIW3u2qux+SUiqDiQr3E6pcS3n5E6+cab6O+FAlYCP+JkheI5MPyKK3
	+xJgjVcTQmuQJrlh8IspUW97auTaGscYMocCHRT4J/oa/DMQvTZexvxozq7Of9ZEUgS9tQvpOe5
	DcOi968gTHr26blySRgA2l6HRAwpUKnGNxxHzfxU6T02UxtqIG02fTs8AE2tWLCLdiRwsZ1k695
	4ZE1z/V89XzMjwZ/mVfroYu8CaZAsh6a4cDHp54aDpnCaCk75Swo7hhgoDRfgz3B4ZYpC4JO1Sa
	x+6xNwjEDDWw==
X-Received: by 2002:a17:902:be0a:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2b2d599ab4amr62318675ad.13.1775956204838;
        Sat, 11 Apr 2026 18:10:04 -0700 (PDT)
X-Received: by 2002:a17:902:be0a:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2b2d599ab4amr62318525ad.13.1775956204259;
        Sat, 11 Apr 2026 18:10:04 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f43994sm72371285ad.80.2026.04.11.18.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 18:10:03 -0700 (PDT)
Message-ID: <b52dc143-5238-408e-9162-632b5a1386fd@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 09:09:55 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/21] drm/panel: add driver for Waveshare 8.8" DSI
 TOUCH-A panel
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
 <20260411-waveshare-dsi-touch-v2-19-75cdbeac5156@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-19-75cdbeac5156@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDAwOCBTYWx0ZWRfX5sPQENTpb6J5
 agvZgzw/ULAT1qGqWSTDJtoXYfa1/WbH9+bAhom59V30ButyGLkl8tMPeRNu8+C2D7mZl9FcCC7
 gtFuV12b4cQ+LPP2ebgQp/hKJls+KG59qOZ856SCPRlYHfk8cBjJevfe8zjmeWGy+yJZf6ZCaXe
 1qj2Bq0pkbhxkoM+krK7jzT8I5FeKrNzhhR4a+cqe3YxivWsuA9QWmKkv2G4ejzFSouNM8z/1Xk
 wnN9LJ3boWfLjNkvdRALsl0PsVzCMMH4ehMe1gd+e30SmCQ8P36awcjh/JEjbw/ZkLQnsH7t/My
 ezHE8cEXZHGWyYO6u020j85lIc8a/tJHoJ86Dsw54CCevczZAzM/ShvjM/g4FR8UiWdWida38I2
 lg+54vCaExo1v+V1p2AwczXDUmIU3wz+YGzane6OIZFlenSLWwkB7Tcn/Z9OTFfDpPcB+MMmsWF
 pOElSRaqVRMUGblzhWg==
X-Proofpoint-ORIG-GUID: MWTFsGzeHdbBrOoVvXjRSa_CmQcH2iVa
X-Proofpoint-GUID: MWTFsGzeHdbBrOoVvXjRSa_CmQcH2iVa
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69daf0ee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6uJ51tyDExStV_pVDtAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120008
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35060-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
X-Rspamd-Queue-Id: 378503E24BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/11/2026 8:10 PM, Dmitry Baryshkov wrote:
> Add driver for the panel found on Waveshare 8.8" DSI TOUCH-A kit. It
> uses ota7290b IC as a controller.
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                    |  12 ++
>   drivers/gpu/drm/panel/Makefile                   |   1 +
>   drivers/gpu/drm/panel/panel-focaltech-ota7290b.c | 208 +++++++++++++++++++++++
>   3 files changed, 221 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index ba527b4d7737..979109c27b9b 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -144,6 +144,18 @@ config DRM_PANEL_FEIYANG_FY07024DI26A30D
>   	  Say Y if you want to enable support for panels based on the
>   	  Feiyang FY07024DI26A30-D MIPI-DSI interface.
>   
> +config DRM_PANEL_FOCALTECH_OTA7290B
> +	tristate "Focaltech OTA7290B"
> +	depends on DRM_MIPI_DSI
> +	depends on I2C
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_KMS_HELPER
> +	help
> +	  Enable support for panels using OTA7290B as a controller (for
> +	  example, Waveshare 12.3" DSI TOUCH-A panel). Say Y here if you want
> +	  to enable support for this panel. To compile this driver as a module,
> +	  choose M here.
> +
>   config DRM_PANEL_DSI_CM
>   	tristate "Generic DSI command mode panels"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index a4291dc3905b..0d694acbfbb6 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_DRM_PANEL_EBBG_FT8719) += panel-ebbg-ft8719.o
>   obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
>   obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
>   obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
> +obj-$(CONFIG_DRM_PANEL_FOCALTECH_OTA7290B) += panel-focaltech-ota7290b.o
>   obj-$(CONFIG_DRM_PANEL_HIMAX_HX8279) += panel-himax-hx8279.o
>   obj-$(CONFIG_DRM_PANEL_HIMAX_HX83102) += panel-himax-hx83102.o
>   obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112A) += panel-himax-hx83112a.o
> diff --git a/drivers/gpu/drm/panel/panel-focaltech-ota7290b.c b/drivers/gpu/drm/panel/panel-focaltech-ota7290b.c
> new file mode 100644
> index 000000000000..991d6a4caf17
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-focaltech-ota7290b.c
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Waveshare International Limited
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +struct ota7290b {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +
> +	struct regulator *power;
> +	struct gpio_desc *reset;
> +	struct regulator *avdd;
> +	struct regulator *iovcc;
> +
> +	enum drm_panel_orientation orientation;
> +};
> +
> +static inline struct ota7290b *panel_to_ota(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct ota7290b, panel);
> +}
> +
> +static int ota7290b_prepare(struct drm_panel *panel)
> +{
> +	struct ota7290b *ctx = panel_to_ota(panel);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +	int ret;
> +
> +	if (ctx->iovcc) {
> +		ret = regulator_enable(ctx->iovcc);
> +		if (ret)
> +			dev_err(panel->dev, "failed to enable IO regulator: %d\n", ret);
> +	}
> +
> +	if (ctx->avdd) {
> +		ret = regulator_enable(ctx->avdd);
> +		if (ret)
> +			dev_err(panel->dev, "failed to enable AVDD regulator: %d\n", ret);
> +	}
> +
> +	if (ctx->reset) {
> +		gpiod_set_value_cansleep(ctx->reset, 0);
> +		msleep(60);
> +		gpiod_set_value_cansleep(ctx->reset, 1);
> +		msleep(60);
> +		gpiod_set_value_cansleep(ctx->reset, 0);
> +		msleep(60);
> +	}
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 50);
> +
> +	if (dsi_ctx.accum_err < 0)
> +		dev_err(panel->dev, "failed to init panel: %d\n", ret);

better to check dsi_ctx.accum_err instead ret here?

dev_err(panel->dev, "failed to init panel: %d\n", dsi_ctx.accum_err);

Thanks,
Jie

> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int ota7290b_unprepare(struct drm_panel *panel)
> +{
> +	struct ota7290b *ctx = panel_to_ota(panel);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +
> +	if (ctx->reset) {
> +		gpiod_set_value_cansleep(ctx->reset, 1);
> +		msleep(5);
> +	}
> +
> +	if (ctx->avdd)
> +		regulator_disable(ctx->avdd);
> +
> +	if (ctx->iovcc)
> +		regulator_disable(ctx->iovcc);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode waveshare_dsi_touch_8_8_a_mode = {
> +	.clock = 75000,
> +
> +	.hdisplay = 480,
> +	.hsync_start = 480 + 50,
> +	.hsync_end = 480 + 50 + 50,
> +	.htotal = 480 + 50 + 50 + 50,
> +
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 20,
> +	.vsync_end = 1920 + 20 + 20,
> +	.vtotal = 1920 + 20 + 20 + 20,
> +
> +	.width_mm = 68,
> +	.height_mm = 219,
> +	.type = DRM_MODE_TYPE_DRIVER,
> +};
> +
> +static int ota7290b_get_modes(struct drm_panel *panel,
> +			      struct drm_connector *connector)
> +{
> +	return drm_connector_helper_get_modes_fixed(connector, &waveshare_dsi_touch_8_8_a_mode);
> +}
> +
> +static enum drm_panel_orientation ota7290b_get_orientation(struct drm_panel *panel)
> +{
> +	struct ota7290b *ctx = panel_to_ota(panel);
> +
> +	return ctx->orientation;
> +}
> +
> +static const struct drm_panel_funcs ota7290b_funcs = {
> +	.prepare = ota7290b_prepare,
> +	.unprepare = ota7290b_unprepare,
> +	.get_modes = ota7290b_get_modes,
> +	.get_orientation = ota7290b_get_orientation,
> +};
> +
> +static int ota7290b_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct ota7290b *ctx;
> +	int ret;
> +
> +	ctx = devm_drm_panel_alloc(&dsi->dev, struct ota7290b, panel,
> +				   &ota7290b_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);
> +	if (!ctx)
> +		return -ENOMEM;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +	ctx->dsi = dsi;
> +
> +	ctx->reset = devm_gpiod_get_optional(&dsi->dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset))
> +		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->reset),
> +				     "Couldn't get our reset GPIO\n");
> +
> +	ctx->iovcc = devm_regulator_get_optional(&dsi->dev, "iovcc");
> +	if (IS_ERR(ctx->iovcc))
> +		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->iovcc),
> +					"Couldn't get our iovcc supply\n");
> +
> +	ctx->avdd = devm_regulator_get_optional(&dsi->dev, "avdd");
> +	if (IS_ERR(ctx->avdd))
> +		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->avdd),
> +					"Couldn't get our avdd supply\n");
> +
> +	ret = of_drm_get_panel_orientation(
> +			dsi->dev.of_node, &ctx->orientation);
> +	if (ret) {
> +		dev_err(&dsi->dev, "%pOF: failed to get orientation: %d\n",
> +			dsi->dev.of_node, ret);
> +		return ret;
> +	}
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return ret;
> +
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ret = devm_drm_panel_add(&dsi->dev, &ctx->panel);
> +	if (ret)
> +		return ret;
> +
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_HSE |
> +		MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	dsi->format = MIPI_DSI_FMT_RGB888,
> +	dsi->lanes = 2;
> +
> +	return devm_mipi_dsi_attach(&dsi->dev, dsi);
> +}
> +
> +static const struct of_device_id ota7290b_of_match[] = {
> +	{ .compatible = "waveshare,8.8-dsi-touch-a", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, ota7290b_of_match);
> +
> +static struct mipi_dsi_driver ota7290b_driver = {
> +	.probe		= ota7290b_probe,
> +	.driver = {
> +		.name		= "focaltech-ota7290b",
> +		.of_match_table	= ota7290b_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(ota7290b_driver);
> +
> +MODULE_DESCRIPTION("Panel driver for Focaltech OTA7290B panels");
> +MODULE_LICENSE("GPL");
> 



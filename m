Return-Path: <linux-gpio+bounces-35064-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHBANynU22m7HAkAu9opvQ
	(envelope-from <linux-gpio+bounces-35064-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 19:19:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C79B3E50EB
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 19:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D333301F32D
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 17:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C2C342517;
	Sun, 12 Apr 2026 17:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXhNqKJu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fb7F1rTZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40250340DAB
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 17:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776014284; cv=none; b=f0liW56C1639BKpbal29oXxt0jWNG6ypc6lSHQaG6AOIlZZVAIBPrfqqUGWTbUUsTVZayHEP9hYEy6liLhITjI/uidkhsnWNs3ZmSIMm9wCxjwMbmWaKJZAJBGwEbpbka6UOVuLlHb3eDgnQgcbMPNohmgUWPkG0aVqGeEDA5XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776014284; c=relaxed/simple;
	bh=/0IXeZLJtN9yg58h1wAvFw+ow3JGYqoePLVKo+DjFLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FN/lVNWuqcIEn7MqiX7KX/WlNZEzp1a+AteCG9XZL1WcD3JjGuqeoCmCeUri90GBIHVv078IUvwPMX7xLq0Y8SKpjj7BUBuIhy9AON/RcdBxnI/QdO/nKBGaz9fCMuKmwBJEk0jzoRa8yc1gcRtEJehDhYeK8+IJmoiAKcIMpbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXhNqKJu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fb7F1rTZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4cYJ3560487
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 17:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=awvj3JA9kyhP+O20XoYCNKRQ
	hs00blktdD733kRwv78=; b=TXhNqKJuHoyRlvpafbZMF30GZ8EHAoH/FfLfQc6q
	1sqtm0N1eZ2KlFsMnRNI3tU8mBrlvZQFUdK6qdvLi5t4gMU3+jd/ou+zyRUlQBCq
	3IJsuM4xdmL+lCoGtpHvQGKWPu/RKKFqeF1w6IJvEczragNQmvKKrGx/ZS7khe0o
	7D7wPa1LdeeLJjrBoMnAHyB/k89WaPvff/qY/dfSntxTL9UK92Mvl7K2yt5LATTz
	sfA/g/c8EdwrZkOoOpoSxtgqYqO0lRADelK04aob/u8GeVQCRx7NFBChZj9MUrpC
	CvdJqJqD1l8OvsLlVQx9rgFFqZERRjODnSYTEMGMpOLxgQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0jprh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 17:18:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b6f869676so67394501cf.2
        for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 10:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776014281; x=1776619081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=awvj3JA9kyhP+O20XoYCNKRQhs00blktdD733kRwv78=;
        b=fb7F1rTZcfGuI/a57UBM7nnMEUVn3tJHwIvgGQAsq0hgdoTmhU71enMOYCzfcxedHw
         k2m1MZiw8sEoeZneM52sR96SmZ8Dgc/XDoSwQXheeZf9sQ6IntpBvKdkEI2J2xazh1pw
         YmCgkjujqNIK4pfSwclQxZGzppYSwgOlqNukxxaCEeRvo64EiwTIqHsRWwKVjrJZMu4q
         /7cEWCPJ9fS67n4lrKLXQ3e9K77QsxOnxJJUsg9auO0llNixHfXZgB+wKGEke/p7qvqc
         TsYB3wQzZ1cDzomhejIpBk93XMU2KS7eoqPpDKD6W7Za559LntSZGvtL7kMgpBs9lxX3
         xe5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776014281; x=1776619081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awvj3JA9kyhP+O20XoYCNKRQhs00blktdD733kRwv78=;
        b=gzVemoFUpXqNqFDjcNzpiWK/Rdz7sH0+z6TUDhZygnXocr7TOs5Pp58veESnTaSLwB
         UOKdj0Ajx1wNkVOkjuITd8W4IcL4VZrYFcjrg/B+XFsIR+3859QHiSgTrLKxw0JjCWDZ
         R7V4xt2oG4GQ4oW4wbqVXS+iUxvpP11MlC7Xa1aZSJe+d0STjbJ9wxxvFyy3UFK3gJJz
         D9evcxDjT3frRVu3kEQHJv2q8nkY9ZRWL3EL4Al+48OiCytJEUsu8lxIceho+OFL3hY8
         ruB2JXQpzcndgOVeISJC1g8NgSFc0JfSM3/8ZXugKvm1Y141M1YcVbvdDn+pG5rk2VvQ
         kg4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWHS3CuRwl4WlioezYJeDuYJa0NxEltQLwvgSJ5n7IPlRRBy1pvLJvy9rhwwNJ5WyElBRkrQ80pYWm@vger.kernel.org
X-Gm-Message-State: AOJu0YyFMPaCTWTmGbcn+bAPheMowr8zsxbo+0KWAOD0LkWTNfmKpQcY
	vWplpvJDsJTUbfeZ19XXk90cI3sH9QZlELWreF+wm3Njgi4gCxi8I2zJTzdQ5azRX2/vYfZFgqJ
	XirWk0xQQ/RR8ikkEPkP444MKak7DFuqrhMVlmUFglxeDyHbR1bBEqa1jpb/IsoME
X-Gm-Gg: AeBDieuQylUrSuxAlzQ59trIF8hmR6FoFIsHHL9lLu4D24/ukPIreBqx5wBcXLUh2yx
	IJwspfPjguT3+1gILL3lizoNKzVtBcqlwYMw+6uizFPKKuMVWzyZBUUXR7FGulgPGQx8ms/Q5D8
	195MjuWnL1BiQvwcW9vbA6+zj6akdpivgM5w254voZovfzcx6XCbi9AexXrOrp5QrgH+jkCltn7
	FBB6u03ZXSVzFI9jAzT29cjshg006mPjJLeD4vOhNbqbW7rIrXHSDU7TtkQU8ouQPBeub9ADOIi
	dLlgsLeOV/jjj157pTUokfIgSNB8sKlpOuIA4SZIsLJfvKwFGTb8M2uvVEa9rgRbm6IsmW3kmYa
	QooYyKTqXsMpQ1ExYCPSXBiIVBJLme0ZXTS3hv/BbtKT1LPzfZE/+0ZQpck760jjHFzgYev4qLO
	mlGGbYhmzuOgO/lalGQ2GVaFpkHju1HJ7YfDk=
X-Received: by 2002:a05:622a:a707:b0:50d:a466:6d11 with SMTP id d75a77b69052e-50dd5b77e0cmr129285521cf.33.1776014281323;
        Sun, 12 Apr 2026 10:18:01 -0700 (PDT)
X-Received: by 2002:a05:622a:a707:b0:50d:a466:6d11 with SMTP id d75a77b69052e-50dd5b77e0cmr129285111cf.33.1776014280832;
        Sun, 12 Apr 2026 10:18:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee93264sm2063738e87.29.2026.04.12.10.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:17:59 -0700 (PDT)
Date: Sun, 12 Apr 2026 20:17:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
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
        Bartosz Golaszewski <brgl@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH v2 21/21] gpio: add GPIO controller found on Waveshare
 DSI TOUCH panels
Message-ID: <mb6qy4hlwqvhwon57nlfc2aaqtc55lbwj5fjclv6y54wyimuhr@5qks67lpakz4>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
 <20260411-waveshare-dsi-touch-v2-21-75cdbeac5156@oss.qualcomm.com>
 <5d1dd70e-0300-4ca0-adb9-73f03cf4bf4d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d1dd70e-0300-4ca0-adb9-73f03cf4bf4d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dbd3ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=uOKmLFOxzNBE1KF2lgkA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2OSBTYWx0ZWRfX10FLiVBvn1d4
 c9f5t6r5iq1w4dxcEY4L++kX8lmk6SvDUvH/KLVoyvrrUQN1UvKSC7oRZM7BIduIEhDkVUIU1lj
 k0+/g/hC2YXGO4eO8M5xjtmNbiqexPi1G188SsgcpkNcNMd4lt//yt6WkB5awtN+C8+HZ36jIzY
 G5pQLxyqkETL0pSZt/tUbNozG9xcx9ij82wc0GYD2thSNVkLAd2+R8T2F+yjPBfxq/e/dvivb+2
 MlAz59VEIFdSPH4Ql/7XwTAw/L9SDnwPWIBQwOQ0ZPJOMXkdiE+EhHpgV9ld2MB47Qrg3MdkYHD
 xzRsjOMw9/+1rHDlsN/Ey2vfS52Ld5zPphtVYxCtZ0rCb+DYkPjm/VBPX3b3i9JvbkHCAUuGJql
 cnhKbzZqadqGc10aXPDXjGP7jlCa7XM5wbMP+VCFcpQcj3xZKBrt3n2+tWABbxEg59wjHdQXljv
 ZHlFh+MpMBU1WZGzbSw==
X-Proofpoint-ORIG-GUID: T4A073iQ62N-puqazBGy6AMIgMyj0qae
X-Proofpoint-GUID: T4A073iQ62N-puqazBGy6AMIgMyj0qae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120169
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-35064-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,lists.freedesktop.org,vger.kernel.org,arduino.cc];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C79B3E50EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 09:06:51AM +0800, Jie Gan wrote:
> 
> 
> On 4/11/2026 8:10 PM, Dmitry Baryshkov wrote:
> > The Waveshare DSI TOUCH family of panels has separate on-board GPIO
> > controller, which controls power supplies to the panel and the touch
> > screen and provides reset pins for both the panel and the touchscreen.
> > Also it provides a simple PWM controller for panel backlight. Add
> > support for this GPIO controller.
> > 
> > Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpio/Kconfig              |  10 ++
> >   drivers/gpio/Makefile             |   1 +
> >   drivers/gpio/gpio-waveshare-dsi.c | 208 ++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 219 insertions(+)
> > 
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index dbe7c6e63eab..1b210c451151 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -805,6 +805,16 @@ config GPIO_VISCONTI
> >   	help
> >   	  Say yes here to support GPIO on Tohisba Visconti.
> > +config GPIO_WAVESHARE_DSI_TOUCH
> > +	tristate "Waveshare GPIO controller for DSI panels"
> > +	depends on BACKLIGHT_CLASS_DEVICE
> > +	depends on I2C
> > +	select REGMAP_I2C
> > +	help
> > +	  Enable support for the GPIO and PWM controller found on Waveshare DSI
> > +	  TOUCH panel kits. It provides GPIOs (used for regulator control and
> > +          resets) and backlight support.
> > +
> >   config GPIO_WCD934X
> >   	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 GPIO controller driver"
> >   	depends on MFD_WCD934X
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index 20d4a57afdaa..75ce89fc3b93 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -207,6 +207,7 @@ obj-$(CONFIG_GPIO_VIRTUSER)		+= gpio-virtuser.o
> >   obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
> >   obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
> >   obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
> > +obj-$(CONFIG_GPIO_WAVESHARE_DSI_TOUCH)	+= gpio-waveshare-dsi.o
> >   obj-$(CONFIG_GPIO_WCD934X)		+= gpio-wcd934x.o
> >   obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
> >   obj-$(CONFIG_GPIO_WINBOND)		+= gpio-winbond.o
> > diff --git a/drivers/gpio/gpio-waveshare-dsi.c b/drivers/gpio/gpio-waveshare-dsi.c
> > new file mode 100644
> > index 000000000000..f4a1d4d3b872
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-waveshare-dsi.c
> > @@ -0,0 +1,208 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2024 Waveshare International Limited
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <linux/backlight.h>
> > +#include <linux/err.h>
> > +#include <linux/fb.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +
> > +/* I2C registers of the microcontroller. */
> > +#define REG_TP		0x94
> > +#define REG_LCD		0x95
> > +#define REG_PWM		0x96
> > +#define REG_SIZE	0x97
> > +#define REG_ID		0x98
> > +#define REG_VERSION	0x99
> > +
> > +enum {
> > +	GPIO_AVDD = 0,
> > +	GPIO_PANEL_RESET = 1,
> > +	GPIO_BL_ENABLE = 2,
> > +	GPIO_IOVCC = 4,
> > +	GPIO_VCC = 8,
> > +	GPIO_TS_RESET = 9,
> > +};
> > +
> > +#define NUM_GPIO 16
> > +
> > +struct waveshare_gpio {
> > +	struct mutex dir_lock;
> > +	struct mutex pwr_lock;
> > +	struct regmap *regmap;
> > +	u16 poweron_state;
> > +
> > +	struct gpio_chip gc;
> > +};
> > +
> > +static const struct regmap_config waveshare_gpio_regmap_config = {
> > +	.reg_bits = 8,
> > +	.val_bits = 8,
> > +	.max_register = REG_PWM,
> 
> .max_register = REG_VERSION,
> 
> check comments in probe

Yep, thanks (and for other comments too)!


-- 
With best wishes
Dmitry


Return-Path: <linux-gpio+bounces-35217-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA5aBSu+4mlP9wAAu9opvQ
	(envelope-from <linux-gpio+bounces-35217-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 01:11:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E0041F0BA
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 01:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 398D7305116C
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 23:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81CCD37EFEA;
	Fri, 17 Apr 2026 23:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZ+3eMvM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XacX50cQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3085E2D7DD4
	for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 23:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776467494; cv=none; b=bkBYadNAth1A44bUp09BKSrWIXTtmNJ+hlzsgsHjFbbgYWLFOxRKCM0bEj09MinogFqnPnA2qNNlH9mrMMpzhWTCL8IJLpOSTTq7s+twGdWxD5Rd+vQ6g+gmH66Y3aKF7iwRKsYPmRVu8EeoE6pkS8N+fNP2+//u5icWZ7bPHQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776467494; c=relaxed/simple;
	bh=hnxiBWWseYu7U8phGQzW7KPEJbdX4nSfS63nDcSiVw0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HqO+9XMwjEKZa7VHq6TEXtA4mPenBu9jMXUj8ZvU7mEVuC36yik2d2w3VzGy8u3MdejEPELsNULu1Inq5gO19AyylaFMrclOLRUk3gGunmlkRTcYdcKKFRfO7H6+H++nd/TRY2GkIWqqOpspe9QDWsDBAdS2ritsXPMA1vM87Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZ+3eMvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XacX50cQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4G0W4068672
	for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 23:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9vlvT/yQ2K62b6JOQlgrZNorBhm2dAWPSxZZK/89x0=; b=hZ+3eMvMMiqhWS74
	cfSj9dpGME3VJfgYr/j7TmvyToM4KcvIXMnMta/yfylNcsZqbDR++RNBqSu8DhP+
	21KpqcWO3aM8rZ56Ej6dIb+bOInmjA7mTrS3uxdZ8IgU3itHTRTGgW9yJ1/IQAG1
	LqyBj4JVhT2QhSlxPlh+oOBazZJ8XbgPnw3YNHfCalhqawViNf5j/QmvCZsM0Sjf
	6aBfgirDAfLnoB6XNod/rlUuc3CpNUTWi2HEWhgwUNg33dy2D1JsJ53n+PEKd3q4
	WmQAd1TnjXcGw/r+NY24k12A9HHYPkknTy/mj2BQeLoZ98BJMWHWa4YfEP4NRiIZ
	I9YDYQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhpu2k7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 23:11:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5d1c2289so28924341cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 16:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776467490; x=1777072290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9vlvT/yQ2K62b6JOQlgrZNorBhm2dAWPSxZZK/89x0=;
        b=XacX50cQdOw/qgTMcB8KMLOzb/RulLvf5M1kz/WywcDr8X2vVg1baxrJxYUu5RkVzi
         2zyOiBlm7lZkXT3QaKtgE3XhkGhAF5FzT/yDi95ZAIt3ujYPUDZ0DgXgJbM8Yc1QgPmY
         9DpkCEWzNiT+V42poA1sZw7ZQmNR6ZlRUG/6j8SWBBSl/ilpcF7/DIVLlK5Abo+qg5+k
         JFUQdKhuQWZTvDZK+h5g44A/onYfvBuDDBnmOVsmjV75cHorhzvOMKjtj62L3dFF19Ju
         S+FZnveyTeU7/vnoxZLI/xisIWE9AygzIwf3v3Y57xM2l+PdnSVtEVh8H6zLDLvx8SGE
         R5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776467490; x=1777072290;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r9vlvT/yQ2K62b6JOQlgrZNorBhm2dAWPSxZZK/89x0=;
        b=D72FXTsuoGQfvepsxE/qvWxCaS5+W1zvViBOZ+sjgmCSvrU7W1dU1v6UeEleK6z2R6
         KUJYe7e7cyp9oHr4/RkkaPUMn2q4JcjpHLSaruR/Er1a/6a+1AIUSI3kNW6Qbgp4EOEM
         dmUXcjnWlhT3DeMN27LQji8tDwqNAmNm3zWOWYxBMm/zUsIJLYwa8RueJb38ozI4fOPs
         VKPqC3XzNjhdV8sN1CRl6G5Z/4cNQ2RQ9X6Pm6vvQDi1h7gFY0RUYmzQ4xU6xuHAfYx8
         7qnhw/U7uVtgUJ7RspOB+iR3gNCBFr+NTgdea76xFlXLar1VgV2fOEd5G3mRAo0sMomb
         4VjQ==
X-Forwarded-Encrypted: i=1; AFNElJ87YoAAeYOvdfgY0PyZvx6JAU15/0TF7MXnJ5eUAuCB6XvfbmUOYBgzS7rmyl6+TVIWKNiTv1KHgkf1@vger.kernel.org
X-Gm-Message-State: AOJu0YxO/v/96PlcHD04Yuw4DPI11VHsWAdUPaNTFxeSyTIKWmUXK7uV
	uXw2xTOgFvr/9irkgWESWz0Pz4ddRN1+W2kTn+TtptE3cNd4riTp33QRx5Za5a3zcZURxDlvcir
	FEzyOgrZGpYeMUeE4V9Z+be4qcUs4+y0YJ32/qAIOumuyJYf9dD6RyCH/Yekg7CRV
X-Gm-Gg: AeBDievN0FpYDsBRuuKCZjMHdisIa6O8AGCmqSoftvLmihS0RUyjVM/FmNU4efPA2SY
	oGPhW9GJDW6ISqVmDSS8LCFQ7PAs7y/CD9QErzgfrDekQFLXijO6Fn+slzkDyppwWMRM0vCyUMD
	QeZoSlssb0RU6eFgYt2bJd3EKFgGDpHjCq5WUIsVazLgWUW9/tqRBDPrMjujXWseQmluvysizFb
	L58tn8GoVs699oF6JhoCql6tZP83CGuHlBND+hejk2YTKbUGteFVLwIJWxByNj/lC32JhwefiH6
	oi901qMlv+csHuJ0yLzUDkLb50fckhoTX5rOCuyjE/zDHp1YFmpMXV3rVbejaoo9psfAyKhcTMv
	3po9zQi138yUOk4cSuJAxF8AAlFlAeg61QukcLt4njkp7yJ1dM9HH9ieKoYe+dWUrn78flogg2P
	ztuZRn8ksUEYmTFabCKjtJKZKrAp/TSWSJlv47MQPoSAVevg==
X-Received: by 2002:ac8:5fd1:0:b0:50d:a6e3:ae1 with SMTP id d75a77b69052e-50e3693d3d6mr79033031cf.17.1776467490290;
        Fri, 17 Apr 2026 16:11:30 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:50d:a6e3:ae1 with SMTP id d75a77b69052e-50e3693d3d6mr79032601cf.17.1776467489817;
        Fri, 17 Apr 2026 16:11:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41ab29ae4sm496283e87.4.2026.04.17.16.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:11:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Riccardo Mereu <r.mereu@arduino.cc>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 00/21] drm/panel: support Waveshare DSI
 TOUCH kits
Message-Id: <177646748816.2514455.14063972983042934626.b4-ty@b4>
Date: Sat, 18 Apr 2026 02:11:28 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=Kd7idwYD c=1 sm=1 tr=0 ts=69e2be22 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=dsQwgn-brIFo03Fd59kA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: JjQUyqDQ0emzZXE09oBqOtF6YFq6ItXy
X-Proofpoint-ORIG-GUID: JjQUyqDQ0emzZXE09oBqOtF6YFq6ItXy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMCBTYWx0ZWRfXyxWzMHUeZgY1
 WmB4o2cIi2sOGy7A/FZLLXy4vLYsHpO62PBqF2bQskPqiiS9ji8edVjRGVtauXRabiI22gX7kVi
 iASSijIj4vVPLhzyRaDO9p5XzaJYa41Zcjp5oORJwWtis8EmvhAyQvVO8kwv/4m20Hi34Oq/vqF
 b2xtYJgIzhvuV6Zh0KMQ6lORkv3hoLvh5BzYoTzNARzmVyOdENCNLFiONXUHZy0nl9UDmmJtMS1
 anJSE2B16YZ4EQRAYBQ313NHU0Y7fG63MuyaTJvTm7hfgZ0/ciCRfnVMxXN4oHczDm30ThaCLGP
 S1ZIRc6XPd1gea3ghFZhJa+wzimmYcfLmWi8WMDzJMGBS4LFBz7fv3pL1m8YpD+Sz4wDSwag6Ru
 +GeEPz+Mfyw4OxgMes4XXJaLHIQqBcDBc5KPt2vjiZX3tsqV/GdCZQ9CEj3IefrVHxinXkNzd5L
 qTKRXSqL9tqdY33R2tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170230
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35217-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65E0041F0BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 13 Apr 2026 17:05:23 +0300, Dmitry Baryshkov wrote:
> The Waveshare DSI TOUCH family of DSI panel kits feature different DSI
> video-mode panels, bundled with the separate controlling circuit,
> produing necessary voltages from the 3.3V and 5V supplies. Extend panel
> drivers to support those Waveshare panels and also add GPIO driver for
> the onboard control circuitry.
> 
> 
> [...]

Applied to drm-misc-next, thanks!

[01/21] dt-bindings: display/panel: himax,hx83102: describe Waveshare panel
        commit: 0eb86d3622d20679a4c64606df4e8cd6af5398e6
[02/21] dt-bindings: display/panel: himax,hx8394: describe Waveshare panel
        commit: 4a70ba67ee5f8ba3a563611eed6ff41eac2b41ed
[03/21] dt-bindings: display/panel: jadard,jd9365da-h3: describe Waveshare panel
        commit: d13d9306acac0a71c567154a4e1b3ca9d5c58cc0
[04/21] dt-bindings: display/panel: ilitek,ili9881c: describe Waveshare panel
        (no commit info)
[05/21] dt-bindings: dipslay/panel: describe panels using Focaltech OTA7290B
        commit: 17b2ab777384d04cae0e5c1e19287d16369e745d
[06/21] drm/of: add helper to count data-lanes on a remote endpoint
        commit: a8c56e00c608d5c70eb89464676ea0b3cdcb1ce6
[07/21] drm/panel: himax-hx83102: support Waveshare 12.3" DSI panel
        commit: 1af0feaca130e7fef016184f85f803385de13ba0
[08/21] drm/panel: himax-hx8394: set prepare_prev_first
        commit: dd0d0a487172bbe9626efc59a43d5dfbea64cdd4
[09/21] drm/panel: himax-hx8394: simplify hx8394_enable()
        commit: 917e888d38fa1e81781da39daceffad41e9d2109
[10/21] drm/panel: himax-hx8394: support Waveshare DSI panels
        commit: c3b595b16cd2830bf755b4385b19db41f2c238a8
[11/21] drm/panel: jadard-jd9365da-h3: use drm_connector_helper_get_modes_fixed
        commit: 0a26b74898a5d385fa9226475d7d2d3afef1716b
[12/21] drm/panel: jadard-jd9365da-h3: support variable DSI configuration
        commit: eb019688f2a97bb95384853072de3a88b981f1f3
[13/21] drm/panel: jadard-jd9365da-h3: set prepare_prev_first
        commit: b55a4b5d4769a650f52ea3f1ae680610169d125e
[14/21] drm/panel: jadard-jd9365da-h3: support Waveshare round DSI panels
        commit: ba362fb2e7fe5676b388da4fd976c993046e3611
[15/21] drm/panel: jadard-jd9365da-h3: support Waveshare WXGA DSI panels
        commit: 5a7770a06f38152e50e3fa8d1acd77d0ef259c3d
[16/21] drm/panel: jadard-jd9365da-h3: support Waveshare 720p DSI panels
        commit: 13414cfd4839804b924ad9cdf0337d3c335a1943
[17/21] drm/panel: ilitek-ili9881c: support Waveshare 7.0" DSI panel
        (no commit info)
[18/21] drm/panel: add devm_drm_panel_add() helper
        commit: e43a8e3ad8fa3c2c2220a06fa46545c7ff82a9b7
[19/21] drm/panel: add driver for Waveshare 8.8" DSI TOUCH-A panel
        commit: 07853e95424869059d7ce1cd25c800f88ee03e95

Best regards,
-- 
With best wishes
Dmitry




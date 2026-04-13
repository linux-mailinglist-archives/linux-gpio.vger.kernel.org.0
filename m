Return-Path: <linux-gpio+bounces-35096-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB7ZBEn43GlaYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35096-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:06:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD4B3ECF8D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF11A3015A79
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4A03D5258;
	Mon, 13 Apr 2026 14:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pbax5HqT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IC+HTp6J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6583815C5
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089139; cv=none; b=H1t8WjpQBExScR/CfnqnLILKnuzCrCH2xm0BLnmdvfYruGW6KmdlnCpfdIr6EH4uf9UQwZ9LiI0TKVyBl+qOxfEgbEbuLX//v3mp3WMlBNfVYPDdlwDv8Ho8LJLAebnoOSK0YpA2OhEFNlrgAMxDl/H2fbiyRaqWXo17E93AVDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089139; c=relaxed/simple;
	bh=USkwXBfci9sIWJW06UXbOmxrqKMlrITA2EN65WJiKAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WAjlhmC+TheSTv6cfydE4OKDXw3iTBvzrkuDxJFGtFF9tCvrjg9+etrxgvQghIYFNPjVn/AP7PHO9gB/PeF9axMWqfQiVjRKiqDbOu3VwSnVzPBoWpQqSMtAGpsvnIlILuyWuq2lRSQu0XdLKzvSeKepBqf2AuSCJgw504yMApo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pbax5HqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IC+HTp6J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDm6d11496998
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETYWoaJyM9VmKmVawKGSIxoRtEFEsHcnX/Tz5qCocnY=; b=Pbax5HqTfBq1+LlO
	1BWoF/86j20IrHCfAzT9p2qahh2qmCBs90qBzVOV8zqvFdV+mMRZyTwdy8dsJbAt
	xXQMDOsQSKZrtcd1IemvCWJGA7sbZqC4kIe7ZcXynR2ShxEYon83ykAQdRXubmHG
	c2ENnYz63Fk9Cd2acd+9V/lyg65plIbJINdnBbPHLbdayn2ddaAR9GjpJy+vzMCv
	6cxjI3pJpmnIwI7QNfv+M6nEHIvsKKUSAM9yFBDIWdwEM7a5pDo+G+EbfKLO9TE1
	s1Tbn2PFz0uaM22ekn5bv8J7OqEtKz6iKEFanOALDWZJrVzQpiPkQvcY9MRmWX7D
	WnK91Q==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh1pk82tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:34 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-467e8aaa943so2389345b6e.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089134; x=1776693934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETYWoaJyM9VmKmVawKGSIxoRtEFEsHcnX/Tz5qCocnY=;
        b=IC+HTp6Jg7RCCD8FaQdDEWT65DnUGbSyhdMahv/F7QTZ0BLoCykbW+ycZj9v6bo+Et
         m5vsaZaJS1oxRkrQlIz4FXE+MCy/a1Qookwca+K67xe/1NKtXgpuDMsQFgGTRP10v5cR
         X3Zy1l4WNpNz4nreC+PS/oI4dMp6S948/qGY6evQ+82KXqe4TBfzP/wBzLDakMQ7YODA
         FTp7dDOZj0m4ACnANYbNrzct4MvIck2rePqmTZ6f/tYyTuV0STWYLfQXJhzW7E8wAzne
         1z8fZGdwb43Ye1kOJbwK1IW4ARGJmDuiOp9+2T8ArICG/RcuI/5XtQqQUkqCrnUk3zbu
         6fxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089134; x=1776693934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ETYWoaJyM9VmKmVawKGSIxoRtEFEsHcnX/Tz5qCocnY=;
        b=r67znhryx8WsfMBOHmPX03TK+u65EwnE8Og7RARtDE1hKFUbpdorzz9pNQyLYIihOE
         Oy5e9fhvPybUcTv2kDxUGONK28SvS6zQkRYgSk6/6ynmpby60XdMd1BnUE348cbhW5aq
         MUeCNmGtGGvB71OSAMqgHvBPF75SInY4VYVOIGcjGaQ+MNyoGJPo/0KOKADIYpngYe9Y
         4U25gxzCX5DZTDABDFHeT58Vt2j7jU3WjGEJHLpkTqkBI7N9HEzmM/RTT9vJPgwmdVS5
         3WOduuI0MupXnYNV35HPfWPxE5ZQfYZLfRcK9uIrFP2VSjH1paDUSCfH2xXa55bsq+yv
         uFlA==
X-Forwarded-Encrypted: i=1; AFNElJ+NOLREFwmIFO9YJQrBM9t/YC1o0X0Uf814tWVmhJ/+8ec03v3tP4bSPFm2QYMQ4fdgoXpXAY9m7fLk@vger.kernel.org
X-Gm-Message-State: AOJu0YxY1auxgrRYtL12b6M3dcEjDPvr4agPhLhsaJZDk0zRmSbRIF7+
	Qyha1J/FSd4wFmGtFEy5DxzCQiPlXjmiKA4bNPdEphanI39W5xx5Cx3kI3N9dnvz+3S6aHSg+yw
	nGfCKS0NiSiYYUDqcLPRL/GDEkioKuHUlGjW7F5Am8L4PdD0EP2bfL0+iig2flMgp
X-Gm-Gg: AeBDiev7LHiXnVDpcrimZpMdUnIimDgKHdhDhIbAz7bdTvRRIAfgMvIZAxEnPEfIqxP
	S1mSda4zZZ9VQNp+wKmaq1jHlaJA5roizscBfFAItFMRNRFba9Yxy5B6wnl1bWSgbNZYDwmNFzw
	6aMlBIv/nthP8FbBmXLRf7Yp2BAApnaP7Rz1cYYUdRxsXhAU8NQHuMRAZIgw39QGJ2gFleIH1V1
	wYdEey/XI0OQpmPvk5f1GGzQl2m3DAlHGpFSzRaA8zUWpuJZYjzboENIc88j9Ne/5x0gi2Nh88d
	qzaXYBwPqfpo6iCGbbBlWoIbLCDNRhA1G+22rFAmCY4e/K3+6XWgMKl+wDjcGgfHBz3M+wowkON
	6Sr0y4xtZgXhGredZW8btXqQ6BACsidb7BKefKpsi6XsmiRO+4LSKkD0gZbJHB3YiLN/rAQg3ty
	eKvYks/c1iIdQpp4uGcwKbOyeWJXENDisMABg=
X-Received: by 2002:a05:6808:1a21:b0:450:c321:d50d with SMTP id 5614622812f47-4789f00d969mr6635803b6e.40.1776089134138;
        Mon, 13 Apr 2026 07:05:34 -0700 (PDT)
X-Received: by 2002:a05:6808:1a21:b0:450:c321:d50d with SMTP id 5614622812f47-4789f00d969mr6635751b6e.40.1776089133568;
        Mon, 13 Apr 2026 07:05:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:24 +0300
Subject: [PATCH v3 01/21] dt-bindings: display/panel: himax,hx83102:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-1-3aeb53022c32@oss.qualcomm.com>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
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
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=USkwXBfci9sIWJW06UXbOmxrqKMlrITA2EN65WJiKAk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+adH2qTEyKmMidc23X2r2bzfcMv0+Meuflv8pYOyfoS9
 Ys/f350J6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmsv07B8PcF1GcW687Pjkk
 1afjxLqNSdojItIo33LrNZ6tab95d12J4mE4kGa6ttjTIq+jMEF1p0OFrFxiRZF5ksvlrDe7v3w
 Wrv3vyR1tf13v/tLqkMfl6y8UT17xWMXYP27WL497An+4Jr/oXvN3S/g9Hj+eep2QH90WIs6GKz
 38Nk+Z1vB5g1ygkHrMdFYxpbN1Bl75/70vsCmZpXm/YTc+s/Mia0+/Y4r4VdbttfPdlqq3Be6as
 /nzTJerX1td1lh/4c6TL7mdO6tdx9wqoblrjcnRaG3326eTjGzPBz3t7BKYXOckNdU/yO3ugnWL
 DdNdNS9mrRNdqn+qRvtGct5CbpkDr42jcw6pb9ZT4t4KAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: iprkETV-dHFlPYhT89zR2dJeLs0iGoUU
X-Proofpoint-GUID: iprkETV-dHFlPYhT89zR2dJeLs0iGoUU
X-Authority-Analysis: v=2.4 cv=BoitB4X5 c=1 sm=1 tr=0 ts=69dcf82e cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=dDwtKCuX-g0vR4_aJEQA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfXwNUG5IDWUTP7
 ljqSIcxjkS+LaTm+CdQsbkqoDw/uhBB0d5Ihz3wV65LzBlgDZONf2p1SXbeyDadkSlq5cCVrLVo
 5YNQ3psgGV3MY2kaJ+fhzZcYQ92mD+IihHHo/3YDMjzFMMScRHw4YOubJ6qOowPRzyVPpsYhYmB
 Ac9xwOj7YTtS4SFQ4JzwB57Zd+gCtpey1G6BFXRBEzmM2sec280l9/DgfMAvPR1zmoxeH9cpK1X
 NGbBYqU5/1b+qyqOFy05JVieoiqOoQnkM0zf4okWtXpYq8k0If5SfCMHTHIjZflFWYjPgsb2sXG
 Ilt14UJJDF5ndKWEcOJzTRTckdC/tEd0DpTv+kpPvLZmLaCMNZC2GkUQINJYKSkY7YiVahkqSxC
 sbCjQwKuIrGjcJjpJKeV3kHC+imWx98WY1Whdx19GPVUVw2zi8wE6O6OjCMzgQmq3HbivmTYM7M
 IEsAx7t28ldNtQh7d8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35096-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7AD4B3ECF8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe Waveshare 12.3-DSI-TOUCH-A panel which allegedly uses HX83102
as a panel controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index 66404b425af3..7667428bf9a8 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -30,6 +30,8 @@ properties:
           - starry,2082109qfh040022-50e
           # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
           - starry,himax83102-j02
+          # Waveshare 12.3-DSI-TOUCH-A panel
+          - waveshare,12.3-dsi-touch-a
       - const: himax,hx83102
 
   reg:

-- 
2.47.3



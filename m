Return-Path: <linux-gpio+bounces-35032-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNaRIuk62mn0zAgAu9opvQ
	(envelope-from <linux-gpio+bounces-35032-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:13:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D503DFC13
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3EE4305FC3C
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE731352C34;
	Sat, 11 Apr 2026 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dy3MeANw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1m3vrvK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38B3355F28
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909456; cv=none; b=QvBmZ23OFVHV5ZafeS+gUXtZl4B9pXKmGakjXR0n0DRhZybMs4g14S+TaTMv/4qzqUhLdDWoy8yiYPr4QOqJk8F4vMEpY5tnO4aebSakfxKnIxWRwrtP1duXY1nI32pwpwIxoixfhlc4ggExFKJw+fYobneCRpRWl8Xn+vAn1BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909456; c=relaxed/simple;
	bh=b6lJFQy4133z0QDWI8Z8xZQHGNeBu8+YH/BZ7Z2AGmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gJemXEj/g1ManOnth/HCWa9wAXSqWxIpf7UwwHhKnZz+GSQEgwWtdCTv68VKLSByuHgPhfjwVKCMqG1hRF42AQTwscCBdl5Dgmloe/zD+eecwRkcmvSZsOJgeEHVYBWp7lJup63WTr7hR92+729htJdxkL1nIO8/okVm7yog7FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dy3MeANw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1m3vrvK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B47fIX1200627
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJIKpujoigVEaBknrd4/meAnaGYzGS9Xs4bjoKjmIO8=; b=dy3MeANw3hI3AbSb
	fcYONsxn2v6I/PqrtBboINr2TWxkwyRT7QsFD8LtH8pjh3OM4Wvn75kxhhDTQDQn
	P/vmvAePHAqwc07LnF19dfXvqBQMvXEmWT9ws/0A8jw33CAjiifDBt/L2MlzLFVw
	MPT2ER9ugugYJKdDXinSx61OUzLGa1idxSBeA8PokjwyIxqAaFh4Ldum3jhU9RmT
	bB1NTaA9wrR3fVBckibOdxW2jImPCw91eFQwHzUvemv5utmFSzHH/KM9QxatBmpC
	S6hzRHiX+0cAngD17aXNTHIvsLwQoA2Wp6qasE9PC5bQwEsaGEdtkX7oURtQdUnO
	GKBiBQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jrn8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d831e8083so26145761cf.3
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909453; x=1776514253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJIKpujoigVEaBknrd4/meAnaGYzGS9Xs4bjoKjmIO8=;
        b=b1m3vrvK5bHcCGa96F621TWERXuCOv6mPR4sSsAHajPCEczqvDjTvbySSAcSmoYOOh
         UIq/b9Whl9mGGRkTqSkD6hs+LuxhpApBg95kQj3Cq0lJzT8YCROmJV3jD2tM0nnU5oJa
         CVvb4s9UHHC3EA2s/t0Vzm5wrIzsI3RBd95bzVB9xyrTd+OhukREA8RFwhGrEKbDZ+H/
         FvRIL84ITrLkNHLzxTgJX+v/sRKepzSNBhvWvM0MkKJiiNwXq4ZHlH3EvgMmkwJ+yy9A
         YYeEJ1vii6daIkcp5R5GWefPRnJLkLBozCC/Vub/MW+W+MGC+Un8yPBtyPx1i8iQ51XQ
         gJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909453; x=1776514253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EJIKpujoigVEaBknrd4/meAnaGYzGS9Xs4bjoKjmIO8=;
        b=C1ugUwdpJpE9lZoNlMRRetS0QXQm3WzdQksnhRl99eA09JAOl/vNvT3vH3F7BFlUdy
         oesbVTNG5T83TcUOMmiyk65xgB1U+x+6Z4Kfz2cOFxlctWPyAp4/UrkNhEYwiaLa0KvI
         58sx42MbWFqwYSyxRSvl4fQbRwvxFZ2Pec0L5qx5kzEifXpMTELc/MMNxMX8yjMWH8xL
         TGEgbyCRXaq+/WXsVJCDqmPZnAj06l8wfjr/1lwHTOmBbOMUCXrSOvnBwD5HOfjpcwjF
         cJqq4m2P27wpa/4/HyoMhciKVkXAWeEQdGSaucEWB6p9S0OJ+Jw+MDFEQRdxTRpkTrgD
         tFoA==
X-Forwarded-Encrypted: i=1; AJvYcCV451Vo5/DsNS/x3fzcipj9TNfPAZCPZa2Cho99IGkDarmziTDyaza+97+nWEyqGCTDXXZKWFFFxQWj@vger.kernel.org
X-Gm-Message-State: AOJu0YxVOIpEqvHDvF+WwPzbKiXIol3sQZDgWU1jCU127ziWn6Mu+rUN
	88w2icP+tGJUyG8r+BmlUQ3k5owLJo1AgGdavhpKul18yAFUpqnPphiDn6T4GDL4RoK9+IwW9US
	jjKBi+1nO/SKkJSaNQs0aSl0HACKIjA70tKeCHaAjLn/7GfXbpxwJF+xs1P9U5qYR
X-Gm-Gg: AeBDiesbH03YGW+oOf8bZmoK9qKVZAJjA09MwV4Qo2+ETCjqp0i98kcRfwmflpGBfDi
	sHZuMnDdXPiFI1neAWayhXl72z+Awv4RzxhFnBKlva5EyjgPf2Abiw1lJCLv37yuHnEGxwkmGIY
	bnHtUAby7WNiw5a4NjFn0xGoybcpp95QVO0lREbe7XRRRoSsfFJCQpXwZrkxeXlzfqvjdRxJSig
	GixVK4HJvNaZeas8kkJQ3srL1IOBXjQwQuBV6c8fdloLEcNQz62TfoTZeRjULaChVLCwhim6WCN
	9l+1r3rPwhDaVzbSC6NY1UQ47QiRv34vTg98I9ZfiCUcWnl4NxUfP/CjoW1M729MrbRPynDT4si
	saRKrYuOw10J3rmhHjJKBzQnBwJm0eKNpT9d4sJqCGDlXh85/hDPnvb9shGXY01yi3w+Sd7witC
	Lp1nkjxwXsp/dOMkPCn7Xrhkqj1n0FLZFDA4w=
X-Received: by 2002:ac8:590a:0:b0:50b:4537:2e21 with SMTP id d75a77b69052e-50dd5c10684mr97349201cf.45.1775909453442;
        Sat, 11 Apr 2026 05:10:53 -0700 (PDT)
X-Received: by 2002:ac8:590a:0:b0:50b:4537:2e21 with SMTP id d75a77b69052e-50dd5c10684mr97348571cf.45.1775909452897;
        Sat, 11 Apr 2026 05:10:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:10:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:22 +0300
Subject: [PATCH v2 02/21] dt-bindings: display/panel: himax,hx8394:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-2-75cdbeac5156@oss.qualcomm.com>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=b6lJFQy4133z0QDWI8Z8xZQHGNeBu8+YH/BZ7Z2AGmc=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpEcItG6KM6cL2R/Xo5i5wx+vf7QMNN5yAHq
 4hBuRPZ3MKJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RAAKCRCLPIo+Aiko
 1U5yB/dePBkcIcpr6fn0iGCcsez44HsTKognR53WcdondMJIJDoCJ5fvEllYXUxOm7kLDrL9NtH
 MHbH6HmbUAGNMN8N3qgYZ8pFBktNKhqzU+7DMHoikwFcPNxc+UZOsxB5sGJ/wTi5S1TAPI24l6M
 lxVfJF9e1/9QZOA1Q0C4xLXPm/7wxOcNtG66VhjjTPh1fmtJdcrHcET61wHs3MayTcUkfW3Nke5
 K+FwQ5jSPCIpqQHoVaD83SGFCAfE+iL0slowEETtY/PrOehYA1jMthgcFVDfuz2FQuSFb/b3yPx
 NijpdzfYJdmRR1Fhe2JhHfy0/prsK/0HM/0QQ5D4z5EKX0Q=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX+jtoK8WlGi9f
 QvKDt27HQw0jTfL6RH4/1K9iTbwmQLMWwqISmW9cORWbvyVeWB+AIR671hzuaxqiEGe30RKr3a0
 56xImW2ONbOkdHJbFTnaSsSCcJkW3QrrblMsmMe/X2e64XBNBF4L+83XJ6FSVPG+cvpUncxajPY
 jdsW8Lgb1/uKlT7MPzCY5sbVTV88kNPWKXseUq6VOZ8+618ulQ8hK4x8VTq4n9JMS54ImbD8GCL
 WLjveei8XAvteEC6su7MzLolv/YizBlJTGSifD+WRHhjjSnDnpFjFx/MGZT648YrD6Tz1Zc7xuP
 SCjFgqkjchk251rddtDBR5BzygUQ720Axtmw4kI3sEY8a+GeQCdz9HlA7v0rDUZjCHFL2Vi0GcI
 fLdzd5g6+m5mS6qnvCvkHRgb7e24QPjRCS9wsRJ217U/WdKuV5Pay8NXDRalprJmtdBWbr5eijP
 tx2YJjexl9UsfkV23Dg==
X-Proofpoint-ORIG-GUID: MEVp80DyH6JV9Rwbl4sSv0MW5vOiSno3
X-Proofpoint-GUID: MEVp80DyH6JV9Rwbl4sSv0MW5vOiSno3
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69da3a4e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=0AHfZW8JlnlOAyLNbMwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35032-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 29D503DFC13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe Waveshare 5" and 5" DSI panels which use HX9365-E as a panel
controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 84e840e0224f..83c343b02835 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -23,6 +23,8 @@ properties:
               - hannstar,hsd060bhw4
               - microchip,ac40t08a-mipi-panel
               - powkiddy,x55-panel
+              - waveshare,5.0-dsi-touch-a
+              - waveshare,5.5-dsi-touch-a
           - const: himax,hx8394
       - items:
           - enum:

-- 
2.47.3



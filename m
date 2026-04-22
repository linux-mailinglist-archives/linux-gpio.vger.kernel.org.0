Return-Path: <linux-gpio+bounces-35373-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIs5Oy0j6WmMUwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35373-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 21:36:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D7344A33F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 21:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A35663008C20
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 19:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1DA3EE1F4;
	Wed, 22 Apr 2026 19:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BT5o0int";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUxGH1at"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01D436E496
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 19:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776886564; cv=none; b=kcON6/Qn4J1y+6BA38P7Ctawaq94+wC7xEV8X2fy1888t56Ia7XjGUyqkVbRhlf6yB/8qR5mBJQCA1yzd4+NbFTawwiKhpXLxL6wD53HJ/tlVG9r82KKFvGjfs7Jh2zHBo/QIzgzAjp/5+1xps/K9fXcaWz85j1gOc1yV79PUq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776886564; c=relaxed/simple;
	bh=vp+SJmaRpuP5wpJJX9U6EKJzOSkzhIqZAqlRBKoIrL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a8LSEJuxmr9HimRd4/iTMSAF0pIbHAuW4ht/naHggFSI0Zbw3LaqAUzE/21bwiiegWKjfOOIYRJUjLzndl67e42zV8Kqz84eEqMYNt53UnhYQ7/dbLybAj5D2nEZMUWic5c/K14+cR0lVc/QMJaWuTQxN1pZUIb+8i5Iytkbooo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BT5o0int; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUxGH1at; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG3hm32012019
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 19:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p7getAbtuwjys8gy+hm+EGK6ZsIm6NuSTLfjNxjvD/U=; b=BT5o0intOoWRwcKk
	0T4e0Hgl+A5K7WapCdR44MlSEv2s9k1OhSwGweAq8L6iSJH95ZBCx6Lvu0zlH7l5
	nUY/T7lsBc7lSe6iEeSyhuG585oEy+n+my0D1VzdmNI+42O8SR1/5lj3/UQibJMw
	3Oc3mIQNrzTQn9ntRh2Dplm/F8bXjP4K3iA3uOKpkXKstmpvbLQpkIeGWDMgSI1Y
	PBV5kjVtlEUeK8yLqfkALqxkJ3IU5vKylnSOcMHbKp96jl4L8MeDXAeMJso5HyRR
	t8HRrF4cIdFv7gxi+zfSnQJcmzyCPQswJBjhHPCxG0PUlBPafQzPLKqEfW7COwRF
	H7k/ZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h78sbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 19:36:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc49bef6so33712731cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 12:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776886557; x=1777491357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7getAbtuwjys8gy+hm+EGK6ZsIm6NuSTLfjNxjvD/U=;
        b=hUxGH1atHeG/e7WtLKFPfqLmPhc7b9gKOqoxjfTfKU8S4Bv9+kZDQFOnH3MISBIwN/
         ZWH6bCRKYFxzmlGvAhpMPYzy1wcAp6dzUfMdV9GQNXr2UtoLPrL6dwWkmB8/LoMbQOyx
         TejgkbAcgGQHgjainTeFIb5SSMtKaR2EDSHsOZeKzaLrTDn1drQ6E5KASQ8Gbo5nZlWe
         uoF128FPuBBG35JmAyMFlnNzi040LNvBwhp6wJeGJAN6NU3zT2aBZBNH+it+n5zmFOJL
         t/C895M3pB+Cnj83Zh/aRFTT7T/zmZRZo/96BtlrBxNfDCIySh0ffkDQOS/PiqxV4DSw
         rCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776886557; x=1777491357;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p7getAbtuwjys8gy+hm+EGK6ZsIm6NuSTLfjNxjvD/U=;
        b=Iyii87p0qWqvcyvbU+snQjSpape3Go7T4Jv5MQFwxOcFPxQVhnX5HdnTJBjONUp30A
         FMiqI/7OeQ5TWCmFi4gSRLmC4ZjgbiLqFbUgDHC8o3S/tKNEAHYxEfPYuF7+IVDlcZ4G
         v6QbWDqeSOGjYo1KsAtlYuQMF34KOZ6nRPIqtW1qpi6rRA3Ad3Y8kiXxPV5pOa++ASzZ
         Sbrq16BW+U166qRux+wq3qArGvqc6xB81ObFfC4gp7FrNl5xv8c2GWvN/clBicwgDD3L
         BdlIdzYXZbP0XT1iPa5OVM2P1PbQMOg9m+W9qJvNhraF/xA9kTKJt23WEjftOy7opjQh
         WAcg==
X-Forwarded-Encrypted: i=1; AFNElJ8mMXoCwAiF6gNaPkz54lK0KiMjTyYcCpRnqzs7tH8Tgwji7fK40K+hdyAYxQCjpqgO+bgKlHTmbpbv@vger.kernel.org
X-Gm-Message-State: AOJu0YwrO1NMq7Q5wndtz5AybUcrC5OahQZ/xtF0syxQivKVctMxHuID
	BGNtnBVg6j98+DXMzb3rkH7N2NC3/63HMOgeswBB3kZ0MX1F5HZsuJ+xR6Gn+nHZXqKNTEEWGzV
	7KR31iNYCN6s1bXaEEl7xcp1xnhp/RNIaZMHb7/1sQVgivxytHkkQ5qqVZ10f8QT9
X-Gm-Gg: AeBDietm5isGVeNQlHU8WIOdrREWtPrscrRLGNcGQO4ulr+VeA2FVZ+bwRIwkFlvdYN
	HTc/un6kHEHnJ+Dq/u1pQXGlp2Sdug2PzIPCEdwV62+7pnCPty0K+FMC34Fql0uc1RmVVYBJLqV
	eSte4R6bQbBrB7vw5Oi9CXSyWho55VNkK/HwxE50BYihcfKZG5K/BtFcKYdSYXBOXdnKJgxAaV/
	1fccJrWGZ3yn+jC6ghFJQysNB3+fILBz5NwMwEdUybQRDTHH1tsVz/W8sQEIeIMUqjhf6Okw0GI
	Pv6P2XC23VTlB8omzCA4JUNbAVSXC4dFbpwlz6M7UjEOOSTkvRR2m6eaVwUvurFJF8wBzHvxBhp
	3kUSvHU1gx148wPCTbfSCSBz/MG4nZPpbeZFsPoMaiT8VfgNejfmYx5ZiZLlilyJjtdTJAGLRXh
	UXxswu0DdwdkL9ynOMKtFzb3GMqeyqzm1jPj0YuACyaV0l4w==
X-Received: by 2002:a05:622a:1918:b0:50e:631c:c390 with SMTP id d75a77b69052e-50e631cc465mr177606611cf.44.1776886557586;
        Wed, 22 Apr 2026 12:35:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1918:b0:50e:631c:c390 with SMTP id d75a77b69052e-50e631cc465mr177606141cf.44.1776886557164;
        Wed, 22 Apr 2026 12:35:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm4723395e87.36.2026.04.22.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 12:35:55 -0700 (PDT)
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
        Conor Dooley <conor.dooley@microchip.com>,
        Riccardo Mereu <r.mereu@arduino.cc>
In-Reply-To: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
References: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/4] drm/panel: support Waveshare DSI TOUCH
 kits
Message-Id: <177688655533.759482.6233087265509719567.b4-ty@b4>
Date: Wed, 22 Apr 2026 22:35:55 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-Proofpoint-ORIG-GUID: 6NZTm063vpC0Lv5CE69FppT3s3XpVQJy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE4OSBTYWx0ZWRfX6utDyYs/Grzd
 aHpP5lf+osIPrxI3NkZuqOMnNUR7fw9f0C/KLZdrtHYuc8V4tFtekbwFIhSuyx9hXS3IMXXn1tI
 fL1iJrzC9PZgeM6DREVqbOp0e3DuUhQPdig73mNFifFjgENQnG9zrysY10inLkbcowjPO9UaHkP
 VY6lgdx7PbfeN34T/Wo+FPYlCa//29CbHuVv38XZSEt5uRPY4X9WauPDOeXIE84f3vHRBMENwPL
 CjKp/YX63cMy+E30gZWbDRDI7C/klaZxNSLc6Pi0srq/cNwKdhwhSCZ+4YoOP+XPbgyPAwkWHmD
 n4eif8ujuO6bUuqHXlXrh4q+TUxjLVOflTywdx6YKNJ9I0grJ8457aqxwCiQC5hAcJ+hNPX82Tp
 R4TRpKtGglMjcQXoOruvkcM72/bhsjW3tHgXL1fcoUDjz9w7999npe+N0SNSv24MAVVhbf3Q5aE
 oqTJVEh4ntPym9tg/OQ==
X-Authority-Analysis: v=2.4 cv=UqNT8ewB c=1 sm=1 tr=0 ts=69e92320 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=V1Sr_61zPZr-dZQ6qXoA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 6NZTm063vpC0Lv5CE69FppT3s3XpVQJy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220189
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35373-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90D7344A33F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 18 Apr 2026 02:16:19 +0300, Dmitry Baryshkov wrote:
> The Waveshare DSI TOUCH family of DSI panel kits feature different DSI
> video-mode panels, bundled with the separate controlling circuit,
> produing necessary voltages from the 3.3V and 5V supplies. Extend panel
> drivers to support those Waveshare panels and also add GPIO driver for
> the onboard control circuitry.
> 
> 
> [...]

Applied to drm-misc-next, thanks!

[1/4] dt-bindings: display/panel: ilitek,ili9881c: describe Waveshare panel
      commit: 7ae674a399b6d83ab9b463adb61cc0b64e298eaf
[2/4] drm/panel: ilitek-ili9881c: support Waveshare 7.0" DSI panel
      commit: 4c95b2b7d49edc5846730970cef322a6d8d967ba

Best regards,
-- 
With best wishes
Dmitry




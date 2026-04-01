Return-Path: <linux-gpio+bounces-34543-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOfuDwnLzGn5WgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34543-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:36:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E67F37606F
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F10B3050903
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D55D386428;
	Wed,  1 Apr 2026 07:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/tq/Fai";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZyA4Ie1G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B88037FF44
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028436; cv=none; b=bifT3Uo8Y/qmYXWx/Pxq2aMPXDk/nzwAykRJNFzhjToU41o94D7prnWbsTtrC4WZTKzGSIBYNqgcl0yK8qKLPb/yYQyU5EsSawgupOyqiAyy9AEULgYMrUdfZhPwu872fKZ69c16wHWvga+/LvIVwEaMeebjfb5x+qtvqKGG76I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028436; c=relaxed/simple;
	bh=GeCr1NynOzRyMTA3YNx3AI6OZgpUDXwfoJ9GX7n6oNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NjTgRvpvX4KkYGsGt+ZxgIz3rUGeCWsUbci1doa0H/5J7S0TEBkxDmAPIZG4M/p5+BlZcYR8Phf0Bx91eUSDrUAZWCo/vfbkmTHsH/qXEYajqhH1hYD4c46H4ddw7wQSvcXUjS1M5KmvkbPa9tHdWPIRNc8ZM8Whu1cf6N7neaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/tq/Fai; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyA4Ie1G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312MbOo3081565
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZzwGnW+MUE+QNALit7cwinZB2Bkr8D00pSmlzKzjwY=; b=U/tq/Faice9XsWIv
	R3zi/SqHf1VkQEQGBohUPqbccC0GqK1fNN8VzuUrNz7GELua7LXCwNwbMBMcWh1A
	5oCUURds530g1SnZwJe5DC9G+qsYtAXAwYtneJqtxjC+Q35QiB4bnFJEV28HgH2S
	Aryi5Fh59a1lXMNjKxPwdcHKwSB8buuwpOn0yU4XBxzadgCAJMnoeWyjsgAUXCfX
	WkSWZvvdSTWIMYc9QreZ64dEO9lveOwhHuMk8VeAc9s+q6ObZ7RCfHETSdhFoNJw
	nokCclVjEJBqC+TjV7NDkiXincTqgB1P2eJRMsZI/B6LgpRz125DdXv/Xw4xCKT+
	BtauoA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkttt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:27:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4031b86dso217277671cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028432; x=1775633232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZzwGnW+MUE+QNALit7cwinZB2Bkr8D00pSmlzKzjwY=;
        b=ZyA4Ie1G+CSB4Lht13ODXPJ9yzujfwrKU0kJ/Jvzj1kQiq2M7nXcgfACV3gH1nIeGT
         ULOQG5/mRJRvpElCkwwvuAKva8IAMmqDdubzrUUuBpb4Phoj1k9O9Q16qB7dkpo7Su/h
         aGABMFewR8iKGV+dlscH9ME3j+s0VOV2Yy9+6ePyiBmjf/keOvUNsoAMIEij2gnml23P
         ifKRCOTHIUtt/pEHFIt1PUcxKKegSvzKitobvUiwas5Y5jDsE3NkbG42NzDv56ZA8GK6
         NXGM3yFZAOnOCViLDJl1PQP2tfBcd2IDAPlyst3HQjdpa9ZqbGc2ZDUdoJfVIdSlc8xQ
         tq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028432; x=1775633232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nZzwGnW+MUE+QNALit7cwinZB2Bkr8D00pSmlzKzjwY=;
        b=bvUzdYDV96SEJgvBngL+X+xmW55SB+iyuV9XZsu+ES798BKlueB6GWO9bDMfujjTcX
         r5MWw3NE15EzFyOtZMqmyANq91m+qVvd0+y7xRAKpvEcrWJLeB5SyAx3HFWnqfiVWtD9
         uOZbY1CMVKR2jINu5DEz63lUu8LEs3ItZnRMx0G9NXHL4XcJ0eDOl9wWUF0HP1GeU/h2
         T9y6OQ7wGb2ipaurnW6RUhyxEzzQP9YPAsrPIpD7ziBPdds6HoK8vcVgtDJqa4t3Jn+R
         MBBcx9SbBiZn0oVZ2ICMKifco9IEV3k14lPORXFRJhOsM4j8uwMvEtC2WDNbJBoqDtzY
         EI2g==
X-Forwarded-Encrypted: i=1; AJvYcCVtYdVPyzINdBHCzGVhGjGn0F90iuQhtZLapPZ2XnJe75ks2so6gDBJJde03nY2d8novT3GuWNibGz4@vger.kernel.org
X-Gm-Message-State: AOJu0YxzOGaoJL8xDBIKba8clTuMI1/euHXAudqQUr9PxJpihSjOtxzm
	S6KsF9aS30n5H+IUw04bl2fJhGO5lNG/TAM3NSCOATIDYAIFAptWonFUK3dZ/U8N1esO8BI7dsK
	DBe2j5KgL/3XbGYzfjxFpfapm8hyGCcfyx8RqQTYAsJoNS2idghFjw94BWVgEz/+Y
X-Gm-Gg: ATEYQzw79YoDcNqoK0uzrTOxQlfqatiaAi5vO4qJIMjdcC4uMiEzYRwfRsh4cGHT9Tm
	/cHxHstD5A9v0FD8uEbPAaB8mYWWreVM2G0j60YjSZd/9RHiZ36wkCQiJElGq7qjNgtwQ603lQB
	+DFGq9v7/wJ2cc7gzk84hx13HJ3080dK6CFLIbmnyC880i6qAwY1TMiQcXMnBhHatP+LXZjs9av
	D1rbzh9ZhN0OHblFJUCuN/iCE8bIQh1GkVNYSs+YCQSTnw4OXlTr+BHYxODfgCrkYE2LDJORTkA
	Nqa0JCO/GpX2dgX+b8j6yXhNZ7XYRY0ltUbjhryRvaooW9QgPL/63Ba3RYxGsbw/SXzrPWIXVoP
	JEz4hdaFwKzgNC3rCE9ZTmIqzVRaMEM6cZQv2nDgSXy7vySS/Cs8UI6ImBH4E3n5ZkBD2Ba2YR6
	l0ENt8TSPoXdmAtczsdRRY37+8mVn6SX8PE8M=
X-Received: by 2002:a05:622a:348:b0:509:8fb:3342 with SMTP id d75a77b69052e-50d3bd0661dmr36909021cf.56.1775028431668;
        Wed, 01 Apr 2026 00:27:11 -0700 (PDT)
X-Received: by 2002:a05:622a:348:b0:509:8fb:3342 with SMTP id d75a77b69052e-50d3bd0661dmr36908831cf.56.1775028431157;
        Wed, 01 Apr 2026 00:27:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:27:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:34 +0300
Subject: [PATCH 15/19] drm/panel: ilitek-ili9881c: support Waveshare 7.0"
 DSI panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-15-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11997;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GeCr1NynOzRyMTA3YNx3AI6OZgpUDXwfoJ9GX7n6oNY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMitPi4Q15MNJK4XmXZItvI5cc+VOnMbAJ0+3
 aWH/A7b09+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIrQAKCRCLPIo+Aiko
 1f/NCACx2HAtc5+x9xeorFTo7O3LjECS+jNBLWPMndBdgCbSOcfLjtywxwdX82vrV4/OalZ0z7t
 co2ExJeYf2NzAcHgscFRmBOrbowynSkmTLkKXYKEtzHIhP48jI5lGZEeE1KCLD5gf6MHkv7BQb2
 /GrMuBqySR3YVpwgX1LoqrPbR6nnmoPQO2Vflj7L89mc2LVVV+xPgJ+OOvrmNqVgPX8hNjv+65A
 I93TC2/yUhJU96B7BTuwv8+z43L0kJQy2jv9qXVtveKBiThrSNwjLeY9dZDFKNDRg5lyFV4bTsN
 pVSefyOj6wOBhYnU7Nu7yl8uytSuDkiBckNyLy5ZQftCghts
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX9NSR9yUYWYUO
 eip6Buh8WfoM1dw0DL9klh7VN+xvaxfKzUdPffLZcfNEHvSuyJL/r+evAtecEwLkFUJg7t1vfM3
 a2owNucyNj1985Xir2l/iY4q0CRUU/HKYQ4H9+3nORFWbXzeXmUo6dLcZdU3lmy0XqVQ8RXfcFt
 i4Kgs3bBrHwCwIrbKLQr/GnelIDviNkJsnlFv2poJQEXTgnMIvj5IvoD9ZSmxeadlltfieYvW2+
 1GToygxGOmjzbZCxqqlQT6H42TINF0b3raCTAUIPFia/EXRcuxJ+WYnZR7zMrarcHVBQUwVBebV
 j3y7n6WDS5IBO2JwSFooZNCwf4GbBsqu+ZtxZZq17peknxjDN/Bg2CBe+sLF7Ua9HO3b+m+0yzV
 QsfiUTvp4t+kaBHa/vbkoE4eTfMiA9CpInHe0nbqC9SS5m/irNApYYu3GI1YHx6mFb8IxXDQT/J
 jf6ehodZq3aKQXdqMeA==
X-Proofpoint-GUID: gKiBo8-z_J5858re1e3bvtmdfP88uJVs
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69ccc8d0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Vzx2zukWpxHvXuQtFQgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: gKiBo8-z_J5858re1e3bvtmdfP88uJVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34543-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E67F37606F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable support for Waveshare 7.0" DSI TOUCH-A panel. It requires
additional voltage regulator, iovcc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 251 +++++++++++++++++++++++++-
 1 file changed, 249 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 947b47841b01..0652cdb57d11 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -52,6 +52,7 @@ struct ili9881c {
 	const struct ili9881c_desc	*desc;
 
 	struct regulator	*power;
+	struct regulator	*iovcc;
 	struct gpio_desc	*reset;
 
 	enum drm_panel_orientation	orientation;
@@ -1997,6 +1998,205 @@ static const struct ili9881c_instr bsd1218_a101kl68_init[] = {
 	ILI9881C_COMMAND_INSTR(0xd3, 0x3f),
 };
 
+static const struct ili9881c_instr waveshare_7inch_a_init[] = {
+	ILI9881C_SWITCH_PAGE_INSTR(3),
+	ILI9881C_COMMAND_INSTR(0x01, 0x00),
+	ILI9881C_COMMAND_INSTR(0x02, 0x00),
+	ILI9881C_COMMAND_INSTR(0x03, 0x73),
+	ILI9881C_COMMAND_INSTR(0x04, 0x00),
+	ILI9881C_COMMAND_INSTR(0x05, 0x00),
+	ILI9881C_COMMAND_INSTR(0x06, 0x0a),
+	ILI9881C_COMMAND_INSTR(0x07, 0x00),
+	ILI9881C_COMMAND_INSTR(0x08, 0x00),
+	ILI9881C_COMMAND_INSTR(0x09, 0x61),
+	ILI9881C_COMMAND_INSTR(0x0a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0c, 0x01),
+	ILI9881C_COMMAND_INSTR(0x0d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0f, 0x61),
+	ILI9881C_COMMAND_INSTR(0x10, 0x61),
+	ILI9881C_COMMAND_INSTR(0x11, 0x00),
+	ILI9881C_COMMAND_INSTR(0x12, 0x00),
+	ILI9881C_COMMAND_INSTR(0x13, 0x00),
+	ILI9881C_COMMAND_INSTR(0x14, 0x00),
+	ILI9881C_COMMAND_INSTR(0x15, 0x00),
+	ILI9881C_COMMAND_INSTR(0x16, 0x00),
+	ILI9881C_COMMAND_INSTR(0x17, 0x00),
+	ILI9881C_COMMAND_INSTR(0x18, 0x00),
+	ILI9881C_COMMAND_INSTR(0x19, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1e, 0x40),
+	ILI9881C_COMMAND_INSTR(0x1f, 0x80),
+	ILI9881C_COMMAND_INSTR(0x20, 0x06),
+	ILI9881C_COMMAND_INSTR(0x21, 0x01),
+	ILI9881C_COMMAND_INSTR(0x22, 0x00),
+	ILI9881C_COMMAND_INSTR(0x23, 0x00),
+	ILI9881C_COMMAND_INSTR(0x24, 0x00),
+	ILI9881C_COMMAND_INSTR(0x25, 0x00),
+	ILI9881C_COMMAND_INSTR(0x26, 0x00),
+	ILI9881C_COMMAND_INSTR(0x27, 0x00),
+	ILI9881C_COMMAND_INSTR(0x28, 0x33),
+	ILI9881C_COMMAND_INSTR(0x29, 0x03),
+	ILI9881C_COMMAND_INSTR(0x2a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x30, 0x00),
+	ILI9881C_COMMAND_INSTR(0x31, 0x00),
+	ILI9881C_COMMAND_INSTR(0x32, 0x00),
+	ILI9881C_COMMAND_INSTR(0x33, 0x00),
+	ILI9881C_COMMAND_INSTR(0x34, 0x04),
+	ILI9881C_COMMAND_INSTR(0x35, 0x00),
+	ILI9881C_COMMAND_INSTR(0x36, 0x00),
+	ILI9881C_COMMAND_INSTR(0x37, 0x00),
+	ILI9881C_COMMAND_INSTR(0x38, 0x3c),
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x40, 0x00),
+	ILI9881C_COMMAND_INSTR(0x41, 0x00),
+	ILI9881C_COMMAND_INSTR(0x42, 0x00),
+	ILI9881C_COMMAND_INSTR(0x43, 0x00),
+	ILI9881C_COMMAND_INSTR(0x44, 0x00),
+	ILI9881C_COMMAND_INSTR(0x50, 0x10),
+	ILI9881C_COMMAND_INSTR(0x51, 0x32),
+	ILI9881C_COMMAND_INSTR(0x52, 0x54),
+	ILI9881C_COMMAND_INSTR(0x53, 0x76),
+	ILI9881C_COMMAND_INSTR(0x54, 0x98),
+	ILI9881C_COMMAND_INSTR(0x55, 0xba),
+	ILI9881C_COMMAND_INSTR(0x56, 0x10),
+	ILI9881C_COMMAND_INSTR(0x57, 0x32),
+	ILI9881C_COMMAND_INSTR(0x58, 0x54),
+	ILI9881C_COMMAND_INSTR(0x59, 0x76),
+	ILI9881C_COMMAND_INSTR(0x5a, 0x98),
+	ILI9881C_COMMAND_INSTR(0x5b, 0xba),
+	ILI9881C_COMMAND_INSTR(0x5c, 0xdc),
+	ILI9881C_COMMAND_INSTR(0x5d, 0xfe),
+	ILI9881C_COMMAND_INSTR(0x5e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x5f, 0x0e),
+	ILI9881C_COMMAND_INSTR(0x60, 0x0f),
+	ILI9881C_COMMAND_INSTR(0x61, 0x0c),
+	ILI9881C_COMMAND_INSTR(0x62, 0x0d),
+	ILI9881C_COMMAND_INSTR(0x63, 0x06),
+	ILI9881C_COMMAND_INSTR(0x64, 0x07),
+	ILI9881C_COMMAND_INSTR(0x65, 0x02),
+	ILI9881C_COMMAND_INSTR(0x66, 0x02),
+	ILI9881C_COMMAND_INSTR(0x67, 0x02),
+	ILI9881C_COMMAND_INSTR(0x68, 0x02),
+	ILI9881C_COMMAND_INSTR(0x69, 0x01),
+	ILI9881C_COMMAND_INSTR(0x6a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x6b, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6c, 0x15),
+	ILI9881C_COMMAND_INSTR(0x6d, 0x14),
+	ILI9881C_COMMAND_INSTR(0x6e, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6f, 0x02),
+	ILI9881C_COMMAND_INSTR(0x70, 0x02),
+	ILI9881C_COMMAND_INSTR(0x71, 0x02),
+	ILI9881C_COMMAND_INSTR(0x72, 0x02),
+	ILI9881C_COMMAND_INSTR(0x73, 0x02),
+	ILI9881C_COMMAND_INSTR(0x74, 0x02),
+	ILI9881C_COMMAND_INSTR(0x75, 0x0e),
+	ILI9881C_COMMAND_INSTR(0x76, 0x0f),
+	ILI9881C_COMMAND_INSTR(0x77, 0x0c),
+	ILI9881C_COMMAND_INSTR(0x78, 0x0d),
+	ILI9881C_COMMAND_INSTR(0x79, 0x06),
+	ILI9881C_COMMAND_INSTR(0x7a, 0x07),
+	ILI9881C_COMMAND_INSTR(0x7b, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7c, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7d, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7e, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7f, 0x01),
+	ILI9881C_COMMAND_INSTR(0x80, 0x00),
+	ILI9881C_COMMAND_INSTR(0x81, 0x02),
+	ILI9881C_COMMAND_INSTR(0x82, 0x14),
+	ILI9881C_COMMAND_INSTR(0x83, 0x15),
+	ILI9881C_COMMAND_INSTR(0x84, 0x02),
+	ILI9881C_COMMAND_INSTR(0x85, 0x02),
+	ILI9881C_COMMAND_INSTR(0x86, 0x02),
+	ILI9881C_COMMAND_INSTR(0x87, 0x02),
+	ILI9881C_COMMAND_INSTR(0x88, 0x02),
+	ILI9881C_COMMAND_INSTR(0x89, 0x02),
+	ILI9881C_COMMAND_INSTR(0x8a, 0x02),
+
+	ILI9881C_SWITCH_PAGE_INSTR(4),
+	ILI9881C_COMMAND_INSTR(0x38, 0x01),
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+	ILI9881C_COMMAND_INSTR(0x6c, 0x15),
+	ILI9881C_COMMAND_INSTR(0x6e, 0x2a),
+	ILI9881C_COMMAND_INSTR(0x6f, 0x33),
+	ILI9881C_COMMAND_INSTR(0x3a, 0x94),
+	ILI9881C_COMMAND_INSTR(0x8d, 0x14),
+	ILI9881C_COMMAND_INSTR(0x87, 0xba),
+	ILI9881C_COMMAND_INSTR(0x26, 0x76),
+	ILI9881C_COMMAND_INSTR(0xb2, 0xd1),
+	ILI9881C_COMMAND_INSTR(0xb5, 0x06),
+	ILI9881C_COMMAND_INSTR(0x3b, 0x98),
+
+	ILI9881C_SWITCH_PAGE_INSTR(1),
+	ILI9881C_COMMAND_INSTR(0x22, 0x0a),
+	ILI9881C_COMMAND_INSTR(0x31, 0x00),
+	ILI9881C_COMMAND_INSTR(0x53, 0x71),
+	ILI9881C_COMMAND_INSTR(0x55, 0x8f),
+	ILI9881C_COMMAND_INSTR(0x40, 0x33),
+	ILI9881C_COMMAND_INSTR(0x50, 0x96),
+	ILI9881C_COMMAND_INSTR(0x51, 0x96),
+	ILI9881C_COMMAND_INSTR(0x60, 0x23),
+	ILI9881C_COMMAND_INSTR(0xa0, 0x08),
+	ILI9881C_COMMAND_INSTR(0xa1, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xa2, 0x2a),
+	ILI9881C_COMMAND_INSTR(0xa3, 0x10),
+	ILI9881C_COMMAND_INSTR(0xa4, 0x15),
+	ILI9881C_COMMAND_INSTR(0xa5, 0x28),
+	ILI9881C_COMMAND_INSTR(0xa6, 0x1c),
+	ILI9881C_COMMAND_INSTR(0xa7, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xa8, 0x7e),
+	ILI9881C_COMMAND_INSTR(0xa9, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xaa, 0x29),
+	ILI9881C_COMMAND_INSTR(0xab, 0x6b),
+	ILI9881C_COMMAND_INSTR(0xac, 0x1a),
+	ILI9881C_COMMAND_INSTR(0xad, 0x18),
+	ILI9881C_COMMAND_INSTR(0xae, 0x4b),
+	ILI9881C_COMMAND_INSTR(0xaf, 0x20),
+	ILI9881C_COMMAND_INSTR(0xb0, 0x27),
+	ILI9881C_COMMAND_INSTR(0xb1, 0x50),
+	ILI9881C_COMMAND_INSTR(0xb2, 0x64),
+	ILI9881C_COMMAND_INSTR(0xb3, 0x39),
+	ILI9881C_COMMAND_INSTR(0xc0, 0x08),
+	ILI9881C_COMMAND_INSTR(0xc1, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xc2, 0x2a),
+	ILI9881C_COMMAND_INSTR(0xc3, 0x10),
+	ILI9881C_COMMAND_INSTR(0xc4, 0x15),
+	ILI9881C_COMMAND_INSTR(0xc5, 0x28),
+	ILI9881C_COMMAND_INSTR(0xc6, 0x1c),
+	ILI9881C_COMMAND_INSTR(0xc7, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xc8, 0x7e),
+	ILI9881C_COMMAND_INSTR(0xc9, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xca, 0x29),
+	ILI9881C_COMMAND_INSTR(0xcb, 0x6b),
+	ILI9881C_COMMAND_INSTR(0xcc, 0x1a),
+	ILI9881C_COMMAND_INSTR(0xcd, 0x18),
+	ILI9881C_COMMAND_INSTR(0xce, 0x4b),
+	ILI9881C_COMMAND_INSTR(0xcf, 0x20),
+	ILI9881C_COMMAND_INSTR(0xd0, 0x27),
+	ILI9881C_COMMAND_INSTR(0xd1, 0x50),
+	ILI9881C_COMMAND_INSTR(0xd2, 0x64),
+	ILI9881C_COMMAND_INSTR(0xd3, 0x39),
+
+	ILI9881C_SWITCH_PAGE_INSTR(0),
+	ILI9881C_COMMAND_INSTR(0x3a, 0x77),
+	ILI9881C_COMMAND_INSTR(0x36, 0x00),
+};
+
 static inline struct ili9881c *panel_to_ili9881c(struct drm_panel *panel)
 {
 	return container_of(panel, struct ili9881c, panel);
@@ -2035,9 +2235,19 @@ static int ili9881c_prepare(struct drm_panel *panel)
 	int ret;
 
 	/* Power the panel */
+	if (ctx->iovcc) {
+		ret = regulator_enable(ctx->iovcc);
+		if (ret)
+			return ret;
+	}
+
+	msleep(5);
 	ret = regulator_enable(ctx->power);
-	if (ret)
-		return ret;
+	if (ret) {
+		mctx.accum_err = ret;
+		goto disable_iovcc;
+	}
+
 	msleep(5);
 
 	/* And reset it */
@@ -2074,6 +2284,9 @@ static int ili9881c_prepare(struct drm_panel *panel)
 
 disable_power:
 	regulator_disable(ctx->power);
+disable_iovcc:
+	if (ctx->iovcc)
+		regulator_disable(ctx->iovcc);
 	return mctx.accum_err;
 }
 
@@ -2085,6 +2298,8 @@ static int ili9881c_unprepare(struct drm_panel *panel)
 	mipi_dsi_dcs_set_display_off_multi(&mctx);
 	mipi_dsi_dcs_enter_sleep_mode_multi(&mctx);
 	regulator_disable(ctx->power);
+	if (ctx->iovcc)
+		regulator_disable(ctx->iovcc);
 	gpiod_set_value_cansleep(ctx->reset, 1);
 
 	return 0;
@@ -2260,6 +2475,23 @@ static const struct drm_display_mode bsd1218_a101kl68_default_mode = {
 	.height_mm	= 170,
 };
 
+static const struct drm_display_mode waveshare_7inch_a_mode = {
+	.clock		= 83333,
+
+	.hdisplay	= 720,
+	.hsync_start	= 720 + 120,
+	.hsync_end	= 720 + 120 + 100,
+	.htotal		= 720 + 120 + 100 + 100,
+
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 10,
+	.vsync_end	= 1280 + 10 + 10,
+	.vtotal		= 1280 + 10 + 10 + 10,
+
+	.width_mm	= 85,
+	.height_mm	= 154,
+};
+
 static int ili9881c_get_modes(struct drm_panel *panel,
 			      struct drm_connector *connector)
 {
@@ -2329,6 +2561,11 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->power),
 				     "Couldn't get our power regulator\n");
 
+	ctx->iovcc = devm_regulator_get_optional(&dsi->dev, "iovcc");
+	if (IS_ERR(ctx->iovcc))
+		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->iovcc),
+				     "Couldn't get our iovcc regulator\n");
+
 	ctx->reset = devm_gpiod_get_optional(&dsi->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset))
 		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->reset),
@@ -2454,6 +2691,15 @@ static const struct ili9881c_desc bsd1218_a101kl68_desc = {
 	.lanes = 4,
 };
 
+static const struct ili9881c_desc waveshare_7inch_a_desc = {
+	.init = waveshare_7inch_a_init,
+	.init_length = ARRAY_SIZE(waveshare_7inch_a_init),
+	.mode = &waveshare_7inch_a_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_HSE |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 2,
+};
+
 static const struct of_device_id ili9881c_of_match[] = {
 	{ .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
 	{ .compatible = "bestar,bsd1218-a101kl68", .data = &bsd1218_a101kl68_desc },
@@ -2462,6 +2708,7 @@ static const struct of_device_id ili9881c_of_match[] = {
 	{ .compatible = "tdo,tl050hdv35", .data = &tl050hdv35_desc },
 	{ .compatible = "wanchanglong,w552946aaa", .data = &w552946aaa_desc },
 	{ .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },
+	{ .compatible = "waveshare,7.0-dsi-touch-a", .data = &waveshare_7inch_a_desc },
 	{ .compatible = "ampire,am8001280g", .data = &am8001280g_desc },
 	{ .compatible = "raspberrypi,dsi-5inch", &rpi_5inch_desc },
 	{ .compatible = "raspberrypi,dsi-7inch", &rpi_7inch_desc },

-- 
2.47.3



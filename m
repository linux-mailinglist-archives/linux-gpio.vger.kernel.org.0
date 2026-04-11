Return-Path: <linux-gpio+bounces-35043-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D+EEtc62mn0zAgAu9opvQ
	(envelope-from <linux-gpio+bounces-35043-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:13:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E166B3DFBF3
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0ED3D304820F
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AF535E925;
	Sat, 11 Apr 2026 12:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkJdHlqy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+dB2ipz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E9335CBD7
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909480; cv=none; b=Bpct70s7VF39mJdajs8yz4DN/J0XEVwYcUvtAYEWwmLz292xcUrDvmdlJzF2c1PJs+lvonI0fiK7kRyB6rlB6mbGF2dlK0RvKAXlXHA+qEOyhoPudCrH5M69u2gO6PDQ2BuxcT6hARZNM/4ZLQn5r4P6mC684IHa4mLPRp2zuls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909480; c=relaxed/simple;
	bh=ItKhX2Lojt9KIazo72U3GJYoHblfjFW2x10W7iSKuEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t6JoPiB5joHypwKHOUPy5tqr56tLrn1VECHWelvEvWqwvwXJLhvU5PmnxpWzNyrmDxNDc1V8KX92BDSYxHQK7fzQlJ9zxJaqXbXHPwjX5VTYi+dEdaIjvRlp99fya7FQfqbPjBB+OAoeIDrzajAaonLQLTbI/8qB7hlT8i4j0YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkJdHlqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+dB2ipz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B402dh516566
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RKa6xeChRoaH9uw0NWPjegEQauJVOAFpyTvUBF7c83g=; b=XkJdHlqyqNNNVJ0T
	JjR2ex2NYnd8z67RD/PBTYWlKq7fTF4gQvBIchCi2R5y4HILTn/+PVPKSI9+8YI/
	N6jHuKaxydlsG4+vMcLwyYKAGt7aB0C/yHWs+nOySWnD+lS03xr8vX937RjJkdbm
	LX7k2QxbGmIFJrMr78lMoCWM5/wzTcXx1KYWN1/4gl/q9p19fy6wgq82u9D+mBAB
	HD7sT5CyRawMil5ynPmjAkx4ynxInHCYEiR9zUkxhYOtg/GgxyKytYKa/srkhW6X
	Srvxi2Vxe2VXzMosqtfCa3Apq2h2GLmR219tv8Mczj/a9BbiwvoSJsT1L97unfip
	H2gDFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtgnht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfcf23c0e1so594369485a.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909477; x=1776514277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKa6xeChRoaH9uw0NWPjegEQauJVOAFpyTvUBF7c83g=;
        b=f+dB2ipziBorQBM2XXQZEspUk/A9nwvO0yi3frn3cSvr39ZChFtCoPbBv27oxv5QPe
         4eQ3D6tQpb/mR7VTUO0PmXZLE27h5Nzj8ki28s8uH+eeeXqc56fdzy5KSDaYB5mULv3f
         HusEb9cNVj5ctpflQjrDpucfbPke6YvKsx471afRo/rUTrPZxvMa64oYAQfM4UXTGpxz
         E1cgEeX4cXX7wy3ltMXUx5HIo8Qv9gAcuSZtm7Uzp0/eQC7eJzro0awmRUUqMD2zRHw+
         s8EwGhbd4R7cD2QNrNxN11aag7I5eBXm3kTKkkhMdf1LWFq86S3mOQVRKnCOTyLnLXvv
         WdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909477; x=1776514277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RKa6xeChRoaH9uw0NWPjegEQauJVOAFpyTvUBF7c83g=;
        b=fb10UUUSERYU9qKHxX8EbnSLe0un7MCPbTIztNbV49oiKtDqzhMSZDyLt6JW1hIFKV
         HrtIgrnCngemmf2/z0f6r52Ip7oheCz5XaQ0Ts2fbfZ24Uy0v/K8SY3CX+eJilDeEAPJ
         Cn9yYv1hcRjV5/JMRwOXdM6bMAo07Da71cxRzeSX9EoAhU+8X6Qxk3yBj7Z151rT7zCp
         Ym2DCKg1USTl3KtPiUIoqk5bF4sCefnVYesIFkZsWqPx67EtYCaikD720CyQqiwLBlGW
         YyzRvRkh1PaKZrogctqkBaTuG+FGTEsdwIp8s6hWC4UTFuXUJBtjg8bADg5iL4jj54St
         Kwng==
X-Forwarded-Encrypted: i=1; AJvYcCVlJJTXGHiM8CWeQ5ZNNRk4n7Op9IL5z30faG74q9iP3KgOhVchPGyde9ZvVB4pj23Pq/KoqOvA9a9L@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7ixvnL+qeJLRn6KrkhsjAAzJ1Y69DjSPf819YtwygKt1O7zg5
	GIQxBqd4RBCoTQIoeBKI4ibQyuq2rzMJaKPraUMwmhNIY71JQBVzKapaHNNBPb7IrO3QrI3r2gn
	Lusiqpt38omqEl9G3ELPHmU+iQ+dW+VbEcPFDo51YFVDB1BNnJJGRSZYcU/eiXegy
X-Gm-Gg: AeBDieu8h6Rj819IqdEwDwrphspbCrZ2aRDpF3PkRsOUQVfDplBDBpVvyHgBsTFd1MN
	JFxMFrpznpBSAW0L0xxE7m5VSyr2WMZKsDdQtlMYwHKK0hX8gNKn4OP4KgBC96uVpNpWX4Zs/rm
	6segluGVj+fsBbiEcdJwMQxC0Ca0sBHUVcH2s2uSRcpnwKcbeIxvwC+zeyCcwcuW9UifUYShrTs
	OgHIQfWoz8cdMS3RoJT2cmCkMOZdYW09ZwUS1hM4gKhIJ4ufaam5EicX9tXTKxAlOM+/+klrXf9
	xcr3cFOAU22b0yRY07BfDqD/Urr4hyaV5mQ0qYKZvBrvl2kdQNPT8iOTUMomUX0+RjPRyAU6xDl
	njsf3XuZ7S7E3Q1n1vV5L94foAYK/uYx+mpNVZJLv9mjonasILkYos4B7wdYsDth6XuIGmOtx8N
	DmNEaiA56lBMSfMB0bXIKlHaMdHkWnqVAwq84=
X-Received: by 2002:a05:622a:550d:b0:50b:2876:586 with SMTP id d75a77b69052e-50dd5ad112emr103796421cf.5.1775909477115;
        Sat, 11 Apr 2026 05:11:17 -0700 (PDT)
X-Received: by 2002:a05:622a:550d:b0:50b:2876:586 with SMTP id d75a77b69052e-50dd5ad112emr103795881cf.5.1775909476721;
        Sat, 11 Apr 2026 05:11:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:33 +0300
Subject: [PATCH v2 13/21] drm/panel: jadard-jd9365da-h3: set
 prepare_prev_first
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-13-75cdbeac5156@oss.qualcomm.com>
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
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ItKhX2Lojt9KIazo72U3GJYoHblfjFW2x10W7iSKuEo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpGwlOUdLdYTrG2qMsikq5j9EIHjvVUbb/Zc
 qntYLYJwhSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RgAKCRCLPIo+Aiko
 1fm2B/kBk92iEqPsVJKR2/4lISThQL19zM68HkY3kSGFyWIo5pCnoRR2gmnIWYWgNjpV6lysCFI
 3gsLs2S2qhux43Cn2EoLEJp05js6ZYHqmGWXqnzpW04Y7GKfFhy8UHLsV4LTwxqdCCvxCjywl5S
 ha8NsuuYsDO3oDDIhXiQnKzEGPeTi1qThFHMG+9Bkzp21X0SaFvwkOwpIAWa0d3RMdZFTMUqm5k
 cV4a7v7eV74HJpLF/tSQGvKwl89sSemOm3tvkMP0in1PalkmpFC29Xarx8mNq9JUK72YuFGEsvQ
 PCWfmPdMRKH7dShTRjzuE3I4GN7mjMh9hRsHsStPodxzWa1k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69da3a65 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ic6V0yA_i5s2A4o5CdYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: umtmTx1lNkkSvJwTwkae78GNol3W6J4t
X-Proofpoint-ORIG-GUID: umtmTx1lNkkSvJwTwkae78GNol3W6J4t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX6xSXBzKmHF3V
 O9MsyadIMVPyE89MSWv92tiAOLGESQNLlQN8uS2WzopLdt56wMtfnTguVDH7/VKcK3vngGb23kW
 /DoLhiYisBhR8rCrk76AyLoaFqbMqqj3hiM+1VrUX46me5tTX4nVsndiEZOGzP1yOrjUuOx8CoH
 7KQzg6T620X7FoTmlIrJ1BdNblLBF+e0PS7XqWYh6iXlAafR2SRF081dHOT0OiLd4oJneed0TR+
 EckwGc6Lw5poKJgINmCKosdwaSwsBeH/f4Sn+bWNbvN1z2sivPrZgeVEhZ6GDHzZJwY5O6GPhwg
 olcH1qnBJAm7JOHLhyTn8P09s3ouB77q2TxkFO3/+VoKT7MlaeXgeSJAsFKla0Yn0J0r03GHgyk
 60f3jF1r2l8ZIJhNUltJGuMLknSGoTDgZf6CAWPH7U74Ia9T49E4Zhoaqp1G5I/q1nkv0Q8Oe57
 5COJUcFmXtsf2EoGhAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35043-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arduino.cc:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: E166B3DFBF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sending DSI commands from the prepare() callback requires DSI link to be
up at that point. For DSI hosts is guaranteed only if the panel driver
sets the .prepare_prev_first flag. Set it to let these panels work with
the DSI hosts which don't power on the link in their .mode_set callback.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 5d9db2e1f28f..11b7e07c1af8 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -1652,6 +1652,8 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
+	jadard->panel.prepare_prev_first = true;
+
 	drm_panel_add(&jadard->panel);
 
 	mipi_dsi_set_drvdata(dsi, jadard);

-- 
2.47.3



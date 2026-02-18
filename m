Return-Path: <linux-gpio+bounces-31788-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aN56Ee6NlWl7SQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31788-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 11:01:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A036B1550FE
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 11:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A86DF305E9C9
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BD233EAF5;
	Wed, 18 Feb 2026 09:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVIQnnk8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfuq44+B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB54533DEEC
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 09:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771408612; cv=none; b=YDOTlkwAntxESaUtT7rcYUpsY+7hdjXIZlRkdmMb0qEhNCMSg0suYIoW7vGRxBCWlg/OfrjYVYGFWPrTn3PQyHTq7NeThURDTZEmI21N7W71AFOqeBeFM6IVh+vNegfMeMvWXEK3mTxv5av06X8ArJc3oJu/2Vx3GZ9LGSjR9Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771408612; c=relaxed/simple;
	bh=u2tBESjWkvis8k68lleAVqbXE4lclctVHvD1qQpzdKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RfOb1sG9788XI4NOBhyJubb+/oTp1vTkXO1RPTbhxXbw9NpDR1d5aEDcuzHIuJYsoWO7vulG/qeL5IgxnI9wln2Dh/UCAhZpaVLbeHevZrncNJ03Iih4SR6aYZH1s5X8fpJcTN4RigvOIxiMfB44WXv3B9Uj7P9xbKiJ8ggJMM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BVIQnnk8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfuq44+B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I9cnC72784529
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 09:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4txPMGwKZ0ls0RxfqDGYOi3z5CSs5NiKqTT6y7hAQuY=; b=BVIQnnk8AAXLAZXr
	8LcxsqMXiQ+6PvwGpca+f1+rEI8CDS58RAZvchDQAMkyz7t9xnbHN71rCcQ56vv1
	xDhSB8yFooWP4VygHwWFXJ08B/SLnUAWtFNbTEeVFXv3Kj5BKsvRz6COqoqTiWIY
	jMICZOcRLqKnC/vaauyGaCjZSMVj+oxJBlq1fHC554gko+uWwhbtXYEM3y+N28vk
	URzySauR4tiapLhq2LWTZ+dbUmOGVsESGMmLA1X3pUSTYkHD8YX5sITOj1qdZ73w
	TQnoD2Dbfxj5lk/XOK8KKNTlAWq53nP2HEAAwBcok1+ekRH20qcnq0sQu1ofaBAf
	4+I5YA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccyrk1rn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 09:56:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70fadd9a3so4283922685a.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 01:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771408608; x=1772013408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4txPMGwKZ0ls0RxfqDGYOi3z5CSs5NiKqTT6y7hAQuY=;
        b=gfuq44+BVoPaNRgkSaaVvsJPg0kF3X1cMI64Bmi3oakLDfHHPk0UqiscYlYrrziKWz
         3zmztMrPVSPUMIQFX6vZdKDLoyZJSrf5zJIZNosirrdvHhGlhwgUyXRAqdgtnizX9dMR
         DMaXL9bmsjkXPqFA6Xq0rjEOGRoCKWbFQ4pLUc0vwHo4Uxe3+sV2afgKH+CvkP9fWAyv
         nhcJOW/pYaVLHTuyOpehMuHU5w7jiTyuJ/COMrMhYV3VJIqFMaRPzotvk4l93bfsI5mc
         7oBf0cKulKrrfspqXzGJfADKHloapXZBcWkIkbRNvzPfS2nD0vpcBLdCtAZc6P9o2ugW
         OfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771408608; x=1772013408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4txPMGwKZ0ls0RxfqDGYOi3z5CSs5NiKqTT6y7hAQuY=;
        b=ineAbAvJSvSEbppri7YQU2Qg1aw+m9zv78oacNZiZsndACIu3TY86QbxxHp2x3eTRh
         JIhiHVFbVv/TFPLHEdk8TtaAYWUQJJtsquW9hPKnxcqjVA1WykqqzKFjGBr7PXh+Klye
         UV//Zf7zk2C2QvOZx+rjJrqsrurdn1vUD0iFyOWcR4oiEQHu9VcYJtlnLvVz9XUcf64y
         tVRvJG5pIECXBjLxeWitSiiSX5FNWO5z/x67A2ufa8uPOftlvCBy+b49SCH2ZkKEDUn6
         adFB7IPqnKNPbtixr/XzqvuzrjDtcLlaDPqOH8U/ebhlOPsq6QZifcdXGHxz4qwJ7+Fe
         WWZg==
X-Forwarded-Encrypted: i=1; AJvYcCVeVBz9h+Ey2pCIvdtzW+Gos/BI1Yiv5NZGr13xUhehrDhVVyY0k+EBCPSanHfOxZzHQeoTjTU7DkaZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8mwo2o5Zgsk3k2HJcPSXlUafkj79Yk5yUm/ygU5BpWfxQ9cnv
	g+ARpZJ0FB2ggtA83xL2c8KXdpf0qyfi7KMoagC8adRlM3teuytAroyhoinTfJDu82UMXbY9hHC
	Dxgsn2AjBgqNvsC+aqrIEbJKp0kWKQkyND/xgNpWsKn+Nsyi2O4bm4YUMZHbD5oom
X-Gm-Gg: AZuq6aKb7252nQVpyygRRtsH7dLo3XPH4lwAR1mcy7WzalDf9XfquyqYTiLnwEKcrZt
	lyPJDicdNpsSuoTRwAya9C73MUU99gd7Vs3MzV9grdD7CY0bLWlPdAwCNYIQVtlO/BBDbZPMjAq
	zwfxzMfcWWEpKQIUZelj6K2+XbUhQXpAmTicWf4qqffHcndHMXNEy6oL0nzP1LvXgte7pmlXHg+
	PPcllQE+U9nxXXxmuAW+fXD2o64lD17F3LdkxQHLcmg1D5USQ1FbOtC9Bt8RcIBwYBHmW4l/i5M
	ive8x+qeWMGANuoDVP920QNmWd+HBDwK3nVfNoQumc3KppdJbT5YrPEGNaYOmxZIUcsMC4nijKI
	jziaSXHoKLtXlHBQQFexeWlv6XNDPrZ52pWXJw4cw/pzYE5E3V+g=
X-Received: by 2002:a05:620a:298a:b0:8c9:f996:81fd with SMTP id af79cd13be357-8cb4bfbe412mr1711530085a.33.1771408608043;
        Wed, 18 Feb 2026 01:56:48 -0800 (PST)
X-Received: by 2002:a05:620a:298a:b0:8c9:f996:81fd with SMTP id af79cd13be357-8cb4bfbe412mr1711529285a.33.1771408607625;
        Wed, 18 Feb 2026 01:56:47 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6f70:9a29:d138:f5ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839839d960sm22820025e9.3.2026.02.18.01.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 01:56:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Tj <tj.iam.tj@proton.me>, Hans de Goede <hansg@kernel.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: amd-fch: ionly return allowed values from amd_fch_gpio_get()
Date: Wed, 18 Feb 2026 10:56:44 +0100
Message-ID: <177140860258.56176.7413188259403645249.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aZTlwnvHt2Gho4yN@google.com>
References: <aZTlwnvHt2Gho4yN@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XdX_4zzClQSpCZGBaxf9OSocPc848o4y
X-Proofpoint-ORIG-GUID: XdX_4zzClQSpCZGBaxf9OSocPc848o4y
X-Authority-Analysis: v=2.4 cv=eOweTXp1 c=1 sm=1 tr=0 ts=69958ce0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=DsF39D202oCcDz-wXQMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA4OCBTYWx0ZWRfX6581Xyv2qU2i
 MX7FLyeaDPOLOJz9qdw1FGwRfbHrawlZFNeUxCTcVxotds5wFX6lPmeGlWeQ1qlCX+QelrF9HmV
 rMUzAiAg+ZLCyrKegLJz9FnenfZP7nuewQrp9NOE+edSotxa/zJ7GQCg1YCDOUWjyUPYOgkAoxu
 cke9bEcWPOV7VbCUcJLhWzcWKUnijIJ8Xnft+iPgZ2RFglejfRNSZv0vEGdbphkEqZ8W4l3nnfY
 UxYzvITNCcl9fnN6pJnBWx0BfvL2OyVzBOdLGyW5DpPVTydMKDCk0W9NdsrKWDOAqJctNkO6xSL
 ttoUk3a0zHfq5VpKh5y6ET9IZpy9eiR1bBK6e+93hR4e1sDtdyXRV7WwH26a32UdLEwrk2COGaQ
 ExHiBpjHTGLZmwDW2bV8e+//ZqL2aIu1Mobo/PPa+8rEoW2cCWSWMN/sX0B88JQGvR0MAiMRWeZ
 CXRZAagS6pN6TR4zXlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-31788-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A036B1550FE
X-Rspamd-Action: no action


On Tue, 17 Feb 2026 14:11:49 -0800, Dmitry Torokhov wrote:
> As of 86ef402d805d ("gpiolib: sanitize the return value of
> gpio_chip::get()") gpiolib requires drivers implementing GPIOs to only
> return 0, 1 or negative error for the get() callbacks. Ensure that
> amd-fch complies with this requirement.
> 
> 

Applied, thanks!

[1/1] gpio: amd-fch: ionly return allowed values from amd_fch_gpio_get()
      https://git.kernel.org/brgl/c/fbd03587ba732c612b8a569d1cf5bed72bd3a27c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


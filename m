Return-Path: <linux-gpio+bounces-37045-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBLWEX7jCmo29AQAu9opvQ
	(envelope-from <linux-gpio+bounces-37045-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 12:01:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B71956A3A7
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 12:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F74D300F278
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DB937F73C;
	Mon, 18 May 2026 09:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2VSjXsK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KWqwyOaM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46533325491
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098013; cv=none; b=pZr/aQK7vyVsZ6HVlEM8c8S4YN6ukDRuObktcO7ex8sHRXaIUoBjD6nEKVdmByYvaxOx+hdHT77Gpra5ulAcp0JXtBb/thNOLOgEeQstLLUiQipL6nRDn94SsTD5lCQTKmiKv/dGSzgidLVSb3bHLhY8CHLpqRDPVjV/O8RdjPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098013; c=relaxed/simple;
	bh=IsyqhCIQYv0OPR+tIPqbdqb9EEg5Xbfzd++Cj033fzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r8QPcsCJWuTC8Wanvg4Vo2VIOD24OVpgIuOJsib4Ej3DzVY/a9nREFGAlghlWopfnp4tgXoPdoDMVLvw5zhu3TTBlsPybq9OZWdqEIxv2m9OOjggiYnRjNdaKxGSqdvD5JVP+rk/yGm60SaezTumYp9qXo40GuOx5yyaKtALbxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g2VSjXsK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KWqwyOaM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5bITY1696574
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5DbsqXoNkVoB0BGjVJkrQREP2JTnAphwQVRHnV+uvkQ=; b=g2VSjXsK49kTzV6g
	J8lXzhlOB6CFaG5DL8DEfBGJTxMXaNkOBcLikNKCsCoGj1fFekjCL1aPOmndlspY
	eUsSP9YN6Ff4xvpVxPorAWHAqpacsS5w5p4h4s/9lC5nvXxehrmMN7gd6WaiDDJT
	O+2dPbdwYdivootk7XuEqJQjBmqKVyiT34+KsNXxJBUrEPNrzsv26duOFHGc49FG
	gzg5tSOkETbcR3VvUtnGmR0LJSrJ0YTMDgkV3KPJV77a/Bz4ZBKBiCdykanxI7PF
	7QmmNYl4UkjcNkDe8gK7QrT3Nn3Wac+cS8gSYjHOzZDj0zVKTuWtuc6hlc3f0p0P
	9qGxJw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vsk13n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:53:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516879bf1a7so36268241cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 02:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779098010; x=1779702810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DbsqXoNkVoB0BGjVJkrQREP2JTnAphwQVRHnV+uvkQ=;
        b=KWqwyOaMFpv4RSBw0CTVxho02/NjOiaa5KDmRaP7KYSBDjrBcN2f+n6Mc0LtiwXeUQ
         e3aaIHV6KshlwxE21OW0thdk+bcMlGkDWLrsN8I1VNe1VOUL2nZoxIOBv8b6X+jch+O8
         MrB49ABcR/ivionA+411hHuNnlGJBuWBEcWLk6BcBGeEuZZPZxRF/vRHrgy9+iowDB8u
         vDsjFtBsLXW36t9N9NNNDJso/9Ia+r/XbFjXffQ7ZWazo/p5Jw6mtygKPTZKErlUiYKY
         rpPBvX6B+fzuBM5tmQYS/rMGwTboQRNGpfrS1K4M+X2SMxji7/gCJPJo/KvtCEtqjFJ/
         qgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779098010; x=1779702810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5DbsqXoNkVoB0BGjVJkrQREP2JTnAphwQVRHnV+uvkQ=;
        b=aWkL8SupPRst0POjP3azyP3MaYNln/aRYepSE6AoCswxYbpQ55qlEo6ZxhpHi9qjOK
         OkDVg9s3nk+KrMs9SiyQgzrRPI13yBekOKpMsCJwvFQSEfOrh6HT/0G0U9GvsqH93cFu
         O8rHCS3G7RVVx5ACwX96vNn1djFMCmyE3djCrwXqsxV34l9q51SE9zTalTwcCkQPus9O
         7wRUJ/ix5ve3uOY/dmtj9XkkiEYp84HF1F6eK3MVKPui6yOw8Vco614ZRTA8X12gCTSA
         nm8GOq9lalF/LyifrRJ6Fz7yVoNwSPzDyxzvyPjGcMAObmRxwdpJrB6yQSDFoXpDdiU7
         02VA==
X-Gm-Message-State: AOJu0YwyPBR8ORP7KwbIzoj6j6OBkjNcJoRmrjAg7Jgvf9O6Zaug9pZO
	HIjSrriPOXtinNTFDNm8UEz15k+rzFXnhbNBGSJ70AgTH0k2L0nnzR5v+tNhh/4k7pMO2gTsmGM
	CVn9GUEX5AaBXPGs5z9ZyrwhUbnkv5UGRsP98U8MKEMd+H0L6M+V1xg1vIg2vT8/AReHJ0nu3
X-Gm-Gg: Acq92OEc148UH2wyCEApMciiZgfFBQ/dgtft3Zk9iXnJ3vyPquVdpqenhwi3XhLLVgg
	b+u+0hauuFQb9bV8+mq/XfVWSBsoVZtEWHXcOakMiJK0r+t7Uyd8s8E+lSZryh/BeAfyI7K/WTE
	f65dTjihTbAdLtfTi/tVBUPjiW9Iy80hktKkAtalH/49sLKP2uqVAwKEaSFoQr+U+obegMF5QZT
	Nvkn3UVO/cVdWB6zKluNVzXGyza6IYnjtJJeZrD5YPqTmEXycSQRE1HkTxIv9LDBV1q+EPALjt6
	kg6i+Gcg51BwOQAU1V8MPYQjSjNgBpfC6FVsNE4xKNAbA49Sfs14ypN6z/18cQAU0pIXjTK+Fdq
	Xe/uJVbzkmIXWdwX5fTFsJBMwFz5UBF3DZ6MI3tv7L658YaR77w==
X-Received: by 2002:a05:622a:15d4:b0:50d:9cfd:b01f with SMTP id d75a77b69052e-516418bd5abmr215903791cf.32.1779098010664;
        Mon, 18 May 2026 02:53:30 -0700 (PDT)
X-Received: by 2002:a05:622a:15d4:b0:50d:9cfd:b01f with SMTP id d75a77b69052e-516418bd5abmr215903491cf.32.1779098010252;
        Mon, 18 May 2026 02:53:30 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm35199301f8f.9.2026.05.18.02.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:53:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 18 May 2026 11:53:18 +0200
Subject: [PATCH 2/3] gpio: aggregator: lock device when calling
 device_is_bound()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-gpio-dev-lock-v1-2-cc4736f3ff0b@oss.qualcomm.com>
References: <20260518-gpio-dev-lock-v1-0-cc4736f3ff0b@oss.qualcomm.com>
In-Reply-To: <20260518-gpio-dev-lock-v1-0-cc4736f3ff0b@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IsyqhCIQYv0OPR+tIPqbdqb9EEg5Xbfzd++Cj033fzQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCuGUQhPnNEQFsUVX9eijr4Zaah5gncfgx8NKX
 SDYmrwEExiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagrhlAAKCRAFnS7L/zaE
 wzlSEAC3E2eVz3eh2jpD1P368j6hmV88vqJFSzH1TEF3TnbuiMrDerG+DSfCd+La5seapPsYbrq
 lKs9InvI0+H56gJHxr3sxCK/DsY7BPZGSFyw2oV4dpVwOwZyDTEWrpLnRRUjd7E6RNsq8c/kKi9
 sEDarDLS7tp2W/0LsednAqflIQgkcb2EARf756edYc73i3uStV3rkZlohx0Bd7Xx8Y8Hfb4Nh5C
 WMed2qjgO3Hut/EMhY3OGq/DfgwJym8foMWtg14AdDsoX8BE3hOM7evXEJHTqijB5qrQ5zipOJ3
 hDLDXIOxJtitSQXXolI+pzrx9fGTJ+dt4MF/lYP5WP4MKsxEYQz/V6z+I1l2Z/p0BEhKYLpg0px
 VnACTDAEng+/bPKCOC20Qi3w72y5yBUdAZ11gPKpsoSFCtVojYK0d6kCQTc6clC+u9KF0Xbtq3v
 gp8KUpXPCq/hDc7vtCTpqXINfLZMVMn+oKm+ny1FNnbrEA7hixk+Uk5/94/7kFiwrPcvr/15QV7
 UQtTsNOuhCKbMdBFYktAz4Xd6Zzz1ylICoVfmgvNmLKl/gAUEHdunAaGKolqyfQ4s4N2kNWn/vc
 sJVrzGRkkvukES1Be7mpdipkk2GIv47tUDI9iZFFM7qPnoqOXb/gak5Qej3MrJ0rLvTILpSu8HV
 9IgQ2u2Q37hCOsg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5NSBTYWx0ZWRfXyeLCjmjLASEY
 vVLVemBoHBJZkp4NnPP86OePZCrXLRvxI05nkyqGdnmZjg5YQUVMX5MXSTilByx/cGI64aVlep7
 f/czs891gVB1S8Vcg8TvaGP/ln1QaEWWrt+5mFfx8pfSi3PPBwqFXqat9FDZMQVsvoHJ4H+57ZC
 NsPRtZ+uXG93qF1PLZyrd7UayjyUEmyS6L4z95MZKMx3r8wxEVn609P6F4SvamKqFPTLdmt8bxM
 SfiU4dl7CQ21epWD4ZeUUWaJf8zIkB9ZBfWhQSO7K5qsA63WcHv1EyKTMyt/SvnIgAfLFYOwN/M
 8k0IIHpPai4wYlwRACSuV+6SlNhb2X/fyHfNgftxCVuuKfdxFR4ica1X9f9kSAa660s8kmFFEl3
 qri/9J0KPRBTdNvXe0hfYdEM8nrSkk0We+pWxg1Zzhhv/k821zf6u+8Gw1AeWU053fP0Q8UxPYl
 Lt9DVqkRK6k2qVVBuFA==
X-Authority-Analysis: v=2.4 cv=Bq+tB4X5 c=1 sm=1 tr=0 ts=6a0ae19b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2JntzmVzRHTdE25HVRcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 9YKr5wcwxNTN4eZXRXxxEin8mTvdZnp7
X-Proofpoint-ORIG-GUID: 9YKr5wcwxNTN4eZXRXxxEin8mTvdZnp7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180095
X-Rspamd-Queue-Id: 0B71956A3A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37045-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The kerneldoc for device_is_bound() says it must be called with the
device lock taken. Add missing synchronization to this driver.

Fixes: 3a27f40b4570 ("gpio: aggregator: stop using dev-sync-probe")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-aggregator.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 5915209e1e2168b0932de4d16aff38074b889c2b..3dbccb14216f8450ac0f68abaab693e52b9d1bf4 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -968,9 +968,12 @@ static int gpio_aggregator_activate(struct gpio_aggregator *aggr)
 	}
 
 	wait_for_device_probe();
-	if (!device_is_bound(&pdev->dev)) {
-		ret = -ENXIO;
-		goto err_unregister_pdev;
+
+	scoped_guard(device, &pdev->dev) {
+		if (!device_is_bound(&pdev->dev)) {
+			ret = -ENXIO;
+			goto err_unregister_pdev;
+		}
 	}
 
 	aggr->pdev = pdev;

-- 
2.47.3



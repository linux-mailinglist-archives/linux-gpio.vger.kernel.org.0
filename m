Return-Path: <linux-gpio+bounces-35058-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D+9IrHt2mmy7AgAu9opvQ
	(envelope-from <linux-gpio+bounces-35058-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 02:56:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F34963E2405
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 02:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6D7B301D6AE
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 00:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974B629D294;
	Sun, 12 Apr 2026 00:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/dTcW4e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3tIRTyE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCE6262D0B
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 00:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775955367; cv=none; b=dBEZ8GCMN680MZa3LZ3GSkaTc+yTNH55ehsuH/qFP/rskBxuXEYDFb0TpMWkPCXqWQXJlHKtS85LCH6Q9idr/HTf0Q2N9aUcGWXUaFne5z2OmB+oKIPFUYSt+xIucd2qzO3Gi7JA60ZtRcWM+t15tlubaTOfnX7D7kvk96nD6d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775955367; c=relaxed/simple;
	bh=yMIm69GvAokgqD9AWYc8TnfCXV1g0OPwrwxdmUnvty4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uyp3ujNqjh2G7WUyg56u6ZlIgm426AJ7KsvxtEFeRsRLmIdpDsRAtA7+b5X6t3cc/NtowuG0LgdPYxp5nS6Zi+m+HH5/MUYuLURZlKObyR5z9Siod33zfJ58wImx4GWnJpCuu5DSfvUQlMTJSSacoy1Mz+4rtuMp9eY56Ni3R8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/dTcW4e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3tIRTyE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63C0e3wk1035729
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 00:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJuL2zAsm/mRJ/D1VYU3rw82pVVk6vC6Tovx7zEwBXA=; b=M/dTcW4eqMV9UT5J
	neJpe+CIbzgS6vWRohc8c3boDooB6Swyb2uCUFaoaDlPgN+f0NvNLBICPgxziU5u
	eINzJorwj1P8C+l/jdj+G1+qJV1dJ0Rv/zTCscUBcGXKQTKRL3kAGIk2LmqljzLO
	d0izi5qCx/zSvFlLkVHRrVQxfuyCPwt6RVHDqEUxrEsQL+2ympsqaBSoG3u7iixf
	WpNgAgaras8qehSb2J9mUUv0n304Rzh/5t6k1RTTHMSYrae8Kbvcvs692WO88xdc
	iNOKF55F/6oLtTkEjQLG1vLIha7Of+V7+l2KtqWAvnUd/c7UnGD6/lFrajC1iE7e
	wakOZA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexcskmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 00:56:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d92f8408cso3707740a91.3
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 17:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775955364; x=1776560164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJuL2zAsm/mRJ/D1VYU3rw82pVVk6vC6Tovx7zEwBXA=;
        b=g3tIRTyEOjr0JsbxSobq+VuHm5/QSP1H9xH6wZ6JBihldQivRj/k9XeINWpI/3rYDh
         JKIVIO9s2fOcOrdCfHkm12nV2iP5gJ7bAGhI5Wjr+8Y7e7K+o+o4cN6CCCaZVPyY1XyI
         vCX21nftJQVUQ0PPV3n14eoCBFL1hgje72/ijTGl6KrBJDMVQaExA5kXR9J866OdUPMf
         0Ae4YoSk3EmItVEyvNcq2eMSK55aZXy2KX8oe8RGX7eWcgicpEem15DLa5/s3i6AL0iw
         Z7yfuJfDJm9DBspL6ZVPb+VQ3ByLt6T/1k8MJ95IH/KXW6xnZDhXi52r/eena4k6zTbj
         /4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775955364; x=1776560164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJuL2zAsm/mRJ/D1VYU3rw82pVVk6vC6Tovx7zEwBXA=;
        b=lha7Xzb7IHuT5LgF69Mj/sfp0hwnn/IpEmyRHkLx3mx50zbOyQnQ0bnmAXp8p/gdRy
         QfTbGMbNPcVp21c5QRUBGkB/zgo3hop1X4MJubDIZeHKDTRGWp2IILnprpyjzsKM6IxI
         wu6SLpU9f/DdIMtGkWFsnawNv6vv6pXKR+stqTa3p/6useBDAS0aYmwE+7zyFypcz/6g
         qLwlNnSfJPQkAPJ1UvD/7jLUr+wyEfDpc3WdsBj1fxTFru1oBLrC0/JMuI3LQpa0wNtQ
         tM1o5kjdKspO0CONe4K0BQDdi4ytdrTKUGN8gX1N/gr1j5/E4gQSf3OKq1YtpnwLO6Pl
         opoA==
X-Forwarded-Encrypted: i=1; AFNElJ/EGS9NRt6S2bQReHbDvkn1haHkO2Kp6U4J4NaP8CKGju3T7rjoEj84gZwU9nhGC/qnmZ8khvsDrWLn@vger.kernel.org
X-Gm-Message-State: AOJu0YxQl1mMXGWWvTnPG5ZLwBRj8mOEdKSVzfQlzf+H9U2ZEQS47s3U
	yfix5P0cytb0RJTAwVwwETmCZOWHZ4qBmNOX4+XcTMbu617IT3iufv/foJLUt5KTVO+eXmN1YpU
	ygK+4X0bcQhxzdrFq3yMRbetdkXOklIkS7PaWVeG+ZvU//+NADyhANb9MbyIPFqJJ
X-Gm-Gg: AeBDieuOn/yuFTot4ACLwSJD7ZA8ua/pLPH5i2Hh/i5lJpg6sF2bTbFfbvYxZXHEd+9
	C5i8Epex/h1EKVndgEqAajTN52Cv4RZKoZPWnwBfW4YnCxBR8ba7Qkkq9COpc77JbRzOtk4rWh3
	bbmNP6c9Ihx2YQJH2fOiqvPm00SZ0kEsG6HNVnULShmY3idzXANycY9WadSk9t7Fc4VbCKL9VQ+
	p0aT4bAEACvCvqiAwoLr2oWzCwHhsra+q/XFLdlOXigpHIk//9sH4mDdr7xlNfw1w8tIe9h3tF1
	UgMNgYhdp88tMriOnkXQDEObfa0y+v4/YzcoQWwF3DGimGVF1Cuyzn8UBolaSVReBaz1Gl1P+F9
	889apmKF9eS+gKVcym6BU9v3VbnjNq+Zki+s1Wx7+MTXm9xaj+72KBHojCrmWT1Gf4pA9v+vLqF
	Knk7k2/UNwAw==
X-Received: by 2002:a17:90b:538c:b0:35b:9896:cbcd with SMTP id 98e67ed59e1d1-35e42854dfemr8109821a91.27.1775955363634;
        Sat, 11 Apr 2026 17:56:03 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:35b:9896:cbcd with SMTP id 98e67ed59e1d1-35e42854dfemr8109804a91.27.1775955363114;
        Sat, 11 Apr 2026 17:56:03 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e42e8fc1asm3241796a91.5.2026.04.11.17.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 17:56:02 -0700 (PDT)
Message-ID: <d62614ae-53dd-4925-b185-6834dc8a63ac@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 08:55:55 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/21] drm/panel: jadard-jd9365da-h3: support variable
 DSI configuration
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Riccardo Mereu <r.mereu@arduino.cc>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
 <20260411-waveshare-dsi-touch-v2-12-75cdbeac5156@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-12-75cdbeac5156@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDAwNiBTYWx0ZWRfX++t+J3Nwnjfr
 Ledgr1oJTkHPOHfphMwEWeV7QD07EhGfEPggaC+2BV73YrFikhXZ8Tohnv/p/tDK2IDJiyD2S8s
 wGdN5Y1wh6IWVww6x0C5KpMySrvew/poI8pqlmxuLiyxH09sxc3SR5+Uo7ERAV/N9Ec7mUxWwVy
 8ASOzt1ssAy0vURTvQBUFzqAg8+HQtj7OCHwuHXw5mDL8LTqmEM+UC4g/5BjVDEkXlDNnoAavEA
 eRc9TOg9v4P+gDQBYMKfbYbzL9RLZ0/Ozp17DkIPR9ObS0aoIfB8/Q1gPYkt0uwlL6A4gWDFQS1
 FqbCUIlQyaGKkUPD9BaUp1O8qusCGdV8vsVK/JB4yqs8dXpnBXNg94mZSu0ZSAhwTqGCTn/05o3
 wX/OQm3sI+Pk5iZXb1DIouy/qVE7wOu4BOr6XyYrknLWbsmj2n3e924VWP1ntrM6NaY3DHbSLAA
 jLtnyHhWIwtgMoRXjkw==
X-Proofpoint-GUID: bqkF-AE1mIwgKnsE72FDn7aHBPrb9xUe
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69daeda4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jw4kvcsodkeSSt-x1xwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: bqkF-AE1mIwgKnsE72FDn7aHBPrb9xUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120006
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35058-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arduino.cc:email,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
X-Rspamd-Queue-Id: F34963E2405
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/11/2026 8:10 PM, Dmitry Baryshkov wrote:
> Several panels support attachment either using 4 DSI lanes or just 2. In
> some cases, this requires a different panel mode to fulfill clock
> requirements. Extend the driver to handle such cases by letting the
> panel description to omit lanes specification and parsing number of
> lanes from the DT.
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 32 +++++++++++++++++-------
>   1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 1884ad2404cd..5d9db2e1f28f 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -10,6 +10,7 @@
>   
>   #include <drm/drm_mipi_dsi.h>
>   #include <drm/drm_modes.h>
> +#include <drm/drm_of.h>
>   #include <drm/drm_panel.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
> @@ -23,7 +24,8 @@
>   struct jadard;
>   
>   struct jadard_panel_desc {
> -	const struct drm_display_mode mode;
> +	const struct drm_display_mode *mode_4ln;
> +	const struct drm_display_mode *mode_2ln;
>   	unsigned int lanes;
>   	enum mipi_dsi_pixel_format format;
>   	int (*init)(struct jadard *jadard);
> @@ -57,7 +59,10 @@ static void jadard_enable_standard_cmds(struct mipi_dsi_multi_context *dsi_ctx)
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe1, 0x93);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe2, 0x65);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe3, 0xf8);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x03);
> +	if (dsi_ctx->dsi->lanes == 2)
> +		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x01);
> +	else
> +		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x03);
>   }
>   
>   static inline struct jadard *panel_to_jadard(struct drm_panel *panel)
> @@ -151,7 +156,10 @@ static int jadard_get_modes(struct drm_panel *panel,
>   {
>   	struct jadard *jadard = panel_to_jadard(panel);
>   
> -	return drm_connector_helper_get_modes_fixed(connector, &jadard->desc->mode);
> +	if (jadard->dsi->lanes == 2)

Worth to add a check here:
if (jadard->dsi->lanes == 2 && jadard->desc->mode_2ln)

Some pre-existing panel desc(e.g. radxa_display_8hd_ad002_desc) only set 
mode_4ln, leaving mode_2ln = NULL. So if such a panel attaches to a 
2-lane DSI host, the NULL pointer dereference causes a kernel oops.

Thanks,
Jie

> +		return drm_connector_helper_get_modes_fixed(connector, jadard->desc->mode_2ln);
> +	else
> +		return drm_connector_helper_get_modes_fixed(connector, jadard->desc->mode_4ln);
>   }
>   
>   static enum drm_panel_orientation jadard_panel_get_orientation(struct drm_panel *panel)
> @@ -354,7 +362,7 @@ static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
>   };
>   
>   static const struct jadard_panel_desc radxa_display_8hd_ad002_desc = {
> -	.mode = {
> +	.mode_4ln = &(const struct drm_display_mode) {
>   		.clock		= 70000,
>   
>   		.hdisplay	= 800,
> @@ -586,7 +594,7 @@ static int cz101b4001_init_cmds(struct jadard *jadard)
>   };
>   
>   static const struct jadard_panel_desc cz101b4001_desc = {
> -	.mode = {
> +	.mode_4ln = &(const struct drm_display_mode) {
>   		.clock		= 70000,
>   
>   		.hdisplay	= 800,
> @@ -819,7 +827,7 @@ static int kingdisplay_kd101ne3_init_cmds(struct jadard *jadard)
>   };
>   
>   static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
> -	.mode = {
> +	.mode_4ln = &(const struct drm_display_mode) {
>   		.clock		= (800 + 24 + 24 + 24) * (1280 + 30 + 4 + 8) * 60 / 1000,
>   
>   		.hdisplay	= 800,
> @@ -1070,7 +1078,7 @@ static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
>   };
>   
>   static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
> -	.mode = {
> +	.mode_4ln = &(const struct drm_display_mode) {
>   		.clock		= (800 + 24 + 24 + 24) * (1280 + 30 + 4 + 8) * 60 / 1000,
>   
>   		.hdisplay	= 800,
> @@ -1326,7 +1334,7 @@ static int anbernic_rgds_init_cmds(struct jadard *jadard)
>   };
>   
>   static const struct jadard_panel_desc anbernic_rgds_display_desc = {
> -	.mode = {
> +	.mode_4ln = &(const struct drm_display_mode) {
>   		.clock		= (640 + 260 + 220 + 260) * (480 + 10 + 2 + 16) * 60 / 1000,
>   
>   		.hdisplay	= 640,
> @@ -1562,7 +1570,7 @@ static int taiguan_xti05101_01a_init_cmds(struct jadard *jadard)
>   };
>   
>   static const struct jadard_panel_desc taiguan_xti05101_01a_desc = {
> -	.mode = {
> +	.mode_4ln = &(const struct drm_display_mode) {
>   		.clock		= (800 + 24 + 24 + 24) * (1280 + 30 + 4 + 8) * 60 / 1000,
>   
>   		.hdisplay	= 800,
> @@ -1614,6 +1622,12 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>   
>   	dsi->format = desc->format;
>   	dsi->lanes = desc->lanes;
> +	if (!dsi->lanes) {
> +		dsi->lanes = drm_of_get_data_lanes_count_remote(dsi->dev.of_node, 0, -1, 2, 4);
> +		if (dsi->lanes < 0)
> +			return dsi->lanes;
> +	}
> +	dev_dbg(&dsi->dev, "lanes: %d\n", dsi->lanes);
>   
>   	jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>   	if (IS_ERR(jadard->reset))
> 



Return-Path: <linux-gpio+bounces-35057-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMhAEDft2mmg7AgAu9opvQ
	(envelope-from <linux-gpio+bounces-35057-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 02:54:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3B63E23D7
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 02:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0FA3301982B
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 00:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD2E29B8D0;
	Sun, 12 Apr 2026 00:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EVgzHLsM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gtyJEHUq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBF326A1B9
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 00:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775954682; cv=none; b=cm1L60Fbb/JK0XhfDbWz20WBJRuK3rnOOHnBkcY0U9KBGFLYCd7ZA2b46mlFbTeY+t+UW5fwdgUKMxc6r+9dk4wVrFSOqWy/BM2iepNn1RaXMSaMELTbzxHaBS2v2429L9j07i9PKhzgV7/OmI++3LfdYmoGx2r36difQiI5YNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775954682; c=relaxed/simple;
	bh=L1T0KSOF5Fm1bb4qgkPFHVHyN4UymLL40HJfLcGRufM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rd9EUtXIctG5cutSuIBbA2kmLzRCAaDFrco7I+Fv4fuPCwOcEh6/SoNgW9ktsQ9M/fGfViDuC7YwY7gFlFXl4RTzuoIzkjYhbxb36D4KvgIxXRlvotID0pmcRfaIq195t+30almHOOMxZyxR1O7at2hQz/8Ih+QGSvNZkBpGybw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EVgzHLsM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gtyJEHUq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BKhBAQ2644556
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 00:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oUcmc+2Ei2fVaFQX3mJ3mFtBKVYvWD4maAZTsml9Xhk=; b=EVgzHLsMkL1w4vie
	kjql4uteP484THvM45Yi6af048RJKQ8nT2JjXfsG+iOwauFjdSjwJ/74MrQsjsDk
	KvpDNL4woYK1KaYNszh5JXpMgiEH07AKFw3BFlZ+2/DEr0fXXrDNErAFv1MEhano
	ZIRD6vf+Uioa5nMZaFrDfqBnuGGV1IaeHGnDpmcRvXNGSP69R7jxNhtgNol0bt2p
	xFG/JUgk1S7czwhcrUMVOu8ysYzXCokXvt37RRzRJ47im2LbtswHZ7pptpkSKyu8
	2Q7/LZzZKHaIUCq5PWOHl5fE5UbL9johjLpo13n4AyrHJ65Yy+Mtid2GC3J84xKu
	nywikA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfskbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 00:44:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35641c14663so3571401a91.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 17:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775954679; x=1776559479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUcmc+2Ei2fVaFQX3mJ3mFtBKVYvWD4maAZTsml9Xhk=;
        b=gtyJEHUqTr/i5mHIMUl8hlG+GAKmIAscVQo0dd71VljiLN2PigXjqfZKAncwn3MJnb
         ToowHscocYAMbdaY+JTERXPHdQ5tAAZ15YT+rOgv6S1LQe6HdfynoCe/dyIvTCOSUjkP
         W4G+mW1XkDQpRiaiiXLe64HFWrIPwq3bi9ndEaam4ioqkFlDDfm9GokC7mndZLfcnBNP
         wFQ9oWtH04dd4j3yYAeYI0JsQCmxIUH1y0c1whQ1k+FOPfaNTLo2W6N0jEjXdWICRwKc
         RMhkoEJtySw4NJkcd4iLZYZcVQBAIGiglyB2z2I3xyFs1zxtsuJlijD9XUuoOQbWpXUS
         fXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775954679; x=1776559479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUcmc+2Ei2fVaFQX3mJ3mFtBKVYvWD4maAZTsml9Xhk=;
        b=oDMlLMoPQFog9aBAyBylsOzskMTZdX8h/ALX3clsf+qRWsYn6B8t0gqkROrASS0N2R
         3LVjmlamDvDNoonq0DzXGD+QZuYY/9jh0xMxNKzZu861t1F/x8j1SIGwHobtt/KJbETi
         VOWYRQtH2Kep80AYvSfJy0lMJbF8p4Qx0IGkzOx6UdAA8YcOYvDDvUGj9ACTRlJFbOL8
         4XnpmQ1o2rhUDUQ9wYO83LfF8bkatRnZsEIWq96Tf2cpOO2s1QKhk+f5OvOCFLtTkNnf
         SJXDKHwyJRV6012rousC6pNcXoW66dmdI/JeeTK+KXLOKje73cC5ZXnHuC/2X8P4r34i
         wD3A==
X-Forwarded-Encrypted: i=1; AFNElJ97QWAysRrYjnlIB+sKC34AjXyst46dmb3G6qowC7BK/gFreXpM/TuewoLe411iGxT8g7ngqtuwIflG@vger.kernel.org
X-Gm-Message-State: AOJu0YwQwZCijTf/KrrYd4TAEKHxUvOQIhLUL9FBvi3cBQQ1A9iu2EsW
	giquPMqvLRfleeyOKHJuamoJpdICumbFD7ZrUUoO0JNYUkRYi3e1/vBybW1opYtxA0EyEhcSPd8
	CeQ1RTXVG0e7w8xOm7AAWSs124cgJywQHsde5Ykh8pkTP1sSSgN2T0x4NVASoWi0U
X-Gm-Gg: AeBDiesuIUL1DFPN/0FX33rEwigmbEtDXWjIksgAVwsLMZw0WeDzBM00WrB0yQXrJXu
	WJGtmWwdSC0mTxEecsT17ZGaldurFq0KCyccn6Lm3aA61aP9UEld1Ws7WQry0zClq8oQHKY3bZj
	DMI/08UutTOWtgk0L7HaEySMa9NfUSuUm+frarU7dG/bSOPbYeorI1gck8HuCWCynUe6pXreudX
	okVe7FWYwjUVeS/OZV06To/pMQ9ZgiNbvsmSH3zL2UWESqFcru/q0ns8x8M8TzO2XWLKoTIhN3D
	aNdHbHMa1FaMe5C4dENeYRuwJufFlyQikd5MfzL6MHP6Bn4oJ5RLAzGKmosYLZ+Mk5nLrZ5rg2i
	1xJnrGuOOa70LPZ2ZMiQDLGrr6z5JKdlrWLzWXGebNubT4eI+W/MRRSls4fmAM38O0sGlc+MyHv
	Y//DvvLN/SNg==
X-Received: by 2002:a17:90b:2e49:b0:359:855f:ff96 with SMTP id 98e67ed59e1d1-35e42846f87mr7914824a91.17.1775954678923;
        Sat, 11 Apr 2026 17:44:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2e49:b0:359:855f:ff96 with SMTP id 98e67ed59e1d1-35e42846f87mr7914796a91.17.1775954678438;
        Sat, 11 Apr 2026 17:44:38 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e41355470sm7751367a91.17.2026.04.11.17.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 17:44:37 -0700 (PDT)
Message-ID: <85a1c43e-7cf9-44db-903e-4a0dd73e3447@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 08:44:29 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] dt-bindings: dipslay/panel: describe panels
 using Focaltech OTA7290B
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
 <20260411-waveshare-dsi-touch-v2-5-75cdbeac5156@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-5-75cdbeac5156@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: is6YZhdNIbxcKK57dm3sJgSiWLDDC9iJ
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69daeaf7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=XmleDvvGYaDDAQC-lZAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: is6YZhdNIbxcKK57dm3sJgSiWLDDC9iJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDAwMyBTYWx0ZWRfX2rA3Mvglx5Hg
 faEGxX+9531B58MRkq2fR3eKEqaL5Z5L1PJeOrQrBSamtioKNufS8Fofx5nSqrnFh1U+WrOGzF4
 zsfNEu6ETpPUTpLeRtQKM88woMgw++ql7bJ+tzqZLw0Plw6isMNNiWFFyMuLfWlGdyGKvqAbIhc
 ex7QRFNkSik0Tby1AkZuCQe3KDPlku7hTEUKyGeW7vaEpIZM6Ab79THz/2yGweP7JD0mlf3zI8S
 Wfh4up09efPg9rcUaGKZ/QWKINTi8Lwju3+d+r3FckiCBmYgIpFxz583caOf5V7J7jd/5d+TV4l
 +E0DWUMAxtnvCJbSdB3QYNkpQtToK/n9oMjP9cdvU6GFTjPDaSKxUIzQ0pTHh0j6qEUXFNtS1Zm
 DT2OS77EN7NITpKU5bGAorhFUlZmq4BztI2wAUA6HGP6a2ERE0kMGiK/+xoyrU61aVScbfvp3xW
 PqsVih4m0pCmozTOqVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120003
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35057-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[23];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.663];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC3B63E23D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/11/2026 8:10 PM, Dmitry Baryshkov wrote:
> Add schema for the panels using Focaltech OTA7290B controller. For now
> there is only one such panel, from the Waveshare 8.8 DSI TOUCH-A kit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   .../bindings/display/panel/focaltech,ota7290b.yaml | 70 ++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml b/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml
> new file mode 100644
> index 000000000000..f2f6e254b7de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/focaltech,ota7290b.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Focaltech OTA7290B DSI panels
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: waveshare,8.88-dsi-touch-a

mismatch with the compatible in the example.

> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: supply regulator for VDD, usually 3.3V
> +
> +  vdda-supply:
> +    description: supply regulator for VDDA, 7-10V
> +
> +  vcc-supply:
> +    description: supply regulator for VCCIO, usually 1.5V
> +
> +  reset-gpios: true
> +  backlight: true
> +  rotation: true
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - vccio-supply

defined as vcc-supply in property block.

Thanks,
Jie

> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "waveshare,8.8-dsi-touch-a";
> +            reg = <0>;
> +            vdd-supply = <&vdd>;
> +            vccio-supply = <&vccio>;
> +            reset-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
> +            backlight = <&backlight>;
> +
> +            port {
> +                endpoint {
> +                    remote-endpoint = <&mipi_out_panel>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> +
> 



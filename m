Return-Path: <linux-gpio+bounces-35099-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPmRHgT63GnXYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35099-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:13:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EBC3ED265
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33F7B307BC9F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723873D6CBC;
	Mon, 13 Apr 2026 14:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fqTYoBAf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPbztA7i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4E33D6496
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089146; cv=none; b=Z/yedbRdxJN1W3c6q1dezTdGC+19fiAitfe1MHm+h1q1yoYTXiDb2BnbjvXyKE6nXnj7wNb7tNKFo/ayrLyYy0vcMrYM0PFhaG4MLH4PQuNdHWf4ieS4Qtdr/f9OA65sMF6iXRRG6++MHQGLBCh+yxYQAnPeZmKaycaaqObyEZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089146; c=relaxed/simple;
	bh=00/cQNg1NYCrw4ioCag9pzQGr6M5HdXkljprZfWJ4u0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=celuHcofEa4XgRWdfnkM1L8eIZzIR2zjWT9APJUsEWlBYi1MccvmUzuw1wwdKpgwyMDxnEcZ/Pjm2cRekUpQRIUIbOmkpvpcoKF+TZwURfA5q5Nn1ql7oQVhR9BnlkPGbsLieqgaEeneN0m/TjhVWm6FkaiCDuVbgbv73d0Z3F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fqTYoBAf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPbztA7i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDwZFK3568224
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UaXfMj4md5QwxeQ+qMkZw/Ldu7dQBBhgDOqaQ8DvWT0=; b=fqTYoBAfrCO/kC+T
	2sPHKpdHTn1liOR+f50HefOGyyeG+tQxh1ytjjA//QPZjsPSeGf44V6uWPC76v/C
	VOJCr1O3f/jt8IjqqTwqUrvno4ZfZPQQl22KdMyikokhCqqoHVyk1Rzx0vIgXxD9
	HCxdAUOWn/ulJP0mwKEEt1Rj8bsMqdwuSRTN59xDQRGnbZBDOGI2w0jduV7FdELL
	YNUhu1QO6Bu6dNK7YAG6rnkpyIrQN2sB/gxAN3tr3vUVSoKw0TdVOOddtVolTQve
	f30/WZlWEGcFHSVCVFQmn6JULooEs+5vb4bolV+kR6wgcR3i2+gEG5DbhttrdFg8
	WZ2YOA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh1uf017e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:41 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-47545742e67so5443610b6e.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089141; x=1776693941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UaXfMj4md5QwxeQ+qMkZw/Ldu7dQBBhgDOqaQ8DvWT0=;
        b=gPbztA7iIBEo5+Zh6xswO5Min/9Bs6qwk/bQzLlWwh5BTCQl71L46UskisSiDjeSui
         wfK32vXUWPf+dcrBGJjmSgiWPC1LcnHJAn/Mqnmd0Pc36U/Il8RfLc8OdtUvZPB7rTjT
         ZhmnzXsUnvOGlxnchxvZIXvon2/a5lZbMgMqKQPBSl7HFNYjD07q9N71xDcxu0sbsk2F
         dd/gohvrXwaL+GDi43h8VlzxnooP4j2NLqycm3hjNZlq+tNPjHEsLtoK5qxF7D9MBbGT
         SvC/I+D/wWBWwcHHAvUO1/1VpuvgCIbCTzUxZuEk5aAC7vFW0K0cF1BQ2QtehG+syLf6
         +ePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089141; x=1776693941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UaXfMj4md5QwxeQ+qMkZw/Ldu7dQBBhgDOqaQ8DvWT0=;
        b=ayxoD2OfzmTwO9QWY328YW3RFGjyhptQXAHMHxFkodvyse7x/od8k81GQ89JfrDAUx
         xmeKnJCktNCHiuDDEhoHc6sZEQ0DQD4AJfvS0e4JNLTGodO6rokZAauoR43LlsUMPtBq
         coArVvDusLl+E4/xmWQGziLDG5JIfhK+xK1AtyoWbKHy9+Hl8iBuTFSkULObF+DguRDs
         DIYiACdoJZPwhHZfQbWOrDhuErDWX701VxuttdiadQ8toBaWaIXCyCRdD+gKagU8XqXj
         oddjIZZv0sIt/5n1LE0h+SOH4VFlEMHrSfJ+Nhju9FzJri5wJHgXE19m7AOjIXNZP2uQ
         zEiw==
X-Forwarded-Encrypted: i=1; AFNElJ/wqu6ZgJ2GzlfbO2N4mTRmjyFD1boEH55vQ/TL+8gMxKBQxENvcyxe38vuK8IsB1vljOnLrYfYYQYk@vger.kernel.org
X-Gm-Message-State: AOJu0Yys12fZ+71d/30U5M3N3cedvIM0paDJQhyasF0B9nnRbES5YqLw
	bUWj8HZ6ZHzrJmFpkIGlaq5ujmOGI1MZKTIPvxyNTdmxw9ruWLSxBj4DtpLOHl3j9CnWajfGK8o
	ofdghr0juCNgG1nNc8yMTtQ4aGOxjmyR2ys7bQ+Uc8SiMQjq9wcq1IOIZ3M/dcQUq
X-Gm-Gg: AeBDievUIS4Isq+jek8LiYeu6qoAClaQMR3h0w2JX7MvJ8LjGufGErPpI2GpRFcmln5
	IDRwplvwegZEOP5WvhFkr8gZOcOZlrAF7ycoki+0D1BwS4Ak4QS5JaxQu3dcw5sLyqhYIBwKnvL
	sMLnBHQupH9o3CIjjsvJ4JAnqE/EFQFspS+gUE7aXdZuOT/wIishpCn6x73S2YDgvcUbjJJfYtB
	eP9z/kRRx5HTNfaen3LzLH0QURAWtfgUPmHzu6Xsjf3dERiOKOovU6wCtAqxXP2bBNtGwsugLLW
	ymbRDXPhSiTtz60pTH4afoS6UJ2mKYL4VRAf0759L6MBWtnE8UNwvvGlQflO6xLheOMAI479XnC
	+c12VnNzkmNYT3mAQqPSS/CSbS8HlO57aFP1E8qoNekls0vPqomO9b4x48K+HFcocyWayt9js/C
	tv92gyXfSnSW6ADsGpm1v8QlIi7RKa36FZwqw=
X-Received: by 2002:a05:6808:d4e:b0:46a:869c:b576 with SMTP id 5614622812f47-4789ca3ab21mr6505422b6e.2.1776089140572;
        Mon, 13 Apr 2026 07:05:40 -0700 (PDT)
X-Received: by 2002:a05:6808:d4e:b0:46a:869c:b576 with SMTP id 5614622812f47-4789ca3ab21mr6505381b6e.2.1776089139990;
        Mon, 13 Apr 2026 07:05:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:27 +0300
Subject: [PATCH v3 04/21] dt-bindings: display/panel: ilitek,ili9881c:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-4-3aeb53022c32@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=00/cQNg1NYCrw4ioCag9pzQGr6M5HdXkljprZfWJ4u0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3PgmUY5/lkbIsI3ImbSCzEdVXTJ6SyLZWm/sl
 kgSU5YFD5SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4JgAKCRCLPIo+Aiko
 1UmKB/9oh53+0taG5F7WFFssDhI8P/ajRU3jHUFKe/0QWQ1xCvogfD4lBbnhtzCbZtEQNEHZ6qU
 4YH/Ywyj5vAvhqTFlanRszfGz5/eKmMHgNKn4fG7ox1IydJePfCpM4D2Y6GI5Xtc5WLvB460wz1
 YzSWjmg1YYY727QYauPvtJ4tMl9EHHgEfqr+LD66JpNnEWCSO8iBiBTWZCKMNU13/sq9xk5G+17
 98e9k3xhcSFI6zHbIihy4OIH9AVniH53PyqX4TDFfX2mlYrUT4KTfDZI6XEeI4/YfHkoJXiVi73
 YjTimH9uIqH5Dmp05lXDEccBUAYH6XsE3bNOSF4MJUvvCB1K
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Dc4nbPtW c=1 sm=1 tr=0 ts=69dcf835 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=sGmTDZJufn-iKI-mlscA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: an5zgOxGicDav0sEqj3jxmCr4It3vyVa
X-Proofpoint-GUID: an5zgOxGicDav0sEqj3jxmCr4It3vyVa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzNyBTYWx0ZWRfX7x5buW+sffjF
 bjLX391F4ZA91XCNEMkPhDrwbXjjz0zKivqqxVxQlyoL4XfPGgtpzCUKiVcQ4PWdrHXwlH4LxQa
 S0K9Q6WNLFSVg6CzIo4NSQGwnQsXn4IV77eCjtTFeuqVEUdTQsIbVbEJb2IqNsIDTy6L8NEESY/
 Lo4a0wHrxpqVVLdt4lP/I8Lzn35LE4RxzkWOBwfmBLNVed+xrPJr3iokZEoHwIPrqGX8MPvC8HY
 RUwDnMWJFnBZhftEoGuwT7cOmY1SE2nrWMc39F+DCGYGsy6cQJVtY/IoA6zgtdwt2mBgcRibOtm
 z8aAi6lczAw9w9fIrxM13GUpxlXTJTogYXRfzqMUWu5tGQJYYHGlStpnN+3tgtjWiYdYvd/zI/p
 33V2HpTU26H4GHWv/jk21ViVUQuJRz0WTepYrExgCbUBHSkofQRW42UVlUVMxJIZ0IXVRkS9wc6
 72SaHa/Mq6H8xabgAxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130137
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35099-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: A1EBC3ED265
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe Waveshare 7" DSI panel which uses ILI9881 as a panel
controller. This panel requires two voltags supplies, so add separate
iovcc supply.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index d979701a00a8..42e35986fbf6 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -24,6 +24,7 @@ properties:
           - raspberrypi,dsi-7inch
           - startek,kd050hdfia020
           - tdo,tl050hdv35
+          - waveshare,7.0-dsi-touch-a
           - wanchanglong,w552946aaa
           - wanchanglong,w552946aba
       - const: ilitek,ili9881c
@@ -34,6 +35,7 @@ properties:
   backlight: true
   port: true
   power-supply: true
+  iovcc-supply: true
   reset-gpios: true
   rotation: true
 

-- 
2.47.3



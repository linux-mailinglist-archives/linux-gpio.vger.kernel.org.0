Return-Path: <linux-gpio+bounces-35102-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SErHFI743GnLYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35102-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:07:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6953ED04E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA7C23013B8C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E136D3CBE7F;
	Mon, 13 Apr 2026 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="efTQyhD5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDTevl2H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F261D3D6CDD
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089154; cv=none; b=ezuDCBaoytPZFg6bPI4Q33+6lP80Rt36P/55YXX2Y1B8W0ebxhVtDHaHu81Jc/2Io9P6IqhyhBhEz9eGc82ChnKq5I5/seCu+8Ge01N7FIrT2sEUsvPR8Wbk3fc/RUDvAQPCGcwKjp7vwx/WXzOTHxIzPYAz3VHumVlJceqZ5yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089154; c=relaxed/simple;
	bh=i3q+ZnanPV6G/1cXFp+xLd7TApeXEUOIHGf51LyJVuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NFM7v9OFqTjO/ouj8t+ha6iYni1GNa5ZMwT35Zzc+m/Fpxj55/ly9nDxSVRTG4tNel/BQjM6om29xlXHfe40h+hW4q57u5B+Yk4iFJfZVdFz0Jye9L8dqZD1EovrYI2j8c7Gmz7lko6Fp7Et49CdeV4MjXVfj9Fdv8tTDj+ieXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=efTQyhD5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDTevl2H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DCeuvr440447
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W391/07ZMOVK4atGULPN5+Bm76UZpkvj4qbP9sDT2Og=; b=efTQyhD5LC2sdgBu
	SRzcsRyKiLVWJomECs6EFn+jRUAjHayuImqelEGo2Si/t5ePLG2o391D7UU2HPal
	z57EcS7T6Jk6zEwOlX280BLvHtjreoLWIcDDynF/hac1alrbYVTonVBcZIMn+Axj
	Hkbj1NkZIIN2V02LbdVFGp6B4dq7fYswTAd/a2R47yfprCxOFNi9XoGavTNueUtC
	TU0+52Y6y6ALL1Y1M9j+bUBJq40n5J9QfPH+8JwQ18EyYzFFnfZGJ95SIiy2L3Kl
	FA9rmv+h3KeQkMCSuc1rWFVCG6qYyF97iX5RxMJEG76RoIrDn8+LWH1RakHsWtWB
	tBEmVg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtnqt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:47 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-467e00b684eso2791828b6e.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089147; x=1776693947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W391/07ZMOVK4atGULPN5+Bm76UZpkvj4qbP9sDT2Og=;
        b=PDTevl2Hw3dBANXW6HOEBkNgEsqNdc5o2YeOsXSAoxtP0ArGXJZ95jnZxicaALLk64
         DF8ARz8tPRZbykvo5doH3wiPLUGvrRuKhsy6kGIEKFTPFyyIICq2RDsJ87Zqttxm0fJ3
         CK/68z5rg8k8cp4TTbKqvMGOGA26SoHsO5wL50esxEtvQGQhoBom7D87T8oymnkP+ayX
         CTjk1HaqcK7as3/QSAShKSC0Vc23fASVYcwFXy/VxGwYKWmawalid7jIIwy5Sb9jYk5j
         6bFTbgl00hr7GR961bEPG5o/codhqd1wP7bN5s5sGvqriE32DoETAA+WKFJV3irLmIXR
         lUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089147; x=1776693947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W391/07ZMOVK4atGULPN5+Bm76UZpkvj4qbP9sDT2Og=;
        b=N3P8cupK8yn3lgSCo78xhm0gRJ5HdH3i37kJz5n4PNIXcotPQcarK4fDj/ssTR7FIL
         0QSZcDcN+UeJMhtwuVFZhrSmNar2XnalOS9Hm0SLr44vKAgjGsWAGtcsJFpNT3w1c9Kd
         +jwfhGHsrHtqOvwRmcyKDhoZ1KZWnswLs+6e2IaZvCptKNVUTv2i/R8Uqp8VwSgEhUug
         2VF0VY9OsRJTD00txQWWpY1YEyp16gHr0LGQa2QCjOywVlkU9CZBR/i0HQgO5ZArDjb3
         r6UAZjT9D1aOzyy0nCinhdgjZV7810uknmq8/N3z8X+k0Yq+HZi+HnDHl8hItLwD8pei
         hh1g==
X-Forwarded-Encrypted: i=1; AFNElJ+yri7QL4y2BxI3oijjsXejj6uJMfnVggb3XiQBznKKbp0qdUaMh6Oeih2+WYRz79u0BR+frjDZrs0i@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv43Ng/qdjkRzAHEHLNQbU+K7hWq749MpXE9Q01APUzw3WDoyd
	5/mm8nsOyIMYK8crm9kBMbPSVZgKWm3aQbATLF9MQ9MRtwJu0EMgro0fy7vLkbuMOEJKpOLf3dO
	LDr0AQNZPMMokXrSYiSb55+wTw6F+ZuoMABayPpIo61al59/4BBnS3oJPW8ng/ePa
X-Gm-Gg: AeBDiesICcNY2AZX3h6NiOWuaozmVoECGlXBZx6g2kusfHBfLe+dLdft2Im0R8pYQd+
	S3RW1y3Do0ZGPv6ZysjesZb584e7PlB/Ra50BvhAON7PEuIse64MKPDRj6LXODBtSMjZxEy7CGq
	rSZSAC3gugxgUy4+5qysVJncH5gyH5w1tTNFu9i8yw03KhivpxJW3BbkmY6QuJup0Qkt0vTBrVL
	wd5DQBKM9BLQeFV56yorNl/hRgk2oiyf7FFqUdjR53npqNMjMOMpKjWrP5FoVoGiQ/qOOW/KzNf
	pNjIJiuMnGmgqx5Rt/jBzjLTOO1DGT+fVPra/lNTCJ8uEkXkib5lLk+ZyNiMYEOhbB1LYO/Unvp
	T+o8cHSO+e5N8LFvwTXlWe323L3LhO8UVFsgQlfIawljiLA7w4KIHB1EvOVnoGCNJ9GoDoesu3+
	Bl0ZOeLLuou/cuxZ/hECYRUMy4qRE7ZGl/0Zk=
X-Received: by 2002:a05:6808:c1b3:b0:466:fed2:54d4 with SMTP id 5614622812f47-4789c64b551mr6917546b6e.10.1776089146940;
        Mon, 13 Apr 2026 07:05:46 -0700 (PDT)
X-Received: by 2002:a05:6808:c1b3:b0:466:fed2:54d4 with SMTP id 5614622812f47-4789c64b551mr6917489b6e.10.1776089146306;
        Mon, 13 Apr 2026 07:05:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:30 +0300
Subject: [PATCH v3 07/21] drm/panel: himax-hx83102: support Waveshare 12.3"
 DSI panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-7-3aeb53022c32@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8981;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i3q+ZnanPV6G/1cXFp+xLd7TApeXEUOIHGf51LyJVuc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3Pgn6QcqRki1UArqfPglemsHM2V8f3Uegiz5m
 4gkvBf9VfaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4JwAKCRCLPIo+Aiko
 1YIqB/9nRIK6DjqVncGwfuEj9cqBCkbiwpsfBWxWpKPXyt3IBdfo6FQvwTrR7UHL4FrduLZvOiD
 tg3suPkynEVn9Qym32atFpvalcbSiGq4uK49fAxGqdSR/Y5cXsIWFyE8tvAJhu//yX7JhTUrMOu
 c520Mngy+IKeSGuHI8Aa+eWzCZSBxxNFh7QQXefEP/g+TFVEzkJ7lu1gcimdKvYV0pbX2vZOUIy
 PYUNaF7JhGjvm2JrnA6SCA6LCScYJtPs+7hsChOSjMnWB/tAqIT3KduxcK092YgKej/APHCcDax
 LZGGe1g8yduo0T7onG1A5r6pBTVw+Vdw05zXcanUOYqwX7gc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dcf83b cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6dGl3bZOZdHCWiLLNVsA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: p9XQbT8VhzeRzYRSfMsgzXXTuJ7aSZx0
X-Proofpoint-ORIG-GUID: p9XQbT8VhzeRzYRSfMsgzXXTuJ7aSZx0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfXzO0r21HYUhfO
 H21tsldONE2CaYUiuxivEdFx3A+c9diE6oKW9i157j1HL32+jxp4+N7qmYXU56fwhUOMZ6d9+1x
 94jLm6JGCOLQzQn4VISG7hPJeuL2dO0TxDYT+h5vBiUBVlX/WIDr+R94r/O1MHcAYnJJGbfJoEO
 zhcaeAuw6zbHKkxLvaat7p7k/RjNYYkzeU9ZKEyQhPXsu2SesdeysvTz1NRrz+AVaZu0XFSim01
 oXJCKxCK56VDRo3AVFgiZDRzkDVBEEGqTQN4dKk6fE0eT8SCFGuhtiCxfORUYXYcYyb44oU+USX
 9l79HxP2d+/i8ZfGNkz10i/4q6cqEGIQdIWOzjLSYFXl28C43U4PtdP0phDZCpAgNo+uI3ooyBN
 W6WCbhTFM1SOoyWwCnheRedztF/GrxXugs6qDmUTytqfpQglV/tCAC7dKH4cqY+htk/xO5oqwSz
 65ulh4wqOLP7QXGzSOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130138
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35102-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
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
X-Rspamd-Queue-Id: DE6953ED04E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the Waveshare 12.3" DSI TOUCH-A panel. According to the
vendor driver, it uses different mode_flags, so let the panel
descriptions override driver-wide defaults.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 144 +++++++++++++++++++++++++++-
 1 file changed, 142 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 8b2a68ee851e..eab67893da86 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -29,11 +29,14 @@
 #define HX83102_UNKNOWN_B8	0xb8
 #define HX83102_SETEXTC		0xb9
 #define HX83102_SETMIPI		0xba
+#define HX83102_UNKNOWN_BB	0xbb
 #define HX83102_SETVDC		0xbc
 #define HX83102_SETBANK		0xbd
 #define HX83102_UNKNOWN_BE	0xbe
 #define HX83102_SETPTBA		0xbf
 #define HX83102_SETSTBA		0xc0
+#define HX83102_UNKNOWN_C2	0xc2
+#define HX83102_UNKNOWN_C6	0xc6
 #define HX83102_SETTCON		0xc7
 #define HX83102_SETRAMDMY	0xc8
 #define HX83102_SETPWM		0xc9
@@ -78,6 +81,7 @@ struct hx83102_panel_desc {
 	} size;
 
 	bool has_backlight;
+	unsigned long mode_flags;
 
 	int (*init)(struct hx83102 *ctx);
 };
@@ -765,6 +769,111 @@ static int holitech_htf065h045_init(struct hx83102 *ctx)
 	return dsi_ctx.accum_err;
 }
 
+/* This is HX83102-E, assuming commands are the same as the normal HX83102 */
+static int waveshare_12_3_a_init(struct hx83102 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETEXTC, 0x83, 0x10, 0x2e);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BB, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x67, 0x2c, 0xff, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BE, 0x11, 0x96, 0x89);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D9, 0x04, 0x03, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER,
+				     0x10, 0xfa, 0xaf, 0xaf, 0x33, 0x33, 0xb1, 0x4d, 0x2f, 0x36,
+				     0x36, 0x36, 0x36, 0x22, 0x21, 0x15, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP,
+				     0x00, 0xd0, 0x27, 0x80, 0x00, 0x14, 0x40, 0x2c, 0x32, 0x02,
+				     0x00, 0x00, 0x15, 0x20, 0xd7, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC,
+				     0x98, 0xa0, 0x01, 0x01, 0x98, 0xa0, 0x68, 0x50, 0x01, 0xc7,
+				     0x01, 0x58, 0x00, 0xff, 0x00, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_B6, 0x4d, 0x4d, 0xe3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0x85, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x33, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0,
+				     0x00, 0x00, 0x00, 0x00, 0x64, 0x04, 0x00, 0x08, 0x08, 0x27,
+				     0x27, 0x22, 0x2f, 0x15, 0x15, 0x04, 0x04, 0x32, 0x10, 0x13,
+				     0x00, 0x13, 0x32, 0x10, 0x1f, 0x00,
+				     0x02, 0x32, 0x17, 0xfd, 0x00, 0x10, 0x00, 0x00, 0x20,
+				     0x30, 0x01, 0x55, 0x21, 0x38, 0x01, 0x55, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGMA,
+				     0x00, 0x0c, 0x1a, 0x23, 0x2b, 0x4f, 0x64, 0x69, 0x6c, 0x64,
+				     0x77, 0x77, 0x76, 0x80, 0x79, 0x7e, 0x85, 0x9a, 0x97, 0x4d,
+				     0x56, 0x64, 0x70, 0x00, 0x0c, 0x1a, 0x23, 0x2b, 0x4f, 0x64,
+				     0x69, 0x6c, 0x64, 0x77, 0x77, 0x76, 0x80, 0x79, 0x7e, 0x85,
+				     0x9a, 0x97, 0x4d, 0x56, 0x64, 0x76);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x01, 0x9b, 0x01, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK,
+				     0x80, 0x36, 0x12, 0x16, 0xc0, 0x28, 0x40, 0x84, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0,
+				     0x01, 0x00, 0xfc, 0x00, 0x00, 0x11, 0x10, 0x00, 0x0e, 0x00,
+				     0x01);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x4e, 0x00, 0x33, 0x11, 0x33, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xf2, 0x00, 0x02);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSTBA,
+				     0x23, 0x23, 0x22, 0x11, 0xa2, 0x17, 0x00, 0x80, 0x00, 0x00,
+				     0x08, 0x00, 0x63, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_C6, 0xf9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRAMDMY,
+				     0x00, 0x04, 0x04, 0x00, 0x00, 0x82, 0x13, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCASCADE, 0x07, 0x04, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x21, 0x20, 0x21, 0x20,
+				     0x01, 0x00, 0x03, 0x02, 0x05, 0x04, 0x07, 0x06, 0x1a, 0x1a,
+				     0x1a, 0x1a, 0x9a, 0x9a, 0x9a, 0x9a, 0x18, 0x18, 0x18, 0x18,
+				     0x21, 0x20, 0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP2,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x20, 0x21, 0x20, 0x21,
+				     0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x1a, 0x1a,
+				     0x1a, 0x1a, 0x1a, 0x1a, 0x1a, 0x1a, 0x18, 0x18, 0x18, 0x18,
+				     0x20, 0x21, 0x20, 0x21, 0x98, 0x98, 0x98, 0x98, 0x98, 0x98,
+				     0x98, 0x98, 0x98, 0x98);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1,
+				     0x00, 0x34, 0x01, 0x88, 0x0e, 0xbe, 0x0f);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_C2, 0x43, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x80);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3,
+				     0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
+				     0xaa, 0xaa, 0xaa, 0x80, 0x2a, 0xaa, 0xaa, 0xaa, 0xaa, 0x80,
+				     0x2a, 0xaa, 0xaa, 0xaa);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3,
+				     0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
+				     0xaa, 0xaa);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3,
+				     0xff, 0xff, 0xff, 0xff,
+				     0xff, 0xf0, 0xff, 0xff,
+				     0xff, 0xff, 0xff, 0xf0);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+
+	return dsi_ctx.accum_err;
+};
+
 static const struct drm_display_mode starry_mode = {
 	.clock = 162680,
 	.hdisplay = 1200,
@@ -920,6 +1029,30 @@ static const struct hx83102_panel_desc holitech_htf065h045_desc = {
 	.init = holitech_htf065h045_init,
 };
 
+static const struct drm_display_mode waveshare_12_3_a_mode = {
+	.clock = 95000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 10,
+	.hsync_end = 720 + 10 + 10,
+	.htotal = 720 + 10 + 10 + 12,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 64,
+	.vsync_end = 1920 + 64 + 18,
+	.vtotal = 1920 + 64 + 18 + 4,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct hx83102_panel_desc waveshare_12_3_inch_a_desc = {
+	.modes = &waveshare_12_3_a_mode,
+	.size = {
+		.width_mm = 109,
+		.height_mm = 292,
+	},
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.init = waveshare_12_3_a_init,
+};
+
 static int hx83102_enable(struct drm_panel *panel)
 {
 	msleep(130);
@@ -1168,8 +1301,12 @@ static int hx83102_probe(struct mipi_dsi_device *dsi)
 	desc = of_device_get_match_data(&dsi->dev);
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-					  MIPI_DSI_MODE_LPM;
+	if (desc->mode_flags)
+		dsi->mode_flags = desc->mode_flags;
+	else
+		dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
+			MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+			MIPI_DSI_MODE_LPM;
 	ctx->desc = desc;
 	ctx->dsi = dsi;
 	ret = hx83102_panel_add(ctx);
@@ -1220,6 +1357,9 @@ static const struct of_device_id hx83102_of_match[] = {
 	{ .compatible = "holitech,htf065h045",
 	  .data = &holitech_htf065h045_desc
 	},
+	{ .compatible = "waveshare,12.3-dsi-touch-a",
+	  .data = &waveshare_12_3_inch_a_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, hx83102_of_match);

-- 
2.47.3



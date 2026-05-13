Return-Path: <linux-gpio+bounces-36768-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ESEGlusBGrIMwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36768-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 18:52:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C16A3537761
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 18:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B4B0302F7F9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13F34D98F6;
	Wed, 13 May 2026 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8KHt1JE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HeBTh80I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE96F472774
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690672; cv=none; b=X17Pj/b87i16EbjWDmf+Mv45wTVmv/ylc/Up4F4F+Z9CLKsA8v56yAvsTkTSbZqXHbkHVnrwtDmOCPgqjoMv7mfqv8MEKNqd8sINi0HvIPlZYcAPDfwM0rLme6bRh2YVSNMVOJsCIHRNkrKlxSJ+Yxh2TXpdcajAZ20FDr7Vm6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690672; c=relaxed/simple;
	bh=b1XEOyYfA71ulQFPRY4KVUwTd8I87LzQvOwhzVXsPXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uGhIQFYppe2r8BhE2jVjDFLEHEv3mjgii+pb9t3RGeMCPYXqH3i2egy+ui/Vxm8uHc3XIL8+wZdsttYR+dpYqXVs7n/xPrkD/aOza4Pa0zI5uTipvNa8j4RbvOZXP1WMWtldu+wssIuAaJCAA97ptq6ruFdjxjRjhf8PfpII1yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8KHt1JE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HeBTh80I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF0L7W3474767
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqpHbTw5SrTogkQ6SExJKQySRSNYlZPHGNncVU5RI/Y=; b=C8KHt1JE0kglxy4D
	vqNfiYBPgRn5k5qtEg7Xr6aFGruSU4sdGDOCBqf4i78qfDWAA0bNToyL18FGM7ky
	FEPa20P7r2uCs7vhZJAaF6al91MtG0Oc2IdOah2c86KlWHKFAHOaitfQiOk69anJ
	be43IJEtSroB048evvO37sKIa7ZHNTskDrWESICr1MsaoaCE3Dj0IHflfiyMkJL2
	cOvKqPy6eSAOGrSfu2pj51F29MQvE4AOeR/I8+ZCMW5EAgLpqjCyvHdvweGr04tY
	yZxR7Lqbm35Y/M8Y2JGepKDU7/zl0/eevgeZNNtIFhS9qazYy7Uf4oCevSXZojeT
	hwrjQQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p419vdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ef62078ee7so9261962eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 09:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690669; x=1779295469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqpHbTw5SrTogkQ6SExJKQySRSNYlZPHGNncVU5RI/Y=;
        b=HeBTh80I3nhN3y31XaaZzvyPWOJEhp4zRggAmnVb59MqIvZrb4gjrOQdz3lp16h89c
         JyGumgAUzLyYbDlNMhVIdoE5RUikVawkxATPkLV/GIz1ZzmFPUrWlGI1uN5d87u3247K
         ozNv7RZuikPbruzmZBTEV/CD0MCqNjniDwMempsptBzcfWb9LM5zGefHjs+DmWHGDKLB
         w8qwKAxWkJAXrtSKwW61ygdhtdvaiI0bhZUu6RkrJuD/5vyJLny3utJfbI8Nmb+l2+Aj
         ddSHD67yHb+3bQ8PSSzz1vtI10LZiTPu+dk+9E70phBW54D6K5N+ca6rmv7D+Gjfi4Wq
         OpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690669; x=1779295469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NqpHbTw5SrTogkQ6SExJKQySRSNYlZPHGNncVU5RI/Y=;
        b=FWQZTb+nTNHj/NSqjSWbey0Zaax8WRK7ksrsByD8ZtXFrTvPlBxiVSGIXWhtLs/ja3
         uR6jEz5DtkzvV2+MrQldScOlY370YDL1QMzz/iFgi3Kag7Rf4XgXq4z3Pz9ALueESfi6
         fu9N9c3+c47FigeL3eSYOP55mBRku0DQRtquyd3oThdd3XVvLUg/YY/DcDm2jg6Z2/Gf
         dk4BVISirIV+ZuQcLwp8Qw8wtnaPChs/RjXs5tfDnJWxf7CKp2WiCSlv34xmLr5z+vrW
         hM7Kkg60PPJvUzL4yICGv/Zvb/iwCKz+nEdSz6sqAMVAwFNywHqGJFJvO0Mxm911UliG
         q9gw==
X-Forwarded-Encrypted: i=1; AFNElJ/zYQwxb1muYfBichzQRvEDvUzoocFnUczboynHkWoRultvWzFxgkrI3bZY/rpzdTOtTTFENKweK2/X@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmsc2xwa+OPMSkr/4UMmeG4VM/i0sQQYzMWCtRPGZI0Zspr4w/
	hnq9RCytBEZerT7ZXsDP9gZR9RIbaJXuZ/y/WuvHc8TaNXdByz4pHw1KWXTrQN/gTXdw3iy9J6R
	BVze0bXz71eae9pq6peAxJGD3+AFvhteXEko8azYEucHe24b55LHDNzdXUcbRXIz1
X-Gm-Gg: Acq92OEZM0AvrmNOXJOdVxDYN4M2AiaNRj842WJLw0dyWPEivWq0SqXNRsTZdGOle8T
	VyvJzW1TtNNqPFxXWI1cWiUYPvSGOLyfbibCnoG4Ed5pi+U5eBvX/2SDrCJtD0o+2m4pMMAMEM5
	vCugZnz5CjyKCbPsEJgLvk09UJ2n6KQIucdyvMEcnRkp5VyOAjWQMmLALBgZGkEfyHXI//KzUYz
	QRd4mIzBl6GxT9Dd8QomxCTCUDu2FcOSsmztlaGMK7Sszo07L/X6hapqnVT6XzOhczAbAJDamce
	j5+P6P3hODoFbALzkcVGfkz8GpxLvBhTVKv9UtHVOXfqVkPWpF1E1Mjnt6mpRtLtXd4XU4Gnh8B
	kGOKjsMhAnC6isLPxDm/itn1yRiEsiWyo43Vwcdazai3EBZBmkj514VgeJKeOrz+VimdPhzI=
X-Received: by 2002:a05:7300:a50b:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-3011a369c25mr2262178eec.30.1778690668579;
        Wed, 13 May 2026 09:44:28 -0700 (PDT)
X-Received: by 2002:a05:7300:a50b:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-3011a369c25mr2262156eec.30.1778690668042;
        Wed, 13 May 2026 09:44:28 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:27 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:44:19 -0700
Subject: [PATCH 1/5] powercap: arm_scmi_powercap: Log number of powercap
 domains
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v1-1-00b47b1be009@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690665; l=942;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=b1XEOyYfA71ulQFPRY4KVUwTd8I87LzQvOwhzVXsPXc=;
 b=My5DR7z1/2KIWwHKe0cIBTddjrYizysbTmiPqsKJxVjsb26CE5501wqsIcvFi+92wv43QWc7p
 CdUopfQLwVqBg3dE2T/aTJ84vQpNT7/PK79MNjb/MZXiXtast982sre
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a04aa6d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Bjf1dfg4zo7KOAcPRCoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfX7H4qbPMIxM87
 +UhLGDhNYJmQfQw/ciELH2gMlQxmqmCJ3N2G0vfnNuIEOEyGufC39tbP1b7QZR9T48vf27kmFPB
 F3tmw0TAOnDkz5F+2/cDi27lH5Zy9mY8rpiHtAMrLHblXQsF14Q3Fe8+TDQtU1r3Y1dP+Le9/28
 KCGaiAD7uN7o1gwg6KEMBSi9WwG3OoDfTDNxEM5kAgIi8fm5L268I3KmhiKkim8ZGbHtgxU6jZM
 kHfiofSRekV8BWGbZM22chVqWzgNDi1rTwrSn+Y1VBJSpYnAS0RcHLSnvz385jQaV5N9QcLxo/G
 lgkWKZvm1yxVmPL9YHH2FqGjQMA5BIo45InHtLUpYoBN4cMF0R9lU6uf8EvIthoryeIXtmYkbkI
 LQTH1Eqs5icMCJkoAlM0L7OPkcm1LuPUnDbShoaKa7jex2yeH5rn3BBl0xlVWhpZyBLwl16QzDV
 t/MEf7Ab1l4ioBtMSug==
X-Proofpoint-GUID: zX0W2Ao8jk9Y_fgYr_QU70Zme5tzkgJi
X-Proofpoint-ORIG-GUID: zX0W2Ao8jk9Y_fgYr_QU70Zme5tzkgJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130169
X-Rspamd-Queue-Id: C16A3537761
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-36768-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.tran@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The SCMI powercap driver does not currently report how many powercap
domains were discovered from firmware during probe. This makes it harder
to confirm the firmware exposed powercap resources during debugging.

Log the powercap domain count after a successful probe, aligning the
driver with the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/powercap/arm_scmi_powercap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index ab66e9a3b1e2..48d721385f94 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -496,6 +496,7 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 		return ret;
 
 	dev_set_drvdata(dev, pr);
+	dev_info(dev, "Initialized %d powercap domains\n", pr->num_zones);
 
 	return ret;
 }

-- 
2.43.0



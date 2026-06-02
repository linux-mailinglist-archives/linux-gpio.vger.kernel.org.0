Return-Path: <linux-gpio+bounces-37788-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELeaDDqJHmr0kgkAu9opvQ
	(envelope-from <linux-gpio+bounces-37788-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:41:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D06629D49
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8A9A3016021
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 07:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69DC3B8BDB;
	Tue,  2 Jun 2026 07:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSA9OFzN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OrL0c4lR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF5C3438BA
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 07:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780385874; cv=none; b=me3lKJ5mfYVzJ2Ml1E6Meg1ZB84XfPQXh8sX5yDxudz29c3EnQP26ePbTfcZHGncSZuTJfzfs/DwGnHKuo5+PJTrQeK2IqbUukMFV92qJwvzmJJt7tPMIZqzyAumGOqo6OtbqDF6mnUfVtVtaexNpEN4fqshnep/KJgl7CFS3/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780385874; c=relaxed/simple;
	bh=pOvyL1dM+SB9ZLzn73fhbiaRZmAjWFCROvUsFClROT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2a60BtreuYSu9g2vHWmQTa2W1fTqIupcXKpHZF+huWL3e4a0frC0ehBlfJE6ueuKUrw8pN+Z6CAtU4S1O2bBn7yY1GQEtGHmOQlkbFicbf8VrxMOMiYRSYXQ9bBKI+C1XwvAoBphGq391grsopKmddrBb82NadCkUWv2yNxxYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSA9OFzN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OrL0c4lR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652454uh1937421
	for <linux-gpio@vger.kernel.org>; Tue, 2 Jun 2026 07:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDajmJPsy6CMhHNCXDqlpvjZ0zswp0oz/zcy0OB6Xuk=; b=TSA9OFzNWCoXmgwM
	PeAUGYkCDvYFP8Dl5EuoyFeuSuaMMXe5xS7Az1PpL/knuUPAgnIjadoteNxjoYT5
	HTHE9zGcYXFd5y8+H5aNQRpos27WATOoLDr9U2OM5vTemd+0+z0Slz+SwHd2sSWt
	5dMBTMDLtpXmojZmkdnjj+6a+RssO2dM2rrA4bvA4FRDeO+cMmTxqNheO21EeS9t
	YNyrEZVCYQ1aUJ/2JA4YUV3eqjRjMeBsEigXHws02drNc5XakDcMSHNgN9C5MG/5
	cAL7idLX0oAxRZ6W+EHK1PT+yiunKKIGRENXZoDPf/lrqoQipUQ6YNMZxd4+tiKQ
	n3AkuA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqubgs64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 07:37:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516d4b3f3a1so220428731cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 00:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780385868; x=1780990668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oDajmJPsy6CMhHNCXDqlpvjZ0zswp0oz/zcy0OB6Xuk=;
        b=OrL0c4lR2EIT1i8iAZckca+Ery5KN8kZanNhX7WWj5f8nBIqRESl1Wu1rYaD3uVHdL
         tY42qApJOPg4fUjuAeT4eq5dc49X3V7Liw3kmiy+MZUfETZckm97RE84gQfjVJyM3ejm
         utfRcgDFI5Ajgbeziek9+Zx2ebXgbiRufazDxkA+EK5jM/Rp6TletFAdWrmA6J4QJaB2
         OVn6KoyelNxSxb6JYoCBbfrKZsZ2Gi0rx6mkG0HDCjXVnwWnoWT1x+xVj5zgEpVBaUkV
         qULAX2jU11B3m+w2nLWdAHxuiBh8zeeCwEnTfv5Eu+vZIjfR22BNFBJWdLHWCl0rT3iJ
         SUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385868; x=1780990668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oDajmJPsy6CMhHNCXDqlpvjZ0zswp0oz/zcy0OB6Xuk=;
        b=UnodIuaJ6fe7OErpW6JsuKkNmx6PBdRKJsJ4hlcv4YLeUSKGfQHJPiIdksTp4g+jW/
         7SRajqI7rqJQKf/GrQziKXjC97JDfVuQCnwu03Cj5hw8AKrXeS2CIqmSTOhAinh4XJHL
         FzBleVe/K4npGgxt1RfagiL6ZhTsZ5RdHQb7Ue6/78jVCIEAkVx4rBBBrzErAZYeRO09
         OfcPa3lcUf/d338wJ13M/ejfttkXldMNG0K5iKfjHMQ0otgOLrwISVFWrPbN5uBTRwZD
         E6Chv2FAvlVOvllkdMNIw9iOJMPlXd2KnKCBj0mldLGMJFL5dyVL/erzLZ3lVVqJLFMf
         wZwA==
X-Forwarded-Encrypted: i=1; AFNElJ8cE30uhDML1dFveUPIQL5yRHWyn9AgK6AKlQZIXRmkqGMJxEEKV3+huFfrvZn7dMT5hcBMQcOZh2If@vger.kernel.org
X-Gm-Message-State: AOJu0YwFwQZ2peQBMbXfvh3EirDgVGOzAgIXNvrhaudeUAbwv8dZNWMj
	WlyJa+NTfR7dx/F3PZy52ZN46HGncpPKgzocRgY1WHl0lO5zoNvGHZQsPj3xqAdopWBUbUrGcrY
	YZKWdGg9yEOin4ItnxdpKFVSXTfze8UqVWgcvQjNIr36jLASdZ1k/uZLxxmkH1fjC3VUniV1M
X-Gm-Gg: Acq92OFIfVoUShTuDJQkVN1t+q5X8qZs3cWu791DYodH4SH2weKmtYY8vwNi28ebFUW
	7FltO4a6odaqns831b1NVsx+oeGkt+iz1MdmZ5l0WJeuc8KLm/mpzuzZJca9aPsxpKqWS+mQfnh
	meo1S+uBE+MvQG0HnyJmt8HopchVRo6PmdfSK125KFZY7DCIF/Vp+ADJUQGSLAVwxO7X3OBimC5
	8e85Vi4LV9KjhYTleH7XrsHgbiz3dI5mWTDF0vuvlIiKkUYuER6hYXX81+ydnMbcthANTfRH5pX
	nEjE8nuVj2vT42BEqvzAv/14wwFBF2R61SMM3tGSQ0tv+0gzhKaRFoX4i8ocz6aGyYRD93YS/dl
	PmvCioNO6iy+U06xK/cq0gjy1qUMG01V+wrTemWmSG55T2v9OLyHsZicbF03WhW90jaBrzBDHU+
	KvnjwmYcoffQcH3Q==
X-Received: by 2002:a05:622a:a6da:b0:50e:c093:9051 with SMTP id d75a77b69052e-5173a7a0eb5mr171252191cf.30.1780385868661;
        Tue, 02 Jun 2026 00:37:48 -0700 (PDT)
X-Received: by 2002:a05:622a:a6da:b0:50e:c093:9051 with SMTP id d75a77b69052e-5173a7a0eb5mr171251981cf.30.1780385868184;
        Tue, 02 Jun 2026 00:37:48 -0700 (PDT)
Received: from brgl-qcom.local (2-228-54-83.ip190.fastwebnet.it. [2.228.54.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e20bacsm45994245e9.6.2026.06.02.00.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:37:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 09:37:18 +0200
Subject: [PATCH 7/9] bindings: cxx: drop redundant class qualifier in
 line_request::set_value
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pre-2-3-fixes-v1-7-9432002bce8e@oss.qualcomm.com>
References: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
In-Reply-To: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1081;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pOvyL1dM+SB9ZLzn73fhbiaRZmAjWFCROvUsFClROT0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqHog9US+WTBVq3rYlzSafzRvfwHGm+uSpSPTa3
 XAMjTcnEn2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCah6IPQAKCRAFnS7L/zaE
 w/dVEACYhc/mmBeT0o33CtgFDJMBifnvE9vbei/wh5JY7k7b2FjyhzJDwoT+croMu7VemwNSWK2
 ATNKIKppX4LI4b3bCXsi6b6tXQPTQOAR+RdpRBmaEhNL0j41vMUpG1ZD59LV7Zu/wUAwQJeTU21
 UGDol6IaBYdo4XgkzL4BVmJF3SBHeYe4jHMKeg51NIXxyP+rgbA1mfTpv/cljeGO4vAzhTl7p/u
 +ylbYsRU5Cu92RMJgPacJPCD6AL0wG2kVx8kEWmASekWmK4PFMJ28oo4Ux+34JnY+BhOnC+tBiA
 OgxkyTypdayTtKdzUoGizTdq/Vd6hlL21vnBZpt6t0rNgKe8rgDPgdou9pj4PQusk7JW0oVK8SY
 o97rPgffnfPXFbB926QEkoB5suhhTAid8Vlflh34u8C/983Xy/+RR/HOFyDf5660byENOYYdDRa
 mGB3N2n3/y+Vp+PyQSI2/QrIKoXe43hPkuF1z+PdBc5NgEo11t0kIySbhiQb10vlsIzZDKlhvOG
 v0S1FJlbY6NAjstdVzPMlOH52/CyaharAIESZnKKR3QI9zvzRXAkTjIpUtxQE+Yl21mCJrIo4L0
 SsuoysXmXS/EW8F9FzJC/UXstEP+Jcwh2EQhROjjpvI7DnQ7v+l2NMIA2bpNvTdd48cA1Jwxtc8
 QUBrd04NrrbE3LQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 22oJTaH6hRzu2aHMU4ezaNio_FXDEUTD
X-Proofpoint-GUID: 22oJTaH6hRzu2aHMU4ezaNio_FXDEUTD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3MCBTYWx0ZWRfX0IQkwPhKd7Wf
 tkhXw972DrCG2RlKTI+0HrN0+Ygl3WB/9jIhTmr9b+wOVrOHW5E8Al7W7jabKqQZt8NmmWB+q7g
 VWaIMxdlmGQCYsViT2Q1GcG6PPQUUPS9oOhTUbBKrkz+EKTW8ojg/xWHRjf6878zi74mOTA9e1L
 reH+ozN7tKJ3RRXb5SonwIuxioOkKUJnz4NgGco/55KGuLONUSQoEAXPcr7YANsd/Eq5ODgtYXE
 nJoUMIzlyWe8hdDNQ3Bf/xkUmYrt+OUVWwZWADZqk0ejneWd728qYYfhrTD5U0nWUe9mnQOFJaU
 ZPwHkJzM2Om1UMv+faSrH5gUFja0xmaGKh6y47uw5Tgxt6WKVirUXzzefkcj9yr3mBvShiRKgkk
 PNs/4RmFL3kvpyqKtv+eNe5DAthBFEHCTWFgyLrXGIYJoIV0rTO5EbudAghIszVOf7z6IS3QNK5
 kzT64gCaSwA+yx4A9Yw==
X-Authority-Analysis: v=2.4 cv=FcoHAp+6 c=1 sm=1 tr=0 ts=6a1e884d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=F4J0OHcPalsv3C1teIDEwQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-k1jFxHUnkbkSjS2ChMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37788-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13D06629D49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The definition of set_value() carried a duplicate class name prefix
(line_request::line_request::set_value) which compiles correctly but
is misleading and inconsistent with every other method definition in
the same file.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Assisted-by: Claude Sonnet 4.6
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/cxx/line-request.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/cxx/line-request.cpp b/bindings/cxx/line-request.cpp
index f6b0a66f65fdb48d90739b19e3da6db024dade07..ee8f68748932fe61296055530722870f02cb2be1 100644
--- a/bindings/cxx/line-request.cpp
+++ b/bindings/cxx/line-request.cpp
@@ -136,7 +136,7 @@ GPIOD_CXX_API void line_request::get_values(line::values& values)
 }
 
 GPIOD_CXX_API line_request&
-line_request::line_request::set_value(line::offset offset, line::value value)
+line_request::set_value(line::offset offset, line::value value)
 {
 	return this->set_values({ offset }, { value });
 }

-- 
2.47.3



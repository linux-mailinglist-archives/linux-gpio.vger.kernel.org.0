Return-Path: <linux-gpio+bounces-37783-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H6RMjOJHmqlkwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37783-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:41:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203C629D3B
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A8A130373C2
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 07:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFB9314D1D;
	Tue,  2 Jun 2026 07:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QX6ZLIuS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOmCMSiX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4034B3438BA
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780385865; cv=none; b=ou2y6kB1IeYYEGawxJ9v2d6CvTZ69XxF+xCDfNILTgHLn62T7IhzmVuj29VbYcuSMYhTKb5soxEV4iI7s7eux2JPRZEpslFgDl6FdhW2XiCMKoPlsb4zUonmuSAfoxl5kAJB4EkoVRYVJ4upz1798M12VyjiHfAQOb/eUSwjsPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780385865; c=relaxed/simple;
	bh=fU5E8xQzNp81PRXKESdpnFdPJ8ukxA0x2TbmlYh52Uw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZvJ5FB+Qi/DF07twA1TtcSJPpYeWsR2Vn7prM1w1VcRyrNuKlUZr7WPPg2RYVBO0JPeHnwDhkqo9sLPhHX1pYGQMd2mIf0KR9V6kg9n7VlYEOdqBX0OmRaJHOj/How8vj7Jt1sIoel3g+hOhrcPR2XPFhMFjwwQOoWhILH0t+CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QX6ZLIuS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOmCMSiX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652454ud1937421
	for <linux-gpio@vger.kernel.org>; Tue, 2 Jun 2026 07:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vREFzih+095CQOOs8ww4/CpWwOAU11h5BE1CZm2dYtw=; b=QX6ZLIuSEkJlz93i
	qx66w/mphKdMDPD+Fvc+Yi5YZn07q2YFoclPMQp1KAOh4yowunoLDyFTsxvYH4Qd
	KdpqIFltY677GGNudHyovQKBk1szePDI0YDTh5mmZoyVscTaYMuo3B3rijuv3FjU
	t55omaujyj1FqUmvYShK8J+fes9mCoC4/jG3cbUXGE3w75Me9paqEi2jLosFVxAy
	rN3ce4suulCfZmbV/CnYy6T8YyJXsDssN4HwixOX4w6C+9mspz3DL8WS2CHgRT6f
	RMr1dufmOZ2eF+e3Jxzx8yacR+BeUDTfXvDMfeIR2FCiZs8NUcdJSoyr4aoPYH6a
	pUCSdQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqubgs5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 07:37:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccd7878566so91196236d6.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 00:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780385861; x=1780990661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vREFzih+095CQOOs8ww4/CpWwOAU11h5BE1CZm2dYtw=;
        b=jOmCMSiXQO5RI1rXaK4xVV0vqE6jKg78/XUpdYZB31CwrvKqrFCgO5/YE6lC5jpEQo
         nRNTyCUJkCj6kwBetRxXV6mqxxU0aVOWMHOojZe4DtdFnLlvMhUD03dQqROUCBDieSdh
         l8KvZHKXlGQN9QjeHTLeWfhUGsPkqzD3068Rx/bY1BZ/csnGYkOi+23+LFL3QVj9l5dv
         TPnrP0EF6L1qpK9GhPRICKEVQ0o5pWwBambo+2UilyQm8HuayoMvXfb7cLBH780wno1F
         a0com3RjSGySva88gS44lrKps0cgpZsykZrXQbwV/bSZirlaiZnJMfOWyTiyTXyxvlbP
         JtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385861; x=1780990661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vREFzih+095CQOOs8ww4/CpWwOAU11h5BE1CZm2dYtw=;
        b=ZcDPwlai1iDziTbinFRtau5Nc8re8W4timPvsJhgenoPhwZaBpPnqhXWT5GhNIzXrw
         Plg0hvmhAtwI0pmSwcOUfDzibRt9lV1q2s/apae+lAxhYV1d0oUiq5XlEeqhqGQPfpb8
         sMTXeHF3CVKks1ks449dILqM6Z3Duk7e51uOhl3JqH3W5FxPIp87U5wKPYkXe52OBe+1
         c95qLJJaYb5tElJHGCxU6U5WCIQw5SCLL/+29HHyab/eeiMLb465P5l4uF9DRKkcPEa/
         0lPK6ozobREGZ33ERR2zlYFIWJnM80/G+aDcJnjmrOA5kdUE0kowej5DXveNrV4Y3Wbn
         NKGA==
X-Forwarded-Encrypted: i=1; AFNElJ+V+wK0CBUAVNU0ADKj+sG2K7CR0WQrzZaobJgrhj1P1bMgO7ikvOWLgTzQUjDjIn8a/R3kRdaGGkr2@vger.kernel.org
X-Gm-Message-State: AOJu0YyoXDluZ3VaGidy+CJ41gfsQZRvLmQM5455oTr9XuMIuqlSPPF2
	afKKg3rAM9lhY99KV0H0EItirlqg8A93nw+I2ezz5En8zcWduXQgPvHOZucPx4k5nmDqnbO/XNm
	634jrLj2d6hJ8aebJIAYFIY+XGvkR1jJ/8oIz40C1GjsTxzX2E74WXY0V7+6SiztpbJglt2CF
X-Gm-Gg: Acq92OFdqJanSLv7d4lPISggl2xu1+O9Vu0IeMMGx1xqPa917YdGErgPvETUI+v8Z+R
	oCfRF+7HG2cxymXTIrwnx67LzFFDH0YgFhDG8PLX/1CtuzFNmehBKEQ3w7ptzpvt7bxSvtPu4Od
	F/3LNzh36A8zfcI5uP1Mw6/7bR1s4SAJtQA96CPvP1jxK/VYl8s4qxzubcn+Gwgx5O7HZ3xcKu3
	J3d+28+THSyWBhmLYJ4altLeMeXr4kG73yZQmC7lH5yz7VXp3d756sR6cGJYFfAb2mXEJ4EpmxO
	AxRJcYquF+sgmmOS6vArvgLflFtOGmbdOjFhINDTuR9VSo5P2P4kFlorqtbeqr1E2lRvUwUKmNH
	n9HzCzX+fmj8QemdrUbK/iyXizc7Op4e4rUXoSPCPVbuONiSyGTjENtArfrWGJk8lGg9pZ0vliz
	RHJ/GES+fRBMrayg==
X-Received: by 2002:ac8:58c8:0:b0:50e:a1aa:2cd9 with SMTP id d75a77b69052e-5173a722f90mr211284831cf.15.1780385861424;
        Tue, 02 Jun 2026 00:37:41 -0700 (PDT)
X-Received: by 2002:ac8:58c8:0:b0:50e:a1aa:2cd9 with SMTP id d75a77b69052e-5173a722f90mr211284681cf.15.1780385860962;
        Tue, 02 Jun 2026 00:37:40 -0700 (PDT)
Received: from brgl-qcom.local (2-228-54-83.ip190.fastwebnet.it. [2.228.54.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e20bacsm45994245e9.6.2026.06.02.00.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:37:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 09:37:13 +0200
Subject: [PATCH 2/9] core: replace strcpy() with strncpy() in
 gpiod_request_config_to_uapi()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pre-2-3-fixes-v1-2-9432002bce8e@oss.qualcomm.com>
References: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
In-Reply-To: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fU5E8xQzNp81PRXKESdpnFdPJ8ukxA0x2TbmlYh52Uw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqHog32nQKYAAo468DFgW58iLjedJU39zw3m7o0
 lcyw1er/2eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCah6INwAKCRAFnS7L/zaE
 wxPBEACdpgIh+5pgi4IjMhzn36kqgik0kheClOo1G4RnYzR2Ws964rj1MoVCgkO979vKyGt3L4v
 QzHstVR3+5jgpRuiJ9es81lVkjILxhr+eogqxd28zEUF+SOFdhhDbRB4F6lqvW7ctC2OWDv2rxT
 gXaboU3WRbZjIBvYsqPZoWb3NyFvlC0lZ8REWyRnzjanN9MjAjA85fEMDvJZ0wNvCIkxhMCMBoP
 PQN+CEAVw3N++kJPCobz62mFQ4r59/Ay/36gWHvGFS7y9qjc8zeCUoJ8zcCzu3MOnpV+uNldWQ1
 bQfIL8DYgHqOUJqYryw1tYpGphhSEi/My3xxnn5E2zgNRuRJ+fdwYAh930VX90+9lvVELkj5Bia
 SDfhDeWw36e0F5SHKBt6xmS0nzMBr/lXZcHbP3hOwjvcBVwNXDH/lL6bIa7Yoe5JcdOI7GijyMW
 Sp3VarDUqZ6u7QNpTrKMU5zPV4jsdjE8RVe9eaMXOMiOH2nxso9w82ffXU7kV0X74+J1jtv8t10
 KwpjIwApmgpgTVll7L2+JQmhtSXYLorgtHfnvA8/xCNQGLZ10bmFYlDZAJzVKMpkAtF3mAtC0PU
 ZgPJSoyQciPO8vjRpjaMhqQKuxDYi6bTWsKGKjSlGImlNniiKM62b1wO5sB6pRNmFwWGPUL/Eft
 7bgRfhqLHBLTThg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: hHSBLSuEnfL4n6GoIn_PqesSR5oGXda-
X-Proofpoint-GUID: hHSBLSuEnfL4n6GoIn_PqesSR5oGXda-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3MCBTYWx0ZWRfX/hrc4u8zNZ74
 ARZ3cVHzdg0A4eDDYDXY+zZM9JlooUtuTnADIEzTYaCwQ/Z+55jorWN1nyZQasBiJcsSkBgtz5p
 fbgFxZQn5afNUmF7IaCfastHLkVKyfkeoX6DCqA5UoZxmGTBe5JJlvg2h/oYLxzGoyShSUNDkhu
 NMlisyvfbwDkYdn5S3JHGf61ShOlmF3pPc2A2R987AhChquL2+vnziQ2G7UAuaTUQKR5q4+z/EB
 utDJqr6NWVjpucdQ/V4uMk2QNDzmjdGpQJmz4ZbC0oF6MKwV7XPTf/iC6ULmW3bNK3Cl2u86O6N
 ZqbG7ZSopQw2K9ttrpn4jqGV0sdenI8/0iDdddrb+cJ66p6lO/okcKjX3sYYYzPYBVsGrh138AA
 Vir3AaVrs9K5l4WMy2E9qWBqmthZY74aXI//2C0CEKrSYyS4P2hOICxDAf3XShN9CY/nphwVIew
 sxXRL2rBuNL0oEZSgmw==
X-Authority-Analysis: v=2.4 cv=FcoHAp+6 c=1 sm=1 tr=0 ts=6a1e8846 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=F4J0OHcPalsv3C1teIDEwQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BRC6RPTYY3SoABRGux8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37783-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7203C629D3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both source and destination buffers are char[GPIO_MAX_NAME_SIZE] and
the source is always null-terminated, so strcpy() is safe here, but
since the copy length is statically known, strncpy() is more explicit.

Assisted-by: Claude Sonnet 4.6
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 lib/request-config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/request-config.c b/lib/request-config.c
index da055c5b4bf551fdb062b3bb55dadc11a6ce7a25..cd22028c4af8dfcad9953b20c7e4c37f269c9124 100644
--- a/lib/request-config.c
+++ b/lib/request-config.c
@@ -74,6 +74,6 @@ gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config)
 void gpiod_request_config_to_uapi(struct gpiod_request_config *config,
 				  struct gpio_v2_line_request *uapi_req)
 {
-	strcpy(uapi_req->consumer, config->consumer);
+	strncpy(uapi_req->consumer, config->consumer, GPIO_MAX_NAME_SIZE);
 	uapi_req->event_buffer_size = config->event_buffer_size;
 }

-- 
2.47.3



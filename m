Return-Path: <linux-gpio+bounces-37786-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Of2MhCLHmrjkwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37786-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:49:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F7A629E96
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F11C2313DA86
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 07:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAB93A7828;
	Tue,  2 Jun 2026 07:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfYqeciS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BaCdzB1+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE28E3A6EF0
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 07:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780385870; cv=none; b=bXg1RYCZief93r0HLfYOm7UeC6Sl6Bbg1j7U49BSN5bqsBSgISHGyTKp3L4Haha0tsxOUKw97vgX6qZEh8YDl/EeOZ/Kc7zY5xpl+pVUBM8e6MPOhmm6FxE9OLb8SayZlDppYOLGuymfbssmBuPuDus0dzn1N9y45LqmksmBve4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780385870; c=relaxed/simple;
	bh=DritU6jdN7rBwSrBLH3xPDCrGffrZY0xlUwh2htw0Ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VVMuyjDzNN4VQwmT97p43LmErEktY/KFVj5683Z7G/vuBEo7zSdr17QXK/TIoW83/DGtSxFXQnga6N1jxvGpcwhZEyYQzsnvvrlsujQSSKRbxDE5X4whnV15N9mJwW8m/HujRSmxdGnQeTBnuMEvfkjkyqrL5vl7CCIrPXoPuVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfYqeciS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BaCdzB1+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65262IoN2687951
	for <linux-gpio@vger.kernel.org>; Tue, 2 Jun 2026 07:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4D1LcjZHV/byILjcuahMn9e0UnbDvkVXD3llbdtjyfU=; b=WfYqeciSysQJQkjT
	IeOmfHDZ8kV/6bgZxvfc2yV/Y1SLY/IEAMrcDrPoKn8ZFNrOel3QlzUCMf0SVVUE
	pYiIeYiqjI90FAUuWGKaS62HoNvZaMF01+V33ixBBD4BFErqCstvRiEphTn0JF0L
	zpVgFbyx+6xHV2FJ/aWco4ixvrb5oRU2DNZ0iU5FjwUTNUVqEeyapQHVVgRQ+y1o
	g0BEUoi4Ku6POpa78l29nmFBDUfionOsB/toeLb1XE1IpPo9h43FuDUDpMc0gThl
	4nTNQrV9vXynYx6xzzqPdGAN/+3F/RWOmsQb5z48l+q2G4a6FavvN7c7sY+gCjxZ
	Ni7Mvg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsja8c75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 07:37:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d4b3f3a1so220427841cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 00:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780385866; x=1780990666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4D1LcjZHV/byILjcuahMn9e0UnbDvkVXD3llbdtjyfU=;
        b=BaCdzB1+D7rBJRMekRKTnoyycQamXeO1suzUw0gFp2LJ9kv3LyorBWG7x0thXTWjoM
         hEsgDF+1eA2VzgMMg5yRuO7hRRwyYufhRfiePBQhtkoK6UoHCKWBECVe4O3g9Mfd/ffc
         8U1ZMoO1d0UnNxC+yftz5+wO+MDjbpd8DmdUyX3FPAafuWRZ2PKOL5t03ecY3FXeyvAa
         nVkNCbPAzPtGTCCN9/JcP++OlqRuLP7kZTF3Kd3t9wD1GUzxULKUFQNzceGwvMXdevaI
         WCCr6Djd7sopOaMKt/fTyWrvAbRNH35C+w3TzGp5v5x6Pc5oL2rVj29iTvbhLU3Z1UL0
         lbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385866; x=1780990666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4D1LcjZHV/byILjcuahMn9e0UnbDvkVXD3llbdtjyfU=;
        b=inkn2MMc5tde0SKKtlOesiYmxy77XicrIKja7iRL6+7ES76A+Hk2bN7O1bNVtdRhpg
         ln4t/+Y+zDEtbw63Y127cbrpjbnXcl9/UcdQvNBDfslL4jbCWPcjr+KVgipyDRA+po1X
         y8wmdyB5KVw0yhEjP3qbX05A21lo7a1sWTt2i7CSpkEaa71CDxj80gvx4H83KTAXuhNx
         2U1J2ahWnsjKc5hFoQ2eSGKVwjmCtEybVRvMuMofjIHoOTp+dIMbPvNscSkidIW77rq7
         OhgkiP55hfeXWUuSnUY30+jvxGWdFsmGvNsfalzdyY5hNROizh/vzWgRFI7eBl9o3+A0
         HDnw==
X-Forwarded-Encrypted: i=1; AFNElJ/M0svia9j1sj1HLYbpeL4o4Emd1ma/S97MOVBfrUTbAhESLfSlVwRhuwznqWjRwM86XYsijSXCDjlt@vger.kernel.org
X-Gm-Message-State: AOJu0YyXpci0v52gk7NUdGjld/c7lflENHGKFjTlyGzyGkPrIVhYVQiX
	MpMjvRqEYLr/ZoU8yJaQ3oqhePr/Gl+e8ZvZApOClLu4FNb5QkwBfaJiFq3c31uGckWwh/5DwDg
	nouO0m8kX2NHALMvbikWSESVQOfFcEpQqEJjCsdgdL0R2D/m6M0gUdqlqTHsib7F6sVDUSWLt
X-Gm-Gg: Acq92OEBsJzH5PPrR81HF/uiap7Ty08Y9x7++OinuoUlui3LYEhtjmFJkkfXByXoXVC
	bY3aCO08Zjf1VFiXrFM48aukekd6KQt8yhIFbACgZ9nYJIktwxGf7ZnwMltmvbRRDAwT0aY1T0J
	LQvoddAD0NqLj8izt37cvN2InxdhPk4hzLCbuMjG5GluwoaQUi2KWPq8iTkFx4WwgD+AY69/PQO
	BOjCnKNtMjsMKCwPOWSIWj2FqJHxksMAEzKjJDmRFm/S4x2/kQekxjvZqpDbdd9F4Hmv++iHldh
	O+4WcxCogYFp+jxsjVCFu1Gi+A5f5MVqwqvkGP8MA7vEBYa3zUnqwYCZDcLokSt54GjOVuAXNb+
	TAnqtU7w2+LxMEHbUyQi+2wJzRu6IPCH+qhIidkoOcP6V49pnsQU2FVbF8tVWCHZYJYbJjj/Avo
	5RJ3XqGc57Xbi3YQ==
X-Received: by 2002:a05:622a:2612:b0:516:cc8e:9fff with SMTP id d75a77b69052e-5173a83be56mr194376641cf.52.1780385865813;
        Tue, 02 Jun 2026 00:37:45 -0700 (PDT)
X-Received: by 2002:a05:622a:2612:b0:516:cc8e:9fff with SMTP id d75a77b69052e-5173a83be56mr194376421cf.52.1780385865303;
        Tue, 02 Jun 2026 00:37:45 -0700 (PDT)
Received: from brgl-qcom.local (2-228-54-83.ip190.fastwebnet.it. [2.228.54.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e20bacsm45994245e9.6.2026.06.02.00.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:37:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 09:37:16 +0200
Subject: [PATCH 5/9] tests: gpiosim: remove dead container_of() assignment
 in gpiosim_dev_enable()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pre-2-3-fixes-v1-5-9432002bce8e@oss.qualcomm.com>
References: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
In-Reply-To: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=892;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DritU6jdN7rBwSrBLH3xPDCrGffrZY0xlUwh2htw0Ns=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqHog7coysIpgCfRYJ4rn9oJiAZBpivqIVQYPLp
 icsSdFON22JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCah6IOwAKCRAFnS7L/zaE
 w+LEEACjnLo6SeK/t5H0oZUsLniuqqxd5/vdxs6rE85sAHhTZztPOeoO/EZ75KwActoHM7iawGU
 EDjlG09fMJzZNqIea/RAds64wrf1nJtMxd2ooZha+u4lKO3gb7w3EqG7YoVRFSnpujRZYLxXfYJ
 QtCMAqsNRGygls6q5vu2N+pFCAYf0q/NmkttY6u1ANmml/L/9dTzeiyXT5FKKTez7aowNbg4hU4
 w00RC+LGK7u98ZGP5hz5tw6vdn1W20Tqjijz43d7DDniatoqIjZmsWllFTQfHZewWoFF8wrm4VZ
 IzCy0j/mOMSKSVXK9iiD6gXRd9TkQXpSAA7CJMbMxeEbGeXbV6C2xcyb2zyVAwMDh+4KYKYnmSp
 ZM9O9oSJbCv6qF/khEUtPvRyvdPT+fjoYgCFD6Np+ZOEVe+gTJvZIsEMNxUytBO4PX89sylzWPO
 jKbpWjkrPHWKia2OQKeOKuUFNMrYps1mBT67+PknNN6zvzrvW0IVOXIIwBgor32hbp7zp6jUdSn
 MgICUmyJDn8S8dkesbKDNIVxWh+E6xJwrnVqt0+BdRp0bVO9VRKCpv6yg7LKAjxGl5zRQ9NkOD5
 1km/nydN7p6gT4t9Y4+11UIBbsHixRw0f2FPRvdDKNOk+9lhTLAd50Tog66FPDFJNo7ZPMPNMK+
 iCtrkyYQEX3u6JA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3MCBTYWx0ZWRfX7GkQv6aQrSS6
 q6XXj6w9mDvDjl2KBaAXV24kgNumiy+zeKXQpilKva51VS5K9RHioYLs5cRWBFURIE1SoK9a9Yy
 qRbMjHUcCJNdfBao5UAF1z1lzIzV+vm5pGyPazE7MFdX6rDgaQZkpAFALezDBQm7KG2kCXnese6
 THSfAnq9rm/ENdvGPGIAGJIWunFdS36cdiPTUxhi0RTmzY3suUm6fLA/R0ge+EalzigBFG4EAV/
 cybUPc+ic98uDvGqtVCfoxFhY11mijrFVqurHB75Ula4UJWMScMjbTW8W4fD6sRfFXViH9x3fuB
 bdEnyoGtYOx/SfKOWXh0pYOb9DT3692Cstjj71FryOapzaALK87t3RxB5ivHmxp5KmfqdEdUCz7
 u7sCoIhBuSZ6aRRdaPWDEoeIOE/6BPK2bUqK/P+2IZtS5GoNLKDD2pe63sM11X9RCr7jALM8NCm
 0sgZPibJJIqGhustzOQ==
X-Authority-Analysis: v=2.4 cv=Ld4MLDfi c=1 sm=1 tr=0 ts=6a1e884a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=F4J0OHcPalsv3C1teIDEwQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=J0onJY3hBJrmla36YHoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: cLKuSLqYXH5Afl1zWwAhNkeTc6Dgp1cd
X-Proofpoint-ORIG-GUID: cLKuSLqYXH5Afl1zWwAhNkeTc6Dgp1cd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37786-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52F7A629E96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The assignment to bank via container_of() immediately before the
list_for_each_entry() loop is dead code: the loop macro reinitialises
bank on every iteration and the initial value is never read.

Assisted-by: Claude Sonnet 4.6
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tests/gpiosim/gpiosim.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index 449dfbee29358f14d6aca0e438ca93b937c90dda..920edb4774ed3de0572c90a9009201390a145730 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -813,8 +813,6 @@ GPIOSIM_API int gpiosim_dev_enable(struct gpiosim_dev *dev)
 		return -1;
 	}
 
-	bank = container_of(&dev->banks, struct gpiosim_bank, siblings);
-
 	list_for_each_entry(bank, &dev->banks, siblings) {
 		ret = bank_enable(bank);
 		if (ret) {

-- 
2.47.3



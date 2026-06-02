Return-Path: <linux-gpio+bounces-37787-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHHGKRGLHmr0kgkAu9opvQ
	(envelope-from <linux-gpio+bounces-37787-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:49:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B23A629E9D
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E3E4303C42A
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 07:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04EA438237A;
	Tue,  2 Jun 2026 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSAosnoy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U5HI9W7O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AC53D3B3
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 07:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780385872; cv=none; b=NlI/Y/pgTtpvCMPxpG6l3HbP4euvoFUTk+bKrRsSu7jSjuOpWa+xsnsRKHvdKhRa5fmpBx/uakRnCaemDh6+KFmeUf4aWZlnyQTHLWMJ5agXMSwMxZMmUYOstHiVZDPkW6aTAGFQIU4mVJDJoj6ayRlvNoWfnXP1GrK6vJRHIEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780385872; c=relaxed/simple;
	bh=3UgzjpfiYoE0kh7wrRhfBcOjKQw+dAg7gcgDI/z37HQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tz9bEwjxkB3Ut4syugGCaCFE7of509oH7WPXNFgkZ03+60aHFUMocykU2Fwym501GgkFhTEMl3pjcgWsHgokqC2HceRhkJYPxnADF6Nve9SHOO8gp4X7eYmYkjmlUjaa/kRGpV2vBqgGMyoVCCDKzYyzhZ9pGum/5j/l0cl0WaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSAosnoy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U5HI9W7O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652454ug1937421
	for <linux-gpio@vger.kernel.org>; Tue, 2 Jun 2026 07:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnN9JXE2QFF5rVB63tzkXxr78FuJwMWjismWSSPNXjI=; b=lSAosnoyvqnzH6kS
	LGBY4LwY7rPMARc99oKgKdCQqWqDi8hgEc6q6FBemrKTO/QRbE8TYk7H2FEj7hzV
	mybSBvzDa7+rLPbgNu2Ezu94iiR5Ror4xTuMt05SlDHaDTRHAS5QNO0uP2vs3yo8
	SANnPRqRdN4e6UhvR3Y/J2JQBLeSh6TQh1hAJZoqqN7IrtOQu6BZqzxRW3qqXM7n
	p5/Y8tagcH03i8QLptgk0lJorvKVtuaejVArJ7+rkcewnh3L0NDPoIzZSAf+TJEk
	gE4b1DW7orXBYnFRjY/AMZZHCACocAgnGUeOUjrkaSJn9zd1lyLuA4JLkR4XvUXX
	ei2QIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqubgs5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 07:37:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516d1a8a6c8so159729201cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 00:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780385867; x=1780990667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnN9JXE2QFF5rVB63tzkXxr78FuJwMWjismWSSPNXjI=;
        b=U5HI9W7OeKoUK+31XM5ufL0nkQphkl+U6nmQ/It8u6UVU6Kq0B+Xv10v51B7pbQL1I
         8odcSrBi9Leywqmb0+hzeBaZpWUK4bOnRs0N+nSNfIjEapVSwDvaW+266Q3K8CkB0OC+
         1VS4rHPop2kxqv2TnQcNoS0pdlbjmK6i2k89lQxqWa8vK6dmlIQS93NeU2IxcIoeRyKr
         OCn7slc6YihNJl+lfbOG6I/K/X2g0HVgZmlAfsJMmL8NhrWUHrMsGAxoj0/+1d4Y09aH
         fH2EYqhE+Q1I2vG1QaXb4Yg95YBC9LKdlkm5PrEsKTJoBikTv0uRv9Sgte+k7fyBAmr4
         adcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385867; x=1780990667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KnN9JXE2QFF5rVB63tzkXxr78FuJwMWjismWSSPNXjI=;
        b=NuBL9g+5uCR3bvpyxQNUbHsUM1nbmSPEXlcLzRkbLsvhjKkc/0JscaH2GZmRS2hhRh
         KykDGG2SLG6qybUkmp8/fWwHVO3UwTAwjipsBPVuDMZOClaTL0eb/T/VRg2W7y/nPgkk
         x05BSipNArvqUBTsUpngGXTbweGlzrufqywm90ZPLF2YqRCT0G7RB5NoBKjm5sLbcOvl
         vO2JWMSn+wWSBIdxMZhtyQp4U3TtjerbyzNVJmsP/s/Z1MwaKSVpxcX8hLkQ1CJ5oY6E
         9b4dPt1Wjtbm/JTKmSDnhcHRMHmMxGkVUgyAfxrhyyqQ9iNvrtLhPS6dCIkPntXhkbyz
         QZVA==
X-Forwarded-Encrypted: i=1; AFNElJ86mCxOgsqqWSKilGWbji+SzU0c2tD3iNjf/32U0LJCmt5PPuuKwOv6T08NUpUuAl2rQUQVNJyT7uNQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7PfKOSHWO8TgAiYieMuXuxmjsd7LwWoHsyVq1TdB90oC7pEL+
	YILf15nmie32duY5GY4kJGw4eER8rrRW7GqDMl2YCJ9XrZf7hjzwCK1mvPdbtZD07nVn6AYOFs6
	+XQOztZkYEtr10HAmt7mW5NkSmWzWAueNt7kSY5DrM1IqhKNaTzSjXoXIMPazREroC8iiDjk5
X-Gm-Gg: Acq92OEB/98879KoFFIHijYhNZVEo0+ovb61PAlvqhOzmoAlWnD5cS7SgVtOvJZvalz
	0jhfZ9wsZAasidWf2UqhAYt6DDjtOoL0u9hQtMJT/+85AZSltn4apb/eMvsayuU2tBLzfi7zhes
	JTRh0PU9H5Q0j6HvbplWvQWH5Q13aRTTwhv01t3Rf3oO+KeTKpbv9iTWP5BEiUoll0YH8ch4oVr
	NkMnSiVLKRVYsYOqNiD/QjRG6K2tHzlWXdCfktcYIZv+x5G6FFsiJRmG4k6lXdQi/7vx2fISTgo
	/C3wPperu4GP2lg7tXXQJZZI1nM1VbJGYoFegA7P6XY0PKdcum+zOvyg/Z0jt/tTXO09NBqP0gB
	3cksyKiMEO7tQS691XUq44fGe4qHc0tnx6EmrkmJd6OFufAowQJCQ0ujP9aSh4RiO+73JGA2uGz
	6CgLvDJN/EgaJKFw==
X-Received: by 2002:a05:622a:6183:b0:516:df1d:c102 with SMTP id d75a77b69052e-5173a709293mr207179141cf.20.1780385867181;
        Tue, 02 Jun 2026 00:37:47 -0700 (PDT)
X-Received: by 2002:a05:622a:6183:b0:516:df1d:c102 with SMTP id d75a77b69052e-5173a709293mr207178931cf.20.1780385866756;
        Tue, 02 Jun 2026 00:37:46 -0700 (PDT)
Received: from brgl-qcom.local (2-228-54-83.ip190.fastwebnet.it. [2.228.54.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e20bacsm45994245e9.6.2026.06.02.00.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:37:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 09:37:17 +0200
Subject: [PATCH 6/9] bindings: cxx: fix consumer string in line_info stream
 operator
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pre-2-3-fixes-v1-6-9432002bce8e@oss.qualcomm.com>
References: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
In-Reply-To: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2988;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3UgzjpfiYoE0kh7wrRhfBcOjKQw+dAg7gcgDI/z37HQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqHog8X+TYZy/JpcNXg+dTKH896uOpa/ng85FWY
 IF9bsI6pnaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCah6IPAAKCRAFnS7L/zaE
 w8NpD/0Vnrm6CkiCCYNKB2KVl7mB+k9rMR/R0VXKHUrbs5IQJmQWtzx6KYioRdVtyvIFyxPm/T6
 3lLt/mQ9+ySoLnWxyJypw3GH6qViL7MJgJ7XQMREfQnOyW+El9XxUdeg67TLLbhF2/CpHQbfmmA
 UM2orIsqV0csFKRIyTKZt6wNqRQ39g9r66g5Bl8BShuaQmcYBPPy/TQwWqsh8MBlBhhtWB2Hl7C
 FN6d1sETJVB5+5eqWyrAGERrwuc7U62FQsniSIIFx1l+a7tFjh4SF2l7AoMUzoLaoUwt7NrypA5
 g1EnLiaRnhsN0HP/1TyNASaBbo4i3kWkYR2Nzm11VX0P0El7S/c+pa0YFUMj2kzCfWIACuJgolP
 HsSqUTm7CTm/tJPZpa/HTW4hwp+6ug5qg3/+AMXK7wRyqlKAeM/3utiiQutEbk4bvNwO243AZBz
 HqrA4tm6836cJE3Z6X0TX0jcNR2Z3h2f+F3z3dNophGaA8FQJrBR5BpLROeNy73iVDDLl4+px84
 vz1T7RJq/bSLYnPAQ9j1P3p0N0pYjAA2ci8oKMdrKj2uN7Zr5JAmK7rne3IlxjOEv8gCpqeQnUA
 tJbpJe265hC5GJGT3I1K04EN22UoZCrw/SWzHSNkuINsDbMJZ09j9E7MyTEoSW/hMUckl3fmJsq
 xdMNDLRkkqigaeA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: lX7DUgIbjAF-qKdXL9qUTETGVIUcHo3U
X-Proofpoint-GUID: lX7DUgIbjAF-qKdXL9qUTETGVIUcHo3U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3MCBTYWx0ZWRfX0uOU0WAeZLX+
 rTLr1aE2DnEFJ3tqaPxaXmw0tN0i98Nd6NCeh87kwftyBeIA4/lcYLa3dKMs83MBMI1T6VrR16j
 t3Dm91aFTs0OdT1vL897Hukvqa5nCYioqMpnsw4ud5iFyWrsA9xWn1hYFqd+zfNKpVZTeVT5jzF
 MuGWdyvjA8OqdyxaeQ63hxQ9nswflcJ33dO4HjrPKAELzhaMvr1RYccl+IXhQYtzqNXOY7RRzUm
 oPY+4sztrvBLcpkLW9T+9N9rNguOWTELIcbd8VCLVBMHbC/CR+NIdcLP0D2pWJw3h0gV1J7ny38
 zpoiK5eYfI8IJJveCNFRGmOGrr6o/UPgNUa7FpwLqcVLN5ck1PTeDgMSpKn6ONK33FkCD2uMcwF
 z6SeNWJHZvXovp30aO61Vh8uFXZAynZGkxG2GI15KOi1a7yH8tbY2NBWHfQOXsEUmeJWXSJEp+0
 Wt0RBR/nMLPkaAB3TOQ==
X-Authority-Analysis: v=2.4 cv=FcoHAp+6 c=1 sm=1 tr=0 ts=6a1e884b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=F4J0OHcPalsv3C1teIDEwQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EQ7G9fe1HMCsNUibp98A:9 a=QEXdDO2ut3YA:10
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37787-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 4B23A629E9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The consumer field in operator<< for line_info was using info.name()
instead of info.consumer() when building the quoted consumer string.
As a result any non-empty consumer would be printed as the line name,
not the actual consumer string.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Assisted-by: Claude Sonnet 4.6
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/cxx/line-info.cpp              | 2 +-
 bindings/cxx/tests/tests-info-event.cpp | 2 +-
 bindings/cxx/tests/tests-line-info.cpp  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/cxx/line-info.cpp b/bindings/cxx/line-info.cpp
index 2117f68ccb4db6d510152e7e3fe40200fcf9fd1f..5e55a5fa8f18d698514d80f3e3891c091e5332bf 100644
--- a/bindings/cxx/line-info.cpp
+++ b/bindings/cxx/line-info.cpp
@@ -166,7 +166,7 @@ GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line_info& i
 	::std::string name, consumer;
 
 	name = info.name().empty() ? "unnamed" : ::std::string("'") + info.name() + "'";
-	consumer = info.consumer().empty() ? "unused" : ::std::string("'") + info.name() + "'";
+	consumer = info.consumer().empty() ? "unused" : ::std::string("'") + info.consumer() + "'";
 
 	out << "gpiod::line_info(offset=" << info.offset() <<
 	       ", name=" << name <<
diff --git a/bindings/cxx/tests/tests-info-event.cpp b/bindings/cxx/tests/tests-info-event.cpp
index f7ae309c24981d74202de3a98d297371438f7717..b4054ec08a51debd3ad4d4cbf316555ea059f487 100644
--- a/bindings/cxx/tests/tests-info-event.cpp
+++ b/bindings/cxx/tests/tests-info-event.cpp
@@ -215,7 +215,7 @@ TEST_CASE("info_event stream insertion operator works", "[info-event][line-info]
 	buf << event;
 
 	expected << "gpiod::info_event\\(event_type='LINE_REQUESTED', timestamp=[1-9][0-9]+, " <<
-		    "line_info=gpiod::line_info\\(offset=0, name=unnamed, used=true, consumer='', " <<
+		    "line_info=gpiod::line_info\\(offset=0, name=unnamed, used=true, consumer='\\?', " <<
 		    "direction=INPUT, active_low=false, bias=UNKNOWN, drive=PUSH_PULL, " <<
 		    "edge_detection=NONE, event_clock=MONOTONIC, debounced=false\\)\\)";
 
diff --git a/bindings/cxx/tests/tests-line-info.cpp b/bindings/cxx/tests/tests-line-info.cpp
index 8589da3c6e22adc80208a206898e40b5b5fdedb0..ff8415cf6c6c9a6aad4310096be2b58fc2323843 100644
--- a/bindings/cxx/tests/tests-line-info.cpp
+++ b/bindings/cxx/tests/tests-line-info.cpp
@@ -147,7 +147,7 @@ TEST_CASE("line_info stream insertion operator works")
 	auto info = chip.get_line_info(0);
 
 	REQUIRE_THAT(info, stringify_matcher<::gpiod::line_info>(
-		"gpiod::line_info(offset=0, name='foo', used=true, consumer='foo', direction=OUTPUT, "
+		"gpiod::line_info(offset=0, name='foo', used=true, consumer='hogger', direction=OUTPUT, "
 		"active_low=false, bias=UNKNOWN, drive=PUSH_PULL, edge_detection=NONE, event_clock=MONOTONIC, debounced=false)"));
 }
 

-- 
2.47.3



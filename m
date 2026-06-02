Return-Path: <linux-gpio+bounces-37781-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL1BGlmMHmr0kgkAu9opvQ
	(envelope-from <linux-gpio+bounces-37781-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:55:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E497629F72
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BE6F30A9A83
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 07:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E564B3AD501;
	Tue,  2 Jun 2026 07:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRUAYJu2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i/DYHI5U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FC82882D7
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 07:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780385863; cv=none; b=lS+vVLJADPKUBRdeIkwaySSiFbIPel6ahRKwuHQ5mi7BFfFxHvWSAyThaXa1XDa/ojHiSO1sk4MTAVmY+Cd8uZZuhlP1/JG8ewNwfGdOeRqHVgsSN8AgA9A0ijcdljr48YWdADU7IL6mwHhs4f28PRHtFkhQaRHzroLvMUEKW8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780385863; c=relaxed/simple;
	bh=xozq7BsKugDnMmjyOj2yf+dQ2T/F58pnD4I/5ehKsLc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FwAdJtcZKNHYOyPx//IPRpT1aFg/jS2GhDKz1Ict2ZLU1YLUEzwAe/aYpTowGKWagu7sZvfV0lhTuAvgoetyak7VjIQDFqSCv+jR77ZZRX81Zp558BS8Q6L82El006nwsRCoR2SkEhP7rIQ1IQY5L0p4hPR7SZJFCNenFJ7/rYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRUAYJu2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i/DYHI5U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65262SLJ2688155
	for <linux-gpio@vger.kernel.org>; Tue, 2 Jun 2026 07:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0Q1rrHJVzdkiNYPpidfLhF
	rBAoSI6u7oS6kxDGx2q7Y=; b=VRUAYJu2tmORwd21o9yvLnxS7iKXBXUabdagZp
	S7k+h4JAuUn2gL1bf9hIoZ/9L136UeVtnDVfORr0XhxclNpLAWq2Tkr27j1aHQ2X
	Y4Zopxt5QmA7s1OBXwr2MsvHZ0g/Z+96QqjJwA3AyrdvFFSkc7Oxkxb/GDGQk1LB
	DkZWuN8fH81ThkxmSOK3NW6VZ71uJjDAyUdvywpa+NsrReAasagQcDIYeqNgs9ZH
	BHYxRHwUvhlJnNI9SgQ4NnjqywC/CrEMLmwl6Adgu5Sl2AyRsSyY0MuCAPVJq+Fv
	RTkbHXrChGW+B4qiLx3gCHpTDfM5q8OJA94QNCxavr4j0/yw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsja8c6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 07:37:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516cde13e8cso239649471cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 00:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780385858; x=1780990658; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Q1rrHJVzdkiNYPpidfLhFrBAoSI6u7oS6kxDGx2q7Y=;
        b=i/DYHI5UEQAg5dCutXeLJsZJqSSf6TdS9aalspgQ50lCPkiZmpTSpo/cvRzKS+5F17
         J7v4iTrObc0LmCKGHbShPXsZk0uxrWrbtQaoOuvKdxPEh6po+BGGrHj6H8XPy4Ald410
         apwX0Fef81LtZTr7UGonyy94bJ0dS/OD6WKmw8WQcKs8JU55F44lcI/fIjndDol8AZrp
         nm2IJvOtYWnjpk5ZRdU5zRwISKAZDxi1mqVeRKXDmMbd56hACSbcvf3A6KfDEqtHS0Cy
         inY9QmDKMKFRjKVlA38adr+U6fW6A56Syf0UAbhcHl5vM/NALc4ErZPWiqxlbC3f5xya
         EFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385858; x=1780990658;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Q1rrHJVzdkiNYPpidfLhFrBAoSI6u7oS6kxDGx2q7Y=;
        b=olZbq9+9b8aAOkwmMXf0snAcl3/b5z3BHVErN7oOE61JcDXOeU0cqnc1Tz8cPsyf5P
         ZV1qeeQOpu8bhghCMYY+ZG0YfGlNISvZHGiO4jVcS0OdhE/D8Ui1NneVjukrMZ0BXl86
         Ddg4d4nqqlhL2eDg3ww9NpIqZdSzGsW2golwGcdgQ05sk40btK6PrZhSLfQ1IpbECfyK
         w+xaa4lbikK3G8T8iXT+ZZ14wEqACD6jYXF9gwnIwf2d3h2JcAMaT+eEyFH7JWqa9HP8
         Hq4zP5MBR7zEF/oOs0bH9TqBsqgEmE3uOF/007UayIjP47CGWioGrASEQW0XfEZO4qie
         QmBA==
X-Forwarded-Encrypted: i=1; AFNElJ/HnsgOKqwptcLSorTulP1ciUWFvX2tc9He602GoMXsmo5WffNo9Xuy/NnYez9HJGhVTIXpA2GmgQhE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0wF5LnCXDGSdAVteU4ierHIEx5/1IePWUC+8PhqySwJ0bxBnP
	8cM02my+sF37zyEZUYtdhZkcOboaSUt1Yg0kFMCIM16Fg7xD8OeH2IBGq12GvSVjnibXX2cPLMB
	AA6Xt/Qy7RwUoCqShfodZ+I3kVubpotSX764eQkbJTXRBod75p5eHWOloydkq7mb3g825Lzh0
X-Gm-Gg: Acq92OGE0koDsY2vYzUCKFf+oYEDv9daEOBDC85F06zTm6bxsZXK0vPrnzsKU+laxz2
	qYMpc2IDiZu/mJBZpyiRmrOIyDM0aZ7vLECtHr3GZhhq8GmAKAW/JQXJZ8CE7y2Dy6bQpQ5FlVM
	HF6D9m4WMaehKy+MbSvAm6qdrcMBa1eG2tSCZc5DpTI1rG7sEV8WR95wl96pCy90537tfm8YgCP
	Z2/E610b6vpG/xCHqo8ijpb4gry82b5pFeMax+diqK516NA1rDrN6rKrF6cEhM1ylsd7WWKZcRq
	35mIvtGnUKSTJytGjpDUT+qOmxMoTeXFZQWvjGdLSG8nuqLcPLpcPeTD5GAz4Tu4hlSNzlFaNSX
	lLK9yRDT8ySJ3O8L9CpjQ2oZb3Znu+kKDZzTDxv2PjqlMW1fQiTwROcDnBww2ndFqw+Eyxnk6zo
	fOgfdfCIyjfTB6HQ==
X-Received: by 2002:ac8:578d:0:b0:516:e665:93e4 with SMTP id d75a77b69052e-5173a766194mr210825821cf.25.1780385857941;
        Tue, 02 Jun 2026 00:37:37 -0700 (PDT)
X-Received: by 2002:ac8:578d:0:b0:516:e665:93e4 with SMTP id d75a77b69052e-5173a766194mr210825501cf.25.1780385857431;
        Tue, 02 Jun 2026 00:37:37 -0700 (PDT)
Received: from brgl-qcom.local (2-228-54-83.ip190.fastwebnet.it. [2.228.54.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e20bacsm45994245e9.6.2026.06.02.00.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:37:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/9] treewide: an assortment of pre-2.3 release fixes
Date: Tue, 02 Jun 2026 09:37:11 +0200
Message-Id: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACeIHmoC/x3LSwqAMAwA0atI1gb6EVGvIi5sGzWbKg2IULy7w
 eXwmApChUlgaioUuln4zBq2bSAea94JOWmDM643vbF4FUKHHjd+SDBSiJuPqRvCCPqo/qDLvLz
 vB8nDcRFfAAAA
X-Change-ID: 20260601-pre-2-3-fixes-cebcf3cd48b9
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1827;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xozq7BsKugDnMmjyOj2yf+dQ2T/F58pnD4I/5ehKsLc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqHogyht/Zdc8RDkE9Gdx6DkOga+DKSs8eTrzWT
 clYo4a3aqqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCah6IMgAKCRAFnS7L/zaE
 wyutD/9c+eKxcbpyFqO7BBtLSZ/WTmNAvjFofxBleBMmIxaciAyjX/LPhUrZmPYJOZCrR/ZF8uo
 6ZYPAOXLfE3XIUjt95oSUep63UH2hKbvFruhOvxP9AhIk1xrw0KyaHt8GzYjSpy2pMVUNSd4Vy0
 OpkgklscxBw6D2usez9nObJ8t1IMbDCHM4+LI3fNaVALyn/5rppx30RbS2GTlqWdcx/43TBwAyS
 JWcLFso2Bz+NDGVqBrykLSm+CuszAcxH8WdMODsjJBiNWZwjJaKjKdQYufkn6DwIDXLp2hoV0NR
 fl5Pk1A2ueZZDaZY71PM/ezX+iuLh5YMNngn7XU91BOIRaZwEToOh/TN9cyWRAPlFKKHIVW14mo
 Fpddq/MJuVPdGmSfxixwEl1I3/ANbkIj3tAaCvPaqSpBdDBC0LATUkF9LFSR1tPWAjXW2gW7cUU
 6Y6r5YkTrLTpvhDObSdbIMO3UW1PnJM3xXofoJ9SoXzw4Ksn1QHkzECFiVr04HAsGnjY3EHW0VD
 r3FGJMKBF1YCobvUa5Az8unQ85mB6pvk8njPVAwpg7ui0UTA/y7lYsJ2kxdo8EHfxtQBPba3G8B
 IBXkpWQ7a+N1ApVE7Q1QE1KlzlkOxQq1Ksbom9yVa8zp+wOKXugBfLPkGMEoG3qtlSK05Nb6WJR
 nc57JwuZ5wRB9zQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3MCBTYWx0ZWRfX17MyFDirWjK6
 ADYUgl5z5h2gpCHh7o/7UYZt6hnTPPMOajoCC3G82la5/ncbfMvlk/9OGvMB+/k573qfxItbrdk
 qcZXwTc/z4tuC7PHhGF1WDJkrG4vBRdWlhrSYrMu/Vb+Q+LQbtWjl3lBlTpgA+kQ7b8ofGGw+l5
 F1XwjOlzI3HguNOtZ6RUzuABUA0uRmf1AsAIFFtH/j7NrkGzm8B3E7sJJUs/YMyRRMxCY2UCbIH
 FhOzcXQwWhbqahkQjj8IoOCbDV1MZvq/WAHc9JLE2umS/5k75xvVFE4Z9ze9n2EDNna14wq4HC3
 Tp1zLrMZ/Ut4OWoiXRhKx9dVJIWblVz1fXALTQuU/b+HuHPlNn59LDR/f5DJ3QKSFjQzMJyf8Dg
 yE4wLnTrojomV0rGMIUd+tX+sME0qGp2aet05rBi4GGStuzvj8vhwxZgUCWj72ftaUvzOjWPLEh
 4Z69HqSDqb5caGa4ZlA==
X-Authority-Analysis: v=2.4 cv=Ld4MLDfi c=1 sm=1 tr=0 ts=6a1e8842 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=F4J0OHcPalsv3C1teIDEwQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rrHu9tWzE92nlbeFwxsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 9qrzwjr7q34poDmP_fZ8oT_6YizfcfrW
X-Proofpoint-ORIG-GUID: 9qrzwjr7q34poDmP_fZ8oT_6YizfcfrW
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37781-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E497629F72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I'm preparing to do the v2.3 release and decided to let Claude to look
for issues. It found some interesting ones so I also let it fix them.
Here's an assortment of AI-assisted fixes with my oversight of course.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (9):
      core: fix signed/unsigned type mismatch in gpiod_line_request_get_value()
      core: replace strcpy() with strncpy() in gpiod_request_config_to_uapi()
      core: add explicit NUL-termination after strncpy() calls
      tools: gpionotify: use the parse_config() return value to advance argv
      tests: gpiosim: remove dead container_of() assignment in gpiosim_dev_enable()
      bindings: cxx: fix consumer string in line_info stream operator
      bindings: cxx: drop redundant class qualifier in line_request::set_value
      bindings: rust: avoid potential panic in gpiochip_devices()
      bindings: rust: implement Eq and Ord for chip::Info

 bindings/cxx/line-info.cpp              | 2 +-
 bindings/cxx/line-request.cpp           | 2 +-
 bindings/cxx/tests/tests-info-event.cpp | 2 +-
 bindings/cxx/tests/tests-line-info.cpp  | 2 +-
 bindings/rust/libgpiod/src/chip.rs      | 6 ++++++
 bindings/rust/libgpiod/src/lib.rs       | 2 +-
 lib/chip-info.c                         | 2 ++
 lib/line-info.c                         | 2 ++
 lib/line-request.c                      | 2 +-
 lib/request-config.c                    | 2 +-
 tests/gpiosim/gpiosim.c                 | 2 --
 tools/gpionotify.c                      | 4 ++--
 12 files changed, 19 insertions(+), 11 deletions(-)
---
base-commit: c0650edd4417bcb74e294ee2a1dafdc6ea594e9a
change-id: 20260601-pre-2-3-fixes-cebcf3cd48b9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>



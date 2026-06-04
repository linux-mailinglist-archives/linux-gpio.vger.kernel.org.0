Return-Path: <linux-gpio+bounces-37926-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dV4SL9guIWoJAQEAu9opvQ
	(envelope-from <linux-gpio+bounces-37926-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:52:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 790E263DC50
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:52:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=moEbX6oT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Dj97uvZe;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37926-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37926-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B80BB309B0AB
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B32E3D1CAE;
	Thu,  4 Jun 2026 07:48:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A853CC9E8
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559315; cv=none; b=OAU0IQD60DlmbU6eX23U20EII0FTFY6zBeuKoAUic6wbiwC1vzYhwWjxNqlzwuZCAetK5eUV4B3zAkorTPBKlWl4BewTGw/mE4bFm8bSCTI58wWct/3wzemZKixaKDqi866cVBOmElh6QcD5/JiFFU0/GPrr3TBmg3bQxUjjKkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559315; c=relaxed/simple;
	bh=A7LLCJB0BYyrDsz17AsgMDjjIN1piqdzzSvzvQB5M3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gb76TCIMs88PnTCgwTtyZr9WaAFnakTcBQW3I+QV6MJScg1oY3V7xMQveUecxbauM+23TMtQxuDDthCm0kFjuFVZAAh+Z51EEX8ImC7jed0FDSiCBK655HFQJowd2a0aDw+5pQiDgxaUvc7fHb3LztuSEp+wnq+/3kdtupvmowo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moEbX6oT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dj97uvZe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6545QAOW995280
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ATDQZ2zKXbNhATB7+bfWcBN5FoLE1MRXCHCl494gx94=; b=moEbX6oTAvWhJkku
	shHvI2RRp0gGGX6t3zz4w7FWjNDbDERIxLnNy9l/drc35TMP/s7pyx1PTZmp2Bj4
	PbUV7+q58uOR3uGNX6Ig+pAg+eoa6Vwo+XkIbFRT75EWZo9/2rn77vdHZxInzv21
	CqYVecZiwxkLXo+uZBDcnQT01xKpyWnygmO3ULBasFM+EiO0DxQLZ132jJSl4/aD
	Uh6LeAM4gW7eIQrTiLkAN7UrmQkuYwiaaUth3S36dQG+2W9SHYmJOxCboPbd1ga9
	f5q58nP1XUD8XPzj4h7kdwcjIA4BOE6fgntiML5qy0sjcX+p8e59sS+OK+dLC9dT
	4arNtw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek374rfhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cce1de2519so6736216d6.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559312; x=1781164112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATDQZ2zKXbNhATB7+bfWcBN5FoLE1MRXCHCl494gx94=;
        b=Dj97uvZeU0Z0b6gL+zg4vxaict3l7SY+4q5pE5pgZsty2bfmH8ndpolw9LcBj1V0Ih
         BrftvPYeO28UBttmWcLcqOKJOhUCnCddnjnW1TE0VVQnDSfeOHqD3csjO7DLgrYa8zjs
         emgGolY/Is0vBJuC5zvQGFoFk2TJP8gk6+yHLcrb1ULdygrCY4/oKfxtkIsNrtKIR3v0
         qpHXtQ/Nq+8rDV/NZHqD+sjN0twUICYtdQjUJd3MSDcCoStGsSVr5NsPFIW8QW5XAlgd
         VbdYNxMSL8zYhC30cZCkEYF1RVv5BchGT3L5bvQ/pIUL1x6/xrWpN27JU9abtu46cGpr
         kBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559312; x=1781164112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ATDQZ2zKXbNhATB7+bfWcBN5FoLE1MRXCHCl494gx94=;
        b=Yhad0YmJ9LbeMyhPPHoFHKVqaFjl+Mqq4Co7b08NZphrUezEKq6aFOWNIl+61QnmNO
         8vdCKFyvehcA4zxLuSqqIN0F30FcOoff0sJZ6+9S5g29l0gAl1eAhInPYD61mxsJLIJj
         gs4WY0d91y0MMRKxdCYflRKZ8I8aZ0b2HU2FhOFrt1bpUwdL7jCKllnDDI3IUgwNhcJf
         O/YAQmQBilieeo/ril/iQmUjhgGeJ0qU/uEZUb9aDOk8ajmYZoi1/afUS+eI193Z1ouD
         8m5ypBKLLIxsmZcthvdy0HNRW6uDWGMbx/RBDpsirzXc+/yD06IHTEefzgED8K6+sCKE
         7fag==
X-Forwarded-Encrypted: i=1; AFNElJ8U900yGqabPtygxth/KrNO1vf/T8SsngPouNNk5AetQYuBLp9+gBmFO/umvgUM+7DOHy5HVEwv0Ruj@vger.kernel.org
X-Gm-Message-State: AOJu0YxInyBYqql+qUPZDbByxWTpOaFJI69z+9tXkFStwEb4zuCedOhM
	crUdK+YPPdIOAgCAB3ZRjkbRU6Ei2NHC6d0bayVp6P5KEDcT92SgQVBnCg1k20eIUD7mDvuU2jR
	/mCvvU4pXwN2+p6JMMHMv0ktlUv0xN4YuH3LCuUevwVmNSw+zjws6yYUUo1k1/Jom
X-Gm-Gg: Acq92OGqFCO/uY5ssxIZCCseCUAwi9ih4mLCrwP2XJFkyzQPEIzgTzwnw/2c2TuezD5
	ZlqeRLe91rH4gEnfptkdQDexJ39MoeTbbNpwMN6ZRlQ2MVqahjrklb8MQG2z2bshv/5kBZqIxsx
	WIUQuf0PervUyS9jmufpeM6FzXGVfD6pE4jKJn2N321rJK3c+chs7lB75qGnVvt3DlhlW1cYHHE
	15vaqA44J4qzgPKgt3doxfmgCpurezMy3cfxGjo11g58bGi/5XX+gOgSbYgno4ZdJ32bGWZfFug
	8hxbNZvO20zILJaIwzkfj/BEesuhO+Hl84MKICLihdLCJrF+sLQ1wEz7Lo6JHgAYHReluxjQadA
	6FL+pL7QvHKC5Xs515rhO3oSkqnGBmB/xb00fzlJIKUF8NK7dpmTs9m/CB2bEZZnvOu5lfMOVLL
	g2t88fVLI=
X-Received: by 2002:a05:622a:8893:b0:517:8528:e617 with SMTP id d75a77b69052e-5178528eafemr50403501cf.3.1780559312242;
        Thu, 04 Jun 2026 00:48:32 -0700 (PDT)
X-Received: by 2002:a05:622a:8893:b0:517:8528:e617 with SMTP id d75a77b69052e-5178528eafemr50403351cf.3.1780559311853;
        Thu, 04 Jun 2026 00:48:31 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 09:47:51 +0200
Subject: [PATCH libgpiod v2 08/15] bindings: cxx: use get_mapped_value()
 for all enum mappings in line_info
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-pre-2-3-fixes-v2-8-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1911;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=A7LLCJB0BYyrDsz17AsgMDjjIN1piqdzzSvzvQB5M3E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS2yjJw8j6sUs7VmjfGr2EoHS7wXvEybSgIVn
 LSpLHam6QKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEtsgAKCRAFnS7L/zaE
 wyGPD/4hxQXBkHRV+MOX1q6Ej1MXk3dl7WfT0TppAqU3HbkMehQYa7Wb075YDnKwuBUxhgFSWRj
 wqIK6dTyQrP+Cx8KmbI3JsD2yjsMrP5uXsHEt7xo68ZeSIYOrzVjqxBShxo0OoiOQm4VxLZC2q8
 gFHZ03/1rJ4UUCADM5d9MZ/PcZl6iu9XQdkGpejYEeM1u4MfRs0619SfFK+vTh9pOnE0YETwymp
 jiRlnsTFfh/bLg1xpl8p+edleTBTIoSJOG959zBIKLNW1SynfA271The6Cy+316F3ThyZnVuNT5
 a2TFxhB+Gsyti7uqKIowM6XwjEbaytiQkXV5pnaF0lV79o8N9cwCAChQp05IbQdU4/AR0AR72tv
 sLmYd1SxPotrxFpvlN8F+F/oj0/4FZ9DZP46TJnzXgTEgbzFlYiCJjJctreedTRRRgHL8vSk5ku
 DCG4XWQoSYb5zK7rnaAF79q3KVJ1/H3XyG1xhMUHTGBlzyhS+7jb6gS8Ep4NKZglcO062nTovsk
 jtH0qkrJFBqRKTOB9yroB9W62eYPiFlFKOgpaOEcIBx2y5UrEV6Vgu7D+drBigelYvU/TXKpjoT
 IQay5PZWFGApSBkdzotzDQMk+CFZGdzhGiLLmhvfwEHdRz6jw4/EzjQO35H2AsfpAMYAg5LDslq
 Dj7Ii/fJ9jY2P7w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfX5qjFEq6nJMa3
 XFTHr4B5Gwn82Ock+E3z1mAPyMk00vJfPvkklaZG4S068vJI0HvUBbuPrfBRyYSwBLd7A5llBkH
 IJN16/Vr6VYcq5dPvRtndZCQeNNHmIG4Dh+1ly7DgX7MGkRKQ9RHec0+klcSsZRd8IGHvPSeYOr
 jD7iFrm4kErek8rVXDRsKQbo3BdoN0CxBM4O3JA91AoRWLhV/BlNC2/aPnJX7Q+lvQ+A4ekk8rF
 1UBqAHv8RBLOzcVkPvYRZyHjsaK9LKRByLRTEFvf/pfGdVM0ArtXX4UwE7Ijv0WKLkFbwQNeBkn
 gb4UYIR99EOdMgJNJfRxpLwfgvmS4M4NeRTdWKuHYG9E+vPtSJJMljdewSNK6eMff345tfQvWpv
 HoXodT5EuWSN1yfNKRELVNPZwNZoCjYnEcSv9Jt0D9Cn23h7CoQbZ1uRvukrcBR6E5bmKh47OiB
 lFucm7Ymu8Z+F6Ko7FQ==
X-Proofpoint-GUID: iaILcT_BvS6rEUKgDr03NBwN3JqXlsI0
X-Proofpoint-ORIG-GUID: iaILcT_BvS6rEUKgDr03NBwN3JqXlsI0
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a212dd1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fVgsMDLgvhKUShRQYw4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37926-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 790E263DC50

The direction() method correctly uses get_mapped_value() which converts
std::out_of_range to the project's bad_mapping exception, but bias(),
drive(), edge_detection(), and event_clock() call .at() directly. This
causes them to throw std::out_of_range instead of the expected
bad_mapping exception on unexpected values.

Use get_mapped_value() consistently for all enum mapping lookups.

Fixes: 78020eae9d28 ("bindings: cxx: remove duplicate mapping helper")
Assisted-by: Claude Opus 4.6
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/cxx/line-info.cpp | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/bindings/cxx/line-info.cpp b/bindings/cxx/line-info.cpp
index 5e55a5fa8f18d698514d80f3e3891c091e5332bf..7c41753628ae4aaa69cbc967273203e9305edfb7 100644
--- a/bindings/cxx/line-info.cpp
+++ b/bindings/cxx/line-info.cpp
@@ -126,28 +126,28 @@ GPIOD_CXX_API line::bias line_info::bias() const
 {
 	int bias = ::gpiod_line_info_get_bias(this->_m_priv->info.get());
 
-	return bias_mapping.at(bias);
+	return get_mapped_value(bias, bias_mapping);
 }
 
 GPIOD_CXX_API line::drive line_info::drive() const
 {
 	int drive = ::gpiod_line_info_get_drive(this->_m_priv->info.get());
 
-	return drive_mapping.at(drive);
+	return get_mapped_value(drive, drive_mapping);
 }
 
 GPIOD_CXX_API line::edge line_info::edge_detection() const
 {
 	int edge = ::gpiod_line_info_get_edge_detection(this->_m_priv->info.get());
 
-	return edge_mapping.at(edge);
+	return get_mapped_value(edge, edge_mapping);
 }
 
 GPIOD_CXX_API line::clock line_info::event_clock() const
 {
 	int clock = ::gpiod_line_info_get_event_clock(this->_m_priv->info.get());
 
-	return clock_mapping.at(clock);
+	return get_mapped_value(clock, clock_mapping);
 }
 
 GPIOD_CXX_API bool line_info::debounced() const  noexcept

-- 
2.47.3



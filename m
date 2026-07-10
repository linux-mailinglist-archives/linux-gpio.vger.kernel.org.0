Return-Path: <linux-gpio+bounces-39827-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZkYSLgf5UGoM9QIAu9opvQ
	(envelope-from <linux-gpio+bounces-39827-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 15:52:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA273B6E5
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 15:52:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RA2og+xL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Fgso37WS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39827-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39827-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E341F3028F78
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 13:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26226223DE7;
	Fri, 10 Jul 2026 13:51:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9D7229B18
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:51:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691513; cv=none; b=kznsgmBbu3ZBbWVSKXy3hd7HfNpMefupjYVZE0i1rNhExBAWU2RtXzb3DbUlIU88QNaALEGGz4Gaa2TR64HE37W7u8ZQXL7DdDxnFd7YW+UFqu2JtW1fcnQO013Ns8ndnslxCxtuj9x6QwiL6Bmge0Aqv2kCd4DwLg/u2WtVuq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691513; c=relaxed/simple;
	bh=lZbgNGsMr1suEXSQ3AyujBAwdJTKYOJyzKWDmgEJ74E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m96yECt9NhGhuVRoSZ7Rh/eaabKDaPJGgGF0i0Xt9KVpzRfqw6QIShFU5Mu1SI/TFEk3XXcYF6lKpliGteJnt4S2eFPI4qnMEvAIVb/bw1n+gIgPXeOOBphxqZPjB5HlxEMfMRRQsmyk8mcsBeC6Bd/OtSErrra+gCvf3WPWpQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RA2og+xL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fgso37WS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD7GsD923969
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JWLLs9BtcGkliFw968AXZYd7Z9KZJ1rY3dzFwNebIQ=; b=RA2og+xLRgSRyPVg
	zTPD3Q7Alsas/rV3Nj5mzIdr2zbuQgV3YurxrTFeDcd29OkdcEv3n2oj3sEouLUP
	havGSfU9kriXvbnf511wEtb47d+tcnPAuhnfZ1saLk+5vohjdQswuQ5sFban+XF4
	HnkWp6MImJkZovm+2M2nFY+CLoN7LQJc2Q/TGmEH6go0f4uWhLktCwJo07BLhq7n
	O8/L8p+wtF1TkSrY4U6gq/iSX336zuf++Z3uR0X6eX+exXadgXqF+ihUxBlucJyl
	SdFRBGZpQ5JM2COOKZp7hcLxEG65Qb7BF4KeVpagHNzUfo3JM+AdNoVC9lFbrZTr
	y/Qs1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fay3e0nhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:51:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0f0a0760so18494521cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 06:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691510; x=1784296310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JWLLs9BtcGkliFw968AXZYd7Z9KZJ1rY3dzFwNebIQ=;
        b=Fgso37WSMTWxXbFMxeV1dyS2jzmKxuijZdbj02QmzLTPO8Z2vbvVxouWm0raY3j32e
         1rBPMsjOuR9a+4WcqbcpRrUqiCia31hPXSmJfjnkUIwMnF9/aAsgnRWPMG6bDpUKaXjp
         Ti/HF+rPo3BE/CypdpOO99Ficzm+2VXolxOJl8mmpAKfMTNMvOClOrcWEu/+zuh5xCYf
         ZK31onvMtemKY5yJpWT2iCQh+ZC+tBPKPTlujSHvTSQIb++8PWvK1kxmofEUjsywsHZp
         udikp6Z0v4Fdn/hJYSWXluu7PYd3ulEOOi1Rk4DrRbZP3L1YZ2aEe2yjcqRd5p5FHwF3
         M9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691510; x=1784296310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JWLLs9BtcGkliFw968AXZYd7Z9KZJ1rY3dzFwNebIQ=;
        b=VEiR5oo067Rogo2JmeimHx5f9phoC4/zct191SaJI21gbXFqLMQ8ausNW7vSH5lypp
         0So5iGUsKjfVPQ81lsNFzwh12RZJ+cf2qHlvF6TlFPYx+qR7bzSgaBsEfQyKXevJc77t
         HV97bhJEDQ7PS6lBwZAqltk/KhWAxOzgQ9jof5rM7ultH1CmjOsxOvBq4jowPlq7d1k/
         HvxO/U43YqTKlHRun4a2PpYtJ1+D1ht5b7QjcWxL1SyEmBAyENhgGiES4NQtYIApNndY
         33KzFOvFbV13jX3KVLNtWYMFkTXMSM8X7hRMPV0L4gnbx171phO/pWuGyoq72/2aYSLH
         auiA==
X-Forwarded-Encrypted: i=1; AHgh+Rp92Xa4jMNEqJMXsfi+y72K4wCfORI5tsauw2AvIqXqJ7uvAiznxcI4Fb843J6bbcBKJAI3WKSLQLtz@vger.kernel.org
X-Gm-Message-State: AOJu0YwDzrfNvFBitAnFD7o5moJ/RouSTZYKAaJYhemfKbsQBZ9RZ8da
	q0zSaGr1fFhYpLtDkChbmpx2OzuIbVav+oHQGlkbLX14slULMLKY320YW7xRhVpNcI+KtzNZ+tt
	qYYMC9j/p6L2UuF02Uzf7SjilWQ/8RDyj4gOEKKHsoXUN741gRDOYhLmYcr/+Va6/3stXeXgY
X-Gm-Gg: AfdE7cmawQqsteyMKY07KH6VRJXB77C9+HiayUTDsJqKWNS4GW4AaxPyVYKapSOa5nu
	2bph5anEJ5+qUmgZINj53p2uuIHmVGXjW9A4EvPy6Wz4+qOxPxbDVY2HAiwlarhUPqbCJNujLyu
	JAcBSmA2J4aWQMJC3vwzfs3E0oHFNoVK/jnyA/jo3oJztCkl9VKm08X4WxwQnU7iOt9IPYuHt8q
	4ymwrAK4Ox9ZmWg6mxDH1H8Ii9wuhmI38pRm6RdzVrKUMkEyyAbPvTazqjPraE7fXLyF1Xw/Uz0
	2QZzcWtJto+P3KclnGZV3+0LzHLdBnklWUnu79PXcNFsAkevZyPsk0TKVqdsWZJhecHRqUByK5z
	/JJemi5RUIaGIvDFApOWPblE/9QJoGZtO8pldaquh
X-Received: by 2002:a05:622a:a19:b0:51c:f4f:b3ab with SMTP id d75a77b69052e-51c8b3e1115mr124547801cf.20.1783691510126;
        Fri, 10 Jul 2026 06:51:50 -0700 (PDT)
X-Received: by 2002:a05:622a:a19:b0:51c:f4f:b3ab with SMTP id d75a77b69052e-51c8b3e1115mr124547291cf.20.1783691509536;
        Fri, 10 Jul 2026 06:51:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:adb6:d740:6427:4097])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm135669295e9.0.2026.07.10.06.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:51:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:51:20 +0200
Subject: [PATCH v3 1/5] kunit: provide a set of fwnode-oriented helpers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-swnode-fw-devlink-v3-1-993f31874e40@oss.qualcomm.com>
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
In-Reply-To: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5500;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lZbgNGsMr1suEXSQ3AyujBAwdJTKYOJyzKWDmgEJ74E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqUPjqhaf3r3hunJnsOhObP370tJrRM3UlfcrzO
 P5o8t6gylCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalD46gAKCRAFnS7L/zaE
 w7fOD/4zozcQZeKb5hC0d6O0OxIfxtJ1oXFphO9JfYcsJbDGFRE0oCxSme5Qa/FLFYYE9FcSG/l
 +2XQCAVy5v61CbQtuQVy7SWU7NGCq663qlkzr7/hdfeXYtHHzeHloeJDDOxyGzPvskuK88DbERA
 es/mOWcirQvQ1YDxXnW4pAHQUOntQQTAipMT/JwPciLxGv36sUD0LpbMiuUtqt+VYU+xM5v+ClC
 fmM0DfLfrR2E0t9QxcOZJfxhId5qBzx95NGPtRl55q+fz0G4k39lUIYCydniKX0uHenrkodJ4WL
 XpQqgve2pFj6b5ObEVRzrjDSOFh4pT84gBSpsF0aKNhi6GDbySKP2bsyyEIvG9tyn1kTwcEwj0J
 07VlT6lDMRHI5eq4/iZNrpFnu2u/noxJ01uBejo2gCOkKzxuimAnJffc0teOyc6BmisVbRHAB3E
 lXBYbbe7DQV2dqhkxTKTuxiTfpv5wx/woD87xwQ/diGdK3MdgIL+oy1jKMkann/RNJ8RGsKS7JU
 tVoFdlvmj5hMokwh2tmMR3qbD8SdtpA3p3COpSQohIIO72BtRJGOnTiH316WyABtzgm3tpRJz2n
 W9l2uKvhpN1KRBfnCCjMLqxPePw4ZXYcYHTwyq7uY8jysrfmVxgpM0CCmrHK3Kq+GgHJtJkIT/X
 rqWMXCoew6GHLeA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX3EEVy6Tz/dQO
 8Jf8dA0314atX6e22U2IpkET0Uj1qWROQXmDVK6z6syIgdKyVLgTdPJipPGO3YTaVd6DuUsvL+o
 QIHDCMFCuL1P8AYTFEpA1eYsfkJ62GU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX7yXObPIcFg1z
 RMFAAIT2tAZZVbsNfHYJn61e5wt3D3jjRqEvDhM6OMpGZ/h/gjlbXGyTCd4867XKrlZORO9o0hN
 8IRn9lQBWH6OmN2LgKW7+uCzpzG894HcU/iJ/mkIYpPIJE9ZxSVZvstByeRnVYJ37oILehIphML
 3R3UHk4skAtqHIXdVmQy5cn3nwngdQzLS7CsJAtwgDg1yw24vTKv7rCf4XC3ogAAmH6r8988Lji
 p+Hq1NrpCEibTR2llSb8HF+mo9EdT0LgWxQvQ6s8EFN4+EDlCYtqTAOeZBbo/C7hMJUYyiYBDFC
 1vnB+7b+G6BQJzrFuZk7Ie2tFJ/nLIx5o9kwk1xNALdnOiifspXDt9x4x4REU5K1+aEXFS+d7vv
 ePU583LnugDMdrIHQuOEoqcmwojFQBJLeNHVyf8Y0tEasl05A/yVlafpx7swya/DS8g7tf0+pA6
 JE0UXa19XW4UaDGK3ZA==
X-Proofpoint-GUID: xYObkhzRRIBo8vevOXuMtWxCjLXIm3Dd
X-Authority-Analysis: v=2.4 cv=HqpG3UTS c=1 sm=1 tr=0 ts=6a50f8f6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VSMHv2xdrKP6GTymTuoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: xYObkhzRRIBo8vevOXuMtWxCjLXIm3Dd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39827-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20FA273B6E5

Provide three new kunit-managed helpers for test cases that need to
register/create dynamic software nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/kunit/fwnode.h |  26 +++++++++++
 lib/kunit/Makefile     |   1 +
 lib/kunit/fwnode.c     | 116 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 143 insertions(+)

diff --git a/include/kunit/fwnode.h b/include/kunit/fwnode.h
new file mode 100644
index 0000000000000000000000000000000000000000..239bc71eb5072ccead0beb51fc0882bab69c6877
--- /dev/null
+++ b/include/kunit/fwnode.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KUnit resource management helpers for firmware nodes.
+ *
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#ifndef _KUNIT_FWNODE_H
+#define _KUNIT_FWNODE_H
+
+struct kunit;
+struct fwnode_handle;
+struct property_entry;
+struct software_node;
+
+struct fwnode_handle *
+kunit_fwnode_create_software_node(struct kunit *test,
+				  const struct property_entry *properties,
+				  const struct fwnode_handle *parent);
+struct fwnode_handle *
+kunit_software_node_register(struct kunit *test,
+			     const struct software_node *node);
+int kunit_software_node_register_node_group(struct kunit *test,
+					    const struct software_node *const *nodes);
+
+#endif /* _KUNIT_FWNODE_H */
diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 2e8a6b71a2ab07a738964a7ef0f442fd53e085b1..204e02b10eba1030c6d511991fe2f6271de64603 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -11,6 +11,7 @@ kunit-objs +=				test.o \
 					attributes.o \
 					device.o \
 					platform.o \
+					fwnode.o \
 					bug.o
 
 ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
diff --git a/lib/kunit/fwnode.c b/lib/kunit/fwnode.c
new file mode 100644
index 0000000000000000000000000000000000000000..332490f07fae78e0fbf2930f9c80da0cc7dce028
--- /dev/null
+++ b/lib/kunit/fwnode.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <kunit/fwnode.h>
+#include <kunit/test.h>
+
+#include <linux/fwnode.h>
+#include <linux/property.h>
+
+KUNIT_DEFINE_ACTION_WRAPPER(fwnode_remove_software_node_wrapper,
+			    fwnode_remove_software_node,
+			    struct fwnode_handle *);
+
+/**
+ * kunit_fwnode_create_software_node() - Create a kunit-managed software node
+ * @test: Test context
+ * @properties: Properties to use to create the new software node
+ * @parent: Parent of this software node
+ *
+ * Create a test-managed software node and return its firmware node handle.
+ * The software node is removed after the test case completes.
+ *
+ * Returns:
+ * Firmware node handle of the newly created software node or IS_ERR() on
+ * failure.
+ */
+struct fwnode_handle *
+kunit_fwnode_create_software_node(struct kunit *test,
+				  const struct property_entry *properties,
+				  const struct fwnode_handle *parent)
+{
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	fwnode = fwnode_create_software_node(properties, parent);
+	if (IS_ERR(fwnode))
+		return fwnode;
+
+	ret = kunit_add_action_or_reset(test, fwnode_remove_software_node_wrapper,
+					fwnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return fwnode;
+}
+EXPORT_SYMBOL_GPL(kunit_fwnode_create_software_node);
+
+KUNIT_DEFINE_ACTION_WRAPPER(software_node_unregister_wrapper,
+			    software_node_unregister,
+			    const struct software_node *);
+
+/**
+ * kunit_software_node_register() - Register a kunit-managed software node
+ * @test: Test context
+ * @swnode: Software node to register
+ *
+ * Register a test-managed software node and return its firmware node handle.
+ * The software node is unregistered after the test case completes.
+ *
+ * Returns:
+ * Firmware node handle of the registered software node or IS_ERR() on failure.
+ */
+struct fwnode_handle *
+kunit_software_node_register(struct kunit *test,
+			     const struct software_node *swnode)
+{
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = software_node_register(swnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	fwnode = software_node_fwnode(swnode);
+	if (WARN_ON(!fwnode))
+		return ERR_PTR(-ENOENT);
+
+	ret = kunit_add_action_or_reset(test, software_node_unregister_wrapper,
+					(void *)swnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return fwnode;
+}
+EXPORT_SYMBOL_GPL(kunit_software_node_register);
+
+KUNIT_DEFINE_ACTION_WRAPPER(software_node_unregister_node_group_wrapper,
+			    software_node_unregister_node_group,
+			    const struct software_node *const *);
+
+/**
+ * kunit_software_node_register_node_group() - Register a kunit-managed software node group
+ * @test: Test context
+ * @nodes: Software node group to register
+ *
+ * Register a test-managed software node group. The nodes are unregistered
+ * after the test case completes.
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int kunit_software_node_register_node_group(struct kunit *test,
+					    const struct software_node *const *nodes)
+{
+	int ret;
+
+	ret = software_node_register_node_group(nodes);
+	if (ret)
+		return ret;
+
+	return kunit_add_action_or_reset(test, software_node_unregister_node_group_wrapper,
+					 (void *)nodes);
+}
+EXPORT_SYMBOL_GPL(kunit_software_node_register_node_group);

-- 
2.47.3



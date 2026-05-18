Return-Path: <linux-gpio+bounces-37036-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IA1Gu7PCmru8QQAu9opvQ
	(envelope-from <linux-gpio+bounces-37036-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 10:38:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C91568F68
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 10:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8E703007AEB
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 08:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D023E2761;
	Mon, 18 May 2026 08:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQ027iSq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMBGNwdZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B223E314D
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 08:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779093367; cv=none; b=SmWGVpnqxfE9NNYl0r9QcpDyKcvKZn7gC7w5NMjzvJAiS+eHn4tL0ST43OzPz9TCwIZqy50pACUNyaYPbYG7yojLaqfq/t5IAT6QgY0IQHK3PWRcouTjBc+/KKh5/i1We4ZNS+ZM8P22QBjXWTraEWUtGvSxjpNbWzHKz/WKeq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779093367; c=relaxed/simple;
	bh=cm2XK+VTB2K5A5UCU/Sbyat/hDfTVPrO1ypEc/ldKa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rUPw6nCtEpo5Qj2NIV1E4czqZWAlBsVzrJdV98YVDtWlCHn76l3KvX0y5vPUlDn/k7s8+5jhS64Pkkf2emrRWX3tgHgBbqJqYJGWLaD2vnE3z97t3ff4geMpUKmVBnXMC0zcCvlzwVU+yyKEsDyLqJgH/0ZhVjCFpAE9p6564hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQ027iSq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMBGNwdZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I73btp3838482
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 08:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zfwrWW45CiP0kB61PRzH1J3ZNtiMXMniX1OD1q2OPag=; b=iQ027iSqiWD+WS+S
	nZoTk7AJi0u+34qnnoWN6pLvi4RjYTvqwGg7S5xZdUSvncfCzquuw9GS6Do9XuUO
	oOTC2gbE/m2vNaD3gxV/yFqTTOgaZkyq+qAXIT5L6huKNrdFRtwNaozc9g9p1S2l
	t6833B5x145vCaGXehRy+FLuX9F+wAI5XyEver2i+boxzZ7TYyn4+JGKdOkrjR/U
	6Fqki6+NqDanIh+g3ZRr2rWNlyhunYqw4DhR2AL77+DZm7hxTyxZZlccqHhgSsPA
	3bFBQmfNu777r8vRcveLHtBxXaGidXlu5nf+hpemcu1LLoZ6tm+h3e9iidIAYsGG
	F2nlkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7wdp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 08:36:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5165d10e036so40913991cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 01:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779093364; x=1779698164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfwrWW45CiP0kB61PRzH1J3ZNtiMXMniX1OD1q2OPag=;
        b=ZMBGNwdZuoDkwwB4gHPCGZ3Tz+yexn/eOkxw2fR7B1C/p5eImVBmssAZPFTiDNBShi
         L6BVTuIoY+SotKROI+JdFXkUh0aMgzrMzrmtoEgJNisZI4gR/CBmEfmE/GRnZfb1dRPd
         1AQu2GxVia6HSWSmYSW1z3QfffuwZ5I5szXRRopE2j9hfFaEVfuMBknq5ug68akAGEHb
         lDv5xf/PL6z/ah5YF55xaK2zIQBWSSzS5WSWVJSTF7c6lZ7drrykKmzFCHvL0OOAXN80
         tVMsrp+c8hnzWiGheTij+iRmrwzDbw8pdRIsC0Ue18XrIhpKlAhtn1JKjdOjhI66QvwS
         o6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779093364; x=1779698164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zfwrWW45CiP0kB61PRzH1J3ZNtiMXMniX1OD1q2OPag=;
        b=s8n/j4Hm2V0J3ifkQaTXE+WvWhCPBoaW2r7HEtCrvDEBpMf3Is3BlO9Wddd2O0CwWB
         NYiy9XCEGoWvVJ5ajD00sWXqwrQPKyfCIVHT2vKlFe5H//mqiPyWE9fVWWaQTZTiK5A2
         SKtevwJnoxI2El4lJW1dRTj1W/zs2bQzCG48WqLoupGQzBtuVSczYQRLP02GDOGgZHMm
         NPDxUi6z9JSwBK92+gbhTrOxtNGk2sdl/e5qyTBK3xfdsq952Eo75EJpZPda0YP6dxiP
         OBpy8uaSF2YIEvDQSQ2uB9kEX1oPojVbtmZQbBl5zpt+pvRFJ5fa75STB7f2MONOuyWw
         TDCA==
X-Forwarded-Encrypted: i=1; AFNElJ+B4DuUDbQjVX+3ZSuJ0vW5sPLiuqX8xXLj/LO5S7nAIhqlwtaNJiX1IUX5RTiTqj5cvhKrsptSXNBg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9bBASR98iiIXuw6QFEGy55u4iiBzX3lCdA6C2i7KNR30ezcGi
	vyhYZQTTaAg+upIYQ/NcocNcCRkEiqZOdiXHNyyxoJ/tpG4mByx1z0810Dp1TA2VR2R3wWkBdpV
	nA39hBaoD5vayOLfGFoVMOkC2WRccQHgm6cbLHpaejLOHSWSyFKW/b28x0WwcUgHQ
X-Gm-Gg: Acq92OFVgD6jwml9gPVuKhQg1Rja5IKC3baEOBHB179hwfWTt8gj8tuZypPHHINKrsw
	klarRgad3gC/hmifU4+g+WwC4Re03E2mjPnQG6xfwundAyadbM6w29cRVop3i3J699ZoONzkRva
	oGBi1WGRYnyQVQb0pQju8vdkv5pa6ckqEKLUv5ApptcBzZyRu+bUPo7N0QiR4hzbSKTSf3tCr+Z
	dilmZT8owjxtwvhAOLPCAALM+x93Dy7eY4BcWUfn5ZNwZegq8/aPviFCIQhvhK15hyqqKSdiWvf
	6UIKC2fttG/h89jpu8g7WT/CWwvqxfyfjo8ME2mK1fb04f8kB3QlxxlK6v5Asm5EqHyw4mPpEgT
	XRYR7Rn+ujCSKlyYpbQPsQvdz/mSTwewHYbLkuU1pLeo75/7G
X-Received: by 2002:a05:622a:4a:b0:50e:5a1d:8422 with SMTP id d75a77b69052e-5165a275152mr193740581cf.28.1779093363934;
        Mon, 18 May 2026 01:36:03 -0700 (PDT)
X-Received: by 2002:a05:622a:4a:b0:50e:5a1d:8422 with SMTP id d75a77b69052e-5165a275152mr193740211cf.28.1779093363313;
        Mon, 18 May 2026 01:36:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm34163718f8f.36.2026.05.18.01.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:36:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Alexander Dahl <post@lespocky.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/2] tools: provide a shared library with high-level functions used by gpio-tools
Date: Mon, 18 May 2026 10:36:00 +0200
Message-ID: <177909335846.5372.15708561900857439449.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513-tools-common-shared-lib-v1-0-58ac28a9f1d5@oss.qualcomm.com>
References: <20260513-tools-common-shared-lib-v1-0-58ac28a9f1d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA4MSBTYWx0ZWRfXxNXwX9Euvu78
 eTn4exnhCIIEAGhOg21qQJgGq5NZQjwy+Lu+s3ssYxRg0wU4kLBrYEv8nx+ICtl2DsFUO6rPBsE
 C74T+EiUgUyG9uK/VC48bd75x0/5FChBgsyQfZGLrR6YO54kTcx4L8246pQ61uloW0N49oqUaSZ
 5dMM3VG+jJhSP2E/n/m4UyyZWWfbNIQ/GQCqffPc41502RjnIRUsYwl/CbUfznfNj5CrVUCeRAq
 D1r0MZzUZ6EQOwvz6P0hJTNxGQ//XtdUdy+oUEj+k0CZ1G0QLjt03x/wUoC38dV2SHXrJPXNp1S
 4UoU7XsaNhyfyiCZZfNqOsnGOO4CZlS84tgGw+ROne13xRU6QJUaHdNYNwJky7ZZxOzWosev1fH
 ZXPPqiA5w5frQhh9Kde3L3g1mDljio12wUaXENkRdKi2uMc0bq9RWxZcvV1z25UYuT8tStDr1s2
 tz1lQtYZ3drysQ1lL5w==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0acf75 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Bt_jH4nrRmJ2EPbj:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f20siPWs8TuJw8EaZtAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 3wuCc_ZtM1tH84V69_AsU5qiY4_esNyP
X-Proofpoint-GUID: 3wuCc_ZtM1tH84V69_AsU5qiY4_esNyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180081
X-Rspamd-Queue-Id: B8C91568F68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37036-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,xes-inc.com,lespocky.de,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Wed, 13 May 2026 13:47:11 +0200, Bartosz Golaszewski wrote:
> The API of libgpiod v2 is a bit more limited than that of v1. Notably:
> the whole category of high-level helpers as well as functions allowing
> to look up lines and chips by names/labels have been removed and replaced
> by low-level interfaces which require users to implement the look-up
> logic locally.
> 
> It's been requested several times that equivalents of these functions
> should be provided in some form. I don't want to expose more
> functionality in libgpiod core API than what the linux kernel uAPI
> provides. However, the gpio-tools already contain a shared library -
> tools-common - which implements the bulk of the desired functions in a
> new form.
> 
> [...]

Applied, thanks!

[1/2] tools: provide the libgpiotools shared library
      https://git.kernel.org/brgl/c/78fd3f3b62f4d3155e2ded904a9591669c0b2813
[2/2] tools: reuse libgpiotools
      https://git.kernel.org/brgl/c/0fe66719dddf1a206cb14baba136a36a32fd2f54

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


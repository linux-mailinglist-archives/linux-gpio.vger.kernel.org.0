Return-Path: <linux-gpio+bounces-35246-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKkWLpTv5WnxpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35246-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 11:19:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFBF428C4F
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 11:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8412C302C5C0
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 09:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2F3277029;
	Mon, 20 Apr 2026 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkjoQzg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ppz9XL2G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9399C20010A
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 09:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776676563; cv=none; b=rkxJWr7snBJSJPXtuPecNPEL9E+sa0kHPe/90cMvsH/u9TtC4wAu3+3T4AAHtzCdw2Vt7xcJPe8biy1uJu+N/lP5ZK1NWrhAMuVh09+G9PreA8KNNONjeMrj1S6/qStkBVRczcJsveM/xaxl72+W78CZQKw4aw1u0y5zQFALt1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776676563; c=relaxed/simple;
	bh=i1pW9STfNknYyLKGMJPaXjB5AbeR5lYROjgL63Ab+kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uyTKgeMZiP9xbLhPvQo8cjdIZQRaUiN2hhhN5P5Tm5xKlvSvXOb7xZ4kb1LVYwglgLg2ktjlOWE8ySn83041DoNuxGEKZGifL+DmakKZD9vhol7CUDgY8aAeFQsacCTyHa4LTGbdsm8hcWFoaJryzlZjzELf3gdVt1J9luXgGQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkjoQzg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ppz9XL2G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97Ru7084489
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 09:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0VacLWHx6mffMprulvbIkPw32rMmqdQ4bA7Snxbp9Tk=; b=WkjoQzg2kqWzA18F
	L6HAtHTpaO2CnNqgdbGotdo7MjqU+UkURHw3HDNRTwADiluxEpeXii9D7xNeszLM
	IEs6FMzoc53jEmRJZb61ZGOrBTjjGblKsDbP+0GZSeuYmyp1cv9gGG+b2VmkwKIC
	Xt3VN202SI9nQeW6M3IN5HDGtPt5GphiS03suIm3kQ1pP2Mj8UDOGg3N1uiFHlM/
	emwo5miPIDLBj/8wBqZUZWwrXHyhocldi2ifrxF8MJddhIbEFhrVFHWcuoy09xi7
	n9YX7074jVz5JC2mrqHrDRkznWVoS/+UKzhd99GvOTdW8jE1MeqYeXSmt4XAzDVd
	vUMhpA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh81g1as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 09:16:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5abd742eso14159121cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 02:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776676560; x=1777281360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VacLWHx6mffMprulvbIkPw32rMmqdQ4bA7Snxbp9Tk=;
        b=Ppz9XL2Gv58EN0STkX9WVMuMCpSqE3wo1VzYnx9F2KnqdHqKBk0LJ7lPQzSSMMXMsM
         qDOoNl8mQ0L8RIxx2/lK3f+mVt0ZNUMxpPYtXCoVBw53mhABzKFZ0VWLYWFXRX3yR647
         OTBHvD3xYO7icukjLQ7moM9gTTlfmEWq+O1NhHS8D38g7lYWhkQLVbrAf11ZxRhdumuz
         4eIEsTXbSi4Qd5qzvjNGfh48gjl+6zenEd+DO5grbGi/Z7N+E12/XL6LaORZ8dEgzdY7
         1umOklFm4I9WNia7DWtF8OXZ3kxE2F/Lh28FL7bOMx3K5F8ePoUpXA1jSj0Vp9YWG6k2
         fZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776676560; x=1777281360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0VacLWHx6mffMprulvbIkPw32rMmqdQ4bA7Snxbp9Tk=;
        b=OEfNvCvXr7HYu2Cg7PVHGLlb2C2F3wiDcENQYcFIoCIiWZPMkvvXkx+zfP0zo8rNPe
         qWM9RzLgtCumizZOc71TfiZeeAuFwl1Wo+k5jqb5UqVR6Z9rEMo3vIX+78ZnYudH+V4F
         4B+1Is6tNqkxBpfPefvshnKFyGQrM9W6Mhh45rghXU95xNjQe6I3LGDE8UdfYdkb0VSm
         kFRuHmsl0eAPvYcoqx+F0zOfJ9jpP1rGahAKW2N3toUQAGSfFzY1r8xJWBWivGwr4xAZ
         IFCn8EbhRktrUDP4UVUOoB2TPPuca6A/SXJWSqcNuxBuqsh/BP7W+6DlmgB+GwgzBi1f
         ZF+g==
X-Forwarded-Encrypted: i=1; AFNElJ/u6Q1wAacoZSGyslmk1ibapG9r+1euAkI5buUYg5MQNapQQvx8Dr+VnFCjIfnzKxsbTAGcjKX6S9nn@vger.kernel.org
X-Gm-Message-State: AOJu0YwuUUnwHLkplrvFgTARpwmqOiiCJh1r0wuhK/GVRa/RTpmANduc
	YePAXkFDN9RGpgRQqyTgAdXU+9LRhsgw4bq+i8CkMVP6E2b2gCOOhPgfJBhTaCtSctNJdaV+KLa
	8dODPtYNV6ZcuEcxhzrniD7iTPlOMki4ktIBfbLr/rXzgx12kzb61esZqC24lrWLq
X-Gm-Gg: AeBDiesxlnnkEADrzTlVCkWGD3QiMMEZwZ/zeWyc/YsitlB7LPE/1236N/94yaTdCdm
	p3K9LyBCDCtMSrb+n5CSRjFyI9NDfHFLuczgYoP1vUlabaLUYyd1coO5kzHymz8dTFvWb/Jf6ya
	HlqidjN3UAqwcc+p+edbY+Jzeksmz+TDWbIs1aBeRMubbJjs4VQF++2Ofg+zUb3Jbbxkyv0b5bT
	ZN548R5UFAUIGwOnsw6zLzPQOQKlEUcOO9X26gcsShAfoKS6ruuB2mrJk34SbPLOkFH4bomPSKq
	HAlgzdr2BA84X8S3qvICq2WqgmKKPAvK80UrLmNYaOltS8ejEIah6komPP37BfumfHyKEF7gd5x
	cmcVyuNHdpz4OH8fCbiYYFiHN3imS1BeQkyD15eKSCKVUPK1Kn30HtyJtHVQ=
X-Received: by 2002:a05:622a:1305:b0:50d:8db0:7abb with SMTP id d75a77b69052e-50e36ecfca9mr193000901cf.42.1776676560357;
        Mon, 20 Apr 2026 02:16:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1305:b0:50d:8db0:7abb with SMTP id d75a77b69052e-50e36ecfca9mr193000561cf.42.1776676559914;
        Mon, 20 Apr 2026 02:15:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:776:c20f:3f2a:49a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4c221cdsm27457471f8f.0.2026.04.20.02.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 02:15:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: aspeed: fix AST2700 debounce selector bit definitions
Date: Mon, 20 Apr 2026 11:15:57 +0200
Message-ID: <177667655421.14099.13456882135654197877.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415-gpio-fix-v1-1-b08a89b31e6f@aspeedtech.com>
References: <20260415-gpio-fix-v1-1-b08a89b31e6f@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4OSBTYWx0ZWRfX91Vk+kRfS06L
 yC+RLnK6t7rYbSFZasrj5+mivTa7Lvtw4YtM/YFHWak6FU6A2K+KYZSgRim/Tgutl6tRB2yITQb
 ENH8iR9zgZSEPp53oekUEW1vZ74yNd8kKVIYiBowzvdJfMcAwmOVnx/6bGNEZ7nR/GOhSUN4X85
 fO1UB9ncj0ZKe845+nQbe2TIqdVnawWuYOnynKMw4dqtt3USf0l3EBuQ3Qsj7AkXyRyX/KaBuiD
 FfwcaFS4FjQ9hAdn5x4zd/LMF8dX/HTdRvJKsweLDBjS/37cLJn1RwEAw8sPINIRc4bMK6LfR5f
 VWMh5b4PWdVsD8s7/y2TN6fwDI8YS4OiuL4Jf80OcCLCVziNxw/P5V4u6jQVfRKqpGyBAIUEzoH
 TX4Di4ZpXL8Edg5tniXVB12j8TK7jixbADW0PKAgYKCPV0dqnnh54sdOVRA7cfCDbI3S7/rMOXn
 tlyM7CJrOcyMAaj0ghw==
X-Proofpoint-GUID: hI1NsF2C3LkXFvWSqMvbSkc0CD7K-XS9
X-Proofpoint-ORIG-GUID: hI1NsF2C3LkXFvWSqMvbSkc0CD7K-XS9
X-Authority-Analysis: v=2.4 cv=PsKjqQM3 c=1 sm=1 tr=0 ts=69e5eed1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aUlvD_2W9BlSwx0EIeAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35246-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CFBF428C4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 15 Apr 2026 18:24:42 +0800, Billy Tsai wrote:
> The AST2700 datasheet defines reg_debounce_sel1 as the low bit and
> reg_debounce_sel2 as the high bit. The current driver uses the AST2600
> mapping instead, where sel1 is the high bit and sel2 is the low bit.
> 
> As a result, the debounce selector bits are programmed in reverse on
> AST2700. Swap the G7 sel1/sel2 bit definitions so the driver matches the
> hardware definition.
> 
> [...]

Applied, thanks!

[1/1] gpio: aspeed: fix AST2700 debounce selector bit definitions
      https://git.kernel.org/brgl/c/e31eee4a961077d60ef2362507240c6743c1c2ae

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


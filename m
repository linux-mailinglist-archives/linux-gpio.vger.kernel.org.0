Return-Path: <linux-gpio+bounces-34431-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKVANUB5ymnk9AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34431-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 15:23:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC3135BD98
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 15:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 128793021D00
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 13:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47AE33CD8BB;
	Mon, 30 Mar 2026 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDFhcM3P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="auJeVhhk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0D72248A3
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876515; cv=none; b=iIVfmU4pqKXs95WFMD9R2JcdXmeMb4kiw3ECj6yk9OvwRJ3P+EgH0F3/+P0vfsSJ0IyBlc/Il761s9Cyt517RjyKty37c62toIcCDICa2C3prJlQ25EnHSL11Yhrxh+SAr1XQkh6+utGBoY6AqzT9tEZgEWGlYvQi3xkHC+ISH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876515; c=relaxed/simple;
	bh=P+/sIciU/aZh9pNO+9MSfyVgrB6KD/2ZcGDk5xigiEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QppMeVS+AJgHfsqC6StpXLUtgHy0K3LlYDXSvUOoVyRMt6CvVT6b8xfmVZDF/On0EQneZfLIzLMZPMNBA7UfniNo9JYelzmKq0bBLatHDacz854IMNMOvTN5DAmQlm864XBWLd12XSXI+FVzh7HyMNBTNMLN2UJzzNZvwnkcNM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDFhcM3P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=auJeVhhk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UCZuuC703472
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 13:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+V9gJnGUaO+m/Ffu3e3yNnMMciNcTNxzkd+10B6y5TY=; b=PDFhcM3Pocvkw6do
	Dmqak7vPzzfVKu/0ahjBc+YkXVtOQzvt12dfecUqYg3frtsLZJuzMoqm/k3+iQcB
	z4lSGlM67hLERN62jZrFz3CstxH2lAH6TcGBebHRU040amZO0QEwZur84qB78Drr
	NWxeVBxcjFJOIyt7ssHQ5dV8XXoKnkyOkAhV1V+DdG9vufx7GBxQEYu2m9D86Ijs
	Yyktd0WrEQpfKVId8nXhd6LcoNb9L25dZ1AFxXtGeOSHID9xnlpTFPdmXR2kJixF
	BH7hAejkUbE94iEGpaE48F59utO4JZUmR0tvFI2nB/BZdaK8JbuF00LjLrIgScmd
	Su1LuQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sanr50e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 13:15:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b3544bc7bso60983271cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 06:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774876512; x=1775481312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+V9gJnGUaO+m/Ffu3e3yNnMMciNcTNxzkd+10B6y5TY=;
        b=auJeVhhkV3BPMzVjDC/Bj8dWzELDHf26LGGjK+NNAYu6/II87y8RUhfD1GfNNnj25v
         r2VqBo4xMz3u44+7/VjCLTOHRf6jkm4RAsnt61b8/d8BtVsRy/tDu70LnHjjtC4ScDiw
         2OguCxzRJJg4sfqE8bc2EJQNAdnQpCjvtAX/SVV3yunMZk3P+HOPPAUy6FaYDOSD10Ih
         Bp3ThXAyaAeM+9BrrqjfdYtHZlYp8DQyp6/3jBy4bnwNUhW1tvXJeNnTd3yXWa05jzLa
         0g+1D1RkSUD6mmm5WESqS1cP/UI46rHs2gA46yj2Su4UrIQme3vuTi909RJD038P2QYm
         EcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774876512; x=1775481312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+V9gJnGUaO+m/Ffu3e3yNnMMciNcTNxzkd+10B6y5TY=;
        b=HIbonp/PlweSkGefhRcbLYX3rp0yJEH7Lu2cuVivRIFJLUqboMGSytoF6N0bTh2Hch
         hO8WeX8qhYf69Ww8VCWei/j/9oRTbhwCP6lsQM3m0/5TS1ni01/p92Hn0pl0MvcRplFu
         /j8auVcBTfj7aLB5fKMZPde6R9+Xw7AoYaO+D4kaQ8sWXQ3VrOJvFgb8wcURqXyh2ev7
         2byk7Ix4OUxrjhk+ebQzcAnnKGy99us6wxELjFGSlFFdrzkXW+7btkb7znMZRv8Iy060
         4JOZGesiK3djwmEGG9hgEhHi7FK/W5X8mkBf7G/d5UozEQHRca040bmLL+8NigiGt7i2
         Gvig==
X-Gm-Message-State: AOJu0YxOOoeWSj4HszcOGbXe2ny8ieTZDfnruoCLAC0DxlYSIBFYmK4t
	YIAZnkH+EAKsxbDr9OLpcnWRFAPKG0ctN4sENJa7SSSlfUXPDXqxZ2g4SNYStxEi8iOYx0q8F+K
	D0O25c65fGUSqbkOJ8hTZzdmqLkNTAOVHxU1XoUX6+0JrYUI919bDPyZZtsz5l3AF
X-Gm-Gg: ATEYQzwfBHFbLhiZmzWb2ct4TrSadZsEEhnI4rq0d1njv2xY0UDm5fJl7XZBJBvntXz
	TZBWk3n1plnqTJeM0R6/i33rXpGC8BOK5rahbBCYGGLTLtmCSEIM/pmdgF0o2yP83XVHu0B6spp
	FkIQ1p12dnWpCcE97qZjwyq6a5VbuKcBOUAiERgvS7/vx1aYhrj4+2R0BrUKfB8OCNWXJSSkmxj
	fP9gMPKNKnP5SfWLZBWrj3qyL1lKgBL5NIUiHS1ztpBtg4CznOv15WvspGamvi8rZiUgkFA3MRm
	spxxXjaCZfZM3vj5a/cCQP6LIu9PfVQViI+ulyzIu83iuITHiJCLmMHt9TEfq7YXAzfOiLGNipT
	VOYtiotoTkJRbe0WMa2zgR65+aYVRiDayGjLXCzcZ+vSciSTGyXA=
X-Received: by 2002:a05:622a:1e99:b0:50b:3e14:47f5 with SMTP id d75a77b69052e-50ba3918d3cmr161751301cf.44.1774876512141;
        Mon, 30 Mar 2026 06:15:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1e99:b0:50b:3e14:47f5 with SMTP id d75a77b69052e-50ba3918d3cmr161749101cf.44.1774876510900;
        Mon, 30 Mar 2026 06:15:10 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:e931:8d81:9955:76ef])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae269ddsm289786166b.5.2026.03.30.06.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:15:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] gpiolib: fix hogs with multiple lines
Date: Mon, 30 Mar 2026 15:15:07 +0200
Message-ID: <177487650500.111346.18242078160937689030.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330-gpio-hogs-multiple-v3-1-175c3839ad9f@oss.qualcomm.com>
References: <20260330-gpio-hogs-multiple-v3-1-175c3839ad9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hCtJnnk_rbLV2U3f9zMChFv5QmVzu25n
X-Proofpoint-ORIG-GUID: hCtJnnk_rbLV2U3f9zMChFv5QmVzu25n
X-Authority-Analysis: v=2.4 cv=NofcssdJ c=1 sm=1 tr=0 ts=69ca7760 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1MJBIN42MfwyQk30-WcA:9 a=QEXdDO2ut3YA:10 a=UzISIztuOb4A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwMyBTYWx0ZWRfX+LPlnCGpsYCD
 NlyStjnKWSu9s6Wjnw80fBgeUsZ1yUpJ+A8xq4CUY9Y4VZzcOS+1XnWu7oW5jcxiBc0OkKyQPUM
 fu81zUqN8hOr6SWWAZGLHGMirYfg+hGC103gZ74OXj4hs5iuv1KRcho+TsXxoJg8eW1jKkmESc/
 l8xa0Qz4B1cMS1rOrsbZG86SDdAlqFVnY6AZ6mccfx355XV8Zf3TSRnBC+ixOPSD7mt8IRpn30Z
 NN3i5ZRe/Dz0GNgIfob7+F8ATr5KNzjD+1JyTMtHzRY1iOhgEywtQyMrTaK0wgjuwAA6BhCX22x
 0CsLP5cCRngttrKhRYBfK6CDepFgj2wyyV02lPHz0qzl75Pfm6pRS/M2dqA/RAAXI6DHcHXqMPn
 Nm7jfJFqqQ5lnxBBz2hw+hoVV3zLOCiU7EQiybjqswPpWnquL7k+AWylV6FGOqgNKblcHhnMo+D
 wkSp34//lHyXmLpWFTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300103
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34431-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4EC3135BD98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 30 Mar 2026 10:36:03 +0200, Bartosz Golaszewski wrote:
> After moving GPIO hog handling into GPIOLIB core, we accidentally stopped
> supporting devicetree hog definitions with multiple lines like so:
> 
> 	hog {
> 		gpio-hog;
> 		gpios = <3 0>, <4 GPIO_ACTIVE_LOW>;
> 		output-high;
> 		line-name = "foo";
> 	};
> 
> [...]

Applied, thanks!

[1/1] gpiolib: fix hogs with multiple lines
      https://git.kernel.org/brgl/c/802c51a83e9a0617d1e97ecd383471f4c6fd5437

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


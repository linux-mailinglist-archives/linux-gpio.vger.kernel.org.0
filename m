Return-Path: <linux-gpio+bounces-29735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD9DCCB62A
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 11:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFC31302B303
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 10:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AC82ECD32;
	Thu, 18 Dec 2025 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJNXqYjZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xi20Ze0u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1842264A3
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766053665; cv=none; b=bdCAQDG00Ak2cC4m81UItQDR5fJe9aUzzzie3+rVLETSlWR7P4zoXxnccA9XdBMkMMHMHDmsU1bdkglhXWs20iSLEuJVyxmAcDGO8iJzqFuL6ZglDcljjjE9iECpjszUF73ViApJydOAZa3XrKZVjMmSGYL9Ab/OgOV/y2C1cYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766053665; c=relaxed/simple;
	bh=OI71iMPCva/n2OGZyxyBKYJ1LY828j88+PQeNz7+1mM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eGIyvllTO8QCXAzYdjIGvP2hCav+NsyazJXLm9Qfq4jZT8za6JXH/dRX7PlILFxuoY6fn3mu3E2x1vHhq5IH5WfdwC6p+cJytCuvGvoOiwUykDSWBJ24/9NVlCJp3fJSaae5G/RtIxmMxQmlKP1WZXFkEL57235g39waIbT+xrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJNXqYjZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xi20Ze0u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI9N3Hh4057302
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 10:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Co3+UnxzYNDboe0H8zPytVumPx/fk5cCzhFhhgpDVMQ=; b=IJNXqYjZD2Rj/hNw
	J5gw/J/isgvIQznAd+3v16hKtA0gdCOF9xhFTMuTf2I6RVa3Rvi9MPWMjnT9WFtT
	m+m2/WsqYaHV/yXk5ddqUSB62PmzbU426AQq3+5BOtR00xEj6MNc1TPWw6SJjMjv
	nfUkyFReFTid2AuTAdZojZOxHTvaRrAV9NDI80gmoR/EOlMqf45FoSeelUIej0Li
	4ZvBkbe0QYof3lMdhPqkIBfxbcAc52lAMY19WPI+vAt1HRisg65NsrYi5+j6sVdO
	qrSfnRfOodQ4NlfZ7qMG6dKEIbiMKtdI4icYvMY0lSRwO5m1JWFV4vpz4Vw1HBbf
	Avwt9g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5b790-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 10:27:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso15602161cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 02:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766053662; x=1766658462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Co3+UnxzYNDboe0H8zPytVumPx/fk5cCzhFhhgpDVMQ=;
        b=Xi20Ze0uELR6K04WLEjHsfSnp6e8rsTEmZulcl4agb7Wl/mkhni7qiNklSpDKrrynW
         OW6/vToHMwqNxQar18OOh8k3/kwUICELg+joQbN3TTw8QAsNjZspher3olAtFBhqlo9s
         vD/hcotQS2Zilq4nI/6X/QOAu++i8N74/rmFr6QgJWBZD2E+R3qtpA1MckSMyWMjOLdV
         HcJooH0HP43zg9oc8blsM8CEfZRuKkw/Zn7tklM+C4N/yXJ1iIF4Nh8XGLT3a4d5o9ix
         TtQPTFrsWW9/j+14EeXLquWA9VvU2Ixczk4iLRRz+FssmKbJElpsR63RE5jMvl9aEpl6
         WtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766053662; x=1766658462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Co3+UnxzYNDboe0H8zPytVumPx/fk5cCzhFhhgpDVMQ=;
        b=DsKvrur5IQNYe3/iixbFit5+oUlFThRnejMNyWP4eU91wo1Nx0TI5k4nXo8j7DvsGb
         m3DfXFz2oZ+zdJ6kOpFI4X6KeDSYzB3IMZ48lp/KkVVxj7Xm4YQrMKrjPQwGwsL97cAw
         lXTs2MU5X0QJFnXaj/k8BvBqLI0Vf05+tIom7SMtFofBAj6SA2nDhL57LLL/52PUYNZ+
         OxpiI0yPJGcRvbA2L16W8Nq7quVP2p/NaQdhEWiSroZ6A4ZeVRWMBRsAoy4NGM2YXxLJ
         5SzrFtyYCVsty0sHTIwNJ6NzfLsAHXS5puQEQQb2q69owy9MvboOUyLM4hSRxDdYiopA
         4J9g==
X-Forwarded-Encrypted: i=1; AJvYcCWsk/yHGMkv4hf/8f7ujKrDyDs7z/ifY0n/rkyHHLXghMpNHOYaiMLOawEkUlZUuYCv0rlZoop+BKFm@vger.kernel.org
X-Gm-Message-State: AOJu0YwjdVQM6CoZDBcClpQrPyTNeNBHss6TwAVi/95BPakv83PQyybM
	9ufgf2VcVjWoxb/jmOr3JhBDhl0Oox6vMlNAa4TyfBWCxUYfwTkNx47yVUaRT57vMxddUBbFklL
	LOmoEi27hsOn/eqXvBczq5ZlqvSd/4tsryJrZCplixwNxaNzCSgvtJgQpahmDF19J
X-Gm-Gg: AY/fxX5ebUNGTe6DTkuM/rb7uo43YqTTXd0CtDsX9oiHbWPMpz4y1aO/+d2EztxtQeV
	rdPS5v9DuDcYcUSglK08lITtGL7rJ8y+YD0AeLwGNR0Pt9Uvst0/Q6aXRkNh9OeafRdvcjdJ0xy
	ADQcNQHGhiDcepCddyDvgWlF5HFTBaKoKVwZYIMWFqWU23kkAMTRqRrccqC5jrcaRwVXlPgQigy
	OtAhoVTdl4FkEsOJljPjujACdkb832gM03ZMDJrg1qTIkFpjeAGSzQgj1XjQdB2Yv7k+sUXGGW1
	Eb2y/rLdC2ocgHN0bApEeiwvCgY+yI15zIWLYPRM7NvH587kbv1eJMXhpoNyMxGQoNvSfqz2q9n
	dEE88lbt2LFiLa/8wuxtT5QDGRBLOCzy9KjlfjzU=
X-Received: by 2002:a05:622a:4891:b0:4ee:1b36:b5c2 with SMTP id d75a77b69052e-4f1d05fda8cmr274645731cf.68.1766053662492;
        Thu, 18 Dec 2025 02:27:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH8Xs99lwk0ln8Fhm8MT0KYk43fwblcEWogwddMnWX6PXNnrsr2mBiRPPS1m4a03lPfWrYtg==
X-Received: by 2002:a05:622a:4891:b0:4ee:1b36:b5c2 with SMTP id d75a77b69052e-4f1d05fda8cmr274645531cf.68.1766053662095;
        Thu, 18 Dec 2025 02:27:42 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:f231:224c:1d69:c0c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432448ca8dbsm4192238f8f.0.2025.12.18.02.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 02:27:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Levente=20R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>,
        Jan Remmet <j.remmet@phytec.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, upstream@lists.phytec.de,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] gpio: pca953x: Add support for TCAL6408 TCAL6416
Date: Thu, 18 Dec 2025 11:27:35 +0100
Message-ID: <176605365223.36578.17805523730541624399.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216-wip-jremmet-tcal6416rtw-v2-0-6516d98a9836@phytec.de>
References: <20251216-wip-jremmet-tcal6416rtw-v2-0-6516d98a9836@phytec.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rLNgzjczqbS_8VIq2peR6VFEqlVOus_1
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6943d71f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=N8dQhNKznRLd4DIZfUgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA4NSBTYWx0ZWRfX02ysEyCwVlhD
 DhDqSFs8XfSYEZntqHcwwSKTaDbsNTgkMTV+qFX0/coUuTemA8kwgY6Bi/G5YF7mCwx0sNktWSM
 id7MdAlsq39to18WIPk4wn1QPelNjyvFuNSdbk1GeEmvw29/RuDskZjOD4gwJ5PB1e5e/Jf7DRu
 CvDs2NlXMd8Il4KFxScR7Gt+sBp8rM+FFs5JlUyX5G+ExGS0aI1ofh4mw6BHBU6RRq9PxWPdbAX
 ycgS1//0asSNuG0rBbLxpS6HUMLNq7M2+4APVzhVp7HzhyeLcZJEt4VtNAEyCaPKC7nZBHemmrz
 j6cjySMGq7jkp2P2Jd9cGNrblIpVmOErW/opT+GqaFA1+lDT+yNf8Rsozu58WAx/S0OzeCJjRfS
 ZsTM6Qyh4WK/Po8PeAmvQ0kRvw0PmQ==
X-Proofpoint-ORIG-GUID: rLNgzjczqbS_8VIq2peR6VFEqlVOus_1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180085


On Tue, 16 Dec 2025 08:39:32 +0100, Jan Remmet wrote:
> Add two compatible. They share register layout with nxp pcal6408 and
> pcal6416
> 
> 

Applied, thanks!

[1/3] Documentation: gpio: add TCAL6408 and TCAL6416
      commit: d19c36134fe14647873af5569329489502c174b9
[2/3] dt-bindings: gpio: gpio-pca95xx: Add tcal6408 and tcal6416
      commit: 9b5f506ff6c11e82574e7f6aa763c92ddb3afc57
[3/3] gpio: pca953x: Add support for TCAL6408 TCAL6416
      commit: a30a9cb9bca4296d25f253619883e7013b6be158

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


Return-Path: <linux-gpio+bounces-30209-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD158CFCA1E
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 09:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A5A53102505
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 08:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5368F29BDA0;
	Wed,  7 Jan 2026 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ln1hahzN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTYMpdU8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68882877DE
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 08:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767774696; cv=none; b=BZtaOoUQEu0E1P0+74jW1EQ6zL2EAuXU6CpBx0lupL3tKQcD5UK1UwwMcZzKC0dA6x4mo6NFAwbbGdgkq2jfsc+jOES/I+nVQA9WtLtkrWfmETeCNBc8BHNvBgAt7W+PfQJhMaAkl5RrqG1umOrvKc4y3x0SVWgmpvR0wFwLLYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767774696; c=relaxed/simple;
	bh=SeOQ6FRPMBLZGAmQMQdOZgu6si4Fm3Uert3op2ZHyXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HqWAP1YY/Nc+9XDZG4PC8t8LzB9VsqU2aH+3lJuxc93SHBIgb61TZRbx+Zb30xwKA93AdYGU4fhQDx+GYX6/hxuZd0/1v5uz/JZ2W5rQ0H+81k5hUWnY0ZBKSTH63OgJWqgy0VnvdTJ8ONZWdKBBoSAJoMrV4rInBGg8OPFrH3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ln1hahzN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTYMpdU8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6073U3Bi365170
	for <linux-gpio@vger.kernel.org>; Wed, 7 Jan 2026 08:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NWwPO3d27ImfHEzlzHPDpDaPt2j69lQC24MB/q0sb8s=; b=Ln1hahzNuYBUQnXi
	elSZl+rRtQ//d9uQyxBJNwPwf6Z7mgvbcDTcl/tvuIRbcWSNEok+a9zQ5fhrDQrL
	fXdoDT20tA+L/SaJ0rtRAnbzBTuUTvdfvHrXFCheo/vEx5fKNjxszOSUaW0Z60HJ
	NLFK/BGFc47THI97nIdPOhqMWJMS8j1zH3MhB3zldIAcJLt+Jqm6eLi87P/guyeM
	lSAxo40XCBNRsuaLEbj14ns2pOnlNo/OQ9FVG58WfRVPEELZ5pw2PdaIyNa2mEBD
	NRQ+cgHKZZ50ZmEBZ1XgcTvHqvExvRIISzRrT6AYvsnDVORBBjxplKfV3uF+rQbu
	4WMf2A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh660tgte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 08:31:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d2aa793fso56451021cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 00:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767774693; x=1768379493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWwPO3d27ImfHEzlzHPDpDaPt2j69lQC24MB/q0sb8s=;
        b=OTYMpdU8iHlgMG/+3pCh3Pt4jNSaf7MQbL++UWhsH37MIjC4TI1fbdP29UnuF31NJq
         m49rN5h4hvXR3V0qzNJZNuPg5+A0Syzy1wjzeUR3qxl728JzIOns781jQSee/8c1rOsN
         vz3H9K/2dDEYnBtDiKpqMKh6OGmKWR5hJRhOq9nq8EWv7PyYQq2xZL0vJaHdyPUdo3TC
         mnAY58F021XGC9slFt5Rf4bNOBLtMm2wSQ980LFlgt1+zw7cCuRMgU5vR456Hxt6jWnn
         pigiXUf/PQDh0yELcK+IfXxGh8f6xOFfvxJ5Yv41VPrH3rh3DFf+6KujzbymiDhHGNMj
         07hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767774693; x=1768379493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NWwPO3d27ImfHEzlzHPDpDaPt2j69lQC24MB/q0sb8s=;
        b=IUv9+kTg1JmMpey+aXXV+cz6m48tWzs2FKG8g3CABiOyJZJc6iyMFg3zrP+oEXFjZ6
         h55ZIfm5EsKLOYBzNtLU041ELl01vSv6ygHKOrzPkV+tF4tl5D2NmgZb07G2QmGDMyI/
         fSGIqQjuO/ZQuv+38dUBY2AWW1Dzl2xazfoBJ4bDNBIc9Av9u6cXMJes+lepVUZNIVTl
         EEizYAAKEMBYM3Fdk01vSQrCUPq08Q1cISG2zJ4/hNTFhaBnW2hkUGzw3dcfddioBjMq
         g83GwJ/SX874LgBhNg12xpFr0QhduqdQrCylQzMaaXN8vH9gzxfdCnjRYFkrqpQoBwsV
         ICwQ==
X-Gm-Message-State: AOJu0YxF5onsqg+kkirrtCAgJm8bgjv/iAFsATyN1SvkyZpmfgS39p+9
	s/LTvPsbuOb02ciru4duMcI67gsxIkaGzLn/pFKqUXYLKZa4p41wzTACGgqsms+xzFkOLqgzaAT
	zTVQq0ALIhqqKGlAmKzjoVw4f5xXQUrWWlIsREZmz2LnfciVDiJ9Vx3XEDku7mJNr
X-Gm-Gg: AY/fxX4W5e6PbqopLizIoKCPl2FOtGptWXttd0hxt9hRfYF4In+8mj4ZklQ+VCVPJ5A
	7EOoHHvB6p6Xl2Y2ksHaaHlmFQNjYbkILggGpr42uuw7NXSphU6xDVEPRtp/3pLls4rlfWwW9k/
	XMm/5gUawcLERbT14GVI/iVlJWAYtWriCqUYuHERU5XMZiLl1QVd3P4HTR159YcAidJnTU/moDD
	AyhNtF8edjNJPjvTXvpxnNAnHuFmIrsFfxAAnIJYqnEo7PbY05Zw7LtJjj8qjlI0wWA8O4Za1bc
	3fFtk86yFyo/OndstNKJQCfrUox76m3uqPDQyBekGsko1uHAANQeAMn1ZryER79WwKYZOsUxgG5
	wQPh/z9OdfL605swjFuyEHUm4sckQUejABxVs4Q==
X-Received: by 2002:ac8:7f86:0:b0:4ee:2984:7d93 with SMTP id d75a77b69052e-4ffb47d6c3dmr19223031cf.17.1767774693159;
        Wed, 07 Jan 2026 00:31:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUStjBFB68EIy+xTRBxYupPKVH4Zz7vlevwRpOjHpHb6yDdkR+jPfQ7OOi+BLkUJgOySOwTw==
X-Received: by 2002:ac8:7f86:0:b0:4ee:2984:7d93 with SMTP id d75a77b69052e-4ffb47d6c3dmr19222851cf.17.1767774692772;
        Wed, 07 Jan 2026 00:31:32 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b90b:ec1:e402:4249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f703a8csm84793845e9.13.2026.01.07.00.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:31:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] gpio: shared: another set of small fixes
Date: Wed,  7 Jan 2026 09:31:27 +0100
Message-ID: <176777468354.15022.4390025823122186324.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com>
References: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNptWcZl c=1 sm=1 tr=0 ts=695e19e6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=U9hqP3cjyMzJt70pBlAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: NP5wzBhdicV95S5BhLd3Dn6hApiLHyu6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2NyBTYWx0ZWRfXzn3balYBM8wx
 DgFuG61Tf84QogBCM4ItEqWbmmZlfXi5enEi3pYCt6UqTspKJPJ/mQO+hvB22z0VZ8eaIsQKJAd
 u9JGNfg9H3aoittaMoU9wFcN63o55wvADzXoy44UGUV12WSmfEuRJEY/Cu1FaiCyzoJ0klzS6rP
 WZ7lUS1ZMAkbIEWJ0Cxs1a1d6JQVz8SrAi0tqh14CQ2/VcY9J5lnxXqIva6vRF4+Xi0yAil951T
 O8qYUuJD1ULAW/8lxO7w5JWiYs8NsGMPALELi0x0w08TH+H0LtlRpUuBqjtpaRMopb1oAwt9ScC
 9VP6bxLjOGHame8OWClbZAldCNSits1kSbXzTnMlecxiTttHtcECUm4O+gceq93++DS1DsZBZOy
 c6jdAiDz/R03caXgtQtY0BMOihkY8LqWR1e4SkuoBoatnbR6IKgjCRiLzibok0wWMW0MhRNPy1E
 c55HH78CG1e/aPaRkrw==
X-Proofpoint-GUID: NP5wzBhdicV95S5BhLd3Dn6hApiLHyu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070067


On Tue, 06 Jan 2026 10:34:20 +0100, Bartosz Golaszewski wrote:
> Here are three more patches fixing issues reported with shared GPIO
> management.
> 
> 

Applied, thanks!

[1/3] gpio: shared: assign the correct firmware node for reset-gpio use-case
      commit: 0fe50631791bd3504dc7f32af6421bd4041f14aa
[2/3] gpio: shared: fix a race condition
      commit: 476e44d06fc107f8cd99695d8e4f1c792dfc3379
[3/3] gpio: shared: don't allocate the lookup table until we really need it
      commit: a80208072df8f4ceb53cd905c1f4362f84ce397f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


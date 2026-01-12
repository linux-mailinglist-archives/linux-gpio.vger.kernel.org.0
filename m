Return-Path: <linux-gpio+bounces-30449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F87D11F60
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 11:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A297330216B0
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 10:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF63327C09;
	Mon, 12 Jan 2026 10:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNxpg3uS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBTJvaz7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42152320A04
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214430; cv=none; b=m/xRXV6YllaodWKftAXjkoH0R9f+aLW4MTWQcTSV3BZSMytkEbVNiq6FW+dnS3A18CupFT4wZkRWkzB5nfSMKK0IO1W8o4L7QK6eQhsaDtWchBNHFkx6oTfJBeg/LDDTCmzKliVxApHhsIwofWphxnNrzVOFWsyLH3d0zmK4/Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214430; c=relaxed/simple;
	bh=Yb28DH9Zvjum8fr9P6oJluDAHnVFomeooabU7zO5CZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pWdKTtZjBuycKceNxN0B8l+LFHryF/KE6Y1jpOYh9vRtEv0T2D0kHPHg7ubf9uC7tf2DBIbuhn3bKRWh39iEpQJFLqsMTN+gu6LRcu9WAlk8RhetULBrKJRpbg4ldyfzmkGrW/QASZYVvHHzDGTNhZZtMO054d/VlfuiNcSDirU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNxpg3uS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBTJvaz7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C9WgGe309174
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 10:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/JlJZ8SNheaI5NJ4hWOw9gqwD/8COzEONTltURDNnVQ=; b=JNxpg3uSYNyIAUQs
	KM6KSVQ810WBUecdGywS57K3+TNE3mskdsNBBdyVNwYnKLXjXmWimuzGW08B0jUj
	7kE5aUvibLAqDdsd3CIuGIv3PkMNF0EYD8AcECt/0/x0tdkdMzTuqFxgIAGJKorE
	/aQg2TDDuOO+4+CdO66YL5VR1Fd3diRspdwFiFBLT6CzN6gDvDGQGPbe2ffyWZka
	/BYAplVCAssI1+vQEl1wJnSilAT1J+rZvMk29CB3v1fEfu2kKKUiGJAB+cW4pl0n
	9w3ARezxyS5hLwG1M/H92T2WMDRfVltSxJquROqOknHfWqGCtl1oNFgHSXSlxZNE
	GGg8rA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmxdvr6m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 10:40:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e235d4d2so2416805985a.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 02:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214427; x=1768819227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JlJZ8SNheaI5NJ4hWOw9gqwD/8COzEONTltURDNnVQ=;
        b=fBTJvaz7QdHBfZS4mXXoahtMvk8pYGUiU+vEyKJ1X5mts4DTlARuJ62GLmmIunmA6F
         DgRUA9LKZJZqdvM7OeJleyF/I7b8Dw4CPRw5Q76hfdg4kQ1tE1lX81RQsJ3OJYXUPTuQ
         p+GusGdY6wxwLdaIQn3vV8fhGj0FheMRsm3RxQ5nLJNgws6eDi1LoiCpq8RnrD8N++tl
         GaTszi4xX+9G7HjtWafL91e2IlpQZ0/f/qmqt8kb0xO6w/GoDniR6bTOUqRg7aKzKn7R
         NPzEtfU9MQysVPeHViG1u1hXkg0tyj4YdUG+Rua6icDpr/jWh7sLN5f8HXkq5f3rdaHz
         hKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214427; x=1768819227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/JlJZ8SNheaI5NJ4hWOw9gqwD/8COzEONTltURDNnVQ=;
        b=CrQ1tG3OrAXdo1gXcbF6FoL9qviO9Gqu06umXQ7EeBdCnZ1ucqnZJtGnR+KGhqHcff
         RH2vOPCEvCkSrK/NoTDUPs5oVNdws1TiYEyUR0jUsecNpRUsBSEJVHeYtUt98+6sQCHf
         D5yLS6sxgzxZo6KKvZWPdnxZ2orqOE3PF/hDp8dtoUXCV5zoStJz8I8lSJc5YqmxZkBZ
         ns6Yv0F4+sgvNoowm7xTNxB4oHmNyQiE3HpWKGAp+o2D/n3yHA+PxOM9m1CoK/hCT4eq
         omfgwA4gsal0CUINNWMyXFwmGvun+ANVm6qHStDWqwfUK5pAfLny1j05kMaR3llIWeJk
         V/5g==
X-Forwarded-Encrypted: i=1; AJvYcCVjUj7UHaFxzxlbq+QMBEvSpy1XhKxlyzQPx4ii8pQtAkELm9V+pygo3MP1jlvpuklxdLbaLgFetHum@vger.kernel.org
X-Gm-Message-State: AOJu0YzoPnSZwhBu6zn3N4+43GhnnkKOEYPBrJtnpQkspWa35xA0R9GJ
	/wiOiAVD8r8j14ODcQtmrjbgMCrvjprxGu3THu6+uKPMH5fK2TMDlwWnezz5qdY7RodgXwUs2NB
	D1aQlalj/fzpR4afB5C51O86cMDnnSg+M1NoXHo9ZA9ecWEpbbhtp8LpSF00XGvom
X-Gm-Gg: AY/fxX7Bih5kOxI5A+PLIk0E3H/PW6YJgBozBpZBeKOxFScAamxIZD/JgxitAvAOF7H
	55xxuZdfzt216biaqYONc7siXHMei2dzPKiuLPjxpzM+a/pek6cBq2nCmbLsmEOT4sbJXnkMugY
	9wUzQU/FI2vRA7EnRNnHYSf97bsCPT8gV4LtmY0GsnH9LfVRjSDwdC/n0d4IcqEx1YvJI6jLkUR
	/KIGLVjbwuU/RIlX+ef0FNUR83zvowbdFKXl12jpBQvzpKsJWeI5P0UYbP0FdGGpJ7rFFYsn6TJ
	40/nQFGbPupGX7a9Vams/hfUCfXcw2qQjK064FDZ30h9EaYjrBNAzFAYy0v0LVDaCN8SuLv9EGy
	Sie2Z5Sw756vfRZ1l9ct/73zYk5xDhcvFkjyw4j0=
X-Received: by 2002:a05:620a:1904:b0:8b2:c2ba:7075 with SMTP id af79cd13be357-8c3894172d6mr2445465385a.75.1768214427563;
        Mon, 12 Jan 2026 02:40:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmDrY0I7W1lWzIEr/8fdGqB/twrSK+nFDQuFLpGZqvzXGLltwB0jDgMPCV3Br2C73wWgaEAQ==
X-Received: by 2002:a05:620a:1904:b0:8b2:c2ba:7075 with SMTP id af79cd13be357-8c3894172d6mr2445462685a.75.1768214427042;
        Mon, 12 Jan 2026 02:40:27 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f69e802sm353823325e9.8.2026.01.12.02.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:40:26 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org,
        Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        andriy.shevchenko@intel.com, dev-jorge.sanjuangarcia@duagon.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/1] gpio: Remove MODULE_ALIAS from gpio-menz127
Date: Mon, 12 Jan 2026 11:40:24 +0100
Message-ID: <176821439707.14558.2281083056388438061.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108134843.25903-1-dev-josejavier.rodriguez@duagon.com>
References: <20260108134843.25903-1-dev-josejavier.rodriguez@duagon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pvs3UdSKPNlpScgNzaz7lginelbh5FaD
X-Proofpoint-GUID: pvs3UdSKPNlpScgNzaz7lginelbh5FaD
X-Authority-Analysis: v=2.4 cv=HoZ72kTS c=1 sm=1 tr=0 ts=6964cf9c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=XAcZUpiH88AKF6N0LskA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfXzlBQtM5nwoa7
 pBBMGJqjjEuzy7a6x8qndRIsGNMXuldSgdE+f9L+BJFiQgMdyXFBl8rt0MmsV80EX+6khPdvYSS
 ptJiAq0GpZnZhT6QJ5KdCyCNU0JpyzCGhak7yYlCYjQo3XgrpOcf7kFGwysLS97nsLjiPQfYtDH
 Nw/UyLnDHPJd4A+zFJTpkEPgs3yEg+ta5TB8XKwIlLP9pEUwR9073cD9lq/Zv8t7X+1DyWm0YdV
 r9spaY2B+V82mNRU4nsHTQ5G39BQ53PBsj4mQd7+OCP8fi61uZ8ViE3kRIbBY/T0FiXf378Si3S
 nUkNzDbX6XKOMvAvSxMKpxkongmCQdF/4HPd//ft3bjQcMsokmy1RbD2glap/Jbb2zcaUoOBnWG
 9n/jAdEXA+pD7yop8NfU2DaoXYdtRVV3wQtHKPwGVZ0WrpWczLPzZCyr5uXfUWkjfgbYMi8wU8p
 QV1I2QY6tkizRtMRJmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120085


On Thu, 08 Jan 2026 14:48:42 +0100, Jose Javier Rodriguez Barbarin wrote:
> The first patches I sent for fixing the autoload problem encountered
> on mcb device drivers were 2. The first [1] was focused on updating the
> modpost process for letting kbuild to access to the data within
> MODULE_DEVICE_TABLE and the second one [2] for removing the MODULE_ALIAS
> on all mcb client drivers.
> 
> They were rejected and Andy suggested me to split the second patch
> in a per-driver basis instead of sending all drivers' changes in a
> single patch once the first patch was merged.
> 
> [...]

Subject should be: "gpio: menz127: ...", I fixed it when applying.

[1/1] gpio: gpio-menz127: drop unneeded MODULE_ALIAS
      commit: a88d9589125a4d2d1cc2e0e6ba794be30f4de44f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


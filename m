Return-Path: <linux-gpio+bounces-25989-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80260B54136
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 05:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B5AC1C2442F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 03:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969EE263892;
	Fri, 12 Sep 2025 03:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SyhsmY4N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA961553A3;
	Fri, 12 Sep 2025 03:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757649373; cv=none; b=LkbDHobtlizlZJH5qRa7rS5y654pYgfGyzFg+o+YX+Xbnd9B4lybCpEBIez4NM6x6Lc0v85t1ca6VWcygF+FvPMfJx5wnXbDcggaodxQ6yWxNKlyoVC49thC5h53zPm7cboEmvQh/BoTBTyRArqzujhx4sCfVsdRa/H+TOIorl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757649373; c=relaxed/simple;
	bh=H3siJW+ZzG3bLkuhoeIiqm2QUfm4QRc8iT3dukE8doU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GpICnS/UsaizhrzUkZsjoU2Dk+kWCEZizmzT5cGTtyHewrgf8f900q8VuKMsoGLH02kUNDUzU09Za6zRgwIvp2V75Y6qmS/vpaj16nwhTWvmUsmG3zOWZ6SK2MtE+54tuNza5qkaYoi5XdZZB6lZggLIDvDoO4AhXP7hWEfMuj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SyhsmY4N; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C22Tnc031661;
	Fri, 12 Sep 2025 03:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=DMgfog
	WaR7ECDsvkaNEbogcZjgaT432gIYbWJ+YBhQw=; b=SyhsmY4NVKd6QuMgQGd9IV
	+i8Aw1OaYytrG+HyUjawZ2EYigxPr6PaiOKcWs79C3/EEUDyQF8FilZbNBChJFQe
	mzFpkscCsJnezHtKgnwdFeszRY1O6/SR5YzMbeP6CRlOCjUasFVMwnKPc8IHlue+
	BdCnCAl1wJdWXnoJr395U9XXzOmbxkQgwqrLb+cDdnwtL8qEIRz4AAQr2j6D5Td5
	aPXdw+RFck+3S3PmEg5hipgTDJOKa4wLivcoqP+Q3rjO14QfVkECiLf65TITEaGA
	1r9nSaoI4d/65N1wZcyZzJaD6FTRtKRAWbGkFQhmbwhghy2ih1/TZEuvUDC3Pfcg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acrfwey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:55:58 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58C1vpw2010618;
	Fri, 12 Sep 2025 03:55:57 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4910sn8ybt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:55:57 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58C3ttAD25494158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 03:55:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48DF42004E;
	Fri, 12 Sep 2025 03:55:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CF2320043;
	Fri, 12 Sep 2025 03:55:53 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Sep 2025 03:55:52 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] gpio: mpc5200: Drop legacy-of-mm-gpiochip.h header
Date: Fri, 12 Sep 2025 09:25:52 +0530
Message-ID: <175764920912.610338.13254301742963097094.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <9652736ef05b94d9113ea5ce7899734ef82343d1.1755520794.git.christophe.leroy@csgroup.eu>
References: <9652736ef05b94d9113ea5ce7899734ef82343d1.1755520794.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: beHP3LA_vYPGRcb4LRNmEu-Po4o1Cdrj
X-Authority-Analysis: v=2.4 cv=Mp1S63ae c=1 sm=1 tr=0 ts=68c399ce cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Aed0_w8-hmYJHLjk3vgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: beHP3LA_vYPGRcb4LRNmEu-Po4o1Cdrj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX0sXKcZ4Tq3pq
 9NKsl0cJUm99Wd6leJ3o0yGx+hu7i1UBl/d3Gy4IthtNjPD3Sg/Lzx876di89oycKw3/3fAKmNU
 RumV9uibbQEoCObngwE75DEr68zvGbuDBkUspNu2YiUinyVjTeRmKDrmEEwNTrgwjM+x3t0j9NW
 GglaSI0stzwbZG2aJ4bLs4uJLsYeEimPA4ArN/hF3MiPW2hRqfZrdQFhBiRgcJntrN9ZVK2pkFn
 fLDFl3mzLxV17xky37pio0mHOIYp86/lXnXpNxVAPJrcHYsCegXiGQ48OyVh6MGSW28RM8fSiQa
 vy6F4lF1Kf8+QhlYP5eYUsh5zCOQY37CHAWrYM7biMgDjBIpE4AW6zdzz9+kOtd7D2MHJuH6kLl
 TtKwavmz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1011 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060000

On Mon, 18 Aug 2025 14:42:24 +0200, Christophe Leroy wrote:
> Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> file provides an OF API that's deprecated. There is no agnostic
> alternatives to it and we have to open code the logic which was
> hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> drivers are using their own labeling schemas and resource retrieval
> that only a few may gain of the code deduplication, so whenever
> alternative is appear we can move drivers again to use that one.
> 
> [...]

Applied to powerpc/next.

[1/1] gpio: mpc5200: Drop legacy-of-mm-gpiochip.h header
      https://git.kernel.org/powerpc/c/e7a6475cc0c32213e87ec190d90b8f1440ff05ae

Thanks


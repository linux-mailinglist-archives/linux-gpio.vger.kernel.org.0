Return-Path: <linux-gpio+bounces-25988-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6715B54137
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 05:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95713A02F8B
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 03:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FA425C822;
	Fri, 12 Sep 2025 03:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Th13rJvs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C737E3398B;
	Fri, 12 Sep 2025 03:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757649373; cv=none; b=jKVkAtogUQPHVX0qCF/jDDozZSgui5k+A0OGTSiXiqg3NCuO4916pjCczS9z+oqL40j2XwZ+/MZPUwSZ33kmstR86FropXVHuKk0acCwhBEglQiUtQh38vlNYcBi/9p4pFeHJNqASHm1v1ael0M2ehEy4HUY6hwxqwKIYglqhFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757649373; c=relaxed/simple;
	bh=Mdxe8dwFZxHB4nQA70T4HG1W1IuU64d1n1ccIbY8hRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MZ4KRQwi6hN801y2kOVrIGAuz6iKXr+W6DCarL7rh7fvsNxr220X+RnlQFlgYJpwDf8g19vhr+nJ1gHbl0O+eZAKcvzSIZ5Ohlbru0XjgaFbNc4Bkodgu0BgOVPr6MSD0cYwaHoq9fQ4bPz/h14gAMwSIMvyxWuEOacifYRUd/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Th13rJvs; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BIwF5l006469;
	Fri, 12 Sep 2025 03:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Gmiaxd
	krNLO96B9FCYuP76PBc7174iLV9hIUuWXDB0M=; b=Th13rJvsHBt7Wc53Mg2k20
	E6/V6HyYJ/eaQYJFDbPmgK1y1eGSFsIUw86ToMpu5S40BrDQce6bheIbzDb0fPg+
	fUHUsLEQmbOwQ3KWw3FfGexB4K6dA0tFwX2ffZ+jXhpB0sl5DMhaKSBpdX44fPrP
	rnBPY6R0po4QpZyWlZadhw5G8FEp7U5BCbIQXN5ThZmZiDASXoM8MbqNpiE1tqvP
	+x/yyjcjc/gnm8Zr+yDCFExHl0Gdn1Y4+qdaryeJt6R1kCXPG/1BrwD8BYI+1BNJ
	7jQBjFrqXrX00rHCbEP6UDaj+SuHfdl9aeprD1Mmyg4Zlst2W3jjoNEspmKpR4IA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmx8yxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:55:51 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58C3npEk012567;
	Fri, 12 Sep 2025 03:55:51 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmx8yxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:55:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58C2OnVO017227;
	Fri, 12 Sep 2025 03:55:50 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4911gmru3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:55:50 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58C3tmjP42860986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 03:55:48 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81C922004B;
	Fri, 12 Sep 2025 03:55:48 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 547A020043;
	Fri, 12 Sep 2025 03:55:46 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Sep 2025 03:55:46 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] powerpc/44x: Change GPIO driver to a proper platform driver
Date: Fri, 12 Sep 2025 09:25:45 +0530
Message-ID: <175764920912.610338.16301114402472105584.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <29d89aa43536714b193d9710301341f838fcb5b7.1755519343.git.christophe.leroy@csgroup.eu>
References: <29d89aa43536714b193d9710301341f838fcb5b7.1755519343.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nIDoz3lwf_jFhPnXxuGf6H96HZfnXf00
X-Proofpoint-ORIG-GUID: 1kK3ZoQ90CPl4A6q6eoA1y9aVRlHnN2S
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68c399c7 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=1CWnjDJCROFCZy2uP2wA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfX1bsrrXJ2oTlu
 XIHgn21Gp5Nua96EoNYCNubVLS0Vo5gP0j8QIiqDFlca0wJCbT7RzPm4yUrkH7MY4AHkTJVQSzm
 kYXDFp1fFkhkxJoGpdcmPoC850YEVTWF2YOy6vc1j/e18XA8rvtEk74wy52b3kTFZXw9obiHoqY
 xlqpRuZ+pSXGUTU953ysTEavk/0KowHQhdsq9NZc9FKIRf1Gc6riH8FzckO6N+leKvuiWF8D15J
 Ae/ja6zVGTWOFw/U+mCJJ81Bqix9W9QAnk9ox0bmuSbnZOSkXXP952JNOGwFDHvxNa4+Qessu39
 yCDlq5jbtqArL6yDe/uXB7UEFiRWrUmzd+PeskCPxjyUk1NyTJO1h8bXz60g+sPmtc03rofeO5e
 U/UnB+BM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060025

On Mon, 18 Aug 2025 14:17:34 +0200, Christophe Leroy wrote:
> In order to drop legacy-of-mm-gpiochip dependency, first change the
> 44x GPIO driver to a proper platform driver.
> 
> 

Applied to powerpc/next.

[1/2] powerpc/44x: Change GPIO driver to a proper platform driver
      https://git.kernel.org/powerpc/c/1044dbaf2a77c9e1143753a620d830943da6a193
[2/2] powerpc/44x: Drop legacy-of-mm-gpiochip.h header
      https://git.kernel.org/powerpc/c/d2ad26e7b67e5a3d73221daf8207e848dd819bd4

Thanks


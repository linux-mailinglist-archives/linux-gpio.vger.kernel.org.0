Return-Path: <linux-gpio+bounces-25990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56081B54142
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 05:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E2581C243AF
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 03:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFE9272E4E;
	Fri, 12 Sep 2025 03:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sYwy0J/R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFB125B302;
	Fri, 12 Sep 2025 03:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757649380; cv=none; b=L8STsLOxCPubVosxyTqqSg5wcN2l4jqlt7WUEGFzEGdZ8NUdvVOtC+jpSXtzU7HJtmigCakDCts6dKooz4hxtMkzfETJo3UyuC6PZ2Ov2xf3qk9J98eGnaaXdlQ+WLz/N5uJHPM1+QfJWZytAT7E7q9POCJ4tEVZwmOR4Q/f66o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757649380; c=relaxed/simple;
	bh=tAT6nqhsjykwjajBWHzoyUyDSQ+BbVsb+UFkKk6N2vY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rJtP4uVdlg4U3E/ukgp1jR2jSTQDKDUwIDrJ10GiK4rcJVRXVWuql0bqliM13VTDWQl1Oy2TbMO3u8gCNHZVMFQkf0jo271Ur16C7HpMsL0H46p7S/SAg5iZv/uapIROW+s7vTg6BWI9xe0V+eUGwvVJEHl/Rc4atmwSlM5zj0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sYwy0J/R; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BI96fQ021177;
	Fri, 12 Sep 2025 03:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=I5vXjw
	jH8i1nZolZJv78QvaSU6frydNqBJWM31HcyjQ=; b=sYwy0J/R8boQ0J/ehGwutr
	nayPvlxR3YYpsmVVwTV6+rnCWaZ4bQfsNDhkHxDceYGoL4uy6ndAYK8DTI+Ijggb
	COmjfUBiCLRoGoUUh83oZS0zbKDJM+ecRQse5yY0bEy3Q/Cs7zEPatmPd17EtAdX
	N1vhwzpifoCqdOTZYUhQxMdbTpWsIDkiGfJ3foaJT0bqLj/lvIyqHG7FjiHdOd2d
	n8tUt30QXCsE9TkcLhnM+15Tcv3x8YX8JXoj9peNybzKLmXATiMcMo6iji/1YUIW
	XKtiTqYFoYMuKShVKJdwqb5FfvsPGAK7WNfow30o0EY44nCR5b4u7NYObU+junCQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bct7tpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:05 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58C3s51g013547;
	Fri, 12 Sep 2025 03:56:05 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bct7tpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:05 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58C2IJOH010613;
	Fri, 12 Sep 2025 03:56:04 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4910sn8ycf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:04 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58C3u2Y322544890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 03:56:02 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FEE22004D;
	Fri, 12 Sep 2025 03:56:02 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11F552004E;
	Fri, 12 Sep 2025 03:56:00 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Sep 2025 03:55:59 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] powerpc/cpm2: Drop legacy-of-mm-gpiochip.h header
Date: Fri, 12 Sep 2025 09:25:59 +0530
Message-ID: <175764920911.610338.2762561793634068649.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <2662f24c539db393f11b27f0feae2dc14bb2f08f.1755518891.git.christophe.leroy@csgroup.eu>
References: <2662f24c539db393f11b27f0feae2dc14bb2f08f.1755518891.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfX5k+F+zwgGQYS
 gAsAdTpFgHgLSy7cekFKgdsLVCpbBj6kHeTbVvha+Akn6S5KG5Xuk4gu/hD9z74OX/gBn0jEhdk
 gTaNnWgkdLIT3G61nrA0ZGIIIN9YUSMa5/macdyXyErxz/+f7HJOD3ltz6CxNUO4hRQCXShLvjQ
 ab3RjTmI8AT+vSU8KBNmnQUyqwzhQ1GPTXbuyKTBhA3b3LmubhFx5TnOpdMlOSo2xGhDNOlyiEY
 BX7GlZrzqxXXoX2L+YHfq2f2O5FHXK5fuVbb0wbNwv+XFpvd8qhaDI/tod5boy8kO87A2Jm83Tz
 oaW4FpeZSDL1teMyCoOOBTHD7JmF0taVkmfRXJCa75t8QgEJu17mp9CNBhLe18QCmxaxdbVGLCI
 wMuRLWpl
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68c399d5 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Aed0_w8-hmYJHLjk3vgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qzXXkDVJV4_sdn_CYDFWKvnXRHWf1qWW
X-Proofpoint-ORIG-GUID: L0AqdZg9Qh6KuxfhZhC9w1Bz7o1STOKj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010

On Mon, 18 Aug 2025 14:14:36 +0200, Christophe Leroy wrote:
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

[1/1] powerpc/cpm2: Drop legacy-of-mm-gpiochip.h header
      https://git.kernel.org/powerpc/c/7f9bcf13069731fac48d8b44086fab179fbc04c9

Thanks


Return-Path: <linux-gpio+bounces-20110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D40AB6168
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 06:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65C573B3D5F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 04:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5200D1E98E0;
	Wed, 14 May 2025 04:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="F40Bit3q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A07C2F2;
	Wed, 14 May 2025 04:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747195452; cv=none; b=kbhhVjbNb/ZT1KNFz+86KMc7mgy4o53O/o5LyEoOAfYaYIoBcB+wtoqswCla8JBykDfSB6JqtsxtnWBgO5yIydhCJNPlhD0/En948Ss5M9allyx1T2wwnvIgv5Cs2sc7KeNqaHqbIEULjRpuS8OvM+gWiMl++K8lvAsTZeBR6wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747195452; c=relaxed/simple;
	bh=Sh+iLXrKD1yIz/w/00eMqWkTrEnhbUBv0MnbczsCucg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4ZUo0eBF7a963QZxhUt+uZrQd0WXEGzwyyZLpRlTyUJI3F5OHSKXSU7JeLlcfJjKwak436dBqfqalhsi4YoeUsRDesmLqXFcNrQ5hFPPv0Q4OZooCk9ic+aQHAUtf3BwK3huELJR9J/SQrngQC024e/iC92Lbrc+LLdQn+vvXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=F40Bit3q; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIbL8q019726;
	Wed, 14 May 2025 04:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=c6JdyF
	L+5iaP15aILY2xwumvyIIIMDAJ28MJwxBYXhI=; b=F40Bit3qxi5bouyh7wwbGc
	9w6aedU+VLyZByYqz29sXFYrxLyCEwclFi+Gd/xBFFhOEUyiwkLfPNJ4LMDEtjNE
	PgAr6c4A1Pdg3yNrCSSXrYHi+wFp8KGr7W4RJ8VZBXUZ5dqLw8aCbJkd8cQ0bwrC
	K+zRN5ARVlWHEVUw8lTA2rgsGvWOBskXwOUuZsTMmHX5LdhE9/MzBYA+/E67xSLT
	gcbQkdlAmEMDSwBUyx7b/aECOeGEDlEvwcWBvlnXx9ozppH4CQnrkFJZ/bQbZH7G
	6b8watb5KqFQrIwZUP8FMQ9fSqeZFql9Z2i+DUUS32EqueuxfG/t+RCUO37sNLYw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbh7a17b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 04:03:48 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54E3qKuT017810;
	Wed, 14 May 2025 04:03:47 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbh7a178-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 04:03:47 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54E26dGW021786;
	Wed, 14 May 2025 04:03:47 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46mbfpj71n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 04:03:46 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54E43jM253281188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 04:03:45 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02BC22007F;
	Wed, 14 May 2025 04:03:45 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A18112006A;
	Wed, 14 May 2025 04:03:42 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 May 2025 04:03:42 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Anatolij Gustschin <agust@denx.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/5] powerpc: convert board-file GPIO chips to using new value setters
Date: Wed, 14 May 2025 09:33:41 +0530
Message-ID: <174719490576.1067444.5838058716149030535.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
References: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=YbW95xRf c=1 sm=1 tr=0 ts=68241624 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=apvEF29HLGljTXJwJv4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: _no0KVR6N3SQ3aGhwUfGD6EKQ6mbVqv-
X-Proofpoint-ORIG-GUID: TSTl4_e1c1AkEQOoYk_vc4CpNj14QLad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAyOSBTYWx0ZWRfX3A01n4h/5by6 f04Tg7RrICKMHYgAXDOqgdKx+7f/2Mj2UrmrNwsSgGVs81ZealCEllLf+ErpfUjuFXX7i9uB69C VeD1OmgFAzOGCAacAbggTghaNGAE38WP6eAlByOQaZCEaaloHvLN0HViX0ooS7youynaO4PZ/2g
 6vbJCxjwJRpJS8IyqlIPQXRdO+NaSzQYRcxKN5SMDcs+UDur3nc3jGlOYqQ1LmI+AVo8eq8wQET f5tF3Qzzo8ACJziQ/Gy9vg4g/GuEIgcc1tZiaofHIYNEqtj04TMwjy8iNWfm8ust1uKO/XXu8RE YKJfLOwoqwj8cawL/iz7cxewx7kPs9yLzhRU4oLxJH0TsQyMYH/mR/c95DZju/ax4MQFviFJYuA
 t045uou7S9VrM3odY8Oi71z8Qrqs5o6BDMI/UJXTXy9Mp79xs7QoVESIqFR/JLTm/waCQ/fW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=995 clxscore=1011 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140029

On Fri, 02 May 2025 10:59:46 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all powerpc board-file level controllers.
> 
> 

Applied to powerpc/next.

[1/5] powerpc: sysdev/gpio: use new line value setter callbacks
      https://git.kernel.org/powerpc/c/54ac723320fcb0fe42aaa42ea800697450b75668
[2/5] powerpc: 83xx/gpio: use new line value setter callbacks
      https://git.kernel.org/powerpc/c/077f8733252dcfa738bcf0cfbf6820b26a7ba084
[3/5] powerpc: 44x/gpio: use new line value setter callbacks
      https://git.kernel.org/powerpc/c/5effda1c36f2338178c0582c0719cba58f24b0b3
[4/5] powerpc: 52xx/gpio: use new line value setter callbacks
      https://git.kernel.org/powerpc/c/c8fb184faaa0aefa3c1b1f8b3eba873c7ec4d840
[5/5] powerpc: 8xx/gpio: use new line value setter callbacks
      https://git.kernel.org/powerpc/c/5ea6a980b5da58a8dff550dbc2c2523ea492dd14

Thanks


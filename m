Return-Path: <linux-gpio+bounces-5676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F5E8AA8E0
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 09:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80893B22BC9
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 07:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C35F3B298;
	Fri, 19 Apr 2024 07:05:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbg156.qq.com (smtpbg156.qq.com [15.184.82.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B307243143
	for <linux-gpio@vger.kernel.org>; Fri, 19 Apr 2024 07:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.82.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713510315; cv=none; b=sGwp3lHnUlZF2xDel6Aziba1yqZ9ltKH4kUO43zkfNzkt05Clro00F9lYjTJ0azzL2qjp60EJOGhUop0/L8FRwXbgC0HSzS5/SmZJkJa2QR2rPWJ8XbfddqcV9VRcNHM2FNYrggwNWaBW/3C9YSadMExhDBYGTvPlr8lgOrV41U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713510315; c=relaxed/simple;
	bh=8PYrVwihWEKnfBPv+dZo8Ce/XrKfV/qp4CBfZjoK42I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BiIXEy3t1RJPmJQw5dYsXGbg08p95NdsreLEQRLNFGQEfIe4JNvEAW04J+BT+VqrlKpieejOqXH6uXibxyGn5jnyycKcqH+V3GKFXpExp8Squr6L8AqcaQnlGdwZ8I1uiaDHRHC/F7ro6LnaOMo1p6itQlM5udP8DP8Nj3tPQyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=15.184.82.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid:Yeas3t1713510235t323t22484
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [125.119.247.132])
X-QQ-SSF:00400000000000F0FUF000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 15162911397788106260
To: <brgl@bgdev.pl>
Cc: <andriy.shevchenko@linux.intel.com>,
	<bartosz.golaszewski@linaro.org>,
	<elder@linaro.org>,
	<geert+renesas@glider.be>,
	<linus.walleij@linaro.org>,
	<linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<paulmck@kernel.org>,
	<warthog618@gmail.com>,
	<wsa@the-dreams.de>
Subject: Re: [PATCH v3 00/24] gpio: rework locking and object life-time control
Date: Fri, 19 Apr 2024 15:03:54 +0800
Message-ID: <02a101da9227$bda04cb0$38e0e610$@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdqSJCuofj3/aB1TTmeRQb3sZM13Tw==
Content-Language: zh-cn
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1

Hi Bartosz Golaszewski,

I ran into a kernel crash problem when I pull the latest net-next.git, and
finally it was found that is caused by this patch series merged.

The kernel crashed because I got gpio=0 when I called irq_find_mapping()
and then struct irq_data *d=null, as my driver describes:

	int gpio = irq_find_mapping(gc->irq.domain, hwirq);
	struct irq_data *d = irq_get_irq_data(gpio);

	txgbe_gpio_irq_ack(d);

The deeper positioning is this line in __irq_resolve_mapping().

	data = rcu_dereference(domain->revmap[hwirq]);
		
So, is it the addition of SRCU infrastructure that causes this issue?


Thanks,
Jiawen



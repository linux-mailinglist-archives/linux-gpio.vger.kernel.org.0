Return-Path: <linux-gpio+bounces-5706-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 604358AC740
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 10:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 927431C21513
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 08:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D5C502B6;
	Mon, 22 Apr 2024 08:40:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D051C433CF
	for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713775200; cv=none; b=tjvd/peGdfNdoH/izYghETFEv+VpdpIIUkTLBHzgjA5IUiqk4l6fRSCfuwOiVC8ddblQy8mEQq0Dn5NKIiQDQh26CaD/BZI26TQvT9lOufeMqz1xn15l6DNSk7IgsYUM7fuNDOouMOMniEwZ51BEmA4pr5kNFD40dGzrWqzo7gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713775200; c=relaxed/simple;
	bh=Y5LaT6VMQwV75sFLhiDLZlNUiEGLXlU7BLi/iw4fmdQ=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=bccQSKZE65S+bQzyplHC77W6iqBWS1c6zB1KvmaQkgyFzvNJ59uw4x8xR1XwdpaEEx3WBk9iwcjLgePuV/tkVHHkU/9t0x0Hi28eeSnfE+gkuAsWyD7R2XNLwfVwSXTcyU1LVKUMryEY9IMaTQH3vzZ2cbW4QaOOADwaCXnbHYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid:Yeas1t1713775098t358t44927
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [125.119.247.132])
X-QQ-SSF:00400000000000F0FUF000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 11855313605505495495
To: "'Bartosz Golaszewski'" <bartosz.golaszewski@linaro.org>,
	<andriy.shevchenko@linux.intel.com>
Cc: <brgl@bgdev.pl>,
	<elder@linaro.org>,
	<geert+renesas@glider.be>,
	<linus.walleij@linaro.org>,
	<linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<paulmck@kernel.org>,
	<warthog618@gmail.com>,
	<wsa@the-dreams.de>
References: <02a101da9227$bda04cb0$38e0e610$@trustnetic.com> <CACMJSeuGu4nCVsbSnTrJwEdU+RF0BKHbzS7A9Cf2CiM_stJPzg@mail.gmail.com>
In-Reply-To: <CACMJSeuGu4nCVsbSnTrJwEdU+RF0BKHbzS7A9Cf2CiM_stJPzg@mail.gmail.com>
Subject: RE: [PATCH v3 00/24] gpio: rework locking and object life-time control
Date: Mon, 22 Apr 2024 16:38:17 +0800
Message-ID: <033a01da9490$6c517490$44f45db0$@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKkRktGdWWxOHu8pOWwvozmol9uowIV96vBr8/aZvA=
Content-Language: zh-cn
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1

On Sat, April 20, 2024 5:29 AM, Bartosz Golaszewski wrote:
> On Fri, 19 Apr 2024 at 09:04, Jiawen Wu <jiawenwu@trustnetic.com> wrote:
> >
> > Hi Bartosz Golaszewski,
> >
> > I ran into a kernel crash problem when I pull the latest net-next.git, and
> > finally it was found that is caused by this patch series merged.
> >
> > The kernel crashed because I got gpio=0 when I called irq_find_mapping()
> > and then struct irq_data *d=null, as my driver describes:
> >
> >         int gpio = irq_find_mapping(gc->irq.domain, hwirq);
> >         struct irq_data *d = irq_get_irq_data(gpio);
> >
> >         txgbe_gpio_irq_ack(d);
> >
> > The deeper positioning is this line in __irq_resolve_mapping().
> >
> >         data = rcu_dereference(domain->revmap[hwirq]);
> >
> > So, is it the addition of SRCU infrastructure that causes this issue?
> >
> 
> This is irq-specific RCU that I did not add in the GPIO series. Please
> provide us with more information. Bisect to the exact commit causing
> the issue and post the kernel log (we don't know what kind of crash
> you trigger and what the stack trace is).
> 
> Bart
> 

Hi Bartosz & Andy,

Thanks for your replies.

I'm sorry for the misunderstanding, and glad this patch doesn't cause any
problems. I thought the issue was in this patch because of my mistake.
It's actually caused by other patches. :)







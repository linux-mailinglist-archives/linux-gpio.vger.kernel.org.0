Return-Path: <linux-gpio+bounces-26763-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA0FBB42C2
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 16:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FCDA3C5FE6
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 14:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269413115B5;
	Thu,  2 Oct 2025 14:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="uyl5NmVU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5079F1957FC;
	Thu,  2 Oct 2025 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759415652; cv=none; b=hxeNOyn7UyTbTxrIDXSn36s/jxE7vQEbdoOvUZEYAd+niC0QS4gifIjPR7dutbTQ2on/zPH93VyNkt8ZFb3HfnYCj/zImdU+7zk6LNXp7woWq4bkc8yv1/grLvj4hYZOAbxM2ndBgNh7+8WhSWaBmB1LVfKMhJlT/QD80ItK8s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759415652; c=relaxed/simple;
	bh=0+hBZlIHCcxmL043sNFgXlbynkcBYvJ/x1ZRv1zYs9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFPs0XoTM8GOn+zZMXBRvmVRjenue1Nyc9VzPkolUUEsreoE944yaERAeukpK+ku+Tt3X+HdWzlurxinMqNs0y8hI+IoR2TmO6cdtg2+lKdMpHlFU+Ho7gOczGMfC+932g5KhQLUxMMXMWRkfjq+/JS9p9MiQBo2oRzRBp3cDtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=uyl5NmVU; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 4300D40EA0BD;
	Thu,  2 Oct 2025 10:34:09 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1759415642; x=
	1761230043; bh=0+hBZlIHCcxmL043sNFgXlbynkcBYvJ/x1ZRv1zYs9Y=; b=u
	yl5NmVUyIWFGktDPw5cAzWvHaOSCFRaq67NZGA0UMT1Lv9LhpwEdHeyzthklGKbY
	MHCgbzczgX0p14POR8IIO2hyJgs9YEIy5fsgLLB4u18NA2ArKEO9aGwPSZKk4kEc
	kPJqnsd3W5RUvGqZVMkWgz/FrgOdbS3oT2keiEkIFo=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hvOBuQ72scso; Thu,  2 Oct 2025 10:34:02 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id CA82B45735E9;
	Thu,  2 Oct 2025 10:34:02 -0400 (EDT)
Date: Thu, 2 Oct 2025 10:34:01 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
Message-ID: <aN6NWQukTYWPGu_w@ada.csh.rit.edu>
References: <20250923133304.273529-1-mstrodl@csh.rit.edu>
 <20250923133304.273529-2-mstrodl@csh.rit.edu>
 <CACRpkdZ6_YkUsCNRFfRM1v68fpvAJcdqPRtAKTGqLqHf1geJog@mail.gmail.com>
 <aN1DlPjbQgzfmpUl@ada.csh.rit.edu>
 <aN6GNYXFiyZpqGVw@tzungbi-laptop>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aN6GNYXFiyZpqGVw@tzungbi-laptop>

Hello!

On Thu, Oct 02, 2025 at 10:03:33PM +0800, Tzung-Bi Shih wrote:
> To use revocable API, we need to identify what resources should protect.  It
> seems there are some UAF possibilities in gpio_mpsse_poll() after unplugging
> the device.
Yeah, that's what the cancel_work_sync is supposed to protect. This case is a
little weird because the task itself is what could get destroyed on unplug,
but it could be cool to have some guarantees around accessing `priv` and other
resources in the worker?

I'm open to suggestions if you have ideas. Thanks!


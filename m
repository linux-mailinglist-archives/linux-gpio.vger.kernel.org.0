Return-Path: <linux-gpio+bounces-2150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 306E082BC6F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 09:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52E5D1C23986
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 08:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F8739AC8;
	Fri, 12 Jan 2024 08:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="b2uV6SYu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [92.198.35.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3D854F9A
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 08:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Date: Fri, 12 Jan 2024 09:33:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=default;
	t=1705048386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=N3gaq7YdWXlfrkrGP1JtNPPAlHqp0V4ER0l28d4ph6k=;
	b=b2uV6SYuyKZjswuLSsobCl13C/jfGhAZDZKfiWODPxBsa7EtuM3YWIc8sGeTDB37zM8ECH
	wq+FIn4KmDbuFN/xPhinxdBSgd45KTsN1ofHgiv5jZDt1syEvEjcFfJF88XWZlqPvOUE0j
	voxBn9MMEJXC3CAKCF5emdJ1li44xHwI/xre5r/T+v7YcZQKiv7Kuj852PqY/3gQ/ss+QH
	en2IGvAJHZvSzBjXdbgXMyP4lXz37F3lukJ6BtcZhfwFcAN9vu+wduhWdB25WIFYvVAigx
	BNc1MJHHj5OIqBl9GMOXauXHEnnS/haZ342IB49fwQr5AlDM/6yGVYUvvA5GbA==
From: Alexander Dahl <ada@thorsis.com>
To: "Westermann, Oliver" <Oliver.Westermann@cognex.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: Assign line names at runtime
Message-ID: <20240112-bae1723ee5e0e88ea87c79ef@thorsis.com>
Mail-Followup-To: "Westermann, Oliver" <Oliver.Westermann@cognex.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <PH0PR06MB83342EF7DF19F93CF257756786682@PH0PR06MB8334.namprd06.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR06MB83342EF7DF19F93CF257756786682@PH0PR06MB8334.namprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Hello Oliver,

Am Thu, Jan 11, 2024 at 10:42:51AM +0000 schrieb Westermann, Oliver:
> I hope that this is the right place to ask a question in regards to
> gpiod, if not, feel free to point me the right way. 

Should be the right place I guess.

> We're transitioning from using the old sysfs interface to using
> gpiod and named lines. For most devices, we specify line names at
> boot time using gpio-line-names.

You mean you specify those in .dts?

> On some devices we have small differences between revisions or
> hardware variants, which causes lines to be swapped on GPIO
> expanders or just being used differently for between revisions. We
> started to handle this by overlays, but that requires to distinguish
> during the bootloader phase, which is hard to service and often
> unneeded. Especially when we want to rename a single line, the
> overlay needs to override all entries, which leads to duplication of
> those line name lists.

So essentially you have hardware variants.  In my opinion this should
be handled in the bootloader.  What about having a .dtsi for the
common part of the board, one .dts file for each variant, and the
bootloader picking the correct one?  This is probably less complicated
than handling with overlays.  Overlays are designated for a different
use case like add-on boards, aren't they?

Greets
Alex

> Is there a way to assign or change the line-name value at runtime?
> If not today, would that be a desired feature (as we're looking for way to test contributing back)?
> 
> Best regards, Olli


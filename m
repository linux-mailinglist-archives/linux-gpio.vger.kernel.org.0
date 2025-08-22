Return-Path: <linux-gpio+bounces-24775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 546CBB30A64
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 02:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27B2A189EFBF
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 00:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3521E6DCE1;
	Fri, 22 Aug 2025 00:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjbMm6I9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D043594E
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 00:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755822606; cv=none; b=daa+X0FYVvs2s3cNKStxlApmWsV3rgDzTM3/fkTk2hRMn03bS/6kLhAMr2BzlA5RYqv5pmXQrUvttNTDpc2sqf502kafNCc5+0DtVhCYjNT/sL6OltIBHitJFMpnxc13UV4xaRBlEm3PgPlpVnrCja2kbhXlk7ji6vNJpcnDwP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755822606; c=relaxed/simple;
	bh=gEGYyan3HUnOjOwxwG57X1Ri+rM0GIFxNJmbZMcztkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ScRAnZ8DwtZi5fDbX3/M+ghTzZkwjDQUuc8ML6oqHP7dUppvWBtMsKar2wqIiUt6gu8aZWTBgi1aiJLOCvmZWxpyGwF1K48i3+bo4X/uvthpmYDpJ8sRGKikFMkkqRsrbsYDlXNmsSvTspiwGAfSWr6Gly8trl/sg/TbQccHMdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjbMm6I9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E05C4CEEB;
	Fri, 22 Aug 2025 00:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755822605;
	bh=gEGYyan3HUnOjOwxwG57X1Ri+rM0GIFxNJmbZMcztkY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KjbMm6I9z5PoPDLkIdErAq6kaYuYyKt77rpZB67mclTfVbZxUM3c3wEMqRjFLH6AY
	 7DgnbyEgyLHgnYRULU71RvL8agcAJc78OhWlcufoRbPuty1AwX8tzPFksSTf8Q53kP
	 TuWbFMGXHfC9Va+fich8p7gPwDLwgh/opdAoMZgP8gUrO6RZwVh1uRemytP3Wkd+iv
	 2/awivEL8tPvzSEHFYce0sk+L8Wm/hUJdvvS0NIAHh1t0wyRRaoUwc9ziMytSI4Dy0
	 4OAlBnlDBxU4r1p3ZZiRYekOJQbkChhzoIDvEiyISP1EIaLCJ2HmKAaMLjit/3PFES
	 gnkAd6nyDqAKQ==
Message-ID: <f672f4c4-0f11-49aa-81ee-d72096b80825@kernel.org>
Date: Thu, 21 Aug 2025 19:30:00 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: amd: Don't access irq_data's hwirq member
 directly
To: Linus Walleij <linus.walleij@linaro.org>
Cc: mario.limonciello@amd.com, Basavaraj.Natikar@amd.com,
 Shyam-sundar.S-k@amd.com, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org
References: <20250821144942.2463014-1-superm1@kernel.org>
 <CACRpkdbzsgbTMiZfBHgQBsdkfH=Qhr798XLReGB7WhXLsuFrDw@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CACRpkdbzsgbTMiZfBHgQBsdkfH=Qhr798XLReGB7WhXLsuFrDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/21/25 5:16 PM, Linus Walleij wrote:
> On Thu, Aug 21, 2025 at 4:49 PM Mario Limonciello (AMD)
> <superm1@kernel.org> wrote:
> 
>> There is an irqd_to_hwirq() intended to get the hwirq number. Switch
>> all use to it.
>>
>> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> 
> Hm where is this supposed to be applied...
> My tree?
> 
> It doesn't currently apply to devel.
> 
> Yours,
> Linus Walleij

It was based off the commit that you picked up earlier this week.  It 
changes lines in that based upon Andy's feedback.


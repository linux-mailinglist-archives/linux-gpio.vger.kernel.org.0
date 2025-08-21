Return-Path: <linux-gpio+bounces-24762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34835B2FF77
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 18:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBF451D24E9A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 15:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49FB277814;
	Thu, 21 Aug 2025 15:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCstExyK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D751A9F84
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 15:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755791217; cv=none; b=Uc9V3Xjt36MBHFXfS0Y5hr5z9wndSvhqZMPKjcGdjxIcDMsPXnOdRbGCr89raWSPoJa3SNizMf+V8OhcjJ3KlxxPE3TkGIDZ8lXkOCKCWsIflW3MRnY5Th+S+IrpTFCUXEos+/Kr1HjC3i9say4PFtqQ3iy9OQQgxbSoLI3xvt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755791217; c=relaxed/simple;
	bh=LlKz+ZwsFQd1ieWDXFRvDiMRqILVUaNCzEIkRJN3wBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJxUj7jE+E8qBNcg4EdDb1njO2/z2c5tKmeZ5Yz4j9JvNnHzzwGU8ajhSskfGvOZ81gOA7Gi8ZMYcgTsBJfKBjykSPy7Z73YsKpzI0BSZ6cyu4BhlG3Pzuwo0UiR7XwyxZFe0zxRF8nWa8JYoOZ3JIOI2H65T9rsGiuiJDP8MV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCstExyK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BE4C4CEEB;
	Thu, 21 Aug 2025 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755791216;
	bh=LlKz+ZwsFQd1ieWDXFRvDiMRqILVUaNCzEIkRJN3wBM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lCstExyK/v7YC3+p2ogbUtTvhRd++71j4NqkbfOKBtauwY9+JDIjxtIBawmQqMehM
	 fPn6cQ3TuUlpBK3N4ZP24bEB0nSoyp7kxvsduPU9ImtKRSqIN1LPV4+B5xLkKByGu8
	 uOt3eUIeMYmXLpugc2AZfyB+ZIMkl8iEB/RvJLyG+vRk7AJb4ILM2Mpc/Aw3PvOitQ
	 XPvr0uPcna4THVE40jJlHGsBmbmrglnYWsZF8Kbw8bWukCif3dQoDOqPgV0YtFAZjc
	 qQ5ncvwc2+he5RBK4ew8rnN3jTVmDKXn1T9P53fT0UJAkpxt5L9h1y4uSI1LS/r72l
	 sbl32ROqOaycQ==
Message-ID: <21a552a5-d274-41d4-bb10-20615f44a102@kernel.org>
Date: Thu, 21 Aug 2025 10:46:55 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: amd: Don't access irq_data's hwirq member
 directly
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: mario.limonciello@amd.com, Basavaraj.Natikar@amd.com,
 Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
 linux-gpio@vger.kernel.org
References: <20250821144942.2463014-1-superm1@kernel.org>
 <aKc-eRIeLP3DOjQN@smile.fi.intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <aKc-eRIeLP3DOjQN@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/21/25 10:42 AM, Andy Shevchenko wrote:
> On Thu, Aug 21, 2025 at 09:49:11AM -0500, Mario Limonciello (AMD) wrote:
>> There is an irqd_to_hwirq() intended to get the hwirq number. Switch
>> all use to it.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks!

> 
> ...
> 
>>   	pm_pr_dbg("Setting wake for GPIO %lu to %s\n",
>> -		   d->hwirq, str_enable_disable(on));
>> +		   hwirq, str_enable_disable(on));
> 
> Not related to this series, just wondering if it makes sense to have this to be
> in IRQ chip core (OTOH, it will not tell about GPIO per se, just about an IRQ
> chip).
> 

It might be a bit noisy to be in the core.  If it turns out that such a 
message is valuable outside of debugging pinctrl-amd, no opposition to 
moving it though in the future.

The existing pm_pr_dbg() messages used by pinctrl-amd have been 
immensely helpful to find firmware bugs.


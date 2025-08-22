Return-Path: <linux-gpio+bounces-24807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3814B31910
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 15:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C90BE3BD57F
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 13:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9EA2FD7BB;
	Fri, 22 Aug 2025 13:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JIhfk55t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CB1296BB6
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 13:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868365; cv=none; b=rg/B7dyvyhtLw4JjDYz40Thv9SZVENi45+pPYMqtjCmu4pNUVNfTCaBB9Fk4lSUvl5JOIX9srBd5o+GuxMd3groPG53PKKFipckkfqOxtyFEiQv4gk45gvzbcdHIJ2JY24DYT/ONE19Ehk9ImfOLc0JAk38iOUE69YvCIcozcXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868365; c=relaxed/simple;
	bh=BCmUZZkf3LgaPQqjlU+nMQvtU+gHQhbLSSolKw+bf6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bDFYy39G/dugUOsycuVN7pLMkWpSoZnpcrejuhcVexOY7Rcwu/XI85KG+i5P8zxwRYSFiZatNtteCsf2AH0NauwM6av+65o6lSNFxAJbMMYCnnelEjB/JPi6+AFoCy4Q+6cGuqWEKKSaGRhgnOj39Ht8IHNi/XUJWzTMoKSc6AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIhfk55t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF77FC113CF;
	Fri, 22 Aug 2025 13:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868365;
	bh=BCmUZZkf3LgaPQqjlU+nMQvtU+gHQhbLSSolKw+bf6M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JIhfk55tNNDsep/jN15tIxKK3kX8MnKTCr317LZXfelBMqFaFCBsMt/PdLrj7Xmv0
	 pdIQrAD+qPYW7cwQPd7xD15DLEA/MwRhMmxHNBpgu4NkeeZsLdVfqBsI/MZRDqqShd
	 19jiz8Ly3dlG410jNWGHjaXP9dCfUu4Bl41uI+VZTc2Xhw4M5cQkp1zIahNp077WjS
	 TCCD+xQqaeWFxagjOKzCbnPeTZwjvOasUvfQM1ZDSpDp38+CENSECrLVsraOTYZev4
	 hZzIplBE4pfOnsmtqX4GmmErMMLMlrGiavtn3MrPgCC8CgWWN9E1HI3OvdLPGVship
	 JEWzWF2my3PNQ==
Message-ID: <24dc245b-8b29-4ef3-8f07-09599c67524f@kernel.org>
Date: Fri, 22 Aug 2025 08:12:43 -0500
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
 <f672f4c4-0f11-49aa-81ee-d72096b80825@kernel.org>
 <CACRpkdZKJ7BX8goR_6ik-ksDssFLQ8xw7SL06PpN0ZRNNccqgA@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CACRpkdZKJ7BX8goR_6ik-ksDssFLQ8xw7SL06PpN0ZRNNccqgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/22/2025 1:33 AM, Linus Walleij wrote:
> On Fri, Aug 22, 2025 at 2:30 AM Mario Limonciello <superm1@kernel.org> wrote:
>> On 8/21/25 5:16 PM, Linus Walleij wrote:
>>> On Thu, Aug 21, 2025 at 4:49 PM Mario Limonciello (AMD)
>>> <superm1@kernel.org> wrote:
>>>
>>>> There is an irqd_to_hwirq() intended to get the hwirq number. Switch
>>>> all use to it.
>>>>
>>>> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>>
>>> Hm where is this supposed to be applied...
>>> My tree?
>>>
>>> It doesn't currently apply to devel.
>>>
>>> Yours,
>>> Linus Walleij
>>
>> It was based off the commit that you picked up earlier this week.  It
>> changes lines in that based upon Andy's feedback.
> 
> Aha the single line pm_pr_debug() change. I applied that in
> fixes because it was just a oneliner and came with the other patch
> which was a fix.
> 
> But this multiline non-regression can't go into fixes.
> 
> I will move both of these over to -next since neither is
> a technical regression.
> 
> Yours,
> Linus Walleij

Sounds good, thanks!


Return-Path: <linux-gpio+bounces-11028-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CED9942CD
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 10:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C62028CDE8
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 08:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4CF1E131E;
	Tue,  8 Oct 2024 08:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EfW0N1xJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5D81E1300;
	Tue,  8 Oct 2024 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728376344; cv=none; b=K6YPeS6+SdNmAEPzgQ1FxVcONITJJb/75/bpLIT5JZyOwADzDA6oAp15fiyJoIIGPADfgIS/H0t0cXgu3NtHzwDACj220JxxYl+xAm0FJ0YjdT3GtAOEYwaLjay2wVQAsU3dCprFtcvZQG1sZn5SazwL7pzJ+5GpEgQomAjsEPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728376344; c=relaxed/simple;
	bh=L6hn56+wY3Cptqr18fuXGg+zcOl3Ut65We9gsf4eF8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2NytGtHHdGYDIcELA7I6DYWFk+sUp5BRuzfh9kuOsn6JVr3i9lK2Daf1A3f0cc34gdgr2IZwTAOjMIHfFdDss1Y9OTzqX4DrFJQvB4j8ZsUdzlB9DiRs7YhV34K4A6J6EUU40BeTDQ1LFnkpbuihdKSCxRiaf9B3wBiSBma1Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EfW0N1xJ; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=L6hn56+wY3Cptqr18fuXGg+zcOl3Ut65We9gsf4eF8w=;
	b=EfW0N1xJyCUF79glByvifp7jswsQSoJEFybOSsDOy9KVeOAsHSp2EAUBMYHrgk
	KN++s2mCF296fEOgNadLcGWB2bz6LN+fcixWHBp8wNBWFYKYwHvZAOGwlMPKPl5b
	xSysI5nUcDzWBHc4nA/Y1UpYNohA4JYmwHF211cWRcWbg=
Received: from [192.168.31.242] (unknown [27.18.107.81])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBXf4Tn7QRnmf5rBg--.6114S2;
	Tue, 08 Oct 2024 16:31:38 +0800 (CST)
Message-ID: <6a1a3e38-0c6b-4d79-a101-b3292a2ab3be@163.com>
Date: Tue, 8 Oct 2024 16:31:35 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add initial support for Canaan Kendryte K230
 pinctrl
To: Conor Dooley <conor@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240926-k230-pinctrl-v2-0-a9a36fba4b34@163.com>
 <CACRpkdYk9aCp7mdWJJTT-1cwNZC4RN_eB6v5rducDY5MGJ_dbg@mail.gmail.com>
 <20241001-stratus-overplay-96266c33ca89@spud>
Content-Language: en-US
From: Ze Huang <18771902331@163.com>
In-Reply-To: <20241001-stratus-overplay-96266c33ca89@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXf4Tn7QRnmf5rBg--.6114S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF1DAF1kJr4UKFWrZF15XFb_yoW8tr43pF
	93KFs0ka1UJw4ayrZ29anFyFn0v3ZYyr90gFs8KryUXF9I9a42qFWxKr4jkF9xCr4Fkr4j
	yrs0qw1xJanrXFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UOzV8UUUUU=
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiJxlyomcEoY7FgAACsl

On 10/1/24 8:32 PM, Conor Dooley wrote:
> On Tue, Oct 01, 2024 at 02:27:25PM +0200, Linus Walleij wrote:
>> On Thu, Sep 26, 2024 at 5:58 PM Ze Huang <18771902331@163.com> wrote:
>>
>>> This patch series introduces support for the pinctrl driver of the Canaan
>>> K230 SoC. The K230 SoC features 64 IO pins, each of which can be configured
>>> for up to five different functions.
>>>
>>> The controller manages the entire pin configuration and multiplexing
>>> through a single register, which control features such as schmitt trigger,
>>> drive strength, bias pull-up/down, input/output enable, power source, and
>>> mux mode.
>>>
>>> The changes have been tested on CanMV-K230-V1.1 board.
>>>
>>> The pin function definition can be found here [1], and most of the DTS data
>>> was converted from the vendor's code [2].
>> Bindings ACKed and patches look good to I applied patch
>> 1 & 2 to the pin control tree.
>>
>> Please funnel patch 3 through the SoC tree.
>>
>>> prerequisite-message-id: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
>>> prerequisite-patch-id: 704efc6e76814e1877748959d7319d558c8386c1
>>> prerequisite-patch-id: c2144cf468c57b856830a61615ba6ba501e8ec58
>>> prerequisite-patch-id: ced4a01ccd8ddab2fd308d543ddf47bd1641518a
>>> prerequisite-patch-id: f8b983b301d0c14f1448b9e4c321262a509e061e
>>> prerequisite-patch-id: 834b65b6a2b037daed5cffc6a41963622568dc9c
>>> prerequisite-patch-id: 2401703b57448c9ea2c3dc7650b4502491a28944
>> I don't know about all this stuff but neither bindings or code seems
>> to contain anything that won't compile so I just assume that any of these
>> dependencies are purely for patch 3/3 and I nothing blocks me
>> merging patches 1 & 2 so I just went ahead with that.
> Yah, this should all be cos I haven't yet applied
> https://lore.kernel.org/all/tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com/
> as I am waiting for a clock driver to be sorted out.

Thank you very much for your time in reviewing and helping fix the bug!
Indeed, only patch 3 really depends on the previous patches. We are now
working on clock driver. Should we deal with patch 3 after that?



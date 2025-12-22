Return-Path: <linux-gpio+bounces-29784-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF0DCD4D5F
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 08:01:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D878C3008EA5
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 07:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD801F03DE;
	Mon, 22 Dec 2025 07:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="vlKEaqml"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DADD3A1E66;
	Mon, 22 Dec 2025 07:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766386894; cv=none; b=ICQGgiL/UrmI/RXefPD7nRCtZy9AL1pa0cON/ylo5cCjejXPUPdZhBktuUyPd8E9BMvM23ShvZ77A8Z0kzlRpRlerasroJF320+GwfEQNgG87hLllMFVUoK7eUj0kA8sLqOHdTX5/GI0G55YR1mtdmN1XhPtpipTFo3iPJjCfmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766386894; c=relaxed/simple;
	bh=4HJFvb9Ox9PZAiofSEP3AN6/OLwk7bgK9AYpFBpWFPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHv57OLc8bbO5GCzNUu271tXdWLZEU+EA7iap5Faq5LnNiv1ID3km45yuJhZh4IYe/o23RoAAF/c1yasRiULZwFwg9FamMCQ/eHHWsqk5482josnV5Zrc67kUZJ/DiXdpEPs5L32ZM4MTRQv7Ro6URGPtT7Tb/qOOLvk3XPxTqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=vlKEaqml; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766386801;
	bh=cmmp6lLLUDdXVDTvW2oTdfXFjjrAm+H8jr1TXJEW55Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=vlKEaqmlifZYgozetLY+4rq7VSv2nHHRwVoi9hpdtNejoY7FPJv3csM6ZcXMYrQKY
	 us3i58EAb30cUvxmwx2ebOzz2+Ygua9KVIcdbYTEnHcIB9jiFKef6yeMjdp97otF+q
	 bLklw4nRIDyNStviK5Iv28DL/N5gymb7UcTNBdzU=
X-QQ-mid: zesmtpsz9t1766386799tde4ae350
X-QQ-Originating-IP: 6P/d1t6Kqo2N6X0v/AfK88dJ7gxquPj9VhH9hyQ5siM=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Dec 2025 14:59:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16583592576228146802
EX-QQ-RecipientCnt: 11
Date: Mon, 22 Dec 2025 14:59:57 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] pinctrl: spacemit: k3: add initial pin support
Message-ID: <74FFF1F2D1BF3EFF+aUjsbTB607IkAY87@kernel.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
 <20251220-02-k3-pinctrl-v1-2-f6f4aea60abf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-02-k3-pinctrl-v1-2-f6f4aea60abf@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MAN6sKHDZ5xSwCe9B0jlrXsFepgbR5oaQuuM4uBI0jEp0GeiXhF1Jxez
	i6mEjyoNJAUL+qdD9r/+/fhCC9X3GadayVQU+7/ovXWewrN5G0p9StgxUNo/zcF/Wx7EQk9
	xeQqDKJRUAw73M8scK+9ixfHY50RRuV3fcbtgxs30mBjK9XYLFxy+Z8GudAEk+DuakwgV86
	lihdb4tctQjP2L8fivudc7qKY3+ISvCvAGrp/tAJw1NOEdPtnsq0EYiZ1HKHLd0f7aNKCrJ
	24oVabGAk91AdOkYOZunnxd0wzaRvXW0CS/K7gKEkz5/MiSDJjOF4QdW4NId42xjmJXF+aw
	MQ66D16ngX+gWIFQfzXuCI2bNgh2MyaylzRgGDisLkbsebRErEroS48GJirjxihhzZgKW3W
	Po0LbyuL1UEE9qNa3azc4GaolhdLpzbq3pGtnqKhuNiiyLSAvU+iIVbNidIRtRwKuTRgE0F
	BTsl/iNNQFUuwKnQUbon2EqLlIjbyag3Uct1ur6noav0dSA1EWyCsrSsdM2aKsEDOGXWsUx
	mKxVXHvHcDfnSWBXXHPfq+Wijobbf5QOsjsnBTfcHefnxYi2G96azAHpRpGpz3lEgGDwrdV
	Ys3BiveAvpkMcOoNgS87fx7QOAIR++OnvxVu5LaRHpieXFpTJBM1yB4UdSNMzSzVElIBT6j
	hSqN1E5HdC2Edm8N1RgP04x3VqsraouZPS8qFF+kneAg4Qo8A8WWJH8oPbMHWoyP5uZc2B4
	5K6DqWHfHSdP+KwsxyOtltNmQ3Q6+vf0v7GFitxHlqXFEhyrS8sK48C0CMk5NMJD4z933k/
	s43fyUOf0sLzR/VENMPtwhWAiWjWibfIAH/0CuDj+5ax9V7LR2tj5MXJJAlqu4rq72H9/In
	U/gg2pM7JnjmUuWVIAAKYDF8CnZvLsP9I1wMzpqCvM57yky6EgyUWZUgYN3lA7D0dyAV9mL
	WY2LzS5ySh/OSvQzA8B6zoCX7K32Jm5HB30U2kipU5FgKjP2prGoxmY3S1xwdn/F5PAoYu9
	KbrxQA1ZJcOufoJkPuNmsb4Rw6TzUuW0IVfssjc3RsXwSCkgJTZheEkfnKGPI=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On Sat, Dec 20, 2025 at 06:14:54PM +0800, Yixun Lan wrote:
> For the pinctrl IP of SpacemiT's K3 SoC, it has different register offset
> comparing with previous SoC generation, so introduce a function to do the
> pin to offset mapping. Also add all the pinctrl data.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/pinctrl/spacemit/Kconfig      |   4 +-
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 354 +++++++++++++++++++++++++++++++++-
>  2 files changed, 352 insertions(+), 6 deletions(-)
> 
[...]
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
[...]
> +static unsigned int spacemit_k3_pin_to_offset(unsigned int pin)
> +{
> +	unsigned int offset = pin > 130 ? (pin + 2) : pin;
Is this necessary? I think it's hard to read. Why not:
```
if (pin > 130)
  pin += 2;

return pin << 2;
```
This avoids the extra variable and makes the code clearer.
> +
> +	return offset << 2;
> +}
> +
>
                      - Troy


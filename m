Return-Path: <linux-gpio+bounces-26922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE586BC7A83
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 09:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85A1C19E6F73
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 07:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DDF296BC5;
	Thu,  9 Oct 2025 07:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b="CHnmCLh3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com [136.143.188.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1A6222586;
	Thu,  9 Oct 2025 07:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759994297; cv=pass; b=gmdRTJM6IbcDDXRqo06uiN/Y25pEC/6m1K7fUGy9If7eMELabJaGHQh82/YdJ52FNJhvoR6yqQ9I0CEyud/W0kuW78drLaQ7hasHBhFwd9Iac7feiEJxGj/5Opu80OQJ9xV25wPNRoEOuZHBu/u+ijXRjJk+xfdC/NJXvCw4B2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759994297; c=relaxed/simple;
	bh=hwLPych/iGUpdYRMjrp4rrUo6rVr+73kaFmM05jqCoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X/9SPxGcYUSJWByQdJneUtFtPEzZDGm87oBUukg3DvXeN2I2LNK/JmSYgr+q0HzXmjGdmOurxlXlzOcq9XNZ+ktxCPKRRGY0XONO5BnFfKd/lx72QuTPHrSBLah0TfSWC8dt9PtA1Q11v+FOdKts0D+FsW0EqmHpEy+HCkjU1E0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b=CHnmCLh3; arc=pass smtp.client-ip=136.143.188.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1759994260; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E06nJFLnNFlF/ZVrED88NFtu7RX1jLjU8oMD7JNEBNBI7T4Yf5+MbEdntEjk23ekMXM51QWuQiAxWGz6otGOiHqtnb9ddHujbb7EwpH9mzZBDmDHXArlEJKcpo7w9vNNvPPlaVEKzGgSEm7VYK5oQ0fOojGBzs/EgRs3Kks/iIw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759994260; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eH4QJ/Q8hmT3jI69GgU7WpNcS21+ZzGe/t5+TjS91O8=; 
	b=h3abPsnwGxMk+fjcal1ODuBXToi6YhKersyjxw7A+bRnbbI79xfy9vhzWgFAkVyrfJ1IFJwHTZY7inlKP4XLdBVFYXWRzDfNth8DfSpsxz7o2ZGefyjETDIvwhv/2QsW9C2Fx69uiFpERWB7JLke4lG1P5H7uU1SqvD9ltlkn0k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759994260;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eH4QJ/Q8hmT3jI69GgU7WpNcS21+ZzGe/t5+TjS91O8=;
	b=CHnmCLh3hrNLDdv/xk9FWeRm1NMNFMcY1rcgrbiv+UDmgl8eUNH0SpjP+pWNriFj
	UikD41GM3y0oCJmT2aYzBjzZNpOcyCkt+fjL37swz3agkXrrhTNNubyg/a6EXigyeep
	2ZFe0kDrHtoLlYRRFHrRDvQE9bLcjH/lt1+8O2pI=
Received: by mx.zohomail.com with SMTPS id 1759994258322828.159065982056;
	Thu, 9 Oct 2025 00:17:38 -0700 (PDT)
Message-ID: <c75a89f8-9eb7-4300-979e-e11159dc6888@collabora.com>
Date: Thu, 9 Oct 2025 08:17:31 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: pca953x: enable latch only on edge-triggered inputs
To: Linus Walleij <linus.walleij@linaro.org>,
 Francesco Lavra <flavra@baylibre.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Maria Garcia <mariagarcia7293@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Potin Lai <potin.lai.pt@gmail.com>,
 Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
 Fabio Estevam <festevam@denx.de>, Ian Ray <ian.ray@gehealthcare.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251008104309.794273-1-flavra@baylibre.com>
 <CACRpkdYDMRZMb+bDUgK5yiKU1Toy=S_ebo2_4WRasHxCqv+4xw@mail.gmail.com>
Content-Language: en-US
From: Martyn Welch <martyn.welch@collabora.com>
In-Reply-To: <CACRpkdYDMRZMb+bDUgK5yiKU1Toy=S_ebo2_4WRasHxCqv+4xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 09/10/2025 07:03, Linus Walleij wrote:
> Hi Francesco,
> 
> thanks for your patch!
> 
> On Wed, Oct 8, 2025 at 12:43 PM Francesco Lavra <flavra@baylibre.com> wrote:
> 
> 
>> The latched input feature of the pca953x GPIO controller is useful
>> when an input is configured to trigger interrupts on rising or
>> falling edges, because it allows retrieving which edge type caused
>> a given interrupt even if the pin state changes again before the
>> interrupt handler has a chance to run. But for level-triggered
>> interrupts, reading the latched input state can cause an active
>> interrupt condition to be missed, e.g. if an active-low signal (for
>> which an IRQ_TYPE_LEVEL_LOW interrupt has been configured) triggers
>> an interrupt when switching to the inactive state, but then becomes
>> active again before the interrupt handler has a chance to run: in
>> this case, if the interrupt handler reads the latched input state,
>> it will wrongly assume that the interrupt is not pending.
>> Fix the above issue by enabling the latch only on edge-triggered
>> inputs, instead of all interrupt-enabled inputs.
>>
>> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
>> ---
>>   drivers/gpio/gpio-pca953x.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
>> index e80a96f39788..e87ef2c3ff82 100644
>> --- a/drivers/gpio/gpio-pca953x.c
>> +++ b/drivers/gpio/gpio-pca953x.c
>> @@ -761,10 +761,13 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
>>          int level;
>>
>>          if (chip->driver_data & PCA_PCAL) {
>> +               DECLARE_BITMAP(latched_inputs, MAX_LINE);
>>                  guard(mutex)(&chip->i2c_lock);
>>
>> -               /* Enable latch on interrupt-enabled inputs */
>> -               pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
>> +               /* Enable latch on edge-triggered interrupt-enabled inputs */
>> +               bitmap_or(latched_inputs, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpio);
>> +               bitmap_and(latched_inputs, latched_inputs, chip->irq_mask, gc->ngpio);
>> +               pca953x_write_regs(chip, PCAL953X_IN_LATCH, latched_inputs);
> 
> This driver is used by a *lot* of systems and people.
> 
> It is maybe the most used GPIO driver in the kernel.
> 
> So I added a lot of affected developers to the To: line of
> the mail so we can get a wider review and testing.
> 

I don't have access to the relevant hardware to test this anymore and 
it's been a while since I thought much about edge vs. level triggered 
interrupts. But if the state of the interrupt is unilaterally returning 
to an inactive state, it sounds like that should be configured as an 
edge triggered interrupt, not a level triggered one...

Martyn

> Yours,
> Linus Walleij



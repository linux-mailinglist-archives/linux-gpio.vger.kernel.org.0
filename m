Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABB4D7BE94
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 12:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387756AbfGaKpO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 06:45:14 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44928 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbfGaKpO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 06:45:14 -0400
Received: by mail-lj1-f196.google.com with SMTP id k18so65078683ljc.11;
        Wed, 31 Jul 2019 03:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RFMhUlRMgqDVGRXkrlMnGgEZx3giZeumZb15yW0U0/w=;
        b=pDn8WA3oDxAcXv/PEaN53Fix6ETE/oZBGTCRKffJpvIjjLLquyImUl3e7qgFHIxGGi
         IfukiTmB4SUwf5Hct/tA8Zd1XFLALKINq5cjniPyAO1xkou1G1wwWdFnug0IS43TFsQZ
         rgWcHbiknLt/RZ43ecRD7Y1kuiBATQ7V/08wia3PRqcUdwfPsLzuTPUhPTLlj6ZTV+Et
         IEvZLkXi5SqfBIJiX0ORLL4pgMbTgt3qBXd6uPVnBRdjvOWh1Jr+TAqKern0A1sCT8/2
         b0E5+VzEojbXooJ66vLRGavmeXyYvnn4nlnsSzjEQGVNXCYY94d/fLdUnpydD7AWavvv
         qr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RFMhUlRMgqDVGRXkrlMnGgEZx3giZeumZb15yW0U0/w=;
        b=mTRcnGI0vYLbvbhrgh1L98rSKlN/BWX7GTIKVtcnoW+qzC3tY7m5lNktFewzvdnhW/
         yhCOPmZoUyoVB7LdSbsy20F3Z+WfMe2kIacaWJnZeFzjGSz1MsJbyJgfiHbDfmPWMmwX
         VQyKbWVPuif3BPVUaQK5NekYszBfiepBHklVf0EhlMxTIj97SkzOCkm5PK9AjKkklO9w
         9/1FE9/TnQ3jKdDoA+rf24J6HLX+H8kNN0NsMvBVrbwAp1bSD3WADQ7XJ3344M92pjK6
         Kf/3SqTC7+ep4ICs05qPMdGwNjFq0uRLy1uIOYMIpUCXT6sBUIfz6AGVXGnZVs1p4KXs
         DOTQ==
X-Gm-Message-State: APjAAAXSf1sTbNHBkHKiRBCb5io5L+meWepZ6CXwJvqjIDxoSY4QOKQt
        stzwjbvcJEdBhYHePymeZCIPRjqP
X-Google-Smtp-Source: APXvYqzJkRmWg1iafNslssUPxpmmnmMO/vkVa1xHw2no7+qHI7RvTgkqoWpp8XBVZoOTdV5Ih6WcFg==
X-Received: by 2002:a2e:b003:: with SMTP id y3mr64824367ljk.72.1564569906457;
        Wed, 31 Jul 2019 03:45:06 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id k23sm10001755ljg.90.2019.07.31.03.45.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 03:45:05 -0700 (PDT)
Subject: Re: [PATCH v7 07/20] clk: tegra: clk-periph: Add save and restore
 support
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-8-git-send-email-skomatineni@nvidia.com>
 <f90cf34d-c294-b23d-38e3-6de9a8fca7d6@gmail.com>
Message-ID: <e796e26e-830c-b1be-e368-c7ff177a61dd@gmail.com>
Date:   Wed, 31 Jul 2019 13:44:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <f90cf34d-c294-b23d-38e3-6de9a8fca7d6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

31.07.2019 12:50, Dmitry Osipenko пишет:
> 31.07.2019 3:20, Sowjanya Komatineni пишет:
>> This patch implements save and restore context for peripheral fixed
>> clock ops, peripheral gate clock ops, sdmmc mux clock ops, and
>> peripheral clock ops.
>>
>> During system suspend, core power goes off and looses the settings
>> of the Tegra CAR controller registers.
>>
>> So during suspend entry clock and reset state of peripherals is saved
>> and on resume they are restored to have clocks back to same rate and
>> state as before suspend.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  drivers/clk/tegra/clk-periph-fixed.c | 33 ++++++++++++++++++++++++++++++++
>>  drivers/clk/tegra/clk-periph-gate.c  | 34 +++++++++++++++++++++++++++++++++
>>  drivers/clk/tegra/clk-periph.c       | 37 ++++++++++++++++++++++++++++++++++++
>>  drivers/clk/tegra/clk-sdmmc-mux.c    | 28 +++++++++++++++++++++++++++
>>  drivers/clk/tegra/clk.h              |  6 ++++++
>>  5 files changed, 138 insertions(+)
>>
>> diff --git a/drivers/clk/tegra/clk-periph-fixed.c b/drivers/clk/tegra/clk-periph-fixed.c
>> index c088e7a280df..21b24530fa00 100644
>> --- a/drivers/clk/tegra/clk-periph-fixed.c
>> +++ b/drivers/clk/tegra/clk-periph-fixed.c
>> @@ -60,11 +60,44 @@ tegra_clk_periph_fixed_recalc_rate(struct clk_hw *hw,
>>  	return (unsigned long)rate;
>>  }
>>  
>> +static int tegra_clk_periph_fixed_save_context(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_periph_fixed *fixed = to_tegra_clk_periph_fixed(hw);
>> +	u32 mask = 1 << (fixed->num % 32);
>> +
>> +	fixed->enb_ctx = readl_relaxed(fixed->base + fixed->regs->enb_reg) &
>> +			 mask;
>> +	fixed->rst_ctx = readl_relaxed(fixed->base + fixed->regs->rst_reg) &
>> +			 mask;
>> +
>> +	return 0;
>> +}
>> +
>> +static void tegra_clk_periph_fixed_restore_context(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_periph_fixed *fixed = to_tegra_clk_periph_fixed(hw);
>> +	u32 mask = 1 << (fixed->num % 32);
>> +
>> +	if (fixed->enb_ctx)
>> +		writel_relaxed(mask, fixed->base + fixed->regs->enb_set_reg);
>> +	else
>> +		writel_relaxed(mask, fixed->base + fixed->regs->enb_clr_reg);
>> +
>> +	udelay(2);
>> +
>> +	if (!fixed->rst_ctx) {
>> +		udelay(5); /* reset propogation delay */
>> +		writel_relaxed(mask, fixed->base + fixed->regs->rst_reg);
>> +	}
>> +}
>> +
>>  static const struct clk_ops tegra_clk_periph_fixed_ops = {
>>  	.is_enabled = tegra_clk_periph_fixed_is_enabled,
>>  	.enable = tegra_clk_periph_fixed_enable,
>>  	.disable = tegra_clk_periph_fixed_disable,
>>  	.recalc_rate = tegra_clk_periph_fixed_recalc_rate,
>> +	.save_context = tegra_clk_periph_fixed_save_context,
>> +	.restore_context = tegra_clk_periph_fixed_restore_context,
>>  };
>>  
>>  struct clk *tegra_clk_register_periph_fixed(const char *name,
>> diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
>> index 4b31beefc9fc..6ba5b08e0787 100644
>> --- a/drivers/clk/tegra/clk-periph-gate.c
>> +++ b/drivers/clk/tegra/clk-periph-gate.c
>> @@ -25,6 +25,8 @@ static DEFINE_SPINLOCK(periph_ref_lock);
>>  
>>  #define read_rst(gate) \
>>  	readl_relaxed(gate->clk_base + (gate->regs->rst_reg))
>> +#define write_rst_set(val, gate) \
>> +	writel_relaxed(val, gate->clk_base + (gate->regs->rst_set_reg))
>>  #define write_rst_clr(val, gate) \
>>  	writel_relaxed(val, gate->clk_base + (gate->regs->rst_clr_reg))
>>  
>> @@ -110,10 +112,42 @@ static void clk_periph_disable(struct clk_hw *hw)
>>  	spin_unlock_irqrestore(&periph_ref_lock, flags);
>>  }
>>  
>> +static int clk_periph_gate_save_context(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
>> +
>> +	gate->clk_state_ctx = read_enb(gate) & periph_clk_to_bit(gate);
>> +	gate->rst_state_ctx = read_rst(gate) & periph_clk_to_bit(gate);
>> +
>> +	return 0;
>> +}
>> +
>> +static void clk_periph_gate_restore_context(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
>> +
>> +	if (gate->clk_state_ctx)
>> +		write_enb_set(periph_clk_to_bit(gate), gate);
>> +	else
>> +		write_enb_clr(periph_clk_to_bit(gate), gate);
>> +
>> +	udelay(5);
>> +
>> +	if (!(gate->flags & TEGRA_PERIPH_NO_RESET) &&
>> +	    !(gate->flags & TEGRA_PERIPH_MANUAL_RESET)) {
>> +		if (gate->rst_state_ctx)
>> +			write_rst_set(periph_clk_to_bit(gate), gate);
>> +		else
>> +			write_rst_clr(periph_clk_to_bit(gate), gate);
>> +	}
>> +}
>> +
>>  const struct clk_ops tegra_clk_periph_gate_ops = {
>>  	.is_enabled = clk_periph_is_enabled,
>>  	.enable = clk_periph_enable,
>>  	.disable = clk_periph_disable,
>> +	.save_context = clk_periph_gate_save_context,
>> +	.restore_context = clk_periph_gate_restore_context,
>>  };
>>  
>>  struct clk *tegra_clk_register_periph_gate(const char *name,
>> diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
>> index 58437da25156..06fb62955768 100644
>> --- a/drivers/clk/tegra/clk-periph.c
>> +++ b/drivers/clk/tegra/clk-periph.c
>> @@ -99,6 +99,37 @@ static void clk_periph_disable(struct clk_hw *hw)
>>  	gate_ops->disable(gate_hw);
>>  }
>>  
>> +static int clk_periph_save_context(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_periph *periph = to_clk_periph(hw);
>> +	const struct clk_ops *gate_ops = periph->gate_ops;
>> +	struct clk_hw *gate_hw = &periph->gate.hw;
>> +
>> +	if (!(periph->gate.flags & TEGRA_PERIPH_NO_GATE))
>> +		gate_ops->save_context(gate_hw);
>> +
>> +	periph->parent_ctx = clk_periph_get_parent(hw);
>> +
>> +	return 0;
>> +}
>> +
>> +static void clk_periph_restore_context(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_periph *periph = to_clk_periph(hw);
>> +	const struct clk_ops *gate_ops = periph->gate_ops;
>> +	struct clk_hw *gate_hw = &periph->gate.hw;
>> +	const struct clk_ops *div_ops = periph->div_ops;
>> +	struct clk_hw *div_hw = &periph->divider.hw;
>> +
>> +	clk_periph_set_parent(hw, periph->parent_ctx);
>> +
>> +	if (!(periph->gate.flags & TEGRA_PERIPH_NO_DIV))
>> +		div_ops->restore_context(div_hw);
> 
> Could you please point to where the divider's save_context() happens?
> Because I can't see it.

Ah, I now see that there is no need to save the dividers context because
clk itself has enough info that is needed for the context's restoring
(like I pointed in the review to v6).

Looks like you could also implement a new clk_hw_get_parent_index()
generic helper to get the index instead of storing it manually.

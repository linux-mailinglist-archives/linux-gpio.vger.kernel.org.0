Return-Path: <linux-gpio+bounces-25540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3CAB42BC5
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 23:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBFE87C7537
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 21:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476B92EB5C0;
	Wed,  3 Sep 2025 21:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCRfsMkJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858262EB5A1;
	Wed,  3 Sep 2025 21:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756934595; cv=none; b=oAOy3VFMO40asUH4RWayNKyV9OUNg3DZIYWh2YaLr8tR3iEnt6BdrZqy8GcQCPm7J9pV/rX2rap9HSs0amxZkBlHUFev/exXlrAftEtXMAVbuDi/QWCgfWqACJz3zNsmuQQ+PaWc9Q6zh1z9XaqE8m9bUd2pQCXqQkaKHW1I0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756934595; c=relaxed/simple;
	bh=EFfaGYHkkM4//qMcQW3IBIJHy2lgmOPZhnnnEQ2JwuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2THJQKgT5eBJijfMb8IREu8ofA2UP022uZveF1znZlUVLSMRpJN5rsEYl7wxB6nLIokEinq39RQk8ZK+PKyxMrU0bjW1MhLfp/2kUsGTP25ab+uhPRSy66ulCCPE5uG1gZ8wJgX6Yzis15xq2+KtJd4FPW0YwqJfvElb7tKVrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCRfsMkJ; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3f663225a2bso3190485ab.1;
        Wed, 03 Sep 2025 14:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756934592; x=1757539392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdvC/q3PkRQo/ZNwbhEOws3yAGtXnpirNzlU+rVkbIk=;
        b=PCRfsMkJO0rlCV3NKZyfZn3eN9xferhX987gOwJzms3QK7ZvWNZcF4fgGv9Sx9ZFfT
         cSCZw2zWb7Xmvl8zK82DW1fCDqRzNRzJ4Bk0ziythDKK7pLahQADhZLGZ9SIKdvJsp6o
         5PEb0bxndqimFv7oK6/8W5hp7tXew/qk2KhlS3Qt7z6BcyKtVVNLRfohJXVJ7qmg/KzT
         +5w7eagAC9ZqI7iaql8QVFP7lJ620F/K1QgI/zKE/5xJ78gH+xWgogOXHn1yqp/EDGp8
         L5Q7sTu/Sz/14x2iteDqVPKEuV+FqKiWagedXF3cmjncBQ1MP0r76GIcWm8SL0bMJ2Kt
         O/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756934592; x=1757539392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdvC/q3PkRQo/ZNwbhEOws3yAGtXnpirNzlU+rVkbIk=;
        b=YKm2BPLc2cbSw2lqMipPuto+Hg2fo766/Lsx02LGqd6MVriwxo+w/FS3xX343Ccjen
         dcqAVvLwGHWkO2RENpIDuywDfWCD9L9YKDAlVj1j2PHmUQBLro7moPe5CuVDSgeDTIiO
         vqJDeTevrc54rFqRistFv0VvQ2PDshqq7D7SekPOpMd+/WE4HrDN1jURL7hfGAGZyIEH
         njPpToqM4lPsd7bpHvmrrzcBEYDg6MUm51iw2d5UiI4ZPs3L2i3Ti+LPUeXFxjJ82ft/
         91IzqsJuynqFD0MxAe4C/sjWQpJF3zPrDb73BAx62LRe7tKu3LKOs4HkY9HfXwRpEnqw
         3YnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBhZj1AGI3plVT4+RsKJsLagIoKpr1+WNmKn62P34H6rgJ167QWwIfW9W7dD1tctIDq4xOoYdBEVfYaQ==@vger.kernel.org, AJvYcCUO+2fzeZrYPPsKVBN/612LmZ6mP4Fm20NgXNva54LZQzzMHBNFOh8azbp2YkEEl/kfqNRhVoC7jAHd@vger.kernel.org, AJvYcCUjLbxyokuF9VrBsb/DeTKtGtKz6Cg53cY+JBbO/kKBowgP69nm1q5KJjpySMi1/33Q1D94cEf2/7txL1Tk@vger.kernel.org, AJvYcCUudoz3q1FBwJXE1KqpbiMH3yeC8Y5ykhnzWlA8iZBwSfiW5YqMFTvFBaDbAEZP73uXuAEqccb9ysIvtcBqZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRcKvRIgwjaMFAKk+66mVcbGG9kqPDZ97zC2taUYmsjR7qrrfj
	wX9NV9ReZ99wtx1vhvk8d7MecDMmkBkwVNJP9Xy3GacnpuNQvLQFXmkl
X-Gm-Gg: ASbGncueWsQjtlP2pJX6lzk+kfP7CVxC49bolI+/CPgVlx+VJve96IC/gowvd7an0rO
	R05Yio3I+L4gVR6ptuh+G6cUvKi8Ns4qQ00XxU2eapwrdf1gnlX6RrjT66uhc12W1vm3fRnr5om
	2ic/NwMmdrOxIzMi1cEww7/W5whP5yg+uiz84KuynFoWI7G2rmOOEYAoV3QpIGr5BgBstjvLp6Y
	HuRgzMdtOBoJS09zQmLgsb5g0UKszaJch+l2E+dXUr6Eoy3UbB/QggBymhnANmL24P4WioLcx1s
	Ry96NxXVGJ0qQDQmtzGTbb4Uasj6Rf9jZEGpPk6V/sgXgd+6X/SvSL2SY5dqo0HNvyon20MIkm5
	CB59KHc7YE+20NSZ9POM0BELeU+YMsbhYd8w2HdIwkb4XksvZA+0nfHf6KHOCD4NiWTTn9O6fHL
	9x5r+HCm5tmMW61IlwjkZzHu/W7A==
X-Google-Smtp-Source: AGHT+IF/tOmp9QeT/Z+M72DNKoiPdJ9j8kuLSdJ+STKH1knGUuKUmgO5BsEYUAWq9GI2F8o+FrTAXw==
X-Received: by 2002:a05:6e02:b46:b0:3e5:8344:49ed with SMTP id e9e14a558f8ab-3f3d410d588mr298436695ab.1.1756934592447;
        Wed, 03 Sep 2025 14:23:12 -0700 (PDT)
Received: from localhost (bras-base-toroon2176w-grc-51-174-89-105-238.dsl.bell.ca. [174.89.105.238])
        by smtp.gmail.com with UTF8SMTPSA id 8926c6da1cb9f-50d8f0d5787sm4570052173.19.2025.09.03.14.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 14:23:11 -0700 (PDT)
Date: Wed, 3 Sep 2025 17:23:09 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	linux@mainlining.org, Nickolay Goppen <setotau@yandex.ru>
Subject: Re: [PATCH v5 3/3] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
Message-ID: <aLixvcgoRIHoniv-@radian>
References: <20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org>
 <20250903-sdm660-lpass-lpi-v5-3-fe171098b6a1@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-sdm660-lpass-lpi-v5-3-fe171098b6a1@mainlining.org>

On Wed, Sep 03, 2025 at 04:39:03PM +0300, Nickolay Goppen wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> The Snapdragon 660 has a Low-Power Island (LPI) TLMM for configuring
> pins related to audio. Add the driver for this.
> Also, this driver uses predefined pin_offsets for each pin taken from
> downstream driver, which does not follow the usual 0x1000 distance
> between pins and uses an array with predefined offsets that do not
> follow any regular pattern [1].
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Co-developed-by: Nickolay Goppen <setotau@mainlining.org>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---

(snip)

> +const struct lpi_pingroup sdm660_lpi_pinctrl_groups[] = {
> +	LPI_PINGROUP_OFFSET(0, LPI_NO_SLEW, _, _, _, _, 0x0000),
> +	LPI_PINGROUP_OFFSET(1, LPI_NO_SLEW, _, _, _, _, 0x1000),
> +	LPI_PINGROUP_OFFSET(2, LPI_NO_SLEW, _, _, _, _, 0x2000),
> +	LPI_PINGROUP_OFFSET(3, LPI_NO_SLEW, _, _, _, _, 0x2010),
> +	LPI_PINGROUP_OFFSET(4, LPI_NO_SLEW, _, _, _, _, 0x3000),
> +	LPI_PINGROUP_OFFSET(5, LPI_NO_SLEW, _, _, _, _, 0x3010),
> +	LPI_PINGROUP_OFFSET(6, LPI_NO_SLEW, _, _, _, _, 0x4000),
> +	LPI_PINGROUP_OFFSET(7, LPI_NO_SLEW, _, _, _, _, 0x4010),
> +	LPI_PINGROUP_OFFSET(8, LPI_NO_SLEW, _, _, _, _, 0x5000),
> +	LPI_PINGROUP_OFFSET(9, LPI_NO_SLEW, _, _, _, _, 0x5010),
> +	LPI_PINGROUP_OFFSET(10, LPI_NO_SLEW, _, _, _, _, 0x5020),
> +	LPI_PINGROUP_OFFSET(11, LPI_NO_SLEW, _, _, _, _, 0x5030),
> +	LPI_PINGROUP_OFFSET(12, LPI_NO_SLEW, _, _, _, _, 0x6000),
> +	LPI_PINGROUP_OFFSET(13, LPI_NO_SLEW, _, _, _, _, 0x6010),
> +	LPI_PINGROUP_OFFSET(14, LPI_NO_SLEW, _, _, _, _, 0x7000),
> +	LPI_PINGROUP_OFFSET(15, LPI_NO_SLEW, _, _, _, _, 0x7010),
> +	LPI_PINGROUP_OFFSET(16, LPI_NO_SLEW, _, _, _, _, 0x5040),
> +	LPI_PINGROUP_OFFSET(17, LPI_NO_SLEW, _, _, _, _, 0x5050),
> +
> +	/* The function names of the PDM GPIOs are derived from SDM670 */

Not anymore, the names now match the other LPI drivers closer.
This can be removed.


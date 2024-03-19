Return-Path: <linux-gpio+bounces-4448-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FD587F9BF
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Mar 2024 09:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4643D282FCF
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Mar 2024 08:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B01548EA;
	Tue, 19 Mar 2024 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oqQDhAkp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C95A54776
	for <linux-gpio@vger.kernel.org>; Tue, 19 Mar 2024 08:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710836917; cv=none; b=TWSFRVHFu+P4DLgn9TrwckfDi7SVEpZrF/2x2xFecvHPX1kPDdJB5HjEMzSTG7G0MNuwI7YT9lK8/rCRgHnp6g3RXVVX1vFITUFJkwnIG6maMgljPmQtaIy6iQcBfd3u+VTAIkZWoI57e4DROWEJKpQVTyiam1uYThVyVQo88oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710836917; c=relaxed/simple;
	bh=wEOu2J6N3RicgE6VdikhaGkAHK9MlBxWFNBPisxCRwo=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=RZD80G8Ype8ESDnoXg88sSymIf3LJu6AjyHfiQeYVKLWV+lAp6+xzWfJkk7Useu3QvLavNavidxfRy5TM301ApuI75+lHyZbOlhWCcVsZusx/xz4YVo/7T/mM+/kPqkcmf+rUW50ghwCrwtAIICfcEsLD9i1sJWaXaw6rHmiKKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oqQDhAkp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4141088f1c3so13251415e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Mar 2024 01:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710836913; x=1711441713; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=hgFFAPN7B2IdqbSbHOUWcvyqPwWPHdQWlex71RuQvmY=;
        b=oqQDhAkpgLw5OUssGrIeyW21nyYmJJfiZEzHuuJBv2Q+Teo8dmTaCaztY2Y5JCM4lI
         OrjeHBZVNkizeBLsQ6o0vtAyBE3daTkROgs77VU5qAK9HSi7dMa2ypmLmCJhU8EyAKqM
         1vz3J+bF7xJKd8XN4QSiWaU103vA/Qo5kuLbkIM8BvT4ArTM7CKHwbJLmdbLCmOeJwCT
         +jkyoXRxHAHi31KJT4jkwL8idnVo28psaU0d/7m0n7oJdxMfEFziTNxWG7lwoTzcwCeH
         MLmAM/aA/ylmz3Aqy8++f6N4E4eHxMeM8o5rLbYodh46bSJljU0f5g0mHK5kID0q7PkW
         JAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710836913; x=1711441713;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgFFAPN7B2IdqbSbHOUWcvyqPwWPHdQWlex71RuQvmY=;
        b=MAGPqX//xAd+FZ5VStgqNNXvn5jjzl4zvs+TgOcPETyzjSxVpIqpqZytDHH/taJ78L
         h8Hd7IcjZBGWL9YUAxS/5iO6Ash4sPS8yU0tHLH/z0+EjxNIXVWa5YAqQND/QE/l2P5j
         fjr11dfHlHBVUemvnjIy9phGUVup1Z9gyAulsvdOMEN8QlhCDcFEslk1+gppQDZbVzRA
         XWWi6+Alr9DpxLUATyvmyfyOcik/Xo/9P9VKP0RdpUSZWPbw9VeX02+7jhScKdL+YTqA
         OxuUUeB1psH4tNBTh/ksJ4zwsfx2TvIRImaEDBabs7qMW3ilfjxXmPCEkfAPBf1wHCQE
         3oNg==
X-Forwarded-Encrypted: i=1; AJvYcCVH4SKLvTwcCXQX3nc81YdTgEsMeEDh3DBl04U0Z+lTR51GEM8xeT5lCllAokhsEiLLrzPUXS/p9qVq/zMLW8uxKB4N3IZpzc/pFg==
X-Gm-Message-State: AOJu0YxNnf7tyLMJWdBUqU9a/2yB4b3Fkh48C+7dSrl20kYVxhL7KuZB
	PElRbSwxN3KuZecc2qKJ0e4Lwx9UREFIpH6eaYic6sp2tBoQUg+BlbMwcjihVv0=
X-Google-Smtp-Source: AGHT+IF8VeQ4xCRzE1F2nR3lm7Kyoo5lbqorbXz3zLlgIR0czhWjHZf4ZYDwVRGEa2XhkhvSTql6LA==
X-Received: by 2002:adf:a358:0:b0:341:8666:ce2e with SMTP id d24-20020adfa358000000b003418666ce2emr913294wrb.0.1710836912716;
        Tue, 19 Mar 2024 01:28:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a757:fdcf:e3d7:eaed])
        by smtp.gmail.com with ESMTPSA id ay25-20020a5d6f19000000b0033e3cb02cefsm11883313wrb.86.2024.03.19.01.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:28:32 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-2-jan.dakinevich@salutedevices.com>
 <1j8r2jj24k.fsf@starbuckisacylon.baylibre.com>
 <cbfd9c66-cca5-49f5-9468-43710c48518e@salutedevices.com>
 <1jedc7hlg4.fsf@starbuckisacylon.baylibre.com>
 <d4cfef9e-3cae-4f1a-90b3-33d5707596f9@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 01/25] clk: meson: a1: restrict an amount of 'hifi_pll'
 params
Date: Tue, 19 Mar 2024 09:21:27 +0100
In-reply-to: <d4cfef9e-3cae-4f1a-90b3-33d5707596f9@salutedevices.com>
Message-ID: <1jsf0mfwwg.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Tue 19 Mar 2024 at 01:35, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 3/18/24 13:17, Jerome Brunet wrote:
>> 
>> On Sun 17 Mar 2024 at 17:17, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
>> 
>>> On 3/15/24 11:58, Jerome Brunet wrote:
>>>>
>>>> On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
>>>>
>>>>> Existing values were insufficient to produce accurate clock for audio
>>>>> devices. New values are safe and most suitable to produce 48000Hz sample
>>>>> rate.
>>>>
>>>> The hifi pll is not about 48k only. I see no reason to restrict the PLL
>>>> to a single setting.
>>>>> You've provided no justification why the PLL driver can't reach the same
>>>> setting for 48k. The setting below is just the crude part. the fine
>>>> tuning is done done with the frac parameter so I doubt this provides a
>>>> more accurate rate.
>>>>
>>>
>>> You are right, it is not about 48k only. However, there are two issues.
>>>
>>> First, indeed, I could just extend the range of multipliers to 1..255.
>> 
>> Why 1..255 ? This is not what I'm pointing out
>> 
>> According to the datasheet - the range is 32 - 64, as currently
>> set in the driver.
>> 
>
> Could you point where in the doc the range 32..64 is documented?
> Documentation that I have may be not so complete, but I don't see there
> any mention about it.
>
> Anyway, range 32..64 of multipliers is not enough to produce accurate
> clock, and a need 128 for 48kHz.

A1 datasheet v0.4 - Section 7.6.3.2

>
>> The change you have provided request a multipler of 128/5 = 25,6
>> If you put assigned-rate = 614400000 in DT, I see no reason can find the
>> same solution on its own.
>> 
>
> The reasoning is following. I don't know why 32..64 range was declared
> for this clock, and whether it would be safe to extend it and include
> 128, which is required for 48kHz. But I know, that multiplier=128 is
> safe and works fine (together divider=5).

You have not answer my remark.
Mainline does not do everything like the AML SDK does. Saying you are
copying it because you know it works (in your opinion) is not good
enough.

I'm telling you that your hack is not necessary and so far, you have not
demonstrated that it is.

Also the multiplier range in m/n, not m alone.

>
>>> But I am unsure if hifi_pll is able to handle whole range of
>>> mulptipliers. The value 128 is taken from Amlogic's branch, and I am
>>> pretty sure that it works.
>> 
>>>
>>> Second, unfortunately frac parameter currently doesn't work. When frac
>>> is used enabling of hifi_pll fails in meson_clk_pll_wait_lock(). I see
>>> it when try to use 44100Hz and multipliers' range is set to 1..255. So,
>>> support of other rates than 48k requires extra effort.
>> 
>> Then your change is even more problematic because it certainly does not
>> disable frac ... which you say is broken.
>> 
>> That parameter should be removed with a proper comment explaining why
>> you are disabling it. That type a limitation / known issue should be
>> mentionned in your change.
>> 
>
> Handling of frac should not be removed, it should be fixed to achieve
> another rates. But that is not the goal of this commit.

You argued that frac was broken and that was partly why you introduced
this work around. I'm telling you this approach is incorrect.

So either :
* Remove frac for now, until it is fixed, because it is broken and add
  comment clearly explaining that quirk.
* Or fix it now.

Your choice.

>
>
>>>
>>>>>
>>>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>>>> ---
>>>>>  drivers/clk/meson/a1-pll.c | 8 ++++----
>>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
>>>>> index 4325e8a6a3ef..00e06d03445b 100644
>>>>> --- a/drivers/clk/meson/a1-pll.c
>>>>> +++ b/drivers/clk/meson/a1-pll.c
>>>>> @@ -74,9 +74,9 @@ static struct clk_regmap fixed_pll = {
>>>>>  	},
>>>>>  };
>>>>>  
>>>>> -static const struct pll_mult_range hifi_pll_mult_range = {
>>>>> -	.min = 32,
>>>>> -	.max = 64,
>>>>> +static const struct pll_params_table hifi_pll_params_table[] = {
>>>>> +	PLL_PARAMS(128, 5),
>>>>> +	{ },
>>>>>  };
>>>>>  
>>>>>  static const struct reg_sequence hifi_init_regs[] = {
>>>>> @@ -124,7 +124,7 @@ static struct clk_regmap hifi_pll = {
>>>>>  			.shift   = 6,
>>>>>  			.width   = 1,
>>>>>  		},
>>>>> -		.range = &hifi_pll_mult_range,
>>>>> +		.table = hifi_pll_params_table,
>>>>>  		.init_regs = hifi_init_regs,
>>>>>  		.init_count = ARRAY_SIZE(hifi_init_regs),
>>>>>  	},
>>>>
>>>>
>> 
>> 


-- 
Jerome


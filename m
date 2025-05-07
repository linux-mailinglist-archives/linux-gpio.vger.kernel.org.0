Return-Path: <linux-gpio+bounces-19739-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE75AAE0D2
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 15:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F87C1C05DA5
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 13:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FB625D527;
	Wed,  7 May 2025 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IEfLgDe+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527EA4B1E56;
	Wed,  7 May 2025 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624859; cv=none; b=nG3ahp56tctaotnLRmzZ8dccWBI1YIXZfcm78ll4pTTGNfd7aQBvnFJv3pXXz9ToAsJh2JPB97ja6jl7h1V90x9LHLZf6KVaGLn58VKT7ZXveEyIlRHmNK3bDeRfXHFzKQsoTi3nVj7OpdxCi+h73kKBJiSKuGTJpDA77ASINaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624859; c=relaxed/simple;
	bh=ePYNvLF/uT/3s9a5Oo0wZEqktNFIqg4M2ov8DPZ+bgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDoE+QquSm/D4NAq6vcrfzCLJ+EH+7hMA9LthuOf/3jZFXNp0vtsi061i3/3CnLKqmRA7xEIqS8rUPtTIJXVSlpuAPZVA9BTycpk4GNp3asriZUUNuAs8qyRKiSILGETw+FNTye++BjMydc1bRqXccZENYsKqxoTZHznEZQsYxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IEfLgDe+; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C5554383B;
	Wed,  7 May 2025 13:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746624854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+y+wTpdH625sk4mAeZjjUZDNC1BElXCoxV+0KrqI/g=;
	b=IEfLgDe+cOyZEkLvNSXizukIH/WBXpBQImQ8WZwJSZG736/RYhijzlgeWIWUS1wGDCZ5re
	sqP3JgyEClOQZZINRcgmRNluwL9LBWMkcKewOgtOkk1ST1Tkuz3XStQ8Fq0Yr+7IGO+eXR
	ew0nwzSI3z0+Epilc8VcTbx7YkQDcxDzzLgP5qupDF0mneHhmxUfJCTUmzAY7ZdetDaRoc
	CNikGahTiESfKUujsC5ZnVydLuukvlx8FSNkbY0pKKjk6XjSQgnQsGtLMgUhNNL122XDLL
	0+8Q1SJVeXq9+lkwYahNLfPkrvh6TYPl9QfdE67PWHYuV9ei2LMSsH9/5Ll/jg==
Message-ID: <0af29bac-ebe2-4448-b708-f0b9258544e7@bootlin.com>
Date: Wed, 7 May 2025 15:34:12 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] pinctrl: Add pin controller driver for AAEON UP
 boards
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-12-3906529757d2@bootlin.com>
 <CAHp75VfFnd616FiG8XP_oW4MeMBrqj_nmi0xCOGUj-LG1ru-qw@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAHp75VfFnd616FiG8XP_oW4MeMBrqj_nmi0xCOGUj-LG1ru-qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeileelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhefgfeehveeggfeggfekhfehgfffkeeghfeuffeikeekjeehkeetvedthedtieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprghnugihrdhshhgvvhgthhgvnhhkohesghhmrghilhdrtghomhdprhgtphhtthhop
 ehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

On 5/7/25 08:57, Andy Shevchenko wrote:
> 
>> +#define UPBOARD_UP_PIN_MUX(bit, data)                          \
>> +       {                                                       \
>> +               .number = UPBOARD_UP_BIT_##bit,                 \
>> +               .name = "PINMUX_"#bit,                          \
>> +               .drv_data = (void *)(data),                     \
> 
> Wondering why we need to cast here and there if currently we all use
> constant driver data. Perhaps enable const for now and if we ever need
> that to be modified by the consumer we add that.

We need to cast as drv_data is not const, so the compiler complains.
Or I can remove const.
I looked at other drivers, some do a cast, others have not const driver
data.

> 
>> +       }
>> +
>> +#define UPBOARD_UP_PIN_FUNC(id, data)                          \
>> +       {                                                       \
>> +               .number = UPBOARD_UP_BIT_##id,                  \
>> +               .name = #id,                                    \
>> +               .drv_data = (void *)(data),                     \
> 
> Ditto.
> 
>> +       }
> 
> ...
> 
>> +static int upboard_pinctrl_register_groups(struct upboard_pinctrl *pctrl)
>> +{
>> +       const struct upboard_pingroup *groups = pctrl->pctrl_data->groups;
>> +       size_t ngroups = pctrl->pctrl_data->ngroups;
>> +       unsigned int i;
>> +       int ret;
>> +
>> +       for (i = 0; i < ngroups; i++) {
>> +               ret = pinctrl_generic_add_group(pctrl->pctldev, groups[i].grp.name,
>> +                                               groups[i].grp.pins, groups[i].grp.npins, pctrl);
> 
>> +               if (ret < 0)
> 
> Why ' < 0' ?

pinctrl_generic_add_group() returns the group selector which can be >=
0. So all values >= 0 are valid. [1]

[1]
https://elixir.bootlin.com/linux/v6.15-rc5/source/drivers/pinctrl/core.c#L658-L676

> 
>> +                       return ret;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int upboard_pinctrl_register_functions(struct upboard_pinctrl *pctrl)
>> +{
>> +       const struct pinfunction *funcs = pctrl->pctrl_data->funcs;
>> +       size_t nfuncs = pctrl->pctrl_data->nfuncs;
>> +       unsigned int i;
>> +       int ret;
>> +
>> +       for (i = 0; i < nfuncs ; i++) {
>> +               ret = pinmux_generic_add_function(pctrl->pctldev, funcs[i].name,
>> +                                                 funcs[i].groups, funcs[i].ngroups, NULL);
>> +               if (ret < 0)
> 
> Ditto.
> 
>> +                       return ret;
>> +       }
>> +
>> +       return 0;
>> +}
> 
> ...
> 
>> +       board_id = (enum upboard_board_id)(unsigned long)dmi_id->driver_data;
>> +
> 
> Unneeded blank line.
> 
>> +       switch (board_id) {
>> +       case UPBOARD_APL01:
>> +               pctrl->maps = upboard_pinctrl_mapping_apl01;
>> +               pctrl->nmaps = ARRAY_SIZE(upboard_pinctrl_mapping_apl01);
>> +               break;
>> +       default:
>> +               return dev_err_probe(dev, -ENODEV, "Unsupported board\n");
>> +       }
> 
> And actually we can get rid of that train of castings by switching to
> use the info type of the structure
> 
> (namings are just constructed without checking for the better or
> existing ones, choose another if you think they fit)
> 
> struct upboard_pinctrl_map {
>   ... *maps;
>   ... nmaps;
> };
> 
> static const struct upboard_pinctrl_map apl01 = {
>   ...
> };
> 
> ...dmi... = {
>   ...
>   .data = (void *)&apl01,
>   ...
> };
> 
> board_map = (const ...) dmi_id->driver_data;
> 
> ...
> 
> But since DMI will require castings, it's up to you as I don't like
> the idea of having that driver data not to be const in the first
> place.

I definitely prefer your proposal, so we can remove the switch case and
the enum.
I will just split the definition to compute automatically nmaps like this:

static const struct pinctrl_map pinctrl_map_apl01[] = {
        ...
};

static const struct upboard_pinctrl_map upboard_pinctrl_map_apl01 = {
	.maps = &pinctrl_map_apl01[0],
	.nmaps = ARRAY_SIZE(pinctrl_map_apl01),
};

Regards,

Thomas


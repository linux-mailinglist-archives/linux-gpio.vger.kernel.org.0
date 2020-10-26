Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41342299A49
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Oct 2020 00:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404095AbgJZXQx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 19:16:53 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46142 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404078AbgJZXQx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 19:16:53 -0400
Received: by mail-pl1-f195.google.com with SMTP id x10so3217648plm.13;
        Mon, 26 Oct 2020 16:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=glKnVskAvq0DaS01zSqToelSdPvN+I0Lwp6u1+qZsmk=;
        b=KCTRDLHK1sDl3AYXKhVZ5c0nOowUUL/oW1v44QU8IKvzoaSPyd4dVbHio3fldeh1tV
         v/qpdSc1TOOYf4PfGJOSCHAP+sUXxJXbCFRa0my67+NnVYlAViNZK2qFEX4oTEimf4V3
         /VSSFPSS6FPZjdKMfMlnY4Y3KoFdN7hXuxwzhtdD6YYGE4lwkcfaqzuBXd4gtiJOlYdZ
         ArlN5NUfZfMTxMQkBly1NlnAXKd/7M5uR7DIc7BjFFS4Q/0+Wlh4MdwJi5b1tgNryYib
         BQPPheWlLFmCa9bHoJqf0CF5oqMGhdLWIF1IXr4yEHwM4CEUuCedVnb/F+rbK2rjxdfE
         dfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=glKnVskAvq0DaS01zSqToelSdPvN+I0Lwp6u1+qZsmk=;
        b=ZVRqdwueMRLB+jmGSMfor9YxUXWSxwlnO7E0rqmtS3gYkcN6iGFNdBzy9oj8IeQDi3
         Pk0m+EOtrEWrF4m3FU48IvHNXRNKEARXBFQodH2N9UdJ2tTTNdWZrbS0w/Pp1Fegu2Vk
         07hv+TSrcwhlDyVrZiPVtOCYyWsUk/giX/nS3ua2J+Onb6AUi2/hpeY8SP0FJGNK1DV1
         xioIeGY0oGA5dnDLaG78tRst5lg+Oy5B8LHbfj3A35/9YJk6QpnYgJx4eAR4tFB0pGrV
         tzZGzf3HJPm8X6vVP8j1zE1M6WPGgYmhm3gVHwIm+8YHd1PL8JR2OCt9NtLBevjvonRL
         30vw==
X-Gm-Message-State: AOAM530xXfWhS0nA45lrofFPO35JtPQ0W3RXJgI9oF0YTE2yySxrVfTz
        mTuzNkDTcpskyOpmm7hSzCU=
X-Google-Smtp-Source: ABdhPJzYiTBndONP2HpGsAfuvj+Nxh+lwcEIlZ1hw55wYHlTUqsZbyisfKsp0uURWP3Y4I/UCFpwRQ==
X-Received: by 2002:a17:90b:111:: with SMTP id p17mr23265643pjz.159.1603754212404;
        Mon, 26 Oct 2020 16:16:52 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id f17sm13064570pfq.141.2020.10.26.16.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 16:16:51 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Tue, 27 Oct 2020 07:16:31 +0800
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] pinctrl: amd: print debounce filter info in debugfs
Message-ID: <20201026231631.6l6kei3z45cunzmx@Rk>
References: <20201026151600.2703-1-coiby.xu@gmail.com>
 <CAHp75VfZ+-rJFWVpowXyViA99_9tA5VaFLfJGH1WF4W=kQHr8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHp75VfZ+-rJFWVpowXyViA99_9tA5VaFLfJGH1WF4W=kQHr8w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 05:22:45PM +0200, Andy Shevchenko wrote:
>On Mon, Oct 26, 2020 at 5:16 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> Print the status of debounce filter as follows,
>> $ cat /sys/kernel/debug/gpio
>> pin129          interrupt is disabled| interrupt is masked| disable wakeup in S0i3 state| disable wakeup in S3 state|
>>  disable wakeup in S4/S5 state| input is high|   pull-up is disabled| Pull-down is disabled|   output is disabled| debouncing filter disabled|   0x50000
>> pin130          interrupt is disabled| interrupt is masked| disable wakeup in S0i3 state| disable wakeup in S3 state|
>>  disable wakeup in S4/S5 state| input is high|   pull-up is disabled| Pull-down is disabled|   output is disabled| debouncing filter (high) enabled| debouncing timeout is 124800 (us)| 0x503c8
>>                                                                                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>Thanks for an update!
>In general looks good, one nit below (sorry, missed it in v1 round)
>
Thank you for the feedbacks!
>...
>
>> +       char debounce_value[40];
>
>(1)
>
>...
>
>> +                               if (tmr_large) {
>> +                                       if (tmr_out_unit)
>> +                                               unit = 62500;
>> +                                       else
>
>> +                                               unit = 15600;
>
>Side note: Hmm... Shouldn't be 15625? As 1/4.

Thank you for discovering the inconsistency! I wrote these code based on
amd_gpio_set_debounce. I'll send an email to the original author to
confirm it.

static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
		unsigned debounce)
{
     ...
	if (debounce) {
		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
		pin_reg &= ~DB_TMR_OUT_MASK;
		/*
		Debounce	Debounce	Timer	Max
		TmrLarge	TmrOutUnit	Unit	Debounce
							Time
		0	0	61 usec (2 RtcClk)	976 usec
		0	1	244 usec (8 RtcClk)	3.9 msec
		1	0	15.6 msec (512 RtcClk)	250 msec
		1	1	62.5 msec (2048 RtcClk)	1 sec
		*/

		if (debounce < 61) {
			pin_reg |= 1;
			pin_reg &= ~BIT(DB_TMR_OUT_UNIT_OFF);
			pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
		} else if (debounce < 976) {
			time = debounce / 61;
			pin_reg |= time & DB_TMR_OUT_MASK;
			pin_reg &= ~BIT(DB_TMR_OUT_UNIT_OFF);
			pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
         ...
>
>> +                               } else {
>> +                                       if (tmr_out_unit)
>> +                                               unit = 244;
>> +                                       else
>> +                                               unit = 61;
>
>...
>
>
>> +                               snprintf(debounce_value, 40,
>> +                                        "debouncing timeout is %u (us)|", time * unit);
>
>(2)
>
>...
>
>> +                               snprintf(debounce_value, 40, " ");
>
>(3)
>
>Because of definition (1) can you in (2) and (3) use sizeof() ?
>
I've considered defining a constant. Obviously sizeof is a better
idea:)

>--
>With Best Regards,
>Andy Shevchenko

--
Best regards,
Coiby

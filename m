Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 045207A5AF0
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Sep 2023 09:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbjISHbp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Sep 2023 03:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbjISHbo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2023 03:31:44 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A86116
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 00:31:38 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-79a10807b4fso2033773241.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 00:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695108697; x=1695713497; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:references:mime-version
         :in-reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6m1yPUFpcEkGw98CCawBkJ/hpcU96hyVw6LqH50N6SU=;
        b=b1U1of78ekmqq2UgO+T0mw1qPpdqvBtFHpZ+YXEJaROw0nyhqVZ00U+HPtmEXvlqnR
         J1ggYdq7LP8rEHW4Z+yWTyM6bSEU8+X8nhUQY2VQGnSWKzslosp47uW68D1mYqFY+WF6
         DaLb5DANeZ7tEsoku9ucxMrdhynIYnatNY5U9UkBKwNzBFjNayED5OcBWfck+3S5hISD
         EBKLOnWQJiKapyZQlDwGWvLHj4NtgcxBV4/LjLsWkeOA/lztxRWskluitBdztTrYeab0
         ULS8H5DX4WxbDjH+w/bbi3IXM8OEzqLcW04m0FLVWLslJrRnhojevjN833TILkiGKhJA
         Ta9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695108697; x=1695713497;
        h=cc:to:subject:message-id:date:from:references:mime-version
         :in-reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6m1yPUFpcEkGw98CCawBkJ/hpcU96hyVw6LqH50N6SU=;
        b=M2LHjHFP8OoV8ZQYwPCwwqeneDsCOtMWXdBilF+7UTUxKNz3hSV7JEAdOWkalb+3kO
         8igspxtDZKEgMzlDsFJZ5PI4R4KF6QQ5W6rfl/5LsapuoO3D1JmmOrRueGoCmcFgxLsG
         x0cW2BC/h9ynOUQjhXe90hZrpGNcPz6yBuBrU20pcqYl25y14W7rokfcQC9KLsU/VGYU
         t3+1ZDSVWM8ALyac/AX1o3IC0+k2o6F9qIl47vb2f4N87/hhiz/HzbM6zC7D3CNPPd5B
         pV8WedyrAe0rdmly1B97leVcu2AGKXOCxP9g1JowpczDx1KeIIefSvz2OCrTtrQtRpo2
         C7Sw==
X-Gm-Message-State: AOJu0Yy3sGkE+4noU4/UwlkimUblPTvrXtPq5kK10JdwVlD7gjrKv5L7
        +KbBHCvAtWvkYXlONtDAhDVDHLASuVFaWKz0M0FUjg==
X-Google-Smtp-Source: AGHT+IE8rCjQtlKc2if8YTV0enAa6Kk/BOsvnWpXprMCci8kFRLmjOh9/ECOm4fMAFQE3jXc05VutnuagD2i/Vq1fQI=
X-Received: by 2002:a1f:e3c6:0:b0:48d:1b20:268e with SMTP id
 a189-20020a1fe3c6000000b0048d1b20268emr8878654vkh.10.1695108697311; Tue, 19
 Sep 2023 00:31:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 Sep 2023 00:31:36 -0700
In-Reply-To: <ZQhtWNaCiHVu5yzL@smile.fi.intel.com>
MIME-Version: 1.0
References: <20230918145533.14642-1-brgl@bgdev.pl> <ZQhtWNaCiHVu5yzL@smile.fi.intel.com>
From:   brgl@bgdev.pl
Date:   Tue, 19 Sep 2023 00:31:36 -0700
Message-ID: <CAMRc=MfkzdFgwEuNGJYgxyCA_b__Ds-jA4S+jVT1ULJ9DTRhOw@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: sim: fix an invalid __free() usage
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        akpm@linux-foundation.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 18 Sep 2023 17:31:36 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Mon, Sep 18, 2023 at 04:55:33PM +0200, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> gpio_sim_make_line_names() returns NULL or ERR_PTR() so we must not use
>> __free(kfree) on the returned address. Split this function into two, one
>> that determines the size of the "gpio-line-names" array to allocate and
>> one that actually sets the names at correct offsets. The allocation and
>> assignment of the managed pointer happens in between.
>
> ...
>
>> +	unsigned int size = 0;
>>
>>  	list_for_each_entry(line, &bank->line_list, siblings) {
>> +		if (!line->name || (line->offset >= bank->num_lines))
>>  			continue;
>>
>> +		size = line->offset + 1;
>>  	}
>>
>> +	return size;
>
> So, now the function iterates over all lines and returns the size of the last
> match, correct?
>
> Why not
>
> 	list_for_each_entry_reversed() {
> 		if (line->name && ())
> 			break;
> 	}
>
> 	return size;
>
> ?

Because the line objects are not sorted by offset. They are added at the end
of the list in the order the user creates their corresponding configfs groups.

>
> ...
>
>> +static void
>> +gpio_sim_set_line_names(struct gpio_sim_bank *bank, char **line_names)
>> +{
>> +	struct gpio_sim_line *line;
>>
>>  	list_for_each_entry(line, &bank->line_list, siblings) {
>> -		if (line->offset >= bank->num_lines)
>> +		if (!line->name || (line->offset >= bank->num_lines))
>>  			continue;
>>
>> -		if (line->name && (line->offset <= max_offset))
>> -			line_names[line->offset] = line->name;
>> +		line_names[line->offset] = line->name;
>>  	}
>> -
>> -	return line_names;
>>  }
>
> Can be done in the similar (I see the difference) way for the consistency with
> above.
>
> ...
>
>> +	line_names_size = gpio_sim_get_line_names_size(bank);
>
>> +	if (line_names_size) {
>
> Of course this can be replace with...
>
>> +		line_names = kcalloc(line_names_size, sizeof(*line_names),
>> +				     GFP_KERNEL);
>
>> +		if (!line_names)
>
> ZERO_OR_NULL_PTR() check here, but I assume we discourage use of it.

Why? There are less than 40 instances of using it in the kernel. kmalloc()
returns NULL on failure.

Bart

>
>> +			return ERR_PTR(-ENOMEM);
>> +
>> +		gpio_sim_set_line_names(bank, line_names);
>>
>> -	if (line_names)
>>  		properties[prop_idx++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
>>  						"gpio-line-names",
>>  						line_names, line_names_size);
>> +	}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

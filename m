Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0C917A98BF
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Sep 2023 19:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjIURwW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Sep 2023 13:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbjIURvp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2023 13:51:45 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1F946E48
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2023 10:26:18 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-59c215f2f4aso15757067b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2023 10:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695317173; x=1695921973; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2yMALxVMz8eu5uuCFT9jsKazczGt2OLOMSS4WKXUPfs=;
        b=TxCTmEjHuT1pFEY7VuAnJVHLH/HACk4c2gOxUDW31XsZ/qsDq91QcLGwXRVw1HYtC+
         mDmH/Kdifr5R3R+pkBj1lrfR20CwRU/xrapmEZrphS76WckBDs6LJ4sv0lw6YW6Nu0OO
         5e8o1hOG1dgF7LUMVJFLnu3TVP8zvbTHC8YJaVfEabOZ5oF2pWgtwhyzXJViVS19+tZt
         KMZHC0Fy/3NNB+tistv92xDVTizVt2s58mCjGRkjt7ne0cdFhZDkPEprl1Wn2SmPA6yd
         09stksgUkcAeCf+i3VFGDXpNSKbhX0f6rQJHIDj4zZuua6CSp/9FrD32Jlq/uBanEcsy
         OBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695317173; x=1695921973;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2yMALxVMz8eu5uuCFT9jsKazczGt2OLOMSS4WKXUPfs=;
        b=LiWDgZfoxaUuT2zcxyUchT4eoGkeodQnYAerTK+aH/2mQN/+uH9CtDDWoPg68wQMe8
         jtqrL9N+vezwK2pZzLoTwZG3adyyOOKO+FbWOWWPkV06j9JMwUHQ5upIyAH0IkeIAqYC
         yHsMlsQa+wft5Jf+SdrA/nZxW8oWHpu4I5A1ZTFp66dFtgwfQ90hdqD5gCVKoiDlqz0e
         JybL75KfRp5BeNX6/l9GDPqoANHyT7W+bsWIEtaWaopkugMIFivPy+fYC+b8NM+rhRH8
         IpeEqEQAH6hnuua3huc6O1hN7IeMW5S8uM11OxSHxZBKI92sSTyINvAAD14yt/3+MTAQ
         k/xg==
X-Gm-Message-State: AOJu0Yw6Uv9i0hG8yBwYMWoamssKjbzlIu7J5lyE2DnOnyrX7zhXu9f2
        iUqOaX1v/JZ/VQzc79eQ8gzkFeqwz77d1LBQjwZSSddWJP5YnNzvD1E=
X-Google-Smtp-Source: AGHT+IG2MD5sh61wBj+qCb/GndH+IXTfCKZ2fjrPeCIUS4IVd/M7asl1O3/m4e4yOmvEJ6GOztcpu0F6OSG4Kp/sp4E=
X-Received: by 2002:a1f:ca03:0:b0:490:aa9b:4809 with SMTP id
 a3-20020a1fca03000000b00490aa9b4809mr4281527vkg.4.1695283936991; Thu, 21 Sep
 2023 01:12:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Sep 2023 01:12:16 -0700
From:   Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <ZQr3E/7crMrVxMp9@smile.fi.intel.com>
MIME-Version: 1.0
References: <20230920073253.51742-1-brgl@bgdev.pl> <ZQr3E/7crMrVxMp9@smile.fi.intel.com>
Date:   Thu, 21 Sep 2023 01:12:16 -0700
Message-ID: <CAMRc=MfvOL-ovQ89i7FASg=RoWHQPARGsc5Pxu9kC+roGqaE4g@mail.gmail.com>
Subject: Re: [PATCH v5] gpio: sim: fix an invalid __free() usage
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
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 20 Sep 2023 15:43:47 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Wed, Sep 20, 2023 at 09:32:53AM +0200, Bartosz Golaszewski wrote:
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
>>  	list_for_each_entry(line, &bank->line_list, siblings) {
>> -		if (line->offset >= bank->num_lines)
>> +		if (!line->name || (line->offset >= bank->num_lines))
>>  			continue;
>>
>> -		if (line->name) {
>> -			if (line->offset > max_offset)
>> -				max_offset = line->offset;
>> -
>> -			/*
>> -			 * max_offset can stay at 0 so it's not an indicator
>> -			 * of whether line names were configured at all.
>> -			 */
>> -			has_line_names = true;
>> -		}
>> +		size = max(size, line->offset + 1);
>>  	}
>
> As for the material to be backported it's fine, but I'm wondering if we
> actually can add the entries in a sorted manner, so we would need the exact
> what I mentioned in previous review round, just search backwards to the first
> satisfying entry. I don't believe the adding an entry to the list is a
> hot-path, so would be fine to call list_sort().
>

Given the need for the callback function, this would result in bigger code.

Also calling:

    list_add_tail();
    list_sort();

is not very elegant. I would possibly go for adding list_add_sorted() but
that's a separate change for the future.

Bart

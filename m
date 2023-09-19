Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B85A67A5B83
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Sep 2023 09:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjISHqZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Sep 2023 03:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjISHqZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2023 03:46:25 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C42C6FC
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 00:46:15 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-791b8525b59so2041599241.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695109575; x=1695714375; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:references:mime-version
         :in-reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=eECcdVLjmiHO6NMjf87/09ax+Y64fQCIr6VvZR8S1/c=;
        b=YvYI6b6FGtbNVgNACUCc9Y0q9yPDh7SB1HoTWQzo/l4F0LyYq2PQlSiY+tUgkKzagU
         aWSR8uRecGOEjll4O82h/TkflfH7sidaieoaYTNONDwNobdG8aKRk6JLsLkuXeqmVz4z
         3TWwQqnQ5Q7QV3FuTCpJR9u02LViOEbj5vlbh/hGD0JkNCoJO7IwJjsT5qIAm4a8icnF
         FCkWiUoj424MY8qVK3y+P155jlLaJg7ddwoIfk3rCeA5JOxkaXilhnPRjEBxuivwyqfO
         2VADr0CDuK0CryKYeTBUIMKsfeYfbmU15hR8v4OW863DO+Eged9oj9Ot+TzAnk/fh9uX
         yGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695109575; x=1695714375;
        h=cc:to:subject:message-id:date:from:references:mime-version
         :in-reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eECcdVLjmiHO6NMjf87/09ax+Y64fQCIr6VvZR8S1/c=;
        b=rCA6O9XF/nsoYjMmSVDHPQX3fPZSeaSx4KovWjZEXJFQwlE5fc0clJxq+OIEpwTZ7H
         M2wQr8A60SaENhvGUwjklVtSARatnMXg1PWWCwjBxK+zyB2TDRthU0yONqTaFPVBizX+
         COs6obUIzYxQ6nLNJvzP9CWg3uqqfcylimvpmumuIXkBhx0annwfH02+XxlAJp1dvbsa
         1Y6tLdi9b/chnnhY7x4Lb5cSJTSyQiWougf8UxgvYVFNP903dyYuWN51/s6LXBakSkeo
         zi7U8LLM03qkaI7If+x6ToN+TXPdZYgc/5MQS3O1ZEX6Bh5hl3pUaF3puCJ9kZUA0hdz
         4ESQ==
X-Gm-Message-State: AOJu0YxXTuTxP9O/PC4emVihG3uf8BKQX4h4s28/OLmTSvw+eAa18wIQ
        P2Xy5JOQ3JYDbiOCAgwXlZmwq3RBLuP5WNn/ITbiIA==
X-Google-Smtp-Source: AGHT+IF5Fz7RhZi2YY14vj8x220gc24lvhX+cS73uHVGaMrtE0TjWn8n2wN++r5GQE4d4iTNVvhyanfqr5OBqEDD6PU=
X-Received: by 2002:a1f:e082:0:b0:495:cace:d59c with SMTP id
 x124-20020a1fe082000000b00495caced59cmr8660034vkg.0.1695109574896; Tue, 19
 Sep 2023 00:46:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 Sep 2023 00:46:14 -0700
In-Reply-To: <ZQlPre4nnydZyDAm@sol>
MIME-Version: 1.0
References: <20230918145533.14642-1-brgl@bgdev.pl> <ZQhtWNaCiHVu5yzL@smile.fi.intel.com>
 <CAMRc=MfkzdFgwEuNGJYgxyCA_b__Ds-jA4S+jVT1ULJ9DTRhOw@mail.gmail.com> <ZQlPre4nnydZyDAm@sol>
From:   brgl@bgdev.pl
Date:   Tue, 19 Sep 2023 00:46:14 -0700
Message-ID: <CAMRc=McamALbJ2jtpeek9L3k2pX8rkpsqhMfgsBqaygG58-cTw@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: sim: fix an invalid __free() usage
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        akpm@linux-foundation.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        brgl@bgdev.pl
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 19 Sep 2023 09:37:17 +0200, Kent Gibson <warthog618@gmail.com> said:
> On Tue, Sep 19, 2023 at 12:31:36AM -0700, brgl@bgdev.pl wrote:
>> On Mon, 18 Sep 2023 17:31:36 +0200, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> said:
>> > On Mon, Sep 18, 2023 at 04:55:33PM +0200, Bartosz Golaszewski wrote:
>> >> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> >>
>> >> gpio_sim_make_line_names() returns NULL or ERR_PTR() so we must not use
>> >> __free(kfree) on the returned address. Split this function into two, one
>> >> that determines the size of the "gpio-line-names" array to allocate and
>> >> one that actually sets the names at correct offsets. The allocation and
>> >> assignment of the managed pointer happens in between.
>> >
>> > ...
>> >
>> >> +	unsigned int size = 0;
>> >>
>> >>  	list_for_each_entry(line, &bank->line_list, siblings) {
>> >> +		if (!line->name || (line->offset >= bank->num_lines))
>> >>  			continue;
>> >>
>> >> +		size = line->offset + 1;
>> >>  	}
>> >>
>> >> +	return size;
>> >
>> > So, now the function iterates over all lines and returns the size of the last
>> > match, correct?
>> >
>> > Why not
>> >
>> > 	list_for_each_entry_reversed() {
>> > 		if (line->name && ())
>> > 			break;
>> > 	}
>> >
>> > 	return size;
>> >
>> > ?
>>
>> Because the line objects are not sorted by offset. They are added at the end
>> of the list in the order the user creates their corresponding configfs groups.
>>
>
> Then your patch is also broken as it uses the last named entry,
> not the named entry with the greatest offset??
>
> Cheers,
> Kent.
>

Yes, of course it is. Ironically v3 was at least correct in this part.

Thanks
Bart

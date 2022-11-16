Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC21662BCD1
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 13:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbiKPMAc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 07:00:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233340AbiKPMAF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 07:00:05 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45E6419A1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 03:52:12 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso2130618pjc.5
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 03:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LumQeZjCjKVk2NcCFJ7XQg27qQhohVPunXFB2i4bXVU=;
        b=dU3FoWB5MP52X0XAP7BbVMHFd35DoaKDV1NigGzrPhCO3oDp7hUCQ3b9Sh3fuSnIVX
         g4UmD7v6HKMNJG5dTh/iJnnJA+mtq0cwRNcmw7AatMzvbRC/lovCqn+ihPOqFnYXxpen
         rm61hWEYSZolStvd2WArzY41iidIMVJqa2sy6ouQe/59l6ECx8EHTBZKlVyN5Wg9WWUi
         LgTpBIgrwESJguBUY9FooYK2w1/+7DjtgshA8yR9Yk3NKudS9r1dOOYSD4KMsYdcLWu6
         T06V6PmBCVdGUW2kbZmqfvJJN4JJZaog7g+20533dw3lnno+XsmE5YtJ/VUp9tTXPxJs
         Z9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LumQeZjCjKVk2NcCFJ7XQg27qQhohVPunXFB2i4bXVU=;
        b=l2VbkwrHmjQrVJrAgaxOXVXSnMKquX7jKAvbaeNRsfWrfyCJfzHs44+NzxRcxJAo1B
         vuwD334LNyz9N2+G7+MoNznl7Yu8qTKuN+jA+AGtWkyI/bOlviM1arthQdg1D/jCy6Go
         YJyg6M3ULHd5NIbHATD0YvRfgdEf7iBuToGFZIYR5kFGSDWVG3jEJzV1JQtt8bTEeosC
         HHmee7fOjGfiS5cNQroCGuyx4aorK39UAfPTWDjLoAJArgGS8BhsMiEXvmeGwJRgBtBP
         xE4YZUtj/ekeMap3LlZcbt7EdZYKxWeB6hQxwwC272G/7Z5AXGiNv9R3y0laJ2y/vzsX
         EP/g==
X-Gm-Message-State: ANoB5plqvt/TQXaqYtK+Wgvqf2MCE7XbyGCRDac/eRk4SCIjgpyR0Dbr
        HgL+W1eRsvVvXBW8towIOoFksJUyYfo=
X-Google-Smtp-Source: AA0mqf4APw/wEV5s1aTE968kK1Gc+LTfC4BK2gFvDx6EGFmw538L2Ea8cjMjwMe7LaCj9LF+ESFUYw==
X-Received: by 2002:a17:902:d1d4:b0:186:9ef5:4d59 with SMTP id g20-20020a170902d1d400b001869ef54d59mr8610258plb.89.1668599531887;
        Wed, 16 Nov 2022 03:52:11 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id t10-20020a63224a000000b00460fbe0d75esm9502553pgm.31.2022.11.16.03.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 03:52:11 -0800 (PST)
Date:   Wed, 16 Nov 2022 19:52:07 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Leszek Dubiel <leszek@dubiel.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: Elegant way to kill previous gpioset?
Message-ID: <Y3TO52Fn3XIqN8yY@sol>
References: <fc3da423-1107-83a1-1c94-afb2ac5fa7c9@dubielvitrum.pl>
 <57c25430-284b-36dc-7a68-70847bc1bdcb@dubiel.pl>
 <Y3R6hbBF5vKuwvFe@sol>
 <1608e9ad-d9c4-8856-569f-cd894ffc2836@dubiel.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1608e9ad-d9c4-8856-569f-cd894ffc2836@dubiel.pl>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 16, 2022 at 09:54:21AM +0100, Leszek Dubiel wrote:
> 
> 
> I was wondering if there is some "one-liner" that
> recofigures pin, something like:
> 
>                 gpioset -b -msignal --autokill /dev/gpiochip2 7=0
> 
> or
>                 gpioset -b -msignal --force /dev/gpiochip2 7=0
> 
> that does these two commands at once:
> 
>               pkill -ef "^gpioset .* /dev/gpiochip2 7=[01]$"
>               gpioset -b -msignal /dev/gpiochip2 7=0
> 
> 

Understand that GPIOs are a managed resource, like files, and what
you are asking for here is equivalent to a function that would kill
whatever process has a file open whenever you write to that file.
So, no there isn't.

It is really unfortunate that killing the process holding the line is the
only viable approach when using the libgpiod tools at the moment, but
better solutions to your problem should be available soon.
Alternatively you can use, say, the Python bindings to write something
that better suits your particular needs.

Cheers.
Kent.

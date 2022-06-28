Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3A7F55C2E4
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 14:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbiF1F0l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 01:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243952AbiF1F0j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 01:26:39 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB74B0C
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 22:26:38 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id 136so5883576pfy.10
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 22:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f36qJNmf/YXVruFhCWFi4u3ZGzXr0MxbayqxKD7RREo=;
        b=I5RMPNcXKgUZ4mKbO+NpJiv1PF5+Q1llp1CvN2oAWr6EDhgv5h6XL1mbgME5Z6+AxU
         LKC3qJu9QG8M+easQ8TKld4RREXmVsmi7Zx6rtnayO9eJ8sWtWR12U9OH/WPGyR7HNxs
         Ytv/iaTMbTgCO/0LUSzoCpiBs8IN2XxINGqXDsomEh5gvxRlB6wYtH+h0AlksyAol5tA
         UnJqadyXOoTDZASVSMi5Q22UtaW/OSJMmw3MTgtYVt9+Rb7jJ0fSvnm9Vg0dM3JaKl/c
         8CDpwiCXKGeb1G5gz09FECUaHD+WSlIKBKRYGblcZj0yUmJxFNeAD1VEkywsupCpL8By
         6gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f36qJNmf/YXVruFhCWFi4u3ZGzXr0MxbayqxKD7RREo=;
        b=8Iyh9RpU4um0EgqRZ/WfUrtakDTscrON6aVvJRDXIdtGqfNrP7T68zDz9DqDLcFIcL
         WxweRQEuxWzlFt6p49RAqVlDNsJVznUQIEioJnESi6oXk13M5JQRPEMNTMImWYl7KFfW
         w14Nu+2b2rPMoNlM1Q30SWYRkvLgWTa7iaVHOyLf+u1r1CzTrhdr0zuZvUnP8QESnS67
         ZgcHZ8Hb35NMKAn8Wgr6MguFlClC33zRBVo50Ds5fitRrjklNVPfSFp34RNQEk5wC9XT
         hG8M2UGj89elFDpACYbJsk5vbYMjiYhWAJixxYg668xgIoK7mpx9KA9WUIKO5veWnSWb
         /9Ug==
X-Gm-Message-State: AJIora9+Py8VK/viy0J1F/Zu9e9N+GixA0KtOfHxA2Io2uXx1D0GVe6k
        x13DPskwqLrEWLF2bcOK2wursGpKlFY=
X-Google-Smtp-Source: AGRyM1uN88zEz8/51lfhAEa1ND1Xfg+eIIFN6RIKSHZpwkRi9mldI/LdaE86Ih8gra/asa6sIufLnA==
X-Received: by 2002:a05:6a00:2444:b0:4fd:db81:cbdd with SMTP id d4-20020a056a00244400b004fddb81cbddmr2914648pfj.32.1656393997486;
        Mon, 27 Jun 2022 22:26:37 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id y16-20020a17090264d000b0016a12fab6c2sm8084927pli.307.2022.06.27.22.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 22:26:36 -0700 (PDT)
Date:   Tue, 28 Jun 2022 13:26:32 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod v2][PATCH 0/4] tools: line name focussed rework
Message-ID: <20220628052632.GA24253@sol>
References: <20220627134447.81927-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627134447.81927-1-warthog618@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 27, 2022 at 09:44:43PM +0800, Kent Gibson wrote:
> This patch series is an optimistic reimagining of the tools intended to
> simplify usage for well configured systems, i.e. for systems where lines
> can be uniquely identified by name.  In such systems the chip and offset
> location of the line is no longer of relevance to the user, so the tools
> should be able to operate without mentioning them.
> e.g.
>   gpioget GPIO17
> 
>   gpioset GPIO17=active
> 
>   gpiomon --localtime GPIO17 GPIO18 
> 
> It is accepted that the kernel does not guarantee line name uniqueness
> within the system, or even within a chip, and not all systems are well
> configured, so the tools retain the option to identify lines by chip
> and offset.  The hope and expectation is that over time systems will
> become more well configured, not less, and identification of GPIO lines
> by name will become the norm.
> 
> The core of the series is patch 1 which is a reworking of the tools to
> support identifying lines by name, and to operate across multiple GPIO
> chips if named lines are located on different chips.
> The gpioset tool is extended to support toggling lines and interactive
> control of line values, so some common use cases can be trivially
> implemented from the command line.
> e.g.
>   gpioset --toggle 500ms LED=on
> 
> will blink the LED line at 1Hz, indefinitely.
> More complex outputs can be generated by adding more entries to the
> toggle sequence:
>   gpioset --toggle 1s,2s,1s,300ms LED=on
> 
> Even more complex outputs can be generated by driving gpioset in
> interactive mode from another script.
> 
> Those are the major changes.  A more complete list of the changes can be
> found in the patch description.
> 
> Patch 2 updates and extends the tool tests to cover the reworked tools,
> including demonstrating gpioset being driven interactively via a script.
> 
> The final two patches add a gpiowatch tool that monitors changes to 
> the state line information, similar to the gpio-watch tool in the kernel,
> and extend the test suite to cover it.
> 

I forgot to mention that gpiofind is effectively redundant now its
functionality has been absorbed into the other tools.
I kept it in the patch for completeness but would be happy to remove
it.

I am also reconsidering gpioset's interactive get command.
The get currently returns the requested set values - it does not
query the kernel.  It may be useful to be able to do both for open-drain
outputs.
How about the get does a GET_VALUES, while a bare set displays the
requested set values?
Or would a flag on the get be clearer?

Cheers,
Kent.

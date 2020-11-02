Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE8DF2A36D2
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 23:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgKBW4Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 17:56:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgKBW4Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2020 17:56:25 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1E4C0617A6
        for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2020 14:56:25 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id 1so7616233ple.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2020 14:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mqtRZlps0AFmnBWQDARp0gqOgumZWJt5mfGSNnjHUrY=;
        b=UrvleR9G1FY4b/8at7PjPV2ZzEJuvq7ugpvcb5Kx/n+ex3K8ZZbcMZUGPPe1nJqv3E
         Y2C8ChnGcnXiq63maAq0LSfpwmPtwB1i4hhVma1u1d37pExYBg0Zbhz3AHtK4+gca5YE
         fyFJh6metsiqVPmB65FXXP5n0Pc+/hyxYUHnE5YaydaHdWwksZMX48C5bhKNCJv3opPF
         dG5k7FQUKPXdfksVOZC2VtzqfibPNZKhksoyChHBgcc1/MrMIsQoSf7cDH0H5w7ZeUNA
         HGal4P4Ymgo//O9UocQ6jHSFh6BIT/UrAtbxKastAx3DQqqT4kMLt3aw9asfX1APdnop
         JEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mqtRZlps0AFmnBWQDARp0gqOgumZWJt5mfGSNnjHUrY=;
        b=FUGZb4viX042bIMHFkGmuf8Ap2qhWTlTwCTxu8tSTSf5yFZjv/zEkPOPtg/pVhL81p
         /v54DGhCiDwKTXovnNbGMWbby8qAgSoR49PFaYpjjCyCr+EAJ5Njg/yiHup3EAK5b6C0
         QX02VmPK1X5EbiSweypDwTeXLqUifaSELq5ipyf8WXjLM/0bv97zvgU2RXijJMLNiV0f
         PijJQfgrzWm7Ue18rE8HGcpaaWADSc/7upDKO+vYo6kFYCl5UzMOZgEe4CZgK5C3MSd0
         44ign1w90FYAyByRd+85dIqr4Xkdew3bM2uqahTK3SScdbqndKNLQPOjcFbVGgF5YLVZ
         Hd1Q==
X-Gm-Message-State: AOAM533xISKCtwUxxgUcdQ4QxATfXqIPOCY8adxqOXTWVIhrBnQyR0t+
        qTq8wGxHEVJdmX/HXVwCLgA=
X-Google-Smtp-Source: ABdhPJy3aEn2fLicGiYGq5ghWFgSjIBAh5KBg2aQ7vFtXuy1V0ZG09hkx6Xap9q85jCM0WQkmD7Vvw==
X-Received: by 2002:a17:902:8605:b029:d5:a6dc:ad0a with SMTP id f5-20020a1709028605b02900d5a6dcad0amr23267313plo.56.1604357785123;
        Mon, 02 Nov 2020 14:56:25 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id q125sm15292114pfq.120.2020.11.02.14.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 14:56:24 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Tue, 3 Nov 2020 06:56:00 +0800
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201102225600.nngn7lahtonni3sk@Rk>
References: <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>
 <86963e59-3661-c43c-4e08-a0f9b9e7ed07@redhat.com>
 <CAHp75VcEr0AcdM2+ig5neMQn+5cfuttpFuAak7CkSO-qVjPeCw@mail.gmail.com>
 <20201030045421.si3r5zsbeeyhkwns@Rk>
 <CAHp75Vej=LT06MEmoAvAxrHY7zzvPKEJLe03C3BN5X4EZos_JA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHp75Vej=LT06MEmoAvAxrHY7zzvPKEJLe03C3BN5X4EZos_JA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 02, 2020 at 09:06:23PM +0200, Andy Shevchenko wrote:
>On Fri, Oct 30, 2020 at 6:54 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>> On Tue, Oct 27, 2020 at 06:09:49PM +0200, Andy Shevchenko wrote:
>> >On Tue, Oct 27, 2020 at 6:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> >> On 10/27/20 4:13 PM, Andy Shevchenko wrote:
>
>...
>
>> >> I see, so then the right thing to do for the bug which we are seeing
>> >> on some AMD platforms would be to honor the debounce setting I guess ?
>> >>
>> >> Can you and/or Mika write a patch(set) for this ?
>> >
>> >I will look at it, but meanwhile I would postpone until having a
>> >Mika's Ack on the action that my understanding and course of actions
>> >is correct.
>
>I will soon send a support patch against ACPI GPIO library code.
>
>> If you don't mind, let me write this patch(set) instead:)
>
>I leave to you whatever AMD code. It will suit our both interests :-)

Excellent! Thank you!
>
>> I feel itchy
>> to fix this touchpad issue by myself after spending about a month of
>> my internship at Linux Foundation investigating this touchpad issue.
>> There are many enthusiastic Linux users waiting to get their touchpads
>> fixed and I could prioritize this task since I don't have other
>> obligations. I have provided a fallback solution [1] to save their
>> touchpads but it seems patches on gpiolib-acpi.c and pinctrl-amd could
>> reach mainline kernel much earlier.
>>
>> [1] https://lore.kernel.org/patchwork/patch/1323245/
>
>
>--
>With Best Regards,
>Andy Shevchenko

--
Best regards,
Coiby

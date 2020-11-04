Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEE82A70F7
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 00:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728301AbgKDXJ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 18:09:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgKDXJ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 18:09:58 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04649C0613CF;
        Wed,  4 Nov 2020 15:09:56 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id 72so11902691pfv.7;
        Wed, 04 Nov 2020 15:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UB6zrp8v6hezt045WWXCVmr5XMY4s1QXuLvjEbjazdw=;
        b=totLqwRpydMODOFS19pGxwEJj8k2y1yZ8BFQoE2MI/msq6/YNZ3Tn//OEijeOJneqU
         QnAkk+twkPacN94wdt9qwPA4HcF8WefcITnO6KxAglZHkOJdqd8QNLnYaa2w7ulTTggp
         1lAiCj3K1gpNR5hjF+MIAIIRZvc/bX7vMG3RzqxcZFxfPfbEhWTPozcQcFgAtswqkMgt
         EG25wy9y8VJfXUieNYaWRmLT/01J5O/nBY7nPTfNLvQQKqEsIXrCv4u2yCOJXRxw0HT4
         kmL0+BAmIWD8J3nptikoWsUQb6u6Szr1PKCr4kvgit4p+6hFy0Liknn3Qa3Lw1CBIGFB
         530A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UB6zrp8v6hezt045WWXCVmr5XMY4s1QXuLvjEbjazdw=;
        b=S2aZ9A3vQ6JBDj23X100TucnJPbCEF2qmTW/5lRlmvdao8dACIzgA/QVZSafq4FD//
         0lSHqAvUXEt5R20tDG1tlAVl3c4u5zFg2DpGQV8BOT54by5/lfhwvYKUJRtYiTTTLEvI
         p5SgoZcS6i2IoMWadp3B5Vp+gJ26DNRta0wNoBaIfn78d6cduRuN8eEBSP38DMhHYJti
         dTpeFuWDih7vhFmS4ce/JT5tlptJJX6iJ5PID44bRcFUkhadj+gr45NVRAEp/EbmVCnU
         s5S9JzzpdvH2FeIwvltaywEVk3gm9FldIyRcjb9OUN9PQqM5JTaXUNLJynNO7FPF6uk4
         887Q==
X-Gm-Message-State: AOAM530/JMzSK2Avefw7sNMvDVOMh+5UtgZ3uYlkv6BGB6pBcQBYLGdk
        kN/amNlilKbCasIl5aY9e3E=
X-Google-Smtp-Source: ABdhPJyFt/xXt8fAoO2c34DE4mvHPO2Krgxdy8maxbxYaUEk7Nu0Xy+Ij/CL4qyg4Go6uArX0F6Qcw==
X-Received: by 2002:a63:f446:: with SMTP id p6mr254968pgk.67.1604531396549;
        Wed, 04 Nov 2020 15:09:56 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id q1sm3194320pjq.20.2020.11.04.15.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 15:09:56 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Thu, 5 Nov 2020 07:08:03 +0800
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] pinctrl: amd: fix incorrect way to disable debounce
 filter
Message-ID: <20201104230803.5hkmuegnmmcnwm37@Rk>
References: <20201104160344.4929-1-coiby.xu@gmail.com>
 <20201104160344.4929-2-coiby.xu@gmail.com>
 <CAHp75Vf8NMWL99Eo5k8gLwYSjUjfU6wjoh97YzVz+M=nwGNfrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHp75Vf8NMWL99Eo5k8gLwYSjUjfU6wjoh97YzVz+M=nwGNfrg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 04, 2020 at 10:38:32PM +0200, Andy Shevchenko wrote:
>On Wed, Nov 4, 2020 at 6:05 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> The correct way to disable debounce filter is to clear bit 5 and 6
>> of the register.
>>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>
>> Message-ID: <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
>
>Can you use a Link tag with proper lore.kernel.org URL?
>
Thank you for the suggestion. Applied in v2.

>--
>With Best Regards,
>Andy Shevchenko

--
Best regards,
Coiby

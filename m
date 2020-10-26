Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFE722990D2
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 16:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783391AbgJZPRH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 11:17:07 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44685 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1783117AbgJZPRH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 11:17:07 -0400
Received: by mail-pf1-f195.google.com with SMTP id 133so364964pfx.11;
        Mon, 26 Oct 2020 08:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=di8I+7zkkzzJPYqlZpUDLV/inPRzF5jNJ9WXrF568Xc=;
        b=u7+ZjBc3LjDKw3EdrvGsl6XjcNC3wznvJ0A6hqhbcsQI+CdL0jFdhByjDE6yibCk9A
         ZkT2J5W5jPsy60hP1/OdQ/YDZgoOK4bPd3zJ/HUqXO0OkW8rImwfisMRmdpKP7bSOh/u
         UH8H6MUwQhE6hRaBeqRpc+AHOU8/+AihBslSJc3K51XkFtxXyOIK3gMN8pjfO8YcIMnF
         eB9OIoo7EbFwRbvyP9S8GgrFOf03L96gIjOhHzhBrfurjS7CpPiH2QB3URN9c+yP0Fyl
         Ig1je7NIJ4/aYoKpH0Sr+8zvsCaVn9gOpWOlTVbzTgtABYAq771NFWBCuqpwqSxVE+Lj
         7Zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=di8I+7zkkzzJPYqlZpUDLV/inPRzF5jNJ9WXrF568Xc=;
        b=WfOKKpyUn+urm8DlFSa0WBzCIlXIFu4HPffjV0nHmceex/nMHpGjIb+MIRrj3lnvXR
         YcyX5OBm/1FQbEqpJgAjatpPPONDfdxnETyfz2RxVQONiSc6oBxBtH0XL1B5UixWmrcb
         ma9Ryk/ej2/rfRTZBHF4WmNRd66D8Jfa1HTYG8b/VGeRkW7IgCUtelBfWoimbogoVDcm
         inWJ+64C/e+6yPD8T6+FGImShrQ8wo8kj9PSyQhBGEPK1Rk0/hU/WYi38EZIsySYqVgb
         bBwfGwTmL0A8CYruFRCmBu6kqYZaK1dkIoFq2fO2KP6bN/PDq4SZ6ICPXV0wGSMSyEhJ
         G/ZA==
X-Gm-Message-State: AOAM531K+WIiJeuLqREsd9/SZA4yO3P2+rMFjIbQKtiP0rCf2XB3F36u
        bIAxEnV8No21UrT+YcLll5Aw9e3GbB1JZrXV
X-Google-Smtp-Source: ABdhPJzlJR+qoP7hJ7syQhLfcBzPhFbPELyI20T+kacCxJK/9RmHX+OgDHBjGecQzZXlfMuEH7YqKA==
X-Received: by 2002:a62:f846:0:b029:15f:f897:7647 with SMTP id c6-20020a62f8460000b029015ff8977647mr13987358pfm.75.1603725426883;
        Mon, 26 Oct 2020 08:17:06 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id b185sm11101262pgc.68.2020.10.26.08.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 08:17:06 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Mon, 26 Oct 2020 23:16:42 +0800
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: amd: print debounce filter info in debugfs
Message-ID: <20201026151642.r5uqfgiptvk4wrjv@Rk>
References: <20201024061552.4497-1-coiby.xu@gmail.com>
 <CAHp75VdRBPcdRaTjnDNk5nSN8fMY--Gq=042+fYGddv=Xs6uHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHp75VdRBPcdRaTjnDNk5nSN8fMY--Gq=042+fYGddv=Xs6uHw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 25, 2020 at 07:12:16PM +0200, Andy Shevchenko wrote:
>On Sat, Oct 24, 2020 at 2:32 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> Print out the status of debounce filter as follows,
>> $ cat /sys/kernel/debug/gpio|grep pin130
>> pin130          interrupt is disabled| interrupt is masked| disable wakeup in S0i3 state| disable wakeup in S3 state|
>>  disable wakeup in S4/S5 state| input is high|   pull-up is disabled| Pull-down is disabled|   output is disabled| debouncing filter (high) enabled| debouncing timeout is 124800 (us)| 0x503c8
>
>
>> +                               if (!tmr_large) {
>> +                                       if (!tmr_out_unit)
>> +                                               unit = 61;
>> +                                       else
>> +                                               unit = 244;
>> +                               } else {
>> +                                       if (!tmr_out_unit)
>> +                                               unit = 15600;
>> +                                       else
>> +                                               unit = 62500;
>> +                               }
>
>In all three if:s can you use positive conditionals?
>
Thank you for the suggestion! I've reversed the order of debounce
timeout in v2.

>--
>With Best Regards,
>Andy Shevchenko

--
Best regards,
Coiby

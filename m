Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D59282A814A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 15:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731367AbgKEOsa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 09:48:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731345AbgKEOs3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 09:48:29 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3216DC0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 06:48:28 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id q10so1003251pfn.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 06:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0cNRue06Kg3etWs92TwtIDhKtJtQC1AdGrrm6JimBHY=;
        b=My6V3yek/d4wRR7+RW5mfyyK4FgujsyOAucIyz0QkaH0p9VOnEgTjImBXwmh02wuR/
         sTo19ziN9RRMpjb6hnxZBC5ZzkA21e1oH2q1he7xKQRv5V58nIZid5sd9v/MyIFC66RJ
         PnzIuC433Erf3FMLJ3ITfR6WAzbhXpIw+0XswZZtK0A656yGGUd9R0oqjeDdaj7K0hpi
         pnN+DDMFo1xlzX68sUlJOXMqZQIKmqmjlzJ6kGILhmONbo05w99uGtx1j+9qa5fFYgY2
         K3IUBX4PQuseoWqb7g/3pzFHO44utwaldHZZvcEJHc4XEs9MdCiwkq8+06iBPjNJGjGR
         3jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0cNRue06Kg3etWs92TwtIDhKtJtQC1AdGrrm6JimBHY=;
        b=gdmKe8rUOl9lDNATWVaIOVDkkwIC4NlztXV2FP+PgE6KApuSMGSHCtVX1Fm9OsO9p/
         8C4KSLCm2TX66/e/t3ajI3HPoVkd7v+Vd92TGUxsJmO7sJJo/23k6lG1K6z8bw7iWOrz
         HcrmsvKNbWTu//Rwj1/E+xK5twMedMXmUC7Dld0OfJPot7tC5BwTnFEEmHLYgzVzQAYA
         DZ/I5WnMKeAJzRx9rQa4m2YTsvH0N+ap0IoY6LaBdTlFxFdp5ROKddrEB4sORcMLBdW5
         /VY90As8VnL3vkfNAfDOho7juVDdSgzcz+fmKGQFWAUJzgrfZ0VVvk4/qtWunftZp/Cj
         8zdQ==
X-Gm-Message-State: AOAM532uXYbYmpNP3JVP8hB8J2PUeWNhNKJMvmAYXDV7cSNYKRrjvfn+
        BTIO2wyBwsmBaKtgC+YanO1N0xDgpWDVtQ==
X-Google-Smtp-Source: ABdhPJxVTz0NURxjphjdjOpx8OMjG1nW+mwuCt8b4in+Ed4/bKWnbMT75b9bYrFnjSgZ2UouDRwdTg==
X-Received: by 2002:a63:f54e:: with SMTP id e14mr1384024pgk.195.1604587707797;
        Thu, 05 Nov 2020 06:48:27 -0800 (PST)
Received: from localhost ([160.16.113.140])
        by smtp.gmail.com with ESMTPSA id ii20sm2539692pjb.57.2020.11.05.06.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 06:48:27 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Thu, 5 Nov 2020 22:47:55 +0800
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/4] pinctrl: amd: debounce filter fixes
Message-ID: <20201105144755.rqnq5ut6szauj4az@Rk>
References: <20201104230703.21466-1-coiby.xu@gmail.com>
 <CAHp75VcczvAHE8wztdFkGE=9QKbPFCJ0wxnE9CGjqayi+oZp=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHp75VcczvAHE8wztdFkGE=9QKbPFCJ0wxnE9CGjqayi+oZp=g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 05, 2020 at 02:41:12PM +0200, Andy Shevchenko wrote:
>Missed mailing list.

Sorry, I don't understand this comment. Which mailing list was missed?
>
>On Thu, Nov 5, 2020 at 1:07 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> There are three fixes (and one improvement) that fix the debounce
>> filter issues in pinctrl-amd.
>>
>> Changelog v2:
>>  - Message-Id to Link and grammar fixes for commit messages [Andy Shevchenko]
>>
>> Coiby Xu (4):
>>   pinctrl: amd: fix incorrect way to disable debounce filter
>>   pinctrl: amd: use higher precision for 512 RtcClk
>>   pinctrl: amd: print debounce filter info in debugfs
>>   pinctrl: amd: remove debounce filter setting in irq type setting
>>
>>  drivers/pinctrl/pinctrl-amd.c | 56 +++++++++++++++++++++++++++--------
>>  1 file changed, 44 insertions(+), 12 deletions(-)
>>
>> --
>> 2.28.0
>>
>
>
>--
>With Best Regards,
>Andy Shevchenko

--
Best regards,
Coiby

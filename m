Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 973332A8AA6
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 00:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730895AbgKEXXo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 18:23:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729162AbgKEXXo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 18:23:44 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8DCC0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 15:23:44 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id h6so2457284pgk.4
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 15:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=56hIQyAcH/b8+JSgrZHFjqczATbe8A30HblYUfUvdks=;
        b=OZ8xEntnTVJC5VUam6RNZXdloL43pC1/vkxOwBy3UMT1ueIk00ZSy+gD2TCY/WDVdt
         kuB7b3QOAVUotcYj/qZDSd7l0YLim2iKy2idAMblz1ltyAwEn9AeoZI0/YSlwfu5WxK4
         YcpvUeC8p3YZ2jbw7dfQr5regN0OBPIi8YLEq3eqUSMSTHtAnX+iI5CC53jx06sfkLeC
         9yzSzpIAzGGWiCLtrj3I97c27nCcGfoUzoDFqrmplUWO0Z7UP+VKkBAtOdeQld2RRh9a
         zK5UHiPvjX8zZVXxq/pGLAAqrclQWUPXeBCoArQf7PfAZaxvi7KBU75cgGxV68ifc+vj
         tLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=56hIQyAcH/b8+JSgrZHFjqczATbe8A30HblYUfUvdks=;
        b=VRhyrjerQ6vc6UukJ5oKrRqODxPgoWfEUBVRhM7fUMrgnvZGY33/TmUsuOZqdu1y0I
         XDbfliAJ/nH0b12CZHazAfG7TjsO190ti5CMwCMQcUjcU3AHahf5qc/F3Fqvivu0JxaL
         osLtlOn+AFgpwOjNzbo0ePNAANcSGEYwObzCRO3x6T83SjPec5AxWkFBTeNkzlHIulM2
         2vBVNZWu26q0r1ypzJjjbK9bqRwDtC9Vrck+7bmg6ntcHOxjAyoCa5CLF5mkQE6PRj0e
         /ttEpOwXLCgMSTTByw8c318Ze7Q4n8B/ji4r8o5IKtQS/wnowWcyadCZloMMYHyWAOYl
         dM1Q==
X-Gm-Message-State: AOAM531uvqvl+xst1G2qde/oOO/Fl521qjkp2lIGNrvK1fFFyHJF4dTm
        DysZ5RJAzy+aNyM8FHRTA3E=
X-Google-Smtp-Source: ABdhPJzxxqyRj11xF5TQq7zr1et8B+4RblX5HgbcEHnQlrBfSQE7mWkM11QZnL5wj4IQ4LxOzeiW3A==
X-Received: by 2002:a17:90a:34cd:: with SMTP id m13mr4830045pjf.201.1604618624197;
        Thu, 05 Nov 2020 15:23:44 -0800 (PST)
Received: from localhost ([160.16.113.140])
        by smtp.gmail.com with ESMTPSA id v126sm3878029pfb.137.2020.11.05.15.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 15:23:43 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Fri, 6 Nov 2020 07:23:13 +0800
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/4] pinctrl: amd: debounce filter fixes
Message-ID: <20201105232313.rqqjhee2bynlaizw@Rk>
References: <20201104230703.21466-1-coiby.xu@gmail.com>
 <CAHp75VcczvAHE8wztdFkGE=9QKbPFCJ0wxnE9CGjqayi+oZp=g@mail.gmail.com>
 <20201105144755.rqnq5ut6szauj4az@Rk>
 <CAHp75Ve4XiAG7hS_QmwOiTLfFabAvgWHUoWxsHUpY+RTdMHujQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHp75Ve4XiAG7hS_QmwOiTLfFabAvgWHUoWxsHUpY+RTdMHujQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 05, 2020 at 06:35:42PM +0200, Andy Shevchenko wrote:
>On Thu, Nov 5, 2020 at 4:48 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> On Thu, Nov 05, 2020 at 02:41:12PM +0200, Andy Shevchenko wrote:
>> >Missed mailing list.
>>
>> Sorry, I don't understand this comment. Which mailing list was missed?
>
>The cover letter (this message) has missed the mailing list AFAICT.
>How I see it is a private message addressed to me and Linus personally.
>
Thank you for the explanation! I was looking at your previous reply
which had the missing linux-gpio@vger.kernel.org added by you thus
failed to understand you comment.

>> >On Thu, Nov 5, 2020 at 1:07 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>> >>
>> >> There are three fixes (and one improvement) that fix the debounce
>> >> filter issues in pinctrl-amd.
>> >>
>> >> Changelog v2:
>> >>  - Message-Id to Link and grammar fixes for commit messages [Andy Shevchenko]
>> >>
>> >> Coiby Xu (4):
>> >>   pinctrl: amd: fix incorrect way to disable debounce filter
>> >>   pinctrl: amd: use higher precision for 512 RtcClk
>> >>   pinctrl: amd: print debounce filter info in debugfs
>> >>   pinctrl: amd: remove debounce filter setting in irq type setting
>> >>
>> >>  drivers/pinctrl/pinctrl-amd.c | 56 +++++++++++++++++++++++++++--------
>> >>  1 file changed, 44 insertions(+), 12 deletions(-)
>> >>
>> >> --
>> >> 2.28.0
>> >>
>> >
>> >
>> >--
>> >With Best Regards,
>> >Andy Shevchenko
>>
>> --
>> Best regards,
>> Coiby
>
>
>
>--
>With Best Regards,
>Andy Shevchenko

--
Best regards,
Coiby

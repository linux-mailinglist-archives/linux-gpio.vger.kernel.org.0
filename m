Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0DE4D987B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 11:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346933AbiCOKOS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 06:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346916AbiCOKOR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 06:14:17 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A491CDEB5;
        Tue, 15 Mar 2022 03:13:05 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id dr20so39288904ejc.6;
        Tue, 15 Mar 2022 03:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pJ4a52EFU+2U7vD9nmXwHNCP7eYdGu/W7wP1LyBYDtY=;
        b=cnKxIuWSGk7xnetybBsS4AllQmhegUDXEtGAfBL9sBETaY387QPhrjERHGMmrfnNVq
         hggvnpYJfifO0QlwANcDGq8B7hWogf/WUb2KZ+zPDJoiT2zDQz24OBDfkJi1qZ3gCf6z
         Zu9Xyd32/Njuceng5fZjoX/tfJYnBfSM/BtFptC1a7cuo6T7oBa8T66kpWJmWtaiXtL0
         kkzCshfuBmMYu988Unrz9foXvvDT466Q0zvSSY7jIIm6GXHtSwa6tMNjtUirH1eId44U
         cSVEuooTC2tLHuLwqTXMiG0W5Q1844U9dF+G7kEPePC9uzdX0e+iIIstOW2MbX/a26p/
         1QYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pJ4a52EFU+2U7vD9nmXwHNCP7eYdGu/W7wP1LyBYDtY=;
        b=XOOYhZFZr7KvapW9M8ZSa5FgqpPKMjF9/BeH+D4nSFHMwETI5ctS/KdSUEAqQdZGqI
         tILFnxjrDNdPAaQiA+XtLh/o/HnQpSCL1GgGr60AepSXNGhcjAp/+P9qyAs8HesMLsb/
         F5lgmYa3QBaAJW0SfH5LFax4S9h95dbbNWtfzsBJMZIG4G15z5fNXEeMQHIL1JXSTahC
         w5dUjX/IQ8CNajt7SCR9GPUPsVCcN8YqjcN5siTdp/lp30RRfCC3R48ZYrsBMLgcf5Wr
         mvyLN/8O9LbyhlhRIfXwoBP2zrejDRl9n4DNF/bX6KNS6oin/mroBp/Kmbz9ogA+xlxu
         FubQ==
X-Gm-Message-State: AOAM530xXSHGzmdmsfOLwFuWRppxQJKPmyUHjUdgbeNw7vu95fY1h4a9
        ySlpzP3AMT20MuTRaLgGFg4NaIkgMCleHRwDr3w=
X-Google-Smtp-Source: ABdhPJysvL41Rndn/yfaFBTWshIJVj1+JDO+Wuwx3p5+4IxmhxfJN1FdbumvudNZrO1A0oJKNNXuw+8JzPsoM5oVasw=
X-Received: by 2002:a17:906:4cc7:b0:6d0:7efb:49f with SMTP id
 q7-20020a1709064cc700b006d07efb049fmr21528297ejt.639.1647339183972; Tue, 15
 Mar 2022 03:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <7640f9ac-88af-ace7-0bd4-990d852567dd@redhat.com>
 <CACRpkdbDWrrDPK9=5NErtM81109qtTHyFcTON=zXtB2B86wAdA@mail.gmail.com>
 <CAHp75Ve9s+hEjhWwdjbRJhEU-Efno_TyAUH+D7iRrE8enivvtg@mail.gmail.com> <aab9d25e-f6f9-b831-769b-ab95cd1bea74@redhat.com>
In-Reply-To: <aab9d25e-f6f9-b831-769b-ab95cd1bea74@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Mar 2022 12:11:50 +0200
Message-ID: <CAHp75VcXRcvV61ZreVGBEAArhgfKv9nAPhjCTdMY6+nBw=5jrw@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch with 5.17-rc1 + "pinctrl: baytrail:
 Add pinconf,group + function for the pmu_clk"
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 11:18 AM Hans de Goede <hdegoede@redhat.com> wrote:
> On 3/15/22 07:19, Andy Shevchenko wrote:
> > On Tue, Mar 15, 2022 at 3:01 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >> On Thu, Feb 24, 2022 at 5:48 PM Hans de Goede <hdegoede@redhat.com> wrote:

> >>> As discussed here is a pull-req for an immutable branch with 5.17-rc1 +
> >>> "pinctrl: baytrail: Add pinconf,group + function for the pmu_clk".
> >>
> >> I suppose this is for Andy possibly I already pulled the pulled tree.
> >
> > Nope, but it appears not necessary. We have nothing to update in my
> > tree which is dependent on this PR.
>
> Ok, note this is already in the platform-drivers-x86 tree, since this
> was a dep for another patch there. So I guess the single patch in the PR
> will find its way upstream through the pdx86 tree then (which is fine).

That is my expectation as well.

-- 
With Best Regards,
Andy Shevchenko

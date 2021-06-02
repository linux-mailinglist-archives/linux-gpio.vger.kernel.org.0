Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1C33987F5
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 13:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbhFBLW4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 07:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232252AbhFBLWw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 07:22:52 -0400
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [IPv6:2001:67c:1be8::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E56C061574;
        Wed,  2 Jun 2021 04:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Sender:
        Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
        :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pTMDdwyY3se7ek/n/DJtuBUdgsXKAqw0dSJWJKXqcA0=; b=PWMct+5rxQ4tyKOsNWCff+5qEc
        +Fs2+5OCkxwcFZExbJJBLvWwyGz0EJBJthz1WMB1c64OajSxVru0oFeTEOgTSUqT1h2gUOeqLJf1b
        p+2zyP268IhhYUAB6xYzVu4sn36ackNuhzkRuTPavrM47zu/2EDLpvEHrWNoTsV2TGp6b3jfa9Puc
        sOAq1p+T5s759lbYCcT+ymjUs6zQPr6GFgdbYfwgRM/s5/4sxCZbjnq+qGVKMisuyEuWD9UsP1n3z
        PwWCGUILjyPJzBFIeTDLV2hozBmK92NzDEjvxrLYVm83FoYR8xoJmNZU3lYR6YF5KNXBmh6rbuOje
        i+aMvFcw==;
Received: from sein11.ut.ee ([193.40.12.11]:11475 helo=[172.17.163.37])
        by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <maukka@ext.kapsi.fi>)
        id 1loOvn-0008TD-SD; Wed, 02 Jun 2021 14:21:06 +0300
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210530161333.3996-1-maukka@ext.kapsi.fi>
 <20210530161333.3996-2-maukka@ext.kapsi.fi>
 <CACRpkdZfdd=ogHoNGuLzGGZYkvw7xtNO2VJm-t-2vMibGNy=dA@mail.gmail.com>
 <866ff376-6d74-49c9-9e4c-2bf36bbd5981@ext.kapsi.fi>
 <CACRpkda9LD00=mUjLbb+wG3mnEVHbyqj-3L98=c-k-bV54gmTg@mail.gmail.com>
From:   Mauri Sandberg <maukka@ext.kapsi.fi>
Message-ID: <3548155a-e634-c433-7173-77b56180ed98@ext.kapsi.fi>
Date:   Wed, 2 Jun 2021 14:21:02 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CACRpkda9LD00=mUjLbb+wG3mnEVHbyqj-3L98=c-k-bV54gmTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 193.40.12.11
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mailserv1.kapsi.fi
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.2
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio-mux-input: add documentation
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 2.6.2021 13.35, Linus Walleij wrote:
> On Wed, Jun 2, 2021 at 11:31 AM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
> 
>> But there is a small detail that needs to be sorted out.
>> The name 'gpio-mux'
>> has already been taken by 'mux-gpio' driver [2] [3].
> 
> What about "gpio-multiplexer"?
> 
> It is not good that the thing using GPIOs to do multiplexing
> has take a name that seem to infer that GPIOs are being
> multiplexed. Now we can't do much about that we just have
> to live with it. How typical of formal languages to screw
> with the semantics of natural languages and create confusion...
> 

I am afraid having 'gpio-mux' and 'gpio-multiplexer' would create too 
many what-were-they-thinking moments for any unfortunate reader so I 
would rather choose something else. Can we just call it 'gpio-cascade' 
without referral to the underlying mux? Maybe at somepoint in future 
something else could be used in its place too.

-- Mauri


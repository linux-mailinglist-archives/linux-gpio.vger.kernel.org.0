Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00084828C8
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jan 2022 00:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232802AbiAAX6K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jan 2022 18:58:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232731AbiAAX6K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jan 2022 18:58:10 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5635C061574
        for <linux-gpio@vger.kernel.org>; Sat,  1 Jan 2022 15:58:09 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id h7so22732499lfu.4
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jan 2022 15:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=1xfSrao1qqheTJwJwU9aUGlBlvtY13o85ITWyfdgess=;
        b=IPXEJ426bgkxPzfMKKwysB+bpS5jWN/DNyoV20IqlpvKflB9CwvDa2sAUd4++Q5jja
         u3p94gHorUEv3XfpzIlPKrNyCmrJalTKKfHHitueXijQKZSo+ygNgNA3wEA4rkmdrkxr
         z3aah7Ll/eW8uJpMEpBD1HCIAIeyEnFfuSEvDW8fXuqxAIh1PZzrvtNDo38f3X6GDAMS
         Lwbp5XJnP/Z4sxDfuJbxvaGOFI31xZFTch+EAfutHvxdJ5NHJPfYEmJjGKFjB4FWaWic
         Y/7NDz522Kh3F41u+2Tpma6SxJ8sx/44D92QvG6YvmHavqgf8NVj9OmdR4tHIYHnZrK/
         3Gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1xfSrao1qqheTJwJwU9aUGlBlvtY13o85ITWyfdgess=;
        b=d1uk/u67siKUIunfgkgbbyfyCXM1aVcy10Bqr3KvE3KpmUmSmc0TAywKy81lnRn6L8
         lUuXZem8AkHt0dIOJj9NLDvMI5P1lTkOlb2CKrki8VEUK6BUkP/M6mM7h1VRgjxSQZcO
         jJDJlRChSsfq/XgaB8GJpIUWIxw7PtlUJUjlRnIx/q10489JOgTiABJf9TRI7eaECKIL
         nm4BzJFaeUinFRQEOzPUrSqGvctR1/Xw7yG1OMtGB26Z7+k1BpAca3YMLLjwjdDlFgD/
         oVVrdENkoxX5yY1HOJEbDr5UpvPjCEhaD9LCHpQRXaHcmnfWJaZ4mSEFIunk0ZjILnId
         eaRA==
X-Gm-Message-State: AOAM533PYT5q+sDJITvm60DQgAtshXANMlMSqVHeO3VUZ9B/JVTbOfz1
        4lhpmo3ks4LDSmBvaANkLHc=
X-Google-Smtp-Source: ABdhPJw1lm6nEcdlRHeccYW4UdcB5KvuGKEUsO94lWuM+ImaEhaYJ69RtKxeJevjvldJWQINr+4SaA==
X-Received: by 2002:a19:c217:: with SMTP id l23mr35516648lfc.599.1641081487547;
        Sat, 01 Jan 2022 15:58:07 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id p14sm3174365ljj.12.2022.01.01.15.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jan 2022 15:58:07 -0800 (PST)
Message-ID: <0ce1b7cb-ae08-65fc-0e2e-1f58ebac7937@gmail.com>
Date:   Sun, 2 Jan 2022 00:58:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V2 1/4] pinctrl: imx: prepare for making "group_names" in
 "function_desc" const
To:     Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        "abel.vesa@nxp.com" <abel.vesa@nxp.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc:     "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "lakshmi.sowjanya.d@intel.com" <lakshmi.sowjanya.d@intel.com>,
        "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>,
        "rafal@milecki.pl" <rafal@milecki.pl>
References: <20211216162206.8027-1-zajec5@gmail.com> <YcOJieHGeA7p+NIF@ryzen>
 <b9fe3fdd615fc0a91c9374a58f09d2f3ed38e0c3.camel@toradex.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <b9fe3fdd615fc0a91c9374a58f09d2f3ed38e0c3.camel@toradex.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2.01.2022 00:55, Marcel Ziswiler wrote:
> On Wed, 2021-12-22 at 22:24 +0200, Abel Vesa wrote:
>>> @@ -663,14 +664,16 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
>>>                  dev_err(ipctl->dev, "no groups defined in %pOF\n", np);
>>>                  return -EINVAL;
>>>          }
>>> -       func->group_names = devm_kcalloc(ipctl->dev, func->num_group_names,
>>> -                                        sizeof(char *), GFP_KERNEL);
>>> +
>>> +       group_names = devm_kcalloc(ipctl->dev, func->num_group_names,
>>> +                                  sizeof(char *), GFP_KERNEL);
>>>          if (!func->group_names)
>> This line needs to be:
>>          if (!group_names)
>>
>> Otherwise, the driver never probes successufully.
> 
> After my i.MX 8M Mini target running latest -next just hang early boot I bisected it to this commit.
> 
> I can confirm that this fixes it. Thanks!

Please note there is one more pending fix. Please apply both:
[PATCH] pinctrl: imx: fix allocation result check
[PATCH] pinctrl: imx: fix assigning groups names

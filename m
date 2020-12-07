Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318BE2D1DE0
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 23:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgLGW6o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 17:58:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgLGW6o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 17:58:44 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4787C061749;
        Mon,  7 Dec 2020 14:58:03 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id z11so5199291qkj.7;
        Mon, 07 Dec 2020 14:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I6zOyly/VbctqZjifVWoiBMTs4M8CD/SiJU9q3QLjeQ=;
        b=MkFGs90IiqWPrV8EBavbyv2dCQScGbizflrfYY5ExfWiqGQmTwp9ea9vmo1YvDJY4A
         2c+ImuDV/6lN+vyeJgXblAX6e7QAmtNCVcSMBefMCUH9dOrWbyrp7j85uhXWRcbnfaLb
         9H4yXgA5nK98kFAjAOFSCZ0YNlaGFs3onLdQMk2hykLpeZYD9DR/cLEo3HFI9n/ylKYM
         SP1it4yp+9+2q2oaZOAwLTprqKWZ84kYdCrte0W4USF8/zEjT0BLCWmfJ6hZZqRaFqwk
         7zfwnz5mLxRS4u7Ju+3CJIPOhbhWa8Fhl+Z1pjv7olTCIXHnnIiFUJlhu2JwHoyBn3bl
         Albg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I6zOyly/VbctqZjifVWoiBMTs4M8CD/SiJU9q3QLjeQ=;
        b=esZeVSp8jwCrKwnt0c08iwNDHOfl5HfYbUpe3THsABLjrAvf9dBKH8WMI7jMTK5W5q
         BTBJb40g2AAMI64eddViNt8fwc5+0eC/iuI/ctOg5aHiElPW+L3VjC2krhfGIbYPQeMc
         tyRpYjoEkbQ9QcdL5ubi9SPrgMGE6TLvWiaySHnQPCdWJKgmjf09waZFqTB8/VR7rMFN
         cYw7YCz8vBhzd/8WAjIHfGI/IroTrnn78nM+weMlKndOWDzFu6+C+8aSzBXHpyWOd/hg
         CqcJBtHM64QvMpE+QMkj5fmgwKJNRNLP/dtdbI1jAioTiO6LBh57shFTfxCH/jHP0cM/
         0UtA==
X-Gm-Message-State: AOAM5304Ulv8oYFia9sUNGma5DmP34nF4o6uq337ou/j9PnzKvBTaWg1
        wHKeZmKrrBafQ/6VYBzl4Xp83YChLz4g6Q==
X-Google-Smtp-Source: ABdhPJwzoS7/Ky0MntBp9qZ4NtSaiEihqd7hWuFpYR1luKx1MHX5eR4sPN13hH1/FdJIG0eMFSB0nQ==
X-Received: by 2002:a37:d2c4:: with SMTP id f187mr26900594qkj.286.1607381882673;
        Mon, 07 Dec 2020 14:58:02 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net. [108.51.35.162])
        by smtp.googlemail.com with ESMTPSA id r14sm12733046qtu.25.2020.12.07.14.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 14:58:01 -0800 (PST)
Subject: Re: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
To:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-12-damien.lemoal@wdc.com>
 <160714919628.1580929.1456162330322523777@swboyd.mtv.corp.google.com>
 <b5eb9c289fe58119185550bff7228501d95b730e.camel@wdc.com>
 <CAMuHMdX+grQf=naU76Edvhbjap3BEayjDs_Rhkoy4FFfOZcTZw@mail.gmail.com>
 <CH2PR04MB652207D253E79755D87F55DAE7CE0@CH2PR04MB6522.namprd04.prod.outlook.com>
 <CAMuHMdUVfaWSY1Ohn-_VtOzG1VeQrDCfhHTtkahXy8HsGOTS1Q@mail.gmail.com>
 <CH2PR04MB65224960F89E4EB1CE253743E7CE0@CH2PR04MB6522.namprd04.prod.outlook.com>
From:   Sean Anderson <seanga2@gmail.com>
Message-ID: <f6b54c11-adf8-328e-e1d5-c759ac5ee2e2@gmail.com>
Date:   Mon, 7 Dec 2020 17:58:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CH2PR04MB65224960F89E4EB1CE253743E7CE0@CH2PR04MB6522.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/7/20 5:14 AM, Damien Le Moal wrote:
> On 2020/12/07 19:06, Geert Uytterhoeven wrote:
>> Hi Damien,
>>
>> On Mon, Dec 7, 2020 at 10:55 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>> On 2020/12/07 17:44, Geert Uytterhoeven wrote:
>>>> On Mon, Dec 7, 2020 at 4:52 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>>>> I prepared a v5 series addressing your comments (and other comments).
>>>>> I will post that later today after some more tests.
>>>>
>>>> Thanks, already looking at k210-sysctl-v18...
>>>>
>>>>> On Fri, 2020-12-04 at 22:19 -0800, Stephen Boyd wrote:
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/clk/clk-k210.c
>>>>
>>>>>>> +       in0_clk = of_clk_get(np, 0);
>>>>>>> +       if (IS_ERR(in0_clk)) {
>>>>>>> +               pr_warn("%pOFP: in0 oscillator not found\n", np);
>>>>>>> +               hws[K210_CLK_IN0] =
>>>>>>> +                       clk_hw_register_fixed_rate(NULL, "in0", NULL,
>>>>>>> +                                                  0, K210_IN0_RATE);
>>>>>>> +       } else {
>>>>>>> +               hws[K210_CLK_IN0] = __clk_get_hw(in0_clk);
>>>>>>> +       }
>>>>>>> +       if (IS_ERR(hws[K210_CLK_IN0])) {
>>>>>>> +               pr_err("%pOFP: failed to get base oscillator\n", np);
>>>>>>> +               goto err;
>>>>>>> +       }
>>>>>>> +
>>>>>>> +       in0 = clk_hw_get_name(hws[K210_CLK_IN0]);
>>>>>>> +       aclk_parents[0] = in0;
>>>>>>> +       pll_parents[0] = in0;
>>>>>>> +       mux_parents[0] = in0;
>>>>>>
>>>>>> Can we use the new way of specifying clk parents so that we don't have
>>>>>> to use __clk_get_hw(), of_clk_get(), and clk_hw_get_name()? Hopefully
>>>>>> the core can handl that all instead of this driver.
>>>>>
>>>>> I removed all this by adding:
>>>>>
>>>>> clock-output-names = "in0";
>>>>>
>>>>> to the DT fixed-rate oscillator clock node (and documented that too). Doing so,
>>>>> clk_hw_get_name(), __clk_get_hw() and of_clk_get() are not needed anymore and
>>>>> the parents clock names arrays do not need run-time update.
>>>>
>>>> "clock-output-names" is deprecated for clocks with a single output:
>>>> the clock name will be taken from the node name.
>>>
>>> Arg. I missed that.
>>>
>>>> However, relying on a clock name like this is fragile.
>>>> Instead, your driver should use the phandle from the clocks property,
>>>> using of_clk_get_by_name() or of_clk_get().
>>>
>>> That is what all versions before V5 used. But Stephen mentioned that the driver
>>> should not, if possible, use of_clk_get()/__clk_get_name(). Hence the change.
>>> Easy to revert back.
>>>
>>>> Stephen: I'm a bit puzzled, as you suggest _not_ using of_clk_get()?
>>>
>>> Another solution to this would be to simply remove the fixed-rate clock node
>>> from the DT and have the k210 clock driver unconditionally create that clock
>>> (that is one line !). That actually may be even more simple than the previous
>>> version, albeit at the cost of having the DT not being a perfect description of
>>> the hardware. I am fine with that though.
>>>
>>> Thoughts ?
>>
>> If there's an external crystal, DT should describe it.
>> Does the K210 support different crystal frequencies?
> 
> I am not 100% sure if this oscillator is part of the SoC or if it is an external
> input to it. Probably not. Hard to tell by just looking at the boards.

It's an external crystal. For example, it is U6 on the maix bit. This is
why I put it as a separate clock instead of including it with the rest.

--Sean

> I have
> the boards drawings though, so  I will check. The frequency seems to be fixed by
> hardware: frequencies of the PLLs can be changed to change the CPU frequency,
> but the Kendryte SDK does not point to any way allowing changing the base
> frequency of the oscillator> 
>> Anyway, I'm very interested in what the (new) proper way of handling this
>> is...
>>
>> Gr{oetje,eeting}s,
>>
>>                          Geert
>>
>> --
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a hacker. But
>> when I'm talking to journalists I just say "programmer" or something like that.
>>                                  -- Linus Torvalds
>>
> 
> 


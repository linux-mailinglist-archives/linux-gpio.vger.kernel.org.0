Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 371084E8FC6
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Mar 2022 10:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239017AbiC1IKf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Mar 2022 04:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239160AbiC1IK3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Mar 2022 04:10:29 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3156B51339
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 01:08:48 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id p17so14135602plo.9
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 01:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=68MOgowUG6SvToUSCXOp2SKJlZZfYIPk5aEVXXC/QTA=;
        b=oijfqOzkUNpmFl38B4qp1MTZ5JrfnWlcSD3tFStY9BGoddXoMXmQvrWKS4cia1t1dV
         N1GFeOetJyF3+5uWr2JoOCdh3dXhrIbWlJYWAI92lleyLI6weP1MnHbPFhNgEy1C9bJA
         wMoCHEhrW8Ea060hhhPKDEl+BqeSmZajczfzyRcsF7u3/tUkKxTlRjni5oanfDXE0mWr
         fAN63xiUO5u6GbnVN7pRopouKCwey2+9vBUxEhaqlzteO6dDn2hF09WSUPqekD0aLHkT
         4hPT+0TxD/7Q6+8K0KrWWRYP6NwQ+f95X8zjdeqzcNMFktNVo2c7c1j4PQkvkFwMaVuS
         Yk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=68MOgowUG6SvToUSCXOp2SKJlZZfYIPk5aEVXXC/QTA=;
        b=lsp9oIqc6rOlPX8K7IrObSwRllXUOdJDhmHFtj2qnTuiK0ZDJAMD8gadLKp5BAaWMh
         MHb1LEwmx7MZ6ON8a5VxE6ckNGQQDY95Lo5OYsWEE6csPL1/m2QJ+eb3G8sFE4cuyDhi
         Ti6RIrISjT5M903yNI25HflABPKXs7uj114Uxo48dwB5Irqi1VJO58fMnR1+VAsVVzHt
         0S6yGtrZ3KGda+t2b8iyMHzOrNloN2R2LCOZmJDKu6LP7hjEj56nm4ymGSELUqwdQ1K0
         yeeeTmc91hTh0jdP5yaKW1siZy7+BO+zi1/pEb6A/HKVwlZ8t+MtjEnCSqhfz+mhKGh6
         MDUg==
X-Gm-Message-State: AOAM533TxstBNvNCc7OYNms0wCNsR6Phex4qbP9hRGHcD/fiO5xcF5lA
        6QRhivPwqWOEckF8T2c/K7Y=
X-Google-Smtp-Source: ABdhPJwoC7HICjTx0mu/1F4oepQQ4XQjVTPbDT5e3iOUYcU5IxslB/Mbac/9fHAhPoljDztmAijx/g==
X-Received: by 2002:a17:90b:3697:b0:1c9:a980:3af2 with SMTP id mj23-20020a17090b369700b001c9a9803af2mr4758013pjb.217.1648454927328;
        Mon, 28 Mar 2022 01:08:47 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id b2-20020a056a000a8200b004e1414f0bb1sm16025226pfl.135.2022.03.28.01.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 01:08:46 -0700 (PDT)
Date:   Mon, 28 Mar 2022 16:08:41 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     =?utf-8?B?SmnFmcOt?= Prchal <jiri.prchal@aksignal.cz>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        andy.shevchenko@gmail.com
Subject: Re: [libgpiod] bug: pull-up does not work
Message-ID: <20220328080841.GA14353@sol>
References: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
 <20220325145742.GA46960@sol>
 <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol>
 <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 28, 2022 at 09:12:16AM +0200, Jiří Prchal wrote:
> 
> 
> On 25. 03. 22 17:01, Kent Gibson wrote:
> > On Fri, Mar 25, 2022 at 04:13:11PM +0100, Jiří Prchal wrote:
> > > 
> > > 
> > > On 25. 03. 22 15:57, Kent Gibson wrote:
> > > > On Fri, Mar 25, 2022 at 11:02:07AM +0100, Jiří Prchal wrote:
> > > > > Hi,
> > > > > since in debian is 1.6.2 and pull-up doesn't work so I cloned git, branch
> > > > > next/libgpiod-2.0 and compiled libgpiod and tools, but no luck, same result.
> > > > > 
> > > > 
> > > > You mean it doesn't work for you on your platform.
> > > > 
> > > > The libgpiod-2.0 branch is a work in progress and should not be considered
> > > > the place to go to find solutions to problems with v1.6.
> > > > Not that I'm saying that the v2 branch doesn't work, I'm actually pretty
> > > > sure it does, but its purpose is to switch to the latest kernel uAPI, not
> > > > to provide fixes, should they be needed, for v1.6.
> > > Just thought api v1 doesn't support pull-ups so tried v2.
> > 
> > v1 does support bias since Linux v5.5, and libgpiod added support in v1.5.
> > 
> > > > 
> > > > > ~# uname -r
> > > > > 5.17.0-rc7_cpm9g25
> > > > > 
> > > > > floating pins should go with pull-up/down
> > > > > ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
> > > > > 0 0 0 0 0 0 0 0
> > > > > ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
> > > > > 1 1 0 0 0 0 0 0
> > > > > ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
> > > > > 0 1 0 1 0 0 0 0
> > > > > 
> > > > > ~# gpioget -v
> > > > > gpioget (libgpiod) v2.0-devel
> > > > > 
> > > > > Whats wrong with it?
> > > > 
> > > > You forgot to mention which of those pins are floating.
> > > All of them.
> > > > Or what gpiochip3 is and whether it supports biasing.
> > > AT91SAM9G25, hw supports pull-ups.
> > > > 
> > > > So does your chip support pull-up/down?
> > > > The kernel can only enable it if the hardware and pinctrl driver supports it.
> > > Is there possibility that pinctrl doesn't support it? I think other gpios
> > > used in kernel are with pull-up.
> > > Example:
> > > pinctrl@fffff400 {
> > > 	1wire {
> > > 		pinctrl_1wire: 1wire-0 {
> > > 			atmel,pins = <AT91_PIOC 0 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>; /* PC0
> > > PIO, pull-up */
> > > 		};
> > > 	};
> > > };
> > > 
> > 
> > Pinctrl and device tree are outside my area, but my understanding is
> > that setting via DT is a separate interface, so while it may be
> > supported by DT it may not be via the gpiolib interface.
> > But I will defer to anyone else on that.
> > (CCing in Andy since I'm pretty sure he would know)
> > 
> > Not sure which pinctrl is relevant for your case.
> > pinctrl-at91 doesn't appear to support setting the pull-up via the gpiolib
> > interface, but pinctrl-at91-pio4 does, so my guess would be you are using
> > the pinctrl-at91.
> pinctrl-at91-pio4 didn't help, syminfo says "for Atmel PIO4 controller
> available on sama5d2 SoC" but my is sam9g25.
> How can I find out if it supports gpiolib?
> > 

What does gpiodetect report?
That should given an indication which driver is being used.

Cheers,
Kent.

> > But again, this is outside my area so you would need to confirm that
> > yourself or get feedback from someone else.
> > If you determine that you are using a pinctrl that supports setting
> > bias via gpiolib then we'll have to do some more digging.
> > 
> > Cheers,
> > Kent.
> > 
> Thanks
> Jiri

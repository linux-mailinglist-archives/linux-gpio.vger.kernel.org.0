Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1E9655F8CF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 09:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbiF2HYA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 03:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbiF2HYA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 03:24:00 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5EEA18E3A
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 00:23:58 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id l2so13674794pjf.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 00:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Nu3kqt4370AoHuaqSJe/6PAdmFsUkAh7HcmIbGv94U8=;
        b=oDWxFec0vwJXks2VpXSxL2oyrvKSpqFC/UUtdnddEWT3ulSoeSEDSsnCmYH/84nDPY
         XudkHvERvpfi3AV5KP2CZwDTsXHX/Q3AZaQbaZYM8UP9lz3EIAxphnC7Uzl9cKYxIMbv
         L+t+eKOFkhNKADV/VkcF51IVx0JlK24BoA7Jopa4ssHUb+d79V92XUz0hbmmA58vzNjo
         BabKRcqDFoeDQOkH7vGxFfyKqr6BqhkZsqMc3ptIraJwO2CePnNM+LT73LEdR2CDVGKZ
         /VdTmHpm12iccAkhO+pi/IolHIh5VFJlbw1GlEtY6rRvubVfsItgYm6riX5pGlOXpDFN
         255g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Nu3kqt4370AoHuaqSJe/6PAdmFsUkAh7HcmIbGv94U8=;
        b=f9pFGfIAyXUuMJD7Mceq0hJzyROM0CFiHf3Qr1lInq7vmKZCL5pik5HkxoZm9HnRov
         VTWtrxCeYXLRihuWphpdMFeExAjN+m9k/11UBGH8IBF9RrvROoABfAuff2IxF6nxD87/
         DMTotSrqfXqfFdo/nQ+8U921cqgurMAYhI63yCR729783DAUJGRe0apax89oMIz/jSrR
         sbCHUrIMWyb9EAg17n+ELDNcXbAT2WNSg0LEY+iq0IJU14lu69Ws+YnGqui8moQ7FfJL
         89RKvZnSbZaBCRH6eLO6yV/iyOhutoq/9uqH7hCJMD/1zoLxRK+fTac4MNK7b6ftkLKf
         1BYg==
X-Gm-Message-State: AJIora+B8Q8c7+qM2Tl6k+wws37esUCb1zgCxWiHCW4Q7I9TvVekCvXA
        ZXfXMd2E3/ZrHRBUXnMFD/WLOgzQglY=
X-Google-Smtp-Source: AGRyM1sBM0W0okjl/mw2/rlDh9MuCFNz3dZFUmMDjF07sotlXxQJvTeSKgNruAtDcpt6HrXZmJc9Eg==
X-Received: by 2002:a17:90b:3d86:b0:1ee:ec85:ec07 with SMTP id pq6-20020a17090b3d8600b001eeec85ec07mr4272047pjb.81.1656487438074;
        Wed, 29 Jun 2022 00:23:58 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id f1-20020a654001000000b0040d22243295sm10707804pgp.79.2022.06.29.00.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 00:23:57 -0700 (PDT)
Date:   Wed, 29 Jun 2022 15:23:53 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     =?utf-8?B?SmnFmcOt?= Prchal <jiri.prchal@aksignal.cz>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod] feature request: output state read and sustain
Message-ID: <20220629072353.GA18684@sol>
References: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
 <20220325145742.GA46960@sol>
 <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol>
 <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
 <20220328080841.GA14353@sol>
 <757ac53e-07bb-1ffa-2734-08c1c321ff0e@aksignal.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <757ac53e-07bb-1ffa-2734-08c1c321ff0e@aksignal.cz>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2022 at 03:08:20PM +0200, Jiří Prchal wrote:
> Hi,
> using new libgpiod / chardev driver, is there any way to get state of
> output? I mean one process sets it for example to 1 and another process
> reads this output state for example to show that on web page.
> I have to say that old sysfs interface was more user friendly...
> 

"new" being anything since Linux 4.8 ;-)?
And strictly speaking it isn't a driver - libgpiod and the GPIO subsystem
provide an interface to the chip driver.  More on that later.

Only the process holding the line has access to the current value.
If you need that value elsewhere then it has to be published by that
process - it is not available through the GPIO API itself.
There is nothing preventing that process publishing the value
in whatever way is appropriate to your application.
e.g. write it to a file that can be read by your webapp, just as it
would from sysfs.

Less restrictive access models are frequently "more user friendly", but
have other issues. e.g. some misbehaving process just reset your
modem for you.

And sysfs has other great features like being slow and being complete
rubbish for events on input lines.

> And at second: it would be better to NOT "the state of a GPIO line
> controlled over the character device reverts to default when the last
> process referencing the file descriptor representing the device file exits."
> "Set and forget" behavior is more natural to what some gpios are used. For
> example resetting external modems, need set 1 for short time, then to 0 and
> leave it for long long time until next reset is needed. It's non sense to
> keep running some process only to keep output at 0.

Agreed, that might be more natural, but that behaviour is not by choice,
it is a consequence of the kernel internals.  In short, if the GPIO
subsystem does not hold the chip then the driver is free to do what it
likes to it.
So when you release a line all bets are off.
It may stay where you left it, but it may not - it may even switch to an
input - it depends on the driver.
If it works for you that's great, but without major kernel changes
libgpiod has no better option than to provide the caveat as the "set and
forget" behaviour is something that it cannot guarantee.

Cheers,
Kent.


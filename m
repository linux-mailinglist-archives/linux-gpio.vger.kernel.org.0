Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2723B5B1FE2
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 16:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbiIHOAI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 10:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbiIHN7o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 09:59:44 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB14810C986
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 06:58:57 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id E31444203C;
        Thu,  8 Sep 2022 13:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1662645534; bh=pdG59bzJlzDY20DOE4OLi7SB8XBomWDVFaA7FzakGUc=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To;
        b=MqqYJEKNEf0dwL67TQEvJ0ArXxrTjwTEG4jcmI1fvEDtNfkKGVs3Njl7yUZZ2jAik
         1tTa7IZThyoWrJxZQvOdcPLngYLsRdsw7gYoWjaMV5LQ3dvMYNOn9qZpt4ebcTNYit
         P7w3GCmY8lXwUaBKsCJN+iw5xfCnaKAFkC4UqGhCvmk8SQ2Z8A7IFCudLf8Qhnl/1w
         u3qw6yNct2T3msf4BJ44EiA6r8H80JYkgFOHk3a9G5ov3BB6RXMhM62uHICgq9pBbj
         FlpNwwghkNlmDD7nb7TlljlszYtdCng13mm1Ki0Wm29hsMFOdM64REe1H26S426Itd
         fTjVSekzt1MHw==
Message-ID: <82088b05-2a0d-69cc-ba2c-d61c74c9d855@marcan.st>
Date:   Thu, 8 Sep 2022 22:58:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: es-ES
To:     Lee Jones <lee@kernel.org>
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk> <YxnK3LeyfacKssLT@google.com>
 <45ed0a37-60ac-3a06-92d1-6b30e18261ff@marcan.st>
 <YxngtlhRLTVBw+iW@google.com>
 <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
 <Yxnv2mKkl1tW4PUp@google.com>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
In-Reply-To: <Yxnv2mKkl1tW4PUp@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08/09/2022 22.36, Lee Jones wrote:
> On Thu, 08 Sep 2022, Hector Martin wrote:
> 
>> On 08/09/2022 21.31, Lee Jones wrote:
>>> The long and the short of it is; if you wish to treat this device, or
>>> at least a section of it, as a type of MFD, then please draft that
>>> part of it as an MFD driver, residing in drivers/mfd.  If it's "not
>>> really an MFD", then find another way to represent the conglomeration
>>> please.
>>>
>>> If the MFD route is the best, then you can register each of the
>>> devices, including the *-core from drivers/mfd.  Grep for "cross-ec"
>>> as a relatively recently good example.
>>
>> I think cros-ec is similar enough, yeah. As long as you don't mind
>> having the core codebase in mfd/ (4 files: core, rtkit backend, and
>> future T2 and legacy backends) we can do that.
> 
> That's actually not what I'm suggesting.
> 
> You *only* need to move the subsequent-device-registration handling
> into drivers/mfd.  The remainder really should be treated as Platform
> (not to be confused with Arch Platform) code and should reside in
> drivers/platform.  Just as we do with cros-ec.

That's... an interesting approach. Is the code in drivers/mfd supposed
to be a subdevice itself? That seems to be what's going on with
cros_ec_dev.c, but do we really need that layer of indirection? What's
the point of just having effectively an array of mfd_cell and wrappers
to call into the mfd core in the drivers/mfd/ tree and the rest of the
driver elsewhere?

- Hector

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D6462A279
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 21:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbiKOUHJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 15:07:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbiKOUHI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 15:07:08 -0500
X-Greylist: delayed 334 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Nov 2022 12:07:02 PST
Received: from naboo.endor.pl (naboo.endor.pl [91.194.229.150])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8A1646F
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 12:07:02 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by naboo.endor.pl (Postfix) with ESMTP id 6069BAE5621
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 21:01:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at 
Received: from naboo.endor.pl ([91.194.229.15])
        by localhost (naboo.endor.pl [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id JPix3grhNBTs for <linux-gpio@vger.kernel.org>;
        Tue, 15 Nov 2022 21:01:24 +0100 (CET)
Received: from [192.168.55.113] (unknown [185.174.112.221])
        (Authenticated sender: leszek@dubiel.pl)
        by naboo.endor.pl (Postfix) with ESMTPSA id 3B6EBAE55FC
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 21:01:24 +0100 (CET)
Message-ID: <b93089ba-381b-95ca-5b5c-71e340c1a9c3@dubiel.pl>
Date:   Tue, 15 Nov 2022 21:01:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: User space tools
Content-Language: pl-PL
From:   Leszek Dubiel <leszek@dubiel.pl>
References: <fc3da423-1107-83a1-1c94-afb2ac5fa7c9@dubielvitrum.pl>
To:     linux-gpio@vger.kernel.org
In-Reply-To: <fc3da423-1107-83a1-1c94-afb2ac5fa7c9@dubielvitrum.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org




Different bash scripts from different servers
ssh to Raspberry PI and change GPIO line:

              /dev/gpiochip2, pin number 7.

like this:

    gpioset -b -msignal /dev/gpiochip2 7=1



If another script does for example:

     gpioset -b -msignal /dev/gpiochip2 7=0

then it gets:

     gpioset: error setting the GPIO line values: Device or resource busy



So every bash script kills previous instance
before setting gpio line:

     pkill -ef "^gpioset .* /dev/gpiochip2 7=[01]$"
     gpioset -b -msignal /dev/gpiochip2 7=0



Pkill is bad solution:

1. it is very slow, because it has to grep full command lines.

2. it doesn't work if one of bash scripts
used little bit different command, for example:

          gpioset -b -msignal /dev/gpiochip2 7=0 5=2



Is there a better way to kill o replace
previous instance of running gpioset?

Or is it going to be better in new version v2 of user space tools?




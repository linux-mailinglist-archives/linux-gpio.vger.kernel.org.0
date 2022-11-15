Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 877C662A311
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 21:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiKOUhe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 15:37:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbiKOUhF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 15:37:05 -0500
Received: from naboo.endor.pl (naboo.endor.pl [91.194.229.150])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFC0B54
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 12:37:04 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by naboo.endor.pl (Postfix) with ESMTP id A32BFAE5685
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 21:37:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at 
Received: from naboo.endor.pl ([91.194.229.15])
        by localhost (naboo.endor.pl [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Nt5Klu9Lw-JX for <linux-gpio@vger.kernel.org>;
        Tue, 15 Nov 2022 21:37:00 +0100 (CET)
Received: from [192.168.55.113] (unknown [185.174.112.221])
        (Authenticated sender: leszek@dubiel.pl)
        by naboo.endor.pl (Postfix) with ESMTPSA id 8ED1AAE5715
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 21:37:00 +0100 (CET)
Message-ID: <57c25430-284b-36dc-7a68-70847bc1bdcb@dubiel.pl>
Date:   Tue, 15 Nov 2022 21:36:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From:   Leszek Dubiel <leszek@dubiel.pl>
Subject: Elegant way to kill previous gpioset?
To:     linux-gpio@vger.kernel.org
References: <fc3da423-1107-83a1-1c94-afb2ac5fa7c9@dubielvitrum.pl>
Content-Language: pl-PL
In-Reply-To: <fc3da423-1107-83a1-1c94-afb2ac5fa7c9@dubielvitrum.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org




Different bash scripts from different servers
ssh to Raspberry and set GPIO line:

         /dev/gpiochip2, pin number 7.

with such command:

         gpioset -b -msignal /dev/gpiochip2 7=1



If another script tries:

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
      gpiomon             /dev/gpiochip2 7



Is there a better way to kill o replace
previous instance of running gpioset?











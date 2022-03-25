Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E97324E70AB
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Mar 2022 11:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354366AbiCYKKs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Mar 2022 06:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345014AbiCYKKs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Mar 2022 06:10:48 -0400
X-Greylist: delayed 414 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 25 Mar 2022 03:09:05 PDT
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E1533A01
        for <linux-gpio@vger.kernel.org>; Fri, 25 Mar 2022 03:09:05 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by router.aksignal.cz (Postfix) with ESMTP id 9508E5176F
        for <linux-gpio@vger.kernel.org>; Fri, 25 Mar 2022 11:02:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
        by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
        with LMTP id a6AXCO6qTrZP for <linux-gpio@vger.kernel.org>;
        Fri, 25 Mar 2022 11:02:08 +0100 (CET)
Received: from [172.25.161.48] (unknown [83.240.30.185])
        (Authenticated sender: jiri.prchal@aksignal.cz)
        by router.aksignal.cz (Postfix) with ESMTPSA id 40D315176E
        for <linux-gpio@vger.kernel.org>; Fri, 25 Mar 2022 11:02:08 +0100 (CET)
Message-ID: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
Date:   Fri, 25 Mar 2022 11:02:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     linux-gpio@vger.kernel.org
From:   =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Subject: [libgpiod] bug: pull-up does not work
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,
since in debian is 1.6.2 and pull-up doesn't work so I cloned git, 
branch next/libgpiod-2.0 and compiled libgpiod and tools, but no luck, 
same result.

~# uname -r
5.17.0-rc7_cpm9g25

floating pins should go with pull-up/down
~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
0 0 0 0 0 0 0 0
~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
1 1 0 0 0 0 0 0
~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
0 1 0 1 0 0 0 0

~# gpioget -v
gpioget (libgpiod) v2.0-devel

Whats wrong with it?
Thanks
Jiri

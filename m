Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9535055E426
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346074AbiF1NON (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 09:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344658AbiF1NOK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 09:14:10 -0400
X-Greylist: delayed 342 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 28 Jun 2022 06:14:06 PDT
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F079C31353
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 06:14:06 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by router.aksignal.cz (Postfix) with ESMTP id 752A94BA90;
        Tue, 28 Jun 2022 15:08:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
        by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
        with LMTP id mpiB74IatdLW; Tue, 28 Jun 2022 15:08:21 +0200 (CEST)
Received: from [172.25.161.48] (unknown [83.240.30.185])
        (Authenticated sender: jiri.prchal@aksignal.cz)
        by router.aksignal.cz (Postfix) with ESMTPSA id E8AFA4BA8E;
        Tue, 28 Jun 2022 15:08:20 +0200 (CEST)
Message-ID: <757ac53e-07bb-1ffa-2734-08c1c321ff0e@aksignal.cz>
Date:   Tue, 28 Jun 2022 15:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From:   =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Subject: [libgpiod] feature request: output state read and sustain
Cc:     bartekgola@gmail.com
References: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
 <20220325145742.GA46960@sol>
 <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol>
 <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
 <20220328080841.GA14353@sol>
Content-Language: en-US
To:     linux-gpio@vger.kernel.org
In-Reply-To: <20220328080841.GA14353@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_20,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,
using new libgpiod / chardev driver, is there any way to get state of 
output? I mean one process sets it for example to 1 and another process 
reads this output state for example to show that on web page.
I have to say that old sysfs interface was more user friendly...

And at second: it would be better to NOT "the state of a GPIO line 
controlled over the character device reverts to default when the last 
process referencing the file descriptor representing the device file 
exits." "Set and forget" behavior is more natural to what some gpios are 
used. For example resetting external modems, need set 1 for short time, 
then to 0 and leave it for long long time until next reset is needed. 
It's non sense to keep running some process only to keep output at 0.

Thanks
Jiri

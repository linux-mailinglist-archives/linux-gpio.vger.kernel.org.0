Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDA1958BB72
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Aug 2022 16:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234803AbiHGO4S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Aug 2022 10:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234784AbiHGOzt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Aug 2022 10:55:49 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AAA8B7F2
        for <linux-gpio@vger.kernel.org>; Sun,  7 Aug 2022 07:55:33 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id s204so7797170oif.5
        for <linux-gpio@vger.kernel.org>; Sun, 07 Aug 2022 07:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=deUgeohbMGI8vydeJYthJS3B+b3JxxcGoLFAptaXSeI=;
        b=KqeaW7svjIJ7P6IjX+wfqtYlpwKFuDxeJVRXEHW+DJUowExgq7tGyj+aVtxHhEcgTn
         ZoV4ksMk65GJtfNfEuavZMkh7Ww+rJtC7RhIxSasiZvBnzgVSS8bFUGEBf469jNCYRuQ
         g/jRUO02+8JpBPsguzgOHe47XiJWzxBVJRqgIFZaDtZMDTFMxDgag0lN/wdX7J601yH6
         vku3VPIN+/xIyL598c0FH1Z3BnAYw5kIJWIpsUJyLlOhA7mdita8xZnmEOIMOtmfjpCA
         8pgayE3JhMB3GCL6iMGpD7HK7E82v9YCTal3NCtPW4k7Q1mzCwmLsUGMW19Do4T3ztpw
         2b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=deUgeohbMGI8vydeJYthJS3B+b3JxxcGoLFAptaXSeI=;
        b=66YANWINeqvDl7drHCSrUd+JeCvVUKoEK/PLXIreAudA/d35OFVMGnIuQ5RbIjvd9I
         wA5gy08IuCid5nKDjveKG+mJ54rbpAwlBzzUFfJkncwXBDeKJk9EQpynAyh6SjJ23eAw
         pZNCHgRcgBuzJjybZS0Kco65snWbiQ3YsBLeMK1vaPC/PgmWc3+OVENTGmEuNuZVR8GD
         A3ap4OuOHcR4Euk+m8xrGYL4Z7Pdy98PA04rVk1coPInxxXkT6h3kAL22CksPT2+T1kU
         9tL7TxuZUpwo7ULI8Qm7URu06WaCiOCdKPbWMdwHcX9LyiCjzKpgI1DA52jTgV5Y/eBP
         BsVA==
X-Gm-Message-State: ACgBeo26mqhB/d9rebYZRHXXJt7AU05gmw4Z/SFXtZ44etJWe6SIQ5zS
        eZI6HAB/SRZKMkEeEs9wOb6WtfrIn2g=
X-Google-Smtp-Source: AA6agR4TCl44jmNiSDdYCwHCELDtjlWiqY7goly9JjEv0UAuuYCFOh2UosCwR5VI+hWm6cU727G54g==
X-Received: by 2002:a05:6808:f03:b0:33a:a9b4:9847 with SMTP id m3-20020a0568080f0300b0033aa9b49847mr9509381oiw.9.1659884132902;
        Sun, 07 Aug 2022 07:55:32 -0700 (PDT)
Received: from [172.31.250.1] ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id s4-20020a056870ea8400b0010be134ac60sm1814139oap.19.2022.08.07.07.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Aug 2022 07:55:32 -0700 (PDT)
Message-ID: <d2c3cb8e-4042-13ad-4bb9-21b289ba773c@gmail.com>
Date:   Sun, 7 Aug 2022 09:55:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        kernelnewbies@kernelnewbies.org
From:   Ian Pilcher <arequipeno@gmail.com>
Subject: gpiod_get() - How to get GPIO from chip & offset?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I am trying to figure out how to use gpiod_get(), or one of its
variants, to get the descriptor (struct gpio_desc *) for a specific
GPIO.  Getting a reference to the GPIO chip (struct gpio_chip *) is
straightforward, and it provides a pointer to the device (.parent), but
I absolutely cannot figure out what I am supposed to pass as the
*con_id* argument.

I know the offset of the GPIO on the chip, but I can't figure out how to
use that.

Ultimately, my goal is to set the direction of the GPIO from within a
"board setup" module.


BACKGROUND

I maintain an out-of-tree "board" module[1] that sets up the GPIOs and
LEDs on my Thecus NAS.  I am in the process of upgrading the OS on the
NAS, which will require me to change the user-space daemon from the old
sysfs GPIO interface to the new (non-ancient?) gpiod interface.

One significant difference between the sysfs and gpiod interfaces, is
that the new interface does not seem to provide an easy way to set a
GPIO's direction (input/output) from a shell script[2].  Thus, I would
like the board module to do that, along with the other setup.

[1] https://github.com/ipilcher/n5550/blob/master/modules/n5550_board.c

[2] It may be possible to change a GPIO's direction from user space with
     the C API, but doing it in the kernel module, which does all of the
     other hardware configuration, seems like the most appropriate way.

-- 
========================================================================
Google                                      Where SkyNet meets Idiocracy
========================================================================

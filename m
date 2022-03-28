Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 929E34E97CB
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Mar 2022 15:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243038AbiC1NSp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Mar 2022 09:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243196AbiC1NS1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Mar 2022 09:18:27 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886352F025
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 06:16:46 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id p189so8373805wmp.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 06:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:content-language:from
         :subject:content-transfer-encoding;
        bh=YEHTIWjTQ0331Tg9AtE8on90yfJl8mObaYXVJHasooI=;
        b=K51bkn0wpD5I4gm6mS3D2DBmVyluGwjbmiuElnIZOwk7MiuvP0zilr7S5obHwb3fs6
         MXzuVrsI+ssu+a0O5y5RAhB+kgDmuOE5Xv8b59kbIASwPsEw9nvvbdjsA5iFm0rpOLqQ
         XsNHrFsfJgzOGUOtinxcx5Nau7D0zNp3QWjznq67Bv5bpDIIqn9WkFemj38sj1pp5y0e
         w8MFZgEoE4O0Hq4qqMUrNk1wObDn16m7/dkah51RGQ3eAPfnEmXECMahJMjWJgoBCpvz
         fEZaWuLHtHLFO933XeRMQHEcXoWOzPxZw1U5U3quLUtkA7PO10VpGyzEyqW58EJArpC+
         mlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to
         :content-language:from:subject:content-transfer-encoding;
        bh=YEHTIWjTQ0331Tg9AtE8on90yfJl8mObaYXVJHasooI=;
        b=fCAXSR7MDoSy6WP5mVHF1kb9yTi6+ILLUJKMqghG3otYzR0JVghL5qIv4h8KWd/s/M
         PHGaZhEWxa1xUbpJWJSeQnj5KtnChum2o8IstVky4Gb5vZMAK0O8WYASRQs+JI4TPJnN
         a2FYwos5/wdzN4Q3ZK8MVsf5bQa9/nRV7XT6Tzmm9LVxz7NizoabYVcZLcJ2kfPrTG90
         WnosvsUSA7/EQRt0D/X+n/GOPVNfLt1vkSBSjNifkgLC3hcd4VwJI14uMlX6CZMXUoP6
         c9TeWj3rJJ7gHK51rUM3OO8rq9a6C6jjTqqCA815VgKppB3kO9ayEuupTz3k7c/75txs
         M2Uw==
X-Gm-Message-State: AOAM533qarOHMDU5R0q0gB2kI3lhRPj7gzvLhjjsIMOswBOSyvy7HOrx
        ZMEb+defPMFqu2X7hkvHNjcH/PEhR9FYQA==
X-Google-Smtp-Source: ABdhPJzbL+ZJ+qAWZQZbBefrvjktsTP+qXkjicvU3Y60Nrym90U8Uil9NnkZjXnenMWQGp/aJu0qrg==
X-Received: by 2002:a7b:c24d:0:b0:38c:68a4:eb4b with SMTP id b13-20020a7bc24d000000b0038c68a4eb4bmr35347407wmj.108.1648473405113;
        Mon, 28 Mar 2022 06:16:45 -0700 (PDT)
Received: from [192.168.1.31] ([90.61.176.186])
        by smtp.gmail.com with ESMTPSA id q6-20020adffec6000000b00205b60faeeesm5865280wrs.24.2022.03.28.06.16.44
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 06:16:44 -0700 (PDT)
Message-ID: <d7f8e55e-1db8-a471-9414-5aac831432a8@gmail.com>
Date:   Mon, 28 Mar 2022 15:16:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To:     linux-gpio@vger.kernel.org
Content-Language: fr
From:   Hans Kurscheidt <lve0200@gmail.com>
Subject: gpiomon: Question about mode
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

what would be the right mode for gpiomon call from

a shellscript executed as root from systemd at system start

waiting on a Pin w/ pullup for invoking shutdown upon falling edge.


Lots of interupts, Signals and other GPIO ongoing from other user APPs & 
threads in multi-user state.

RGDS

hk



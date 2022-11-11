Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59BD1625688
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 10:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233280AbiKKJWP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Nov 2022 04:22:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233436AbiKKJWN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 04:22:13 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419A7663F1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Nov 2022 01:22:12 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id cl5so5653602wrb.9
        for <linux-gpio@vger.kernel.org>; Fri, 11 Nov 2022 01:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Da6prxTqJDlkWrc04OttpvGM8meiYUBXl1eZVZRVqUY=;
        b=k08pBwYW5sp3EvkaYVd4cQN0kScvKvQFSf1hBFKXy7FtY+1PjLybrvzoSxSv19FTor
         atSIPu2jJpjbmNwLqOZraB6538Oxud4nLgOv6e6tDgMXCeZcw1JqyeXKXpjEAP8WQ4/x
         sMJ0cOWzNEZW4V72NHxmaOAoWkH0pVHJVXkHWl4mLWj16OmYg3vz5s2T81yaDK1nTaM5
         tOiXKuDazVayCLFyqhjv/1c/DVGF/hD1tdLigGY8rYM+NSw7mgLvxTOqSg/nErUFPlMO
         1bJNg201ehQ7HnqaJHaQInX+K8jTOFH+Dhslc6qgN5HlQwe6VTUnymOK+0+mch/mslMS
         cShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Da6prxTqJDlkWrc04OttpvGM8meiYUBXl1eZVZRVqUY=;
        b=OiIz3Rlr4t3swoCm+hM+bJ2bQsLj+EaoNZvynePe1TNQ8P6v/JdzjIpMm5QqzhxVYb
         NKDs3VYaeWHmFJ51X5itRjdhaYiKDLRBruKD2y/SZfPl+Hob0lNLXCBIv+PuZrGfOGmY
         21e9BeSL3XpnJ56nibcvPQVfkszBokIBrTVjJgdeI2YHOr35W3q024189z/BcIXuI7sJ
         WsChaGzzsTM+HX46I2RdfPtUjHiamH9nYhp3g1xUizpcJjKLwOo1QD9WBFCm+mGdFRMP
         9wWtagnLV+o8Pee+uYcwm/Mdgm2hIuWEhnBNbtq0eHOFdcdRDCtzP+s2eyqQDhWp4cwH
         vCpw==
X-Gm-Message-State: ANoB5pmmC0WilYWWm+tkYoJls2GOiaKCpytYRv0yPMIcxKVJkRhsKlKU
        c7A4ig/Rqf/7CB5fuSw0GQASNw==
X-Google-Smtp-Source: AA0mqf7aQZJiWyB2r+Mi/jel72S+UjOqtHYXINvWb3wO/mBvzAVybbUEFv+WeO+hBGnZ41qwhL00bg==
X-Received: by 2002:a5d:564b:0:b0:236:6613:afe6 with SMTP id j11-20020a5d564b000000b002366613afe6mr670490wrw.702.1668158530799;
        Fri, 11 Nov 2022 01:22:10 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id q9-20020a5d61c9000000b0023c508a1c24sm1390135wrv.26.2022.11.11.01.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 01:22:10 -0800 (PST)
Message-ID: <2ec52e22-2e58-4de1-723d-7e55cb183769@linaro.org>
Date:   Fri, 11 Nov 2022 09:22:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH RFC 2/3] pinconf-generic: add pull up and pull down config
 with resistance
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rafael@kernel.org
References: <20221110191258.1134378-1-niyas.sait@linaro.org>
 <20221110191258.1134378-3-niyas.sait@linaro.org>
 <CACRpkdZCrdHttbk7j2reBgYPfYqYr1GTMNortcE9sQV4GdMwhw@mail.gmail.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <CACRpkdZCrdHttbk7j2reBgYPfYqYr1GTMNortcE9sQV4GdMwhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

That's good to know. I wasn't sure and didn't want to break any existing 
interface. I will drop the new types and add the comment to clarify the use.

On 11/11/2022 09:17, Linus Walleij wrote:
> When I designed this, I definitely intended for the argument to
> PIN_CONFIG_BIAS_PULL_DOWN to be used for this, so I would just:
> 
> - Use PIN_CONFIG_BIAS_PULL_DOWN
> - Augment the comment to say:
>    "If the argument is != 0 pull-down is enabled, the value is interpreted by
>    the driver and can be custom or an SI unit such as ohms".

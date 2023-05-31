Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD58717DCA
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 13:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbjEaLOD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 07:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232299AbjEaLOC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 07:14:02 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3D6D9
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 04:14:01 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f6094cb2ebso42752995e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 04:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685531639; x=1688123639;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mfb1+eW+zibtWAMuedhPV0gqBqO9q6LEi+V3nA0rc9Y=;
        b=UgJ6/yqvz1C7Zb6JmWv5a45bSM8BBbxTErJTZjgob+8rRFijgld7MEoKP/IJtjr8OQ
         sgRYjym8Qw0vh1uoKAQDBnXGU/NVGi9UmA2krqxBKL204xtLjIsysfHZbU/0zmDbZfSM
         aP9lmIu4S6PmjsOTwvxdriMIUsPqbuIWi00u41HNhdEqAWHwrkDgB94b93oPbOZumSA6
         mlwRfyfk0525uk4pOyVSj4II/dX+pGCNchLvaXWj3memP8ERkzgk9YDZVNwFdmGC6duS
         qPQAtUUkzETpizsu13xf/XH6aBo7DKeOecD0MXmfZXtuy5Gi1Ws1KvdbpCd5A4v4NR8d
         dYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531639; x=1688123639;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mfb1+eW+zibtWAMuedhPV0gqBqO9q6LEi+V3nA0rc9Y=;
        b=lf4Gtg+XrKd7dQIlSAtOiUFSHlVu0eKdH2Tk6WiJROCpKpFxJfeNhqot57P42pjLRH
         eUJlmI2Vn994p/UjKe5DCaCCerKWCAm8n/iccPpriGBLFErk20L0n4TItd/DjhbRmocL
         9BZJ4/UC8WgVCaX05VdZMOhardmouED3VSivqGIpoNA2UcqgovgLALVp97HcZCQYfm91
         znVOx5WkZxKHWFxS7gAMrMfDd957SR8EJvYO5/S08MAhJigjhn8HkiaAzaKIEszmBEPF
         /fbYBxwxolfDLiDiboHIpyd25DRW6MN62pq403/xqrlGUAUaQR37DjBcRxNHzl+arLgm
         oKXw==
X-Gm-Message-State: AC+VfDx47h/LOjsl3ZYguz47E5HMpvrkDWaYNDvz82lrXmrdUoQ9OQ2p
        7Omm89lVy5TSrbMpJRo34eoagg==
X-Google-Smtp-Source: ACHHUZ5AE9Qtc7xNuxsskuew8mH554BfzBhkfLSHcV434/2JXSnSLzULnfVvJU1M/eFXaOuXfbZAzA==
X-Received: by 2002:a1c:f701:0:b0:3f5:1728:bde9 with SMTP id v1-20020a1cf701000000b003f51728bde9mr3737602wmh.2.1685531639733;
        Wed, 31 May 2023 04:13:59 -0700 (PDT)
Received: from meli.delivery (ppp-2-86-210-142.home.otenet.gr. [2.86.210.142])
        by smtp.gmail.com with ESMTPSA id j28-20020a5d6e5c000000b0030aea925fbesm6523852wrz.50.2023.05.31.04.13.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 May 2023 04:13:59 -0700 (PDT)
Date:   Wed, 31 May 2023 14:05:46 +0300
From:   Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>,
        Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: Publishing libgpiod-sys and libgpiod to crates.io
User-Agent: meli 0.7.2
References: <CT0CRWOTJIEO.20BGIDMLFM0E8@fedora>
In-Reply-To: <CT0CRWOTJIEO.20BGIDMLFM0E8@fedora>
Message-ID: <visj7.k1t7273b5zpe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Breaking changes are inevitable. The libc crate follows a nonsemver 
scheme (0.2.144 and bump the patch number by one for every release) 
which breaks stuff all the time, or at least it used to when it was at 
its early stages. There are ways to get around breakages in case of a 
crate lib being a transitive dependency but has different versions: 

https://github.com/dtolnay/semver-trick

I believe following libgpiod's version scheme directly is what would be 
best and intuitive. -sys crates are not usual crates and users know 
this. It'd be cool to not have to bump the bindings crate version but I 
don't think it's a problem. This is how openssl{,-sys} works, if I am 
not mistaken.

All in all, in crates.io follow its conventions unless there's no way to 
do so.


Manos

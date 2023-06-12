Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F11CE72C2E4
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 13:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233650AbjFLLf3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 07:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbjFLLfD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 07:35:03 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD6010CB
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 04:12:48 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5169f920a9dso8674492a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 04:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686568367; x=1689160367;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1Y2w0RNtgYuU8ubVi7K8xKxl18g/Wsy4lp0DiN3PJc=;
        b=hU8suRtBRYxoN+cyaYXlFNbQSbezCZY9uYYZAu453o6WNhwm7SB/4PzQ7v3LbCEzCd
         JiuPt6xx0f0Mn86c0CSIsEf73z0JGrrsYSk9UZ35xiqL2hFWKWNZ5EBTtIJFnBhMM0xb
         KuaKUj0BHsI+S96YC8889tvgP56zCXYawjqYZYurFU2kryoX2l/IEQDeXVFjpcNw14Rq
         cbLKJmhHMCsxsav4GOjkpX+YyawYpyTthlgBDvMWp608Llnf0cDHJ0HcvMW69wS304I+
         ads55Of5O4NIZFGXB/A6AZlj0/tXUguS5PosO+U2Lx2JrEQt5cTwGcvq1jLVAIRzIQqZ
         4BFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686568367; x=1689160367;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R1Y2w0RNtgYuU8ubVi7K8xKxl18g/Wsy4lp0DiN3PJc=;
        b=OsGpyh6IDKg+3UKPSwAjp9Q6QUtrr2UE+CG1FLHBf8218GIvRZF7tWKmxYOA6vBpKc
         0PsYM0XtnoN/ianIemz/KMnZJzFY568KigmbYxf7vy1yKwc3IYaCHvYNBR9ItDRu/otw
         C9LunKj0pDhdc5cDP2NuNanME1KggrVzyjNVOtzBixKm24V6H/tYLiUMx4C5PBBMmDPq
         4y2eivyCXQ6sXlAvIAv3olvMzbEWIV9kDXRoJWaBbRs6UiI0EkyttVN4JbdlM7Wqd/4v
         4TNUInESS4owwNIDuVCYFAV7818WMSfh4IDa1dtgDusbLM8y66j/z2b77KE1rEjKdbBq
         AQbQ==
X-Gm-Message-State: AC+VfDyuWd32wItMPxRU6lH0T7SqCeScsGuSQrybEM8bijT3nlu08+Eg
        zSQ/3g7XV2dXHu7hMhTBDUnWhAUf2jSM8eVzg7c=
X-Google-Smtp-Source: ACHHUZ7gfS4aFo7nCn3Fw09sOLJNfirCZxfgqQ08cGO1kWYzB2ZtVNtd+NMUPLB+t4C00PVipzAjYQ==
X-Received: by 2002:a05:6402:27c9:b0:506:bbf8:5152 with SMTP id c9-20020a05640227c900b00506bbf85152mr5556521ede.9.1686568367427;
        Mon, 12 Jun 2023 04:12:47 -0700 (PDT)
Received: from [192.168.1.149] (i5C74066A.versanet.de. [92.116.6.106])
        by smtp.gmail.com with ESMTPSA id r18-20020aa7cb92000000b005163c11700csm4974053edt.74.2023.06.12.04.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 04:12:47 -0700 (PDT)
Message-ID: <4aeda646-ae02-a59b-0aac-b4ea2d2a887f@linaro.org>
Date:   Mon, 12 Jun 2023 13:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
From:   Erik Schilling <erik.schilling@linaro.org>
Subject: [libgpiod] Owners of libgiod* crates.io packages
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bart,

I created a libgpiod-sys package on crates.io now [1]. libgpiod will 
follow soon (will submit a series with some prep work first).

In order to reduce the bus-factor, I would like to add you as owner. 
Would you be willing to log into crates.io once so that your account 
exists (it requires a login with GitHub)?

Let me know if other people should be added (Viresh is added but still 
needs to accept) (or just add them yourself once you are an owner :)).

Alternatively, one could also setup a GitHub organization to manage the 
access. I went with directly adding people for now.

[1] https://crates.io/crates/libgpiod-sys/

- Erik

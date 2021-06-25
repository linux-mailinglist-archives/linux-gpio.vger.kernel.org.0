Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E4B3B3AF7
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jun 2021 04:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232973AbhFYClR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 22:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232917AbhFYClR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 22:41:17 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1390EC061574;
        Thu, 24 Jun 2021 19:38:56 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id e20so6415469pgg.0;
        Thu, 24 Jun 2021 19:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Cd4QsvztevPYCvOOxkfeUvwdXq5/dlPeOoAMC74Y2Ew=;
        b=pZkRQ1VnztC4lb+ASJL0ewmH5iouWMhXVcWy0o20wygETPXSq+uuqhWgLNe8HIo8eS
         mhxqRvrjPRZkEw3VJoMzkjHQ2ZQ/Vm4uodPrK1nXDEuh10J1moim030LgkXVAHUGmHKW
         Uu8kh8A5QBu/mZWH2jCp88UAT8tQPx3Z9FhksXDnUpCkuwiC14toCWcs+swlmtQrJugA
         hNOyItoJJC24k2lnkOJ+p46vCfd029UEhaQtkYohisSSY4hacqWi2RCc/oDB78yVcNdV
         J5slpYG58a6V+MCKmdxuQlbIaC08kjOOtL5z3us9jJ+RCjanU9FF5zX97YfsHdKayMQT
         f9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Cd4QsvztevPYCvOOxkfeUvwdXq5/dlPeOoAMC74Y2Ew=;
        b=eyq7aky7VsQHdhQkeXiapZ/l1k2HCpBsokgldII0c2B4ellDtRD46ZG2+nEI6qxkkZ
         bKVP5/hvfa8SgXKvY9y0s2K524dGMFkkvB/Q6t1NtCFNvYZAvDx7bVvLVE7bcZp96Qke
         UoHLDwmtSAF+KgtiU9aA9AeH1ydETgx0bk/wjAqypmr9hXZf/D8r2zKe7khKaLpuDlWX
         6R/MGtjD+CZZW8DT7EmHAdshVuQ2v/LgyVrV8EnbAlsz88klZDD7wanUMFYipbFCA0se
         g6yRnp1yhdrpTGmBn1LDRKkbZfurHBy02f+qTUAiP0z2MLIza3O0+AIzuSSsM0HLVhXk
         +bhg==
X-Gm-Message-State: AOAM533IJKdcdJhR1Yq7fu2baPY4Yo98zWcxYCndcRHOjeJmqXeTK/Ds
        TWNuUU6iyExeOR7fCmYxBL7AlSR9h4g=
X-Google-Smtp-Source: ABdhPJyAsJjf/ZCfJJUJdaJg2YIW/O5BHI6tn1t5Q6AxVXcWJULg9Z8qjkOOE2UEUIs+3X3jFJEJBA==
X-Received: by 2002:a63:7985:: with SMTP id u127mr7522014pgc.228.1624588735083;
        Thu, 24 Jun 2021 19:38:55 -0700 (PDT)
Received: from [192.168.1.121] (99-44-17-11.lightspeed.irvnca.sbcglobal.net. [99.44.17.11])
        by smtp.gmail.com with ESMTPSA id b25sm3970390pft.76.2021.06.24.19.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 19:38:54 -0700 (PDT)
Subject: Re: [PATCH v2] pinctrl: bcm2835: Replace BUG with WARN_ON
To:     Jason Wang <wangborong@cdjrlc.com>,
        "linus.walleij" <linus.walleij@linaro.org>
Cc:     nsaenz <nsaenz@kernel.org>, "f.fainelli" <f.fainelli@gmail.com>,
        rjui <rjui@broadcom.com>, sbranden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        phil <phil@raspberrypi.com>, iivanov <iivanov@suse.de>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210624235122.24772-1-wangborong@cdjrlc.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <0b7f68ff-f437-ff7d-9eca-d220ca897192@gmail.com>
Date:   Thu, 24 Jun 2021 19:38:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624235122.24772-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 6/24/2021 4:51 PM, Jason Wang wrote:
> The if condition followed by BUG can be replaced to WARN_ON which is
> more compact and formal in linux source.
> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

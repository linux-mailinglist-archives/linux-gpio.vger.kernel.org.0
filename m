Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECD2162365
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 10:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgBRJbJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 04:31:09 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53748 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgBRJbJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 04:31:09 -0500
Received: by mail-wm1-f67.google.com with SMTP id s10so2007537wmh.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 01:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1GbHA/keOvnRptSZJ6pvFppLAhKvfcqxR9KXptl2KxI=;
        b=T8LhJhjIQAbzufPjIBK8TQGYr8JhDvS3dUQls+djP7N+YkzZjaVIcKB2hN3ehPvIJW
         pbPOhaK2v+SPkH9Ljwr5RqSNNh2QV7DqTnB09WGoy+SiJ83lTX3TmMBeeM5UQpbaFl/6
         NQq7RtvKg4MjIdyyHbeRhEl/eeTNLmPkDHaO/1pAJTWBsUOU7dehQPg8BhIgYW99IyPx
         BLAu4J21I05uaxMeTb1aSHcsm5fK6b8vtMRgUg0/y6uwW/c973K1GqmjLbO10S3E18uQ
         FZP54ovNcrFCvy41i/0jDveqygwuchBQmcybtAUm9SXBymGgPRXchmWCSCaB0lkzPO4q
         KFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1GbHA/keOvnRptSZJ6pvFppLAhKvfcqxR9KXptl2KxI=;
        b=XLMVktnCzm/G05OpsB2Ukui1svvzmghkRnJx+B5habLCSX+1dz4cFWXwtdH4kKcl6/
         45jtnK3M+n76FqwmM22FcX7I5XMAaqJ7/KySjCR+Lg68b+JsCnajRcPSHgK3SiemSZm2
         1S+fHLLHhU+nds+JZlgRCr0ZeY7nNd2PhZYAwqTzIOdLKInUvu31rLGZH+uW1pabm7i+
         31U+CjR/vIbBdODL4XyU8s/yYtuYqSw1QquGqaRjp+LelGhIiQdONEzYt0xgu2Z68bdl
         xW/j8tntLaFB1enPA8pkE9k9Yf+5CBjULOgoW477UmlihX4wpAHWVu12GAUOSvRbiZOL
         kJMA==
X-Gm-Message-State: APjAAAWxd2rMQXCIu6DQl3ToGBySG/t5on3yxaPJCTzWFQBge/DUDAa/
        744yloA2atHlETwDru/VUqaUkw==
X-Google-Smtp-Source: APXvYqzYSKx+Li0fYXpczjgKmT5lAxvxuI3FiTv9YUX9ISzPv2vzu0g+4RlIjaVPxsKMfNzQe7t6SQ==
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr2058482wmi.58.1582018266002;
        Tue, 18 Feb 2020 01:31:06 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id d22sm2637983wmd.39.2020.02.18.01.31.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Feb 2020 01:31:05 -0800 (PST)
Subject: Re: [PATCH 2/6] nvmem: fix memory leak in error path
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20200217195435.9309-1-brgl@bgdev.pl>
 <20200217195435.9309-3-brgl@bgdev.pl>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <207251aa-4f0d-18d4-d14f-ed6bc6fe0fed@linaro.org>
Date:   Tue, 18 Feb 2020 09:31:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200217195435.9309-3-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 17/02/2020 19:54, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We need to remove the ida mapping when returning from nvmem_register()
> with an error.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

Applied thanks,
--srini

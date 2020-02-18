Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53A7316236A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 10:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgBRJbT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 04:31:19 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40899 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgBRJbS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 04:31:18 -0500
Received: by mail-wr1-f65.google.com with SMTP id t3so23001409wru.7
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 01:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BpO/OHsHA7PV0jqwvZ1c934b+CkSx8X5QNPnOFLhiR0=;
        b=OsUoa6Qr1x69l/fct8bF47dGeH0qBz00GU27Scmsz+7rzcx0ZGOyND+E7ysQx8cdnp
         J/v6EpYKwWMBla2EdpVijHW6Flm5tGOdkv565Y5Qyc+smpaRx7KkouzdbgGuEhW2WXzC
         O7UNtZQn+qd0sbf6YFDZOFcWL61ONNI7hjvibxmg9MfFCIvqXC/0u02qu2oQJOLkCXJJ
         beQJC6K04ZRJJiqZ+IDEicnzHTwHgShvtupkKpKPqmENqxBSp9CwEAElS+yG29J1Yw8d
         9mSk/OufvScKTB2TDZgGqANNkFK7NsWV57J9kI4FJBhpLqPJWGDAHSxOEfV2vh2Deh0b
         Gdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BpO/OHsHA7PV0jqwvZ1c934b+CkSx8X5QNPnOFLhiR0=;
        b=AzId6iKx2IxgTYc9Pg7AlwdNuYq+tvYc8jDQEVbMAWQdsDoWFW7d8CKPRE63cRKF5l
         5g7N60dA0DcgXAGWcKU640tzOdxF4+6e0Z/gqcV4A+QB3WnBIDjyBh+L0MXVB+cA3+iy
         jLTsFEZPvvLnja+j48iJImNYPDJ5w41aFng3/jLwkd4bMqn4HsR9F3CvDln09Hi0JqDS
         Y0QT0IeoyXd017yTY3Wipl4FdZkfhUpFtITzYIbbrEk7IPrK4WNhx7thPsjFyo7dizWd
         PapvR9W6UWiacR3WGEIe+bnm/5hg9eR7s2N/1F8opMqU2z8BkBQvL/eGDsZFEVtS8jef
         gEQA==
X-Gm-Message-State: APjAAAWIUYxbddCOuWO27sCoxIz1HIJ6hZepDix8CJ+DVmWFAm/Fhi3/
        gBh1vHSbFE0e1XnWn3YPJg/OqQ==
X-Google-Smtp-Source: APXvYqyn1G9cbVIBmTWuD/btRrQZYOVc1Qk9wC5TwjUmciWe6Vk3QBn86rksk9mhr6SvzeNEZ8D1SA==
X-Received: by 2002:adf:eb46:: with SMTP id u6mr28188181wrn.239.1582018275789;
        Tue, 18 Feb 2020 01:31:15 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id a9sm5286992wrn.3.2020.02.18.01.31.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Feb 2020 01:31:15 -0800 (PST)
Subject: Re: [PATCH 4/6] nvmem: add a newline for readability
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20200217195435.9309-1-brgl@bgdev.pl>
 <20200217195435.9309-5-brgl@bgdev.pl>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <59e87e77-1251-38f8-46d6-1d283c89cf7e@linaro.org>
Date:   Tue, 18 Feb 2020 09:31:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200217195435.9309-5-brgl@bgdev.pl>
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
> Visibly separate the GPIO request from the previous operation in the
> code with a newline.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---


Applied thanks,
--srini

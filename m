Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96C8F1642C8
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 12:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgBSLAV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 06:00:21 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37826 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbgBSLAV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 06:00:21 -0500
Received: by mail-wm1-f65.google.com with SMTP id a6so120508wme.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2020 03:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7H/YCOn3cZ80p3ZvLfOobGUP/Cj28W0PDaZeNMELPIA=;
        b=flBkeap4OICGKzUAhwUnG6FiQB1q04IFsUXbjyFENB6EOm/Xqe55BJaBUvuTORHncc
         VswpQuiR/4l08ix5jb3w4/Uc6QoG2O8dGaIxzVt9wP0x4G2FSLCPEG/W3o8OLIrFBx/P
         IeqCZROJl3ptNO+i5+n5ziOvzba7tfCtGjz2cSyKsJ8dleFnYwzueCCsrCyPVTTstVH9
         sjTB6latKBzHDv69IKj7VJeH78iqDtGrVIuGaml5dsEsuV4zNP8fFGHmdzUYTdgVgb8W
         0ohMfKENUy7UNze1SiVkhESR2guCb527zd0ZJXxUVVx9MMqgev2XtDc3g0rB8O9igPlT
         GzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7H/YCOn3cZ80p3ZvLfOobGUP/Cj28W0PDaZeNMELPIA=;
        b=mBoSO6Lk/3escEkxXeL8hFa/hGlqtvVR6jt4Xv6eT70rw73rErH0wBHzDCBPYX6tfF
         5MGzsoRN3i/0yMlzatU+Jgnpa+nnAjzecc4FJCx2GgwUEauXUvFtjlcaDZo/zvAZocyf
         IBPa14kx/kyQrq5Tbtnc0CHMY/Lm6dZ2k+dZlkqkjv+ueUiKUiO9KjNl9DK8lTL/T+Sz
         QL4tWs3ANqpVo+CqiEgL/CHYU5j9pCnrBQeklGuXPBeVXSrEfOiEORyz+0pDN7/0oKIp
         QLaj0DssfJ3mRa1gfNlyTY+6jbDgv0uuBModBIXn4cJ7dqC+u2GEsnfqLX113c3llKun
         sAqQ==
X-Gm-Message-State: APjAAAXLFqaNiHTqwLijWs7BdS83Y0dG2/F0xKwDf46wKqrR8XWaEAur
        wU3ntfXnBXn2DBYzK/sU+bsAyw==
X-Google-Smtp-Source: APXvYqzf/HQlKxt/BTpiD44E/5sNAO7qxk3LcGuhwkPntczUGlNzz4XgXLBh2d4dsCaVgvNHY0KA4g==
X-Received: by 2002:a7b:cd14:: with SMTP id f20mr9243214wmj.43.1582110018880;
        Wed, 19 Feb 2020 03:00:18 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id t1sm2603782wma.43.2020.02.19.03.00.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Feb 2020 03:00:18 -0800 (PST)
Subject: Re: [PATCH v3 0/7] nvmem/gpio: fix resource management
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20200219092218.18143-1-brgl@bgdev.pl>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4a36c93a-704a-832b-0f66-dd17fe304da6@linaro.org>
Date:   Wed, 19 Feb 2020 11:00:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200219092218.18143-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 19/02/2020 09:22, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 

Can you please rebase your patches on top of

https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git/log/?h=for-next


--srini

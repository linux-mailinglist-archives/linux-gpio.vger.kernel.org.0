Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A31B1162368
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 10:31:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgBRJbP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 04:31:15 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38332 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgBRJbN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 04:31:13 -0500
Received: by mail-wr1-f65.google.com with SMTP id e8so510516wrm.5
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 01:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vAU9/IZSkHK9Aox2zLWCunLKvqMaq8guO6eTCBwn3vM=;
        b=TrdZpEjHaVMp2FbbqFvXLcNLZ5tJrqRNCYsPUUHgk1LytkOkvj4NX1xQxBbnLNhQTH
         QYzIdUfTjMP04BOi9cSIXMN5FEanQjQkhC4zSVmO+U+TlyKw3dsDDLq/lv10+AqvpbtD
         5wmOEfU89X4C6yhzw9So3VKldv0d5K90/WoJDeXquYVdRJXuMfWfaQ7r2Km6GQ0ADv1f
         9eu3e1sF06POjcQVM+v7mO8OT0rO4UpGUnQQ/zhhiUmuwtg5tUfta6W+FIGIi7N0u4Nz
         5Jao+ml0uoWNfHUthcbjeWzmdRZFWeyqGW18Ct4KjuA/S2mSBr0anMc/3JAHfgvL5YTv
         kDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vAU9/IZSkHK9Aox2zLWCunLKvqMaq8guO6eTCBwn3vM=;
        b=ptDqGQMxDh5crcJvljGt44h89hMiWuB40K1v+kkaL9+2t2Et5Xtf9w9kE6Mj+8QGJX
         v9vLFKKpVxGeRBMyRMPvjwTfF6WseK39DjT2RkmkY2FjYVJT82pYVGNb/0X22ZJsyBfO
         MPBIBSo12Kdz6JYwmm5aHKBy+CfFyBe1lJbanNIA71fmzToU+xcRNm6OxpQTS1/5008a
         NAwbyO8BZ/Kx+xRmVCHSVxqcEVORw6O7knU5AndybejHEUfRzAz0YSArkvj2uKbB+s9d
         IvrEeTwBcd0a/D/BV526JtTJtNbokatYcOEcHbmCCqmIGUOPTIyNHPxbl+VtApRQUny8
         sJKg==
X-Gm-Message-State: APjAAAWX9NCI5PoLMLdH++dbCzFXTN8ViSN8gWlD7/qqFA9k2Ev0gClD
        cfn7V8Y7W2sWwfEIi0acDA8LHg==
X-Google-Smtp-Source: APXvYqxyRlCWcR9Z4C5bM0MuV/o6OE2fb+ZexSAjZZxI6JOU6i9S6EKW4FsZGGwmHmRl0Qe157Zc5Q==
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr28649558wrk.101.1582018271282;
        Tue, 18 Feb 2020 01:31:11 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id h205sm2899648wmf.25.2020.02.18.01.31.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Feb 2020 01:31:10 -0800 (PST)
Subject: Re: [PATCH 3/6] nvmem: remove a stray newline in nvmem_register()
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20200217195435.9309-1-brgl@bgdev.pl>
 <20200217195435.9309-4-brgl@bgdev.pl>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <abbdbb0c-7a89-b8fe-d1b9-85c593598375@linaro.org>
Date:   Tue, 18 Feb 2020 09:31:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200217195435.9309-4-brgl@bgdev.pl>
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
> Two newlines are unnecessary - remove one.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---


Applied thanks,
--srini

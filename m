Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7D2B2E1A73
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Dec 2020 10:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgLWJPp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Dec 2020 04:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbgLWJPp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Dec 2020 04:15:45 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD03C0613D3;
        Wed, 23 Dec 2020 01:15:04 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m25so38416058lfc.11;
        Wed, 23 Dec 2020 01:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n469E9tH+QZ1gNVB/VQYfMM2oA/PuYJPKgl5aB9w/pM=;
        b=gB64ZAPmY/NaP3+GG0j27g49HKSbbj+wW3Q5QYzvZKTWpxIn7MMYUBrLNr1tiWQB9W
         T2WxaXUHCNW58W7JVt/axwVn99cIb8LtPIxi3kleaOu2J+knPtTCPs9lRws5KhL6jjzQ
         5B8ZMx8TUPJtGdpMMK58h1dTyrO7CRg6lGMok9jeUInovDh6p+z0IkAc9gbtGBqrb8Qa
         ZebzSkCc2G5IAOlExQEQyt2UO949BGqRXaRL3UGY4j7PbFmX/15SgOnKjx/TP/5NY28K
         HY++IPTdhOAHuV/RawG3crDTPKD0QIGC5TztNPDRyP/uJSbhfbq8SKJ09UCdnGU0MlXW
         3uVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=n469E9tH+QZ1gNVB/VQYfMM2oA/PuYJPKgl5aB9w/pM=;
        b=e8esyuwH5hZXvKPW4dJff6bF6K3SpMOc7kdD110Ecpbc4HgKHNmgLeBTzWYIV7znDs
         RRHeYx4/AM6XzrqMj8tAW+xqrEpRPR6WxfljGKgoZHzMd4Fek3O57F2+FIYdMIHFQZUh
         LvnYJM3MrUhqTXu7yF0qhkS/HJ+x2Kftp2uM92431bM7KvCWRS6w6KhsBbUcoqmG//jw
         mVezIrDqlHeTNvfrRjtzrxgfMWnhBmmL0qQQq0nvrg4WbxOS8aPGtW3e7rljmftueCQh
         HjkWai7g5b9KS8Q0APPBrguHl534JYVNy+wU0Yr+Xeb3yQ4bC9Estl6r+KDGH55ruqsz
         VmUA==
X-Gm-Message-State: AOAM530/MsivnR6mioS/EnFyyHB/KBdc+S4E++uxAWSAMX47giZuEiWG
        P9T5gYtjpKX46OOtuaXsw09swgu3DsCGBQ==
X-Google-Smtp-Source: ABdhPJxv/vEw0xcMZYVwvOFu/H/ZoVVWgJtGG5e2ejpKdVcPIYd94aWeauIfN4yN1bUosB+ff/aCig==
X-Received: by 2002:a19:83c9:: with SMTP id f192mr10009085lfd.399.1608714903193;
        Wed, 23 Dec 2020 01:15:03 -0800 (PST)
Received: from [192.168.1.100] ([31.173.83.145])
        by smtp.gmail.com with ESMTPSA id t17sm2439779lfr.5.2020.12.23.01.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Dec 2020 01:15:02 -0800 (PST)
Subject: Re: [PATCH v5 05/12] regulator: bd9571mwv: Add BD9574MWF support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1608636139-564-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608636139-564-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <7fcdab0e-7330-ee7c-abb8-7d89078a9621@gmail.com>
Date:   Wed, 23 Dec 2020 12:14:55 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1608636139-564-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 22.12.2020 14:22, Yoshihiro Shimoda wrote:

> Add support for BD9574MWF which is silimar chip with BD9571MWV.

    Similar (again)? :-)

> Note that we don't support voltage rails VD{09,18,25,33} by this
> driver on BD9574. The VD09 voltage could be read from PMIC but that
> is not supported by this commit.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
[...]

MBR, Sergei

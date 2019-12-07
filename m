Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78EF6115A7E
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Dec 2019 02:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbfLGBHq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Dec 2019 20:07:46 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42516 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbfLGBHp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2019 20:07:45 -0500
Received: by mail-pg1-f195.google.com with SMTP id i5so4164130pgj.9
        for <linux-gpio@vger.kernel.org>; Fri, 06 Dec 2019 17:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:subject:in-reply-to:cc:to:message-id:mime-version
         :content-transfer-encoding;
        bh=jgPnL+5CfrvgeIvrxi5m1URbPq9UfCHRkF3knFWgGMo=;
        b=vnGHB43imTN0QjS6hkVorlkKBz9FeRi7coqQYKVSZrNzu/moiA3L0lN/rlICiyRZHJ
         Mh53ovWyz5PC6CNMvZVO7WD6S1sTZ6O5LGg+ugmfR6s7ghr/zccdDSRcdHvZVCHtN7vk
         +MzaGgY460pFTYKZdZiU7yd9ELl1QotycSPLtwCk/MTZObu2SBttSveckWvIQRTPRJDb
         VYkI+7gPM5D0vkj3UthTfXLDDaaf2wdIiaP37tRn3NR00CjhJJIC0ncgx/AYpOOCXfST
         dbTRMxmf0dzFCZwJ4u5YxSgKZvnIl2uYwBkXhuvQHoEXnEj9IYeGoFnA8p/d1a5RZMQi
         KScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:in-reply-to:cc:to:message-id
         :mime-version:content-transfer-encoding;
        bh=jgPnL+5CfrvgeIvrxi5m1URbPq9UfCHRkF3knFWgGMo=;
        b=lZdXvmn6U7tq6jRsByQxRYY88PgH9u/y4XOmcy9W5HGHDHp6n2Pe8wr0pc2N4JHJWm
         ABzBmCmcaqHT/xvfrg3vi+tOuwVJyEawy4d1V/KPlGBfmAbYRUC9h+cNOcc2NOH3Bmc9
         w6jJh6YwRCv9qsI3NVuXYQEa0kLX+VLfixw5ojgo4uxRvFrxqUFEuyb/X5SiYa543FPk
         9E0zWWF4x+wnM5aZ6Nl6jQ//KUsQyd5pu0bbXYQeuc/QdJpDXpVyetCYJtsWtfnoPB7G
         HoiElz/oFdUWqXNWu2Z43bFIyJUkbKx2czz8PS+aVfr+6nV0EJ0xrEVdZITukIz9l0xQ
         /40w==
X-Gm-Message-State: APjAAAVohpPB4m4M83g01EM+pZ41p23YZsRUui3f482O8IKktg+LN1+Z
        SemOBTEKfyCsUSs1DjDzuwi5Eg==
X-Google-Smtp-Source: APXvYqw+i60gFlnrvD0Dor+Sp0d2gAyk8B4gXSdQsjoxvzXIiXKLyW9wvw9NoSdBgAup/UtS8uprIg==
X-Received: by 2002:a62:be12:: with SMTP id l18mr10004721pff.206.1575680865151;
        Fri, 06 Dec 2019 17:07:45 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
        by smtp.gmail.com with ESMTPSA id y128sm17328385pfg.17.2019.12.06.17.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 17:07:44 -0800 (PST)
Date:   Fri, 06 Dec 2019 17:07:44 -0800 (PST)
X-Google-Original-Date: Fri, 06 Dec 2019 16:33:00 PST (-0800)
From:   Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject:     RE: [PATCH v3 5/6] gpio: sifive: Add GPIO driver for SiFive SoCs
In-Reply-To: <208a63e8819b84f9dc03f270f2606294@www.loen.fr>
CC:     yash.shah@sifive.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, tglx@linutronix.de, jason@lakedaemon.net,
        bmeng.cn@gmail.com, Atish Patra <Atish.Patra@wdc.com>,
        sagar.kadam@sifive.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com
To:     maz@kernel.org
Message-ID: <mhng-be0f81d1-78d1-4e9c-8dae-1344635fbbb7@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 29 Nov 2019 01:12:10 PST (-0800), maz@kernel.org wrote:
> On 2019-11-29 06:27, Yash Shah wrote:
>>> -----Original Message-----
>>> From: Linus Walleij <linus.walleij@linaro.org>
>>> Sent: 28 November 2019 17:50
>>> To: Yash Shah <yash.shah@sifive.com>
>>> Cc: bgolaszewski@baylibre.com; robh+dt@kernel.org;
>>> mark.rutland@arm.com; palmer@dabbelt.com; Paul Walmsley ( Sifive)
>>> <paul.walmsley@sifive.com>; aou@eecs.berkeley.edu;
>>> tglx@linutronix.de;
>>> jason@lakedaemon.net; maz@kernel.org; bmeng.cn@gmail.com;
>>> atish.patra@wdc.com; Sagar Kadam <sagar.kadam@sifive.com>; linux-
>>> gpio@vger.kernel.org; devicetree@vger.kernel.org; linux-
>>> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Sachin
>>> Ghadi
>>> <sachin.ghadi@sifive.com>
>>> Subject: Re: [PATCH v3 5/6] gpio: sifive: Add GPIO driver for SiFive
>>> SoCs
>>>
>>> On Mon, Nov 25, 2019 at 6:58 AM Yash Shah <yash.shah@sifive.com>
>>> wrote:
>>>
>>> > Adds the GPIO driver for SiFive RISC-V SoCs.
>>> >
>>> > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
>>> > [Atish: Various fixes and code cleanup]
>>> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
>>>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>
>>> I suppose Marc will merge all patches into the irqchip tree as they
>>> are logically
>>> dependent? If you want the GPIO bindings and this driver directly
>>> merged
>>> (no deps) then I can do that as well.
>>
>> Yes, the GPIO driver have logical dependency on irqchip patches. It
>> is best if Marc merges all the patches into the irqchip tree.
>>
>> @Marc Zyngier, Are you going to merge all the patches into the
>> irqchip tree?
>
> I'm happy to pick this up, but that's definitely 5.6 material as
> I stopped collecting new 5.5 features a couple of weeks ago.

Thanks!

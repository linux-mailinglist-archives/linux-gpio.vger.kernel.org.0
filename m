Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED4E2AF6A0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 17:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgKKQen (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 11:34:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgKKQen (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 11:34:43 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C970C0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 08:34:43 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id gv24so956162pjb.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 08:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=E7tdJv/SATHNIn829RMc3Dy+9UyApMjdjMPVfkBbrsk=;
        b=hPFx5IuHaxeJELBn8a/6FXoQzTXaA4P6tVtDUuOMW7GWbi/yCgDUL4CxbD/v/ZLoEY
         bXoK2++cjH2Vhueb9F+BbvmMNatQ0ewQJlwl1qYaPPMSIEAjp27k2+WyOzw4KlI6gDcx
         bYX9md2+Qj3Gt+SPwymjGN6H3BdlhJR4ODuBJolA3wI4RTCMWhvOMbzIYmAAKVUETcUs
         vds6cOLcU/hn80WNIrGekNePOFbil8DXeRki9yUyoaH7Rd0rlchLbG2w5/ZZaBEIZGE2
         4u2jsaraD9+VBKlMk+YxeOW4R1d89oHt7Lcjz3CTF3tQ2byluEl630iCBM9sTbHnchx/
         6LTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E7tdJv/SATHNIn829RMc3Dy+9UyApMjdjMPVfkBbrsk=;
        b=Yksruii02v9Xcy3kTObL4iw8dm8XRV+W8xJnrVcAosQQFqdCqvLDUSnDj4KLEiB/b0
         kZDOTU8TVAyxzqncnOcxpmCMmo/BsqH8ZjVJilmY5sxiC9jHZjz6mwAU6jwQAicCMrwP
         9AM0YPXsJymWfiU5sMY++2v7mdg19o0Yx19yg9IaeuhPfjMimtXKKKxqH26OvrlViV3G
         d1NA2qbfyoxnGj7Mz50AQqngzoKOxGNyuHcLP3+sZnbXswrgQdIu+PhNz874Jr6z8be2
         OBj7sM9ttt5AFswNYdM4pbdyMT37OMV0glCzF1gOnO51h+EnU+/yCRG3nB7WK3eN/NPQ
         UFzA==
X-Gm-Message-State: AOAM532VFM5uvAsR7KXfwIe3HFw28H5NYgk1rEMEU81x1ylLTVc8hRyr
        I2EtXye28eNgGl+M25pNo4FiHfConjqnefNa
X-Google-Smtp-Source: ABdhPJzyEEZSr7GhXUEQUpmvkSfKa89fHU8pKhjajrQ6W0i7H1mIgobF6AVYHVPEtFAPv4icFmZPug==
X-Received: by 2002:a17:90a:1d09:: with SMTP id c9mr4619291pjd.80.1605112482289;
        Wed, 11 Nov 2020 08:34:42 -0800 (PST)
Received: from [192.168.11.16] (softbank126112255110.biz.bbtec.net. [126.112.255.110])
        by smtp.gmail.com with ESMTPSA id b142sm3120743pfb.186.2020.11.11.08.34.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 08:34:41 -0800 (PST)
Subject: Re: [PATCH v1] sh: Drop ARCH_NR_GPIOS definition
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
References: <20201012154050.68039-1-andriy.shevchenko@linux.intel.com>
 <20201109121333.GC4077@smile.fi.intel.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <10b4dc8e-db87-3f78-3ab7-e08469b9fe55@landley.net>
Date:   Wed, 11 Nov 2020 10:45:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109121333.GC4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/9/20 6:13 AM, Andy Shevchenko wrote:
> On Mon, Oct 12, 2020 at 06:40:50PM +0300, Andy Shevchenko wrote:
>> The default by generic header is the same, hence drop unnecessary definition.
> 
> Any comment on this?

Acked-by: Rob Landley <rob@landley.net>

It's in the stack I forwarded to Rich to look at this weekend.

Rob

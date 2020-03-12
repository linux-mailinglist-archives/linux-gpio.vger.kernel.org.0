Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34AAE1832B8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 15:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbgCLOVI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 10:21:08 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:32817 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727340AbgCLOVI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 10:21:08 -0400
Received: by mail-wr1-f68.google.com with SMTP id a25so7738007wrd.0;
        Thu, 12 Mar 2020 07:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=E7GG/qxk2/Ufsah3byIBSjxf9JKNhaAWtEG1t3CGtCE=;
        b=TepIO2vTA1MMEkJNBeuhNJiRhMJ/lQwuoc1g4aB6YPiIWEoSMpY02d/Qx0MZzfr3UK
         8MFEel+uvi8vjyvyttEhiBv/B7OxKnGLSafT4A5DYvP4xM7BAaETX4yEGfuQHjV18zwK
         7xTo2NrnEwx5zERAvFRP3BR9tBRqb9dF1KxgeKCf9VyzPHpP9Y7GP1b0w+YQGEDyNcor
         KxXTToWva61Cy/7fXXC7GaZyy14OSUNnor7uCY2GG/Nb+KicdE19QZuRs9TFAmIf8+nk
         u7u8ZZi5F8J9e9mhFr3wYEnuJX6FDA8OLq4w2nt54o1n0+DDn9X2WwM66f2/cB5rEWnN
         7PyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=E7GG/qxk2/Ufsah3byIBSjxf9JKNhaAWtEG1t3CGtCE=;
        b=TsmXSD9DdWxiQcEJx3qlSXvfGXEE5HHqw93T1/GFtVIhIzFFm1zHik9UHXGFWcOdda
         y6Ztm2oiqymfU+n45F768JvJhLcJGsiOKxSFVgcorhh+u0KaS1Y9mNVu47+7VQKzYYdy
         ZNRTGwZpmQTMFBEP8YB9dO6Kv7MpfHGdCyBfGgu644mx8xxwJRmpY4HVfNR51qSHWvRi
         3ewOQz/DMvHRkkTc4KK15J6H229Nk88a3V0I8GSzZbGFFkOuVFvOkHw4iqwdy6OloQrZ
         yjLDJZym7zGig9JhQYTf+5hQA6nYWdTf0oHfumRpdbedzkRqlLGSCBLuQkNGiz5OgP20
         WWaQ==
X-Gm-Message-State: ANhLgQ3adFAbuojaMIFWbpzrK3hBBCbvSmcPdZlsvUdwMFeU2pDvSDXZ
        q7kORIRfeWXLdluL1pg9mt8FicDtIoHzEg==
X-Google-Smtp-Source: ADFU+vuuIQvD7fW6QOLPfSwe+z+Kn26GrxvRyKEi5YHeCnhQyewj6ePbmlkAwdtpHosI/VZfClp3CA==
X-Received: by 2002:adf:f845:: with SMTP id d5mr10748480wrq.94.1584022865678;
        Thu, 12 Mar 2020 07:21:05 -0700 (PDT)
Received: from [10.7.1.8] ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id b5sm3901243wrw.86.2020.03.12.07.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 07:21:05 -0700 (PDT)
Subject: Re: [PATCH] gpio-hammer: Avoid potential overflow in main
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20200312094008.1833929-1-gabravier@gmail.com>
 <CAMpxmJUUth5w8tvZp8mFV-FDz0YivmRWAqsOQSTdze1xagMX8A@mail.gmail.com>
From:   Gabriel Ravier <gabravier@gmail.com>
Message-ID: <38cbabe3-151b-1fd6-9d36-f27e9c9aa414@gmail.com>
Date:   Thu, 12 Mar 2020 15:21:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJUUth5w8tvZp8mFV-FDz0YivmRWAqsOQSTdze1xagMX8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Ah, that was accidental. I was applying scripts/Lindent to my code and 
ended up also having it applied to part of the old code. Didn't think it 
would hurt, but I guess it makes sense to be this stringent on 
separating logical changes. Will send a (complete) corrected patch 
in-reply-to this message.


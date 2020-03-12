Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E59418332E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 15:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727597AbgCLOdM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 10:33:12 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44059 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727414AbgCLOdM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 10:33:12 -0400
Received: by mail-wr1-f66.google.com with SMTP id l18so7733110wru.11;
        Thu, 12 Mar 2020 07:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qn1Ivt4FE9cI5lryv7kNLlbCeK0IrUxfBddznm4H0x0=;
        b=C/iPDTjB2XK2iO8VIbsLFfqtYTfvPTZcm/3jt3PeH7lgRY5Vmyod5MoF86xDxp/mWD
         fd+IB55s9LvMm08mwG1V+0h19xLADhih1dExyDiW88jsagiAXfk+7EgITa2I9FyWbVS8
         AXxJ6uvdfc+cGLIAuTkM+cMwtgH5EWIjnXb1jb0IKmqtBPMdnadA1kvQKVSfVr1veif9
         6SSoxLLGX/bCDEkxt8UpojeGJ5o9a8XNG9Q5g4OrPEQb21UsIyVZ7q/I3vq25+KzJ/tJ
         OviSdCeb8raJ7MS+9g423zwuu9YnTJVPv4jGvDGy9sSNg+n6lsp0lDPr+aAKJcTuJiJS
         7PNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qn1Ivt4FE9cI5lryv7kNLlbCeK0IrUxfBddznm4H0x0=;
        b=U3Y3WPoAHb3WKdNtciiyP8QVQn6gJBVaMkKkdeKa2iHQmbaGogP/GFlAueCxM5fD8H
         lVB8lwIJ457l9gsJhU8ncMaSm7QnT2epXcn5QtN6XJPAO0FvQdGb7OXEU47vv9eCLbKM
         YJ4BmeSxMocOldjpJr+e3tPiR6c8ZxZFDbybyxPK+A87T52kVFkR4GPNK1EbyMIgp8GD
         p4bxqdKTxKL5vgMhW+RU+tSipthjIWvu1er3F2nBOhfYukhrSaDkXEvrTgiRcd8vq/ql
         ad3PxMcr6dHzSfbAh1O7cOFz/t/Q6txaQkhswv/3hbeFisWPc+Eo2wEJP/DFam9E+Ite
         G+9w==
X-Gm-Message-State: ANhLgQ1p3S3xscHiDkIT6Ji4X6Xcu1QIXOYxQBXBiSE5HNRL4oiX+4Py
        oQIFB5sNZR2Zn4l6+b9sNsjYUkd4IZdAAw==
X-Google-Smtp-Source: ADFU+vuPNFJHv/FWzrs14gQfks3kmHXa8SrOMf5fZKCV0vN77Cfiy15dVMTmn0/k9iiRxRAGeNOEAw==
X-Received: by 2002:a5d:4ac8:: with SMTP id y8mr11190628wrs.272.1584023590336;
        Thu, 12 Mar 2020 07:33:10 -0700 (PDT)
Received: from [10.7.1.8] ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id 12sm12782101wmo.30.2020.03.12.07.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 07:33:09 -0700 (PDT)
Subject: Re: [PATCH] gpio-hammer: Avoid potential overflow in main
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20200312094008.1833929-1-gabravier@gmail.com>
 <CAMpxmJUUth5w8tvZp8mFV-FDz0YivmRWAqsOQSTdze1xagMX8A@mail.gmail.com>
 <38cbabe3-151b-1fd6-9d36-f27e9c9aa414@gmail.com>
 <CAMpxmJVSPA9CQBGULyk69KaP42oMdKGg883z0FeFC_mSA5w2xA@mail.gmail.com>
From:   Gabriel Ravier <gabravier@gmail.com>
Message-ID: <55db9307-9a20-239e-127c-ea043600248d@gmail.com>
Date:   Thu, 12 Mar 2020 15:33:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJVSPA9CQBGULyk69KaP42oMdKGg883z0FeFC_mSA5w2xA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Ah, seems like I didn't read the guide to getting code into the kernel 
thoroughly enough. Should I send the patch yet again just with a v2 in 
the subject header or is there no need to bother with that ?

On 3/12/20 3:29 PM, Bartosz Golaszewski wrote:
> czw., 12 mar 2020 o 15:21 Gabriel Ravier <gabravier@gmail.com> napisał(a):
>> Ah, that was accidental. I was applying scripts/Lindent to my code and
>> ended up also having it applied to part of the old code. Didn't think it
>> would hurt, but I guess it makes sense to be this stringent on
>> separating logical changes. Will send a (complete) corrected patch
>> in-reply-to this message.
>>
> Please don't send patches in response to other threads. Always start a
> new thread and increment the version in [PATCH vX] tag.
>
> Bart

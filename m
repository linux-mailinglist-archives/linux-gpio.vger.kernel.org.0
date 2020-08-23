Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D28C24EC50
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Aug 2020 11:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbgHWJAH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Aug 2020 05:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgHWJAF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Aug 2020 05:00:05 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E94C061573;
        Sun, 23 Aug 2020 02:00:04 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id i14so848260lfl.12;
        Sun, 23 Aug 2020 02:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3mHHF/cCj93mk9O+OuFBr+f2r8uD6QtsJ9FKZ/VeVys=;
        b=U7GWEbuIeOO0w0xHHWNMw3+dnz700u7oHf0ht6OuIzKu2f6N1+FNJx1mKR6CjN7QEh
         K6ec2Gqjf/7eFIoVAdCcVpvzBkxhViv4eHmYoGGv6RwiruWoXl7ixk8cLIZ14Z0D2fTP
         8ybOgvh+oM3pTdfNzyVA8qmQQUwTlfqqNr4bPb80vX89xRpZPABcMon6RoLW4+qC4suA
         dpoc4FEW8DhNxzU5AaiMJLu5zde6psMDxeu9mn2/dT5FU9IRMl8L7klE2eocKGAYqgLU
         C39jNV1Zj63jBl/n1LyKxysBseR8xNgQntbTCsbVpdKR6SI+pC/gqb7XNV+zXY3V/1Ra
         hIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3mHHF/cCj93mk9O+OuFBr+f2r8uD6QtsJ9FKZ/VeVys=;
        b=XDnPd6G8Mx0v3E+kTuHlLaXzoFcixENQKdbT1sHMtOFgWSh01X18TDC2Ye4AVW1ywC
         XFuIpdQ9MLqiRjy7wOGeJqUG0Uboy5O4zsvs975tST7BxE07+6gkswGpiC6+X2qy2VFH
         p6hx/LabX9wfOEpLyG0RT5qKcz5lY3iV2TUKr4/mOOseNxEssXeGoONUf5sXWlfnAMbd
         PL4I8an7Qx27y1FbDCxS/G3+J+SX6jmP7lgLRSji1Bh067yQ5UjBF/UHiQ1LlDjsggQK
         vEcmNxYC3UiWpHF1LJhDgspswWol/Xn4r4Ld3OExJ4YjxW+GWTeDUwuez4VziJlw/JvJ
         MmfQ==
X-Gm-Message-State: AOAM530d0q1l/hMt4er+WjjofRvC0pWZpBFFRkJtl34E4Q9huuE5RW6k
        DU9CO9ZgmmFnae8nlerjchzDcgVFVgkeg10w
X-Google-Smtp-Source: ABdhPJzMdOPdz1GhTaMiiqCx7dIoBnM1kFz9bqv0bvdaqscSYZt40TyrCvd1FoT2ZsXF9zNrGbX7MA==
X-Received: by 2002:a19:843:: with SMTP id 64mr305637lfi.156.1598173203065;
        Sun, 23 Aug 2020 02:00:03 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:84d:ebc0:4575:2d62:792b:cde7? ([2a00:1fa0:84d:ebc0:4575:2d62:792b:cde7])
        by smtp.gmail.com with ESMTPSA id o24sm1459226ljg.69.2020.08.23.02.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2020 02:00:02 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas,rza2-pinctrl: Fix pin
 controller node name
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20200821111127.3771-1-geert+renesas@glider.be>
 <56474631-119b-d64b-3545-a14f800aaa61@gmail.com>
 <CAMuHMdVr1FBD+Gto8zf-tAp4_YTP1zs_qKu=yBeS3n2yjVqX0g@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <b270e095-441c-bef3-f841-4bb24d31c646@gmail.com>
Date:   Sun, 23 Aug 2020 12:00:01 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVr1FBD+Gto8zf-tAp4_YTP1zs_qKu=yBeS3n2yjVqX0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21.08.2020 20:41, Geert Uytterhoeven wrote:

>> On 8/21/20 2:11 PM, Geert Uytterhoeven wrote:
>>> According to Devicetree Specification v0.2 and later, Section "Generic
>>> Names Recommendation", the node name for a pin controller device node
>>> should be "pinctrl".
>>
>>     Ugh, what a lame name! :-(
>>     And they say DT should be OS agnostic...
>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>>     I think more DTs have "pin-controler".
> 
> I was surprised to discover the opposite, too:
> 
> $ git grep "\<pinctrl@" v5.9-rc1 | wc -l
> 335
> $ git grep "\<pin-controller@" v5.9-rc1 | wc -l
> 102

    Sorry, I was probably thinking that I was replying to a DT patch, not the 
bindings patch, hence this comment (it only meant Renesas DTs). It doesn't 
really surprise me that more DTs overall have "pinctrl", sigh...

> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei

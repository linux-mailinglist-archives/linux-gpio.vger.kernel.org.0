Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152162D0D30
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 10:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgLGJjV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 04:39:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgLGJjU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 04:39:20 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74FFFC0613D2
        for <linux-gpio@vger.kernel.org>; Mon,  7 Dec 2020 01:38:34 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id x22so10842515wmc.5
        for <linux-gpio@vger.kernel.org>; Mon, 07 Dec 2020 01:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XpZ628O5xaXa4RdOKN7MsGWRWJi7+t1IcOBgJgwxavs=;
        b=sfF17KBm2xoH141r0pfHE47pI1OemoN9EybfIO3Ncd9nZlNuvMJj8l+4ARZJMO4FvT
         iW8eTCDgYZFqyxaCPdVDBID3vQFjxEVX9a7ufst4amolQGqi2keHfkRhzvyt1jhf7hEw
         1de/iabQBbAjgqGX3NeGFXk7UWMh2Ke2mHj9BUN2iGQ0JGYaoskfyp7KCVbAVE43xIwi
         Kjqw6xZ+LhKxAellDgvDuGw552lhrdpU4+X/cGHQaHPwGepodWmsBQ2qOz2hJ0dzWQKT
         zg3k/G3Yp8y7XG9LovsnFJ5IKhKXWaDpjenONKVgn/URho/cNUIrjzNlEX/werJ0Bq30
         Tjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XpZ628O5xaXa4RdOKN7MsGWRWJi7+t1IcOBgJgwxavs=;
        b=PhIzjwbbwCogoY9uRZumhSvzsLZo82wbEqJMEIA9Rdj5s3Nd8xD8/OBBiZgG3QrLf3
         ARi7I3TR16n29rcBE/Sy5t83Gv57Wp+77cMeyzgR9WfI3Vr8Oim8W3ciCtTWL9sznabQ
         iUfy1g0uNy36XdiEIs7WSSpPguCp7iZVAxP6t2rPwFUYA/SQ8uzaHy9kNZd3jxFW26Hn
         uUNh4SiYIt17p1ht8OA8aWuJJLbhl/SAdFdHJnY3tR/+NFS5hLqLrhQlcL1yQcZ5G1r9
         KFhze/gl3Pxggm5rEB25Jz4AdNZ/SqNJBW7vhajQUJ1LTn3QQRZCdXmYMjBpiwoWlJOS
         tf4Q==
X-Gm-Message-State: AOAM532yyhAr66RexmBumC0+TZEFWj7SA0Y4qXs4Z83MV9QNhILGJSgW
        Mnc3hh2ZRbFAWp6Q6bR6Ao27OQ==
X-Google-Smtp-Source: ABdhPJxGvianTv9DEmfI3MU5uIAXw/ZzSnzw9NA0pWoTLejhJd+h21+1YtLVTZFvErdVAlqf4iLZpg==
X-Received: by 2002:a1c:9ecf:: with SMTP id h198mr17284160wme.104.1607333913196;
        Mon, 07 Dec 2020 01:38:33 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id h15sm14315088wrw.15.2020.12.07.01.38.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Dec 2020 01:38:32 -0800 (PST)
Subject: Re: [RESEND PATCH v6 2/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl
 driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201202163443.26499-1-srinivas.kandagatla@linaro.org>
 <20201202163443.26499-3-srinivas.kandagatla@linaro.org>
 <CACRpkdabPygUmZXT6FMT4fEU6D638Y3XRwvODy8ucUAbuQ4kvg@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4073d9ec-e959-7216-79fa-ee210fbfff17@linaro.org>
Date:   Mon, 7 Dec 2020 09:38:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdabPygUmZXT6FMT4fEU6D638Y3XRwvODy8ucUAbuQ4kvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 05/12/2020 22:36, Linus Walleij wrote:
> On Wed, Dec 2, 2020 at 5:35 PM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
> 
>> Add initial pinctrl driver to support pin configuration for
>> LPASS (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
>> on SM8250.
> 
> Patch applied!
> 
>> +config PINCTRL_LPASS_LPI
>> +       tristate "Qualcomm Technologies Inc LPASS LPI pin controller driver"
>> +       depends on GPIOLIB
> 
> I added:
> 
>      select PINMUX
>      select PINCONF
>      select GENERIC_PINCONF
> 
> When applying. You need these I think, your code is working because
> other drivers are selecting these for you, right? The build robot would
> hack this to pieces though.

Many thanks for doing this!

--srini

> 
> Yours,
> Linus Walleij
> 

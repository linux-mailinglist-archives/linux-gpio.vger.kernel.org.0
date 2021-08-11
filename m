Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B90C73E8D76
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 11:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbhHKJrn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 05:47:43 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:48912
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231653AbhHKJrm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Aug 2021 05:47:42 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 6FC5F40330
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 09:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628675238;
        bh=PS8yHIKypIU7zjLPbMN2+vMgzErZMgMuY8iIETH4G0E=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Q9xR+QkUrIo7CU1N8tqHSaysSSzlfIHPcDEuGPsB4Oy3AJNXQVTqTYH0KINBdSDZH
         k8Qhrotyq6S/NGxatX3xfaaUARwtcOFJGYuUWhF/F6DdKxMVhXtK8rn7bcuN+KMwjD
         dI6lX92u5uxtJYOeNYOo3PtLAqq3/UygZ5kyHA1NdZQ62vve8yKNUmhk6dEh3GY6XM
         O/OB6MZKFSTsxV0PrRt695MVki1mmb4Yxm1knQikaJDk+aiIVkyECdu+N82vCy2GSs
         7ZG1dTPxvfCtuSt4id2hbMxOF4HvlAnLbRT5Y9XR/VvfLfBnkoTVjU9yzmN8Lni6NM
         +tmfSuPri8esQ==
Received: by mail-ed1-f72.google.com with SMTP id d12-20020a50fe8c0000b02903a4b519b413so948430edt.9
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 02:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PS8yHIKypIU7zjLPbMN2+vMgzErZMgMuY8iIETH4G0E=;
        b=uS/fbUt3SuSvF6dKiIgURAQhPCXK+p3tBitGM8CZgb67O9JLs0gWZ8OVI0NDULOVr+
         595rwsn53wX4y+pmT6EWszR1wOQl101K5MNTjjFuEkY5xpCEERYm/iKhZNUavC+jTrUf
         GyoGWR1nZhJmCf2dK79CGsJ/S0/IkjJeGN6bdEYroLt8Wa19i/0jCe0GHc6x7ahh6Tq1
         QHXCvzdpG9XgkLrdZc6EkA9y5Ge3S6otXe8YkAklg8S59Cs6jhO0cvY3ldH8lAJ9E+cs
         y6phLb6tFzc08y43wHrcscDYQuR/Avi0/5EbY9NyIF+wONanMfBCSvS4reNLnl9+w6VX
         +cmg==
X-Gm-Message-State: AOAM532pnXaciwt8BItLYCHCjgIoW2EaEli3OU2Q4sBcH3jmwUB4/EH0
        Mfmi6fcqdjSK+OTT/+twaHqjmVRrHg9M8fv9lEa2hnaDKxFBf/2vHuo+cojOSJQjFmch4LHnMIq
        OJlD8sFN1zrwt8faPltlvSzhJrrKZ7QyThweFrCs=
X-Received: by 2002:a05:6402:3489:: with SMTP id v9mr10558290edc.379.1628675238032;
        Wed, 11 Aug 2021 02:47:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKnLgxSqQnEduvT026FRmXeeMndTcAU4cAxXY0ufzsJkkLI7k6aLcWk+14ITfo34bPu2r46w==
X-Received: by 2002:a05:6402:3489:: with SMTP id v9mr10558262edc.379.1628675237812;
        Wed, 11 Aug 2021 02:47:17 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id c6sm7906447eje.105.2021.08.11.02.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 02:47:17 -0700 (PDT)
Subject: Re: [PATCH 3/3] gpiolib: of: constify few local device_node variables
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20210728144229.323611-1-krzysztof.kozlowski@canonical.com>
 <20210728144229.323611-4-krzysztof.kozlowski@canonical.com>
 <CACRpkdabg6vDKSRL6_AJUOMm6L_zUFCxf9nBz-MbfA5rLGcHng@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f830c295-03d1-831c-8561-248d54cd782e@canonical.com>
Date:   Wed, 11 Aug 2021 11:47:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdabg6vDKSRL6_AJUOMm6L_zUFCxf9nBz-MbfA5rLGcHng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/08/2021 11:00, Linus Walleij wrote:
> On Wed, Jul 28, 2021 at 4:42 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
> 
>> gpiolib does not modify struct device_node, so few local pointers can
>> point to a const data.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> LGTM
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> I guess this needs to be merged with the other two patches?
> I suppose in Rob Herrings DT tree?

Bartosz replied he merged it:
https://lore.kernel.org/lkml/CAMpxmJVtxy-GBWmFLp-tMAOf03Fr7fg8RZ2ndMbvAu_M3qEkHQ@mail.gmail.com/



Best regards,
Krzysztof

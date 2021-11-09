Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAD244A519
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 03:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242214AbhKIDB4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 22:01:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236778AbhKIDBz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 22:01:55 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47A7C061570;
        Mon,  8 Nov 2021 18:59:10 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id j17so3608491qtx.2;
        Mon, 08 Nov 2021 18:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KTb+7uV/W+NPaaM9VZAqKHX3rqV7nBXAeF1f2Hw+bI4=;
        b=ij+A9vEaG/2b35tGtQspRFkQMmic+mzirQ6ss4f/MwfoH4dzDnv59zb8J+Z+6X+kh7
         4yjzK5yktnBWaipNbGhofbMEcLokPg7SctncpMsolsWZCuvWq7gJSy7Gai6sWstsXsrb
         CMf6vZW/0s4TevvgP7k2kMqwgi89Tcvt0JJJVRhUtQUSKEbx4eO1+RaNnHexPy6SE4F8
         wCVdqB0/ghtqKkXCYW4O7akYJrWwXwCCzvIW8M4H3/qOhLvf4PJmRjuIgDD5YfkSCr5y
         4rP3pBXOd0s5VfWM3hWx75mee76G+majcCOiD/sB3Tw/sUYZt3TVVz/bhAQAMicr6/ta
         WsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KTb+7uV/W+NPaaM9VZAqKHX3rqV7nBXAeF1f2Hw+bI4=;
        b=jhlQz4jW0G5/fuenasVSbO62E9MQXQqHKPmCypm54ja7hWNS/9G6or/PEhjk5yDayI
         CQVoBnqMJzOcFUQvhAo/+CMA4lHY4guucDQOjPsIw4BBH+B+C1SICYk2uXK9hIXS/UAd
         Du4yhg+RWpkI/VMA9hxFmUXISLD7pRgfavCOzvGLxGcx78yUqOfwZWsRyFj0kWpqiFGK
         q4iEQQTMfxXVCUr4zxmcVy9QQCZaJ9f2BibFvQqIkrZD2QmMxG6rwaX4GHsgu0DTnWOd
         NLgUK619pL8kfeTDsvJzDo7ylkE4kOsAcedShZ5OkCjiOw9t8Ub4l5lSXhDS2ywtxGnO
         qfXw==
X-Gm-Message-State: AOAM530mQH1aeYXMFVbxw91XhH3R6C3Wc/ahQrIT0xKB/uz7dA6zk+SK
        YXDx0/3AEZeb8ll3rpula00=
X-Google-Smtp-Source: ABdhPJwFKM3gy/6Cpe0SzF+P+k3n+KU7EeM7tmAMCtcmrYQX7XtMBHopzbqmIn4FtK1sLFxDRdNQ6g==
X-Received: by 2002:a05:622a:2d6:: with SMTP id a22mr4824094qtx.220.1636426749863;
        Mon, 08 Nov 2021 18:59:09 -0800 (PST)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id g13sm11137437qko.103.2021.11.08.18.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 18:59:09 -0800 (PST)
Message-ID: <7a96b7aa-b7f7-ac9d-89e9-4843104f4254@gmail.com>
Date:   Mon, 8 Nov 2021 21:59:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl
 binding doc
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, mturquette@baylibre.com,
        aisheng.dong@nxp.com, linux@armlinux.org.uk,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, adrian.hunter@intel.com,
        linux-mmc@vger.kernel.org, kernel@pengutronix.de,
        shawnguo@kernel.org, linux-serial@vger.kernel.org,
        jirislaby@kernel.org, robh+dt@kernel.org, abel.vesa@nxp.com,
        festevam@gmail.com, ulf.hansson@linaro.org,
        linux-kernel@vger.kernel.org, stefan@agner.ch, olof@lixom.net,
        sboyd@kernel.org, nobuhiro1.iwamatsu@toshiba.co.jp,
        linux-clk@vger.kernel.org, arnd@arndb.de,
        devicetree@vger.kernel.org, linux-imx@nxp.com, soc@kernel.org,
        gregkh@linuxfoundation.org, giulio.benetti@benettiengineering.com
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-3-Mr.Bossman075@gmail.com>
 <1635902437.626178.3880384.nullmailer@robh.at.kernel.org>
 <c97c45ac-d9d6-a21b-9c43-69f58b07f265@gmail.com>
 <CACRpkda9e8FtjR3XB97Lu8X5=yeApk==4+zSqo3Qp6bWxgJAcw@mail.gmail.com>
From:   Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <CACRpkda9e8FtjR3XB97Lu8X5=yeApk==4+zSqo3Qp6bWxgJAcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/8/21 20:07, Linus Walleij wrote:
> On Wed, Nov 3, 2021 at 2:38 AM Jesse Taube <mr.bossman075@gmail.com> wrote:
> 
>> Ah I thought it would stop make at error i see it now, is there a way to
>> do one file.
> 
> Yes:
> 
> make dt_binding_check DT_SCHEMA_FILES=Documentation/...
Thank you :). I'm sorry about the lack of activity recently but Giulio 
has his work and i have school, but don't worry we are making progress. 
Thanks so much for everyone's help with this, and dealing with my 
newbieness.
> Yours,
> Linus Walleij
> 

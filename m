Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196AD24D88A
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Aug 2020 17:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgHUP14 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Aug 2020 11:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbgHUP1t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Aug 2020 11:27:49 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A55CC061573;
        Fri, 21 Aug 2020 08:27:49 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x64so162780lff.0;
        Fri, 21 Aug 2020 08:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x6HtUbFf96oPZrSCaNseQpqm40kBH3Q2unc0hJKDKDU=;
        b=lxcAsT2XFgYSVld2VwU2AUhjthG+GYo9NI7zHYolqatS03sRmCAoVxyTUtWeZhmxwy
         iWrYkYpQaRwqbk8oTUddDkUo9fpG8tuIgQM1e9yMmd6o8xeBxaEdI1oUxGEiiebeLdJj
         5GWaWBDAFx9pCFieuSieDLFfxFifn5/GtyqKqWbGzMaGIqMCc0OPf6MmnEjnKunjF6eU
         tUHbawCnp7w0gkvnnCRTYZftQfdZGlDt1bMip2LSbC7xrov5uhgydtXMxhjgEjNW4Ikk
         NrcAn09A+7U6OKsjyBKsYKFEhXBPM/m6XqTNWM0BiTi2HD8lZ6b6U4BU6OayIYg4dB2/
         LKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x6HtUbFf96oPZrSCaNseQpqm40kBH3Q2unc0hJKDKDU=;
        b=Cxtk7BPYWK5SeH9oOb0ZlcJQ2buQ3ds2lc6TJBJkl4I1q1uVqD3pMTzBIAJ+NyrcKS
         tAUOr/lVSW2a3I101t4wF/hBhdigllE9CliXTCbhzwtUXw2TtivEhWy+LdY2axTj/8qZ
         eb4npghuVvxh4d9qWXa6u7KBhUN1f5citAz54HCeFw+wMMzvwI6Fl8wA2TXIvwUIpogM
         xDVqpblWTctUE3Bk5NhWN85oCiOkv0coFSMQMVa6vMWZ3L77X8BI6l6Pj/LADDoK37l9
         QARbk3GX/W3gtWHVo0Udqa+rUK0Gz0MJr83gwaEQ4/VrzZuGBcQ8jZ/2qD2pNIWAXOEk
         351A==
X-Gm-Message-State: AOAM533oXCknEy61fekYAIvd6gJ9913yWzP/Lnw45FDsK7FP3RcTySuV
        +kX5Py0lhM0kkmbTwhOGvlZMXf5vBhBrcg==
X-Google-Smtp-Source: ABdhPJx7bwfv/I51vDeUMlofs4XqaObwpAWwRFfmVc+kdZs+m1DbAJB5N+nqIyIpbQkILy0QgVQikw==
X-Received: by 2002:a05:6512:1048:: with SMTP id c8mr1607766lfb.101.1598023667350;
        Fri, 21 Aug 2020 08:27:47 -0700 (PDT)
Received: from wasted.omprussia.ru ([2a00:1fa0:48e7:10e3:3a50:6605:bcd3:dc7e])
        by smtp.gmail.com with ESMTPSA id 23sm446856lfg.59.2020.08.21.08.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 08:27:45 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas,rza2-pinctrl: Fix pin
 controller node name
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20200821111127.3771-1-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <56474631-119b-d64b-3545-a14f800aaa61@gmail.com>
Date:   Fri, 21 Aug 2020 18:27:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821111127.3771-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello!

On 8/21/20 2:11 PM, Geert Uytterhoeven wrote:

> According to Devicetree Specification v0.2 and later, Section "Generic
> Names Recommendation", the node name for a pin controller device node
> should be "pinctrl".

   Ugh, what a lame name! :-(
   And they say DT should be OS agnostic...

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

   I think more DTs have "pin-controler".

[...]

MBR, Sergei

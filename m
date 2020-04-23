Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEF641B5808
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2020 11:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgDWJWP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Apr 2020 05:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgDWJWO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Apr 2020 05:22:14 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6037FC03C1AF;
        Thu, 23 Apr 2020 02:22:13 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g12so5744860wmh.3;
        Thu, 23 Apr 2020 02:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=btabh5/U5IS4DvSrJ46McLe8iYZOnzD/LBG7g1Agp4o=;
        b=JBc99Oy6ycZr8AgmbN3PuDPMJt7RNI4PIxAMIfLKsk8ZBmEJs/cbOWPtLTd9WE2DkC
         rlWyQ9XwsMf5E3b/Zm+qrwqlHT2PL0F6/i2H3lIjtWZZYe4DN+0uT6H9KwXnW35XDDiV
         ROB3pzQWOAcYO38jZwCAldA5qlyg+QL0N5NZUVz36dejzpN2jItHfcSoPJFPoWHRUxJ3
         lahKj/chvBK3WhlwjeCtVrHU2dnp2GzW7rqM6wZMoisKPhdi7DicLeo2M80rIQDN0DRs
         mMoEjAnJYlHn+nqm2y5JnB1/GW0yOkcn27uJgCXhogCrSreqgOayXVprRRs3YuYOyKlR
         XOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=btabh5/U5IS4DvSrJ46McLe8iYZOnzD/LBG7g1Agp4o=;
        b=gHiThqdSVCQ5+Rlr5qgVwUVbZ0c5TRxhXdXCRKTdRfDxa+Ty3I60gJU/bVYWWp5by/
         3ADzxmSo9gBjJB8ErZnDt9bWrFgrMSFExpAla/CFXKvlOJCoKfXz5PjsC3ngyw8wEJDh
         JGFEvLsUOXuXQ/CFyp5xoJw9nuapF4qCXWec0GaOJW2gaERgzO7iFqiLihQgLdWZNwvH
         3Y2wZh/5Gh/IYI2r/cU5gcGZT3mtGrne1RIzPzNtNbgNkEgt2yo97CNXnhURT3djLTTa
         kqCydGCsW9Qldrf7kr1mYv48MFJGR7hWyrdVPLvmE5S8ypBxPnk7Aao81rPFUz9eOUqy
         VtAg==
X-Gm-Message-State: AGi0Pub5qkLwnBE5yoMcWZUAM7ZlLMyNlTk+wecQjIK5xH6ye2H4CC5c
        eK6z3OlKlizQ+anx4cOJ4z4=
X-Google-Smtp-Source: APiQypKtWsmwXcux5loeAj6aeW79iDTXf5BDdnnetouqUxQDz+zSC4sU2dodzvfvNu0cgDQCHMHW0g==
X-Received: by 2002:a1c:e444:: with SMTP id b65mr3253089wmh.6.1587633732107;
        Thu, 23 Apr 2020 02:22:12 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net. [83.42.57.116])
        by smtp.gmail.com with ESMTPSA id s8sm2796135wru.38.2020.04.23.02.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 02:22:11 -0700 (PDT)
Subject: Re: [PATCH QEMU v2 1/5] ARM: PL061: Move TYPE_PL061 to
 hw/gpio/pl061.h
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alexander Graf <graf@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20200423090118.11199-1-geert+renesas@glider.be>
 <20200423090118.11199-2-geert+renesas@glider.be>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <f976df56-7426-0cc3-c421-67c2a5b523a2@amsat.org>
Date:   Thu, 23 Apr 2020 11:22:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200423090118.11199-2-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 4/23/20 11:01 AM, Geert Uytterhoeven wrote:
> Move the definition of TYPE_PL061 to a new header file, so it can be
> used outside the driver.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - New.
> ---
>  MAINTAINERS             |  1 +
>  hw/gpio/pl061.c         |  2 +-
>  include/hw/gpio/pl061.h | 16 ++++++++++++++++
>  3 files changed, 18 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/gpio/pl061.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8cbc1fac2bfcec86..e760f65270d29d5d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -538,6 +538,7 @@ F: hw/dma/pl080.c
>  F: include/hw/dma/pl080.h
>  F: hw/dma/pl330.c
>  F: hw/gpio/pl061.c
> +F: include/hw/gpio/pl061.h
>  F: hw/input/pl050.c
>  F: hw/intc/pl190.c
>  F: hw/sd/pl181.c
> diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
> index 2a828260bdb0b946..e776c09e474216ef 100644
> --- a/hw/gpio/pl061.c
> +++ b/hw/gpio/pl061.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "hw/gpio/pl061.h"
>  #include "hw/irq.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
> @@ -33,7 +34,6 @@ static const uint8_t pl061_id[12] =
>  static const uint8_t pl061_id_luminary[12] =
>    { 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1 };
>  
> -#define TYPE_PL061 "pl061"
>  #define PL061(obj) OBJECT_CHECK(PL061State, (obj), TYPE_PL061)
>  
>  typedef struct PL061State {
> diff --git a/include/hw/gpio/pl061.h b/include/hw/gpio/pl061.h
> new file mode 100644
> index 0000000000000000..78cc40c52679dc4e
> --- /dev/null
> +++ b/include/hw/gpio/pl061.h
> @@ -0,0 +1,16 @@
> +/*
> + * Arm PrimeCell PL061 General Purpose IO with additional Luminary Micro
> + * Stellaris bits.
> + *
> + * Copyright (c) 2007 CodeSourcery.
> + * Written by Paul Brook
> + *
> + * This code is licensed under the GPL.
> + */
> +
> +#ifndef PL061_GPIO_H
> +#define PL061_GPIO_H
> +
> +#define TYPE_PL061 "pl061"
> +
> +#endif /* PL061_GPIO_H */
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

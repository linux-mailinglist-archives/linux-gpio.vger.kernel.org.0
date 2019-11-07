Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA105F2CB4
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 11:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387796AbfKGKju (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 05:39:50 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45071 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387728AbfKGKju (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 05:39:50 -0500
Received: by mail-pg1-f194.google.com with SMTP id w11so1890686pga.12
        for <linux-gpio@vger.kernel.org>; Thu, 07 Nov 2019 02:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uWwhJ/no4HjBNGE8MdRigigVoWCApSAlQDHTpzX0tEA=;
        b=WnH2JbkujCDw9Cd+ptok3k0K1r7RKxWEz7EBjFPVnucqOmB/KGVLEds0crkyqw7ApJ
         SZILBKK/hYQSM6TRlsLvRUdQaPRldbttCp61Op6i+BlETy4NBiPwh3z31VgZV9QG3ko4
         +hE6OMdxFjuethnaPuBa78DU9JaRDeWEbK8CesRsSDYpa9B7njHI36lbQzutdUBMIjL9
         3+2SOiOxBS4BPU5Q9wA9LaPIF6pu8dYUJtzlA2o1P3eZtsHU5ylwnfRvteva8vxTixBK
         hHrPG/RbfUV0UsfRzHree9IQoGs7DYZg99lp0KMtiQzv2pYUHBt9rNhMrYlIiUhSotnj
         Pqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uWwhJ/no4HjBNGE8MdRigigVoWCApSAlQDHTpzX0tEA=;
        b=hoOUiXlAR4lygwcxgZPyDU7N1oYcoi1bLue46Rlf04QisAPYo7bYumxiACGCsVn72d
         9Ivb/WfDwtnkQoNjbOjL+YaFKtQjzscwbu9d7bc+bUFw2Cdbd3U2DMwO0rUwhfWRFits
         AWXtQM4PkV5FKiF2yvq7rgc0YXzh+P+YwVDz+HM9xBKFKuortE9idL7qRE3ivC0rmWc/
         4HvfHLbajIV8Cwz18x6K45fC7vREdN6DBylpE3x7G6cUQ9D9ubW3UFJtzhkbqrd28ibs
         tNjWNN7L7pmkd79JvLw21g3q2RyN+x3jPGw/CILHG5SkF7NcCiPoXWbCsCj78uiksa4H
         WpoQ==
X-Gm-Message-State: APjAAAX5HeI+sk0ETVZ9LJ9VhuROKWjMBVPUWAvrHPlg8UeKEYfZDOHt
        Lp/usQnq/+eq6Z3AiR/5B1mtsAP0ZwA=
X-Google-Smtp-Source: APXvYqyvveJJZ47dYeOZ0FWzOxKOUJ+rDm1eUVHnaYP9m3qK11v6o+F0w5W16uFfzv+zIYfMCEwz6g==
X-Received: by 2002:a62:7796:: with SMTP id s144mr2973017pfc.37.1573123189393;
        Thu, 07 Nov 2019 02:39:49 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id a6sm2764210pja.30.2019.11.07.02.39.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2019 02:39:48 -0800 (PST)
Date:   Thu, 7 Nov 2019 18:39:43 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Drew Fustini <drew@pdp7.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 0/7] gpio: expose line bias flags to userspace
Message-ID: <20191107103943.GA29374@sol>
References: <20191105020429.18942-1-warthog618@gmail.com>
 <20191105152616.GA19978@sol>
 <CAMpxmJX-gvTDJ9CBBKjtcvd11yBCbqRz1Bw4Y_X7CESSsyJrzw@mail.gmail.com>
 <CAMpxmJW6R0gv5VG95ayx2wGSdPG1hUnuKqxtBEeWg+MHkcWX3Q@mail.gmail.com>
 <20191106064842.GB3478@sol>
 <CAMpxmJVORDjTWJ+j6LUERhKnW8DS_0GopcSuTVNOnda44u=3kg@mail.gmail.com>
 <20191106165804.GA12770@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106165804.GA12770@sol>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 07, 2019 at 12:58:04AM +0800, Kent Gibson wrote:
> I've pushed some more changes with the updated API we discussed earlier.
> Those new tests I'd added now pass.  Yay.
> One problem though - gpiod_line_set_config as written has no way to
> accept an as-is direction.
> Hopefully I'll have some time to take another look at that tomorrow.
> 

I've pushed some more updates to my libgpiod branch[1].  They fix the
direction limitation I mentioned (I was using the wrong set flags), 
and extend the tests to cover all of the SET_CONFIG fields.

That completes the C API changes.
If that is ok with you then I can take a look at the corresponding 
changes to the C++ and Python bindings.

And I guess we should move this libgpiod discussion to a new thread?

Cheers,
Kent.

[1] https://github.com/warthog618/libgpiod.git


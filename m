Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C504D418280
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Sep 2021 16:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbhIYOJz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Sep 2021 10:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237777AbhIYOJz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Sep 2021 10:09:55 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64ABFC061570
        for <linux-gpio@vger.kernel.org>; Sat, 25 Sep 2021 07:08:20 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id y13so12343388ybi.6
        for <linux-gpio@vger.kernel.org>; Sat, 25 Sep 2021 07:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=FELeHWRLzFEBrq4obhX73D1BquHMgJ/7I3UYNELg8LY=;
        b=cTBGcS4iuGmidZANnz4BFOwoRGovLcOvlT+f4FO6B/MWBbBkIC0TW63r5vXnh0Rwge
         4az+TBVbl7yWRvjDpyZ2qa7+a1+UVMximK4VKijI5wiwUnlKAZE7iCYsx+t9HtyMNjhh
         UtBeZk7BdJVkl19Dj8GJPLf05HUg1W3sWQBVTosvpUVz6V4DG8UNBShJAfZAnSrz9qHr
         kjyeXhtsamvPiPpLbvzzl/F9QDnWXp3+hTwTX+0sGr8GNkgCMYgOKyOx8eP9cd2IZe5c
         g6FGjXFq+8BYJHfadXoaJyaTqxKew/m8qF/Hn5oZUB3JgpC+OkmFsSndDst0eUbnDoR0
         xaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=FELeHWRLzFEBrq4obhX73D1BquHMgJ/7I3UYNELg8LY=;
        b=ymsdZ0m6mLDXZw4WAgcc4srwNvvVJd/tcKambpV9nK+KXbfSst3+POREtmuOZwEAbZ
         OjCIMGvQ638LMtj7QfwGnyPmaOSuoDsjcSOpykfCRtjm0k3jeKaWzvGd+OV32F+M6Jbq
         qWqAd32HJme3m4h8YLp42NAVXxgl0CJDZQE6CQSrMOW5yms/rizAKPy9B+izIxYFGsRi
         y6t6HtpiFb1pjRkdYF/y22h27gqnse9asAz63vRm27MWWNbmclF4g3o16PaMDspizOu2
         yDaIGBXpOe35BEQIEIJhqPF2sl7zhMLLcwTn+Vaza0mjt2F4Ds0B+UfbP3Tjy5xXlkpN
         cdQw==
X-Gm-Message-State: AOAM533sZU3S32mH032GQCVu+i7av8klY8/EIoUls8ehsz6SCgTyfFlk
        vhtN9y3wDeOvG4p2vebs+vq07vPLTLaA0TtjbXq0Zs86diI=
X-Google-Smtp-Source: ABdhPJyOph4I0bJUDFc7/az76cNcEmu9LvkVLjYU7vT7gag3DjWLAO7ZCwfmvjqpzfNIhDES0tSdgpFHjwE48fCzVds=
X-Received: by 2002:a25:fc24:: with SMTP id v36mr8237193ybd.23.1632578899518;
 Sat, 25 Sep 2021 07:08:19 -0700 (PDT)
MIME-Version: 1.0
From:   Turritopsis Dohrnii Teo En Ming <ceo.teo.en.ming@gmail.com>
Date:   Sat, 25 Sep 2021 22:08:09 +0800
Message-ID: <CAMEJMGEeAQLk9V1-ScJM8aNZtvVgdVzThxX7Uwszmzz-cXhf4g@mail.gmail.com>
Subject: Introduction: I am a Linux and open source software enthusiast
To:     linux-gpio@vger.kernel.org
Cc:     ceo@teo-en-ming-corp.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Subject: Introduction: I am a Linux and open source software enthusiast

Greetings from Singapore,

My name is Mr. Turritopsis Dohrnii Teo En Ming, 43 years old as of 25
September 2021. My country is Singapore. Presently I am an IT
Consultant with a System Integrator (SI)/computer firm in Singapore. I
am also a Linux and open source software and information technology
enthusiast.

You can read my autobiography on my redundant blogs. The title of my
autobiography is:

"Autobiography of Singaporean Targeted Individual Mr. Turritopsis
Dohrnii Teo En Ming (Very First Draft, Lots More to Add in Future)"

Links to my redundant blogs (Blogger and Wordpress) can be found in my
email signature below. These are my main blogs.

I have three other redundant blogs, namely:

https://teo-en-ming.tumblr.com/

https://teo-en-ming.medium.com/

https://teo-en-ming.livejournal.com/

Future/subsequent versions of my autobiography will be published on my
redundant blogs.

My Blog Books (in PDF format) are also available for download on my
redundant blogs.

I have also published many guides, howtos, tutorials, and information
technology articles on my redundant blogs.

Thank you very much.






-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link:
https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwave.html

********************************************************************************************

Singaporean Targeted Individual Mr. Turritopsis Dohrnii Teo En Ming's
Academic Qualifications as at 14 Feb 2019 and refugee seeking attempts
at the United Nations Refugee Agency Bangkok (21 Mar 2017), in Taiwan
(5 Aug 2019) and Australia (25 Dec 2019 to 9 Jan 2020):

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----

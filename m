Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3493DBA23
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 16:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbhG3OND (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 10:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238962AbhG3ONB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 10:13:01 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4A6C06175F
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:12:54 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id b7so13410995edu.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=essensium.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Hd2q/X7BgErZISBj09E78buxul4qCIZMXvIYYh7cfM0=;
        b=JqwuPberCHRFOiHTIIQDQ2EjHcU8GPjL41bd0AwGKMq/R9Ucva+bqpj1rNGiJ8dV49
         kXFctmVUBMNbm9BTWU08Nu+QU8XhEOZ2WRuFiJ1GcQwkz3Z00n54bTnFG1pSpvpAVUmf
         79GZfTLq9GqvshJVV1U3YtPXLUGENd4ksttH7DSZE7nN/q9NctVL59OU0GYupBjDNr3i
         okFnRGJJSW3KT25f7ffO3ffUhpDwrrudQokh5bYtNemp5bt3ITHfpOguyYq+iZD1emvq
         m6TytdpoBS4BWIW7O/PvEKbIPEUi2UetAtv1mzgMKkJIOqzzC8nhwEqBshZ3KxSo9INf
         zIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Hd2q/X7BgErZISBj09E78buxul4qCIZMXvIYYh7cfM0=;
        b=Y5lllKYjV31VGnX5e4aw7lnCM+Vfo2SPeFM7w16uQi0/5OTljLCWFqOveTkARvPXqd
         E7kh3z57B6bfY2Wxl0pHbqhyUwdGjSp4I2Fm3hoR1bEvcJN98jVhWPdWif08/DXhwXGs
         qg+9tuIWIPh3zgp9NKsj6tPvc3auRF+KdB/LnFncwXWZJ2soZZzghA/gUojhebD+PYVu
         hrvEMb3pZdZKdXDS1lqeUYORMfE1uObcDzjsjL0LLjUAB3Cm+f3C0aFq7iG7oCz2ViUJ
         nTKrG7K8rM3wyxhw4lFGtWYTF9bTUXIHQtB7vOzVqystTaOYY+S+SQJL6/a/p5Bb+tOo
         vaBg==
X-Gm-Message-State: AOAM530C/84ayG+g2KMwzuIhsIOBKQ/vJ3C3385uPVXiiH2zkkpF1bPZ
        dFOpJ77ZQkF62kn4x+P4D5UIgYPnbatR5w==
X-Google-Smtp-Source: ABdhPJxlL7xvje6SPwO4tbxx5EMbjLbCQpzvYj4PR+ByWtoucfKUNknugQU1BRFTrRD559EKhEkP4g==
X-Received: by 2002:a05:6402:4c5:: with SMTP id n5mr3172602edw.322.1627654372775;
        Fri, 30 Jul 2021 07:12:52 -0700 (PDT)
Received: from cephalopod (168.7-181-91.adsl-dyn.isp.belgacom.be. [91.181.7.168])
        by smtp.gmail.com with ESMTPSA id l17sm760165edt.52.2021.07.30.07.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:12:52 -0700 (PDT)
Date:   Fri, 30 Jul 2021 16:12:50 +0200
From:   Ben Hutchings <ben.hutchings@essensium.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH libgpiod-v2] gpiomon: Fix format specifier for uint64_t
Message-ID: <20210730141249.GA28359@cephalopod>
References: <20210728131327.GA14442@cephalopod>
 <CAMRc=Mcmvb24R9RUJk-0QgP+17rMw2Xd9jMff47uUUcOdeA-Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcmvb24R9RUJk-0QgP+17rMw2Xd9jMff47uUUcOdeA-Lw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 29, 2021 at 04:34:19PM +0200, Bartosz Golaszewski wrote:
[...] 
> Hi Ben!
> 
> This and the other patches are great, thanks!
> 
> I assume they are rebases on top of the next/libpiod-2.0 branch?

That's right.

> I
> want the git repo for libgpiod to remain bisectable and intend to
> switch to the new API in one big patch including the core API, C++ and
> Python bindings as well as test suites. I will keep your patches in my
> queue and apply them once the patch is in master - unless you don't
> care that much about authorship of the patches in which case I can
> squash them into the big patch and credit you in the commit message.
> Let me know what works best for you.

Please squash this one into the big patch (as it fixes a regression in
that) and apply the others separately.

Ben.

-- 
Ben Hutchings · Senior Embedded Software Engineer, Essensium-Mind · mind.be

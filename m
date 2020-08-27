Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3E1253D90
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 08:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgH0GQN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 02:16:13 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:45112 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgH0GQM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 02:16:12 -0400
Received: by mail-ed1-f65.google.com with SMTP id i17so2312744edx.12;
        Wed, 26 Aug 2020 23:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n8UjIpjo5z/VFQQxNyIbAkQHiV3RIjM5ogrJc60069Q=;
        b=ByoBMjcuy0JFQYuWRDtazJQ9zuHDKxsPdCLxOpFKkDBN+HlEu2YN/C9gwMBbQN04f9
         MelblW24hY/zQHQhdo9JHSJPLK/fLox39+LTQHN5eJvcZdqSGd6deWCILZNZGUClY6Wl
         o9yqvC82UWm9Dnab3RZ67qJvq403DHCNeDhvblLNHOiIbtqulOuH9Fg53jb4NShJfTUa
         gJclHYyK9koDX7q0p9Gr2MrITJiYfxOjjPaLp9w3L70KTzmITzROhyERVQKnEzSlQ2va
         UIEkV9xr5DOWJn/s9ATzLWlmWxM4ixuJ6KN9t8xYm6ummqOx2Si3ecUavjui+dOrduvL
         aLDA==
X-Gm-Message-State: AOAM531f0Ucbkp8wnMjrsCd/cvMVi8YU95hgEduL4n9RDm5pBI/raXNm
        zQEfh+ekB4ChNtx9GuZZbU8=
X-Google-Smtp-Source: ABdhPJzMuvKNJhfk3j9zPW5FdAcSTX8KIa1mUvwjYRaBZ5J6FGXeek24fGjG21uQMyldjHc10mj4hA==
X-Received: by 2002:a50:fe0a:: with SMTP id f10mr17779083edt.264.1598508970208;
        Wed, 26 Aug 2020 23:16:10 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id bn14sm1059427ejb.115.2020.08.26.23.16.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 23:16:09 -0700 (PDT)
Date:   Thu, 27 Aug 2020 08:16:07 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] gpio: Add devm_fwnode_gpiod_get_optional() helpers
Message-ID: <20200827061607.GA3355@kozik-lap>
References: <20200826200827.30931-1-krzk@kernel.org>
 <CAHp75VfSE_9D4UBwJLt2b_JyBLiN_giOd8mWpodbMAVJ8wj=cA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHp75VfSE_9D4UBwJLt2b_JyBLiN_giOd8mWpodbMAVJ8wj=cA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 27, 2020 at 12:04:13AM +0300, Andy Shevchenko wrote:
> On Wednesday, August 26, 2020, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > Add devm_fwnode_gpiod_get_optional() and
> > devm_fwnode_gpiod_get_index_optional() helpers, similar to regular
> > devm_gpiod optional versions.  Drivers getting GPIOs from a firmware
> > node might use it to remove some boilerplate code.
> >
> 
> 
> Shouldn't it return NULL for !GPIO case?

Indeed, good point.

Best regards,
Krzysztof

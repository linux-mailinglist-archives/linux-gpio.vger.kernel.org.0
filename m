Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C363F12013C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 10:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbfLPJe1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 04:34:27 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36093 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfLPJe0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 04:34:26 -0500
Received: by mail-wr1-f65.google.com with SMTP id z3so6362333wru.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 01:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7vFOt50jlhyZbRsYMYSz4Z6GCgTExlaWZyfU3Glz+So=;
        b=bDM/6XIkPv5PxwiwTqOhiNyzpjTldKIGKH8VKZO2OqvS/WCkFx7MOpSqRq9ItaUG0g
         z08xhSbmrNS7AnoCZfK0DUQblt0VFwZXgyZVt1Jrkz2AvwGh5KM2qEIkNMNSL3Bp0qW/
         YIIwDAmVSb2CTlXuWjXii7oIHDgAhqoM7JoY8iSt4mroB9t5VtruY9r4IaNPiAR1VxdN
         YvUmeYfO7HmjYpZd7yj8/cSnK2RBR71I5F7CRwVR9xnvPuyJEOztW2WIh7SLcvrgxA4G
         9G8AjEg/3rh8D1CW0zPhY1fXWkL0WKY0rHsVngDcgo6TqNmE79aO8a8VrDtXEn+JyhKR
         4FPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7vFOt50jlhyZbRsYMYSz4Z6GCgTExlaWZyfU3Glz+So=;
        b=fjENFpAGxmqGUoHCeyu/t6mSKq74eq91tW4v1oU1GdgbVNaFEX/lB0JaDlhs8gvOcN
         xAXk2PgGtaFUbx73a+ApDD/mGI1HotljSgJZJ1zpy6LEywE9Qpc7QDZgTa7uLZ6/uGOh
         a1x/mWjmXMje0duwfPxlG7sRpKAXZSARNb22a1PexqxXcIItqe9BJbUUiozUcqkIuTPI
         fOTKMQKm1iY0xeVY4NhWZJQUlLY041iDGeXkDKLCBoMJn9rgVlscB/h74g3IbAI0DPch
         n5jGOP+O9eSRH3nHTYWoc3WvNrt+ytG7jFkF8eny7fvGss+CGMEJZkOYpcVVLI0YFk09
         oTYg==
X-Gm-Message-State: APjAAAV/kmT/faA5SKgKuoqS3K9hZ2tbFFuXO3uWs4gvQhz3cGqx9Nsm
        rZxzH58gNVa3ntziJ/tdSbh14Q==
X-Google-Smtp-Source: APXvYqy/pPc3BUnTy0+oGQbvoIM9n7NycwkXVCIgvta58sSKGNZW//kXhz1iB8YkSyfPPkrVGmKHLA==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr28665276wrt.229.1576488864519;
        Mon, 16 Dec 2019 01:34:24 -0800 (PST)
Received: from dell ([2.27.35.132])
        by smtp.gmail.com with ESMTPSA id h8sm22121422wrx.63.2019.12.16.01.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 01:34:23 -0800 (PST)
Date:   Mon, 16 Dec 2019 09:34:17 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: mfd: Document the Xylon LogiCVC
 multi-function device
Message-ID: <20191216093417.GA25228@dell>
References: <20191203141243.251058-1-paul.kocialkowski@bootlin.com>
 <20191203141243.251058-3-paul.kocialkowski@bootlin.com>
 <CACRpkda-hDbC4bVihPO8RUogkFkPfsxVS13d_JJoFZLaPLQYcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkda-hDbC4bVihPO8RUogkFkPfsxVS13d_JJoFZLaPLQYcg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 13 Dec 2019, Linus Walleij wrote:

> On Tue, Dec 3, 2019 at 3:13 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> 
> > The LogiCVC is a display engine which also exposes GPIO functionality.
> > For this reason, it is described as a multi-function device that is expected
> > to provide register access to its children nodes for gpio and display.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Patch applied to the GPIO tree unless Lee has objections.

Seeing as it's you ...

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4C681761
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbfHEKtF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:49:05 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44606 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbfHEKtF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:49:05 -0400
Received: by mail-lj1-f193.google.com with SMTP id k18so78862643ljc.11
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 03:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zyWsXMkk6iYIEgII1oOJY8ugYk5vzPXYCtQlb3UFPac=;
        b=p8YZD2U4JcoxOrifQes9j3JCaAfhm7o6USZZn0949Khu+OleChnYcRfI+39orr96Sv
         pDMdXHaz6fS1XUsCCKp0w4RcDrzKXKl6EOZwrYgE5dQHWk9iigtwULLPoyoG2BMVu9vG
         kvAuL51lL2OoTsLuVwBsGWfCtRbYG7VIc8NDjruo6AMYEtoZd+znBsmmHY2Ll8FcaqUQ
         0OPryf7N8p0erCSYcfVN7ycuF+vhWFALeWbYx0ZZ70eUMFPI/W44qRIj3MyVuOLOpH79
         r0lMZp7KsHkL2CF8P/dByC4r4M0tGxCRfH6gRf5mLdID+8voRToNX5qas9UKKdse0DK8
         vVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zyWsXMkk6iYIEgII1oOJY8ugYk5vzPXYCtQlb3UFPac=;
        b=luvD5mi7Qwm0lUIcd1NNo8Ma+tcdbip0II1w1RbUaF9izDGscPF8FudKKlVUIjsFVS
         DzNJ1JEpKgq+8+fGdGeUPDFt2Dn5tER5aYy1MkkWF6W2FTGS46Jnyg4Z6Cgww+KrgbJc
         127eGTGkGS8PWXkGMebk/a5gdX5+ZokPK0yJYF3y+LdiZBum6Arpp3Lhe//robUYjRH/
         SRhIQTWVyvi+qE83irm6KPCQOD3Edab3rCiEF+VNAD4wJKI2XuNw7UIIJH/UpHKqVwTz
         e+jrGxoZ8+hDqSmVFeFDZm/tAvxWh7dhcunEyiQHTz7NjJmcS8yZudUqGnS+yQXsjpMu
         Uq7A==
X-Gm-Message-State: APjAAAWeRoI4+RqwcZKwG8n6DQ9RY6Ar8vGVxgEhRvEEdQOjqRn5xruC
        c1+boJR/byAgGICI2HxOTvR9/C4UhfDu795OeZQIjw==
X-Google-Smtp-Source: APXvYqwv1epfSf4ijzEUccvR56Qz9qbH+rnx/bhn0Kh+aaPW/inmXM+/zCQxf4A9MHgYUbFT258fn6fea66xtBqoGC4=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr29589680ljc.28.1565002143043;
 Mon, 05 Aug 2019 03:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190724081313.12934-1-andrew@aj.id.au> <20190724081313.12934-4-andrew@aj.id.au>
In-Reply-To: <20190724081313.12934-4-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:48:51 +0200
Message-ID: <CACRpkdZCJWeZO6CFvkq4uhnX+o_q_AfkDZ=a2kmUgbS3JtDqfA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: aspeed: Remove mention of deprecated compatibles
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Guide readers away from using the aspeed,g[45].* compatible patterns.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij

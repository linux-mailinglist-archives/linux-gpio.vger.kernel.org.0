Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 691A079B96
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 23:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbfG2VzP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 17:55:15 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37984 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbfG2VzP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 17:55:15 -0400
Received: by mail-lj1-f194.google.com with SMTP id r9so60060162ljg.5
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2019 14:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WBZi/FWYMVw+6x0q1L6ySXMBwWz8l9YOs94KLfDt+sM=;
        b=maX1fJR459j9bTT/i/FcZluuRJjdtq45t9ua4H0lkFp2Fvu8AvbQWRaoneF4GAendq
         GGsgRy5RasAfnEje6j1sDASgB3suDqgvaKXKvOHPqG35uRffPpCagqEr3tFVfyYOXOF/
         Kq3UZF03LBdNOdM8qNvFlAdI6otpsInC+84EUBzJi34EM8FcQdk5cKkl0wWCEC/XSUOe
         e+BX2jzySgUEhjUc3lit2/Pj/8p/dS0y8IVUKLwkWDr43YNOFDjh325Fr5uHGOso3mkn
         ZkihBU8oefvkAd2bgl6jK3GLZUvmL29WrT+9t6rAvC44wC+Id4+sg/x0ZNGWL0qPpgY/
         +VpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WBZi/FWYMVw+6x0q1L6ySXMBwWz8l9YOs94KLfDt+sM=;
        b=A80o9QNAj20g4xXzVwdP2Ppf5VsqLFjFixLbI+ne+kxn2fhCYm1Q8gEaGbeolmN9lv
         qC/8oA1630z4vEN2WS4kIw57FOwKWohwcblQFpev684NT6EAZqKxiLwMIyTwJXR8gA3H
         HOyZ/g5+AmSsx1W7R72Qne0IuljokMNBr3CnwEcdu/mewOcvwyadBheiQqpFdOYZKvc2
         7QFsQ+AO4hJktWvmh2KKMlufRQhLcui52UUZpCSwtUmPIK4iMIltFlE9vax8TmZrduSh
         DAAUIagiBbqSgrGaIPV+uzNKfLjt0avm/pPpGpDlGtSo/kTIgTLhq8HsZo7vx6mVuEiX
         5GKQ==
X-Gm-Message-State: APjAAAXi1Euf5JxWTsOBxFNaVGvEI/6U7JUicI8DPIJvUr16ylLS6Rck
        ZdJ+sdcQwu2bkyQwzuZ1VFn5vzQckw64VYcABhGOPA==
X-Google-Smtp-Source: APXvYqz8xsOtkV0Tm7m5AoyjAnnPZwbpq0fVDCw0AcnBfOy1aP/HBlFsrVX+y2EqHLqO/PlpIPBTliVBh7mh/LILCMU=
X-Received: by 2002:a2e:9593:: with SMTP id w19mr12076182ljh.69.1564437313862;
 Mon, 29 Jul 2019 14:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190726053959.2003-1-andrew@aj.id.au>
In-Reply-To: <20190726053959.2003-1-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 23:55:02 +0200
Message-ID: <CACRpkdZVVgqdt=+YYEauChoxjqKk6=LNKzj-40u3CFLxJr0D7Q@mail.gmail.com>
Subject: Re: [RFC-ish PATCH 00/17] Clean up ASPEED devicetree warnings
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        anoo@us.ibm.com, a.filippov@yadro.com,
        Arnd Bergmann <arnd@arndb.de>, yang.brianc.w@inventec.com,
        Corey Minyard <minyard@acm.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        haiyue.wang@linux.intel.com, wangzqbj@inspur.com,
        chen.kenyy@inventec.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        Patrick Venture <venture@google.com>, sschaeck@cisco.com,
        Tao Ren <taoren@fb.com>, xow@google.com, yao.yuan@linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 26, 2019 at 7:40 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> The aim of this series is to minimise/eliminate all the warnings from the
> ASPEED devicetrees. It mostly achieves its goal, as outlined below.

I suppose it will all be merged in  the Aspeed tree?
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

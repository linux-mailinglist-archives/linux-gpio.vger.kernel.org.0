Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F35121053B1
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 14:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfKUN5j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 08:57:39 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40239 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbfKUN5j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 08:57:39 -0500
Received: by mail-lj1-f196.google.com with SMTP id q2so3329751ljg.7
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 05:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UBkuzZ+MqkiLgmfgsJRsaxsDTTpe+Bg4KuEU2F+6Ets=;
        b=FtLiJJ6y7cpkvpskM6TMud11cUSvxGjG20/pt+ALZzcLEIn6H4+L48BVPWzIgkh04O
         9vcXzsRPn2t8TRkI4PwyIIgPY6w3luRJG5ShpSKPw+ERAqEiSOyQx2l4vKHosvbzfCOY
         Mhn/8mZyM4B/YT20AlFTi1j9In5V3X2oILE87hcQMP0nYF9xGptevT0IUFzKI/qsiiiW
         WYlkWFlUmemEAhZqGVyCShM06So04u6S49Z0G9oLBHRqkLeJUZNOaIcKmvalCi4RlIT3
         XYk0buh9M2DMPY5IQA/oyXpXpFLf4MRpf25B6HGp9Q2gMzt6HB9c2x3FrWjWqRKnD460
         rUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UBkuzZ+MqkiLgmfgsJRsaxsDTTpe+Bg4KuEU2F+6Ets=;
        b=kcrbfS5pyDbtOe/0q6kS6aCCOG2TS1Zs/lZM/rNU8HtzlGKpSjUNkPscYpZXVb0GVz
         ov8QivNHkKBjEdw7/OgBVgO6lWRSFuBNwnfq29PpxPaBDfQ6uQxhRyovL18T6i0uUa9W
         KiwNXy3bRrKfgE+V+OCU/ZGaM+Avsa/eH6UCBmATKdhGn5DOw6lYrTor1oEJlQr3Mt/S
         CYcGzcfisI1qWL7lNPIMuc8NDIHferBzvAAoXeVCVLMFsDfAir2YynYBgQFKkVUWVDGS
         od4YnhQiib6nA7iUnCoTI1X51GAQ45fy5miQGs9YBJpCYzB37bjovESFhq5x/LDUg1RI
         p3nQ==
X-Gm-Message-State: APjAAAWw8do4o2pFK4cdGByzdwftQ/Tpqv+73Kiq8Zc2idFow6v9NJX1
        6RWwYdTf81DZz3MVbaVADBvOOvQ6sb/27mNFtoR1TQ==
X-Google-Smtp-Source: APXvYqwnvPg2N2Ty+DsPBBCodqHux7v3zSXK7v0G5zoMlkCdQgLfstOZ+08IFh9+gMcwdWz1rLwxHWl+g4OXeI+wLZo=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr7575384lji.191.1574344656527;
 Thu, 21 Nov 2019 05:57:36 -0800 (PST)
MIME-Version: 1.0
References: <20191118134926.37337-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191118134926.37337-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 14:57:24 +0100
Message-ID: <CACRpkdZyFuk6q2uTtSmMk7u061eap=qitnfrFGMTPgJKVoyN-g@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: Replace my email by one @kernel.org
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 2:49 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> For the repositories we keep on git.kernel.org replace my email
> to be on the same domain for sake of consistency.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij

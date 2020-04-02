Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E26D519CAEC
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 22:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgDBUSo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 16:18:44 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:46024 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgDBUSo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 16:18:44 -0400
Received: by mail-vk1-f194.google.com with SMTP id b187so1349473vkh.12
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2020 13:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v5s4w4J1mIHS0EwKYTQkhpSR7LSeH2OOME7m6g+qqnw=;
        b=Ue4pkL3IGxAAk6x7ln1ivONyHcfbgvuh1B5f1SnOsfOBp2icW93fJdWXYg91QsFOir
         Yl2wVonAeSxSNaams+9aVWjf99MmimBFViS6GLtztk1YgZgDQm6YoV5fVt+Vd3NT72aw
         b+vwR/N0ulTq2Fq0gZLb8+YRjvCcMfilTq7NRV/8n1JpmicPChYHT/wH3A06fzmWeGhh
         6ZUYcdGg0ObumnokornXCYTfYPJ97R2T/ZY+eGqbR16TeiC3w1cEZ3YCNz5gQQECxMYY
         +NPxauL6f7CF2MqdH8SmZgtbj0rbBx9Nnmdvc1MDqpSzWHNgAmczCtgwz8B6rKuwNV4w
         rxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v5s4w4J1mIHS0EwKYTQkhpSR7LSeH2OOME7m6g+qqnw=;
        b=SV/n5OiCJU0eiuGOQkdq/k1GpPTWlrJlCmiS3PfXg+eYdA6eOcYbaRzjuybUFMchV7
         Br4NHaT5LQxBcyCk98ZHHF/KJjsBx97dUx1fS5GEWc1rI1ng0tCqSR5spq1ufWtb+sKT
         vNa4LK46nZZTFNzAHWh1qRPP5Ahq4Ls+NGZsBf59c7bPBocIxIgitXNUCE3HjhI8iP36
         FoNSiSZzzJtwJMwATI8QvoLIptfheJXjNil7GBz23JlisxN1KJx02Si4qRwj2uEwWwd+
         wzQspgxJjrPXQBWrrqB9c8FOxDDfrYc4quCc+2sOH8bRWOXZhPj55jsvUof5+NePE+ae
         PSDQ==
X-Gm-Message-State: AGi0PubUiQs/riiVWBtAxI6Ijodk8miRuIvo0PTsBkT4a8fImPdhI8yb
        fvJUXEzObSjFGup+9SOpFruC/uhF/Q7gFhwBif8=
X-Google-Smtp-Source: APiQypKX5r0ICmXxIU/CieugwURTQ4CVkItKoJwrHvdL50qbGJSY8fkgsEjb/vOpDVoOPfVdzWjNiCfuHh0cJzAwJJo=
X-Received: by 2002:a1f:2b09:: with SMTP id r9mr3781843vkr.24.1585858722381;
 Thu, 02 Apr 2020 13:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200402192145.17239-1-andriy.shevchenko@linux.intel.com>
 <CAP+cEOO-G=4_txK3dtOxOoRS51GWBzEwa5FfpRzYxDKHo=MdiA@mail.gmail.com> <20200402200955.GD1922688@smile.fi.intel.com>
In-Reply-To: <20200402200955.GD1922688@smile.fi.intel.com>
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
Date:   Fri, 3 Apr 2020 01:47:52 +0530
Message-ID: <CAP+cEONqu_4ebwcE1VmrR8yfYzX-vp-rdZC8m_h8NBnugzG_eQ@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: Extend TODO to cover code duplication avoidance
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> I guess this answers the question in the previous thread.
> To be clear, scrap your patch and don't touch just gpio-ml-ioh alone.
> Basically it should be one patch to get rid the driver.
Sure! Will work on it.

-- Vaibhav Gupta
>
> JFYI, I will send couple of clean ups against gpio-pch.

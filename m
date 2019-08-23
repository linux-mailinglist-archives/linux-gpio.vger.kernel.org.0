Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1FF29AAF4
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 11:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732043AbfHWJCJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 05:02:09 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38485 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfHWJCJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 05:02:09 -0400
Received: by mail-lf1-f68.google.com with SMTP id f21so1634320lfc.5
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 02:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0QyxxyRluECjdJkoLMYC9fmu4/5/v8zNJ/ufvcfQSPQ=;
        b=N7h77oRWy1NES6UfXGLBy3+XgXDQfO9qbseQVAx7sYunjgOJVDezGdzBbBEZPDYbWs
         zdzwI+m8PrJ6XBzhs+0Ekab55i30Pzo1aOIJXZIRFTGYEmFJn5DjocBNqR2yP+BI6zDr
         UAC+vml6qtduEWXpluIDMfVVJMa3k6qPdGZXAz+P6UiD0SRX0xyH59MhxrKAfsyAcS6L
         zsC0wrwY83haDmjM4/xlhvqSWSUgWW8cKIV/WSuE97PIaLNy4wSh+bUcCnSfQOLecmKM
         efVpPfVry4LguDt5SN1lChKwVrYRajjxqDWo4dHcEfHK+nmBqBHS095kqUs3iQTwlQrA
         A+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0QyxxyRluECjdJkoLMYC9fmu4/5/v8zNJ/ufvcfQSPQ=;
        b=dsssG7W+oxknqCcCmaZvDn//KrgEhNqAcvpMJKpIvE7qKvOaxQVgWdY3xhXdzEkeu+
         DEF05CGtCR8S+H7eTNltT7wEANZPWs+12ETQAG8sEpo9UsqQVUXATBoHtWOm3QM64bLn
         o4zgR96G1opeG9Nl7eleYi4U9lke+WjRCzyVdDegDRfsg/LS4UaE40UBniR4ms6WEftI
         1Hqd7f3s82Z47CfDRoIUq1ltcD35BbEEvc66yTTT6uXvaPHeE9jlHaOS9H9quF79Fhn+
         lkTIcV+Oe4wc/dlAhAraiaazgS+MOtfLNEHfVS2ehFAJPbLH4xfZHawEhHhy8Pp50DXv
         r2Gg==
X-Gm-Message-State: APjAAAXOGII3Jqw/a4+2gMiuZ8+oShFYu23VZyByVBzhdfkXBN5qYc0S
        AvKPGTUr9PEj47ZlupjAKHxVUAWGjI5M7eGa0GVqFG018ss=
X-Google-Smtp-Source: APXvYqyjQKopZCrPLomiHMDFj6TSJhVXJMVerAdTPrlxpQ37K5/d0izNNRhU1ncoS8elL1MPDL1F8PWM2sqeBfHF8YI=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr2195029lfp.61.1566550927617;
 Fri, 23 Aug 2019 02:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190820080527.11796-1-linus.walleij@linaro.org> <5D5FA478.6090707@hisilicon.com>
In-Reply-To: <5D5FA478.6090707@hisilicon.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 11:01:56 +0200
Message-ID: <CACRpkdYKN23csn+DekZdNRN1HN8weX8SiU5W6XofvqzdAERTAQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: Fix irqchip initialization order
To:     Wei Xu <xuwei5@hisilicon.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 23, 2019 at 10:31 AM Wei Xu <xuwei5@hisilicon.com> wrote:

> Yes, this fixes the problem and tested based on gpio/devel branch.
> So,
>
> Tested-by: Wei Xu <xuwei5@hisilicon.com>

Awesome! Thanks a lot Wei!
I'll get this to Torvalds tree ASAP.

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56C0E3983A
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 00:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729996AbfFGWIU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 18:08:20 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44133 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728636AbfFGWIU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 18:08:20 -0400
Received: by mail-lj1-f196.google.com with SMTP id k18so2987673ljc.11
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 15:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yHlZ/09HVQo+stV3OrPMedEmO1HgLZq5U7B9/c6/p7Y=;
        b=QrGIZKbx5k7Xqdv8z/yDPKaoDJuxRaggORVS9azbjG280GDunTQtibk90YWn/nobhR
         wiD+GkdtLQmOI3rndTluSkSSzvyxl0QYWwTNX/kjxbjMzi08Of0f5IrjSjj71JN/63Cz
         N5J4b5LskZkGWp5+qJ4eV/dmhkOEssyIvvHvNFJmi8JVuZxuMELvRlejSE35OkQeVZtj
         lMYPOdya2Q8etIbvyQX6M8Ab84uY9UKBtWdIYJ5LvaNmwpJn2svZpvCPpMPQmss/z6Oq
         PKWfQhNWjleRXUuugMH14Gm6sK4aSig5EcoJLhtJ2bVhRzZIUrKCFWP3NnlAgDhybrif
         5cDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yHlZ/09HVQo+stV3OrPMedEmO1HgLZq5U7B9/c6/p7Y=;
        b=COrRcbSZErbhcdSKPieo0y+TKrRuRfju8u7wSIu3QLgd769BfQm8i3n1cPX+SzmALr
         XeklsrzmsksTd9K5Bl274kfXhCYRkSqpvpprfvBNryOV7bqZJRdfDUffB7SueppAgiDd
         Jmnus3PFgT3AIqFg5JVcfXAFxUGJX5N+ISr5pSw6m+0in6lFsl9OyWqVXZHx33mN3xQV
         Re0vgaF+9mU38BRcHHEVrAjObpLWpVwsG1BnD6AVOAvCtrtmiJG7tzYziS1SuKSSWRO+
         7kgzghsre0mngnwrfHB/ymNk6RDEDYeAgcq5jX9Bi4UZ+Ju5kelIX71D+QgqqtB8e+/+
         GFHA==
X-Gm-Message-State: APjAAAWKGq/N1JTtJTaKcOBGTj4ifH3H0M8mv4QIEKaBxQai5nwfP5ZJ
        +AgUkwf4gSNxIFhM5TyKikV/ObzkYOVtIT4FKzStVw==
X-Google-Smtp-Source: APXvYqxXuBhhgn7MmZAfsZykWUQKNY/KzC0S0yVRQlT2pFkpO2Tn+jLM+faONvbgsZcuBOlTxFOjmjWE8oPicI3r45M=
X-Received: by 2002:a2e:8902:: with SMTP id d2mr29274449lji.94.1559945298255;
 Fri, 07 Jun 2019 15:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559656538.git.mchehab+samsung@kernel.org> <ee8f4f56658247a0ab0d9e2c16a9afafefe38da0.1559656538.git.mchehab+samsung@kernel.org>
In-Reply-To: <ee8f4f56658247a0ab0d9e2c16a9afafefe38da0.1559656538.git.mchehab+samsung@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 00:08:10 +0200
Message-ID: <CACRpkdayQdrtqO3aygY1uDG0LCX_9rVnSnxP5F_C-KMZURTAYA@mail.gmail.com>
Subject: Re: [PATCH v2 12/22] docs: gpio: driver.rst: fix a bad tag
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 4, 2019 at 4:18 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:

> With ReST, [foo]_ means a reference to foo, causing this warning:
>
>     Documentation/driver-api/gpio/driver.rst:419: WARNING: Unknown target name: "devm".
>
> Fix it by using a literal for the name.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Looks identical to the v1 I already applied, so keeping
that one.

Yours,
Linus Walleij

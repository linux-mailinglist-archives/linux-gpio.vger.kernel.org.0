Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 997A81404E3
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 09:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729125AbgAQIK4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 03:10:56 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35599 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbgAQIK4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 03:10:56 -0500
Received: by mail-lj1-f196.google.com with SMTP id j1so25491602lja.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2020 00:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LMsfgUkc6PVsQOgoRjeUmCb50iWGUvoWtCwIxT5NGlQ=;
        b=Y0jWNZHSa9h+4Zjpi+PMZCctM9cn6agwGuqUjdII1rq1UJNHz1tH7ksSJlQaSb9TN8
         RTvZhvX927RhSW2EmBBi43b75nrxnc8C1G/yQkXSmN67uFpmt4lgINvuqerywEpoLdUL
         BhBwOYAoeyjxH98mJb5k3OhBjZ68WhvF2f1VLqviY90oFkR++uVE/ic1acCnsAqmoXjC
         REqXkPWBPKMJTsY4tMW6h5Q5vZp7IfGJgs8b7M5qihMB5rRplX00OHifvMInT2+Nx6re
         cvmjhiQ0OGqlOSaDfkdihWHYwuWx3aMy+rDgDVElCDbX6pAPKYn0SeP0cvZ2ipmg5R5U
         /lKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LMsfgUkc6PVsQOgoRjeUmCb50iWGUvoWtCwIxT5NGlQ=;
        b=RWBxVvvFMod93Sl//N9LCY0vpPC4dG5AKx1kCig7KUV1Wz7ZJ1/hyQOrwQn2puZGqp
         vJyDq2lsdDrz4jywiMSK6yxyr6GzGloJPALYZ5BTnLhhqp1FGq5K8Y9+vsYsC9OyAVaf
         7Ryc+u3PF1JyMEIfrUIKt/fv7fQn7fFMAJY5G1z40txdOgRjlCZFplOr2N6Xaem/LDsl
         Wh46YXMVGQP6CfTrhI/e3bXHtQlpLjB7sDHh986U3hQAyPsDYaVJxnY+H3lMimjcP/vs
         +ZHngfTO8+L7y4lcyau4qYx9+nf/8Qw5mfA0sfDWLbcUs59gU7ymAj+QC1Rwp0gDYyj9
         i3og==
X-Gm-Message-State: APjAAAW3qy/n3Tl1J6GL1g1C6WLSlvwaASv392hikCrUFEPz5lnHWu/x
        WSH8x7CEggXGyvDg+izMzS0C8sMNyHkg4H1JteUhSA==
X-Google-Smtp-Source: APXvYqzwnqeFtJxSfAETKmqEeOWH/IpOxPlLRDmDfOU0o960I1AZRINOPpG5ADp5GWB27hd/8zy1oVktEsgNHkykr/E=
X-Received: by 2002:a2e:9143:: with SMTP id q3mr4812600ljg.199.1579248654365;
 Fri, 17 Jan 2020 00:10:54 -0800 (PST)
MIME-Version: 1.0
References: <20200116110951.31644-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200116110951.31644-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jan 2020 09:10:43 +0100
Message-ID: <CACRpkdYVDggtFhfmNfk4soU--s9Dg=gPmUtEpxKCpKLdRcNJFw@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: sunrisepoint: Add Coffee Lake-S ACPI ID
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 16, 2020 at 12:09 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> From: Mika Westerberg <mika.westerberg@linux.intel.com>
>
> Intel Coffee Lake-S PCH has the same GPIO hardware than Sunrisepoint-H
> PCH but the ACPI ID is different. Add this new ACPI ID to the list of
> supported devices.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Just because I understand it:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Expecting a pull request for some v5.6 material soon!

Yours,
Linus Walleij

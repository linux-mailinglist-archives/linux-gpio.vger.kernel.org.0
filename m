Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E88BD19C8D5
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 20:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387866AbgDBSd7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 14:33:59 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33618 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729033AbgDBSd7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 14:33:59 -0400
Received: by mail-pl1-f193.google.com with SMTP id ay1so1674857plb.0;
        Thu, 02 Apr 2020 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oyphBXh8PTHTDQxehHVJCwGunWLiChskEfIoqWTwvaQ=;
        b=ZXpM5y7GAP9A42RTYplBVCjCe33qIGw2JT0x/NKRNTBtE+7b4Zlc023CFcBP3pjKNa
         5ATyJcpTADz2kMNWYlFbVAtc31nQAsn+WWG0wgfD/Uj7flG85i6+ymRQekR+7w1dd6fi
         537SiNd9M08XnpAyffnAJRqlOOqFllOg1FJ3jVtlPDPk5GWAFw4WWwUPjshtzDAzb77I
         UmxhRCvEvD77fpsXDyxewGth0S/yQRxM99HLjyHYdFJjeY3p6yjYTvoYcRFIYo5+R+/E
         Vy999SfA/2YFblHW++SjU9ov1U6BiFcqBm2okAdZYbFBcudcWu1POyaVWI5RYiDa52F5
         w8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oyphBXh8PTHTDQxehHVJCwGunWLiChskEfIoqWTwvaQ=;
        b=IXx8+BCZXIWD/n+89m+mV5O6wH+FOUKyyMGXNo65rdA8soVubdqD+cDWJNR1a9q/bo
         6Ei3XlHzlbwv3iwgsUqA2PpKgyDG2KF6NXnyCuS13n9DpFyqV7Luh21rS6JyboavcVgC
         kjMLsyxTx2aOzHMQZIf6Fk6N/YXgEDmn04GiTx1mvvh8iJ+QvkktDdv8g+mS3vx7KCNm
         2AydiWEyrmnxknxyMSdZVMAGPxStEM3EcbZ6CBRU1DRK3bU4WVAu8jJNzx/Iak8fp/wr
         pXsyxZX4MiSOPyBPKs5IftMrZtYC7Rr8ZRFqG/ww1PK0nfaiiuJjci6h6OrWjCqOOk6A
         hdXg==
X-Gm-Message-State: AGi0PuYlqlsEP1qm005oKlOf3s9OXx+QXQbxygUnqaaBLiZUGZ36a+6H
        /g2eA+8Fsi/5w+i/FiAoYkNnKhBrSW2cB+4rrGY=
X-Google-Smtp-Source: APiQypIQUVU5fnxrgi96uTIAhx/kCF3JFOUaqIyWwDoKfIBqblI9dhgdXZIrLJOc0SXKh3FzBsKxXnzzpq8ug3Cxzlw=
X-Received: by 2002:a17:90a:8403:: with SMTP id j3mr5361787pjn.8.1585852437627;
 Thu, 02 Apr 2020 11:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200402155057.30667-1-vaibhavgupta40@gmail.com>
In-Reply-To: <20200402155057.30667-1-vaibhavgupta40@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 2 Apr 2020 21:33:46 +0300
Message-ID: <CAHp75VcYSaAYx5qy7S0ppb77afgz=Ma=7=opfgSMCBnnjmoWfw@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] gpio: ml: ioh: Convert to dev_pm_ops
To:     Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>, bjorn@helgaas.com,
        andy@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 2, 2020 at 6:52 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
>
> Convert the legacy callback .suspend() and .resume()
> to the generic ones.
>

Thank you for the patch.

Rather then doing this I think  the best approach is to unify gpio-pch
and gpio-ml-ioh together.
Under umbrella of the task, the clean ups like above are highly appreciated.

-- 
With Best Regards,
Andy Shevchenko

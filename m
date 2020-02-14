Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1560F15D551
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 11:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729196AbgBNKQv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 05:16:51 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36592 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729070AbgBNKQv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2020 05:16:51 -0500
Received: by mail-lf1-f65.google.com with SMTP id f24so6401414lfh.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2020 02:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vmPFCYNd1b2Z269i3yTjn10KuJ/1yAN0FqONO4h3pYM=;
        b=C7y7H4jylEuEqMnGjgmT+H0M+h+femEJMIBzMgfB7vWd7xinxGtIWg5hjzVf97k5By
         81ichhlUxUcuE+gpzED+ObhW/gJUHJCXo9IIp0boG22bOraAX3BiBoHIYn9P8GpiYb8Y
         QRQCmU1ymbZCh4V933PSIeteImHsjiS8L3DcSHjmaCO869J2GUR2ocJ3uJW3Vy0CZvjo
         /SYd2V8GNZmLcti0/RWd8v9JbipZczwBq2DRNBnUskpwoxjESHOuZtbINP1ZI+8y/1XW
         kLzA7hV1HtTwhzhSMGIt+CelSr4UakLg/+G+0mSoxzCNAUYw2DrXYG8T4gXZjRjCKV+S
         m9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vmPFCYNd1b2Z269i3yTjn10KuJ/1yAN0FqONO4h3pYM=;
        b=spJNGvvCwaUNpK0ivLF6K0pWKDjmBH7fXvu24sGqflhbUMpb+5K12j9JlYyU5TvVxe
         Y1Fu7c+s674Tsn4e1Q98euZgM8o5Dw9si+mTRKHPT09YBn63Wn9cSXs2bC/dYNBP9jfX
         4hylTMACNCjnAkZMAhEZRZ2qzGO9dghx3q5ygyxe+tRKOmG0MKf/fssPkkbKXpU6XrtR
         BAtkYuZRqQf4ZUZ44X3wJDLye7Fy5C0ax9ifbiEFPrjdQIjuJ60ggxaonAYKRR0yArKT
         UVBL5hVEarFfVxJBSnfTvhDMTwhbAM6jV7+1qOzbcLCsg4Gi+9xfwxnsGBUommJkJzy6
         93HA==
X-Gm-Message-State: APjAAAVbSo6aMUksUa0iHxvEGvkzh8AEj+O9Kcp0L++INsuAvA4iIedO
        fcgqdZryD9cDVSsgU9pvJBED1eNK/BfvjJqGzuP3jw==
X-Google-Smtp-Source: APXvYqy3A2UvE/PunEwc9b95paj1uRKlANgXjihOMn+iQGFlsaa0yHC/L21T4dFZZ7k9amkC+MY+YUVX95o0/o8skaU=
X-Received: by 2002:a19:dc14:: with SMTP id t20mr1309882lfg.47.1581675408867;
 Fri, 14 Feb 2020 02:16:48 -0800 (PST)
MIME-Version: 1.0
References: <1579439601-14810-1-git-send-email-sricharan@codeaurora.org> <1579439601-14810-2-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1579439601-14810-2-git-send-email-sricharan@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Feb 2020 11:16:37 +0100
Message-ID: <CACRpkda8XLZxqH9CROHUYpaq8z+z2zsdg8pyzqQ9DfavGMy6QQ@mail.gmail.com>
Subject: Re: [PATCH V6 1/5] dt-bindings: pinctrl: qcom: Add ipq6018 pinctrl bindings
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, sivaprak@codeaurora.org,
        Rajkumar Ayyasamy <arajkuma@codeaurora.org>,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 19, 2020 at 2:13 PM Sricharan R <sricharan@codeaurora.org> wrote:

> Add device tree binding Documentation details for ipq6018
> pinctrl driver.
>
> Co-developed-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
> [V6]

Patch applied  for v5.7 with Rob's Review tag.

Yours,
Linus Walleij

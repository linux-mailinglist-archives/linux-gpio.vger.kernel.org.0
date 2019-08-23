Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 005209A96D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 09:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388139AbfHWH64 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 03:58:56 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39794 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387722AbfHWH6z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 03:58:55 -0400
Received: by mail-lj1-f196.google.com with SMTP id x4so8009780ljj.6
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 00:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bd8XoLtOAWU+7BwGbBI3SJRXpJvzJRqxBSiZxXkbwbQ=;
        b=cY06XukrB8tjEf9UAwvxbqEkYGIf7YplCL05socdcolxb5FMUe0XrJy1kJFlbZgKRA
         xqBy2i1DYn8CGjEMlIEPBNN/0LLpxzRsS2ynK+EiNpRJVxQP4RSyFdYzu9UbU736NJ5I
         aWADQq7MJJe75skDBRAyGxZ2l5IJ8IbOlJcYqHMxtxxVqAhcy13Kol6ZJ7sVkFqbj/pa
         bHauROnenvzsFCd3LzDoWGTcTldnMrZDcKXLRGU78crbBv4uZNWyvieSTL/GGN5ctTTT
         r7DBfd61vPAP9baxyD63C1Q4bmz3mI8IPOJ6Sdvu6HW0n5kkFwJHqvEmYt4fkKo1BUeJ
         QXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bd8XoLtOAWU+7BwGbBI3SJRXpJvzJRqxBSiZxXkbwbQ=;
        b=C8g558IyPQGRjIx+CWOMonOrABKXoPM4WDq/8OeqNktRJsQ8b/K29vluozbkNJDJ1y
         Lot3vneYubwk59zyq2TQw++KMKGp4R3UoiO/bH5ghE55Ojl1tyQmUGyjLwB4MWFQIM06
         an9Onh5b+HfPXGXRGlP9QBlITGQGNoiZKEcqbyQxJm4iAQx3GfP82tqwtU7JRw4UVpWT
         iCIjZ1fyy0yeWX0SKXixf5+YFoy7c76Pd8+fvSdDpxX7lKJ0zmLiBwwGaX0pOs5BQ1eW
         +HbHAipaOAUPEowkmh8weB+B6FrGQ0KBJShOCoQy2DK7vWhGwW/aR9zDh97QgdzQofMo
         SpkQ==
X-Gm-Message-State: APjAAAWhOzKO97VqrMY/sgJuk63e98sosWei8ONoQg1l0X2/W82Iwtq9
        poeJf+6wi24YdGT5ZPDmduauzRX/0hSJ/5YVWuDCfA==
X-Google-Smtp-Source: APXvYqx20UFE09WUbvPbKRheJe5uPUYJciAr4V5C0JTxwVk+UKhBPMsa+z9iIIb0TS7UW3n8ScMINNgWL5FoPJpJES0=
X-Received: by 2002:a2e:9903:: with SMTP id v3mr2098659lji.37.1566547133896;
 Fri, 23 Aug 2019 00:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190814123512.6017-1-vkoul@kernel.org>
In-Reply-To: <20190814123512.6017-1-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 09:58:42 +0200
Message-ID: <CACRpkdb-y4PhqH+fSeQNRHKHDKB=qDdcgR4VdnBqXJEh2YPAUw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8150 support
To:     Vinod Koul <vkoul@kernel.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 14, 2019 at 2:36 PM Vinod Koul <vkoul@kernel.org> wrote:

> Add support for the PM8150 GPIO support to the Qualcomm PMIC GPIO
> binding.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Patch applied as lightweight and uncontroversial.

Yours,
Linus Walleij

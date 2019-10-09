Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBC68D0ADB
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 11:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbfJIJT3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 05:19:29 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35611 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730252AbfJIJT2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 05:19:28 -0400
Received: by mail-lj1-f195.google.com with SMTP id m7so1743560lji.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 02:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SrtyImwGFfBXfTmX10XBxTMxRS3dOgBhxhOkYorBJio=;
        b=rWE/As9QTJSgcCHZcLIVvg+lCV/orjCblJHb8uOk437G7OsLqIwxuV8L9e50gKWo+T
         h04ygluyUx7Xx3FA+5zXCLKlttHTXUi22brCE7btt4kIFCJmECsz+qmdAQZXaVo6WIxC
         6SKqlM9+M9L1hNmpHpRdXpbqQGkRs5sugYHvH1LIVILS4DwCA2s9w5QrhBSY/nVUyuid
         a9tTWrmFKrT0uf+DXw7Cad3a6ObwMcvuODk8AL/8hPOLIjrPYLA5OuekTZpcRgUh0e/I
         7daRGk/TM/bsvDv9fHcn2OkzlGVE69der5anWpEv5QAPjICdmWtgQ7dyfb4EZBASDvvj
         8tnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SrtyImwGFfBXfTmX10XBxTMxRS3dOgBhxhOkYorBJio=;
        b=Mst6LsR9DFmEWg95E/TOAO+oezROV7ET8cTvR2PWbxqV6S9mSSpTJ4uSbrG1yX5vaO
         2PSJe5NIy5qsj+8hqA5RidbOwb55YeWqBaJlzQACI/rLl86I8amllpb0E8FEHcbAARZg
         BUhgBfUStbjhYJfX8r+Rox0ZK8aT8H8RxilO5zQgE5BFp5+jTcQC0zRzZq8r05HWI332
         JVUf4jr9VYGAXzjRVZfzI6f/ncpWfeABPnDrDmzJhgWlu7sOaL1sqSbFTp8W5Mq9XWy4
         doCDXK1UXAYzVZHL4URCGvVq5uZg7H5dha8V1aqGmhhM8+7AxYhxW2rfS6cgkWgElwTC
         wRsA==
X-Gm-Message-State: APjAAAXYVLrx7Iakk9dHZRS9CQixbYfhbcFbo2AxqlFRjCHEmHK6QV7g
        V1w0UBxafKCIMbGqkyRNouavMfhfi7rN2CPYbbXp4A==
X-Google-Smtp-Source: APXvYqz5wZWF3goR+xGn5zfKM9UilScaYCcxjmoHcFVD8Yn8v6dgsuS4bgx4jCa+w9Kdlokc7XIobBnrEKzCVCPNEuw=
X-Received: by 2002:a2e:80d1:: with SMTP id r17mr1663352ljg.118.1570612765058;
 Wed, 09 Oct 2019 02:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <1570188039-22122-1-git-send-email-kgunda@codeaurora.org>
In-Reply-To: <1570188039-22122-1-git-send-email-kgunda@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Oct 2019 11:19:13 +0200
Message-ID: <CACRpkda=ce4B1cGfQStxSjXFCR5-GjyBRMRK-mLunbR25PisTg@mail.gmail.com>
Subject: Re: [PATCH V1] dt-bindings: pinctrl: qcom-pmic-gpio: Add support for pm6150/pm6150l
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 4, 2019 at 1:20 PM Kiran Gunda <kgunda@codeaurora.org> wrote:

> Add support for the PM6150 and PM6150L GPIO support to the
> Qualcomm PMIC GPIO binding.
>
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>

Patch applied.

Yours,
Linus Walleij

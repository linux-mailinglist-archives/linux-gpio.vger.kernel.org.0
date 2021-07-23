Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B48A73D3CB4
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 17:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235633AbhGWPFM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 11:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235611AbhGWPFJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 11:05:09 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA50AC061760
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 08:45:41 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id h14so2781305lfv.7
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 08:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GvAXOXhERIFR7lj2ShQ2Stgdwb2QaVlP0niSxQOcbrQ=;
        b=mK+7226Fz687r/Nn9T07Az1MI3wnxIfZLhRcAWCLqQ4ND61PmRHYsMDTLcO9I0GR6a
         eHQ3Qz8YyEMeYYq0wzZydM1vtrJ/ZlRaUzJR7dWU2EI4RrISOFZNPwwUQZyvCE5SRz7k
         qn8oNodlZNwtp0Drmbpx4WI6kK4dPm+dVkkILCdizj5N+qatl1xqwK/pbK0vjKn4MV9n
         6LByGxEp66l4IXaISCY3TzQ8kfD/OTCYXPTu5uAYco6rDXcvjJYdQFMbziUPW8L2xipz
         dMaUIG6dSa0vPyxuzhPYHLVqeoZB7k6aoOYqueNB01LfzAi6BWnUuiXhfADf5LzlY1RG
         8pNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GvAXOXhERIFR7lj2ShQ2Stgdwb2QaVlP0niSxQOcbrQ=;
        b=sIU0Gp5KENgumQ5Nlq7TaUEXGOD7nlvsVeq1qmT8QQenPoXmBuwbSxtWNy7xXzI7eU
         cOOPLdbnUJ6tp+VdantLV6vSQQWfyjWRmNuuROhsfCkjfE41/1sRD81QFKdEgv7cMWZ2
         Z/1g1B79npZyr3zESnf2yTBCMpM9TIrR+CmXrf/vJ6cKfESm8Xd3GG1+md4EuS1a074B
         2aNIcyzk9Ej/ESnBi0/IgxA/N1thSjpAr9LUyNV6piVvRNWUX/PaXsm/mIWPDoEPQoVy
         AePXy274eh7UHVdNidcQX8cOGQUKl7hfZkOMSK7hJv5bUHM0/9RYQVz4MMGY8ErJLC7N
         YrVQ==
X-Gm-Message-State: AOAM533kj2BfIrkUe6smZkJA6BTsH+3+iL69mwbE7vPy3LKivQgUtOR8
        QuuqItzUBuoGzItlExaSZfIcIYxAzoGuXBCdImeO2w==
X-Google-Smtp-Source: ABdhPJzgYGWvpxX1KZqSptUUyR70nnvRpc5qqg3N8PkcKpCxHDL5PgGdL/kppRgpMzW27kImhprl27rgPNOXLk+hGH8=
X-Received: by 2002:ac2:4c4c:: with SMTP id o12mr3400945lfk.157.1627055140061;
 Fri, 23 Jul 2021 08:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210624191743.617073-1-konrad.dybcio@somainline.org> <20210624191743.617073-2-konrad.dybcio@somainline.org>
In-Reply-To: <20210624191743.617073-2-konrad.dybcio@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 17:45:29 +0200
Message-ID: <CACRpkdbySWhcxL_YeYr1R6Tn=3fDZCvqQFvmEULSW8dg=421fw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add MDM9607 pinctrl driver
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        Martin Botka <martin.botka@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 24, 2021 at 9:17 PM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:

> Add a pinctrl driver to allow for managing SoC pins.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied!

Yours,
Linus Walleij

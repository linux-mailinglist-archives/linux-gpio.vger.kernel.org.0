Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18E84120007
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 09:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbfLPIks (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 03:40:48 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:43653 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfLPIks (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 03:40:48 -0500
Received: by mail-vk1-f193.google.com with SMTP id h13so1379663vkn.10
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 00:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9i8NLL29zOxzbeVv9WJDSdkA/n85OdBQUr5rvukK5uU=;
        b=goGA1RWvfOpUyi458vfd6a+MRTeiYH8AA4LHoXCnfQndO7lmx0SMaqPpy7gs0obgPb
         IYga8C6Ig7W6NUigxjRVd8gi8xvdfrq2Yg9VV/cD0/mhrLB80YzFHMf5DqJrZlekghHx
         c7lK0blM2eo+c4nzNRrH9Tg/rX+ONd3P/qSNYrexf+7xL4FTs06/TDO587z5SUSIL+sk
         +0jyNnZljRzXLNlCu//uf6N6Fb7bHXXFQr5M/NypiCSONznJ3gcE7/0D/STSxXiHuujS
         QvqdB89KSQDprKxku4kv/X9zUGt24/sJUnt95m45V3reqnAvCrTOVbiYnWmMJwEKqkBq
         XSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9i8NLL29zOxzbeVv9WJDSdkA/n85OdBQUr5rvukK5uU=;
        b=HUOxHjXZMwpeuvoiPxtHgFUUT56i39DgEkt1SGqNp3kPDGmAGWN/iY5XrsGq6X9KOt
         QS9zKL0fuuN0fFlcG6+OVhdeiTWs83w8OXub4+zYWg5tJ7G4F6iXWFp8dKakCPolbK4d
         UBsA9W0vd+zDPgy3KqQe0skcNsAXcMwEMMnf71JYneQTiWLq3Yw/N6tGg58YyMjvpx5V
         f9z0ChRo0pU4u+vTZWHXNI44DYNVTAo+z28yaTM2yLVsnjWMZ6dsq5jXuWtqLacr9ofy
         7z03j82b22937oMfFerxxIgZBzt7OLX8t6m/2CA5HFejtJ+xmrwP3dpeMIc277ubMAdu
         KqQw==
X-Gm-Message-State: APjAAAV603suRozsRoSt3Ioyav9PosPvmTDg5E5khBBY93lUYnA0XSEv
        Tvk1tNxifuGqHZ5XkbWBuCqDU8zFlaorXOgq153/UnB66U0=
X-Google-Smtp-Source: APXvYqwIwOmAQikFuLGCCF1qYOpK8AdyUVEAbAZ6s0wZ/Mc/9otdS7XTcULAnkpFiXprqh2XiRdxi3ytr98rUBpzSkA=
X-Received: by 2002:a1f:7288:: with SMTP id n130mr24179450vkc.46.1576485647023;
 Mon, 16 Dec 2019 00:40:47 -0800 (PST)
MIME-Version: 1.0
References: <1576041834-23084-1-git-send-email-rnayak@codeaurora.org> <0101016ef36a9118-f2919277-effa-4cd5-adf8-bbc8016f31df-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ef36a9118-f2919277-effa-4cd5-adf8-bbc8016f31df-000000@us-west-2.amazonses.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:40:36 +0100
Message-ID: <CACRpkdYZi2tC-t8R6_V85yuSyE82ARjZzSE+NSB1_QbmjW0Rag@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sc7180: Add new qup functions
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 11, 2019 at 6:24 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> on sc7180 we have cases where multiple functions from the same
> qup instance share the same pin. This is true for qup02/04/11 and qup13.
> Add new function names to distinguish which qup function to use.
>
> The device tree files for this platform haven't landed in mainline yet,
> so there aren't any users upstream who should break with this change
> in function names, however, anyone using the devicetree files that were
> posted on the lists and using these specific function names will need
> to update their changes.
>
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Patch applied with the ACKs. Thanks!

Yours,
Linus Walleij

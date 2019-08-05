Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4BCD814C4
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 11:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbfHEJJe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 05:09:34 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35721 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfHEJJe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 05:09:34 -0400
Received: by mail-lf1-f65.google.com with SMTP id p197so57282879lfa.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 02:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=we40PSHlZcOxSoyjGnWbnysPRh2RslKgTYfYTrx4ljQ=;
        b=pNbvNUtKF/9q9ltk2TsL3NqSOiSv19d2QktmuQeuUXUC7lk8q7NT3e/mPI5qMWp5yS
         xKRloHAisfxOxleeUi9WMo/LZPyMSiAWaQR4uHPmwbllv9vi8qEzGVfs9Y65ON1ef8/M
         B6sWo+42hoSa4T016XMsu0ihzA4pK4Q2jNtgRPtKNQjyxtf7NrIsV6jPbTk1XNFLolmy
         pkS9HkIbYtlgBjvVWRde0IDfyj0NyekwW+s1xM8Wfe50LMsnwTczu7Y3PqWtDy1PT67H
         B0jfFUAEQ0/ALtZ7mTS5jR7W43SKoCnPgoO1JiU27kNeDKd0k8Gx/hZlrhXPXtG+n2zr
         JbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=we40PSHlZcOxSoyjGnWbnysPRh2RslKgTYfYTrx4ljQ=;
        b=UqdGtxQ5+pS3azPhQB+qZlmFkWpdLamsqJB5M0pwPOpmpEILU9N93ToTF2jh+xftkv
         s9Y0O7KKjSsuN0bc0Tn8Gud6kqRaGQU5G4YSYhfg3TajWwYvG/UJBixGLRTL97RfvJ3M
         ATxNx4W5/SR2zDmo/WrrY4jXtWpeT71iyfxOr2tVVmKAsDJZSZPRybwQ4YQK1eFYc8AQ
         D41EVX2w+vfSOJl8H35ANT0AJj1efpzvO5c7SdrZapjLt05S9a7HaRkflkk4fCTmkact
         SkBRN1IABdBNR9dWSAiE62+XjNHTHf+hyHBvahqMQ8n8VWnvEV9dgugV/QKHe6483e/x
         detw==
X-Gm-Message-State: APjAAAVNrgCxSnRNoNZBYSOu+xrevC5x51Pa5gTccsKAbZp5uGjJmODC
        Qo79MxfPKDBtov7pxKph7aHaLDHtEuryrNTeK+NMTk4J
X-Google-Smtp-Source: APXvYqz6lz5lL4sC3NkfmrYMnYZuD0za5lS2pQ5bSuHLV78yA7wTNHy4EMHe2DRNqzlOvex1FYZgczgR6TP9x508tKs=
X-Received: by 2002:ac2:5939:: with SMTP id v25mr1192804lfi.115.1564996172018;
 Mon, 05 Aug 2019 02:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190720115858.7015-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190720115858.7015-1-yamada.masahiro@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:09:20 +0200
Message-ID: <CACRpkdYFAKFniNOUG9Gbw-mrO=WsC8+8n1wQEgqTpVK-N0cbCg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-single: add header include guard
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 20, 2019 at 1:59 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Add a header include guard just in case.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84AAC4255A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 14:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438744AbfFLMRO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 08:17:14 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43073 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438743AbfFLMRO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 08:17:14 -0400
Received: by mail-lj1-f193.google.com with SMTP id 16so14875419ljv.10
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 05:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2txdGGqAtBgtUiiIPP10i5KT2B4f0+7u5UH9LS7ouJg=;
        b=dusx49mrCLSgU5t83nzKnjS+WluovaOxnHyWSgEcpeQJPi0w63Vjj0FYvbpHl8IZ0M
         0Eg7mJFCz8lJciydS+e8UNQaC7r8ojgw9QaIwsF5onCMIfBQpqxcaGfmtdOVvxgAS1KJ
         iZq25ceilSdWqf4legHqbrKpfWh4VKQT0VMk1AZzYWalsKzgxxO8bSpWHPJeScvgczFQ
         UG9KdibBNgx/ir54+DcjvIdzr+rJjZpD58RkUmmiAXwcrcVgH4HS2cGQGBcFg8/U+PQZ
         Sos5qV0IrsWvi+9ROxVD7rnYs9P3dEm3uBX6AprDgms9/N5jIdr73kQfNzUk9tpZsI4F
         PxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2txdGGqAtBgtUiiIPP10i5KT2B4f0+7u5UH9LS7ouJg=;
        b=BJnlwDW3YbT/NqJQZ+K9i3n9ZTKSXT3cktD02FmQV6kpmoD8bWtV9F/3l9cIR6/Iub
         lX5p6afA2FwB+guJBlKW9PF1Kn9PwYEiFz2bdUAAik3UIEw4D6RgdO8z4brZ4hUW3ML8
         7CyghXgrV0LBEj4NL2G2xJ6FA/gUH+0FnHPNFdU2+GDCAUuJzpvo+n65aN3iP790Z7by
         wKNXCl8JRG8UKBiKj2iOW5sEsBQ85kcaSyOYAD95TH0nX3V3qUqQv5ghNvH4eN9UBSmF
         9RESk0AR02tyM2T71BYCayJOt2XFBZxMNvERdcCt11K8L2j9qYHiJwpK8EuDIXqJX/Z/
         lDGw==
X-Gm-Message-State: APjAAAVvA027BrrSRodOMHcUUy3acWs1FMkBoTGehAW5yctjSVcKLI2w
        GkFkKPO6GzU8MxGzx5DeEUY0DhtK8drlE4yJIfdcdg==
X-Google-Smtp-Source: APXvYqyY0A/WfPrOeCNf6qf18ESfRNrBcrzXIRXu/sUdZWtDXsnEw4ymCliw3ZfYA/tTBPR2Wnzztl40Q8AA2XCcUE4=
X-Received: by 2002:a2e:5dc4:: with SMTP id v65mr33483063lje.138.1560341832416;
 Wed, 12 Jun 2019 05:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190611072004.2978373-1-lkundrak@v3.sk>
In-Reply-To: <20190611072004.2978373-1-lkundrak@v3.sk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 14:17:01 +0200
Message-ID: <CACRpkdb7jZ3Hw3uH_hqGRhbsoreQW17ck_QPXKxqLA8ov9ffuQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: lantiq: Switch to SPDX header
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     John Crispin <john@phrozen.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 11, 2019 at 9:20 AM Lubomir Rintel <lkundrak@v3.sk> wrote:

> The original license text had a typo ("publishhed") which would be
> likely to confuse automated licensing auditing tools. Let's just switch
> to SPDX instead of fixing the wording.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

This is already fixed upstream in Torvald's tree, see
commit 1d0ea0692ae3f909b22e99af3121bcf3142a5c5f
"treewide: Replace GPLv2 boilerplate/reference with SPDX - rule 332"

Yours,
Linus Walleij
